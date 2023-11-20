Return-Path: <linux-gpio+bounces-258-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7597F12A9
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Nov 2023 13:03:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EF11DB218CF
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Nov 2023 12:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75A1C18E13;
	Mon, 20 Nov 2023 12:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="gdPqkOK3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EA3BBF;
	Mon, 20 Nov 2023 04:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1700481777; x=1701086577; i=wahrenst@gmx.net;
	bh=lPikvAohimy1dSHPluE2q/1Z94w/HsRqmEECLrKEo3c=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=gdPqkOK3uiKMNRq8OncJaPSDJvy5Nf1DYVuokA5evH5Wz06vdJUq0WzhqjgxLo1O
	 TsYfWUS86Z2Ij7LpPp1OgculEABCqlt6RK/+Gmlk8V8q1DKEH71cpx1ik0GMuaHrW
	 FwI/T0rsLXvW3OTMhb6rowgdvN7mUJ8X7eW9nNwNEgI2rIntusdNs24H5+UxWJuiO
	 KE30RJXSdEq1RUjeAl6T2Fac1WmKCMy/oQaRJpoXNE4SHoz/5v6BE1BckrCROff1K
	 z+e+F3zVDQiJzCE32UGZxghwotbz38aQ0aAC1/u4TlfqC/+OfPCuY6o2vbseHHFK+
	 bqdsQ77b0kjRhdXanQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.129] ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M3DJv-1r3fY42Dan-003fYq; Mon, 20
 Nov 2023 13:02:57 +0100
Message-ID: <9a9486bb-e737-4384-a581-76880b709758@gmx.net>
Date: Mon, 20 Nov 2023 13:02:55 +0100
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
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
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
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <ZVtHZWYl2skpn1Bg@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NMx7PRoIVqlTzKI7DmALenSvzuITMSnng7DJT8UOnVH0VLpUmqg
 0GD0m7TWZqbsPf00w9iG1BOu8Db5+EPzYYYwiSiCohDfdeI9cE16iYjqI6lW0zRzHBtWPBj
 sUQORWCDdQyFfWBTO5HE6guPP1UZvCgLtc+QzMyqzWh7TU1L3ibw/ar4sIQdK6pnACEW90H
 BkgzoaQoo0CKwgGSRNO5A==
UI-OutboundReport: notjunk:1;M01:P0:q7k+jXuJ7/E=;v/hw01ByB9p1cWOW66ofI3kedUP
 JwO7NdmofqvolxUe9v0Kunbhfc7qXWhXYDTCNOqEmHPAx0BpfzQ13NZ53JncoukAIZqh6avhI
 ejiTYa4wYvcs2ZdikAkRkenOUp6FpxksRCXZGDu/LRr9CgzLY6ZJs5hzLBsUcH9rE8ygeYfln
 y7frDQRFHoyhK1IV3Dn1IT/7K4oaGKgJoIg+Eu25Wf+q39WDxZSQedOGTbYVOg84xKAZelxlq
 R4HtmWmhnjKsaKj0LHVpBuazwjvbTTd7mEj/9FPFZUaoE0LJ0SDsMPlldcbkZZMAjEYifN8od
 adU6l4nizZrCH/IWhEpBHRSLRMXgl7Drxz9erdVt4c6fZiCSdPujkmLlIdrkV23IgfHE8yfKC
 8VBbJzXU1WcBMmxN0A40nZsvImcGexM6Fpfqy0saoPcmseF2BTgbl7h/oFyUWuYBYXSeRdwXV
 k3IvXppqRkWz8Fk24kQJ+JlnoFgmVfL0VBVw+bimbkvJHQD62/IyMBAoPYDvdJYOFpENCl5Eq
 /K3FjLkWRwZ61nt4ga0Jr004vId65zjlQVQFvhyeFTPmK4Xdi3F7qs4EvXE3fc3+gYe+W9KlP
 1/1nAxMZf9mHZeCJ9Zsh+16wFOnYVr6XCeLyyX9KewbP/4QRMtE6kpqzwhZ2P6LeVaXRNckKV
 noYfD9yDRo1gkt6QTWn9g7WPZpnaLZZ6hmhGqoBTh/KGVDHCcW6OO8/0qN8TiZpnvrSGTgOzf
 5PpBOPj53s6v1TFxfhMdgmOOwJFRYLEgdDuLXlcSH+0sEsWAtyitiFlz0Puh5LS3as2s4kwYv
 LqZJUm8YOwRsJfArPd2XS9Rat62HSDA+rt44cfKsaAPalLIJiSeYnpJMn2e17C4ra+zlut9ha
 kREk47lEnVBEu0eQ87Kv7narDh1YSzii1xDz0Ks+nSZPevSIDaFYwx51KM37dfsLXJVFiZW0o
 2e8vHQ==

Hi Andy,

[add Linus and Bartosz]

Am 20.11.23 um 12:47 schrieb Andy Shevchenko:
> On Sat, Nov 18, 2023 at 01:42:51PM +0100, Stefan Wahren wrote:
>> In case leds-gpio fails to get the GPIO from the DT (e.g. the GPIO is
>> already requested) the driver doesn't provide any helpful error log:
>>
>>      leds-gpio: probe of leds failed with error -16
>>
>> So add a new error log in case devm_fwnode_gpiod_get() fails.
> ...
>
>>   		led.gpiod =3D devm_fwnode_gpiod_get(dev, child, NULL, GPIOD_ASIS,
>>   						  NULL);
>>   		if (IS_ERR(led.gpiod)) {
>> +			dev_err_probe(dev, PTR_ERR(led.gpiod), "Failed to get gpio '%pfw'\n=
",
>> +				      child);
>>   			fwnode_handle_put(child);
>>   			return ERR_CAST(led.gpiod);
>>   		}
> Thinking more about it. GPIO library already issues bunch of messages.
>
> 	"using DT ... for ... GPIO lookup"
> 	"using lookup tables for GPIO lookup"
> 	"No GPIO consumer ... found"
are these errors or debug messages?

I cannot remember that i saw any of them on info level in my case of an
already allocated pin (see patch 2).

I'm open to place the log within gpiolib, if this a better place.

Best regards
>
> Isn't it enough?
>


