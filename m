Return-Path: <linux-gpio+bounces-8200-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7DB92FFF1
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jul 2024 19:45:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE898284B20
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jul 2024 17:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BC81176231;
	Fri, 12 Jul 2024 17:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.b="GOKiCDZa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02332747D;
	Fri, 12 Jul 2024 17:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720806334; cv=none; b=fWZNT8MxR3uQ76T233zQlG78AAdZRBjMkIBmVwYHXVC7i4PArKMpITuEBcSM7xG5tjkAqp6UR9Ot3dcc+siiICIiVOmGwf5iKamgbehQY6SOa0qZL08YAfiM81fmuHCePcoB7K3Xq8McP69CQ7b96XH2J4SXHiRBMlrf4iRjjzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720806334; c=relaxed/simple;
	bh=TeCewhItFSnag4sc4XNBJtcr219/o5hveH/NrYbp2KA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GU4sqPF5YRJSlltrzbeNQ90fwQCmCUjgCgqfSN8uSxGoMC3d+X5W6lI2LXx/mgId7KhRYa0EKY1zipiUAgOaDzHcNtWRULp0oaWqhX0pEdhWM60uwZGWWH3cgn0uChUcnI/bCsD4yQOuKL1r7G0PcouyzIUMbA9pIP6tb010ys8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.b=GOKiCDZa; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1720806324; x=1721411124; i=j.neuschaefer@gmx.net;
	bh=tPGCKNuxFDqyixISCoMhBEbanP1o4lTHf1B7ly5Vmm4=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=GOKiCDZaHuwtds/+rhAT+fe48IarcS06cg51eJUc1q9BWpgk5YPcGWjKb2eaQa0n
	 3sxv6m5FFethmaR6RPjXZO14Fz0KmYzCI64tp8+/oUNISMd+1NpXUas9fjTrZtKCG
	 lsZN7wFKaH/9xJsQGyBt6GiqQbxXwXlaM5wb09MYdVN8P125O1VxBNM7x6Hys47xi
	 BHCiqoXZQs+q7gakNJ5NngLOBHBFaR09lhbLgSjeIsqoa3ruKxxa9SyAB+Tn9jpV0
	 vmIf8l8ajWzMJSYL8D5UxihpHcmKUGd/UFdEuZ1NS2F6AxjP7c5tLanKe2r8X6SgA
	 GNXCD13Eg8SY0j2iAw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([81.173.233.81]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MWRVh-1sqhdH2AUV-00Owur; Fri, 12
 Jul 2024 19:45:24 +0200
Date: Fri, 12 Jul 2024 19:45:22 +0200
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: linus.walleij@linaro.org, avifishman70@gmail.com, tali.perry1@gmail.com,
	joel@jms.id.au, venture@google.com, yuenn@google.com,
	benjaminfair@google.com, linux-gpio@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 4/7] pinctrl: nuvoton: npcm8xx: remove unused smb4den
 pin, group, function
Message-ID: <ZpFrslx57m62SEsg@probook>
References: <20240711193749.2397471-1-tmaimon77@gmail.com>
 <20240711193749.2397471-5-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240711193749.2397471-5-tmaimon77@gmail.com>
X-Provags-ID: V03:K1:vwEDLW8CSrIZ9k/KspWiiHdEKMe0tlSqJnPaFjO1HpgkyyZisA+
 FW10ALY01vhA571jR+f7pcE3HqDn/TcShquGb2eYXB2ilfy2ork0NJQwrWEloTsagXMEaAi
 uemv089G25izhe02KuYo4fW7T3FKMt9bX+5vyR56H1Dutx1OSQq6AaDi9GFJakRBSrca2R1
 EofrnSKdpdSnFU08CtzdQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:w4IxSsobjkg=;kH0ARQQHdmtmdsC/ZqbYSHC9sI2
 Ez7XilIu+IJWpFNCihYSLHBSpNoQ6DJsuWJJbYnF6m4P71gR+MMHPP/gTd5l9nDBa2g2NrXQa
 ukZZKZh5CQ90xsKSxiIOSKfU0253tBRMpXxO1qjqHmHZSxD6d9F561B5w115Be9GUSn9C2q2d
 ipMvLJOqb6py3nIRjpu+xp+URd20aegqGZsX7CrVcthWnLCbStDZA+boxC9V4oi5w9KabQsUu
 EmtMnrwxpUkirGKGVACM6gFfAywGCFmbSoV7ZI0+CyL1loyqwHm4TKUcB/VgeFthxFZ+A4stJ
 2G90FnSU8lbkACQCJb5k78ICk+DCxcSh6vezqGc8gKDQL4UwonkYkxRSjIpLsyOCQ6XtpJr7B
 So4xWvQOZPvxrGwvotXRDJJ4FPy28etd4AcEWmzWb+MmkP37qpXzX0HP55/OyWHPdfGOLonz/
 SEBZbMdtuicmg6hPqzm6yASWCh6volPTfBTS1vnOA903CZ0HbNIyXJKrG4tiQ+V4o9s9aEsGh
 MjMoZ6+E4btgmSS1Dvrfgy6DqbPfej/RR6b/vKhohbcYmkBeu7as4QghosKMMvlRINFsMGvlw
 2NmaBECl5asEw6wTa1AHb+FEhCalRUiXsTicVDDx/6Dwzq19PWf3nY03/uTjKMDeQLg7br1R3
 WVozDLVrDeGQIp7uOUR7OZSjWEUU0XvSUmuVtoBf7Kbh9b9HlMN02SwfuZj2OIFkoO0q8kbGA
 SdBUicrrIhz0cmLgvcj2SccUGDj6m8Qo4UGNdihPWFUXz3X9xSAxH/KAluVuHE4RHu9wiPS6n
 h7jfkm7csE97N1mOMDLck0ug==
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 11, 2024 at 10:37:46PM +0300, Tomer Maimon wrote:
> Remove unused smb4den pin, group and function on the Nuvoton NPCM8XX BMC
> SoC.

