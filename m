Return-Path: <linux-gpio+bounces-21976-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7F9AE366C
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 09:00:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99BCB7A7579
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 06:59:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B2231DD0C7;
	Mon, 23 Jun 2025 07:00:29 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA281F3B85
	for <linux-gpio@vger.kernel.org>; Mon, 23 Jun 2025 07:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750662029; cv=none; b=ueP+/kKdQ7SbHaL90TQ3S/qMDzsYHoauzW/QWVPV4E7kchW+zqp+tm4rVG8XBykP3Q2mlHnMj1UUKPFMgLPnuoUXaP2Gu027RwBVZXdVDK6ZPcCtk122/vV9jn/4NRLUZ8+8SFswo5I9Yo/9znek+ERzlyCOzAJ11+DjZjHTG9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750662029; c=relaxed/simple;
	bh=zoGqFvTYQu5TGvKf49l6X4WkX7DKurr8Fb3EEXazdSU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BOdOpz8CL/3ksJy9G+4SakeILB6wlk2emvKG22QxyN9aAjdeHBB1CsWkPAqhC/96nOJRcZPxGXQ37VPtvuQS5eB7sfyA9YtIl4hDsqs75OVKqhsvySNXraWR8RwEknGNFkAVIN0VZ2W87smCfIThTHm9HOrM+bY9crRF25KbI5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uTb9z-0001os-My; Mon, 23 Jun 2025 09:00:07 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uTb9y-004u2X-0w;
	Mon, 23 Jun 2025 09:00:06 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uTb9y-0004eq-0g;
	Mon, 23 Jun 2025 09:00:06 +0200
Message-ID: <d42dda52f92b327fd9a051a892c212643f5ab75a.camel@pengutronix.de>
Subject: Re: [PATCH v1 2/2] ASoC: codecs: wsa883x: Handle shared reset GPIO
 for WSA883x speakers
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, Srinivas
 Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Linus
 Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, quic_pkumpatl@quicinc.com,
 kernel@oss.qualcomm.com
Date: Mon, 23 Jun 2025 09:00:06 +0200
In-Reply-To: <20250620103012.360794-3-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250620103012.360794-1-mohammad.rafi.shaik@oss.qualcomm.com>
	 <20250620103012.360794-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org

On Fr, 2025-06-20 at 16:00 +0530, Mohammad Rafi Shaik wrote:
> On some Qualcomm platforms, such as QCS6490-RB3Gen2 and QCM6490-IDP,
> multiple WSA8830/WSA8835 speakers share a common reset (shutdown) GPIO.
> To handle such cases, use the reset controller framework along with the
> "reset-gpio" driver.
>=20
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  sound/soc/codecs/wsa883x.c | 57 ++++++++++++++++++++++++++++++++------
>  1 file changed, 48 insertions(+), 9 deletions(-)
>=20
> diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
> index 13c9d4a6f015..b82b925c1f8d 100644
> --- a/sound/soc/codecs/wsa883x.c
> +++ b/sound/soc/codecs/wsa883x.c
[...]
> @@ -1547,6 +1549,44 @@ static const struct hwmon_chip_info wsa883x_hwmon_=
chip_info =3D {
>  	.info	=3D wsa883x_hwmon_info,
>  };
> =20
> +static void wsa883x_reset_powerdown(void *data)
> +{
> +	struct wsa883x_priv *wsa883x =3D data;
> +
> +	if (wsa883x->sd_reset)
> +		reset_control_assert(wsa883x->sd_reset);
> +	else
> +		gpiod_direction_output(wsa883x->sd_n, 1);
> +}
> +
> +static void wsa883x_reset_deassert(struct wsa883x_priv *wsa883x)
> +{
> +	if (wsa883x->sd_reset)
> +		reset_control_deassert(wsa883x->sd_reset);
> +	else
> +		gpiod_direction_output(wsa883x->sd_n, 0);
> +}
> +
> +static int wsa883x_get_reset(struct device *dev, struct wsa883x_priv *ws=
a883x)
> +{
> +	wsa883x->sd_reset =3D devm_reset_control_get_optional_shared(dev, NULL)=
;

Since this driver only deasserts/asserts on probe/remove, you could use
devm_reset_control_get_optional_shared_deasserted() and let the
framework code handle the (de)assertion of sd_reset.

I wonder if the codec could also be put into reset during (runtime)
suspend.

regards
Philipp

