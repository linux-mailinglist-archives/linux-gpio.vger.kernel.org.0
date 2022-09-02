Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 389805AAC99
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Sep 2022 12:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235594AbiIBKhx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Sep 2022 06:37:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235543AbiIBKhw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Sep 2022 06:37:52 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E61CBD4E8
        for <linux-gpio@vger.kernel.org>; Fri,  2 Sep 2022 03:37:51 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id c20so1096186qtw.8
        for <linux-gpio@vger.kernel.org>; Fri, 02 Sep 2022 03:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=dhxY1XN9LqDd4p8jCsOrBrLU/6pXWataZOAm6mzXO/0=;
        b=i1ti6U87GQmvuzYoKKQtiUc9u7ziwtznBwkS0Ib/RwIbJM+TJ0Iy+/driqB5WPMz97
         PjBOfjbmfxlKWQqcXD+CCHfievlDoLDkZR5AVkL/FUzdyT4oX9nOaxIfgiGJxJBd5k5v
         GVkF2VEGkBB8buU5hMISCa3oTeuZT9w60gacplfyytUvau38t0iWvNgbBl7Z3vSLbLTl
         ncfdIhTAYTi04F15JEBttyZ7bynhoo69CGRi+8qcD3fFRvdKhOs9IdTtQ+tFw5zh6+We
         y/k669r8oe0FK4lypWpxV+uSpLXWq8mrI/ETmGZeSgn9v/8HqDrZMTsEe7Ytz9hxdXGz
         om+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=dhxY1XN9LqDd4p8jCsOrBrLU/6pXWataZOAm6mzXO/0=;
        b=6/LrQxDpivxVUjN/yVWfFaIJ1kIaF4YEFv7egWo7yHjS/ZFi3yQsQFAZOZLvhWIYr0
         c/KfEerwNvGzEqNpko+eb9Q+P52SaQUcYeZkhRshTvGo6p3Kneozf9we8nNQ+0rtw/hl
         6NT5BQuBiqHcX3Coby9pJlmPwH5mOl3Kb3+Iamx/8nKB51kCfK1S+fHziJWUL2zO0OvV
         7u/002jFqICey4al4CYxhdeJ8GZHwXVS29JaSAAjWYVV92QKYpiiMSFfLNKK+PmgOJol
         xG0KNSgZjaWIb7QBlUkudR6nNNDfJva5LaxjYAn29QiEoVDYH0/dkEsrvWjmnZn8dB66
         otjw==
X-Gm-Message-State: ACgBeo0VACgpGwwgQsNTF5GJHIK939gh9PNkEcsFfN319HtB8JjYQ9yq
        lserc8YE/SQcHjTnC1l4LTyBizrKlc5GkKA8I/Y=
X-Google-Smtp-Source: AA6agR6DmZf5PoN+MCkvXtJaqlV67oH/Ez4z9v5Fo7VjrPQL57s7MFmEv1tM4k0nYROeGI7vu96Ftx9+29on6qxDNAQ=
X-Received: by 2002:ac8:7f92:0:b0:344:8cd8:59a1 with SMTP id
 z18-20020ac87f92000000b003448cd859a1mr28231282qtj.384.1662115070372; Fri, 02
 Sep 2022 03:37:50 -0700 (PDT)
MIME-Version: 1.0
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk> <E1oTkeb-003t9e-Iy@rmk-PC.armlinux.org.uk>
 <CAHp75VcG5E+yTH2hG2CbnArsm+ZJ-sWRMmM-wLks0xUJkwSgcg@mail.gmail.com> <YxHVdjYPlIINZ/Wc@shell.armlinux.org.uk>
In-Reply-To: <YxHVdjYPlIINZ/Wc@shell.armlinux.org.uk>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 2 Sep 2022 13:37:14 +0300
Message-ID: <CAHp75VeO3gxypRTUc9Subvh+NZ7X4_RR=eFUZpPNwBeWk+_ipg@mail.gmail.com>
Subject: Re: [PATCH 5/6] gpio: Add new gpio-macsmc driver for Apple Macs
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        Hector Martin <marcan@marcan.st>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sven Peter <sven@svenpeter.dev>
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

On Fri, Sep 2, 2022 at 1:05 PM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
> On Thu, Sep 01, 2022 at 09:55:23PM +0300, Andy Shevchenko wrote:

...

> > > +static int macsmc_gpio_nr(smc_key key)
> > > +{
> > > +       int low = hex_to_bin(key & 0xff);
> > > +       int high = hex_to_bin((key >> 8) & 0xff);
> > > +
> > > +       if (low < 0 || high < 0)
> > > +               return -1;
> > > +
> > > +       return low | (high << 4);
> > > +}
> >
> > NIH hex2bin().
>
> Is using hex2bin really better?

Yes.

> static int macsmc_gpio_nr(smc_key key)
> {
>         char k[2];
>         u8 result;
>         int ret;
>
>         k[0] = key;
>         k[1] = key >> 8;
>
>         ret = hex2bin(&result, k, 2);
>         if (ret < 0)
>                 return ret;
>
>         return result;
> }
>
> This looks to me like it consumes more CPU cycles - because we have to
> write each "character" to the stack, then call a function, only to then
> call the hex_to_bin() function. One can't just pass "key" into hex2bin
> because that will bring with it endian issues.

