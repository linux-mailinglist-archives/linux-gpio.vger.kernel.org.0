Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22C5E27BEE6
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 10:11:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727522AbgI2ILR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Tue, 29 Sep 2020 04:11:17 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151]:55567 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725306AbgI2ILR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 29 Sep 2020 04:11:17 -0400
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-15-klZI1fUZOxCa-iii21fDrA-1; Tue, 29 Sep 2020 09:10:11 +0100
X-MC-Unique: klZI1fUZOxCa-iii21fDrA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Tue, 29 Sep 2020 09:10:10 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Tue, 29 Sep 2020 09:10:10 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Joe Perches' <joe@perches.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Kent Gibson" <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: RE: [PATCH v2 1/9] lib: string_helpers: provide kfree_strarray()
Thread-Topic: [PATCH v2 1/9] lib: string_helpers: provide kfree_strarray()
Thread-Index: AQHWlbFc11/cqHtmU0iaxGR+buHrQql/RFkg
Date:   Tue, 29 Sep 2020 08:10:10 +0000
Message-ID: <3ba6779e11684ec8bc32638aa67ab952@AcuMS.aculab.com>
References: <20200928104155.7385-1-brgl@bgdev.pl>
         <20200928104155.7385-2-brgl@bgdev.pl>
         <2fcfd81f62ec87d9b75cca32468d8b9583faec47.camel@perches.com>
         <CAMRc=Mds0ccYBhRJnCQ0NEPkUpWRGtyX4FKj4+4rxN27_gfobA@mail.gmail.com>
 <12317bbc7712d96be8f52a3bf574e47628830191.camel@perches.com>
In-Reply-To: <12317bbc7712d96be8f52a3bf574e47628830191.camel@perches.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Joe Perches
> Sent: 28 September 2020 17:07
> 
> On Mon, 2020-09-28 at 18:02 +0200, Bartosz Golaszewski wrote:
> > On Mon, Sep 28, 2020 at 5:59 PM Joe Perches <joe@perches.com> wrote:
> > > On Mon, 2020-09-28 at 12:41 +0200, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > >
> > > > There's a common pattern of dynamically allocating an array of char
> > > > pointers and then also dynamically allocating each string in this
> > > > array. Provide a helper for freeing such a string array with one call.
> > >
> > > Isn't this also common for things like ring buffers?
> > > Why limit this to char *[]?
> > >
> >
> > I don't want to add APIs nobody is using. What do you suggest?
> 
> Change the argument to void** and call it
> 
> void kfree_array(void **array, int count);

Does help, void doesn't work that way.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

