Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C19855A5788
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Aug 2022 01:26:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbiH2X00 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Aug 2022 19:26:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbiH2X0Z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Aug 2022 19:26:25 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B46713CBDC
        for <linux-gpio@vger.kernel.org>; Mon, 29 Aug 2022 16:26:23 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id y1so7578752plb.2
        for <linux-gpio@vger.kernel.org>; Mon, 29 Aug 2022 16:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=fJol7oO+hvz4xaJdqn1KO5H6P7mdkaSjUFxPLG8Bqso=;
        b=GGMyH56I4s4ILsWwMifDrlWbdLVk5MwjIyicn/p7yxMfzjm2+er3oNQQAoJ/QznylC
         AUlaNb8Lgxn99r69Os/woXS0/nFA96DRfh9kuFBGw+FC+S3Q6iHE7ZjwbtnFmnymoGuq
         DlKGyxGwGIWRyECNKUlpwj9sBJ0CaXdrrloFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=fJol7oO+hvz4xaJdqn1KO5H6P7mdkaSjUFxPLG8Bqso=;
        b=Tyn5mAu1wnZ+kt36VBAf2GYODfK6M8mQFYJqRmsxvKtSSpJQ/46wmZqettnKZSltBF
         60skx5RTln9K1gqS6bgspQcebDKYcLHiHWo3V4qQnpQ07N4ndYJXISieXBc5LEwDectn
         g5RymSOs0UvaBTLpKZ8duG2UJHUAt64TW6J6QSiTuE2m+0hjAdBip+mD0gv39xdt/yJa
         pXUnk/NF2D0g/MAT/CavxuzqTn6OInIHDIZA2gD79s/NZ9fl6Vfj7LHXRjd3fmtotbA+
         sWmQF/SBu3gi4EmmpoUWhtEl8ERJfONDyUydfYwzYQwj2RBaBRLCTk12WKuHl0DPbohE
         wZQw==
X-Gm-Message-State: ACgBeo3T6XD1VP6likxBlbRIryAZLcQpOT4AqXNla9+nrEfQSpIud8wS
        P7fK7GDAOLUVskFarYkGbC1WlA==
X-Google-Smtp-Source: AA6agR447AyRb//SpSacvh/4alApqRH8PoVfdzuz/J8rRqpUUbCsZOieLaVx8Ao7FM6j3SMlpllssQ==
X-Received: by 2002:a17:90a:c402:b0:1f8:c335:d4d7 with SMTP id i2-20020a17090ac40200b001f8c335d4d7mr21033415pjt.242.1661815583208;
        Mon, 29 Aug 2022 16:26:23 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:1031:748:b358:36a2])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902ce0a00b0016c1a1c1405sm8096217plg.222.2022.08.29.16.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 16:26:22 -0700 (PDT)
Date:   Mon, 29 Aug 2022 16:26:20 -0700
From:   Brian Norris <briannorris@chromium.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Chen Jeffy <jeffy.chen@rock-chips.com>,
        Doug Anderson <dianders@chromium.org>,
        Heiko Stuebner <heiko@sntech.de>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/2] gpio/rockchip: Toggle edge trigger mode after acking
Message-ID: <Yw1LHPKumlKRtGTR@google.com>
References: <20220820095933.20234-1-jeffy.chen@rock-chips.com>
 <20220820095933.20234-2-jeffy.chen@rock-chips.com>
 <CAD=FV=X0qJ2OC1SrAmhSQ5YeKEwvsSCbfVGPh457YYEuPCbRtg@mail.gmail.com>
 <5cb0a457-b667-76e5-d383-6e93457d5d12@rock-chips.com>
 <CACRpkdY1jQH+-o6y84w0WtJT1erRnJzCcg0jjgRHVDUw4q97QQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdY1jQH+-o6y84w0WtJT1erRnJzCcg0jjgRHVDUw4q97QQ@mail.gmail.com>
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Fri, Aug 26, 2022 at 10:54:08AM +0200, Linus Walleij wrote:
> On Tue, Aug 23, 2022 at 4:50 AM Chen Jeffy <jeffy.chen@rock-chips.com> wrote:
> 
> > The thing is, we are currently toggling the trigger mode to make sure it
> > matches the current GPIO level (e.g. level low -> rising edge mode),
> > than ack it in gpio IRQ handler.
> 
> Yes this is an old trick, I don't know if I invented it again for Linux in
> commit cc890cd78acd7ab03442907d354b6af34e973cb3
> in 2011, surely the trick must be well known.
> 
> Back then I did it like this:
> 
> +       val = readl(U300_PIN_REG(offset, icr));
> +       /* Set mode depending on state */
> +       if (u300_gpio_get(&gpio->chip, offset)) {
> +               /* High now, let's trigger on falling edge next then */
> +               writel(val & ~U300_PIN_BIT(offset), U300_PIN_REG(offset, icr));

This looks pretty close to the right solution, but you still have a
race: a falling edge may happen right between the get() and the
writel(), and you'll miss it. You're in a little better shape than any
of the rockchip proposals so far, because at least you do the ACK before
this step (Rockchip doesn't). But you do still have a narrow race
window.

I think you need to iterate on this, and check the status again
afterward, looping until you are sure you either got it right, or are
leaving an edge still latched.

And at that point, I think you have the solution I recommended in my
other email :)

> +               dev_dbg(gpio->dev, "next IRQ on falling edge on pin %d\n",
> +                       offset);
> +       } else {
> +               /* Low now, let's trigger on rising edge next then */
> +               writel(val | U300_PIN_BIT(offset), U300_PIN_REG(offset, icr));
> +               dev_dbg(gpio->dev, "next IRQ on rising edge on pin %d\n",
> +                       offset);
> +       }
> 
> Notice that I read the current level of the raw input to decide what the next
> trigger should be. The Rockchip driver does not do this, maybe that works
> better?

Actually, it does; that's what the 'ext_port' register is doing. The
question is when exactly to do this toggling -- before or after the ACK,
and with what sort of ordering to ensure you don't end up at the wrong
polarity when exiting.

Brian
