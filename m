Return-Path: <linux-gpio+bounces-4177-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3441A873E24
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Mar 2024 19:09:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58A391C20C86
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Mar 2024 18:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA1A513C9DB;
	Wed,  6 Mar 2024 18:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="qnqxgXJp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582CE13BAFE
	for <linux-gpio@vger.kernel.org>; Wed,  6 Mar 2024 18:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709748547; cv=none; b=qL712pV0W0zht/98IPqU02+Dt1C/WVNasa1pvKV3+Ju2RP12NslOGUnE79nM2OfakG16sUDM9hxAcixVjq5yGLa18/Fb6N1Yomlqa5F0NoemxwGH7nEBaW7g6KIWOMfEZ9LYbMwMdSqNNQft3S/2x8RbfYI3eqtLy2tm0SqJ6Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709748547; c=relaxed/simple;
	bh=Qs5F8oJ6AjMYtpqlLjjgqniuDOjYXA0Tb7a+uCHQuXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R6QbgqFV7GJHwkk8ot89ZxFHsj1k+a7dkM/BIlqcwc2wnjp24rCM8+7gjSAJZfjI7JcsbCMISCY5/X+24dBXO7VV8KGyWeeyXGx30HKYrvOFQXIilmiEHIW1PIRGGNCqulN7WL/l6QbHJ3P287EyyCW1h7QxabHk/i2AtFNqFN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=qnqxgXJp; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1709748530; x=1710353330; i=wahrenst@gmx.net;
	bh=Qs5F8oJ6AjMYtpqlLjjgqniuDOjYXA0Tb7a+uCHQuXo=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=qnqxgXJpwICqwQfbhU9eJy8BwVj/mlguYOa7WHofZNnpWcZqpwd+t8d+WDfdNniy
	 f2NvJFC/WUwa65sh/AFzkbBODVIbrV9oxMVRm+tdDGVyTnm/junilZfYLVRnAr4gd
	 hrgC5+rSOkVvII1OvlbA40Lki6AVaDI2uEPIJIRb9zv5nJEoLeBzn3xJLVN6MqhHQ
	 eus0vloXGSHZEwo3IhvJEDBB4mUAJ6JAcgXxLJqnDui9nA0TSEjUwF6kmJU7KyX2r
	 BcmeUtADzu/mlCkAg8oztPVnZX+oUy6zQOYCHwBLo/BZOL64/BtcZyGr8YaiS2GGY
	 jhRQPQZxXlE8vbnULA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.167] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N6bjy-1qm4wG16rO-0184pT; Wed, 06
 Mar 2024 19:08:50 +0100
