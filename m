Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AD5B6B73BE
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Mar 2023 11:21:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230033AbjCMKVL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Mar 2023 06:21:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229964AbjCMKUm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Mar 2023 06:20:42 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 245BB5CC2A
        for <linux-gpio@vger.kernel.org>; Mon, 13 Mar 2023 03:20:17 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-53916ab0c6bso232253867b3.7
        for <linux-gpio@vger.kernel.org>; Mon, 13 Mar 2023 03:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678702817;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Vi6pueiiqHBEvvVToepss8ZMRBiuH3Fz6hqIlRu883Q=;
        b=UAlREfwNnx5QhPupK/68E0wMsyhcDuoQeBqmmw+/DdoKga1nkomH0pghxq2EvXeNLu
         h/KkILi5GWFKAwPnAa4CkI3idyD6C4cIJ3UUXTJiGnkIo/5pUJd2SE11O6e1rMKv3RER
         II42CCIeQE6jTnPQ2SMlKoou3VgLZzqoddUPgTRzce7OEingMKjtjf7QNKHUJBquP5Rw
         ETSJMpuUgC2C10Ij1uIQ8BXOgmKJWB17vOZnKRK1HLKQO6dwoP3vIeQGu/ePG/BITCoK
         w3IYS946qeDKsOpou/raVQ7LBc0AiD9MYH+4V+PKF71tBq6/K9+1RSURV+7Lc2ITH7aL
         W0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678702817;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vi6pueiiqHBEvvVToepss8ZMRBiuH3Fz6hqIlRu883Q=;
        b=EVTjZPPDo04NpAysRIQJrmN7j2gMrhCD/tqhVdgKluD+F67xE0qKguKy1Ga4VjCnVX
         LjbYuNLfDyDkvoKbMm9Y+D7UHSLbbCyYLhX5MiXJfHU/72x457R6sHfNwEufbgoY5P0i
         Pm3IZTeMGgjQIBLMpDyLhJ5SvfvCl9taCsAIn3ZMlUN3Cgcf7+BtcDOD7heJaWzqwpC9
         BNQPVNPUHPfCuDyR0epoonEnD+J6NHnRsm7+DexEFjxVs3W5CIv6aaQ+CDopX/2RNTGY
         63IAoJtq/Msk6CS3rHK85fsQI20V/Ecp0PlG/VPw32KVKrJCDh7nfShY8bPjdGlXwgAj
         5aTQ==
X-Gm-Message-State: AO0yUKWNfrUMSqVuvKyaaf+0mavp23B9/HROqz+2XVGIiDQgBPfyCGoI
        WYXJcDRocyd80gwVsL8dww23O11VK6sXzeL7PvCJIw==
X-Google-Smtp-Source: AK7set8lfmp/J/1rCvskjlrkeUQ7c8cyoB8IRx0GmZjoZRE30z3EHEey6yzilNIHPz2jWULQ6LBO+LHJPohkdUzRUQs=
X-Received: by 2002:a81:ac51:0:b0:540:b6c9:66cd with SMTP id
 z17-20020a81ac51000000b00540b6c966cdmr5502222ywj.10.1678702817069; Mon, 13
 Mar 2023 03:20:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230310140250.359147-1-arnd@kernel.org>
In-Reply-To: <20230310140250.359147-1-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 13 Mar 2023 11:20:05 +0100
Message-ID: <CACRpkdYQOb8dDfyYspLE974k97ZsUH+YKk_AQJbjCpVJXP5txQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: s32cc: fix !CONFIG_PM_SLEEP build error
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Chester Lin <clin@suse.com>, Phu Luu An <phu.luuan@nxp.com>,
        Ghennadi Procopciuc <Ghennadi.Procopciuc@oss.nxp.com>,
        Stefan-Gabriel Mirea <stefan-gabriel.mirea@nxp.com>,
        Andrei Stefanescu <andrei.stefanescu@nxp.com>,
        Arnd Bergmann <arnd@arndb.de>,
        NXP S32 Linux Team <s32@nxp.com>,
        Matthew Nunez <matthew.nunez@nxp.com>,
        Radu Pirea <radu-nicolae.pirea@nxp.com>,
        Larisa Grigore <larisa.grigore@nxp.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 10, 2023 at 3:02 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The declaration of s32_pinctrl_suspend/s32_pinctrl_resume is hidden
> in an #ifdef, causing a compilation failure when CONFIG_PM_SLEEP is
> disabled:
>
> drivers/pinctrl/nxp/pinctrl-s32g2.c:754:38: error: 's32_pinctrl_suspend' undeclared here (not in a function); did you mean 's32_pinctrl_probe'?
> drivers/pinctrl/nxp/pinctrl-s32g2.c:754:9: note: in expansion of macro 'SET_LATE_SYSTEM_SLEEP_PM_OPS'
>   754 |         SET_LATE_SYSTEM_SLEEP_PM_OPS(s32_pinctrl_suspend,
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Remove the bogus #ifdef and __maybe_unused annation on the global
> functions, and instead use the proper LATE_SYSTEM_SLEEP_PM_OPS()
> macro to pick set the function pointer.
>
> As the function definition is still in the #ifdef block, this leads
> to the correct code in all configurations.
>
> Fixes: fd84aaa8173d ("pinctrl: add NXP S32 SoC family support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied.

Yours,
Linus Walleij
