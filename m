Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1100C285C27
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Oct 2020 11:59:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbgJGJ7H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Oct 2020 05:59:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726131AbgJGJ7H (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Oct 2020 05:59:07 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE6E3C061755
        for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2020 02:59:06 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id a5so1326208ljj.11
        for <linux-gpio@vger.kernel.org>; Wed, 07 Oct 2020 02:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KKQOOjn04T7GkwMmz5OrXlYtJd2KqxiO96+i+bYKJvE=;
        b=VZDIwNyOkJpF6oCHFqUyy1PFN8hIoad17B4mRzF40dnUyOyh/65o05khD7hfPfjwPy
         vdTdj4asiEHztzr+oJLoYAaHYAigHjMGGpuX1YEZBlz3oO9Knz0JQX/MbNS7ELjwvrPt
         vsQlMRGB/FDCGgPwEhv3hrbjTOn8CNGwZ+tX8wqVbGrIF4chfNvoZM0pnJBdBWz7gD+d
         oB1Xp3diWpwahPWJ95b8XErjloJSapjIa/Otlq4j+hFTtJiAFmi8wYTheYA6nx801BG1
         0zWhph7triv/+Lb5AeA7pXEEBv+VVWmhnDMlWdQI8k420GC9MU3PEJr36y7DELNVFu1P
         SLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KKQOOjn04T7GkwMmz5OrXlYtJd2KqxiO96+i+bYKJvE=;
        b=ib8+AZJB2MwT1ShJBw6XXiohvdc2zBRiSHQrxIE87478QZfGe6wtjGtoxCtvHYcBsB
         Yy8U+ssj+9ipW8HBQJUutyFV2wxX6N6ro5nEhD+/hXqrKWsYeHnbXDWzbuAEHSEp+JAX
         y5svuOhKbZC+vkoEbS372Dq1bzdG6eJslNmNgCKYr+GR+3OIm22GiW+Fj3GfVP0Knu29
         QILi8jyoZjm7v2lGIKYz+X2Kqa8YZc3ih3wLWtrOCPYV7MDTUeqgmI4sgrvyRfbpaEOS
         YMn4NbbDFafvZvbEs6+zVkJX/sjjwiD5E8lFjq2aukWCPxBLGZB0v60xmMKNCKNHCYAp
         qclA==
X-Gm-Message-State: AOAM531AssyC/tOZOr5JyRcdK9V+s4dSzKNQrkeQ4X892MSpryDWY4gB
        /RHlhPjFPyHnChSLLvaZqmvf1vhLQ2omtPw/rsYZyA==
X-Google-Smtp-Source: ABdhPJwiyu1tG4DSWuw2KhjV8R5X5Q+afnfcyPo8Lmx0Fz3nRf7XTIMmNWlPlPzGJIZWVbxcnF2OS3YP3wPrxQzNVtk=
X-Received: by 2002:a2e:810e:: with SMTP id d14mr1008642ljg.100.1602064745198;
 Wed, 07 Oct 2020 02:59:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200930092053.2114-1-mike.looijmans@topic.nl>
 <CACRpkdbsYcmv9m2EiQNgPDZ0MdjPnWTxXvnqATVPvWpB=8Oqkw@mail.gmail.com> <20201006193235.GA2689027@bogus>
In-Reply-To: <20201006193235.GA2689027@bogus>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 7 Oct 2020 11:58:54 +0200
Message-ID: <CACRpkdZmYKn1JU8PeA+GAJDuVEtWQrH-3KijH4+df88Bt=iZtA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: pca953x: Add support for the
 NXP PCAL9554B/C
To:     Rob Herring <robh@kernel.org>
Cc:     Mike Looijmans <mike.looijmans@topic.nl>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 6, 2020 at 9:32 PM Rob Herring <robh@kernel.org> wrote:
> On Wed, Sep 30, 2020 at 11:50:38AM +0200, Linus Walleij wrote:
> > On Wed, Sep 30, 2020 at 11:21 AM Mike Looijmans <mike.looijmans@topic.nl> wrote:
> >
> > > The NXP PCAL9554B is a variant of the PCA953x GPIO expander,
> > > with 8 GPIOs, latched interrupts and some advanced configuration
> > > options. The "C" version only differs in I2C address.
> > >
> > > This adds the entry to the devicetree bindings.
> > >
> > > Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> > > ---
> > > v2: Split devicetree and code into separate patches
> >
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > This patch 1/2 does not apply to my tree, I suppose Rob has
> > to apply it?
>
> Nope, no changes in my tree.

Weird, OK Mike apply this wherever it should be applied or rebase
on my GPIO tree and resend if you want me to apply it.

Yours,
Linus Walleij
