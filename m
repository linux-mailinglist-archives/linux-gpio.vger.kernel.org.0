Return-Path: <linux-gpio+bounces-16236-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88388A3C40E
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 16:47:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA5151884DB8
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 15:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 700421F8BCC;
	Wed, 19 Feb 2025 15:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="Db66ij2T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D95F1B983E;
	Wed, 19 Feb 2025 15:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739980041; cv=none; b=eBF05mzsRs+nu89Dp7jrPgKObr0aP5LYhCzucLhzpfVI4Ooffiqri7wONcI9aXNd4daS8L4bNmlPdAwHuLfZuzgvtxFGe1L9oGIumh8/h9zMwWyRDJ7ukIzLAJAWgs1tAfbkX8JOrmLXDz6Dwa53PxUmZB+uS2+QJDzusWI43Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739980041; c=relaxed/simple;
	bh=cYruzjU4FwNIcVwrV5mAW2mz/Y+H1RmNdiS+xMs1Zk8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GsJolr0CxD6HJsP2i5BQXEDv+yGjY+SkDiTcpvJeTm7qn3Rn4M3E2H4hbrc7lUA68MzAIFi9zRtBxEJNeOT5STlNXrS6CBl4Ys2YiHInf85SwnZJxzxTd7BwT1503vij30ld3wWG6Bn/Qg/VqxYSGdOia50G5VGXQsMtJVut6Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=Db66ij2T; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1739980008; x=1740584808; i=wahrenst@gmx.net;
	bh=cYruzjU4FwNIcVwrV5mAW2mz/Y+H1RmNdiS+xMs1Zk8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Db66ij2TBHIlY53rFt74My9MXdIis00IizkfWAT1zbw826cjT8cw5+gEJuazx3Iw
	 k+4PF9J0cfA2GLq0QychelZ1dttu2GzXQvQgfoowmbG2eTi7v/uz7qQ9xzmDKgztt
	 6nIEqeFvcsI4J82MKNcKAnG1ZbhUD30teF0V/gg4EiNFzcQMbmFPshTCbSB5f+Flt
	 dk5JR5s+2Y8O5Xa/Pze8zVLvRhs/wBn22EVxR3DIYmrauWJG6h1zvNPZhyeXMDc8q
	 4Bi/A0p5IzgDUHTjG4SE7BQoPXfyyMpIUuO2mNtWmMpamjinEF+5jnXqmhFXH0E2w
	 Xixhqs9B5oMDu7Z4Fw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.107] ([37.4.251.153]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MMobU-1u1Cfs16LU-00R2gC; Wed, 19
 Feb 2025 16:46:48 +0100
Message-ID: <031ca485-4320-4754-a5bc-21f01abb54dc@gmx.net>
Date: Wed, 19 Feb 2025 16:46:45 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC/RFT PATCH] pinctrl: bcm2835: don't -EINVAL on alternate
 funcs from get_direction()
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Liao Chen <liaochen4@huawei.com>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250219102750.38519-1-brgl@bgdev.pl>
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
In-Reply-To: <20250219102750.38519-1-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:XbIxFsuU9ru6GOV1PV0VqJIace0Iq5TQQdtNgYie5vje9MgSaOc
 EYKfbQ2OzM4FL3uWp4ykqfvWLAGGRUfwUBy78FwB0oDlkAlAYdSKRn73fl68OtjjS4DM5me
 PYIkHEyNJ5ujkYBrF9zJ813Qqof1P1vh/ZdH1l8+pDERE5nEyW0vpmQy1ajiFOHfQ62hdqE
 DbH3Qh8upu7MfGKzBf8ag==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RbY3QLmwFVc=;ShI4sQ7ZGZV7OKPb+Ctgp3RQ+BF
 PX9Ljkd7VKsQp6/jRiIfseQkHCLnT33NJl/eaxIUcpSqLSdpNKyQZl1YpQwnJ+BOdZ26HedR3
 cDcH98WZnKXD7mfQzi7Oy48pfvn3ye9y5/OpzGXdlIhZSMxvHJ8vxX3WbE2KoLqMlbz3DP/0O
 i1GGkqtDH5ScNcGI0JS8xjrw74YnTP90dO6NXhaMrWLuJNm2ns1YlHMsx/lGeldcZJNWBQsi1
 Wz1p73DqeZXJ9GOWR9Q2a44UkZeybZncN/a3SJMSygOsnnE0QxozdrbMWSCEmIL2DGvzC6SL1
 iVcDnXQJUvBO3o/kBkOKJt6ZU/jcS6pQVDbtFmTakoOtRCkdV953UM23QW7X6prnrU1ip8+wF
 vr7/hTkCr4gfObFwOgbx/QzbBnsCnyDHgvCYfQEIW5Ld1PhmPegi5rUtNNtso7iwyoFivqheX
 t3ZZybJl/72pjdfXwfBze0ylkRcEtX64PDnSF/paHBzrLX4s419gHNDdFTFeJ4dyLfZsoxmJN
 ZX1KJnMtg+BRN9dN/sliMsMpzm4MZzzkcMwLw0IBzG7PsWmB89LdaZr+9SCQTg9wo9dze8yQt
 YcGIhmle3QIIWoj1N6RNmLLzLMpXUhEEfbIIvgPi7bUpPoTzrxv3+oQuTdzzEBKak3UwaaL/f
 hW9V5jmy5FnsQbPJH5qTT2SaQBEUiXsRNadsz/+MHTQNEhqVUGISL/xVcuCrCK+cyMX4uIpTB
 3j5DnXLeioKti0rL/0qIM8QLAW4aotAsSz7QiOlvzuPVMK6EsQQSj9tIjN2PEL/x26bBhlrJE
 33fWxDwgbJurPwljIdEwBrDKp3jZJ+RQInf+R1BFOljfzfeEXQ/XwilPIHeEukUs8BULuET2w
 7318bsJEcgknmH13RgWiM3GOHZgqFMSKW2mHUckiiI97Ok7PKXEqd99GS607iIPikAphYciys
 QpxuVLZASsZ+gPkTAQQdgsSZHDcYrsWxUEWnweGrN+rKVmidZZlGcPb6z6TmI7Jx3AkKbHexy
 d1PJQFlRE/nX6MFULqSLWNWycA8yc4Yx47/u7cHIxqyRb1N5CFqzokCRd9zrMesKqHs4ugrtD
 UI5sp6UryWk6z++0r7l2Aqlcqn2jLa9WX2/7tQvfO6Yvju2tcwCc4Nvfm6Hldx2IZx3keAXCq
 mgZXuM1l2T6RB5oz1QbMZ4hBCZWhl0ZAdl2iMl0YwEaajSbhNJKxkeijr9K5nLIondYqd6bgT
 ej7Ie2DJp37VC8/cSjae7+ghzxdQb1TfDQ1dCd83ObGpkeKD48fGzl3NJri1A5UOyWtlhr6aj
 VY0l4QofgUoJeml0WPZDRhf0c1w3KXb59kstw+yFTgOWEXf9yGWuLW8/aqkfKa3n+Sn6VrrNW
 YoRJgmsgk2y9zeUWeGX52Y3BYTAbGm3cuJGnNQFMGCyB5kLRO6j+3gcQ+q

Am 19.02.25 um 11:27 schrieb Bartosz Golaszewski:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Since commit 9d846b1aebbe ("gpiolib: check the return value of
> gpio_chip::get_direction()") we check the return value of the
> get_direction() callback as per its API contract. This driver returns
> -EINVAL if the pin in question is set to one of the alternative
> (non-GPIO) functions. This isn't really an error that should be
> communicated to GPIOLIB so default to returning the "safe" value of
> INPUT in this case. The GPIO subsystem does not have the notion of
> "unknown" direction.
>
> Fixes: 9d846b1aebbe ("gpiolib: check the return value of gpio_chip::get_direction()")
> Reported-by: Mark Brown <broonie@kernel.org>
> Closes: https://lore.kernel.org/all/Z7VFB1nST6lbmBIo@finisterre.sirena.org.uk/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>

Thanks

