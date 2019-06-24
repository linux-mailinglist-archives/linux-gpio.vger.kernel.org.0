Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6DCB50934
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2019 12:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729177AbfFXKvg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jun 2019 06:51:36 -0400
Received: from mout.web.de ([212.227.15.14]:48183 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726960AbfFXKvg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 24 Jun 2019 06:51:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1561373475;
        bh=va9X6BekHg4ryvxfPgkOEdcMF+Bqg1ca0r0893l0PBY=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=Uu22pwaN4+5xknNs7InlX0w2gHMPwIByLFOJSKrNGgeC0Xp6jiX3cUSMWKZGJ2yRy
         sxlre9Zr6XNHA57Jlh2cA4Kx1e7qf5bd3h2U+nzWckvTOUcSznUrawVDym/JMdRWvO
         y8JUscKuJ1oidyBv2DUX2XNk5gFQ9ijxAP3qpLEk=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.148.79]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MZDki-1i0KIZ2CD6-00KyK0; Mon, 24
 Jun 2019 12:51:15 +0200
Subject: Re: [PATCH] drivers: Adjust scope for CONFIG_HAS_IOMEM before
 devm_platform_ioremap_resource()
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        kernel-janitors@vger.kernel.org
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Enrico Weigelt <lkml@metux.net>
References: <20190221162627.3476-1-brgl@bgdev.pl>
 <9efcbce2-4d49-7197-a3d8-0e83850892d5@web.de>
 <CAMpxmJX-wXQ-ff1RWkPmJBWSsP_v2MjZrA3fhj3HQX0_zM0eZA@mail.gmail.com>
From:   Markus Elfring <Markus.Elfring@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <a2c9c7f2-0efb-e56c-517e-f5c3fda4ee92@web.de>
Date:   Mon, 24 Jun 2019 12:51:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAMpxmJX-wXQ-ff1RWkPmJBWSsP_v2MjZrA3fhj3HQX0_zM0eZA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SqOgSxHrt6dq/y7gRUAEPzZElRsr/T3ememjHK+/oMkPS6lp/SD
 OuFWPYvagOXRFzVT6ybVuJ2YO9n6udB1QHqlSQ+CCXF09AHN4kctBunIBgftYpQafUhUBD6
 fE7I3bsF9guCqsNR3NoBbajjXsKwYCjPLe5bryRHdXLmjwil44gBAuaR39ONUC+N+RZtvtf
 TvIilNX2vfl6wODwrYjYA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+QnH5MqNw/4=:dezmi0lf2NjALPJGln6okK
 10jMxBREH57lkYP6zkZ3ht84U8xpsQa4wVju7lMSa3xeap2ceZYpZeoRg9zNSz31F97JhROK+
 cdnM8hmF35Ead7lnSxAasH8rlVMKsANzeTXSGZAqTAuuW3gGgD8Dn/HeX/rmrs6+J6EfJGmyF
 By3X/D+KfMHqZOSL5J54qiyCYHF7i24dOCkCBX+omT8URUE0fmAtsnfz/A0c+mlfg9UxNAAt9
 AIbzjFng0FIJ5tf3N2FYQeLON2IWfiCBncQi34oHXDkJS2Zvgw9Ue7eNfWNQdyRWGBcWVBa4C
 YbdtPHleHsxVV9pMV1qGCW6TDnFONgFB4RF0eTez13JIDS/37CcYUpg/Axe28CdRAog9RvjLR
 E75V0y52GypbB/1rRLMrgBnlSPCe047NDdY3+zPKVJ8o1gAQ31rbouzvpxQLvlM22M/tNsb3l
 JFm6Jf00eflT59JIAqXhXBHAonshsFGkW0XaaQvSBWddrH2lOHodVwzeCF+pGqRNEe6aPorNJ
 NH3zeboLYV+AYvc98SePtOWF2FHT4hXCLH9DnzDdUIBbhLsqRTpNVKpsN3NJl51ODD9QIxpej
 wzX8VkRlKivnoFHpKPMSpNdgMeGGX+JpJb/E6QIZdYMqYpiOsX4u7AywsByLfarifLDhjyrRG
 eCVm0uUZiWzS6821BMigVm3whac61LQtFvdnTh4+MncsLXezgEp0CNHw67hxmBoaGBQ3SQIdq
 FHd0CnA3RDVCZON/0Zac6t2W0y32Xo0FSqsynDSPEZiZV1EklhkMWDNU5pbWhoEuTWiSg19a1
 FytcGQkpeGKYXdgZ6Vaj1w8FNwCuS1SXirv1UKDL23UTlv63WjHI7GdG/TiX7nh71mOUo9MOS
 LA6NBdc+ncywss3SE8l1tO+8meFkg+kRxBQhjB7STBrNragCusS9L2IU+IE3qYvVINfok2rey
 ojJwaeY8ydHE0uPnCEd9U4Xp6Q+wakpp5dq4zf/OzVyfKg2M0PYEy
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

>> +++ b/drivers/base/platform.c
>> @@ -78,6 +78,7 @@ struct resource *platform_get_resource(struct platfor=
m_device *dev,
>>         return NULL;
>>  }
>>  EXPORT_SYMBOL_GPL(platform_get_resource);
>> +#ifdef CONFIG_HAS_IOMEM
>>
>>  /**
>>   * devm_platform_ioremap_resource - call devm_ioremap_resource() for a=
 platform
>> @@ -87,7 +88,6 @@ EXPORT_SYMBOL_GPL(platform_get_resource);
>>   *        resource management
>>   * @index: resource index
>>   */
>> -#ifdef CONFIG_HAS_IOMEM
>>  void __iomem *devm_platform_ioremap_resource(struct platform_device *p=
dev,
>>                                              unsigned int index)
>>  {
=E2=80=A6
> And what is the purpose of that?

I recommend to let the availability of additional documentation for this f=
unction
depend also on the mentioned preprocessor symbol

Regards,
Markus
