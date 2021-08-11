Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 747623E91DD
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 14:49:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230178AbhHKMtY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 08:49:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230316AbhHKMtW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Aug 2021 08:49:22 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C5B9C0613D3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 05:48:58 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id y7so4386992ljp.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 05:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GR+MMrd9XOW5rm81dzQfCFtmEkUJfv7NwFWFwbfborQ=;
        b=W0Nm8Bqom8fG2CTvOVOdaNHCmOv6POACotv2jUKnioHaQeTQussn1eFGzrt/w9UsAq
         703Br3qPDFM7IX0gEmpWCGAUNtbu07XUX1dUD4quYbTrk7cgGz+CusQiCuwB8URnXmPf
         UX5vCB94aDC1bVzQ1dy45r2lRdBZF8fPLrbCp6vNc5+fi+qWj4gi+cTMxVzUxTftaCVF
         01Os8GwxsJXLRiNKj10Ks3e8OP3Jm+pfXhic6lgRq5WfszfgLF9v2j1N0P5CE6/UI3+G
         wnQhGsZmSZw5wAhjf6u+wpXc0JNpkevf/962ZfS091JjBTwOcHSCGlajTII3jS8qvrpf
         x6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GR+MMrd9XOW5rm81dzQfCFtmEkUJfv7NwFWFwbfborQ=;
        b=alRO6DQNbvKVj16DLWSMU3kbqCM38PLLwhdAMyXXbUovuGzHYz6FPJrBYN+UkZPv8g
         3bwrSNYWKsScyOE1lM6b7gnwpKhj+U5zzUauUKWUZfP4LbkCu/ZayaLyppjVZEpMP366
         LS++8s9rt2b2lClgdhqX7rDXrxSgp0bEsitHne/KCvWoFyP3YK4+6fuWkXrkS2q1Q52v
         lZQlCm9M/SGFGRljErrzzIRkX2nIaqr+JhvbCh7MamBu9AeHX05WViYBQOYJ2KhWDOcF
         X7GtXMu/EQfzM/iMuSRp67OOhbrBfQTfrhqx9ZryAj9g2HZ4TfAXF6skB4WIhx7qlGDa
         nOgQ==
X-Gm-Message-State: AOAM530Yo5nKY6BjQs9+7h4kZatjMrP1sdthx1WMkR2xOnnn781aF3kW
        s2xLU0/eReLy5sKhZRXgA+WOJGraEy7F9edt4AY4nQ==
X-Google-Smtp-Source: ABdhPJxEQ5PFNvYyQbJDXisGpYVk211iTHo7KxNddvwCfd2v00OKJtPRjt1cj2iKS63HHjuTyrT0pUXhoclMSkvvZNM=
X-Received: by 2002:a05:651c:1318:: with SMTP id u24mr23231122lja.200.1628686136709;
 Wed, 11 Aug 2021 05:48:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210804160019.77105-1-andriy.shevchenko@linux.intel.com> <20210804160019.77105-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210804160019.77105-3-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Aug 2021 14:48:45 +0200
Message-ID: <CACRpkdZghJFGV8g2wq01VtigKNnb0nTpZ=WtY0tp2j0tVjeNrQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] mfd: intel_quark_i2c_gpio: Convert GPIO to use
 software nodes
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Lee Jones <lee.jones@linaro.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 4, 2021 at 6:15 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The driver can provide a software node group instead of
> passing legacy platform data. This will allow to drop
> the legacy platform data structures along with unifying
> a child device driver to use same interface for all
> property providers, i.e. Device Tree, ACPI, and board files.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Tested-by: Serge Semin <fancer.lancer@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
