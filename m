Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BADB27CE18
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 14:51:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728470AbgI2Mva (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 08:51:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728393AbgI2Mv3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Sep 2020 08:51:29 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41E5AC0613D2
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 05:51:29 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id b22so5321873lfs.13
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 05:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4ptsriY4LqRV3GJ566RNPaiV+XmYiNhIg946yy5oC2g=;
        b=C1oMWXhl/V1we8SiQv7MD3uFufVOKUTx1KFYS3ZI3EMF5mo4zflrkl/KNYXDL7r9Es
         cFSk/006NTDo233joIyrpSe3WP/glDonquZa8lFyPbzHO5E9d3WRe5bWA0aQPHy9G2d3
         CEGYDADd//aSSrN9Apffy5e0CZZArqxDe0t5Uk/MS+2HjOwUVsbW1xoL9plDoQ18dgD0
         pmaCC9xpy/Q79VICJs1PIohTlMCuCIkdgrgbD5w5723sAQVXiNNVBT3WuuN2x1mt5pgr
         zjtpTKBdj9DCIV5+jHZiGAGL9xlc7tQgITfuuZh8N08Kp1w07y96lBKAKzknr7TI6hoP
         MKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4ptsriY4LqRV3GJ566RNPaiV+XmYiNhIg946yy5oC2g=;
        b=B1OnKtRJSZETD8lxPkM1YpRe9wRA7r7zFKWu2AqHrBFXVZcjbN2yoSUVF70ee6D2Fv
         DrZxHSKiX8ojoyDW6IE2I/JVaOP3Nl/Fi/BXibAx4a9c34XUqQehd3YSpp2FehOiyRDc
         soIm1DkvF1SeTLJyL2vvbpYrEB06tKVZQYhSSpPNF4RPtVofV+SP5VULQ8MEh5nFSjQH
         ULSNhZhKy6I4kc4E9QVesSKbE2XSA2XP2yV57Q1OJhgu5gwD6a243elG2G9OMAOAfsHK
         fyUEJM9v49ouqCa8bv5wscMeWXxE8PTL0gfD+enW+DV2fxFE3USXMrJUfB/sDWuZLeyr
         E2uA==
X-Gm-Message-State: AOAM530m3bQbtfaMKy4uRqM5P6UyJRVFQ+RucS/oPor2ZSDfTuIKWyvM
        5v8/EgutjsICqFe+SNrOMzjB6YE9TlijhVPntt+qHg==
X-Google-Smtp-Source: ABdhPJzAklLFWTOhXE7N9aEIT8GTpcr3Umi0D1/nm0zTd6rrhgvTwNP0yZm6xyWGCQSyOiDqLPaAZ2G3phObiGG1cWk=
X-Received: by 2002:a19:520b:: with SMTP id m11mr1033290lfb.502.1601383887479;
 Tue, 29 Sep 2020 05:51:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200913210825.2022552-1-drew@beagleboard.org>
In-Reply-To: <20200913210825.2022552-1-drew@beagleboard.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 29 Sep 2020 14:51:16 +0200
Message-ID: <CACRpkdZXu9g_Rq7707-6hXqPVfbxPBcrnR8KwLm+zOgS_EabAQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: single: check if #pinctrl-cells exceeds 3
To:     Drew Fustini <drew@beagleboard.org>,
        Tony Lindgren <tony@atomide.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        Trent Piepho <tpiepho@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Sep 13, 2020 at 11:17 PM Drew Fustini <drew@beagleboard.org> wrote:

> The property #pinctrl-cells can either be 2 or 3.  There is currently
> only a check to make sure that #pinctrl-cells is 2 or greater.  This
> patch adds a check to make sure it is not greater than 3.
>
> Fixes: a13395418888 ("pinctrl: single: parse #pinctrl-cells = 2")
> Reported-by: Trent Piepho <tpiepho@gmail.com>
> Link: https://lore.kernel.org/linux-omap/3139716.CMS8C0sQ7x@zen.local/
> Signed-off-by: Drew Fustini <drew@beagleboard.org>

Tony, does this and the other patch look good to you?

Yours,
Linus Walleij
