Return-Path: <linux-gpio+bounces-3838-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 860FA86A0A7
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Feb 2024 21:07:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C0781F221DC
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Feb 2024 20:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57B3114A0A0;
	Tue, 27 Feb 2024 20:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="Lvokgkpi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739D92260A
	for <linux-gpio@vger.kernel.org>; Tue, 27 Feb 2024 20:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709064446; cv=none; b=c5sFIO++DMi7FTt2ggZA2WN3OldFgI4/sgEaA1bMwjEatYz3hYtOoZdLXQ6URZSLOJOlBP2h+uSQplzEdfpCToHEq/ImNr39EnUjDElyDmTSboBrblnBNuGNWC02xTsXfLUTiBIINzo51j7pT3XluTWbS2Bl6FyAdTp3mtyPzJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709064446; c=relaxed/simple;
	bh=SkIIjF1tyZwkpwHJ+uM1/lij30j4No74HWCjYtPxxmI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jvsp+1EzVDToOKsgiAYmfHrV8dff/6lz2waEY7SHv6O9G08NVS9oD2gG1J1aj/A/l3BHWd3SA4GczdtbfBsA4fC8eFsFtjJPpNTv8kLxHMvmkrt2vGDjIyjTpXU9NmeUjVx731oheo0Re4kQZaI6OQZNZjVXNI3fuQOJQLU7kgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=Lvokgkpi; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1709064432; x=1709669232; i=wahrenst@gmx.net;
	bh=SkIIjF1tyZwkpwHJ+uM1/lij30j4No74HWCjYtPxxmI=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=LvokgkpiWQCqV9uwuqJUivYs6biZ/IaT297Lk2l8P//EgQpqLkGhs8sQU6fVQcJ8
	 SSk6bWBVxevwptve5V5rS9zbWqS+fdlyRuuL/2hGS/ZRHKpMsdl/417IiW5sN8IpU
	 2pCJjzfwfwXi1x2Gv2Zs25IuzSP/mwpz64YonIoy1tqKWvva3Ms0pUhE6UaaZrJXD
	 FdyImlWkcjHsBeQeAnAjLjtRQNMrVBNLhBJKbD1wut9YL5sGyNUldiew1eBODOLmF
	 345bLku8D57GdFjbPART1LhhSkPMBzW7pqX4cN7JMhdNdvdkGdCzVqZ3T44io7Kzd
	 vEFWRciLJM5Y6KWVTw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.167] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MDhhX-1rmWdr0K3T-00Aj3g; Tue, 27
 Feb 2024 21:07:12 +0100
