Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60F6B5ABAB0
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Sep 2022 00:10:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbiIBWKh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Sep 2022 18:10:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231278AbiIBWKd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Sep 2022 18:10:33 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A297782761
        for <linux-gpio@vger.kernel.org>; Fri,  2 Sep 2022 15:10:31 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id t5so4345615edc.11
        for <linux-gpio@vger.kernel.org>; Fri, 02 Sep 2022 15:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=LuG0HhaXO/mnUnmBsR7TF7VmUI6ubxmEMFXRNYAxXaI=;
        b=YSE7dUNvIuRM+tay7UsfWbSZLHNH+UXs4670DKC2KMng2Oi3EySput1A2F2Bmsbp6Z
         P10q0uS4GY8ezpLHcKuUs/c8DWbIPtDZ/SMZCfulkp91r1JYcg+wiaQX59Z/NnCZNCJg
         WDXxJhMdZsui0FaLmc3dExIMkIR+uxu5+SDVsCsUUsI8kHL9TARdkqcrUJV4gXWb5mTi
         sBJKrXv7ONzw6XCwAZLPlBvS2HFwfh/OQ/qB8eqEsNL52Hh65LutyqGe7EOjaMZIDABE
         8j+rMoU2BjqEBaYnmoIiSswO7Co3HTBViC445AAACE1ohXbkxLRogSGm8dXvNFtCHIhy
         mZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=LuG0HhaXO/mnUnmBsR7TF7VmUI6ubxmEMFXRNYAxXaI=;
        b=ETG9UlX9LyvwEJcbJtnWiXAXl4/FIFy558oRlGBu6AQP0lXyESN/ZjzWeJyyOioQAv
         Jq52K/1i9r+WH9spy/UTLWm9U9WKPpyM85wpsky+R8KKS0rqCvPgPxCSWJklidOYfXeD
         n9peIwZFszJiVxhETQOGZKsJhZ/E2tdwGmWCf8CN7GNbs/G21jab4eShjM9JDgpDI/W+
         hcz+mpm26Tq5U/xGxdje/MOGfQe5i/G17OJyQyfUsC/9YVFeIHeLJC1nJivrW1xqu7Hr
         BfL2Kw6FRMpaDt9i+xYqNPaGfeIdWgbi9LIA25SBB7jnu1g97nlcCG8zeoCXWGgCMl2W
         dRwA==
X-Gm-Message-State: ACgBeo1yHgaI8RdFW5JbugdvK4PKfuvgFwE8PO+dEX1VsLvHZ2q6TCbv
        HKlvbHzU55TeLaqmx/zYG2xXumzcEzgqrrPINVr2rA==
X-Google-Smtp-Source: AA6agR5It9DR1aK6tIptCZTq0NmejqzAG+8p2xoZsfpwTs0USKKpeHrl8ga+AMUTA97jK45hLonISq10jnbSitbuDNo=
X-Received: by 2002:a05:6402:2691:b0:43d:ba10:854b with SMTP id
 w17-20020a056402269100b0043dba10854bmr33171421edd.158.1662156630171; Fri, 02
 Sep 2022 15:10:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1662112087.git.geert+renesas@glider.be>
In-Reply-To: <cover.1662112087.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 3 Sep 2022 00:10:18 +0200
Message-ID: <CACRpkdY51qLqDDzi+N4yDwANkmrpp-mtQwDO-A_ithSALNUhRg@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v6.1
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 2, 2022 at 11:50 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:
>
>   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v6.1-tag1

Pulled in, thanks!

Yours,
Linus Walleij