Message-ID: <ea818953-59f3-46a1-b037-d183728e0a5e@gmx.net>
Date: Wed, 6 Mar 2024 19:08:49 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/2] pinctrl: bcm2835: Implement bcm2835_pinconf_get
Content-Language: en-US
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
References: <20240303140137.157522-1-wahrenst@gmx.net>
 <20240303140137.157522-2-wahrenst@gmx.net>
 <CAGb2v66XpjvDnTpi2=SPbeAPf844FLCai6YFwvVqvmF9z4Mj=A@mail.gmail.com>
 <CACRpkdZX2WHCggT2hvS86eLUq3pH6jYYpEFLbY4WwN6_Ya+mQw@mail.gmail.com>
 <CAGb2v67TFYZwCk1KViDHFVzuYX1QsA2E69UcJ-ZMMmw5UAxH8w@mail.gmail.com>
 <CACRpkdZ-6neizSv-F5jEJPZ-a_emoCbxM9AFqfzYSHTZFGnM1g@mail.gmail.com>
 <CAGb2v66Op2zSN1JrFEUCfBKxRL-W0cX=Pj18yym4FtWnNeGiXw@mail.gmail.com>
 <CACRpkdbni-oN5mNT9Z3GMueWaCjxDcmvjGHYet3YQubDowg58Q@mail.gmail.com>
 <CAGb2v6497xS8OQgDssGYw+7aNGeP31FGanJOT+sfZHF1ybAnEw@mail.gmail.com>
 <54e7cce2-5111-4fbe-920f-692e27e2b6fc@gmx.net>
 <CAGb2v66y4KbBzXW-gkyn0WHCpTh6p0OX=Df9WsAEi0jTe5p5Lw@mail.gmail.com>
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <CAGb2v66y4KbBzXW-gkyn0WHCpTh6p0OX=Df9WsAEi0jTe5p5Lw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:n/lxk7vD99jv10S4eeF092kXFO9SA9YAPXJKrjekkQQjapmjph4
 2t7KMZzmXfwTtgcLkeJzevvVC6vjNYs36E9SpJPQJ2EXWsJsuUrXgtbVNx3Bvq9C4zA5lYi
 pUf69Rxv1mD+JPRpVbysfc3LEK+Dvtmih0DFbRQrxuv70CjSCT7PR79bYNURYHduBAnrfB0
 r9WFZVE0lXRFP5QeNusUQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QtA9xT2IsUM=;8qay4ga3hA+EpFzsIAf1+12/RN0
 UQIcUO3F52JFGY9ZHjtcQFUb3aXwd6FTh4DH/UrQJjUYwnyrZStQWo6mROW/f4BShXIE17fFM
 R+OxyhORspexgoIv0CxRy1ZpjU3+NfumGwWXWZW3P7LzglJaFcXFOv2IGJslUjJrwAoMASOWO
 jT9tNvfCklpwFT9+oMoAyAYaseXf45E130jrBWMyfbzrOvhxVz98q92YRDG3vp9NUWF6+xw3P
 uuijlApZhSmlkeILC0hM35BwBwkCtNZGSv4j6zdVVJx1nSEa7Q11GYaLFqjjSMhADRIsxuWx7
 bfbZ/knHkZs1NJVzd1t9BXSIC40gF7qmJTKsb9G+lqKWTYVtJIj8fQQ5MGs6TGVV4yKQGf2pL
 j0/q6e4A6MMvuLaancYI3X0mOvCr50Z88SyH3UptPQaXbqNd1B4tqw3ZA79jTMCRcx5GD2Acp
 kplEkzA86B9gzWG2EnAk8jH+SHKg1jltWuXzlwMM0Cu01dSdK0potUWFz9T5emWNkEU/S/Bsb
 HOa6d8uPH7UTkJ/1hOAxbj7j4mtzYQg7lWVMQk2TgcrseIIIiU5gOylwtWmCvTHzy0cfWKgfg
 qLjQiWDyfNFpoM9W70xLhzTV/XRxXdHbwoHD2o5k0bGubFvAd3JNHiQossiwz/ptZdgSBksGf
 igwcixSD8ug070TERh/bPPaMSkKtLwKwDDCIsc6Xk1SSRsDGnNv/Vef6+EDJTr2RU+Ri/q2te
 GfGzQUJ/63U5NSUTKki/xNah9TGqZrhUmzBljaxNBkHP4+0BsNgzhV5xZBILDOLZlNW75zhRC
 lKM2hiya7JwuPpf1Zfq6LlZkDaVLSxFDMBjQWGmMxo1OI=

Hi,

Am 06.03.24 um 18:07 schrieb Chen-Yu Tsai:
> On Thu, Mar 7, 2024 at 1:04=E2=80=AFAM Stefan Wahren <wahrenst@gmx.net> =
wrote:
>> Hi guys,
>>
>> Am 06.03.24 um 14:40 schrieb Chen-Yu Tsai:
>>> On Wed, Mar 6, 2024 at 8:57=E2=80=AFPM Linus Walleij <linus.walleij@li=
naro.org> wrote:
>>>> On Wed, Mar 6, 2024 at 9:55=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org>=
 wrote:
