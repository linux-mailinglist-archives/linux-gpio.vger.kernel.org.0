Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6F3067E6EB
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jan 2023 14:40:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231863AbjA0Nkh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Jan 2023 08:40:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231610AbjA0Nkg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2023 08:40:36 -0500
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B9617E6ED
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 05:40:13 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id t16so6015620ybk.2
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 05:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4MVwNaOTh9TVsQvOOmcikG6XSnsMoScG1h8pFfVLJ9c=;
        b=FC2n2ma/s+8vXWF6ffQjT49RZ0PQIYbjAhgd22ON8jlfyo9eonNftBrAEAci/4irCs
         xhH5NeBYYUIJX1xIANt507Goy7fRS+3UqqLcQxcOwp7QzHzwimo3RX3D4ZVLHUbLSqjP
         +7BthlJ6clLQvfi5pajOIVw34pZyedn8EQKh+WluBzecbwPXL6xNacryUMXgj0e9EbFh
         Bf5hGjgxCmOLyNJ6qUmuoMOX9DGH4aKNnDvtmOgyGHzAqKseZbwDJhPCdrl7xTJ9o88V
         qp2zwUf6X1cKFNR1ONY5VcmQzR+yaSpz3kZA6SuGCbwhYK/KXuv3UWvzcCfMLEKH7H6n
         ggwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4MVwNaOTh9TVsQvOOmcikG6XSnsMoScG1h8pFfVLJ9c=;
        b=yr53Is3oPoI1o9t8v/jFQ6eT9pjl1mmI0WNaUPu28Kj2a87Aim53hs/NOUYvJLb1zV
         bVtcTF/+evrnR2ytjrAVbzwbsa2jZuBWJy0EtMk40vmdnxjaE4dqjzoapgR4wXz0OhPj
         tt7d8f8Np/h6SoUynb9WuPdVl+0NBF2tDYHgPuUadgmUbsi7YFIVVb9yjuHfGe3DJZEj
         R4kkdWlCuJbnn78bpnJSIHokLrbW51XRQjoWIiJbs+AJB3BG3A+QjyGxx+eRcVyZ4V5y
         UDOaLcGac8uDgAfVSCpeJ7U1rN8H+GA09Te6A7pgdgUMDQg+PRpuU7Aw3DUu0x7s6GdM
         b0Gg==
X-Gm-Message-State: AFqh2kqUhgjL4DzojRjcaixyj1LGISD+DhZ3ClwGNj9bX1b+XgfA5ttk
        5uTHnlwdfnXyVLZVaTcRjchMExu0mILuRnZaBHfxtg==
X-Google-Smtp-Source: AMrXdXvIs5OfShN0Qpqyu/Awr0JysGwM5oBnzTY+H+VFO2BYszmdTZxtAX6Jm80v/Dldv+f3xseeEG7R/5rZjLdi6UQ=
X-Received: by 2002:a25:9d88:0:b0:7c0:acd2:6300 with SMTP id
 v8-20020a259d88000000b007c0acd26300mr3769907ybp.520.1674826807208; Fri, 27
 Jan 2023 05:40:07 -0800 (PST)
MIME-Version: 1.0
References: <20230127101149.3475929-1-arnd@kernel.org> <20230127101149.3475929-8-arnd@kernel.org>
In-Reply-To: <20230127101149.3475929-8-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Jan 2023 14:39:56 +0100
Message-ID: <CACRpkdZbMbbihUnQDMc-Q_r0n9E5TZYMohe4hUApux1xDU7_9A@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] gpiolib: split of_mm_gpio_chip out of linux/of_gpio.h
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 27, 2023 at 11:12 AM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> This is a rarely used feature that has nothing to do with the
> client-side of_gpio.h.
>
> Split it out with a separate header file and Kconfig option
> so it can be removed on its own timeline aside from removing
> the of_gpio consumer interfaces.
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