With one detail missed, why do you need all that if you can use
byteorder helpers()? What's the stack? Just replace this entire
function with the respectful calls to hex2bin().

...

> > > +static int macsmc_gpio_key(unsigned int offset)
> > > +{
> > > +       return _SMC_KEY("gP\0\0") | (hex_asc_hi(offset) << 8) | hex_asc_lo(offset);
> > > +}
> >
> > NIH hex_byte_pack().
>
> This would become:
>
>         char buf[2];
>
>         hex_byte_pack(buf, offset);
>
>         return _SMC_KEY("gP\0\0") | buf[0] << 8 | buf[1];

You have a point here.

> to avoid the endian issues. It just seems to be a more complex way to
> do the conversion. One could then argue that this is just a NIH
> sprintf(), so it could then be written:

No, no. snprintf() is too much here.

> which looks nicer, but involves a lot more code.
>
> Since this is called for every GPIO operation, and you were worred above
> about the layout of the macsmc_gpio structure (which is a micro-
> optimisation), it seems weird to be concerned about the efficiency of
> the structure layout and then suggest less efficient code in each of the
> functional paths of the driver. There seems to be a contradiction.

...

> > > +       /* First try reading the explicit pin mode register */
> > > +       ret = apple_smc_rw_u32(smcgp->smc, key, CMD_PINMODE, &val);
> > > +       if (!ret)
> > > +               return (val & MODE_OUTPUT) ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
> > > +
> > > +       /*
> > > +        * Less common IRQ configs cause CMD_PINMODE to fail, and so does open drain mode.
> > > +        * Fall back to reading IRQ mode, which will only succeed for inputs.
> > > +        */
> > > +       ret = apple_smc_rw_u32(smcgp->smc, key, CMD_IRQ_MODE, &val);
> > > +       return (!ret) ? GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;
> >
> > What is the meaning of val in this case?
>
> Reading the comment, it seems that "val" is irrelevant. I'm not sure that
> needs explaining given there's a comment that's already explaining what
> is going on here.

OK.
Just convert then (!ret) --> ret.

...

> > > +       if (ret == GPIO_LINE_DIRECTION_OUT)
> > > +               ret = apple_smc_rw_u32(smcgp->smc, key, CMD_OUTPUT, &val);
> > > +       else
> > > +               ret = apple_smc_rw_u32(smcgp->smc, key, CMD_INPUT, &val);
> >
> > > +
> >
> > Unnecessary blank line.
>
> I think that's personal style preference, it isn't mentioned in the coding
> style. However, the following is much nicer and likely produces better
> code:
>
>         if (ret == GPIO_LINE_DIRECTION_OUT)
>                 cmd = CMD_OUTPUT;
>         else
>                 cmd = CMD_INPUT;
>
>         ret = apple_smc_rw_u32(smcgp->smc, key, cmd, &val);
>         if (ret < 0)
>                 return ret;

Go for it!

...

> > > +       if (count > MAX_GPIO)
> > > +               count = MAX_GPIO;
> >
> > Hmm... When can it be the case?
>
> That's a question for the Asahi folk - it's not obvious whether it could
> or could not be from the code. I think it depends on firmware.

If it's the case, why does the code not support higher GPIOs? Needs at
least a comment.

...

> > > +       bitmap_zero(valid_mask, ngpios);
> > > +
> > > +       for (i = 0; i < count; i++) {
> > > +               smc_key key;
> > > +               int gpio_nr;
> >
> > > +               int ret = apple_smc_get_key_by_index(smcgp->smc, smcgp->first_index + i, &key);
> >
> > Ditto.
>
> What does "ditto" here mean, because I don't think you mean "Hmm...
> When can it be the case?" and "I would split this assignment and move
> it closer to the first user." doesn't seem to be relevant either.

Split

  int ret = foo();

to

    int ret;
    ret = foo();

...

> > > +       pdev->dev.of_node = of_get_child_by_name(pdev->dev.parent->of_node, "gpio");
> >
> > Can we use fwnode APIs instead?
> > Or do you really need this?
>
> Ouch, that's not nice. I can change this to:

(Some background on why my eye caught this. We as GPIO SIG in the
kernel want to move the library to be fwnode one without looking into
the underneath property provider. This kind of lines makes driver look
a bit ugly from that perspective)

>         fwnode = device_get_named_child_node(pdev->dev.parent, "gpio");
>         device_set_node(&pdev->dev, fwnode);
>
> but even that isn't _that_ nice. I'd like to hear comments from the Asahi
> folk about whether these sub-blocks of the SMC can have compatibles, so
> that the MFD layer can automatically fill in the firmware nodes on the
> struct device before the probe function gets called.

> If not, then I think it would be reasonable to have a discussion with
> Lee about extending MFD to be able to have mfd cells name a child, so
> that MFD can do the above instead of having it littered amongst drivers.

MFD cells can be matched by compatible strings.

-- 
With Best Regards,
Andy Shevchenko
