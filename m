Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC784AB492
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2019 11:05:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388932AbfIFJFl convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Fri, 6 Sep 2019 05:05:41 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([146.101.78.151]:37363 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388545AbfIFJFl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Sep 2019 05:05:41 -0400
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-39-q--cHczUMTKFUx84CmEraQ-1; Fri, 06 Sep 2019 10:05:37 +0100
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Fri, 6 Sep 2019 10:05:36 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Fri, 6 Sep 2019 10:05:36 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Alexandre Belloni' <alexandre.belloni@bootlin.com>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     Ludovic Desroches <ludovic.desroches@microchip.com>,
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
Thread-Index: AQHVY/kRQYKuMyjlyU+DkxaSF5MIvaceWwkA
Date:   Fri, 6 Sep 2019 09:05:36 +0000
Message-ID: <2261eadf98584d13a490f2abd8777d4a@AcuMS.aculab.com>
References: <20190905144849.24882-1-alexandre.belloni@bootlin.com>
In-Reply-To: <20190905144849.24882-1-alexandre.belloni@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-MC-Unique: q--cHczUMTKFUx84CmEraQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Alexandre Belloni
> Implement .get_multiple and .set_multiple to allow reading or setting
> multiple pins simultaneously. Pins in the same bank will all be switched at
> the same time, improving synchronization and performances.

Actually it won't 'improve synchronisation', instead it will lead to
random synchronisation errors and potential metastability if one
pin is used as a clock and another as data, or if the code is reading
a free-flowing counter.

It will improve performance though.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

