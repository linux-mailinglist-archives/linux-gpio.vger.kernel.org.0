Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DCC3285C11
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Oct 2020 11:49:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727712AbgJGJt0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Oct 2020 05:49:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727302AbgJGJt0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Oct 2020 05:49:26 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74490C0613D2
        for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2020 02:49:24 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id z8so1527518lfd.11
        for <linux-gpio@vger.kernel.org>; Wed, 07 Oct 2020 02:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NNobPfLlnLb6C9CYll17SgTtSvvCXgB1jvX69XN+MLo=;
        b=wOctlD7llVVGY0VfOM8yY8Ae2vegfGWt/bdNMOy8Hv3WSZpce23A9IAum9HyzGomL7
         s3o8PVw6Cktm17QJpdVWzlTliXM974vXZW854gHN/XHF8Y0pDJilzGGD/VnYCJmM9puH
         t9dorri3soFh223bBWXTsTQgO4fxmT5LGV8InRHeo8gJI0ZO9mgf6WO4oB+FgsFzClaU
         mwTogN+sCkftJOku1sP612xpBVD/G5WjCvz8fE/5xmwFGoYVNaSdxBVYIRS4tbEW8H5I
         QFRk3TbS+EfNzjjc1LCmb9XQ7rnrrNoFcTOcK2RJNMLZ7U4PnVhskyBarFMiMlFGE6Ov
         Qsxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NNobPfLlnLb6C9CYll17SgTtSvvCXgB1jvX69XN+MLo=;
        b=AbzLUHC9dO4c0vCBe6KGqm2oRKeTxi2dC9wEI9lRDAMHQcNvef3ErcXTwiy+oPDLFr
         R0CYbKQcUwAYf8Gbs0NcNC2hGJ6GPCjrzXMwUiie4WqeKJk2OZml5PgfYrjmdQcC4L80
         Lhsm2M/sN7e+dOcCvFplTS6vEWMgq3jxL6PIrn1RzMCzcQLZVfY7w4VMwHAy7WO1AOZq
         BuUfkmgMH+VSgKJGKojNotJpLZI32Cw8R5djc6Vslgb+Dy7TZFp6qV4e7Y12lhwPd3/Z
         zwbhKpAfVIS64+7lz+eRHspdEcG0Y/JLYHXii4CAN1SJ7ZDIq6HY8WnbRQJBMUqFjQYy
         qD+w==
X-Gm-Message-State: AOAM531+Kfiel6lMTBqVJM7+3K0jTFZwvhP5CFyVzS5TEEelNYhACFF2
        A/vgGIBk6z0MCc9UgCIVHelvy2rjpBg0Sm4OCBcOzS8/6BwtBA==
X-Google-Smtp-Source: ABdhPJzYkixnKYR0rwS+fBqx12OBPbTtBoiz/I1f7YwNYyLV5xcPAggG0oIIHtbmLjsFyNpJKOe00FU/so8VIgvSsuY=
X-Received: by 2002:a19:e55:: with SMTP id 82mr630293lfo.571.1602064162911;
 Wed, 07 Oct 2020 02:49:22 -0700 (PDT)
MIME-Version: 1.0
References: <20201005125049.26926-1-geert+renesas@glider.be>
In-Reply-To: <20201005125049.26926-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 7 Oct 2020 11:49:11 +0200
Message-ID: <CACRpkdYtVc9G8tG9N51170f6_8+DXP7AXsPOh0ZEQ1v94ussCA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: visconti: PINCTRL_TMPV7700 should depend on ARCH_VISCONTI
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Punit Agrawal <punit1.agrawal@toshiba.co.jp>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 5, 2020 at 2:50 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The Toshiba Visconti TMPV7700 series pin controller is only present on
> Visconti SoCs.  Hence add a dependency on ARCH_VISCONTI, to prevent
> asking the user about this driver when configuring a kernel without
> Visconti platform support.
>
> Fixes: a68a7844264e4fb9 ("pinctrl: visconti: Add Toshiba Visconti SoCs pinctrl support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied!

Thanks for fixing this Geert.

Yours,
Linus Walleij