>>>>
>>>>> For the MediaTek device trees, the only two occurrences of "output-e=
nable"
>>>>> actually describe conflicting information:
>>>>>
>>>>>       pins-rts {
>>>>>               pinmux =3D <PINMUX_GPIO47__FUNC_URTS1>;
>>>>>               output-enable;
>>>>>       };
>>>>>
>>>>> The above asks for the UART function on this pin, but based on exist=
ing
>>>>> driver definitions, switches the function to GPIO output because of =
the
>>>>> "output-enable" property. Hence the confusion.
>>>> This is actually also driver-dependent.
>>>>
>>>> It is only conflicting if the pin controller has .strict set in struc=
t
>>>> pinmux_ops,
>>>> because many SoCs are perfectly capable of using a pin as a function
>>>> such as UART RTS and GPIO at *the same time*.
>>> I don't think MediaTek falls in this category. Nor does BCM2835. It is
>>> quite obvious, since GPIO in/out are selectable pinmux functions.
>>>
>>>> Details on strict mode can be found in Documentation/driver-api/pin-c=
ontrol.rst
>>>>
>>>> I don't know which Mediatek this is but:
>>>> $ git grep strict drivers/pinctrl/mediatek/
>>>> drivers/pinctrl/mediatek/pinctrl-moore.c:       .strict =3D true,
>>>>
>>>> Only the Moore family is strict, and I think BCM2835 is not.
>>> While that would be true for new drivers, I believe we do have many ex=
isting
>>> drivers that cannot set the strict bit, as existing device trees alrea=
dy
>>> have their pinctrl options selecting the GPIO function in conjunction =
with
>>> *-gpios usage. We also had this on older Allwinner platforms. We ended=
 up
>>> only setting the .strict option for new platforms, not because of any
>>> hardware difference, but because of backwards compatibility. Otherwise
>>> I would love to clean up many of them.
>>>
>>> In both MediaTek and BCM2835's cases, it is quite obvious from the dri=
ver
>>> that the hardware cannot use the pin as a dedicated function and a GPI=
O
>>> at the same time. And we should not give them more options to shoot
>>> themselves in the foot.
>> i tried following your discussion. Does it mean i should change anythin=
g
>> here in this series?
> I think support for PIN_CONFIG_INPUT_ENABLE and PIN_CONFIG_OUTPUT_ENABLE
> should be dropped from the series.
okay after applying this series pinconf-pins looks like this:

pin 31 (gpio31): input bias disabled
pin 32 (gpio32): input bias disabled
pin 33 (gpio33): input bias pull up (50000 ohms)
pin 34 (gpio34): input bias disabled
pin 35 (gpio35): input bias pull up (50000 ohms)
pin 36 (gpio36): input bias pull up (50000 ohms)
pin 37 (gpio37): input bias pull up (50000 ohms)
pin 38 (gpio38): input bias pull up (50000 ohms)
pin 39 (gpio39): input bias pull up (50000 ohms)
pin 40 (gpio40): input bias disabled
pin 41 (gpio41): input bias disabled
pin 42 (gpio42): input bias pull up (50000 ohms), output enabled, pin
output (0 level)

After dropping PIN_CONFIG_INPUT_ENABLE and PIN_CONFIG_OUTPUT_ENABLE it
looks like this:

pin 31 (gpio31): input bias disabled
pin 32 (gpio32): input bias disabled
pin 33 (gpio33): input bias pull up (50000 ohms)
pin 34 (gpio34): input bias disabled
pin 35 (gpio35): input bias pull up (50000 ohms)
pin 36 (gpio36): input bias pull up (50000 ohms)
pin 37 (gpio37): input bias pull up (50000 ohms)
pin 38 (gpio38): input bias pull up (50000 ohms)
pin 39 (gpio39): input bias pull up (50000 ohms)
pin 40 (gpio40): input bias disabled
pin 41 (gpio41): input bias disabled
pin 42 (gpio42): input bias pull up (50000 ohms), pin output (0 level)

In case anyone is fine with this, i will send v4.

Btw thanks for answering my questions from here [1] indirectly.

[1] -
https://lore.kernel.org/linux-gpio/102ae999-6574-4b14-a24b-826533b47a5d@gm=
x.net/
>
> ChenYu


