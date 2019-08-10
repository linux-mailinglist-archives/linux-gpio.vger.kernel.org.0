Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF776889D0
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Aug 2019 10:13:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725888AbfHJINM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 10 Aug 2019 04:13:12 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42427 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725884AbfHJINM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 10 Aug 2019 04:13:12 -0400
Received: by mail-lj1-f196.google.com with SMTP id 15so2347564ljr.9
        for <linux-gpio@vger.kernel.org>; Sat, 10 Aug 2019 01:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oqsU2heLXHHBs96Q5jI1j5tMoKsUDIBVmfyGumKZ6LM=;
        b=VnJxbftIzPrqH4FoIz+w63T9HvLAwPyuIAzFqmtEtWAsLj/01rK86PGFGuGpSqWYv+
         EOc3pJBX5N72NrROGYfkzRIEBM/NZHAtlunaj25jmAa22WMIK6W8WaeA6NQrcRQ890ve
         gTKEzqoNeorIPkcAkbULvIA82MectHdfWgQVc2tti+zAedXKseEDZCsXl4IK+jsWOZyk
         R7BDcza0vJn1D+S49B4cTvaTLZpzO5Zji8UHdpqukz0sSpuhB6HNFG8n8zxgS0EkyZrb
         5PC++TGzLIxcQd3/xU9h8T2WbaloLuBlyrUH/bwdms17HdBtBey1e6TEAlNNF3mOqFH5
         GZ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oqsU2heLXHHBs96Q5jI1j5tMoKsUDIBVmfyGumKZ6LM=;
        b=uFOxTEqRvl6xINkf2fPUKXJizy2fejTtimMtWE4PKRkGXKl+9TBqzuhj68W0yfKvyN
         5VEwsC5j+DjRzCMj4gu7o5a9AiNYh3os6+55FTThBkpWVRlKASAryDj5tWdjmJtw7kC+
         bkkqRdqNdV8SyWY27aYj1iyPpCdJGJe3ZOrCQH+AglibjpPtN41U5PqExEcVWtUJgLPu
         N1knVZbY9IxGhB5RIb73RiD5eyuF91MhPZzzKINre1G7XVxlCDMAd/BQhWlUiJg+D2Y0
         YOCxWAyNvRATfqHqt8IPJtW89BwN1LJyyEhUCvGw2AGpgttPCr0Dsy+gPakuuTMZ4JNX
         30LQ==
X-Gm-Message-State: APjAAAXC72BpkqleuZzAWUzhr8bPgXP5fvUwVAocKY2TVL2SoD0xm/9B
        mJES9OEDfPsOChpoUlckfsxwJnWDInbuiKm0+JPMqw==
X-Google-Smtp-Source: APXvYqw5IJDtu+KvWNV5b+0f7BnCDMIkmE9siMLHoOIDt6M7/m7Z1qUizRn9O0DLYl+XLv2UlhKWmwCr8OjDx7Cm5k0=
X-Received: by 2002:a2e:8756:: with SMTP id q22mr13818205ljj.108.1565424790000;
 Sat, 10 Aug 2019 01:13:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190807003037.48457-1-natechancellor@gmail.com>
In-Reply-To: <20190807003037.48457-1-natechancellor@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 10 Aug 2019 10:12:57 +0200
Message-ID: <CACRpkdbDgOQXfxgM4dEyzBRhtske3=V+858B7J8jGExnJE5fJQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed: g6: Remove const specifier from
 aspeed_g6_sig_expr_set's ctx parameter
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 7, 2019 at 2:32 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:

> clang errors:
>
> drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c:2325:9: error: incompatible
> pointer types initializing 'int (*)(struct aspeed_pinmux_data *, const
> struct aspeed_sig_expr *, bool)' with an expression of type 'int (const
> struct aspeed_pinmux_data *, const struct aspeed_sig_expr *, bool)'
> [-Werror,-Wincompatible-pointer-types]
>         .set = aspeed_g6_sig_expr_set,
>                ^~~~~~~~~~~~~~~~~~~~~~
> 1 error generated.
>
> Commit 674fa8daa8c9 ("pinctrl: aspeed-g5: Delay acquisition of regmaps")
> changed the set function pointer declaration and the g6 one wasn't
> updated (I assume because it wasn't merged yet).
>
> Fixes: 2eda1cdec49f ("pinctrl: aspeed: Add AST2600 pinmux support")
> Link: https://github.com/ClangBuiltLinux/linux/issues/632
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Patch applied with Andrew's ACK.

Yours,
Linus Walleij
