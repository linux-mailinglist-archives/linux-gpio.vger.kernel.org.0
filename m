Return-Path: <linux-gpio+bounces-22834-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A285AFAAC8
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 07:12:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0CC91793C9
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 05:12:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DC0C262FD3;
	Mon,  7 Jul 2025 05:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="DNT/jjJp";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="WSVX+csF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0181B442C;
	Mon,  7 Jul 2025 05:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751865172; cv=none; b=ne0YEO9b3GjUogwjQSzGiWynLMsmRUWRU1Ml4kxI0ehqxXH1z67YlAGVW6uraspRXSO/eyIJJTy56A7ATUYXIs2w3DBL5lWgloG67cDAgRzhOsBHCUPaWy7ZWC2sJfIIpRXE1PDdKPn0ZPvRUGIqP5WaNjYRzU8KQGVdV2b8pJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751865172; c=relaxed/simple;
	bh=brjNfnegOGAX0qXp7j2ojb4YstGXgVTSohtW8jpSOrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=azyXtb3zn2jTscndqyXb6cVxeCCHft/N1hif6/WHaxcx36EgaG/SP3JQYWuNuZlPndsDacyJgtlnwoUQFC8PnNYmpHw59j3sffNYjIHeJ7PFnWfuTD7UNcYhu4xHG24RxngBzvz0TgWiGm4V0EdYRWvf5SlDtozdNJNc4pGBUnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=DNT/jjJp; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=WSVX+csF reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751865169; x=1783401169;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3qmvtsFXy8GXUm5ySVjZhDV2Qyo3x2/7ps/KKt+4zLU=;
  b=DNT/jjJpFQPxu9zSG2GqxKiT/0bRFzSGeb0nYlwgU61fZwdj8Vptg+yO
   HnRHeN7vsMziKe+03fUHLnPITyyVelMiJ4lkvCf5yHC4dxVY6h0+FjAOM
   /Gj3hNalgNpC+A7nIPZg79S2N5fyt2vEhy673ps8Kb5L7KEuh4Nertujm
   o0WVTA3mL7JTgS5GzQCmADv61qu0ik1bddoAkyPH286zJEVsuu+Z0ClK6
   NglALXb9xc1NpOrVcc1/4SwSU4Sd7pDNGqgN3UyI6yXXrv4zAykPVgHKg
   PB8q8nXsnGrLI8QKGtdnY33Gdmn7r4ACIQRdfSHK0iESLxeerKAFCRpb5
   Q==;
X-CSE-ConnectionGUID: 1uP/5fIuSu+29hjxQ59HvA==
X-CSE-MsgGUID: ZDoxFLSfSHi+K+Vai2haVA==
X-IronPort-AV: E=Sophos;i="6.16,293,1744063200"; 
   d="scan'208";a="45049662"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Jul 2025 07:12:46 +0200
X-CheckPoint: {686B574E-10-BB1FFBB0-EB2CC75E}
X-MAIL-CPID: 81232A621B7B84834251B541EF21C99E_2
X-Control-Analysis: str=0001.0A006377.686B575D.0009,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 69C4F164002;
	Mon,  7 Jul 2025 07:12:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751865162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3qmvtsFXy8GXUm5ySVjZhDV2Qyo3x2/7ps/KKt+4zLU=;
	b=WSVX+csFu3ge71/40KRMwOXMzV4Hx5FTCveZ1j2VTPfcOcUKLuBTCZ7yD5gIY2PtXEY5vy
	7aU91A/hf9GAk+aShMUewnQNvUjfFjzyyJ+ebm3EwhobkEwLY7rRPPGvdXTWW1am6CzbuJ
	ROdkdEzYr865OAOUwgat4FtqvS7oS7UJHf5TN7AbpfI41G159Oi4DDaHrylC0nCNWPaRxf
	0Nl6QPnL/QohyM4KxCzp3OJkag+GkHfja2mI8B8rrz+gl5bXmprTjCfI3wnhUvn67a4eAc
	1zIvwwBP6ooRVxK9al9dPOCk4o1CuG6OTKRbmg3bHGESdONwQCePHh7nfdO7Iw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Peng Fan <peng.fan@nxp.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
 Markus Niebel <Markus.Niebel@ew.tq-group.com>
Subject: Re: [PATCH 1/2] ASoC: codec: tlv320aic32x4: Drop aic32x4_pdata usage
Date: Mon, 07 Jul 2025 07:12:40 +0200
Message-ID: <5000946.GXAFRqVoOG@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250706-asoc-gpio-1-v1-1-f0912095e923@nxp.com>
References:
 <20250706-asoc-gpio-1-v1-0-f0912095e923@nxp.com>
 <20250706-asoc-gpio-1-v1-1-f0912095e923@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi,

Am Sonntag, 6. Juli 2025, 03:04:23 CEST schrieb Peng Fan:
> There is no machine is using aic32x4_pdata as platform_data, so
> remove the dead code.
>=20
> Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  include/sound/tlv320aic32x4.h    | 9 ---------
>  sound/soc/codecs/tlv320aic32x4.c | 9 +--------
>  2 files changed, 1 insertion(+), 17 deletions(-)
>=20
> diff --git a/include/sound/tlv320aic32x4.h b/include/sound/tlv320aic32x4.h
> index 0abf74d7edbd69484c45ad6a1c39b3f67d61bd63..b779d671a99576deadc6e647e=
dff9b1b3a5d33c2 100644
> --- a/include/sound/tlv320aic32x4.h
> +++ b/include/sound/tlv320aic32x4.h
> @@ -40,13 +40,4 @@
>  struct aic32x4_setup_data {
>  	unsigned int gpio_func[5];
>  };
> -
> -struct aic32x4_pdata {
> -	struct aic32x4_setup_data *setup;
> -	u32 power_cfg;
> -	u32 micpga_routing;
> -	bool swapdacs;
> -	int rstn_gpio;
> -};
> -
>  #endif
> diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320ai=
c32x4.c
> index 54ea4bc58c276d9ab39a15d312287dfb300dbab9..7dbcf7f7130b04a27f58f20be=
b83eb3676c79c3d 100644
> --- a/sound/soc/codecs/tlv320aic32x4.c
> +++ b/sound/soc/codecs/tlv320aic32x4.c
> @@ -1346,7 +1346,6 @@ int aic32x4_probe(struct device *dev, struct regmap=
 *regmap,
>  		  enum aic32x4_type type)
>  {
>  	struct aic32x4_priv *aic32x4;
> -	struct aic32x4_pdata *pdata =3D dev->platform_data;
>  	struct device_node *np =3D dev->of_node;
>  	int ret;
> =20
> @@ -1363,13 +1362,7 @@ int aic32x4_probe(struct device *dev, struct regma=
p *regmap,
> =20
>  	dev_set_drvdata(dev, aic32x4);
> =20
> -	if (pdata) {
> -		aic32x4->power_cfg =3D pdata->power_cfg;
> -		aic32x4->swapdacs =3D pdata->swapdacs;
> -		aic32x4->micpga_routing =3D pdata->micpga_routing;
> -		aic32x4->rstn_gpio =3D pdata->rstn_gpio;
> -		aic32x4->mclk_name =3D "mclk";
> -	} else if (np) {
> +	if (np) {
>  		ret =3D aic32x4_parse_dt(aic32x4, np);
>  		if (ret) {
>  			dev_err(dev, "Failed to parse DT node\n");
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



