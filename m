Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B4026BB748
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Mar 2023 16:14:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232329AbjCOPOY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Mar 2023 11:14:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232069AbjCOPOW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Mar 2023 11:14:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 338D215C87;
        Wed, 15 Mar 2023 08:14:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C298D616F0;
        Wed, 15 Mar 2023 15:14:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45977C433D2;
        Wed, 15 Mar 2023 15:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678893260;
        bh=1aEGn0I/sJkreuvZWctVb3fO08m2I27PC3lgARoKKRg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jMnGB/X0RGUKUDzg8ge8mix5aU30MmvkInAhVoE2j2wLBR1q4KmZs6yEItwMngx5e
         AaDCtgLNxZyUlnQ1u7Z4c9w1WVJnrAwtuOopB1HpAxo0rQ6sqhIwVQi3wzv2ub+FG1
         ZqpW3e53qpf8AIuwxHfoaodF7riVBz29p7lxAQaS++I+qyKu2J8noHjJmziydMznm3
         1NTJdgGE48WZy5Jh7iSg19NC8wHi4IVhJqqavdwMSGfa0CWmWfBtxq0Gu+UUg2z7tl
         AF+QZWWSeR4lEhitiixzr4E/b3BFzIhXuZikqixrxeYCDIFIOQQ7baVx4BwbpwhCn1
         cRNN1bdb9gA2g==
Date:   Wed, 15 Mar 2023 15:14:14 +0000
From:   Lee Jones <lee@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Tony Lindgren <tony@atomide.com>,
        Felipe Balbi <balbi@kernel.org>, linux-omap@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2] leds: Mark GPIO LED trigger broken
Message-ID: <20230315151414.GZ9667@google.com>
References: <20230314210059.419159-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230314210059.419159-1-linus.walleij@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 14 Mar 2023, Linus Walleij wrote:

> The GPIO LED trigger exposes a userspace ABI where a user
> can echo a GPIO number from the global GPIO numberspace into
> a file that will trigger a certain LED when active.
>
> This is problematic because the global GPIO numberspace is
> inherently instable. The trigger came about at a time when
> systems had one GPIO controller that defined hard-wired
> GPIOs numbered 0..N and this number space was stable.
>
> We have since moved to dynamic allocation of GPIO numbers
> and there is no real guarantee that a GPIO number will stay
> consistent even across a reboot: consider a USB attached
> GPIO controller for example. Or two. Or the effect of
> probe order after adding -EPROBE_DEFER to the kernel.
>
> The trigger was added to support keypad LEDs on the Nokia
> n810 from the GPIO event when a user slides up/down the
> keypad. This is arch/arm/boot/dts/omap2420-n810.dts.
> A userspace script is needed to activate the trigger.
> This will be broken unless the script was updated recently
> since the OMAP GPIO controller now uses dynamic GPIO
> number allocations.
>
> I want to know that this trigger has active users that
> cannot live without it if we are to continue to support it.
>
> Option if this is really needed: I can develop a new trigger
> that can associate GPIOs with LEDs as triggers using device
> tree, which should also remove the use of userspace custom
> scripts to achieve this and be much more trustworthy, if
> someone with the Nokia n810 or a device with a similar need
> is willing to test it.
>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Felipe Balbi <balbi@kernel.org>
> Cc: linux-omap@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Be less intrusive and just mark the feature broken
>   for now.
> ---
>  drivers/leds/trigger/Kconfig | 1 +
>  1 file changed, 1 insertion(+)

Added Pavel's Suggested-by:

Applied, thanks

--
Lee Jones [李琼斯]
