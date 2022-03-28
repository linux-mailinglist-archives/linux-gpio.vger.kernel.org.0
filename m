Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C7E54EA2EF
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Mar 2022 00:31:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbiC1WTG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Mar 2022 18:19:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229925AbiC1WS7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Mar 2022 18:18:59 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE03026E768
        for <linux-gpio@vger.kernel.org>; Mon, 28 Mar 2022 15:15:39 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id y10so18565972edv.7
        for <linux-gpio@vger.kernel.org>; Mon, 28 Mar 2022 15:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=c2rDBwbFTkCmCH7rcNPRABM5zIBAnbo13PAPu8ohgmY=;
        b=DwcVfIsIcOJ0GPiMwt6DG2p9BfDbKkf2M226tZ9hZhd2YuGqT/e5r1qpmeRjV7Klsn
         OQ2O9FGbsbrgWSfP7XnjPBbTHJVIhNT8xAsLHsK39wlF85wIalCk6RRHolEsoHmLPQov
         VHDrPq0sOWmKJ+QtijvvzMghFDu+wNtyKfwYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=c2rDBwbFTkCmCH7rcNPRABM5zIBAnbo13PAPu8ohgmY=;
        b=y9xA7jp1UrZZE0e9R9CSqDwZSNHoEwzlVqDGff3ZFq0J/ET1cEqHDraC1wShVJfPBI
         6OiIRcHiDLJCM3t+xvS9+p9wBorzmYI5e5eFIa+ShgSaJUxGSD4NbZam4FDvkzQ5vtBx
         6Zps9hm8ambxcD8lj+2N3U1nIUrDk6COuL5iDUkLYopcbTxZR+0O7FL07CXXACZed/IK
         bzI+Xj1h4k3MTvI2x9EjEaHFkopH4Q2rXzP1sjr7xYlv7s6tNL/J87/YU4bdYp6VLaxB
         fqJVUp2BLdB3kAUonN2ZzeQRsFVMzSKRipc0wBlI8bm0+7UQE1/4k0NJBRB4dKcKemnF
         aEcA==
X-Gm-Message-State: AOAM531hhCSP+W9p0Ww1ERXjhP3RqtnGmDngYyh4FAvpY4krJzMR7fCV
        7F+bWHWwKxeIRhVB4jw/xWUjeXlWdDplaKWMa34=
X-Google-Smtp-Source: ABdhPJwQZZYPvBLAGdNeYLSYtt3JjnJ9nKicPorwlB1a5Qs5xDL+D0cd03n3L0jvJ7CJY+Vg1L5k1g==
X-Received: by 2002:a05:6512:3a83:b0:44a:b79:6988 with SMTP id q3-20020a0565123a8300b0044a0b796988mr20730921lfu.595.1648503710648;
        Mon, 28 Mar 2022 14:41:50 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id t27-20020a2e8e7b000000b00247f32b572asm1838999ljk.19.2022.03.28.14.41.49
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Mar 2022 14:41:50 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id 17so21016520ljw.8
        for <linux-gpio@vger.kernel.org>; Mon, 28 Mar 2022 14:41:49 -0700 (PDT)
X-Received: by 2002:a2e:9794:0:b0:249:8488:7dbd with SMTP id
 y20-20020a2e9794000000b0024984887dbdmr22077785lji.176.1648503709507; Mon, 28
 Mar 2022 14:41:49 -0700 (PDT)
MIME-Version: 1.0
References: <CACRpkdZ_Jr3OzfoOpSSsAJMy1Oe_=zD861jouDzCVD-BQ6yZMg@mail.gmail.com>
 <CAHk-=whzqAB6kfHUcX2uhfPnNiWJRq=UmeA1TbgGi3XA+57j3w@mail.gmail.com> <YkIqyb6lhn5uU2jb@latitude>
In-Reply-To: <YkIqyb6lhn5uU2jb@latitude>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 28 Mar 2022 14:41:33 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjxvNGEUUN5fj203KJL8qXK3jv359Ketc-HJMJU9wN6KA@mail.gmail.com>
Message-ID: <CAHk-=wjxvNGEUUN5fj203KJL8qXK3jv359Ketc-HJMJU9wN6KA@mail.gmail.com>
Subject: Re: [GIT PULL] pin control bulk changes for v5.18
To:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 28, 2022 at 2:38 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:
>
> It was =E2=80=94 but when it was noticed, the fix went through the IRQ tr=
ee, on
> top of a refactoring that happened there (the switch to generic_handle_do=
main_irq):
>
> https://lore.kernel.org/lkml/164751044707.389.16417510835118111853.tip-bo=
t2@tip-bot2/

Ok, that ends up at least being identical to what I did, so thats' good.

> When I added the pinctrl-wpcm450 driver, I changed the pinctrl/nuvoton/
> directory to obj-y and exposed the pinctrl-npcm7xx to CI bot testing.
> The bug existed, untouched, since the driver was added a few years ago.

Ahh. Good. So not a heisenbug, just happened to be hidden before.

Thanks for clarifying,

                 Linus
