Return-Path: <linux-gpio+bounces-13420-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A19F9E0744
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 16:40:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE8C4283F2A
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 15:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D7E5209F4C;
	Mon,  2 Dec 2024 15:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="D169VzNP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0D4208978;
	Mon,  2 Dec 2024 15:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733154039; cv=none; b=D80CXp1CfmSt8EqMkfok9S9TlVXligzaQsmTH72p7QBBTiYdKKuqDAkc5id+uKgO5WIQJYfI8nHwpegLN9QFOkO2vMPtFCs+Ov/TSwgWTu1z5HKTknRps1YdAAt2sy9lPGuF0XlS4Np7PuSd54dXTAlCG4VM/DJNPjKFwGeQGqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733154039; c=relaxed/simple;
	bh=YBy3s9fNCR8iPUJjr2BKvztJ9a50NhpU8H/uASU98Ho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uZpuWUsbK1T89Qt3wfigOGdLU8hib+MB2AC1h2Y9BBNGHl3PYhHj8KhK7nOIexfZTDKOX3cXcpZcmSNzUHU+hKuh5emsHu4RRO/Ocajib8rkAivMFyUA4Hc9r9Bqp/bcAyWtgt8CnJwVuEwTOJDObcLoAKXxOs/XKahCiO9vOEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=D169VzNP; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1733154008; x=1733758808; i=wahrenst@gmx.net;
	bh=ie04BQKrraW4QBO6vajJjoLi/zc/N6fbE/aXMCjogQI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=D169VzNPq7SZOZg+lDoCe8Qf9x4Ncfat6lSA8IyAbuNBnfUL/Q9MDGWnJUJCA0DW
	 dLNnlNOjomMt4+Q6od04JHoYRtsywJQIu7SBcLHR2m31KbjMmE9kmITXY4H+6TMc0
	 fx1vgPrZAZK6y0ZyocL24gTmDW53yv/yWXxVIX9vKqvGfGOR7jA4YON64tNOksEop
	 +UQgz2Tg7rRUvWxOCrnd87YkIm2cfRgR/NZNAXsiP7XiwyEMyQXepO8xk+lII0oyb
	 EbJaEEM+lJrfIhHaB/tspcParFHb/+W+79JIQSf37b4GbdiN+6SKoJQPDCHkeCmtH
	 0frRuODZCyztIYRkFQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([37.4.251.153]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M8ykg-1tLy0s1Jig-005GpS; Mon, 02
 Dec 2024 16:40:08 +0100
Message-ID: <b80097a1-4c8b-43f1-920f-b31489619111@gmx.net>
Date: Mon, 2 Dec 2024 16:40:04 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm: dts: broadcom: Add interrupt-controller flag for
 intc on BCM2711
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Doug Berger <opendmb@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 linux-gpio@vger.kernel.org
References: <20241202-dt-bcm2712-fixes-v1-0-fac67cc2f98a@raspberrypi.com>
 <20241202-dt-bcm2712-fixes-v1-6-fac67cc2f98a@raspberrypi.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20241202-dt-bcm2712-fixes-v1-6-fac67cc2f98a@raspberrypi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ua8NGna7H1m0vTQYmzbtvKSsnWt7yxjKDiRlZ6y6icjnDgqA/Rw
 /0PsbSmLeFBFOxkLDl9tr9eOyUv8wyP+8jY6Pp8QjoFFW8CIWEZpR+8ViC//uhoPH/8/0BG
 KRCx039CoaP1f1Vshra/aY7f3pxy5O6QWuXNpROz5+0avGCJ/KP9rqlPSQ6Zc9o9Truei2B
 dJa4Xg0fqCw+MNTU/dPVg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vuiMuJHOccw=;E9PY0fNnCVNiEPWlmRO41i52zgF
 rFS2qSJ+pK5e633kWJlXJlpMb39Y2KmLH5x0LfVzs+RS7FvzHzMVYSorFuF9szTvf6LuzVoj+
 4gpR04bpsPfPXVqXMxsQSZWNY1JNV0d2qc4qMoyZ7l5RQpjD0oeemojGh8OOZ0xpyY1w0DT/T
 EouR1ODjvHLmYQKSNAfYXayUSVXFXp5WbLgcRQFnHDOIeiARhDGbahlxLc1UXBmCJeUNb9rvb
 tVg+MLbdtp8fw4q951b7aW/Q3CbnTUZIHUO0ogQWrg8ObpeTnTsLGAQRsppMJSHR2LF+z53tT
 hsCDz4jICvqTwuHMAsz6uw3yEgTjY0dbWSUoGpFTK+9YOu8HdprHYdomGc0MRz4DtFu9WeCyt
 lZYonEKUFDCCMn9QqDos2j9J7SEKytpy5Q/DHqbGCc/Mtx2v8ZY/RTAlxtLot0GYqimaeweiP
 a5YkzNRhquVIKZgKoxrU38AcKvjcnNHCtyBCaVqqKAgGmE0mDrdjsRliHxxWH1xG3B7LvlZCs
 VtpDBUghMkk9INyS4yXEdPuHQuAv2qzxLD3ilDXwJhFIDJE/2iZrJtwVrqNYDnfM6x8IgcRQF
 glqGd80UnGdT0nQmef1FzwedB364zKgdcrGKeAgm7bkI6ElhzSES/IMdMwH0KtCh+c5a1E6mC
 qdrREvnsecRJxZ4xqA9CK2mOouV0y1bKIq2HfRptRNngv4T3CQlUDllDTAYaai6573bB0v47H
 y2XoYu39+Rx/zvuvC+9vbmcAY0XtNEv7+wA4ApG/Nd18TDDDZEN7zqvMzxPdDHq7vFBznnrD/
 89LN0H6qo38sQlJYGgG8Zy0E1NZO0CdlwmN2y1eMSJJruq+HTUUkkBDNzaz0VpPXlQJzLB0x1
 d5n95BQeSzxCzDNLMAkJZAkM8NxuvmGDTKqT82DMsFbsYouaulpG9JW/rrTM4O41t51zUZoJ1
 pnRDLI8wanLLFCnsgleMvJHJ655BpE8SYPv2OPfswSUZWsTrZXJhTfS7YqSAI4Qf8wrVVjsEu
 W5S1irsSQqfpipXhthvT/VdfrjIKCdkUUA8JB/lCrGEtFACr40tRhajeQcxV4FujgbZgVsuAr
 VHWXetzRWXT4gpU2KKzZOM2iBLyr9b

Hi Dave,

Am 02.12.24 um 15:31 schrieb Dave Stevenson:
> BCM2711 DT was producing dtbinding validation errors of
>
> interrupt-controller@40000000: 'interrupt-controller' is a required
> property
> interrupt-controller@40000000: '#interrupt-cells' is a required property
>
> Fix them by adding the required flags.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Did you actually test these changes, because the last time [1] it broke
the boot of RPi 4 and likely for RPi 5, too?

Best regards

[1] -
https://lore.kernel.org/linux-arm-kernel/07154679-42bc-43ba-8b72-62083ed78=
a4d@gmx.net/
> ---
>   arch/arm/boot/dts/broadcom/bcm2711.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/boot/dts/broadcom/bcm2711.dtsi b/arch/arm/boot/dts=
/broadcom/bcm2711.dtsi
> index e4e42af21ef3..313b1046d74f 100644
> --- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
> +++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
> @@ -51,6 +51,8 @@ soc {
>   		local_intc: interrupt-controller@40000000 {
>   			compatible =3D "brcm,bcm2836-l1-intc";
>   			reg =3D <0x40000000 0x100>;
> +			interrupt-controller;
> +			#interrupt-cells =3D <2>;
>   		};
>
>   		gicv2: interrupt-controller@40041000 {
>


