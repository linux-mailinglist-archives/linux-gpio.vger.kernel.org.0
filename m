Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A336D33BFC2
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 16:32:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbhCOPbn convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Mon, 15 Mar 2021 11:31:43 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:31963 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231777AbhCOPbh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Mar 2021 11:31:37 -0400
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-267-YYshquLuNiyLYx0KEZ2_ng-1; Mon, 15 Mar 2021 15:31:34 +0000
X-MC-Unique: YYshquLuNiyLYx0KEZ2_ng-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Mon, 15 Mar 2021 15:31:27 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.012; Mon, 15 Mar 2021 15:31:27 +0000
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Bartosz Golaszewski' <brgl@bgdev.pl>,
        Joel Becker <jlbec@evilplan.org>,
        Christoph Hellwig <hch@lst.de>, Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: RE: [PATCH v5 02/11] configfs: use (1UL << bit) for internal flags
Thread-Topic: [PATCH v5 02/11] configfs: use (1UL << bit) for internal flags
Thread-Index: AQHXGXuz8CFTZTXyV0K3e3EZ1vnDeKqFLTtg
Date:   Mon, 15 Mar 2021 15:31:27 +0000
Message-ID: <6bc83972093a4be4ad163069a437ec25@AcuMS.aculab.com>
References: <20210315091400.13772-1-brgl@bgdev.pl>
 <20210315091400.13772-3-brgl@bgdev.pl>
In-Reply-To: <20210315091400.13772-3-brgl@bgdev.pl>
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

From: Bartosz Golaszewski
> Sent: 15 March 2021 09:14
> 
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> For better readability and maintenance: use the (1UL << bit) for flag
> definitions.

If the values ever get printed in hex the hex definitions are
actually more useful.

	David

...
> -#define CONFIGFS_ROOT		0x0001
> -#define CONFIGFS_DIR		0x0002
> -#define CONFIGFS_ITEM_ATTR	0x0004
> -#define CONFIGFS_ITEM_BIN_ATTR	0x0008
> -#define CONFIGFS_ITEM_LINK	0x0020
> -#define CONFIGFS_USET_DIR	0x0040
> -#define CONFIGFS_USET_DEFAULT	0x0080
> -#define CONFIGFS_USET_DROPPING	0x0100
> -#define CONFIGFS_USET_IN_MKDIR	0x0200
> -#define CONFIGFS_USET_CREATING	0x0400
> +#define CONFIGFS_ROOT			(1UL << 0)
> +#define CONFIGFS_DIR			(1UL << 1)
> +#define CONFIGFS_ITEM_ATTR		(1UL << 2)
> +#define CONFIGFS_ITEM_BIN_ATTR		(1UL << 3)
> +#define CONFIGFS_ITEM_LINK		(1UL << 5)
> +#define CONFIGFS_USET_DIR		(1UL << 6)
> +#define CONFIGFS_USET_DEFAULT		(1UL << 7)
> +#define CONFIGFS_USET_DROPPING		(1UL << 8)
> +#define CONFIGFS_USET_IN_MKDIR		(1UL << 9)
> +#define CONFIGFS_USET_CREATING		(1UL << 10)
>  #define CONFIGFS_NOT_PINNED	(CONFIGFS_ITEM_ATTR | CONFIGFS_ITEM_BIN_ATTR)
> 
>  extern struct mutex configfs_symlink_mutex;
> --
> 2.30.1

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

