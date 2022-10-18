Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 058D360276C
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Oct 2022 10:46:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230368AbiJRIq3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Oct 2022 04:46:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230233AbiJRIq2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Oct 2022 04:46:28 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79B711D666
        for <linux-gpio@vger.kernel.org>; Tue, 18 Oct 2022 01:46:27 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id a67so19386661edf.12
        for <linux-gpio@vger.kernel.org>; Tue, 18 Oct 2022 01:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C8yONvRRUQJPuoavB+xNZ/gSoA3xt5GYZLZQQi+w0go=;
        b=nRefSusEqx9L/VcO+LJ8/n65ylL2w6HkuK9rQkkyeDbyS5UZrRNnrH4z5iRVhSIwa1
         GmfmO5Ty085QZKg5899MZYNvWv810eLoSCCENzZxozx3jsIuWqGj8dKFlbmBjRI3x+W5
         abAGpaKv9c9m24CwSxqIaK9V0LY8YQxstzNRmT51ozZRDh14JbTKuagUE8f8Frq7x/4Q
         SwHLsIDnrz4JsDPUiaJqDKO3S/oUwvkgS3OdR/SysFKD/sMfaH8fTSGYol384HAid4v+
         oYHbQAWLMPCB1HetJn6pWEXSceoZPrPQ5keSZlzwHey7EzbJHQCjCdxaU2lm4uhnUDb0
         m1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C8yONvRRUQJPuoavB+xNZ/gSoA3xt5GYZLZQQi+w0go=;
        b=ZeWSMzXBaAYzxr6NuOu0hAhR0hpGt8oBx88wRjHgfx2O+g8PGavoRpBezyb0+O7D/z
         gPc68C0P2BfH7S7tzyUfEv22syUuP2q1kQzASHsu786MJXMVqBcHYebmRigG6PvfHjEW
         VhwBaDApelWDYO6Hz5zvBISG7ihTS+tyhrS4kWx6hxfWdfFEriEJxBrnH3k9rGqu89iV
         qqcDXgwNhE7LYQ2womE4CDydtelVFc/JsqhJyQ3TFr8/c4U/0kZ26R+8/zGhNjpAaKEI
         Uq7DnIbnpNOQr0GtLh0daCcsiP1EhWTooKMfCn3+Ayx1yme/VO4sHVPRcE+DTRHLH8JD
         VSLg==
X-Gm-Message-State: ACrzQf1cI4y7yFfJXGLDObnGP60G9G7Kug3s0vPOod18bXjLLWhoXvIx
        mT6kmIvxlX7iyT6C8u5X4ANlyOLyMzs2TbTwlaXHgA==
X-Google-Smtp-Source: AMsMyM5NcWmisEzHV59uUQHklByRJFIqWOZcpu4+XDbYo0YoIKJjnuyc6uWEd4Ko0V3yzD60DhsEWB+sXpCi358bd/s=
X-Received: by 2002:a05:6402:448:b0:45c:8de5:4fc with SMTP id
 p8-20020a056402044800b0045c8de504fcmr1612720edw.133.1666082786025; Tue, 18
 Oct 2022 01:46:26 -0700 (PDT)
MIME-Version: 1.0
References: <20221013215946.216184-1-marex@denx.de> <CACRpkdZG4a2SsNiunxz0SHR6kuXLX34LZcYp0dGakDigwbGdHw@mail.gmail.com>
 <86fb901a-ca3a-cfdc-8984-1af9235d5323@denx.de>
In-Reply-To: <86fb901a-ca3a-cfdc-8984-1af9235d5323@denx.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 18 Oct 2022 10:46:14 +0200
Message-ID: <CACRpkdaW55-KGKNTTStgbteHn9Kp9E86y1+fTsFBXuV3v3KEiQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] gpio: mxc: Protect GPIO irqchip RMW with bgpio spinlock
To:     Marek Vasut <marex@denx.de>
Cc:     linux-gpio@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 18, 2022 at 10:33 AM Marek Vasut <marex@denx.de> wrote:
> On 10/17/22 12:23, Linus Walleij wrote:
> > On Fri, Oct 14, 2022 at 12:00 AM Marek Vasut <marex@denx.de> wrote:
> >
> >> The driver currently performs register read-modify-write without locking
> >> in its irqchip part, this could lead to a race condition when configuring
> >> interrupt mode setting. Add the missing bgpio spinlock lock/unlock around
> >> the register read-modify-write.
> >>
> >> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >> Reviewed-by: Marc Zyngier <maz@kernel.org>
> >> Fixes: 07bd1a6cc7cbb ("MXC arch: Add gpio support for the whole platform")
> >> Signed-off-by: Marek Vasut <marex@denx.de>
> >
> > Unrelated, but Marek can you have a look at this MXC patch since
> > you're obviously working on the platform:
> > https://lore.kernel.org/linux-gpio/20221007152853.838136-1-shenwei.wang@nxp.com/
>
> Errrr, that's i.MX8, which is completely different chip than the i.MX8M
> (except for the naming, which ... oh well). I work on the simpler i.MX8M.

Yeah, I think a part of the problem is that the MXC GPIO is not connected
to the back-end pin controller for i.MX so one rarely know which SoC
it is used on.

> But looking at the patch, don't we already have a DT property which lets
> one set GPIO as wake up source, without massive enumeration tables in
> each GPIO driver ? It seems to me that's what NXP is trying to
> implement, per GPIO wake up.

I had to bite the bullet and write a longer reply, hoping the i.MX
and MXC maintainers wake up:
https://lore.kernel.org/linux-gpio/CACRpkdaKncznz5qej6owA2OGMeqbrif9e_QO3CWN6+sGhEApDw@mail.gmail.com/T/#mac3a8d5399c486657c5e168107ed591694d4b155

Yours,
Linus Walleij
