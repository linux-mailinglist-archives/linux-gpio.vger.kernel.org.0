Return-Path: <linux-gpio+bounces-6015-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C448B9AA8
	for <lists+linux-gpio@lfdr.de>; Thu,  2 May 2024 14:21:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13BE01C21C37
	for <lists+linux-gpio@lfdr.de>; Thu,  2 May 2024 12:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E2B980600;
	Thu,  2 May 2024 12:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="O/WoMnq8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445377BB06
	for <linux-gpio@vger.kernel.org>; Thu,  2 May 2024 12:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714652475; cv=none; b=rBHvT7HxSXmhYcJD48ga3KZljcFI6LN99qLKcpAOAuNBhRHnYhvGEH+ratJgw679TU1RbsT3YCio0GOxbZhiU9Z2RbGZiT4EzmYOL4L/m0GNk9DnovT4zSYrJj7+DlUogHNxo3X+dEuPbGii+gIGIyHWjVcUWATvaj2mqzHHtfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714652475; c=relaxed/simple;
	bh=UqqfCXcK0fgCnovWFl14oSpfxsZTmtN5mPy0y5HxGOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U0pd7kcE9dhQ6lUvXOOQQUtJhRvWrOZOPUeTViwAqHFp8tBCbGsbravMByYQaVLBtPeLo92hRa7qJk+cR7j+y28Q6A4w1IYmFXX7tr6IKLjW07moe5DLai9ev3rd3z5zsb8C4Mhiv06TJZ1IjosoJvIb2KSRoZU2/sQumRTYuPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=O/WoMnq8; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1714652458; x=1715257258; i=wahrenst@gmx.net;
	bh=WN+QSUIGb6LZrkpA8OKiqIda9puAIZ2dYBIxpdfNvq4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=O/WoMnq88MlUI2g3s4HSWieeGkDpxNxDqZaaXIgNGQReeRwl9AhWkaCV5uWegmaa
	 aRLvC4BoRLJVgP0JzZG7STgp9c/PsOLMpLYWvh8w7PKMUYHnOQxxOSMwHNqjUgpET
	 ZZfkLzQKAi6vb0GGSFF0a4P/39i6nOCaw1GH05cNVDqGEm5ztJ0EBz4f8HsTwr1sl
	 rOOUqpbhk3I82KIGzNcIAIaM2qc+mzJ7AehTZOpQ/154zTJek9g5lKbkDdXxMAsQi
	 KXXxFqVTXg8VRdXPx7b/3eeHcXHakx1Cha4+Xprk1zlqOSALY6GKsS6A4aFggaSpP
	 NJjfHEqLUyyIM93i7w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.167] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MQvCv-1sG3yg3aSN-00MARu; Thu, 02
 May 2024 14:20:57 +0200