Message-ID: <04b71758-c4f3-434f-9d49-32c7af92005d@gmx.net>
Date: Tue, 27 Feb 2024 21:07:11 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/2] pinctrl: bcm2835: Implement pin_conf_get
Content-Language: en-US
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
References: <20240204165852.166157-1-wahrenst@gmx.net>
 <CACRpkda=VsgiH0-iJVLry4hy6kLeJ_20mzMs8OrqR6Fr8eAp-g@mail.gmail.com>
 <1709f26f-0486-4856-8b2d-ba5e6fd492e2@gmx.net>
 <553aa585-c442-4329-8a4d-fcf2f9c110c1@broadcom.com>
 <9d729c9f-94cb-457f-8a40-3ba4d62fe627@gmx.net>
 <3bd0edd3-32ef-4781-bfe0-b678aa636bce@broadcom.com>
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <3bd0edd3-32ef-4781-bfe0-b678aa636bce@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cRbnTSrX7cZmlFwrMuXjNT5och0ZDd3T4KY4JzEwYx9/i9pXX5L
 96F1+MZHCggF6Vq7RBs4DNIyxXkEDC+8N8X4DPpNiBgUXANUte8xv3szELJBJb1s8qWm74p
 nofgio6QdQxHxgt864t083zRqOmG2m23KjxplWmMp2+1bAdXEuMXYjeHfdrkiJgrjiMT9Ru
 GwTwdoW+DJi7ejjjr7AbA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Kl2AVotJXIw=;QCL7YLlxtsTIS0JUfrtaAjFPRkv
 e3GWZIbceZo9lp/wKzjXpx7eN2vWjD2iFoia3CqZdM8ivvQHsxXbRzQ5FdvDRawkQ2BZLondq
 fXYoR/VOOPHnWkjXlXRBT/sBSPNSMWJv5uC9gOG6LOG6hngAd+uVK82+2gAZlGbVDZkwQ5msY
 P7Yk3BQb70lBUP2cvT9YafE7OXBfBgttRS/9SugIETr62v0qwJaAIibDwm7BB+fCTG6NyoZam
 S0CxvuZz+X32Cm9e2pYsFnuaf2RXRo2Z0T1MeHvL5FoCOnIDdZG1QzCDtWNCu0OShMdh4Rt4q
 RLDtzCMZHXDEC32gqMwh3igygO1OCs7cUqCfPOZFaQ0aNAp6aiwIZ8KQZ35Uj/6Q1Xd0dSp97
 IHPenL8a39sOm/E8JDmIm9gkyf714446rhLmtKBdXwd4Go1e/Gbglr8Fun3whiosABDnx5NZn
 btvpKitK7xsVoPsDecXVrvmh2hXD5jG5cSKCavd/k2N0scvEy7O2vd93AEhOYi/HtXHGB0Vr5
 OY1AfqqG/8740R8e1M1xS+ICpP0Wv5P+kFSTGoXR3Z8wkoxW6qHsdW4Mjk7FrnwPGq9FbFWqr
 9ryflan5SoNKO3W+d7wlaB9H0N7TJ7oNCnuexS1bS0Wvk/Ic6HR4TdRf+N4rzKO5mjoQxNOOZ
 epNxhJH4FMWn+MypjeuQ/wzQ9EiNDhRDyIA2RPsETNmecI1NpManXDAMDBMnS9AkAscsvi0tX
 P3Q5Ne2v6k8nyz4cjXVRgorx76FJJa6NIZ7tnjKSoVkSoVOIcaPVf84+2qivE+L+zyn60U3Tm
 zI4j395IzT6kyyvmeegyQKZDyk+DTy0h1wMoJipzk+zeI=

Hi Florian,

Am 27.02.24 um 01:22 schrieb Florian Fainelli:
> On 2/25/24 02:01, Stefan Wahren wrote:
>> Hi Florian,
>>
>> Am 07.02.24 um 19:22 schrieb Florian Fainelli:
>>> On 2/7/24 03:33, Stefan Wahren wrote:
>>>> Hi Linus,
>>>>
>>>> Am 07.02.24 um 11:56 schrieb Linus Walleij:
>>>>> On Sun, Feb 4, 2024 at 5:59=E2=80=AFPM Stefan Wahren <wahrenst@gmx.n=
et>
>>>>> wrote:
>>>>>
>>>>>> For years, the Raspberry Pi users relied on userspace programs to
>>>>>> read
>>>>>> the pin configuration. In the meantime, it has become apparent that
>>>>>> this
>>>>>> approach has reached its limits for various reasons.
>>>>>>
>>>>>> This patch series now attempts to improve the debugging
>>>>>> possibilities on
>>>>>> the kernel side in order to reduce the dependency on these userspac=
e
>>>>>> programs.
>>>>>>
>>>>>> Stefan Wahren (2):
>>>>>> =C2=A0=C2=A0 pinctrl: bcm2835: Implement bcm2835_pinconf_get
>>>>>> =C2=A0=C2=A0 pinctrl: bcm2835: Implement bcm2711_pinconf_get
>>>>> I don't see any problems with this, can I just apply the patches or
>>>>> do you
>>>>> want to first resend them as non-RFC?
>>>> since the second patch hasn't been tested with BCM7211, it would be
>>>> nice
>>>> to get a feedback from Florian or someone else with this hardware?
>>>
>>> Give me a few days to get there and I will run a test.
>>
>> is there any chance to test with BCM7211?
>
> Sorry about the delay, I just gave those patches a try although I am
> not sure where I should be seeing the reporting about being configured
> as pull up/down? Is this supposed to be visible under
> /sys/kernel/debug/pinctrl/*.gpio-pinctrl-bcm2711/pins?
It should be .../pinconf-pins
>
> Checking the datasheet for 2711/7211 we advertise 50kOhms internal
> pull ups/downs for all GPIO pins, so we might need to make the
> resistor value different based upon the board/SoC maybe.
Thanks for this, in this case i would change the resistor values to
50000 Ohms. The CM4 datasheet actually provide a range.

Regards


