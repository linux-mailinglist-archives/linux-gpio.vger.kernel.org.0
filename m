Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16388681E70
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jan 2023 23:52:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229696AbjA3Wwl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Jan 2023 17:52:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbjA3Wwk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2023 17:52:40 -0500
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C6DD25E24
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2023 14:52:39 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id m199so16022459ybm.4
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2023 14:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P52iw2KdpV97bLV6oGgF0ttgr5Mknb31FWdz4/VnAEw=;
        b=wAmYUNtiCGghhXnjzHicWJYhy1R7W6aAJBOckY5LrPTf6O/V78NoSo01oVmnAkHTSc
         mDhIf0fdlqb5/7kZMg53z+j2SSbXqVtsbHpqWQ9pwWH9Vb0lTg27LR4XzsBgL7e62rzL
         PYpykaSb+gDhwj2FEbIgkLXkDwjIiU2sJGHOshVrdTKEVl8qqM1WDSZHvqyJ7l7JKjJ0
         la7xjJKhJFRiLU07iX5kZo8ARoYskZnaUUJKb6HhkQ9WlEB9NTk53mNwVtlp36yQ1uR1
         VuYSCvAIIIeBZfB/59DA4YiW+htZrwapaWB4PNtowr8BmM4hUbxxpuKCdnLkKnCYuot1
         tJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P52iw2KdpV97bLV6oGgF0ttgr5Mknb31FWdz4/VnAEw=;
        b=qqfDKkx1/65zP3ACQ5FGeu+P73j7v1dF04fSaS3JQXXxxYscyl5i7376RREciQiBHa
         2OF1KNP/eEVX7T0340VkjvyPCALL5PXUfD9MglS0oZFFyjfQ/BzPmaO5pB2jhOMLS870
         4Ylbrv1wP3cwv9vbNFEuFrXZjCnHsoaTd20MSOLEyniigIn0T0SMaxjNWT1b9yvzaGkC
         5GANX2ugFM/cP70JTX6qfJ2KSkM4X0+n4HXzN6SS304B/YOGNVUsOkw7J06bdvludJeQ
         8QbzxaGGy8IjbKQYd20K0OVHYrFQ/VYeFD6KPxW7MsxeKteIrg31GPCadPGip6X1MQmy
         kviQ==
X-Gm-Message-State: AO0yUKW9ZVJn5dnVGJBB244HuizsYSFWTT8ts8HKlDGQ0hsAiSnYmUuF
        wHedPeXITRLsgrcwC3tSc2c5cWn+S4YF/pyFxLTo11PxJ5yNLw==
X-Google-Smtp-Source: AK7set++WO/96HugCAeMpHgFK+5pdRRPxKJ4VYtuRaf0p5ytvK3t3J/o3mwrh1deUOuIXSDy/KdLquretR8/YkzFjHs=
X-Received: by 2002:a5b:c1:0:b0:80b:c9d0:c676 with SMTP id d1-20020a5b00c1000000b0080bc9d0c676mr2187864ybp.341.1675119158843;
 Mon, 30 Jan 2023 14:52:38 -0800 (PST)
MIME-Version: 1.0
References: <20230130220845.917985-1-joel@jms.id.au>
In-Reply-To: <20230130220845.917985-1-joel@jms.id.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 30 Jan 2023 23:52:27 +0100
Message-ID: <CACRpkdY3VtkJZn4pHawFiW7yie+BWvT8o9Qx0Ym0ihgi3ACJ2A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed: Revert "Force to disable the function's signal"
To:     Joel Stanley <joel@jms.id.au>
Cc:     Andrew Jeffery <andrew@aj.id.au>,
        Billy Tsai <billy_tsai@aspeedtech.com>,
        linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 30, 2023 at 11:09 PM Joel Stanley <joel@jms.id.au> wrote:

> This reverts commit cf517fef601b9dde151f0afc27164d13bf1fd907.
>
> The commit cf517fef601b ("pinctrl: aspeed: Force to disable the
> function's signal") exposed a problem with fetching the regmap for
> reading the GFX register.
>
> The Romulus machine the device tree contains a gpio hog for GPIO S7.
> With the patch applied:
>
>   Muxing pin 151 for GPIO
>   Disabling signal VPOB9 for VPO
>   aspeed-g5-pinctrl 1e6e2080.pinctrl: Failed to acquire regmap for IP block 1
>   aspeed-g5-pinctrl 1e6e2080.pinctrl: request() failed for pin 151
>
> The code path is aspeed-gpio -> pinmux-g5 -> regmap -> clk, and the
> of_clock code returns an error as it doesn't have a valid struct clk_hw
> pointer. The regmap call happens because pinmux wants to check the GFX
> node (IP block 1) to query bits there.
>
> For reference, before the offending patch:
>
>   Muxing pin 151 for GPIO
>   Disabling signal VPOB9 for VPO
>   Want SCU8C[0x00000080]=0x1, got 0x0 from 0x00000000
>   Disabling signal VPOB9 for VPOOFF1
>   Want SCU8C[0x00000080]=0x1, got 0x0 from 0x00000000
>   Disabling signal VPOB9 for VPOOFF2
>   Want SCU8C[0x00000080]=0x1, got 0x0 from 0x00000000
>   Enabling signal GPIOS7 for GPIOS7
>   Muxed pin 151 as GPIOS7
>   gpio-943 (seq_cont): hogged as output/low
>
> We can't skip the clock check to allow pinmux to proceed, because the
> write to disable VPOB9 will try to set a bit in the GFX register space
> which will not stick when the IP is in reset. However, we do not want to
> enable the IP just so pinmux can do a disable-enable dance for the pin.
>
> For now, revert the offending patch while a correct solution is found.
>
> Fixes: cf517fef601b ("pinctrl: aspeed: Force to disable the function's signal")
> Link: https://github.com/openbmc/linux/issues/218
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Patch applied for fixes, sorry for not getting around to reverting it
myself, but the commit message got really nice in the meantime :)

Yours,
Linus Walleij