Message-ID: <328dad0c-bb84-49ff-89c9-f1bce5c4b33b@gmx.net>
Date: Thu, 2 May 2024 14:20:57 +0200
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
 <79627aeb-8151-430c-98f4-5689fd61413f@gmx.net>
 <20240502111546.GA325017@rigel>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240502111546.GA325017@rigel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:1mTAZMAW1iwGSZz9u6lPiZhUB29gr5wzgIP9Klzefor9tbV8Ngk
 wFaWfJCbxv2w2P5R0UTlBPtkg7MnNx3EDsVQmlqxLetLSt4U7MJI6rYiEHXDbDREYTUNoTl
 vqSd4fNk+ggRDz+Nj0Qs6jLD94bDRVkR2eVHMFQL5ynY7vcLLgYso9xvD5DC8u/sswv7dLh
 WlDvk3cPBEQhkRMV6cEpg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2H2UnteqX7Y=;VgiC1yoUrGVVIc1vBt60DS9yAa+
 TZswt0h675w5Ng2SXrzyFtna1r02GUu6Wp2DrE0MLybhBIFmADOB+tPk6VVw2wrkypYbg+Bgl
 /V5aCD6q/0DhTqYxBTQ2g4XF74CEauT7HmVJvWTr/3Bb5PXQbbO68N9y2pHo/qJ1iyo1LNgZ+
 jGvmWM9MFb+ZFWOo2kwk3Ttc7iDElJR+QHAviEuO+K1IAQQZvGK1n4E45LKy3bZB0uzppvj4V
 IwBMAj2lOB6npnRUYFnPtLRYlF1JGc+OJUcm+N9+bh7drnaU7ocg6OUg/eSyOk9KPsDDYtqQx
 YvxbvFAaPUgVwz3lp0clyc2OnvM5PKeCApMfiJInqLkq3XaaJ1H5Vtw6V8bewb7jb/wIb8ujM
 5xDjcTPY75x6aM33bmdbBO0/c8aSmVeV2/GVmA6EtQDXzwjNbxis3plqORAXdxRrPUHsWiK3X
 aWVfLpwUPPHvu1+gx1ckhPHa/XVFoDNxpaISf524avY54d84eC0dXD0VdbZJPiW8cPVslyTV2
 9QUBqAi5N5av5Dj+tmitjbvpkhOgMcpiowIoIGT1CZTEUMmzWDMIgabYV4CN4HmJXVisNY+Pj
 lAyjJtgJ4JVpl/rUVeyjqbxNcKwstR3iypeCpTySVNEE5aEQkwmPhd3zOuXcPwf/qbSLTmyfd
 OGKwq5mWaoVKJEg7j+/EKYsn7K7oMSL72FdS/Qzzowwro86AF7pwgcQKomb2nmlLzsWXqwYa5
 e8OUi+JAjZzPU1qX4EMuAc81RZYsEVos+H41KqA2ZB+YrNrJyBoKf5Bne5zZuT81pzruagkGd
 zehfasmMm3beG+RaO6x48U5gipyDqD7b2O7deIQPHwMPE=

Am 02.05.24 um 13:15 schrieb Kent Gibson:
> On Thu, May 02, 2024 at 01:11:06PM +0200, Stefan Wahren wrote:
>> Hi Kent,
>>
>> Am 02.05.24 um 13:04 schrieb Kent Gibson:
>>> On Thu, May 02, 2024 at 12:22:07PM +0200, Stefan Wahren wrote:
>>>> Am 19.04.24 um 22:40 schrieb Stefan Wahren:
>>>>> Until now after a bcm2835 pin was freed its pinmux was set to GPIO_IN.
>>>>> So in case it was configured as GPIO_OUT before the configured output
>>>>> level also get lost. As long as GPIO sysfs was used this wasn't
>>>>> actually a problem because the pins and their possible output level
>>>>> were kept by sysfs.
>>>>>
>>>>> Since more and more Raspberry Pi users start using libgpiod they are
>>>>> confused about this behavior. So make the pin freeing behavior of
>>>>> GPIO_OUT configurable via module parameter. In case
>>>>> pinctrl-bcm2835.strict_gpiod is set to 0, the output level is kept.
>>>>>
>>>>> This patch based on the downstream work of Phil Elwell.
>>>>>
>>>>> Link: https://github.com/raspberrypi/linux/pull/6117
>>>>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>>>>> ---
>>>>>     drivers/pinctrl/bcm/pinctrl-bcm2835.c | 20 ++++++++++++++++----
>>>>>     1 file changed, 16 insertions(+), 4 deletions(-)
>>>> Gentle ping ...
>>> I can't comment on the substance of the change as pinctrl is outside my
>>> wheelhouse, but the "strict_gpiod" name could be better.
>>> The point is to make GPIO outputs persist, right?
>> Yes, correct.
>>> The name should better reflect that.
>> Finding good and short names is hard, do you have a suggestion?
>>
> How about "persist_gpio_outputs"?
I'm fine with that. I'll wait until tomorrow before sending a new version.
>
> Cheers,
> Kent.


