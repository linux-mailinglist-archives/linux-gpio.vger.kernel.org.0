Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A471D2DE730
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Dec 2020 17:06:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728291AbgLRQGR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Dec 2020 11:06:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728270AbgLRQGR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Dec 2020 11:06:17 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60DCAC06138C
        for <linux-gpio@vger.kernel.org>; Fri, 18 Dec 2020 08:05:37 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id y8so1624378plp.8
        for <linux-gpio@vger.kernel.org>; Fri, 18 Dec 2020 08:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JvQ/BINPnyw/Z+xkBcWgeCAgXnBsbqCx6vPm+QC3kZ4=;
        b=BMqQy7/uIgKgNrXW/7kNQKky7DxC8dULACWsgs0VNKziAyer0p5IWBDX5sXY2pHtvn
         ENhU5o+PBVJTf1bSaTlg0gVy8c3mgrkVwk5VCcAFY5yCgXrkBbkB0uMF99N/Q8hnjggV
         2OrxU+nFnXt14AlMFsGMmYSojxrIxJNN3c4O+EPjHP3hWtyPhGq1puLEPH/jKGIHKlKl
         2GG4Jj0WTdI6sgyDHGJQngWOZum35InCnvJGaFiOelYinzyi952DR/AMdGhUiETLetG0
         rH94yoWUzub/8h84rBCS0zKsJk4KXPMXeliZTVX4HJ1JmciVi0Uppcf2SxWBivIG8ynW
         VsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JvQ/BINPnyw/Z+xkBcWgeCAgXnBsbqCx6vPm+QC3kZ4=;
        b=AMPggZsrpZLK4YUDaPh2dJ8GfWcBaUyNyY/x5s8ojCNGioy5yYfieYhcwiXoHOwRo+
         HTDn4Alg4qVoaIfsthrPE7XP4QEv00pzope3StC1yoBWrdrrtiKTCoQx7/1TPEYMpX3w
         D94Ml3Zon7ZLq/isl2igPvSzgR7WiePCwn2meg8zpZv4RZr6FI3JIrwYN7g+urXLlQtW
         dDlNTYzOlIZoTE/hjYdRaYe1B5L/CzXwVkHCtIbEpVNcCjM+HuHQ0Ri7nYHE6gUa66E6
         Mn1Gyhc0vCoL7YAb8iNx8J6Z28S2fB9vDUSuNmxgSiIxcsSorGGb774zdaivtvzLV4iq
         6ZIQ==
X-Gm-Message-State: AOAM531hmTZyj9qVdUfY4BEeFEt2KCGTTGSNmXABYK+0zeVcpPXgY/io
        GWaDH5ywlex/2rTb0S4rdP+Rbe0+h3ys6GUVMvjs/Pd9cZI=
X-Google-Smtp-Source: ABdhPJwaeYOO57UXQazH//ljkSm6TH32vC6OwtkBNpx1ei8tbfU84hQta9xBbxNluW6BEAr5kafVnC5gz+u98U5zzx8=
X-Received: by 2002:a17:90b:a17:: with SMTP id gg23mr4997775pjb.129.1608307536872;
 Fri, 18 Dec 2020 08:05:36 -0800 (PST)
MIME-Version: 1.0
References: <20201215123755.438369-1-linus.walleij@linaro.org>
In-Reply-To: <20201215123755.438369-1-linus.walleij@linaro.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 18 Dec 2020 18:05:20 +0200
Message-ID: <CAHp75VdhVk_6VcYDWpx1tabafPENQcrPc_4KGE_yT1JmDG0cjQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: Skip over NULL and (empty string) line names
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Guillaume Tucker <guillaume.tucker@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 15, 2020 at 2:41 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> The core will warn if we try to assign the name ''
> (empty string) to two lines. Actively ignore NULL
> and empty string in the name assignment loop.

> +               if (!gc->names[i] || !strlen(gc->names[i]))

> +               if (!gc->names[i] || !strlen(gc->names[i]))

> +               if (!names[i] || !strlen(names[i]))

Can we replace strlen() calls by a simple check of the first byte?

names[i][0]


-- 
With Best Regards,
Andy Shevchenko
