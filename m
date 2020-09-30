Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01D2427E5A9
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Sep 2020 11:51:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729209AbgI3JvP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Sep 2020 05:51:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728695AbgI3JvO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Sep 2020 05:51:14 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6C24C0613D0
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 02:51:13 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id b12so1350428lfp.9
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 02:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wO+8kMzgsuDmMLo7G30wB5sG1xa3BEBZziOy+MymYXk=;
        b=tUtX71vy9tkoqQ62geyvq12wiO77un7b6TRqnG+ENxpQHgnumjwFS1bqF0b8mGULdD
         qInUR3CpLEeBM4dgrl/3ul/9IlRnkO4q9zFRlQNDNSLCVpLi0lZkCrRyGfzHjA5Jv1VW
         jx7ntT36DDdF28gnuPM2gKhPec0JeXdYV8LbDPwv63C+KjoiNrYc/ViOpSQ5XWuxbiRn
         fHeUb0O9TRsm1Ep6K22wzYmpL3ef0WwA2c3A4VsC42k5P52eW1h9nyiwPuae58mZyjax
         /6Km/DXxFYce3s8evh3zagKef08Z7LG9pAzqKPk5O49thHu645PLmf2mEVq+uRdARX3W
         dkKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wO+8kMzgsuDmMLo7G30wB5sG1xa3BEBZziOy+MymYXk=;
        b=LLwp//XFiESxjjDR9cJcPC0tHIovMkb6hyYOZhHJi+7j/N+csflgX6ZIE0KsTAkrbm
         8gws940SVxO0MT8IfsGX4fJRwJcr40p1dImAsRgBCkButSnX0+xwSZRuVa46YsRM6Vzy
         DnFIZemXEAB7bx4vfO5IQVNbTT/jquV9Cc807JpGv90b9VJvX/VnL8e6KWAetab9MaQV
         /NeL5kJVkostZmmmAgVirg6RRrIEgxfNJE+6C9batKU5e3LJRY1656Qlf9YdPLCBEydB
         CXYX/eoaT0U4aGcH1DjC0EsAUcnkP5t/XiQWomBYDvTC2ZudPXvKfiLmaV/6/4mPPOIr
         jeCA==
X-Gm-Message-State: AOAM530sf/+kJglN7sqA6oXPWlnaEM0MO43rsjEuDFf/RzpH0uvkmud8
        Cd4HTj9V8JNU3KzoGJqtuA3CbddStQFJhfVZreMBzIP7agKdjw==
X-Google-Smtp-Source: ABdhPJwVN/b8vttgt3uOMaBEvUr+oplFF2B0xPQJVcc+yGWSBU4xGd0qF/xKmXqUhsenbuPNWV0rGcf2C9xSeYz4Yoo=
X-Received: by 2002:a19:6c2:: with SMTP id 185mr545793lfg.441.1601459471538;
 Wed, 30 Sep 2020 02:51:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200930092053.2114-1-mike.looijmans@topic.nl> <20200930092053.2114-2-mike.looijmans@topic.nl>
In-Reply-To: <20200930092053.2114-2-mike.looijmans@topic.nl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 30 Sep 2020 11:51:00 +0200
Message-ID: <CACRpkdbfqGsvHX_O21oLaCWim=A-OpBV-NzvSvbt5SfjxXN+oQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: pca953x: Add support for the NXP PCAL9554B/C
To:     Mike Looijmans <mike.looijmans@topic.nl>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 30, 2020 at 11:21 AM Mike Looijmans <mike.looijmans@topic.nl> wrote:

> The NXP PCAL9554B is a variant of the PCA953x GPIO expander,
> with 8 GPIOs, latched interrupts and some advanced configuration
> options. The "C" version only differs in I2C address.
>
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
> v2: Split devicetree and code into separate patches

Patch applied.

Yours,
Linus Walleij
