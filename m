Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6232F4167BD
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Sep 2021 23:52:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243372AbhIWVyU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Sep 2021 17:54:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240841AbhIWVyU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Sep 2021 17:54:20 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDF7BC061756
        for <linux-gpio@vger.kernel.org>; Thu, 23 Sep 2021 14:52:47 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id x27so31925403lfu.5
        for <linux-gpio@vger.kernel.org>; Thu, 23 Sep 2021 14:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OzZoKQDZ72/TIZ5n5PQCjDKZ/aLZJVe4nOu4P+30/t8=;
        b=n/lKLseJnr+59RI5t6ZUq/unPrDB8OeU5L0NSrqlvqdVaht/rIyOJ+l47gVqFSBNLN
         TULDgRObSeYnLYtnCHi4BE2TUdA0+8905GPrVjaFaiJFwFbqxXAav5UzzyowNC4NJGWE
         gDpmC5/UTxJFVH7XhlIgiPohiOtj40dG6M/HUTAyEW5sc6uGjvrSNmNtSpU2TI0AQKwn
         62JakWCLJWtzNIV86FC86E++eE/jT7+a+IDbpEoj2xweOt00SEoMMGwrllnEuUn0sZS2
         0708OfzLswSVQ1LFA5c4WLbaXdqe5Tzj/NcsZoQ40YIZLWND+KA526I7usV9wfqAdTiL
         LszQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OzZoKQDZ72/TIZ5n5PQCjDKZ/aLZJVe4nOu4P+30/t8=;
        b=ZwckDqXnMlOaGGC3Kwj4fSbOnDIPdaqKgvyFGIMvd+nTCnM6XVL+SEDobb/S2lf7uB
         hFsyaBKxdw9bPTUikYvbuOVnRX5Aeqi22uboDwD4G3tPWu1oAf/Fj9IaR/ujaizp9cZ+
         Nk1mQrI0gFbpPOKiiOUsiQNn4bzTU2xIPXIq3kA0vDhdRCeUjVB9+KU29QPu/b4z/qvW
         FUUpP/1/mdTcMcLuazjwu1hJuaLlNYUU3+ZdqboJqOPaCOyez3iQJKfaiebVd4ERzXEz
         hWtMH0PKpEEbSBIf/Ye7H0Mm6fSZqBGFHR+LItyjSmDreEujL0QFX6HcCZhjeoN270F1
         O+bA==
X-Gm-Message-State: AOAM530QcyWE5Wc6K/Y01KNHN69aJXFH6QkTG4bRcQwlcq70Evz5AApz
        FuBvnbFE2SuPqBhxYG8I3XwblwY8EQ4La8UVmxHjWQ==
X-Google-Smtp-Source: ABdhPJzSavCXS6nxDVN2s1rRJDXqRhNXfyZp30z2Uvc8ETPMwVaX3Qu54L1YIt5i//VPUUTLjJFlzg587HqTLUC8Ruc=
X-Received: by 2002:a2e:89c9:: with SMTP id c9mr7533345ljk.288.1632433966185;
 Thu, 23 Sep 2021 14:52:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210920190350.3860821-1-willmcvicker@google.com> <20210920190350.3860821-4-willmcvicker@google.com>
In-Reply-To: <20210920190350.3860821-4-willmcvicker@google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Sep 2021 23:52:35 +0200
Message-ID: <CACRpkdZAo76iiX2H5Vf_MCjPnzpJyB6H7Ut_Fd11pBx2f9Rb7Q@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] pinctrl: samsung: change PINCTRL_EXYNOS default
 config logic
To:     Will McVicker <willmcvicker@google.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Android Kernel Team <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 20, 2021 at 9:04 PM Will McVicker <willmcvicker@google.com> wrote:

> Switching the default config logic of PINCTRL_EXYNOS to use "default
> y if ARCH_EXYNOS" versus having ARCH_EXYNOS directly select the config.
> This gives vendors the flexibility to disable the config or modularize
> it in the presence of a generic kernel.
>
> Verified this change doesn't effect the .config.
>
> Signed-off-by: Will McVicker <willmcvicker@google.com>

Krzysztof is collecting and sending pull requests for the Samsung
pinctrl portions so I expect him to merge this once you reach consensus.

Yours,
Linus Walleij
