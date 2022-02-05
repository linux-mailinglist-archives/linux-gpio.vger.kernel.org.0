Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 009A64AAA32
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Feb 2022 17:39:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234880AbiBEQjs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Feb 2022 11:39:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiBEQjs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Feb 2022 11:39:48 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F623C061348
        for <linux-gpio@vger.kernel.org>; Sat,  5 Feb 2022 08:39:47 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id 192so1821103ybd.10
        for <linux-gpio@vger.kernel.org>; Sat, 05 Feb 2022 08:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7F+8USHFDE8IayAm+TB2xQEiUJldw7h6gDGNLYqTghg=;
        b=INqO7QDQEdOAV5NoH9Y7AUOI2g2l/U2lGjIMvznW3n27VeK55yayt20t7PlVMrFhyK
         bklzh35WXNqbTyrLEmtI7XFQSMiCLL7nqoJDedC5VCZLPtwe/KVdn8RbF70HkfRkB5c0
         IDvJ0Q4NHYnqmC/6eip3l9Qb/odjZp3i5lOB5OxrnkEUZnp2x3zGbOw3Dobv1GAYqB9G
         9fCpc6SAKByvug8bkSA3jBVLyHZDG79nwC7vTEFGNNIHYs+RW+X5NyUq5d39swBfdo2h
         gG4TqD6rwEo53qmi0e7vo5GhZ3r3zm4w0gEwYLhgtrXpLyuPdsnegkNH5q+G0TpzIbpS
         7imQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7F+8USHFDE8IayAm+TB2xQEiUJldw7h6gDGNLYqTghg=;
        b=Gmptwg9dVlYerTznAXpDtbsocdpFMWRqHAlArQL6M5Zr8mfZtCAWeFTC4H863oIiY6
         YwgyNWGdxY/a3i1NiWv2NiYl9dFtoflNNyBJz0jktA7QyQ6+QmutUqSJHzCkZLnlKAUL
         0GHqmFEy+tnjTNLag0zUp5zxyCGoX6/KeAN83qnusbPai8AvhxLvPbKMMcD3EhjtV1Zo
         mv6dvJQPHvBEpCHifVEi7Mwr5v4/87y6QwHX35VFqzJoVgWmabMPjv8FA1nOivBf+UBI
         urvTwHmjmFoEVARhvmwfz9MMub4uvZIpzlo3oW8BZ0KEP0rCN4k2PX4ngQGcqoy7CNKw
         WneQ==
X-Gm-Message-State: AOAM531w+ug/Pppu+4GsZkzNMhyjGDN7TyoxxXKXKyKBqEtZ7bn3wc9J
        p8qtguCX+9XB5Oz2w3N6LP4uehW8Aj5VDy+BNWLN2Q==
X-Google-Smtp-Source: ABdhPJxatjV1lGXgcy/ZJt/lFciDDNKH16UbIV+scTjMNBRxuQkcfRgr07sLhM2ygYwNysEVT+WIb3RNxJMTLUUlyAA=
X-Received: by 2002:a25:a2c6:: with SMTP id c6mr3855899ybn.322.1644079186562;
 Sat, 05 Feb 2022 08:39:46 -0800 (PST)
MIME-Version: 1.0
References: <20220204130142.21727-1-Niklas.Cassel@wdc.com>
In-Reply-To: <20220204130142.21727-1-Niklas.Cassel@wdc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 5 Feb 2022 17:39:35 +0100
Message-ID: <CACRpkdZX5Sd-bp1n5zmYv7biPuBoNMGW2+OQ9qUi3PKNeG-R=A@mail.gmail.com>
Subject: Re: [PATCH] gpio: sifive: use the correct register to read output values
To:     Niklas Cassel <niklas.cassel@wdc.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        "damien.lemoal@opensource.wdc.com" <damien.lemoal@opensource.wdc.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 4, 2022 at 2:02 PM Niklas Cassel <Niklas.Cassel@wdc.com> wrote:

> From: Niklas Cassel <niklas.cassel@wdc.com>

Hi Niklas, long time no C!

> Setting the output of a GPIO to 1 using gpiod_set_value(), followed by
> reading the same GPIO using gpiod_get_value(), will currently yield an
> incorrect result.
>
> This is because the SiFive GPIO device stores the output values in reg_set,
> not reg_dat.
>
> Supply the flag BGPIOF_READ_OUTPUT_REG_SET to bgpio_init() so that the
> generic driver reads the correct register.
>
> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>

Looks like a straight-forward fix so:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
