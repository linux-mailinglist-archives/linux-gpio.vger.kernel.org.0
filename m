Return-Path: <linux-gpio+bounces-8440-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E7E93FB3F
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 18:33:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A289E2847DE
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 16:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4B891862B5;
	Mon, 29 Jul 2024 16:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="CeCR6EuO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B2815EFC8;
	Mon, 29 Jul 2024 16:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722270435; cv=none; b=QB6lgtdniwj8oqF/qIJcWAajj0m3SWe0tF6BjetLtynhCj9maHIXNaVdTxOpysDBPod1yXao+q9Z4P7+4qbjrKTFAjYAPFm+5TLhg1368kOknZtQVZtMZ6x+c6MzBAjzqvJcd0qdi5LEBtxeYmNZZkaYqEW1cJhfnYMMzMNR28Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722270435; c=relaxed/simple;
	bh=cBp/RizqX+dGUL9k7pxYf0+07L/ZUOrdrCuMDPx33IU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P0/eR6RhuPBAiKG9kugilr+tYVgVxr9LrHr6mkC4LajCEihfZsTjAh7iJxUenb+CgwwIIkyAbZm2c4178eQyqlN2n+tP8crCR6LUWZY4WnpNRrhBPeRSMIf0vklX8iVC6o2usIOD2ihd5U3yXP34M1+8DwPiOS7qYWUGSWUNA5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=CeCR6EuO; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1722270429; x=1722875229; i=wahrenst@gmx.net;
	bh=CPdnaIAoXXo1X/Vj+jyI1YPMnpPkxnZy+xibg2I7caY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=CeCR6EuOJSqiLBnXbvlAoVBZnOpuU5t81NR1D21484AIo+gVenqTp+ga3ejT3AJN
	 joAEYi0zTYmoxlr1Lp2IlI81iioBBy3UeXzEVt4HIx03KvYeZL+gv0tRlbynvRY9f
	 Tr9/S3Dp20wBprAWJGYXSz3jq7qoKu6Zt1yMYmXHvfniJ4v4gsdUUu8tBSgFdOwqa
	 OVYZo3S3HYzqoyd/1Q1NpN07DOTueXJcYvtGAHKJ9PkQ6lynJOlPgVFhAv2nWWSNe
	 3nMqpxg8Mgy+GL1ngud5CnBB9xFYFYodfv3SSe4ihD7BTMHq9XOQDv5iYpV2pBy9b
	 0FF6OIqfcWcKveXqZw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mf078-1s5Cvn02Is-00kGRc; Mon, 29
 Jul 2024 18:27:09 +0200
