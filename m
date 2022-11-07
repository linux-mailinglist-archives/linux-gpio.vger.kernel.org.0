Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25CA561F643
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Nov 2022 15:38:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232262AbiKGOic (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Nov 2022 09:38:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232272AbiKGOiY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Nov 2022 09:38:24 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4FF6E57
        for <linux-gpio@vger.kernel.org>; Mon,  7 Nov 2022 06:38:22 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id t25so30638977ejb.8
        for <linux-gpio@vger.kernel.org>; Mon, 07 Nov 2022 06:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1m3WexH3gXC/W93bwft/1e2FdQuh2bz86DBo3IQGDFA=;
        b=nxt1innCOUnItJ/vSC+ZnoISLb3/4mNbDHY1tcDU12La8mVlS/4nwaGXgUAf2HKjkJ
         dmvmu8PrmCBoPoWIJY3Pq+RTcR7Hhxdw3MGuHmMCTE+WRJ0hvHBxaIb0Mm3XDRZT1EfZ
         i8+b/5FA+VNsDeAiASZmK9JY4BvKzw/fv+FQKtleYjn38uQVIYF4EvFvbZ7k4508G1pH
         7s7XcC0TVXgQh9KwmZGjqLA2IOzrzHg1rAiRvVEYqUUmvyqz4FAbtqwpFgh12dGdQ9Mj
         E4bLe96XeHpvQccNB9RtYzTsOhYLbRBBS21qCn0Ijo+xCPHojPcpcJv26/GzqkKQSC9x
         ZrjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1m3WexH3gXC/W93bwft/1e2FdQuh2bz86DBo3IQGDFA=;
        b=iqH2SkosqKRGGYLVO7syY8sEpZYrkqzcMcJEbPJTPnpmMK98uX1gqJMMBfaUYAZmwW
         JzwqryN5uH/+Sq3eOmz9G2QaozsqGtFImaab216OGvYxTotONaxQgqMWpmk1z3VlnzuM
         6Hsh0RuwmMspUOOtesqT5kyvrdueS38ead1A4o/rljMdHyGseboKIBp3cwpTCkmd3TEQ
         tYF4FsB9uvcD28AXn6226AMICwDZB7o/o99ZpHSc/4NPLBR5auJX3Cm/vn0YjJfRv7nu
         7ZazP8KwUNzNxsmXywdJXfU33rXwRvMkzUutQ0mcdGWhOSR7bTuXjUUbmxdMhfmZfQHd
         Urag==
X-Gm-Message-State: ACrzQf1YEafW0dFXX6o2H1Wghkw7hEixbikJebmdGv78iP+YYBbyJ8od
        smNP0woyJ4xzAffhuzYTKF5n8cOftwskOfm8sHBjHWgz/MY=
X-Google-Smtp-Source: AMsMyM6+xtL8+Yj7c1bt1AQJ6bqIcZFaL33G19BOfGXBGRhC9sazlQqdgMff+YbzEMnfzPenUeDbPgvidKxKz3dQW10=
X-Received: by 2002:a17:907:c1e:b0:7ae:31a0:571e with SMTP id
 ga30-20020a1709070c1e00b007ae31a0571emr16628108ejc.690.1667831901503; Mon, 07
 Nov 2022 06:38:21 -0800 (PST)
MIME-Version: 1.0
References: <20221017-upstream-px30-cif-clkoutm1-v1-0-4ea1389237f7@theobroma-systems.com>
In-Reply-To: <20221017-upstream-px30-cif-clkoutm1-v1-0-4ea1389237f7@theobroma-systems.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 7 Nov 2022 15:38:10 +0100
Message-ID: <CACRpkdZQ45ocGsZ372apH1gTG3ORofPwn2bZtJjDT-=nkWzgUg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: rockchip: list all pins in a possible mux route
 for PX30
To:     Quentin Schulz <foss+kernel@0leil.net>
Cc:     heiko@sntech.de, david.wu@rock-chips.com,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Quentin Schulz <quentin.schulz@theobroma-systems.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 18, 2022 at 2:17 PM Quentin Schulz <foss+kernel@0leil.net> wrote:

> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>
> The mux routes are incomplete for the PX30. This was discovered because
> we had a HW design using cif-clkoutm1 with the correct pinmux in the
> Device Tree but the clock would still not work.
>
> There are actually two muxing required: the pin muxing (performed by the
> usual Device Tree pinctrl nodes) and the "function" muxing (m0 vs m1;
> performed by the mux routing inside the driver). The pin muxing was
> correct but the function muxing was not.
>
> This adds the missing pins and their configuration for the mux routes
> that are already specified in the driver.
>
> Note that there are some "conflicts": it is possible *in Device Tree* to
> (attempt to) mux the pins for e.g. clkoutm1 and clkinm0 at the same time
> but this is actually not possible in hardware (because both share the
> same bit for the function muxing). Since it is an impossible hardware
> design, it is not deemed necessary to prevent the user from attempting
> to "misconfigure" the pins/functions.
>
> Fixes: 87065ca9b8e5 ("pinctrl: rockchip: Add pinctrl support for PX30")
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Patch applied.

Yours,
Linus Walleij
