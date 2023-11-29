Return-Path: <linux-gpio+bounces-689-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E417E7FDAC6
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 16:07:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 944BA2828C5
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 15:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40CC437175;
	Wed, 29 Nov 2023 15:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="b7dpdCNs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D5D7A3;
	Wed, 29 Nov 2023 07:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1701270447; x=1701875247; i=wahrenst@gmx.net;
	bh=irMeSr38zXyjdA5mMhu/UGsBpjsTP9fUQyrG/iSRAto=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=b7dpdCNsQzKaVyiyPfAS3rS7V8X3Rsrj1duz0+rrIsVysitcM/4eIFg+HHslZfVg
	 XSSpLJS8KyPUWnUn6O+GkSuqZv1Cvopp7LAGu41iEkBLGsSuAMaFQ1izEzloR+xzv
	 cFimLk3qxP72RVO6d2dRXxrkC9JJ7eJxj6ekRJHAmIJmNBkWcsUWINk/ivNJJHQtz
	 8S3HPNIvwwICjsJGPZ44HNxqVc2npaXNIVSc3zjSGg2rSTJ2ydkEAD4RyW6dlV0f5
	 hnevmpwwsGn6iSiIqw5GJ6D4sXpw1/gx3nMbPl2LYiZMHN6Dq74XVGWfU6Z7hixui
	 wv1tdS0FqhpwqxyZKQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.130] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N5mGB-1rN1O82iDr-017E2F; Wed, 29
 Nov 2023 16:07:27 +0100
Message-ID: <e1b03c55-da80-4e8d-a445-e14b57b1966e@gmx.net>
Date: Wed, 29 Nov 2023 16:07:26 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/2] leds: gpio: Add kernel log if
 devm_fwnode_gpiod_get fails
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Pavel Machek
 <pavel@ucw.cz>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Lee Jones <lee@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-leds@vger.kernel.org
References: <20231118124252.14838-1-wahrenst@gmx.net>
 <20231118124252.14838-2-wahrenst@gmx.net>
 <ZVtHZWYl2skpn1Bg@smile.fi.intel.com>
 <9a9486bb-e737-4384-a581-76880b709758@gmx.net>
 <ZVtS4phUMmDD9ztz@smile.fi.intel.com>
 <CAMRc=MdpegfNrjWkeGSh8NhT_Go+q5MxueASxrLo18XBJaBsjA@mail.gmail.com>
 <CACRpkdZuJqEA06NDneNFwjgj=u0Nm+yKCEd3VyJkMyZ1mLxQsA@mail.gmail.com>
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <CACRpkdZuJqEA06NDneNFwjgj=u0Nm+yKCEd3VyJkMyZ1mLxQsA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:exGeobytONeHW0P2JL6SSVsZgrK/4FUUgTaFAigkq8T1pjWKkTk
 4Z8xuNGWujs2jJkU9pRIrZ/IYtALhuHujgI2U27zvCXzpGsq8ex25EQ9ZShaXNFdrNZURAd
 lds67Q6WBmNBDkVkl5UDxYdjhLr1xEDOIPEYCPE/Qrw+DUQ/hU9SpRqO3LGYktjH9ku2Eah
 b3eqQPFWdzqxt5BuZYrcA==
UI-OutboundReport: notjunk:1;M01:P0:BS05bT28Qaw=;M+GoIurTPvBzq6QT2gNrdtTIl2o
 D8owlI9dlFmOr0xmOfss021yG7eX+rhRG+OD5Ox+VwF21NnXygVMQyOJF39NMUcs50CSodjqd
 +D6zGezSY7kdWoalIvn3Uw1HMMWgB+qPbhiDT+gIdgdQrDZP0Q0adO/3i8GVXcVQm6NjPBtdd
 Bh7u3WnJqgpoWlO9JXabF9zInkCcfjaLAXvcUvhyba/ZdsMEKTwnVd4fYrGdrEoKzneuaI0sQ
 pVSAZ4sc60n/TuOW1ZK8qxE1n+A0ENeg9yCS++sPoPLJaPHk7lgT1o35RsljExyDuAuxdN3FJ
 8XY0MRFfd/xXMcWtN/d5woLB9L8OX3dyAPks5OtQ6pccEUwym+l2lLpuPGq5ERUhOLuktfOyL
 qtl0sYtCK1Cg5jG5CbcyLDntyGgxJtAzYIgNAUcsdzEUt/MtQ9MDBEnHaCOId4PbjjSYyzFOL
 ZgMehAfrMonRm55VudkhJrVTCfqVBjc88RGRanYpYxHF9aDKToHnbD0SmRnVKh0dY8jwqAOXN
 OP7Ec4RtMe4tPyu8IgZ8XNZpDcRKHIjZ+s0PTUqmN/jfLDPU8/HcqVQ8NQkMToz2AoYraMP8/
 Q/ncAJ9xLg7bb6t+OY0nhVLrn3qBDt+pQ7lZot8KVJ9fImgwjdSa6K7kC1zhSB0vSXQS/S4kR
 h71hRVmXZaeQwIDV6B9293/fmuFV7VxQhmwZWsCGtLimtlQF6qurnXIziXF1NtWkP4D43kf51
 +IOq+KdHwGiFSou0fB8Ixhiw9JQtxasHFIppVhrbSKX2zCaD64CEk4m4F5gTmtMmrJbJnqqRF
 A+7Q/nb11ggBji4beePZqG/57kcVJXsKaFaIHlXCO0ftBg90fwLqIXH9atKaxc5kZ56/U4GG5
 5gwJZ4Jwy/Njfe28pRoQL0Tip1ROwQSpMTmDZMnXW/QSafY4P3chCSyA7Nk9MVM7DHW4YM+0V
 vh4DUearCBOzL+UyiUWzMzZ1R58=

Am 29.11.23 um 15:03 schrieb Linus Walleij:
> On Wed, Nov 22, 2023 at 11:53=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev=
.pl> wrote:
>
>>>> I cannot remember that i saw any of them on info level in my case of =
an
>>>> already allocated pin (see patch 2).
>>>>
>>>> I'm open to place the log within gpiolib, if this a better place.
>>> I'm not sure, let's hear GPIO maintainers for that.
>> Hard to tell which method is preferred among all the subsystems.
>> Personally I'm more inclined towards letting drivers decide whether to
>> emit an error message and only emit our own when an error cannot be
>> propagated down the stack.
>>
>> Linus: Any thoughts?
> I never managed to get it right so I can't give any good advice.
>
> Usually I tend to think better one more error message than one too littl=
e.
>
> Then again I'm a dmesg maximalist who just want it to scroll on forever
> also with positive messages...
Okay, based on the feedback this sounds like nobody is against this patch?
>
> Yours,
> Linus Walleij
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