Does "unused" mean that they are just unused in current board designs,
or does the hardware functionality actually not exist?

Best regards, J

>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl=
/nuvoton/pinctrl-npcm8xx.c
> index f342aec3f6ca..396bd07e7c74 100644
> --- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
> +++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
> @@ -438,7 +438,6 @@ static const int smb4_pins[]  =3D { 28, 29 };
>  static const int smb4b_pins[] =3D { 18, 19 };
>  static const int smb4c_pins[] =3D { 20, 21 };
>  static const int smb4d_pins[] =3D { 22, 23 };
> -static const int smb4den_pins[] =3D { 17 };
>  static const int smb5_pins[]  =3D { 26, 27 };
>  static const int smb5b_pins[] =3D { 13, 12 };
>  static const int smb5c_pins[] =3D { 15, 14 };
> @@ -700,7 +699,6 @@ struct npcm8xx_pingroup {
>  	NPCM8XX_GRP(smb4b), \
>  	NPCM8XX_GRP(smb4c), \
>  	NPCM8XX_GRP(smb4d), \
> -	NPCM8XX_GRP(smb4den), \
>  	NPCM8XX_GRP(smb5), \
>  	NPCM8XX_GRP(smb5b), \
>  	NPCM8XX_GRP(smb5c), \
> @@ -949,7 +947,6 @@ NPCM8XX_SFUNC(smb4);
>  NPCM8XX_SFUNC(smb4b);
>  NPCM8XX_SFUNC(smb4c);
>  NPCM8XX_SFUNC(smb4d);
> -NPCM8XX_SFUNC(smb4den);
>  NPCM8XX_SFUNC(smb5);
>  NPCM8XX_SFUNC(smb5b);
>  NPCM8XX_SFUNC(smb5c);
> @@ -1173,7 +1170,6 @@ static struct npcm8xx_func npcm8xx_funcs[] =3D {
>  	NPCM8XX_MKFUNC(smb4b),
>  	NPCM8XX_MKFUNC(smb4c),
>  	NPCM8XX_MKFUNC(smb4d),
> -	NPCM8XX_MKFUNC(smb4den),
>  	NPCM8XX_MKFUNC(smb5),
>  	NPCM8XX_MKFUNC(smb5b),
>  	NPCM8XX_MKFUNC(smb5c),
> @@ -1348,7 +1344,7 @@ static const struct npcm8xx_pincfg pincfg[] =3D {
>  	NPCM8XX_PINCFG(14,	gspi, MFSEL1, 24,	smb5c, I2CSEGSEL, 20,	none, NONE,=
 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
>  	NPCM8XX_PINCFG(15,	gspi, MFSEL1, 24,	smb5c, I2CSEGSEL, 20,	none, NONE,=
 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
>  	NPCM8XX_PINCFG(16,	lkgpo0, FLOCKR1, 0,	smb7b, I2CSEGSEL, 27,	tp_gpio2b=
, MFSEL7, 10,	none, NONE, 0,		none, NONE, 0,		SLEW),
> -	NPCM8XX_PINCFG(17,	pspi, MFSEL3, 13,	cp1gpio5, MFSEL6, 7,	smb4den, I2C=
SEGSEL, 23,	none, NONE, 0,		none, NONE, 0,		SLEW),
> +	NPCM8XX_PINCFG(17,	pspi, MFSEL3, 13,	cp1gpio5, MFSEL6, 7,	none, NONE, =
0,		none, NONE, 0,		none, NONE, 0,		SLEW),
>  	NPCM8XX_PINCFG(18,	pspi, MFSEL3, 13,	smb4b, I2CSEGSEL, 14,	none, NONE,=
 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
>  	NPCM8XX_PINCFG(19,	pspi, MFSEL3, 13,	smb4b, I2CSEGSEL, 14,	none, NONE,=
 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
>  	NPCM8XX_PINCFG(20,	hgpio0,	MFSEL2, 24,	smb15, MFSEL3, 8,	smb4c, I2CSEG=
SEL, 15,	none, NONE, 0,		none, NONE, 0,		SLEW),
> --
> 2.34.1
>

