Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACF235DDC6
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2019 07:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbfGCFfz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Jul 2019 01:35:55 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:50437 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725999AbfGCFfz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Jul 2019 01:35:55 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 703D0886BF;
        Wed,  3 Jul 2019 17:35:52 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1562132152;
        bh=KQWnpm9RproF/VxwuhPLKuKDVgFcnFTyTJg/2G04uVU=;
        h=From:To:CC:Subject:Date;
        b=oDlYrGwv/RC5Kh5tAamwn7p9oZzOalNOh7k4C/TVa9ipax086Kl0F1vXzTnWO2K5z
         ffIp82w8FeBWli1zyTN5JFJJysTiKDs+FXmUARSw1mv5y+5n20MVigrRPK6FIOPLrR
         W/p9LhlIFjnKrrOQeel68boCCAzVRE/sVfjZbrVXKQbg7XXCj0eJmMGfLk7Opyy0I2
         kfcQiLrx0wAfQyvJT3nm6sGm6LZlY7MGPpGN48uMdKmcSaRsP8f7kRmH/fhmI9eGLK
         EtikRp4NpgfirpEjXXeewy5B25iTZjwhQESgdoG09HyAsBabB3q+zz1kPqi8gwd3BD
         X1JiP1Av+Fueg==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5d1c3eb70000>; Wed, 03 Jul 2019 17:35:51 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1156.6; Wed, 3 Jul 2019 17:35:47 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1156.000; Wed, 3 Jul 2019 17:35:47 +1200
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: gpio desc flags being lost
Thread-Topic: gpio desc flags being lost
Thread-Index: AQHVMWEqVhtjrKesFkiEOodI/qBrrg==
Date:   Wed, 3 Jul 2019 05:35:46 +0000
Message-ID: <d4724d7ec8ab4f95884ea947d9467e26@svr-chch-ex1.atlnz.lc>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:22:3a2c:4aff:fe70:2b02]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi LinusW, Bartosz,=0A=
=0A=
I was debugging something else and I noticed a problem with the gpio =0A=
framework or the gpio-mmio driver (or both) in 5.2.0-rc6.=0A=
=0A=
I have some gpio hogs in my device tree which seem to get requested at =0A=
startup as expected=0A=
=0A=
...=0A=
GPIO line 456 (sw-reset) hogged as output/low=0A=
GPIO line 459 (phy-1g-reset) hogged as output/low=0A=
GPIO line 460 (i2c-reset) hogged as output/low=0A=
GPIO line 461 (lm81-reset) hogged as output/low=0A=
GPIO line 462 (phy-led-reset) hogged as output/low=0A=
GPIO line 448 (pcie-reset) hogged as output/low=0A=
..=0A=
=0A=
I wanted to see what state these lines were in=0A=
=0A=
# cat /sys/kernel/debug/gpio=0A=
gpiochip4: GPIOs 448-455, parent: platform/fffa00029.dev-reset-ctl-2, =0A=
fffa00029.dev-reset-ctl-2:=0A=
=0A=
gpiochip3: GPIOs 456-463, parent: platform/fffa00020.dev-reset-ctl, =0A=
fffa00020.dev-reset-ctl:=0A=
=0A=
I expected the hogs to show up here.=0A=
=0A=
# echo 448 >/sys/class/gpio/export=0A=
=0A=
Now I'm pretty sure I shouldn't be allowed to do that.=0A=
=0A=
# cat /sys/kernel/debug/gpio=0A=
gpiochip4: GPIOs 448-455, parent: platform/fffa00029.dev-reset-ctl-2, =0A=
fffa00029.dev-reset-ctl-2:gpio-448 (                    |sysfs =0A=
     ) in  lo=0A=
=0A=
Doing a bit of debugging so far I see that after startup the desc->flags =
=0A=
for those gpios is 0. But for the hogged ones it should be 0x800 (or 0x801)=
.=0A=
=0A=
I happen to have a 4.8.17 kernel for the board I'm using. Testing with =0A=
that seems to be OK.=0A=
=0A=
[root@linuxbox ~]# uname -a=0A=
Linux linuxbox 4.8.17-at1+ #3 SMP Wed Jul 3 05:30:55 UTC 2019 ppc GNU/Linux=
=0A=
[root@linuxbox ~]# cat /sys/kernel/debug/gpio=0A=
gpiochip4: GPIOs 448-455, parent: platform/fffa00029.dev-reset-ctl-2, =0A=
fffa00029.dev-reset-ctl-2:=0A=
  gpio-448 (                    |pcie-reset          ) out lo=0A=
=0A=
gpiochip3: GPIOs 456-463, parent: platform/fffa00020.dev-reset-ctl, =0A=
fffa00020.dev-reset-ctl:=0A=
  gpio-456 (                    |sw-reset            ) out lo=0A=
  gpio-459 (                    |phy-1g-reset        ) out lo=0A=
  gpio-460 (                    |i2c-reset           ) out lo=0A=
  gpio-461 (                    |lm81-reset          ) out lo=0A=
  gpio-462 (                    |phy-led-reset       ) out lo=0A=
=0A=
[root@linuxbox ~]# echo 448 >/sys/class/gpio/export=0A=
sh: write error: Device or resource busy=0A=
=0A=
I'll do some proper bisecting tomorrow, but figured you might want to =0A=
know sooner rather than later.=0A=
