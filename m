Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B42505EE8C
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2019 23:30:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbfGCVaz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Jul 2019 17:30:55 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:51131 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726902AbfGCVaz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Jul 2019 17:30:55 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 91366886BF;
        Thu,  4 Jul 2019 09:30:53 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1562189453;
        bh=1L1sB9h+79NdmQLMdwPjbfag8Y1xUTAYaNEw33rFiZI=;
        h=From:To:CC:Subject:Date:References;
        b=wtXWiip2DUI7Ot83NkMWRf5xL6PKzLb46Ef3+Hy47vNeWbY4j5LWGdUOu/LTGxBBE
         DtjD401hLKopVFc/PiJ4vpWYQFNExSU7ZC9F+10SxnMNSGKIAgaYQBRd4MWZKl05wL
         xJZUHhNOOQHU6Cy061gSUlMCjCzUsdu7hOPLcD9ZOrPMneudthcrnfpA0nJpGN+h7B
         map2n2/YxJM7hjW0xrRkh3N+FouogNHRhEruIBIMqOKiztar2IulxFsHSmMW8sFoZ0
         yc8281N1OzD/J5xC7XyVpR/SwhRt7OJ/VBqTeWT0ZTGB+/8YMAF1agROSXY6sBt4Yi
         pFk21uKLteOJg==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5d1d1e8e0000>; Thu, 04 Jul 2019 09:30:54 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1156.6; Thu, 4 Jul 2019 09:30:50 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1156.000; Thu, 4 Jul 2019 09:30:50 +1200
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: gpio desc flags being lost
Thread-Topic: gpio desc flags being lost
Thread-Index: AQHVMWEqVhtjrKesFkiEOodI/qBrrg==
Date:   Wed, 3 Jul 2019 21:30:50 +0000
Message-ID: <755abbb5b984414a966367c323f62e59@svr-chch-ex1.atlnz.lc>
References: <d4724d7ec8ab4f95884ea947d9467e26@svr-chch-ex1.atlnz.lc>
 <CACRpkdZD7x1eeatXRTtU5k7Zoj5tfG8V98SjaO=xubwaa9teTQ@mail.gmail.com>
 <f9eb3387ed384676b0b298e4da7eeaf0@svr-chch-ex1.atlnz.lc>
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

On 3/07/19 9:29 PM, Chris Packham wrote:=0A=
> On 3/07/19 6:28 PM, Linus Walleij wrote:=0A=
>> On Wed, Jul 3, 2019 at 7:35 AM Chris Packham=0A=
>> <Chris.Packham@alliedtelesis.co.nz> wrote:=0A=
>>=0A=
>>> Doing a bit of debugging so far I see that after startup the desc->flag=
s=0A=
>>> for those gpios is 0. But for the hogged ones it should be 0x800 (or 0x=
801).=0A=
>>=0A=
>> Yeah that is wrong.=0A=
>>=0A=
>>> I'll do some proper bisecting tomorrow, but figured you might want to=
=0A=
>>> know sooner rather than later.=0A=
>>=0A=
>> Thanks, I have another critical GPIO fix queued so would be great if we=
=0A=
>> can fix this too before v5.2 is released.=0A=
> =0A=
> Bit of an update. v4.19.54 works, v5.1.15 is broken. I'll keep bisecting=
=0A=
> between those tomorrow.=0A=
> =0A=
=0A=
The problem is caused by commit 3edfb7bd76bd1cba ("gpiolib: Show correct =
=0A=
direction from the beginning"). I'll see if I can whip up a patch to fix it=
.=0A=
