Return-Path: <linux-gpio+bounces-8580-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 988BA94780F
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2024 11:13:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 423751F2295D
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2024 09:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77A42152E02;
	Mon,  5 Aug 2024 09:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="OPXLq4Jn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1E71514C8;
	Mon,  5 Aug 2024 09:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722849200; cv=none; b=Aed/Li4BF0U9Q09eITA42aYJBAICXqZXKZEatjpwC4DpIPMx1MDzPIOnOExgIORFhMWOzBi56j2YhJaedHG9F+9o5XX6pzbNa91NjxpAik0LiC20C+qnTXufxEkU1dls1Ffv4kRqcvsdtTo+GippSVpNYBEtxn4Q/aY5Fzu2pS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722849200; c=relaxed/simple;
	bh=UcMzg51+matqOuifYSWLahL5cdCUpF9vfQL1G8XLcB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lM5kG4RN+SpWT5nO39+8+jfiT+Lcmr00Xt8bG/IKM5Smp2XRPxcdiNiyAIO8g3Ly72iuCeZDUVQTKfzmLnUSPuZ96fi7PsJ+txi6+57a4e0e6Z1IE+69YzlWAwT/+8TIhnLXLRRXM1wxC1qJ0rgAXMnP9Q9nDMNTGvZYNfy9vEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=OPXLq4Jn; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1722849182; x=1723453982; i=wahrenst@gmx.net;
	bh=Yu3nBVr6ht28jw6sXEI3AZI/ifNYBhNRcimMlOE9f14=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=OPXLq4JnLxYTFGZlMD9QCxuvUzqNHkjNkCYgYYZnmNVMY7f/dW6Y0QL4Vj/EYH9C
	 CcI1h4W8EntMV+F0i1tIgpkEJE+ytHt6/lrCGEYekgNNWHzMoswm6mM26a62tJ3xI
	 kZ87hWBaJsN/lQpSbrxe69ybpm3+NydWeXnLzIOQ7+iWX4zzXs2p4BDu4z8gJ9Ar+
	 URUaQ8AMHaeQ74BcV6VJx8ZFTZ76gWq9RAd/6Gu8aqrY8kYaj69zc/b3h0q/yJzTr
	 ihw8WikGHhp1avPW1wm+UHWEBIzTqjT2l00VySAGQNYC19OnMUIZxaDboSV3XaMMA
	 Qoa7XDEnN7+dMpy4Fg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M42jQ-1satm21lHk-00ELPa; Mon, 05
 Aug 2024 11:13:02 +0200
Message-ID: <27e92e0d-f60c-41a9-9bc9-1744b51907e2@gmx.net>
Date: Mon, 5 Aug 2024 11:13:01 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] pinctrl: bcm: Add STB family pin controller driver
To: "Ivan T. Ivanov" <iivanov@suse.de>, linus.walleij@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org
Cc: conor+dt@kernel.org, florian.fainelli@broadcom.com,
 andrea.porta@suse.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jonathan Bell <jonathan@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>
