Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B5342AD7C3
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 14:37:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730672AbgKJNhb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 08:37:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731905AbgKJNhU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 08:37:20 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3CB7C0613CF
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 05:37:18 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id p12so116053ljc.9
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 05:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JT82WeGHfGatJUyqqRhZrje7scJf6cQaFnAsRXpysnI=;
        b=XAxWAMfhILndj8wuVUvV3hrKS1T62bZdRtD8DTLN4ATV1ytFGsLohz3aOeAJVUT3yA
         OvAFqqcLi/EP+HOHDzPcA6Y8ocf+lQkPzDlPCZh4NXEr7gRFuysSFc0/pEtOEhOVD2GZ
         PgswvtvteoKGnFMahPr1gpa8fMRjpSUz/x54yS2scyfyYrI2ysUt+HZ6xoZrEn5Wyklx
         /SaUWS4WF2B3Kw1InGSDdZroYznro7N+BJHHTYWor3tsrPpofAEL31au+V2E12+tqYOc
         acdsJu2gZuzjvOGne3FIRIVWf/LBOvaJRT2VCtbSWEB0tH/g1Dfy4ekVPoyjqYBBRJz+
         n3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JT82WeGHfGatJUyqqRhZrje7scJf6cQaFnAsRXpysnI=;
        b=SQN0DzGVwSzPEFM00BH6+u83LYk1ziVTVvm6eeuzFZ2GQU52qbvGLd3BkEHdk8WenK
         3y1iKGEQpozFOWc5hHMDVeyuk53CaZp0zy0ggw0z2PRNdZUL8vtdyyVTy3apG44Ah43t
         kZ0xoeZOxwj+nHcY4700/3rXavQOGVCBXCFNi1vaabFWhhZ5LPpJ0Y5ofb7vekHPHVX8
         n5WjJ1AnM64eLK7oEiw4JbPpZAIOUIYRy2v/wxLD3rfKoizjggVO0EDzNAXnSYNksYlb
         dUfsV3GvUmBO74ScXlkATA1+0EiAMw415iuHuA1/SmulbywblbGY8Z5dgiGHeyIsrkeB
         9gwg==
X-Gm-Message-State: AOAM533+Vpi0Fr1csDPHGu0tSo/lrh7BXr0aGirUuHhhSfOaAB+hNzDN
        n+7p9r4X/iOQq8Nmc5gxA96/HVhruR/4h/0dpCuf/A==
X-Google-Smtp-Source: ABdhPJz464oXj+ZDGivb3FQgYwVKw3a2uFn3tEHTqlzudXDC+NmI/1Sa0La/LSpGBh8lBY/+GrWhtvb20nqSr2W9rag=
X-Received: by 2002:a2e:80d2:: with SMTP id r18mr8965171ljg.286.1605015437329;
 Tue, 10 Nov 2020 05:37:17 -0800 (PST)
MIME-Version: 1.0
References: <cover.1601164493.git.mirq-linux@rere.qmqm.pl> <e3a3979657babf716e5f4072e373637ce86ad7ff.1601164493.git.mirq-linux@rere.qmqm.pl>
 <CACRpkdaMHH35C1LqUROFBte3T00Lz0zApHy3hdZ83Z8EZR04hw@mail.gmail.com>
 <20201001090104.GM6148@dell> <20201104144331.GG4488@dell> <20201105014728.GC17266@qmqm.qmqm.pl>
 <20201105081314.GT4488@dell>
In-Reply-To: <20201105081314.GT4488@dell>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Nov 2020 14:37:06 +0100
Message-ID: <CACRpkdagF-jYon5sTtwOYqHqweb-dZoai8s=WmH4FqcHOP5MoQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] gpio: tps65910: use regmap accessors
To:     Lee Jones <lee.jones@linaro.org>
Cc:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 5, 2020 at 9:13 AM Lee Jones <lee.jones@linaro.org> wrote:

> > The patch 4 assumes all previous patches are applied (or there will be
> > build breakage).
>
> Okay, no problem.
>
> Linus, do you want a PR?

Nah let's optimistically assume it's not needed. I don't see a lot
of changes around here this merge window.

Thanks for sorting out this merge!

Yours,
Linus Walleij
