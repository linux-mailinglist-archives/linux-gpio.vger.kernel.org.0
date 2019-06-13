Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D49F43802
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2019 17:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732518AbfFMPCx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Jun 2019 11:02:53 -0400
Received: from relay1.mentorg.com ([192.94.38.131]:39766 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732502AbfFMPCo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Jun 2019 11:02:44 -0400
Received: from nat-ies.mentorg.com ([192.94.31.2] helo=svr-ies-mbx-01.mgc.mentorg.com)
        by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
        id 1hbRFP-0002du-5s from Harish_Kandiga@mentor.com ; Thu, 13 Jun 2019 08:02:39 -0700
Received: from [10.0.3.15] (137.202.0.90) by svr-ies-mbx-01.mgc.mentorg.com
 (139.181.222.1) with Microsoft SMTP Server (TLS) id 15.0.1320.4; Thu, 13 Jun
 2019 16:02:33 +0100
Subject: Re: [PATCH V1 1/2] gpio: inverter: Add virtual controller for gpio
 configuration
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Balasubramani Vivekanandan 
        <balasubramani_vivekanandan@mentor.com>
References: <1560315034-29712-1-git-send-email-harish_kandiga@mentor.com>
 <1560315034-29712-2-git-send-email-harish_kandiga@mentor.com>
 <CACRpkdbE5pFRr9vtd_OUCbRBz8H6HuvX0cxp83FBnZZsws5r5A@mail.gmail.com>
From:   Harish Jenny K N <harish_kandiga@mentor.com>
Message-ID: <7639f292-772d-6b5e-9b73-5d687a2914cd@mentor.com>
Date:   Thu, 13 Jun 2019 20:32:04 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdbE5pFRr9vtd_OUCbRBz8H6HuvX0cxp83FBnZZsws5r5A@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-06.mgc.mentorg.com (139.181.222.6) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 13/06/19 12:18 PM, Linus Walleij wrote:
> Oops I missed one thing:
>
> On Wed, Jun 12, 2019 at 6:50 AM Harish Jenny K N
> <harish_kandiga@mentor.com> wrote:
>
>> +struct gpio_inverter {
>> +       struct gpio_chip gpiochip;
>> +       int count;
>> +       struct gpio_desc *gpios[0];
> No [0] as Geert points out and:
>
>> +       size = sizeof(*virt) + count * sizeof(struct gpio_desc *);
>> +       virt = devm_kzalloc(dev, size, GFP_KERNEL);
>> +       if (!virt)
>> +               return -ENOMEM;
> Use this:
>
> inv = devm_kzalloc(dev, struct_size(inv, gpios, count), GFP_KERNEL);
>
> We use struct_size() for dynamic structs with headroom in the tail.
>
> Yours,
> Linus Walleij


Thanks for the review comments. Will send an updated patch.


Regards,

Harish