References: <20240731062814.215833-1-iivanov@suse.de>
 <20240731062814.215833-3-iivanov@suse.de>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240731062814.215833-3-iivanov@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:shasVZKuxf6b8QqXhBJqNOtOkmEH2iuMLNA+qqqRHMBjH0ACjqJ
 lMp/UjkEfD0/fCRJKh1530lqYWKlSGEEo2SQBG6BZ7FX0cvOUJVnV7PoG+UioTdslkDOKVv
 puupSd3bkDU0E0PpsOB2ctQyLDPV4PrbzDlTwM5V+28pXFFpvSh9fcgcPEPBHkUE8FJqfk5
 WB4fQwxcZlTUAz9gDdFvQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HRPdquEAGi8=;UJu5XGbX13RhRvPWjmCujAU5+zD
 pgkepzrsbWHv+8MiyhwOmJzltqVNCxFbxsnQg/W0WpuPt8QEY6uhllPTIyE3c4j70BXpkK95L
 vOKEGmJyQ9KvvCv1+7KLDFdIFTCZaWssR20uu/h26qNHr330l7Iiyyva2RLDg0uqNj9KCQvpj
 gzCX9Dx09AuCQmLWoZBPD2IgXgses25FBlXtoyTy56rWqD3Aan4ufLAyaLRm3oUQxyZpC8LDW
 MGKYAuvJRg/JDCMVtb3nhfKg0cxe5+h4/8GwRTKd+oTcMIqUNxLcU25QpUJmPAul1ZIAgEc2b
 zPfy0l9LApS38+3mrP5P18VCm/uK1PLzdsAlBGmevk59mmr0yhFes+Z/Vl5TbaghvOgnbuctA
 LBmaeMDvXFUBIzSE5d5ASaAi6OOCbiSuYd/lIoqGCr0VpXzL9phYA8UH7oMMhiKI52CYH8VyK
 T5NbRobLnSr73Igz1xjiJ+RVgNS+6fKxTVhIo6us+YJ89HNu6kFwZAsnZg8IEHLzJzj+3s9Oc
 16nrkQ0GvGzRiWzAqE7adksQvew3lGJwKRAouJ6vw0X+6+YODI/eJ5j0zsG1Ko/GIHLv6pz/S
 8qt/izq8Vc6cw1AoZUkhWzPiaGT1AbeJkxYQucpVYQOUH6V/BSgt89fYrXcHhzJuHP6l72fdF
 p5sTy9eCLPzu5liVlIFCb5vgItx7g27/+oBDJxx2rINBOZ8uzq4JN8pODhF0qh4wB4z+Idjr/
 REt6Vm6G/uEMlF1aTd4CsKMY5TzHXF10w6mnRl1ldx4+WZj4NDXhIbNpaQF8jMRJn9J/q39G+
 5/4zlAgzPJZfg4aUvUr3VDTA==

Hi Ivan,

Am 31.07.24 um 08:28 schrieb Ivan T. Ivanov:
> This driver provide pin muxing and configuration functionality
> for BCM2712 SoC used by RPi5. According to [1] this chips is
> incarnation of chip used in Broadcom STB  product line.
>
> [1] https://lore.kernel.org/lkml/f6601f73-cb22-4ba3-88c5-241be8421fc3@br=
oadcom.com/
>
> Cc: Jonathan Bell <jonathan@raspberrypi.com>
> Cc: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> ---
>   drivers/pinctrl/bcm/Kconfig           |   13 +
>   drivers/pinctrl/bcm/Makefile          |    1 +
>   drivers/pinctrl/bcm/pinctrl-brcmstb.c | 1217 +++++++++++++++++++++++++
>   3 files changed, 1231 insertions(+)
>   create mode 100644 drivers/pinctrl/bcm/pinctrl-brcmstb.c
>
> diff --git a/drivers/pinctrl/bcm/Kconfig b/drivers/pinctrl/bcm/Kconfig
> index 35b51ce4298e..2e1b8d444f58 100644
> --- a/drivers/pinctrl/bcm/Kconfig
> +++ b/drivers/pinctrl/bcm/Kconfig
> @@ -3,6 +3,19 @@
>   # Broadcom pinctrl drivers
>   #
>
> +config PINCTRL_BRCMSTB
> +	tristate "Broadcom STB product line pin controller driver"
> +	depends on OF && (ARCH_BRCMSTB || COMPILE_TEST)
> +	select PINMUX
> +	select PINCONF
> +	select GENERIC_PINCONF
> +	help
> +	  This driver provide pin muxing and configuration functionality
> +	  for Broadcom STB product line chipsets. BCM2712 SoC is one of these
> +	  chipsets.
> +
> +	  If M is selected the module will be called pinctrl-brcmstb.
> +
>
this driver should be enabled in arm64/defconfig at the end of the patch
series.

Thanks

