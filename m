Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B42DA213063
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2020 02:13:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbgGCANM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Jul 2020 20:13:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725937AbgGCANM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Jul 2020 20:13:12 -0400
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [IPv6:2001:67c:2050::465:202])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F3F1C08C5C1;
        Thu,  2 Jul 2020 17:13:12 -0700 (PDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mout-p-202.mailbox.org (Postfix) with ESMTPS id 49yb5c2qB1zQlHD;
        Fri,  3 Jul 2020 02:13:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gorani.run; s=MBO0001;
        t=1593735186;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uUML76RuE5x/r8jFu23EBUZJ644s/sVLPo1j6O6RKYY=;
        b=Y2jU15IeOK1NXG+hkfZyFJKvI4tIHKhUyf4J/k+aonK/GeijoB0R9jZ6CWxzAXo5PHA8Vl
        +xtj9eTt1slJsYuBhdUO+/yzUQIlk8jFy3csY9ES9T47kBrgtlbcFOeoTN6J+bxqKFvDsZ
        VMsbafNj7vDZt3XZM/mOQ9t+D9wQV2wRBDhV6qGoYDdb+R48u/w2JE2HKAGBGj1qomwufw
        oBSmh5Nsubk1kCGmM4CafwqRGdGuTV+4mNXBfYmX1Ck9EszuCfvMbm4trzKc08Q8s11XUC
        X0vfJ1/w6GOmOwA7XWcog0932Vp7HrizI/sNKMlw3YEiewLFO5zYxJBMgDqzyw==
Received: from smtp2.mailbox.org ([80.241.60.241])
        by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de [80.241.56.125]) (amavisd-new, port 10030)
        with ESMTP id kDkyBivzmoRa; Fri,  3 Jul 2020 02:13:05 +0200 (CEST)
Subject: Re: [PATCH v4 1/2] gpio: add GPO driver for PCA9570
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michael Walle <michael@walle.cc>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <20200702121722.1121468-1-mans0n@gorani.run>
 <CAHp75VdSWxcAQzWryKoMfzh8xM_2ZRF6Uk+8pveGhmt=prOAVg@mail.gmail.com>
From:   Sungbo Eo <mans0n@gorani.run>
Message-ID: <f7a1960b-97b8-4a09-20bf-452e29307257@gorani.run>
Date:   Fri, 3 Jul 2020 09:12:58 +0900
MIME-Version: 1.0
In-Reply-To: <CAHp75VdSWxcAQzWryKoMfzh8xM_2ZRF6Uk+8pveGhmt=prOAVg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-MBO-SPAM-Probability: 0
X-Rspamd-Score: -2.22 / 15.00 / 15.00
X-Rspamd-Queue-Id: 5CC941738
X-Rspamd-UID: d4b0c0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2020-07-02 21:36, Andy Shevchenko wrote:
>> +       gpio->chip.ngpio = i2c_match_id(pca9570_id_table, client)->driver_data;
> 
> Oh, avoid direct access to the table like this. And you may simply use
> device_get_match_data().

I'm not sure if it really does the same thing, but I'll try following 
your suggestion.

> ...
> 
>> +       /* Read the current output level */
>> +       (void) pca9570_read(gpio, &gpio->out);
> 
> (void) casting is not needed. And I'm not sure hiding an error is a
> good idea. But the latter is up to you.
> 

If it returns an error then it might be because the chip could not be 
detected on the bus at that time. But I think aborting probe for that is 
too much.
(void) casting was to indicate that I want to ignore the error, but I'll 
remove it as you said.

Thanks.
