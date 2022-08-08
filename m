Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAC9E58CAF5
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Aug 2022 17:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233310AbiHHPBR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Aug 2022 11:01:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232079AbiHHPBQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Aug 2022 11:01:16 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02E1DB7E2
        for <linux-gpio@vger.kernel.org>; Mon,  8 Aug 2022 08:01:16 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id 17so6617948qky.8
        for <linux-gpio@vger.kernel.org>; Mon, 08 Aug 2022 08:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=FLEn8BzLnREkOUQ5mU041+WRfdoLU3NRzJqy0GWrvwQ=;
        b=hPzH3nlsDAswT9arFkAIhn2T/SIDX4qLzE4F86SH+cT4lBVlCyMCzA/xop+ST9mtjL
         UMtMchIUBF/54nWqRJdwvCBbX9Euy/9PXzl4fxntYNwj07mEoEyjVACG618j2SSceT3g
         cV3Yt9n8v7FsIaN6B+GWFg4U30vm5bZ0bDo9jaFJLtcX9e6TFhS4ZLMsbA8+n6dsyDwl
         8y/8XssKKRuBzNo7mWaNYoomarG/JbFOkCscJ91IN2QoiZMKs0nZ8pBDa3lvjEIUW6eJ
         GQ5Wn5JD9JLP0bPokfReFsUkqvndFjozrjCacLF3yNvOhbpnWYdXRoeEuurW4etz8WMn
         luwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=FLEn8BzLnREkOUQ5mU041+WRfdoLU3NRzJqy0GWrvwQ=;
        b=bw2ibZbZcf52lGtOLfY91/Ah8haQmhEiTkWPI/seGOPJu0Pjyq4hL4/rgdybswsSXq
         hDiNuMkA+FDI6xSzVeYQxKgPmWfQEMdQ+1v6P5IJs50AkBeVRUrecnGRag64Vteo+Xed
         Ec/z77w/ZNeSsxvttOsGb3afKqlDFCg4Y4k9arMG+W43u08aO5xhhXlbn9plabmtiFTU
         6GqSr6mDY1ge6PJSkfHfNnIDXDTt0q4OAem5kyHrSe0cmTjmEQJ4isuvFSzcTUSDcwBR
         kdhPCvmu11FdMFDz4whB1038+A+cGqIeIm9ERXijBJHyWx6fPjzy2YAk7BdiGJDPnVQG
         ZqRg==
X-Gm-Message-State: ACgBeo1dRBgtLnSzd7rEZGqp77FuAC5cRNYyIwn9iO6szk22tWmLLxXN
        HQjBBwuNiLLfn1wxcUi8vWsbNh0Na3lGPhLSj/0=
X-Google-Smtp-Source: AA6agR6wJYG00t/ReR4Xk5K181YANs1gwscFahmQhULGdy3mO9ZcZYu3jo6NIyl4XdBfCAFMCsbFtIHxgXoCMo273H0=
X-Received: by 2002:a05:620a:8018:b0:6b6:5df:977 with SMTP id
 ee24-20020a05620a801800b006b605df0977mr13968659qkb.320.1659970874720; Mon, 08
 Aug 2022 08:01:14 -0700 (PDT)
MIME-Version: 1.0
References: <d2c3cb8e-4042-13ad-4bb9-21b289ba773c@gmail.com> <CAHp75Vf_KG0W8doF5m-4Fqbh+PHjOO4e7_+7Ne7qeC8XbwUk1A@mail.gmail.com>
In-Reply-To: <CAHp75Vf_KG0W8doF5m-4Fqbh+PHjOO4e7_+7Ne7qeC8XbwUk1A@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 8 Aug 2022 17:00:38 +0200
Message-ID: <CAHp75Vf5KsgJSM_dsLC9Gd012XWco=nrMS2Fzf_Ejz_9MnjxWQ@mail.gmail.com>
Subject: Re: gpiod_get() - How to get GPIO from chip & offset?
To:     Ian Pilcher <arequipeno@gmail.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        kernelnewbies <kernelnewbies@kernelnewbies.org>
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

On Mon, Aug 8, 2022 at 4:57 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Sun, Aug 7, 2022 at 4:57 PM Ian Pilcher <arequipeno@gmail.com> wrote:
> >
> > I am trying to figure out how to use gpiod_get(), or one of its
> > variants, to get the descriptor (struct gpio_desc *) for a specific
> > GPIO.  Getting a reference to the GPIO chip (struct gpio_chip *) is
> > straightforward, and it provides a pointer to the device (.parent), but
> > I absolutely cannot figure out what I am supposed to pass as the
> > *con_id* argument.
>
> Ah, looking into your driver code [1] I think you need to a) switch to
> use existing GPIO driver, which is gpio-ich.c in your case and b) use
> GPIO lookup tables, you may look at Simatech latest development on how
> to achieve that. It uses some Intel chips and LEDs that are connected
> to GPIOs.

Same for your I2C GPIO expander, why do you not use the kernel driver for it?!

> > I know the offset of the GPIO on the chip, but I can't figure out how to
> > use that.
>
> And you don't need to use GPIO offset, whatever it means. What you
> need is to have a relative number of GPIO to the chip, so GPIO chip +
> relative offset will uniquely give you the line.
>
> > Ultimately, my goal is to set the direction of the GPIO from within a
> > "board setup" module.
> >
> >
> > BACKGROUND
> >
> > I maintain an out-of-tree "board" module[1] that sets up the GPIOs and
> > LEDs on my Thecus NAS.  I am in the process of upgrading the OS on the
> > NAS, which will require me to change the user-space daemon from the old
> > sysfs GPIO interface to the new (non-ancient?) gpiod interface.
> >
> > One significant difference between the sysfs and gpiod interfaces, is
> > that the new interface does not seem to provide an easy way to set a
> > GPIO's direction (input/output) from a shell script[2].  Thus, I would
> > like the board module to do that, along with the other setup.
> >
> > [1] https://github.com/ipilcher/n5550/blob/master/modules/n5550_board.c
>
> Why not try to upstream this?

With the above additional remark I think you will learn a lot about
Linux kernel programming if you try to upstream, even unsuccessfully
(which I don't believe can happen if you listen to maintainers, e.g.
PDx86 subsystem maintainer where your code belongs to).

-- 
With Best Regards,
Andy Shevchenko
