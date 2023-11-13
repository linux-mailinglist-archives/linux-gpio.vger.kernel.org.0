Return-Path: <linux-gpio+bounces-52-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA9B7E9C20
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 13:30:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E0CD280A9D
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 12:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 259351D6A1;
	Mon, 13 Nov 2023 12:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="Xl2jH5lA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5A11DFFC
	for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2023 12:30:12 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FED210FB
	for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2023 04:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1699878593; x=1700483393; i=wahrenst@gmx.net;
	bh=MW2n4FXrRXZnyvbiIrZVXP37uF5JKi4ImAP7Yo+hSCo=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=Xl2jH5lAZ8ls59vOcEySbj0EM3y85R5/fK0GMk9kvZOrSrGeaLRUjdSfprXJxxwF
	 44owc230tsQapC9GaF6Ot75nIm+wt33JA9tcxy+FCDgY9oyht8QtIHu0s3v5eHpYs
	 3NU8F2MdafRz5SYZhN/wlLDPyVWVRAbbjhytwKmKDrOGFD0IuGykmveem5XBroh9q
	 kR3rQbBJZ05Yhbh0oYpEnEIup9IjsV2N9i4ZnaxK+td6zfc5tQi4IO48E3827hocZ
	 01EmesChM3UIRideFo0mz7OJF6uSSwjNndz8K/uL1JBq+VtkfrcARXmm538lEcqxW
	 tNsYEhGVil7ru8q8hA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.129] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mz9Ux-1rFcyw2jkB-00wEwq; Mon, 13
 Nov 2023 13:29:53 +0100
Message-ID: <13e7e545-06bd-439f-9031-4ab5758f809f@gmx.net>
Date: Mon, 13 Nov 2023 13:29:52 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: mxc: implement get_direction callback
Content-Language: en-US
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, kernel@pengutronix.de,
 Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
References: <20231112192428.6832-1-wahrenst@gmx.net>
 <20231113070439.GL3359458@pengutronix.de>
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20231113070439.GL3359458@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/XjJGMvlC/tbs7FQyP8ySVuVR6AtHW8bi1l9ZXMorfl+YvHyBbX
 Vz84U3iW241IyzxoR2Q17eI6wq6EvBvUznk2efNjHvHfj7Vp73MiCeSCBB7cqz13bYzhVs2
 kqHN95Gjd+h+lNtBh5fOz/Zw25wf1IbuRNCuUwH77VyIH/jmJ7ppyW8GrxbpgEM9zbQuOwH
 vXS6eOVC5UCk2UX5cRtUw==
UI-OutboundReport: notjunk:1;M01:P0:ZwSRTAxJXA8=;6FQ+8iSx1eJa2IENi1gOpySQlz+
 MU7BlEH6Fy84yohjS1TIIqIBW/+3+FcnmYnf7TTOBk7MF8yTgjBRJ4oh1XLeHmiTzjn4tuj+Z
 UqHNlDwO6HGCmagyIZU3Xo2y3G1vECZphacDaBRQ87ubd6oIgqRn+WfkWTl9gVzdZWQDa4UzG
 2nnlcadmLhrySQFjacSYdwVQKn5NJTkVFZY1rewazGrNBqu8GycUO++Oh8elX/wvHX8tYtwr8
 KM4zh9uKWTNCGoeR9Bc5eeREuVnSlwaBJQbezaGrnbEFvULlbgOZzfTZWBiSdT0mxLtgZ1fxE
 PYi4VyaS7wzUcoRe5iP28rFgJJPzs+QCIOKF8G3vyHm0y3jh0VnjQkRoiX0njrK0sOynRbuhi
 HKBk4TAlJe4nL+pY6AvxVV3cHUXIQzgaKGHZ8ExMx/0KqHjplQ0TnCBxpqGBzUTLljkJl9uZQ
 fR7JontC4jza9ip1020+vvwx7U26RzVdPupEV7tcMuSFjQFjZJgcAdSHQ/4nLlo8JWeaveKFU
 Mj58cGL61S4AItImY57FhsiGGc8dMDvEEs0HjXpmrsdbkOk5TTBX2lMKic6hZflIflg3YYrG6
 2kW8HxETMtjysP+vUuKrsuMARzQDKr5tpHAn3zbnrIVtDcdUsZ0rizUHty/uuq7f33o/6pR5B
 sUNN6yvbKQLLZUac8/3IOPj17tTezSbH8y/ybtauPu5W8DLRTBc+iM5sQB7dnSQNCcbRx9vJb
 vACPArpoUV4lpvERMqLB5xYcmKD+yXrP9YYYXfVj/skqnE3V7gGqeI35n48YTIKM3/2TSLSYO
 0/I7eoG7xh5buHq3RTaBTPMru91d3dv+LWiDQGgk36ZTT2rs+QKCV+RmmmrEe8OHX13NG6QQG
 WBR3rOtX9t+mrCHFAY+WDTMuyELz1mVBfyr3mtw3BENtDajmz8PGAm0HQLL+ZqsW0vFIC1OXn
 /Q9uRd318GXfHnnIhdBmJjLFwrA=

Hi Sascha,

Am 13.11.23 um 08:04 schrieb Sascha Hauer:
> Hi Stefan,
>
> On Sun, Nov 12, 2023 at 08:24:28PM +0100, Stefan Wahren wrote:
>> gpiolib's gpiod_get_direction() function returns an erro if
>> .get_direction callback is not defined.
>>
>> The patch implements the callback for IMX platform which is useful
>> for debugging and also the kernel docs about struct gpio_chip
>> recommends it.
>>
>> Inspired by drivers/gpio/gpio-mxs.c
>>
>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>> ---
>>   drivers/gpio/gpio-mxc.c | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
>> index 4cb455b2bdee..ad8a4c73d47b 100644
>> --- a/drivers/gpio/gpio-mxc.c
>> +++ b/drivers/gpio/gpio-mxc.c
>> @@ -418,6 +418,18 @@ static void mxc_update_irq_chained_handler(struct =
mxc_gpio_port *port, bool enab
>>   	}
>>   }
>>
>> +static int mxc_gpio_get_direction(struct gpio_chip *gc, unsigned int o=
ffset)
>> +{
>> +	struct mxc_gpio_port *port =3D gpiochip_get_data(gc);
>> +	u32 dir;
>> +
>> +	dir =3D readl(port->base + GPIO_GDIR);
>> +	if (dir & BIT(offset))
>> +		return GPIO_LINE_DIRECTION_OUT;
>> +
>> +	return GPIO_LINE_DIRECTION_IN;
>> +}
>> +
>>   static int mxc_gpio_probe(struct platform_device *pdev)
>>   {
>>   	struct device_node *np =3D pdev->dev.of_node;
>> @@ -490,6 +502,7 @@ static int mxc_gpio_probe(struct platform_device *p=
dev)
>>   	port->gc.request =3D mxc_gpio_request;
>>   	port->gc.free =3D mxc_gpio_free;
>>   	port->gc.to_irq =3D mxc_gpio_to_irq;
>> +	port->gc.get_direction =3D mxc_gpio_get_direction;
> The driver passes port->base + GPIO_GDIR as *dirout argument to
> bgpio_init(). This should result in the .get_direction hook already
> being set to bgpio_get_dir() in the bgpio code. Doesn't this work as
> expected?
oh dear, i missed that. What a shame. Sorry, for the noise and thanks
for pointing out.

Regards
Stefan
>
> Sascha
>


