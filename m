Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED60F66282D
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jan 2023 15:14:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233782AbjAIOOT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Jan 2023 09:14:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237226AbjAIONt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Jan 2023 09:13:49 -0500
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDB32CE3A
        for <linux-gpio@vger.kernel.org>; Mon,  9 Jan 2023 06:13:48 -0800 (PST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-4c15c4fc8ccso114264847b3.4
        for <linux-gpio@vger.kernel.org>; Mon, 09 Jan 2023 06:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TBh4l+oOox7qqr2Os5BHCfwojNKX4LdoqbYoYYXSeWc=;
        b=g9oVhOi6NBeZ3c6t9S7kMzfafGBNT0c7U1ze1kmYSwKckb8wiQ9yZgQyi9zNzLX7UD
         pcp8JjxfjfmayoO0N3t7l2yLR98E/M+BGbgbmv1/dv9dvyteUIgoyhSsjOQwkuIVZipF
         iM85F56uXm/GDIjajFGZSvafT7Xkz9R1u3fcvQ2lRMLgOyXTpxb9TDhhHzPS8Nlk6jZi
         dUkAW2oSKRZtNNV5ELOTuApP/hQxAXdk0eFrXb6U9f7lPEGR3y4/RjB8tCtLHAB4cR2D
         Ywjbo50cEh4/xJ3u80W5o5VRcnPiciACu/a2Mc2bTA6WQ1EPhD8iN+5U+b0l7QFtMDgF
         6nBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TBh4l+oOox7qqr2Os5BHCfwojNKX4LdoqbYoYYXSeWc=;
        b=0wrbS5v+VbMAl0b0Jdn1ZHMpgPHp1gQcBjNUhGuB8WP2IhNDzeVz+ojwzSoaAY8pse
         GRo0Rk5XcTlKe6xgBdX9GiQ1U0aJCXRdi4VxJ5JQ+hbpRmTojr8lIR6Gig2sUpbzUq5Z
         HYNZj4hNeUTwRPOS4786cLLSyE8bSWxi9q9bMgrVzWdo7e18Ne9GCxdSnYLrhTw1RqPU
         f6jqDq+tTZhtxZHCgWfktKt2b6r5EyaHrVx2lobkb9updvuB5Z2l+NlDvvoGBzIisXo1
         ilVq2nZzCp2HVj0h8eM8EW1K+BB1mhq9XBc5nbsK5AjDoCqHxDYW8d43VWjm2TQJC7XL
         519Q==
X-Gm-Message-State: AFqh2kroxoQR9U1wxpNux3wMCo08EKReEi6QOxHFnEFJJIa5pILu+1l2
        Ec5+nqELmZrNw+F3RFQPN+INomdKoYrVM4WuFwZNgg==
X-Google-Smtp-Source: AMrXdXsw0ubbH8l+6/r7hKop25zdf/vJOzVMIkw2j/c/BgZ9zCt0dd1QSbGBnDTXpVpzXmn73j5yvhWe6YM5iiIyBx0=
X-Received: by 2002:a81:7784:0:b0:461:49a3:db6a with SMTP id
 s126-20020a817784000000b0046149a3db6amr1433928ywc.185.1673273628147; Mon, 09
 Jan 2023 06:13:48 -0800 (PST)
MIME-Version: 1.0
References: <20230102082503.3944927-1-linmq006@gmail.com>
In-Reply-To: <20230102082503.3944927-1-linmq006@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 9 Jan 2023 15:13:36 +0100
Message-ID: <CACRpkdYreh-iG+Ao9VxY34si8HyxObyUG6zBHqxR=QziXx6Zyw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: stm32: Fix refcount leak in stm32_pctrl_get_irq_domain
To:     Miaoqian Lin <linmq006@gmail.com>
Cc:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marek Vasut <marex@denx.de>, linux-gpio@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 2, 2023 at 9:25 AM Miaoqian Lin <linmq006@gmail.com> wrote:

> of_irq_find_parent() returns a node pointer with refcount incremented,
> We should use of_node_put() on it when not needed anymore.
> Add missing of_node_put() to avoid refcount leak.
>
> Fixes: d86f4d71e42a ("pinctrl: stm32: check irq controller availability at probe")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Patch applied!

Yours,
Linus Walleij
