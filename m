Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0419CAB516
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2019 11:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730471AbfIFJqH convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Fri, 6 Sep 2019 05:46:07 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151]:41791 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730150AbfIFJqG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Sep 2019 05:46:06 -0400
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-104-eKY-JNlwMq6UlZLFLzlduw-1; Fri, 06 Sep 2019 10:46:02 +0100
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Fri, 6 Sep 2019 10:46:02 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Fri, 6 Sep 2019 10:46:02 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Alexandre Belloni' <alexandre.belloni@bootlin.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        "Claudiu.Beznea@microchip.com" <Claudiu.Beznea@microchip.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] pinctrl: at91-pio4: implement .get_multiple and
 .set_multiple
Thread-Topic: [PATCH v2] pinctrl: at91-pio4: implement .get_multiple and
 .set_multiple
Thread-Index: AQHVY/kRQYKuMyjlyU+DkxaSF5MIvaceWwkA///ylwCAABEjEA==
Date:   Fri, 6 Sep 2019 09:46:02 +0000
Message-ID: <b010053340ef48dfa244ff48c8decd38@AcuMS.aculab.com>
References: <20190905144849.24882-1-alexandre.belloni@bootlin.com>
 <2261eadf98584d13a490f2abd8777d4a@AcuMS.aculab.com>
 <20190906091212.GF21254@piout.net>
In-Reply-To: <20190906091212.GF21254@piout.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-MC-Unique: eKY-JNlwMq6UlZLFLzlduw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Alexandre Belloni
> Sent: 06 September 2019 10:12
> On 06/09/2019 09:05:36+0000, David Laight wrote:
> > From: Alexandre Belloni
> > > Implement .get_multiple and .set_multiple to allow reading or setting
> > > multiple pins simultaneously. Pins in the same bank will all be switched at
> > > the same time, improving synchronization and performances.
> >
> > Actually it won't 'improve synchronisation', instead it will lead to
> > random synchronisation errors and potential metastability if one
> > pin is used as a clock and another as data, or if the code is reading
> > a free-flowing counter.
> >
> 
> It does improve gpio switching synchronisation when they are in the same
> bank as it will remove the 250ns delay. Of course, if you need this
> delay between clk and data, then the consumer driver should ensure the
> delay is present.

With multiple requests the output pin changes will always be in the
same order and will be separated by (say) 250ns.
This is a guaranteed synchronisation.

If you change multiple pins with the same 'iowrite()' then the pins
will change at approximately the same time.
But the actual order will depend on internal device delays (which
may depend on the actual silicon and temperature).
You then have to take account of varying track lengths and the
target devices input stage properties before knowing which change
arrives first.
The delays might be sub-nanosecond, but they matter if you are
talking about synchronisation.

IIRC both SMBus and I2C now quote 0ns setup time.
Changing both clock and data with the same IOW isn't enough to
guarantee this.
(In practise the I2C setup time required by a device is probably
slightly negative (In order to support 0ns inputs) so a very small
-ve setup will (mostly) work.)

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

