Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43DDA196035
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2020 22:08:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727352AbgC0VIF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Mar 2020 17:08:05 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:32775 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727354AbgC0VIE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Mar 2020 17:08:04 -0400
Received: by mail-lf1-f65.google.com with SMTP id x200so1881420lff.0
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2020 14:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vy4A4qxxBdA1VleutrEnlGSM+k4IB/RyFCwjbH/DwRs=;
        b=insSbL1QKr3lV5AjtxrrpT3lHkcvsXqses2tRsZBuLG1gwklF0Y+N9EVvzO07/hLsU
         wu7zN34y5FLWLN1QLMBlpmL2STUMMAzQAF6tn6tg0u1uOjM74xN7q2yogJX5qzuPbGEH
         Lqt+dYUamNPhBQZSOKc47DW762uhfVqspYXWTddaXEu2ykfgBgpWzthwxPwSBov1/InY
         s4nv0AARFXvOo5+nzswznHeguw6+EedK9hShcRc06x2wu97IvqF96Ap4/hfn3+sXlpgI
         yN1bTDXjyZSxMYQE7GzhErFJYfgV3AXbBd4P473sH8JuScGH6LSMOQ5aOfznVunftSWt
         N67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vy4A4qxxBdA1VleutrEnlGSM+k4IB/RyFCwjbH/DwRs=;
        b=cdyt8qsEOUlFS7ReMXHlolY4pB5Tdo/nXJuZ9pUv7r401QbLHnB13ytwKMgSErUsaS
         eacrV36A24vky5AkiTZbyyiGBouIvwTUgKxfcjBlNxROFc3Fz///DMFoV14oHvR943gS
         nHZR5Qpta6cz7KTd/3WGH9Jg6mwrCIoeuV4GIjZdYwhsEERG/NJ3gWfFqRE28SRUL1iR
         gi9Jz82IwW1dszpmodFotpy1VGoczaG6MJ61WSvrkDOhvU8mCBSjeCvYvG7wLoBk32mA
         xHcnSLizHs3+q7e7hVdCNs6gbeWE29Y3F85EzJiq5jssQlhJR6EBvPO05QSy1qip14be
         jLdw==
X-Gm-Message-State: AGi0PubHPgvP6mFTJxylnNURAcs+vQFdQZthYPFc1dWgAkHLq4t1zlJM
        YN0J3JnItNgmtq5EHJZiO7FTbI3zDS4BatU0iVG46Q==
X-Google-Smtp-Source: APiQypJ76gczVMcd8gIpx1lrB7rS9+3XkZL25VcWYPLe4V0BJq4mARvycmKskia8Vsz2vK5dkIxe3xkmkoEOmu4PDwI=
X-Received: by 2002:ac2:5b49:: with SMTP id i9mr749117lfp.21.1585343282366;
 Fri, 27 Mar 2020 14:08:02 -0700 (PDT)
MIME-Version: 1.0
References: <8a6f91b49c17beb218e46b23084f59a7c7260f86.1585124562.git.baolin.wang7@gmail.com>
In-Reply-To: <8a6f91b49c17beb218e46b23084f59a7c7260f86.1585124562.git.baolin.wang7@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Mar 2020 22:07:51 +0100
Message-ID: <CACRpkdZr7aexy3cbF+VemXyQYKJ_VQkFD5svEO9COcxAqKNKpA@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: sprd: Use the correct pin output configuration
To:     Baolin Wang <baolin.wang7@gmail.com>
Cc:     linhua.xu@unisoc.com, Orson Zhai <orsonzhai@gmail.com>,
        Lyra Zhang <zhang.lyra@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 25, 2020 at 9:25 AM Baolin Wang <baolin.wang7@gmail.com> wrote:

> From: Linhua Xu <linhua.xu@unisoc.com>
>
> The Spreadtrum pin controller did not supply registers to set high level
> or low level for output mode, instead we should let the pin controller
> current configuration drive values on the line. So we should use the
> PIN_CONFIG_OUTPUT_ENABLE configuration to enable or disable the output
> mode.
>
> [Baolin Wang changes the commit message]
> Fixes: 41d32cfce1ae ("pinctrl: sprd: Add Spreadtrum pin control driver")
> Signed-off-by: Linhua Xu <linhua.xu@unisoc.com>
> Signed-off-by: Baolin Wang <baolin.wang7@gmail.com>

Patch applied.

Yours,
Linus Walleij
