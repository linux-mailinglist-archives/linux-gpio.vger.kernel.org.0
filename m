Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B31B31BA54
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Feb 2021 14:29:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbhBON1i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Feb 2021 08:27:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230295AbhBON1b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Feb 2021 08:27:31 -0500
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C883AC061574
        for <linux-gpio@vger.kernel.org>; Mon, 15 Feb 2021 05:26:22 -0800 (PST)
Received: by mail-io1-xd34.google.com with SMTP id i8so2437297iog.7
        for <linux-gpio@vger.kernel.org>; Mon, 15 Feb 2021 05:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=bmlPJ6TgMnkqF52n/mMaeYi7CCMIXtksN6kNl9yAjwM=;
        b=Bh0auLuv6jfCTM8QFd/6mkE4guRdGESknnYjhT0WAuKsMQJ/MAzcJMksnoYJ/FO1LO
         r5vel/4gbAxLnOL0FbYdskFbnBaAi+raK6GW6M0DbiJopZs+iveJgfr9dew6vNLI374M
         sUQAAW69ZyzL+0NSHi9uY2mFi1kRj930BFvGDJ1jL+KE/3Qu7uAAvGNo81SZlViHIz5a
         lmjqVo3LFy87/o7DIEPrss9TcugQXoegWraEZn05EEIr32Uv7V5xE3UEZJKdh/1zP0ml
         Igy1ZYCw2pPl5/P8Zz6KmQ+mfObxXIx4zcc2O7+gtu2+dyCayVaaU9s5krIKSv+h/Ok/
         JSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=bmlPJ6TgMnkqF52n/mMaeYi7CCMIXtksN6kNl9yAjwM=;
        b=GVqcXiGqsoO/mHxnrc8o1xKYL0Zs6EkmJ3949EC2RgV0q1GkjjVITExBNoEPFGUxd4
         TL/rBwXhGFAwJBxZLLOj6suPF4rFVdejv0dQVB6t1yQOopq/1feoIMxQP19tky9GkkKb
         mI6A6YMde4OvqZ+f7UyGuRkIVOxzgBG0PZ2VKMUJJdu9fX3nscmTUZSnmOe1KY9pZOh9
         9Ikif04nYgS1fP1e9QNzsbx4xny/kJW3jM9OBuDnJcSAFvzpVhqSKqRv03JW/4om6zEj
         hKNOovrjTlGju7nbxQQBEqVgHkrq4j+vm4wCOGjzLBkSX/aZCZAEkkHqN8v6JWq/gb0p
         w5zw==
X-Gm-Message-State: AOAM530vQCoie4Gp9o+fdA5Q0eohICqpMJIeyS1YP/STLpxjJu2VyPfK
        tFEmg8wjYcwf+FzKDrzn5ySmLuxyg0sC1+3Vb2UNLxjqc0AodQ==
X-Google-Smtp-Source: ABdhPJyXZdQd3JeXCrCnCmYRtBoI9pFQorWLQlIgLvNFUAYYzghZWouZFplwsx3KyOXxI/yWK65oMeiAF6CwCF4S4WI=
X-Received: by 2002:a05:6638:1928:: with SMTP id p40mr15340168jal.3.1613395581836;
 Mon, 15 Feb 2021 05:26:21 -0800 (PST)
MIME-Version: 1.0
References: <1b1f706b60e4c571c4f17d53ac640e8bd8384856.1613134924.git.syednwaris@gmail.com>
 <202102141226.pmNlFRSx-lkp@intel.com>
In-Reply-To: <202102141226.pmNlFRSx-lkp@intel.com>
From:   Syed Nayyar Waris <syednwaris@gmail.com>
Date:   Mon, 15 Feb 2021 18:56:10 +0530
Message-ID: <CACG_h5q5emgfbf4L-Czfh1GRiTUrx7a+LXCfsxUmQ8YSs1aoKw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] gpio: xilinx: Utilize generic bitmap_get_value and _set_value
To:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        William Breathitt Gray <vilhelm.gray@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Feb 14, 2021 at 10:11 AM kernel test robot <lkp@intel.com> wrote:
>
> Hi Syed,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62]
>
> url:    https://github.com/0day-ci/linux/commits/Syed-Nayyar-Waris/Introduce-the-for_each_set_clump-macro/20210212-213005
> base:   e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62
> config: i386-randconfig-d002-20200329 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> reproduce (this is a W=1 build):
>         # https://github.com/0day-ci/linux/commit/d83196ca7a23f614773c049b69ce3896679cec61
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Syed-Nayyar-Waris/Introduce-the-for_each_set_clump-macro/20210212-213005
>         git checkout d83196ca7a23f614773c049b69ce3896679cec61
>         # save the attached .config to linux build tree
>         make W=1 ARCH=i386
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> >> ERROR: modpost: "bitmap_get_value" [drivers/gpio/gpio-xilinx.ko] undefined!
> >> ERROR: modpost: "bitmap_set_value" [drivers/gpio/gpio-xilinx.ko] undefined!
>

Dear All,

I was able to reproduce the above 2 build errors with the config file
provided and the build command mentioned in the above mail. But I need
help to fix the build errors.

Scenario:
Function 'bitmap_get_value()' is declared in 'gpiolib.h'. It is
defined in 'gpiolib.c'. Function 'bitmap_get_value()'  is then being
used in gpio-xilinx.c and the build error is thrown. Similar situation
holds for the other function 'bitmap_set_value'.

How do I resolve the above build error?. Kindly illuminate. The full
patchset can be found at:
https://lore.kernel.org/patchwork/cover/1380056/

Regards
Syed Nayyar Waris
