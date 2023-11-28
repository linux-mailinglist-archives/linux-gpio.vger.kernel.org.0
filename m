Return-Path: <linux-gpio+bounces-599-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0894F7FC01A
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 18:16:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF40C282A02
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 17:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E73F85B5B8;
	Tue, 28 Nov 2023 17:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="JO6moXBa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17D2E10EC;
	Tue, 28 Nov 2023 09:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1701191747; x=1701796547; i=wahrenst@gmx.net;
	bh=maOiArq4lqAX4+xV7TPj1wR2WBNTVksblNESsIfRoYs=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=JO6moXBaS6SH9G3V9DptSvR4tGJvqUlOZFkmVOOgTN4rOUI741S0JWm/VPjwt0Tb
	 gSCexjhgxnDc8It8asyJlyLWWXMdekdvW22Gkhnw3D5wK7rRb6Ud5Kpu9/DlNi4VI
	 PqxQQj5bICaEtvfBPmQOGQIY4S+9lmX8c+HDla1TmEz7tDXkE57pVSx6wtbGzWOuy
	 qYKE5yo7SqQR/s1klYs+3thVmalx8ynzXGkG8ABWVTCWI98jvNHCSYMW2jhiHzqrq
	 zRGrpS9hkdQtgHGg4ysLVSzmf3eIja+f8KKkUP70IgtqrdefKmKaV/XLmSL5cg5Bj
	 KOfStFd24h3mfIJrPQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.129] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N6KYl-1rNtpC3Sm1-016bwg; Tue, 28
 Nov 2023 18:15:47 +0100
Message-ID: <ea5cd81f-2488-49ad-96fe-732bdb75bcb7@gmx.net>
Date: Tue, 28 Nov 2023 18:15:46 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/2] leds: gpio: Add kernel log if
 devm_fwnode_gpiod_get fails
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Pavel Machek
 <pavel@ucw.cz>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Lee Jones <lee@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-leds@vger.kernel.org
References: <20231118124252.14838-1-wahrenst@gmx.net>
 <20231118124252.14838-2-wahrenst@gmx.net>
 <ZVtHZWYl2skpn1Bg@smile.fi.intel.com>
 <9a9486bb-e737-4384-a581-76880b709758@gmx.net>
 <ZVtS4phUMmDD9ztz@smile.fi.intel.com>
 <CAMRc=MdpegfNrjWkeGSh8NhT_Go+q5MxueASxrLo18XBJaBsjA@mail.gmail.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <CAMRc=MdpegfNrjWkeGSh8NhT_Go+q5MxueASxrLo18XBJaBsjA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4m4QEg+I8vyFzRjFrJ62aPz6bOgv4kPcQxcJ7XjhW+1Ptj1Yi/2
 2HtKVcCUKOmjBhQOjnhiV7J75ioDY3YL0bYk3cJfNcuRhwrG4gMaD6/dWO8MAgvsMSp6bu0
 UYStDiCogEzJ7gjugb+enlpsrDmCNq8H8LKytEwAXzKEIZrM9bcZ7yDPmUI6DYRFj51isH+
 yNxyEv4KDJd7uA0J4sDEg==
