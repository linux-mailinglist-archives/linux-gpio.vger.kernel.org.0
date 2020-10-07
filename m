Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52243285C0A
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Oct 2020 11:48:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727512AbgJGJsW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Oct 2020 05:48:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726411AbgJGJsU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Oct 2020 05:48:20 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D871BC0613D2
        for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2020 02:48:18 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id z8so1524370lfd.11
        for <linux-gpio@vger.kernel.org>; Wed, 07 Oct 2020 02:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=20GH/MytvGYbKKPijdXnWxAJl9+uE7J4D+YmHkLcQ5A=;
        b=S17RO4U0amB2x6k2kTZ9a18WHLzjOusfpWIWq3gOC5WbJcLVOQQ2mXbUadcpfjSLuN
         iq9HbMPS7bsUvfdMQRN0OEww/kG2tmlBZpVnZGfgw64AZbZNiPMLY8MTBbTZXtADdlSY
         JpNA4LV9CHidiERNGKQWk3gLfntluuMxih6wstN+Gt8NwcomqfSG3hX4r/J4kAg+CZ8V
         WmqK4BGMP8vrRcVI9ZeNJt2Iq/BOmP7rGeEtzsVfVJ5hmAHhIdeR1EFJgzi+2p37A2+3
         KRSqRDcp3IAn7uKXTdzSeXnJk35WLrteOP6tZI80rkAGLKBZyNQHZB8Yo4tuTGZu2ISg
         8WFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=20GH/MytvGYbKKPijdXnWxAJl9+uE7J4D+YmHkLcQ5A=;
        b=eqoHAYo2ayBKAVm5AkUBeZuFJgM0q6DZBKgADr/d+H83HPsD4x0NT0RRjKPFqfMnr5
         qnXp+OPsL+5NFoJi/yAS3A5YvV5cKH+l422FZLS+qfKNGpIwfxL4NMz9DrL/G6R4WD3J
         kL2wkm5VyjrZg+zFHS1Ddfbw8qpe/TkKrb4ZOhcoiK4QhygpNJC/oGXhFC+McuFWleGR
         9QxqDkWYkqhzyyaLyjFPGhiQvR9PwOqrFXp9+408hCs5uJmBO0MC7npbe105xNB4vtcO
         Uu/3EgAtHMvzEEv7V9XpFUd1ZS88QzycLPsOWMMf87X4F5Y2D4dR7PAMxILx+JyxwIXl
         PzUQ==
X-Gm-Message-State: AOAM531P7qXgfRnRqMiSW4mdHYKARcwEH6xiRRs51ytbK9Nxc4mbIQIy
        JQC8D76Dp/AUgCZpTLuZHTDpfbp+wpEX84+hyHRjTw==
X-Google-Smtp-Source: ABdhPJzPH5Uv1yv+cQeuLvKQdejQZpjVdeaTjLNvb2JO6s6Fuweb5qiZpIdL9lRhrTSe2A1ziwDNSyID033hvbeRNlc=
X-Received: by 2002:ac2:42d8:: with SMTP id n24mr625051lfl.502.1602064097182;
 Wed, 07 Oct 2020 02:48:17 -0700 (PDT)
MIME-Version: 1.0
References: <20201005140217.1390851-1-maz@kernel.org>
In-Reply-To: <20201005140217.1390851-1-maz@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 7 Oct 2020 11:48:06 +0200
Message-ID: <CACRpkdbctO9cWZZhVQHWkA1DN7YRTsLRo4Ub9g2x7q6BBSD=Ug@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: Survive spurious interrupts
To:     Marc Zyngier <maz@kernel.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 5, 2020 at 4:02 PM Marc Zyngier <maz@kernel.org> wrote:

> The pca953x driver never checks the result of irq_find_mapping(),
> which returns 0 when no mapping is found. When a spurious interrupt
> is delivered (which can happen under obscure circumstances), the
> kernel explodes as it still tries to handle the error code as
> a real interrupt.
>
> Handle this particular case and warn on spurious interrupts.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Patch applied for fixes.

Yours,
Linus Walleij
