Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84E0F1576C7
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2020 13:55:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728866AbgBJMzY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Feb 2020 07:55:24 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41906 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729305AbgBJMzX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Feb 2020 07:55:23 -0500
Received: by mail-lj1-f193.google.com with SMTP id h23so6992751ljc.8
        for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2020 04:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=if4MUnW+MXwsU+saJV38n0v9tUH8Lchg2aKYG4Eb7X4=;
        b=DRgSEasHs7rZLw8lwalhqqVwwrJjzEeFMhK6P7OyXSdnl1DnOjoLg7S3gtTFtG1htL
         8PqvxVm0XTS0ARlV0Rhr7kA/HGQ98L++ubs/qGWrRLGfGhT3sbDc3YwalzhPLs6a74J1
         0zs5HgYZS0WfWx4rXHM1ViEZd6aQ2LPaODzPEUHW4doJisbhmv3LJDVkk9uNQ9AGMU48
         rOCv+R3N2LIgD24H2MZaSb8xHONLDBmb9N6AXv9x8UQQNdNVv8WrCeIyoE7TBNormu9u
         SwACo3uBmfPBjB3nMNEDFgCiR27a6t8gUVOj/myILUNlkzfVpDhWmNFUOBlD1+ODtgre
         aNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=if4MUnW+MXwsU+saJV38n0v9tUH8Lchg2aKYG4Eb7X4=;
        b=NuwJk1rE19uqcLIdqZ3vStFGO2tIaJ4TfB4oxJ9ZEKGpSfHy4jFEjoBPzT1RWnj81h
         4qLywxXAa80Noq9qNCfi2G/eEnETcxmRhAqHgHSnFwyfBhICBYkhckQkDF/rfHOgDkcZ
         Jskb93pwkUV0tR5JOfVoSF1XsRn8t5x8F7uILcpbR1juUvxBPNEBdqSARPaeqL1SwrHA
         MhoBv5BtzdzlbUNKL9XD7znhy6LDMfjIExWKv5YDxJqueyVnWf2oS1RK7LNUg9pmqfCi
         qCsCk/vRmEF151OQhR4oO73GjuGgh6T3cpOo69Yepi60GbQrEZMBOD12qdoLU8x9i7/L
         wPeg==
X-Gm-Message-State: APjAAAW+3AzNNqkUe9rhS+vYugogaZWYD38kd3fI15LYURsumkMiMT7u
        qYbDn+/AaI1AMi7IOVuWCAtYwL7cNUAW7dPQLYLK572f/v0=
X-Google-Smtp-Source: APXvYqw+civ1ODb6zso+c7GW7rfrr9mBNsfxXp5/xK8t7tww8joCEz2Wgykxa4HgCnO9fVri1gLiHP82cmonCoITb+A=
X-Received: by 2002:a2e:2a84:: with SMTP id q126mr847097ljq.258.1581339321285;
 Mon, 10 Feb 2020 04:55:21 -0800 (PST)
MIME-Version: 1.0
References: <1580189061-14091-1-git-send-email-yash.shah@sifive.com>
In-Reply-To: <1580189061-14091-1-git-send-email-yash.shah@sifive.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 10 Feb 2020 13:55:10 +0100
Message-ID: <CACRpkdY2Zahr0mLUp+dBOzZbthsttLS=oKitPJVS_xQh8RwZqA@mail.gmail.com>
Subject: Re: [PATCH] gpio/sifive: fix static checker warning
To:     Yash Shah <yash.shah@sifive.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        "Wesley W. Terpstra" <wesley@sifive.com>,
        Marc Zyngier <maz@kernel.org>,
        Atish Patra <atish.patra@wdc.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-riscv@lists.infradead.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sachin Ghadi <sachin.ghadi@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 28, 2020 at 6:24 AM Yash Shah <yash.shah@sifive.com> wrote:

> Typcasting "irq_state" leads to the below static checker warning:
> The fix is to declare "irq_state" as unsigned long instead of u32.
>
>         drivers/gpio/gpio-sifive.c:97 sifive_gpio_irq_enable()
>         warn: passing casted pointer '&chip->irq_state' to
>         'assign_bit()' 32 vs 64.
>
> Fixes: 96868dce644d ("gpio/sifive: Add GPIO driver for SiFive SoCs")
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>

Patch applied for GPIO fixes.

Yours,
Linus Walleij