UI-OutboundReport: notjunk:1;M01:P0:TKb5+phzamk=;BBTxx7m7CQdViNihSrf/HaX1Bs5
 6EuigWbKXvlYF/sUbpdYbaa9/hxk6HgFwewb0PxFxX4jU76loPoNnCCbf1sh34FA6MUZAKE0J
 5C50707VTbvNQS+KjYwkgcHHZGevsvxyEaIi6Xc/hI0IZGuc9ZiMqhFe+Lu0xbLnUsnEt22Wt
 ejzxUPQvqoecVcst012iOEO1H8VztjvgnxywMUtJi+TnOS1/m8HKCTBBnKqW/qshNydG9A2eL
 eCDvoU1WqY4eiCCP3wJDDqIt/3JQLV6YI8o3aQbr9Yj5NQ3LJBBxa5IBBh995nP7Kwi6vV3Ws
 m5LzrmvdCWK26Zgo45w3iR+PUOq+OJE+HdEuc8GAQDj3SeXD+v6Gn2UlhNXaIqPekxExghSeV
 Ct+xR1SoF5wj6owEmKSilUJqHLR5wBlI67RSXGPs7UFWinl/BghUA4JU485FNS0UEAR1RLmmZ
 exAwFVfQ3+t2wUsO0R2jBKpnUeRB7FZs/0MlwR4TSZabD1CF1GZ5bwDmFTjH3FS6JozuPSm5c
 CSp5IwBZCtZcur2S1NxQncZOyj4PX7NMbWUSgy0fOYFxlAomdcwo+mjcmKPciClfj9ca3QEtM
 +cybXr/Bm6Ojhrf3g5y4+NMyX8sN3Vg1Ic3cO02MyoLOpVSmbGQWoiK71NKF0gu64D7uVS+4d
 G+DW5vN5AhCZQOnlgCYYM6FA1LW+d8KxQkRXNp2ENRYlrC5PQy3H4AShPRAkAgiuSFPGRr9Bq
 UtGyCVFaRDGFOQUgoIdQsVHoFcekPjQ8Rhzggk52agmoqGnom93u5FkhbX8wlll4a4Lovg+AI
 JPVu8b638rb28SY1E5RsBIM5q0jGeFS1yi3xOmrfXidGWDjp0iTZaTm+W2h9rYpAww5Ugeqz+
 IrSjtAAM7VSSwWndJCNCiBehJMOygPyvrL7OXpx44F9JKDAqidI/Q1v8sERL6EryUtCAoN4GH
 yEayVMXnAdngDfqAnPdGI1BmhVQ=

Am 22.11.23 um 11:52 schrieb Bartosz Golaszewski:
> On Mon, Nov 20, 2023 at 1:36=E2=80=AFPM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
>> On Mon, Nov 20, 2023 at 01:02:55PM +0100, Stefan Wahren wrote:
>>> Am 20.11.23 um 12:47 schrieb Andy Shevchenko:
>>>> On Sat, Nov 18, 2023 at 01:42:51PM +0100, Stefan Wahren wrote:
>>>>> In case leds-gpio fails to get the GPIO from the DT (e.g. the GPIO i=
s
>>>>> already requested) the driver doesn't provide any helpful error log:
>>>>>
>>>>>       leds-gpio: probe of leds failed with error -16
>>>>>
>>>>> So add a new error log in case devm_fwnode_gpiod_get() fails.
>> ...
>>
>>>>>                    led.gpiod =3D devm_fwnode_gpiod_get(dev, child, N=
ULL, GPIOD_ASIS,
>>>>>                                                      NULL);
>>>>>                    if (IS_ERR(led.gpiod)) {
>>>>> +                 dev_err_probe(dev, PTR_ERR(led.gpiod), "Failed to =
get gpio '%pfw'\n",
>>>>> +                               child);
>>>>>                            fwnode_handle_put(child);
>>>>>                            return ERR_CAST(led.gpiod);
>>>>>                    }
>>>> Thinking more about it. GPIO library already issues bunch of messages=
.
>>>>
>>>>      "using DT ... for ... GPIO lookup"
>>>>      "using lookup tables for GPIO lookup"
>>>>      "No GPIO consumer ... found"
>>> are these errors or debug messages?
>> Indeed they are on debug level.
>>
>>> I cannot remember that i saw any of them on info level in my case of a=
n
>>> already allocated pin (see patch 2).
>>>
>>> I'm open to place the log within gpiolib, if this a better place.
>> I'm not sure, let's hear GPIO maintainers for that.
>>
> Hard to tell which method is preferred among all the subsystems.
> Personally I'm more inclined towards letting drivers decide whether to
> emit an error message and only emit our own when an error cannot be
> propagated down the stack.
>
> Linus: Any thoughts?
gentle ping ...
>
> Bart
>
>>>> Isn't it enough?
>> --
>> With Best Regards,
>> Andy Shevchenko
>>
>>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


