Return-Path: <linux-gpio+bounces-6012-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF5A8B99CF
	for <lists+linux-gpio@lfdr.de>; Thu,  2 May 2024 13:11:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C652D28458E
	for <lists+linux-gpio@lfdr.de>; Thu,  2 May 2024 11:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BB43604B3;
	Thu,  2 May 2024 11:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="eoQ587xa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74335FEE4
	for <linux-gpio@vger.kernel.org>; Thu,  2 May 2024 11:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714648280; cv=none; b=QfEV7rYEk54A0Qwo6/d74U/50UCvtdtMGP4YDQ9kXS3c6uowVH6CIfG7ZyMw7athe1HbxrBf0P7cpZxrnPVDlYrn66xEUFKwPX1FqaxwZSfg3M2TKfQjTnousotuyC0fUPaKhnWiGRnKLZ8RbQHN36yjHUdKKlXuKqhvoci57jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714648280; c=relaxed/simple;
	bh=MsT0Z/6XMG0eD0SUmWQF9YGBrG79rVias824e0IPv/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hxhExbmzJ4fCCvvvpxPbfE137T/MuxspjqEK+h3RvG93JUIsZG5SGR6dzmzX1PAAnsSMTRkxeRF5n9W81wMO7plM9k2SpVUJM6T3O1G7TCp75NihvSnTDFIx62joIt9ldkqFvjNrPpEwVFuVSh+s20iDPIghGvs083gwYvNPHZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=eoQ587xa; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1714648267; x=1715253067; i=wahrenst@gmx.net;
	bh=YerNgthDeo7fdoR3IRx8Wlzzt7TaZdmpgRG6MPoCxoE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=eoQ587xadBTFpi1BQNlQ1AfRePVPxXsh8Xsm4w5Xrb62aNVXyq1JDHo+GT5WtOiz
	 SbiQD3SKn5ONi+o2u/X12tF/CeiM4nk9Pa358puXuwd+f2HBasPt20NvNb04i41YS
	 61BtVw/ZNISonjC4OzIC2JFdBXVgzY12zas1ewdmo6I3qEc0GKoVpEwA2ip3UzfPU
	 ksPd2122zCV0qMMnWjo7islCtDJXBMNPh97gYRaJLbk0x5SI83L6tJEJC81nVliSp
	 c3HE5b54cmJJQgjZmoOi2N3HpnquWuWRPKsVA3liFInI0TW3uAzCWAM83UjAYDZqO
	 nP5a+ZUKQmIGV74dvw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.167] ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MSKyI-1sDOQV1o6q-00SgKX; Thu, 02
 May 2024 13:11:07 +0200
Message-ID: <79627aeb-8151-430c-98f4-5689fd61413f@gmx.net>
Date: Thu, 2 May 2024 13:11:06 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: bcm2835: Make pin freeing behavior configurable
To: Kent Gibson <warthog618@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 Phil Elwell <phil@raspberrypi.com>
References: <20240419204057.86078-1-wahrenst@gmx.net>
 <9a7fe0d8-ff44-4904-84cd-7b133f40a74b@gmx.net>
 <20240502110442.GA315256@rigel>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240502110442.GA315256@rigel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:JnwHcacqYLpuWwC/vdT07T2tbYpc+EkImHIDE6RUO8BrTTxZ9zZ
 BGxHoCASM3Lzeq9iVQKOzElMt6mAVGaGsl1K+kV83y5tieqrtWrT/OjYNNI/45jh70v2U91
 blf0XyTCQ7sgy20ABaodBbbsUoG9RHVXat1K4KLrkXNOE/GqqQnc9pvkIUnQT66NaaJVRRY
 EROOOwwB2otycpAhRQXqw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+P/8fhCqYhk=;tg9aSZdL88Nb9bAkO2IbeLSxUAH
 plt+h7OuVh7Z5O4mt8C7CB9brL6Bpv9bP3xAi+q2yux91MDKzPZdVlgf9ziykdvaK/EpEV5xg
 m8y3utfNqUAlWupfR2ve3ezsnHrYE+YlikYw5hFM7qS0dTDb5UCcT1XdCcTCB+qPQzVE/bNWf
 ccpKzllZ2DR+VDI6Yy6mpul3GDlaCH3gSe81dbB+9HUilDj8eUB3AJGwXOQdo3s8Mul2hryct
 TjYniplyzTL8Tnl4qEqHMDv6hw3wchNRIkimv0hld3icM4UGlDZ7CW8V9uPySHrxYYbvQVIoc
 VjxFQny41UEWq0V6k4YumxkMRCqKMxOR+5Vi2lSY3rfe2TT/ObfHkdlCDNRWSqmfMTMiIwJHR
 4/FlnRJzpk0MMlXQhwu8H1Z70W4Dt7Yq51BNhg/p3hpVy0/fH0zSFk6L7bBHXgeX927jk2+9F
 Ev9SC0m/rDb5dTyt6DklTF/xdspU8AoXYOs4VZY3P9EYx5KirIbYKdiL+ho1T+Y5BPj80xnYi
 A0NE8rprKzv9vaQ7ONXTy6nbKDe22xCuN9Ho7mIgA12vQXLP5TMP2JgKPKhpgMBBsTQ98gsc4
 rVdPl7tU6qXtjUKpPxZsrhHZQE0XXz2uvkXg8yLWO5KNDzakVygAKENoTSGT9IVoB18owOUIx
 zlQmf4MHHupZr5v+2sSoz9XEW9dd6CT4tecnZIXxX7+361pbfIib9Qx0KqbHhjMwt3kVqtydz
 806TjzJDPySu4ZJ3HdPOu4SqzlWlVeKQrMgdfTB0YHTG+sSWkw+3Ci3I1dXeG+C1uJaOj3dmV
 Of3klZvw2byJLGZPHvcMOFkJ78MgvmCj//iORrhxuaKzo=

Hi Kent,

Am 02.05.24 um 13:04 schrieb Kent Gibson:
> On Thu, May 02, 2024 at 12:22:07PM +0200, Stefan Wahren wrote:
>> Am 19.04.24 um 22:40 schrieb Stefan Wahren:
>>> Until now after a bcm2835 pin was freed its pinmux was set to GPIO_IN.
>>> So in case it was configured as GPIO_OUT before the configured output
>>> level also get lost. As long as GPIO sysfs was used this wasn't
>>> actually a problem because the pins and their possible output level
>>> were kept by sysfs.
>>>
>>> Since more and more Raspberry Pi users start using libgpiod they are
>>> confused about this behavior. So make the pin freeing behavior of
>>> GPIO_OUT configurable via module parameter. In case
>>> pinctrl-bcm2835.strict_gpiod is set to 0, the output level is kept.
>>>
>>> This patch based on the downstream work of Phil Elwell.
>>>
>>> Link: https://github.com/raspberrypi/linux/pull/6117
>>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>>> ---
>>>    drivers/pinctrl/bcm/pinctrl-bcm2835.c | 20 ++++++++++++++++----
>>>    1 file changed, 16 insertions(+), 4 deletions(-)
>> Gentle ping ...
> I can't comment on the substance of the change as pinctrl is outside my
> wheelhouse, but the "strict_gpiod" name could be better.
> The point is to make GPIO outputs persist, right?
Yes, correct.
> The name should better reflect that.
Finding good and short names is hard, do you have a suggestion?

Thanks
>
> Cheers,
> Kent.
>
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


