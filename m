Return-Path: <linux-gpio+bounces-20403-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B8CABEE4C
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 10:45:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33A853A8A2A
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 08:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C80D923817D;
	Wed, 21 May 2025 08:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="Ue0Udr9q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768982376EC;
	Wed, 21 May 2025 08:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747817100; cv=none; b=LIoqI8agJVUn+zMXALJYi3HWcBWB8raZnLFPy/00T7GMX+cliu2eB19abVtWcVaXHaSnpc/7vujoOwlOsKPnsJ4wQzzJhOtvy06/KBtqoskMABemLG6sxRrFEEIt6tJh6vN5PiFlt6RPwDF9CDrXqpqKoh6SNymThKmqYvoMkJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747817100; c=relaxed/simple;
	bh=CehxknC4l3b00UP9nYEQiUBsVmQOhGaH4rklgcwfvXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mnLAuGQT2yRPrNAIU3AUqfnbEjULKDrQIhgCfClfa75cJjPVP5cL8RGANCol9owOd/Jbdv4Ac71HMVP6SvMkLqhidDlHdDlRcFyqK/qBpnV0QzbhwfXRqjDCRuRASy9tPaLXhnMF/7lRdh43uGeLue/A4+MgIj+dVTC1I7n7pWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=Ue0Udr9q; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1747817096; x=1748421896; i=wahrenst@gmx.net;
	bh=CehxknC4l3b00UP9nYEQiUBsVmQOhGaH4rklgcwfvXg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Ue0Udr9qkC0RN+kQ2CWXXjCSjbkQo4T4PjHpV5jxSv4jbtREwH2kve9YVMlBX7zx
	 mC8/OT/sBowo7Lg1PXTgNzfftxNV3Q8umCwqH5BAxt7voGKYYzQUdrXLoy8olWgHk
	 H9QKfyACMufSATNq1oItEIGOzFA77ZkGHBeOOfB1t5W/dhpBs6SKn7YCyIupJwQkZ
	 Q4g2LA/78gAlk6rMT96kPqfB6YdI7D19J7f4H+OUUriXufULi8IZXeGOgQvIKFjxz
	 8ZuN9TQWyDmp+uijzzb92r/SVDuL2MEBkqjbcHhl/eA1koGiAF8h1O6/TpDeGBeWA
	 9Ye2BaizUAbFwfYE7Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([91.41.216.208]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mt75H-1v5vKz1Skz-00rQlj; Wed, 21
 May 2025 10:44:56 +0200
Message-ID: <6ed543af-99e4-4710-9e3e-477e178b7c8e@gmx.net>
Date: Wed, 21 May 2025 10:44:54 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] ARM64: dts: add ngpios for vf610 compatible gpio
 controllers
To: Haibo Chen <haibo.chen@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, peng.fan@nxp.com, conor@kernel.org,
 Frank Li <Frank.Li@nxp.com>
References: <20250520-gpio-dts-v3-0-04771c6cf325@nxp.com>
 <20250520-gpio-dts-v3-3-04771c6cf325@nxp.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20250520-gpio-dts-v3-3-04771c6cf325@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:dK5qgn+JORXo160OnNFPe98iN43vWKUtVbI3I+fbsq7im83PBng
 EuP+DxkfqgvABMFK8Go4R/wXd78QLZBcRxzwtz5iIM/1qWpIQ4qC0OVPKzzfQcPylBFGIPU
 qVpGpLNvOw96VkCYj0r3e/bQFdMfw8FG8BKBtPPmEmaYiOsaqcLXf7YtTAfEgpSmvyzTB9y
 qJPoQs6XP4zUmLwY2aYlA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ANqfble0+HE=;4KRoyzalUL1PnCbART5Qw9sHDAT
 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

Am 20.05.25 um 05:46 schrieb Haibo Chen:
> After commit da5dd31efd24 ("gpio: vf610: Switch to gpio-mmio"),
> the vf610 GPIO driver no longer uses the static number 32 for
> gc->ngpio. This allows users to configure the number of GPIOs
> per port.
>
> And some gpio controllers did have less pads. So add 'ngpios' here,
> this can save some memory when request bitmap, and also show user
> more accurate information when use gpio tools.
>
> Besides, some gpio controllers have hole in the gpio ranges, so use
> 'gpio-reserved-ranges' to cover that, then the gpioinfo tool show the
> correct result.
>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>

Thanks