Message-ID: <0c8fe963-50c3-44be-b2ba-10a9f99a28ff@gmx.net>
Date: Mon, 29 Jul 2024 18:27:08 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: vf610: add get_direction() support
To: Bough Chen <haibo.chen@nxp.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "brgl@bgdev.pl" <brgl@bgdev.pl>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>
References: <20240722062809.915867-1-haibo.chen@nxp.com>
 <8ebb5430-93fa-4239-b09a-59f35b0dd94d@gmx.net>
 <DU0PR04MB9496B93A0336D50B8545660890A92@DU0PR04MB9496.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <DU0PR04MB9496B93A0336D50B8545660890A92@DU0PR04MB9496.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:F0ufmCEc+UMGh5e+pNUvZ8X2viYuJSe7FN5DtHRSPbDvnpB3isW
 otJbnknmnvUKgwYSzNsx3DdAo6zXeMbCWYMSwv95pYXQkwdo0xzFwIgyGT5mrpemYbOX6dt
 VTY27E3ZLavqFFsxyl0xyaQxoiyLuwfhWifawfIStzgMyB0hUj02zCn4pqzDOcX22dZSXM8
 8N2wPa5d3xVq9i1rkeT5A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XmhZ0AzoILg=;9SyJuRkxX+16V41ezd2ymvFlGUc
 k696rhNeLosWip7ZwrKaogY18p+zKa1f8Y7T7UL9uQs+Oaba6w/SZFSVneDpswF79GXKUSZdA
 5HnAacfSI/a0t+FARZDVUTkK2UFYstBCpwS5DBvvzVCtFlHOhYF3CHLMA1lVkl3W9pIt0hKVr
 SM0RJI2iCzWaZrIaXD1I5qa2t50DjaOFSYROGSQRgX6PuO+O1sWCnTbTvHqVGLRV8HjrpuV1g
 ooIy+pjJxG+vTPqUZnX2Acm26HoMCr+mF6wbGBTWb3B1xZCeLDTjjsXcvzlsGdTHcY6sx50mw
 XaMh14jU668l9SSALL1WlKLJbaxHGn81CoIXmGIUtuYSYVnUiZ8SFFONua/ipoNKZe+y/OrOw
 ULiBe22zSMJYmJpCRxRcFKH358tzETyMVwmEY2Cq1HMlnieXsRI8xVFK0/l+WSZG7S8cgqLCX
 NvvrKAJC4lpyGltLhWfiWTuec+KE1LhlqwrUZnKRczO0ckTQMpeXyhwAuYHeyTR+mZH4eFCF0
 R+nxtb/qFb+6QxzPj1FU7scVok4FcL4NL7rYw6pnya4f6WXZzqoc+6/KEQyQQzrT/b7HRrE+c
 90YheJbCFTEtUivGWgjI52zLwnY9lHP0iuuVm5cLvwAwCBDTu7iLK/tJDLfkXPBTheVzrSxiN
 JEzhF2QpmjpHBhQLdyZqwEeS4KlOhBapho7P1viPGe/De+nvyh56E0TxBYWFbCvFLJoJJG+0v
 GAJJjzKEX7gUcLucV5oPKBGypCCUFQlCto9bUa09dC5nsj+tzwDm4mEOKD4TWetGjWoDiPj2q
 gl1SVVCA6w7KuJiYhWnARXLw==


Am 23.07.24 um 04:45 schrieb Bough Chen:
>> -----Original Message-----
>> From: Stefan Wahren <wahrenst@gmx.net>
>> Sent: 2024=E5=B9=B47=E6=9C=8822=E6=97=A5 18:32
>> To: Bough Chen <haibo.chen@nxp.com>; linus.walleij@linaro.org;
>> brgl@bgdev.pl
>> Cc: linux-gpio@vger.kernel.org; linux-kernel@vger.kernel.org;
>> imx@lists.linux.dev
>> Subject: Re: [PATCH] gpio: vf610: add get_direction() support
>>
>> Hi Haibo,
>>
>> Am 22.07.24 um 08:28 schrieb haibo.chen@nxp.com:
>>> From: Haibo Chen <haibo.chen@nxp.com>
>>>
>>> For IP which do not contain PDDR, currently use the pinmux API
>>> pinctrl_gpio_direction_input() to config the output/input, pinmux
>>> currently do not support get_direction(). So here add the GPIO
>>> get_direction() support only for the IP which has Port Data Direction
>>> Register (PDDR).
>>>
>>> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
>>> ---
>>>    drivers/gpio/gpio-vf610.c | 19 +++++++++++++++++++
>>>    1 file changed, 19 insertions(+)
>>>
>>> diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
>>> index 07e5e6323e86..08ca8377b19c 100644
>>> --- a/drivers/gpio/gpio-vf610.c
>>> +++ b/drivers/gpio/gpio-vf610.c
>>> @@ -151,6 +151,19 @@ static int vf610_gpio_direction_output(struct
>> gpio_chip *chip, unsigned gpio,
>>>    	return pinctrl_gpio_direction_output(chip, gpio);
>>>    }
>>>
>>> +static int vf610_gpio_get_direction(struct gpio_chip *gc, unsigned
>>> +int gpio) {
>>> +	struct vf610_gpio_port *port =3D gpiochip_get_data(gc);
>>> +	unsigned long mask =3D BIT(gpio);
>> thanks for sending this patch. I'm fine with this patch, but could we u=
se u32 to
>> make it clear about the range of the mask?
> Yes, u32 seems more clear here, but I notice all other place use unsigne=
d long, so I keep the same code style.
> I go through the history of this driver, seems no specific explanation a=
bout the unsigned long.
I understand, but i don't think there is a reason for using unsigned
long. So maybe this is a good opportunity to clean this up.

Regards

