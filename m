Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E88BC58CAEC
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Aug 2022 16:58:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243703AbiHHO6a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Aug 2022 10:58:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243647AbiHHO6O (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Aug 2022 10:58:14 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 702E013DF8
        for <linux-gpio@vger.kernel.org>; Mon,  8 Aug 2022 07:57:55 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id b24so217320qka.5
        for <linux-gpio@vger.kernel.org>; Mon, 08 Aug 2022 07:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=RyeZMM8Lpu0kiENmC1YSh2c8I7MReXXxnB5dO63G+VM=;
        b=EmYmsUf+5vPgWyUa+GntbSxONxdmCFuihYJDKTg6XejJgW79Fekqct/V8WbwbW+/uj
         lhCphGfadQjf8OmCI+hr81moojY8f5CfpUr/nWWuPqQQY0BNQpm6UoyrA7VwhWz/BMba
         l34DZrln58bxSa8CzaNrXbeiWAQuaDXoPIWnAgH6Y8fH/sKI+/vXkxvTDe4Al2iVGejQ
         soYyKDfrOEOPIghf3r5TDavic52spSFaixfehSZnJomJd2BRwH29kUiGMbAxCoelyYHY
         Ci7rOzrz0UxBlMev458kgltbEaKZraU7Kkhm9RdXrph+zHcsahJ61XQXS+n8AWvQ+Aek
         dNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=RyeZMM8Lpu0kiENmC1YSh2c8I7MReXXxnB5dO63G+VM=;
        b=J6FqWGjGqMo7WN6mo+Mcp/OBJ9Vle7rTCk54/T2nWmEj2ix2PS2gVMlFpdnR3y0/Wb
         kVWZBxTg4Dp/Z8iI+szJ7He2cj0v8xUe+7351P2x/xZ8FVq4m3ghbwK+YzJFfZuvroxi
         IUIMjf6kqs02sioM4d6Es2sEWUKYDcI+Dwnl/Qusuyv7lf+OhY79tN4ykrsWWV+trVSS
         wGLP1m1RRJEd+7emoUvRlm2B/r8AkjfikFJnS25EL8gQp2Dz1volGKg9YsZ+lY4CtYxT
         V8IYrw7TxzgnvJwe3Aw49GbL3jzKfQvN+nZGyVjtPwsSlEQk3zKNvzmnjL603VPwJXnd
         yx4g==
X-Gm-Message-State: ACgBeo0bFfWxZ42TJJks8ulVym25tjVEDcs0gzF2T0F3GxSSKXG10rtj
        Q2ey5zwR76iZjDGuZ0ev/8MqUiO8oBG3Q0z/YD3Q0BxygJI=
X-Google-Smtp-Source: AA6agR76NNKYKE5jEUoEsG/+F1BGDbD2XAHoWBHYUm5yeVM09OunlwF6LSMJzQzDjzFl0S1F8AYmtoYrddAtfeyktZQ=
X-Received: by 2002:a05:620a:254d:b0:6ab:84b8:25eb with SMTP id
 s13-20020a05620a254d00b006ab84b825ebmr14280876qko.383.1659970674363; Mon, 08
 Aug 2022 07:57:54 -0700 (PDT)
MIME-Version: 1.0
References: <d2c3cb8e-4042-13ad-4bb9-21b289ba773c@gmail.com>
In-Reply-To: <d2c3cb8e-4042-13ad-4bb9-21b289ba773c@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 8 Aug 2022 16:57:15 +0200
Message-ID: <CAHp75Vf_KG0W8doF5m-4Fqbh+PHjOO4e7_+7Ne7qeC8XbwUk1A@mail.gmail.com>
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

On Sun, Aug 7, 2022 at 4:57 PM Ian Pilcher <arequipeno@gmail.com> wrote:
>
> I am trying to figure out how to use gpiod_get(), or one of its
> variants, to get the descriptor (struct gpio_desc *) for a specific
> GPIO.  Getting a reference to the GPIO chip (struct gpio_chip *) is
> straightforward, and it provides a pointer to the device (.parent), but
> I absolutely cannot figure out what I am supposed to pass as the
> *con_id* argument.

Ah, looking into your driver code [1] I think you need to a) switch to
use existing GPIO driver, which is gpio-ich.c in your case and b) use
GPIO lookup tables, you may look at Simatech latest development on how
to achieve that. It uses some Intel chips and LEDs that are connected
to GPIOs.

> I know the offset of the GPIO on the chip, but I can't figure out how to
> use that.

And you don't need to use GPIO offset, whatever it means. What you
need is to have a relative number of GPIO to the chip, so GPIO chip +
relative offset will uniquely give you the line.

> Ultimately, my goal is to set the direction of the GPIO from within a
> "board setup" module.
>
>
> BACKGROUND
>
> I maintain an out-of-tree "board" module[1] that sets up the GPIOs and
> LEDs on my Thecus NAS.  I am in the process of upgrading the OS on the
> NAS, which will require me to change the user-space daemon from the old
> sysfs GPIO interface to the new (non-ancient?) gpiod interface.
>
> One significant difference between the sysfs and gpiod interfaces, is
> that the new interface does not seem to provide an easy way to set a
> GPIO's direction (input/output) from a shell script[2].  Thus, I would
> like the board module to do that, along with the other setup.
>
> [1] https://github.com/ipilcher/n5550/blob/master/modules/n5550_board.c

Why not try to upstream this?

-- 
With Best Regards,
Andy Shevchenko
