Return-Path: <linux-gpio+bounces-13421-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5CD9E0999
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 18:15:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EAB28B31213
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 15:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDE8941A8E;
	Mon,  2 Dec 2024 15:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="MRPqzPUx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85488BA53;
	Mon,  2 Dec 2024 15:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733154385; cv=none; b=lEZGGoUpPOrb7//IZrQZ6vy2/OXHS8KLg77gnz5Fhd+e7/qOO89vpwXfGRtwZa8ZerKW/qC1IWx1oJJUnrs/lih5JPQJpxsIcBZMVbYLnW/TTKrQnh7raErKUmFEkp31puXItzFmpjF3M/GBt7hasvg0P2xVa2/BM6HG4deGs6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733154385; c=relaxed/simple;
	bh=j8bJcPAyXhajr6+nVYtUv3fihyXlaCItR0utCTFJF5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sCYpg4hTfrL7L+KLJiHpLTls99JpNVH/hCcYN1x1xsqR1UKmLnPTTBFcqVtzs1dTp2tTiefk4hklg/RGTwOxTEPcdvSpuoq/DkZBTbifspZgt9gXB5gWf8qJ1ruifiT7KjX48RLTgEOi3h1q1s209U/Qpx9YbWmPSbul7hz9N0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=MRPqzPUx; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1733154355; x=1733759155; i=wahrenst@gmx.net;
	bh=S6AbZeNaZ6bTE249nttA7aUaHmMUAtPIQUa4jnYv9dg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=MRPqzPUxvHdhDzn6BrdRf9grvVpT8loh0TtvRFigS/N98YMO1eGNg2fMgFa1dSMq
	 A6rbPAVQpkNh4opLucf/B62DtGd/jC7ZcbLP+KbiKZskMu2fA6wCez3Uw36yldNU6
	 xqw432FV8UqXo21pJtc6yzUJYboQdW2gLJmFMOdTQ0GPqua7Bx6HAubqoWlA0Vrdl
	 g4O/yXL5s/2BjEKL4dWmN+/2kyxxx+PH0S17cHZb2N48A3SZHfiNfmP1houYEQuEP
	 yLo3hILr2K31IMW/wWJ6IRqSjJkbR51Z2IPUj5XS0qVbvRTUV3Ro2uwUWecOnMRR7
	 e4CU2AzcVntMm0yiZA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([37.4.251.153]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MJVHU-1syHO72DwO-00LIU9; Mon, 02
 Dec 2024 16:45:55 +0100
Message-ID: <31d19aae-e2d2-4219-abe1-10516c42befe@gmx.net>
Date: Mon, 2 Dec 2024 16:45:53 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] dt-bindings: gpio: brcmstb: add gpio-line-name
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
 <20241202-dt-bcm2712-fixes-v1-3-fac67cc2f98a@raspberrypi.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20241202-dt-bcm2712-fixes-v1-3-fac67cc2f98a@raspberrypi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:IOMHa3ZcSMqatNTk+ufT5/RmKhqFiwzBeWyjcIAIec/+E8wlQQC
 fdKZZK9TLuHh1jL1hDr4uBSd7nS/U5aDZZXZGyDz4LM1c9B7zrueEd8FSeezrohk31PE2Ao
 kKWLjdrAAAN6ZIjGLWWXIzaRkfq57UuXqprcF0rbPF9DTt7UrdPhwz4zmOiMbtqMFSEu5rx
 h1u1Qozkm5XfeKRDKaH+w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ArgobiVFoHY=;i5fh4paZoVkp5qjDIySZTSIapOP
 L7gJtxwiztdtk86rYcuduxH+osuuESVmiV89rg7PrCpE8vVfLgYAoj+htWE2bgwEJ7BkvNC9F
 xYhcb6QFIky4cTsN1RaAB3dexZ3fK/p/uo16OfnhqKMkFzu9Q1+0l8rT6jp4Id2XROEpRnyUY
 QQi+N28duCW9gzvHwldDlAlJvrElZRvGtqDZGYzHJrln0zeUfVP82t1UJTaRoODibhzE642O3
 wqX4ggf/+QVbcbtMSoryU1RAVXlenFa6paCaCkyylC1AljpyFkTsJ9Ue6qKyH1D26NqjoETOo
 RF0Ky2fsAcQKxmg9IyzC88/69hxUxO4PL+SDoMUSpcDak6lgngvdhoge9dQ4HHCBwOavx5mAM
 W4yUBiKYJqXv6sxnm1cmCyVEy2YtNRXoI0HT65XeXu7THGIdKqoQcPI9HjSKnQslf5faGyESj
 Q3kEDNYOZ9jmUlVDXrKfRJZ6uzFMjW2WDka3AyRWc9+yQ3krpHDdeGjnPI4at5yRUu/R/Lk+S
 Osv3zlNNwx1a7tRs4DiU6bPcP2RFk19+oEEPChPwPVc1UvCRnzBagB8PFReV9j20OaAgVG9NJ
 187DPQdiomDkE/yjplISD8km/cI9WZixQ3+afgMscNuAjqKBsnV5+7gKDvZsvlS/lXOvLnBSD
 OwBUIgZfMp8whoIryacYaQiJLuIu4cAMcNxIo/pOrGzdZ5MgnJJPy05XChz4q2uiRBn6tFchE
 rHW0SQZxwl6JIXeSymrp6wHivbnco8pxhP9bRcVt2FhkRFvMNPxGcOMsb5fLzd0ZZLoFOg45/
 z/rSwz3UXEtDgcggdgYU40LxDztxQkpEdmt1rBItTNmSf0f94BB+7VVU21dzA03+jaekZyTGP
 YAknUnwpXcurCo9GJG5ST2pn3tzC2+RyXXsr3klzJyCVAlkwlZbnMug7HKXcfiPWaPkGPsDhG
 QiSLAEWPxysBdU8lRb/ARji75WJqVV4GdYR996jOYP34CgN5aXqgbZVMfpuoj9u6HkiBUEo2V
 Jn8JmYeHpoJ+QgzPR2uTk1UQ5ud66S7WQN0iQuHHoBlCvaCZ8skO0qzFTkdWGGxYcP/oO1A2z
 tEH+w4eM6q17dL9vVwB3u4yEtMGqP8

Hi Dave,

Am 02.12.24 um 15:31 schrieb Dave Stevenson:
> Support comes from gpiolib, so permit it through the binding.
Sorry for the nitpicking, but gpiolib is a software part of Linux and we
should describe the hardware here.

Best regards
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>   Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.ya=
ml b/Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml
> index f096f286da19..086d016df6ef 100644
> --- a/Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml
> @@ -64,6 +64,8 @@ properties:
>
>     gpio-ranges: true
>
> +  gpio-line-names: true
> +
>     wakeup-source:
>       type: boolean
>       description: >
>


