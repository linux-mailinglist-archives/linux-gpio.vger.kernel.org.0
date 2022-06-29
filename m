Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC45755FCF0
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jun 2022 12:16:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231811AbiF2KPp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jun 2022 06:15:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231401AbiF2KPo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jun 2022 06:15:44 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E2D927CC9
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 03:15:42 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id q132so27036799ybg.10
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 03:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4AXG5lrFf9sbEXHElYORMZQYmsjXwFQbVXGUA6y/dDo=;
        b=OWqWHqD5Lm321XYsOIuv3xZmgq5UArTJ5HvZtFPrtmqckTKOdrhH57EhC0drcPgw1H
         3m1pqNFlJUuA88l0CoS4k6x197NJ1M+ahU6ZiBAJ9+JMzCgo+OXFMtMITUM+Re+fVnC4
         wvPeHHUFYojmaM7ohXf5zGjKUcMn21xTjxoZM6pmCybOTueWG81/cx1qbjNjPXm1mGH9
         FFHmfX/2BGPyh38whalCcFROJWdEv6f4cWnxM1yrjDaqJqza1NgXJDVhCm1joCO7n647
         PMhJvYkqRlvHo8OvG4Wc62fDj/rQuPt2dQ/Tx7B21MkPeZ++SDjOn3eq/h4vOQyoTWG+
         mCYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4AXG5lrFf9sbEXHElYORMZQYmsjXwFQbVXGUA6y/dDo=;
        b=rouZ/HtCJeZZ67xsqg0OxATCC4aUGFXeMYfDbRoBXeo+jkkPAZCWIai856Tzp3c/5Y
         wdfplZTz037hUIzab+B4CCIXW22ZWOxUgbfRgwt4xbUrtnxBjC2T5xJq6OImwU/xNpMD
         eyx3SlWsY2mG/ZlvaXaWKzVVhfPECbh4EvCxOtpF0k9Hyh/hu1381bNGhrgXeCdaw/xK
         e2RmSnCD/fAWeRtrqglgJTeGvhxUkKN/gyZ3cXZnpZ6IWToTHSb7IkPnU82OIU86+Kfc
         IYXRrGxFbNvNarCS+9QacGJn6z70YFw2yzk9+a6kPGqdx1RJ1NA2aXX9YuOVM0vuM/Xx
         hbXg==
X-Gm-Message-State: AJIora/L7u+/L1JrBXPQnwwH4L3WdLb+ExwL8k/g+MBzdBqyf1v5Xfh3
        NjtX8KpUUUT3k7/luCcJsJ4+dibxMP/7wL2lhPhD8d8Eu30Klw==
X-Google-Smtp-Source: AGRyM1skQs2dyBFhs+pYR+j5WvN94ibc7wBfk746bWa+WjtJTQ1wVwfrmrreCRFRZOQIJr2C06gSSz5TiygrwKOJ1sg=
X-Received: by 2002:a05:6902:1549:b0:66d:5f76:27ba with SMTP id
 r9-20020a056902154900b0066d5f7627bamr2308219ybu.385.1656497741602; Wed, 29
 Jun 2022 03:15:41 -0700 (PDT)
MIME-Version: 1.0
References: <1656426829-1008-1-git-send-email-shubhrajyoti.datta@xilinx.com>
 <1656426829-1008-3-git-send-email-shubhrajyoti.datta@xilinx.com>
 <CAHp75Ve5f+fO29=FwGC=LxYsYj=sKRrW6LYav3gx0yK7rx-uXg@mail.gmail.com>
 <CAHp75VfVaKnofadyyf2jF3Lk816i1TJf4pq9s11iN=wFqJH2rA@mail.gmail.com>
 <d1ecc96f-0f92-4023-5b91-832f089d1cce@gorani.run> <f2d1d6e6-abaf-8f3b-0102-49bb93888ede@amd.com>
In-Reply-To: <f2d1d6e6-abaf-8f3b-0102-49bb93888ede@amd.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 29 Jun 2022 12:15:04 +0200
Message-ID: <CAHp75Ve_mgam2jcyFG-NggziUScK3JBZ4fmtN+rjd+Vra=ixuw@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: Add support for SLG7XL45106 I2C GPO expander
To:     Michal Simek <michal.simek@amd.com>
Cc:     Sungbo Eo <mans0n@gorani.run>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Michal Simek <michal.simek@xilinx.com>, git@amd.com,
        git <git@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 29, 2022 at 9:14 AM Michal Simek <michal.simek@amd.com> wrote:
> On 6/29/22 03:00, Sungbo Eo wrote:
> > On 2022-06-29 04:21, Andy Shevchenko wrote:
> >> On Tue, Jun 28, 2022 at 9:13 PM Andy Shevchenko
> >> <andy.shevchenko@gmail.com> wrote:

...

> >> Actually, why can't pca9570 be amended to support this?

> > It seems the slg7xl45106 driver reads/writes a reg at 0xDB so it is not
> > compatible with pca9570 driver (in the current state), and (I suppose)
> > it could be converted to use gpio-regmap.
> >
> > [1]
> > https://lore.kernel.org/linux-gpio/69f5d1a1970838b8c4bd8d6e8dba6cac@walle.cc/
>
> As was mentioned driver is based on pca9570 and the only important difference is
> with i2c_smbus_read_byte/i2c_smbus_read_byte_data and especially
> i2c_smbus_write_byte/i2c_smbus_write_byte_data.
>
> Read can be aligned without any issue but write will have if/else because of
> i2c_smbus_write_byte_data. Example below.
>
> Something like this. If this change is fine I think there won't be any issue to
> just merge it with pca9570.

Thanks, I also would like to see something as below in the result.

> diff --git a/drivers/gpio/gpio-slg7xl45106.c b/drivers/gpio/gpio-slg7xl45106.c
> index bf25e6fb6782..b90950ae38c1 100644
> --- a/drivers/gpio/gpio-slg7xl45106.c
> +++ b/drivers/gpio/gpio-slg7xl45106.c
> @@ -22,20 +22,24 @@
>   struct slg7xl45106 {
>          struct gpio_chip chip;
>          struct mutex lock;      /* To protect writes */
> +       u32 command;
>   };
>
>   static int slg7xl45106_read(struct slg7xl45106 *gpio)
>   {
>          struct i2c_client *client = to_i2c_client(gpio->chip.parent);
>
> -       return i2c_smbus_read_byte_data(client, SLG7XL45106_GPO_REG);
> +       return i2c_smbus_read_byte_data(client, gpio->command);
>   }
>
>   static int slg7xl45106_write(struct slg7xl45106 *gpio, u8 value)
>   {
>          struct i2c_client *client = to_i2c_client(gpio->chip.parent);
>
> -       return i2c_smbus_write_byte_data(client, SLG7XL45106_GPO_REG, value);
> +       if (gpio->command)
> +               return i2c_smbus_write_byte_data(client, SLG7XL45106_GPO_REG,
> value);

Missed change to gpio->command :-)

> +       return i2c_smbus_write_byte(client, value);
>   }
>
>   static int slg7xl45106_get_direction(struct gpio_chip *chip,
> @@ -93,6 +97,9 @@ static int slg7xl45106_probe(struct i2c_client *client)
>          gpio->chip.ngpio = (uintptr_t)device_get_match_data(&client->dev);
>          gpio->chip.can_sleep = true;
>
> +       /* will be filled based on compatible string, 0 for pca9570 */
> +       gpio->command = SLG7XL45106_GPO_REG;
> +
>          mutex_init(&gpio->lock);

-- 
With Best Regards,
Andy Shevchenko
