Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 725B7622C34
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 14:14:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbiKINOJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Nov 2022 08:14:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbiKINOH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2022 08:14:07 -0500
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B2071260B
        for <linux-gpio@vger.kernel.org>; Wed,  9 Nov 2022 05:14:07 -0800 (PST)
Received: by mail-vk1-xa32.google.com with SMTP id s204so10996940vkb.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Nov 2022 05:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nes2BTkbvfu5WnwxHd4/s2sNugMsoZ2D94rkv/2b/7s=;
        b=smlNNIDqZ8/Tva7T3kJ8aSx51IUkWAZavUTsKAk5nMUAxlVbeAXTwa4H4fnj069bdA
         VvSmh5MHAK3i9k03iRCPkdbROX2l//foFcjwVlULpLQ+VCse5rGc3DH5IHB0MOvlUnMg
         LlvgU2hBeUrx7pVvg1dCeohoubhOTKjQy5rPDUZjI8QcpR7C5PD7Y3UrvVbEZelyGKpJ
         MstsxwP9SodrHr9xAgV9APZaUiDvvilkKPoOyHc5aGdSPdkRVVtLHD2TSxX4RMciYdeY
         JScZ/HRM6vbRETJqkJKBtrvGhUEFJ/vnslEfkKbOydI7zjSg7euF0zTwXbhcmVawM2yH
         k7tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nes2BTkbvfu5WnwxHd4/s2sNugMsoZ2D94rkv/2b/7s=;
        b=NZKfYc9eXW+weyt3cs4vvVF/K16Ju5Mzjl4+kIY2O5Ad/XSSWLsAujbJ7mmiNeP/Gs
         iIrYvVImS9XtIp5CMQeshcg7RfvetsuPvJCyXgq5EU381Dcj11WeKsxbGXLQMh4qOoiz
         FjU2MLJNijM75PpJQeneO4rqooojEBpukzlvM+lj2rEyoHSJdAmIxF0a5tNi3cyLHEXM
         21SVosJmexmndfFWdcvCXUzBOPa9yjxZ29jQcldkWygNPbiZohNDtJS1RisWLXIks9U6
         luz0HxLHLLLDYzhBylONU8bGjp6WZP8I46gOFrYx3gFRP3SoNKwAxw0vDVkQinLPWbGe
         af9w==
X-Gm-Message-State: ACrzQf3N+74iMH4vIsfD0awYUU/VBOFY6FNu0zUtNncDoP19ysMNj4Ax
        IBd1SF6rnTnQliqCKKSVrHhK+Thv9Br7J4BxoBiLmg==
X-Google-Smtp-Source: AMsMyM4B/8+BcdTI53MgovZgfDGdzs43JzwF7i2XFQy0l0oU1GfFtMj1h8pTVADzlxXZSe7/qYZb8v+ZHjwz61cxvOc=
X-Received: by 2002:a05:6122:92a:b0:3b8:ae77:6927 with SMTP id
 j42-20020a056122092a00b003b8ae776927mr12644249vka.33.1667999646392; Wed, 09
 Nov 2022 05:14:06 -0800 (PST)
MIME-Version: 1.0
References: <20221107161027.43384-1-andriy.shevchenko@linux.intel.com> <CAMRc=Md7yN2cw14EAPbODGeLOXw=7VGceK_uYdTx-NsN6P64HQ@mail.gmail.com>
In-Reply-To: <CAMRc=Md7yN2cw14EAPbODGeLOXw=7VGceK_uYdTx-NsN6P64HQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 9 Nov 2022 14:13:55 +0100
Message-ID: <CAMRc=MdvcQgOvEU+t8ck2EFJUtM_HSTR9cMZf4wVdtB3TRs5Zw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] gpiolib: of: Prepare of_gpiochip_add() /
 of_gpiochip_remove() for fwnode
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 9, 2022 at 2:13 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Mon, Nov 7, 2022 at 5:10 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > GPIO library is getting rid of of_node, fwnode should be utilized instead.
> > Prepare of_gpiochip_add() / of_gpiochip_remove() for fwnode.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  drivers/gpio/gpiolib-of.c | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> > index be9c34cca322..000020eb78d8 100644
> > --- a/drivers/gpio/gpiolib-of.c
> > +++ b/drivers/gpio/gpiolib-of.c
> > @@ -1104,9 +1104,11 @@ static int of_gpiochip_add_pin_range(struct gpio_chip *chip) { return 0; }
> >
> >  int of_gpiochip_add(struct gpio_chip *chip)
> >  {
> > +       struct device_node *np;
> >         int ret;
> >
> > -       if (!chip->of_node)
> > +       np = to_of_node(chip->fwnode);
> > +       if (!np)
> >                 return 0;
> >
> >         if (!chip->of_xlate) {
> > @@ -1123,18 +1125,18 @@ int of_gpiochip_add(struct gpio_chip *chip)
> >         if (ret)
> >                 return ret;
> >
> > -       of_node_get(chip->of_node);
> > +       fwnode_handle_get(chip->fwnode);
> >
> >         ret = of_gpiochip_scan_gpios(chip);
> >         if (ret)
> > -               of_node_put(chip->of_node);
> > +               fwnode_handle_put(chip->fwnode);
> >
> >         return ret;
> >  }
> >
> >  void of_gpiochip_remove(struct gpio_chip *chip)
> >  {
> > -       of_node_put(chip->of_node);
> > +       fwnode_handle_put(chip->fwnode);
> >  }
> >
> >  void of_gpio_dev_init(struct gpio_chip *gc, struct gpio_device *gdev)
> > --
> > 2.35.1
> >
>
> Applied, thanks!
>
> Bart

I actually applied v2 and both the patches from this series.

Bart
