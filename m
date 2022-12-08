Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D51076478C0
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Dec 2022 23:22:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbiLHWWA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Dec 2022 17:22:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbiLHWV7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Dec 2022 17:21:59 -0500
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA3A480A06
        for <linux-gpio@vger.kernel.org>; Thu,  8 Dec 2022 14:21:57 -0800 (PST)
Received: by mail-yb1-xb34.google.com with SMTP id s11so3423236ybe.2
        for <linux-gpio@vger.kernel.org>; Thu, 08 Dec 2022 14:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mSn95JkPY6TVNHY/PSTIka32CmV7echhE1MkCmWMGD4=;
        b=OzblgKVKuuMKVzB8Hd9IiFeSvbC62NxsS8GTDe9A8IW9f6cN7bvvUR7tgXetCRXxtH
         5LjWup2LJy5NOmZcMQljIHQECmFNUYo5NJ1euHbfvgePoe75GZYbbJbZeilMSYA86fTE
         E2WQKx10g1dceoj5tVQsSphCxki3IHffdHUXrGH3Pfkj9hIK7VVawTaek/LauRLJvtDZ
         F78Qf6NayycniBU0WX5Bk0+mS8IdCFbhLjRnMpBq8ZtZodY6xIHx9sCGxHiUe4axvndG
         M8S7D2wnvc2p1XiKZY4brgIJcRyBPeBA8i08VMr4oRxU/BmHn/mP5GPvjHVS+yFlLOBo
         Bw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mSn95JkPY6TVNHY/PSTIka32CmV7echhE1MkCmWMGD4=;
        b=KQBf8S5gOU2j2w4+9KTQvfnKq/N9Q4aTUCJBQyfiw/pstItS+RkEoVMRHwc+NOBmVa
         RQhkvG1XnzmAKHiCwjIhHaJq3ao+uKNmbZGn/JsDU4yRCuoQgydF/ICS8tV7uzgZypgU
         N+tlosbA8bBmSrIwq+khDLoFq4LmQWtcfuR1UaX0uMRtyCo9bmr9rzXDG6seL11Jv4k0
         Huaw91N1DqO1MpL8tnnzrpOuwm/Xqo499uOSR0eMHX3ycBX0NuhXdYD4dFAq495NBtuW
         4jU+B8jDe4+Ep8MORPbdMqxhG2TYIT1Na4VenGpuKKrY3i+wW4yDlJLEzU/l3yAOj5dd
         SCYw==
X-Gm-Message-State: ANoB5pnah/RntXY1ExwKlWHU1Qnbke7seKgKF2+xNfgi1q8/g76tp1a7
        iU0uqVW6JaeVjdHK2haUphN4FkRQkG6IMWrCzsZCLw==
X-Google-Smtp-Source: AA0mqf7kBOD6J1jsQzDMsu9kU1DoxMapNYoo3MvfqzvOGcSWfUqJLSOhTvC7fD36eLemHdn7iQSxHX440zZMMQBW40Q=
X-Received: by 2002:a25:8e82:0:b0:6d2:70d5:3ed0 with SMTP id
 q2-20020a258e82000000b006d270d53ed0mr94194687ybl.457.1670538117004; Thu, 08
 Dec 2022 14:21:57 -0800 (PST)
MIME-Version: 1.0
References: <20221208093704.1151928-1-Basavaraj.Natikar@amd.com>
In-Reply-To: <20221208093704.1151928-1-Basavaraj.Natikar@amd.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 8 Dec 2022 23:21:45 +0100
Message-ID: <CACRpkdZZY8B5iicQ4rddC0j455Cuj=aXBGtUjHfXDsViCMbTFg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: amd: Add Z-state wake control bits
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc:     Shyam-sundar.S-k@amd.com, linux-gpio@vger.kernel.org,
        Rajesh1.Kumar@amd.com,
        Mario Limonciello <mario.limonciello@amd.com>,
        Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Basavaraj,

thanks for your patch!

On Thu, Dec 8, 2022 at 10:37 AM Basavaraj Natikar
<Basavaraj.Natikar@amd.com> wrote:

> GPIO registers include Bit 27 for WakeCntrlZ used to enable wake in
> Z state. Hence add Z-state wake control bits to debugfs output to
> debug and analyze Z-states problems.
>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
> Tested-by: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>

The patch is overall fine, but as debug-only patch hardly urgent
so it will wait until kernel v6.3.

What I want to ask is how this bit:

+#define WAKECNTRL_Z_OFF                        27

Relates to this:

static int amd_gpio_irq_set_wake(struct irq_data *d, unsigned int on)
{
        u32 pin_reg;
        unsigned long flags;
        struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
        struct amd_gpio *gpio_dev = gpiochip_get_data(gc);
        u32 wake_mask = BIT(WAKE_CNTRL_OFF_S0I3) | BIT(WAKE_CNTRL_OFF_S3);
        int err;
(...)

if this is some wake up control that is unrelated to GPIO, such
that this can wake up on say I2C traffic on that pin or similar,
is this something we actually need a new define for in
include/linux/pinctrl/pinconf-generic.h
so that you can also implement methods to manipulate it
for real, like setting this from a pin control state or so?

Yours,
Linus Walleij
