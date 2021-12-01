Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCFD54652BC
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Dec 2021 17:27:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350541AbhLAQau (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Dec 2021 11:30:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239044AbhLAQat (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Dec 2021 11:30:49 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26A99C061574;
        Wed,  1 Dec 2021 08:27:28 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id e3so104191077edu.4;
        Wed, 01 Dec 2021 08:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E0XXEi2pEIGUuSR2mcBpWn7ZbmAs6JYTBQQH4aAU0SU=;
        b=XZy0Vlgg+YDYciExKyl7szHG29gvVNQo/3ClrSotB+bZsIqOCTPxOK79VY74hZGeNq
         mQOODAZ5NV37JJoefjs+W77/4LwkAl8BHRAZl6hmb4uql6EDkQweO1HN54bVZvMeLmej
         QDOQYF2jZH/gDohCFel2+s3BBYmarIHFm//zJqpE3bK23Wh5GW7/d5PXOuA7xHA+UeuM
         05mfV4x6kLZZ0NAqu3iHmWE22Mmha+reXD+o20y2N57+IYNyAVji+0Pn4Cam961KbmIv
         dlptG81nbaNJ2vZCDpJ8q9UT475lWxGcqaO/XjGPEJnmVy1xzHyZnJdaVd0VgswHJGnG
         2APg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E0XXEi2pEIGUuSR2mcBpWn7ZbmAs6JYTBQQH4aAU0SU=;
        b=dPhDApdJsStPRVbgmO2EIKKExvrTAWIAGM5qUFPEW7ycdR2YiUujWUuul50r7QakwG
         zg5pDB5adiCplVwDPeWutrVYXPY+mj2m5m4BwZ9ssOwRFP8T7PKAf3G0fHdIoYaBKJqn
         y3t0cSqC3ydRVgvXcIgtVl0tj/gdFUdEWxv/a55gUCObPOi8eqSrwFWl3v3SiFxYYDp2
         dllf2Fss//lL0MH0LpvCSiw1CyW2MBCyDqhWBcsgiD3hU4MDoXfRX0vyzE7NDpsljuzN
         H4MWWWsfijl3qmFq/t1ENewgeTpFFxVr6X5QsMz37Wwht33klqIk6b/80gWvCA46fZz6
         Bf4A==
X-Gm-Message-State: AOAM533vkeOjfxxlXmqlRhVIgjZQk1+XyMTyrBNjATpLXhRdzcpH56wk
        Akj1TSUuwQlKGC0OZf9S0ggBctxiz+LlObU5mnA=
X-Google-Smtp-Source: ABdhPJyuWY8WCVU985YqUX0441d3N4lbf2FrMlJ2/olb992FyMKQ3Ah2iEvFXTPTok4KdCipZ5dYcnuqzbxmpu2HPu8=
X-Received: by 2002:a05:6402:291:: with SMTP id l17mr10012807edv.242.1638376045228;
 Wed, 01 Dec 2021 08:27:25 -0800 (PST)
MIME-Version: 1.0
References: <20211129105556.675235-1-phil@raspberrypi.com> <20211129105556.675235-2-phil@raspberrypi.com>
 <CAHp75Vei9FUY0gGD99gVv_FZzcpN1y_i65BB-auyAFUwqsQxNA@mail.gmail.com>
 <06345f5a-c8e7-848b-d25f-3f3e32ab5418@raspberrypi.com> <CAHp75VcZNUXxk7rD2sL=AFe4kz+hXX361rp15K8fN1c4x8zhXA@mail.gmail.com>
 <3f03d11b-ed73-9f1e-5de1-44cb3ae3e415@raspberrypi.com>
In-Reply-To: <3f03d11b-ed73-9f1e-5de1-44cb3ae3e415@raspberrypi.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 1 Dec 2021 18:25:48 +0200
Message-ID: <CAHp75VfWCpi+kzch1qH6rZkd+8mZmnBTYF-MWnmUvTRdJCFLtw@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: bcm2835: Change init order for gpio hogs
To:     Phil Elwell <phil@raspberrypi.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-rpi-kernel@lists.infradead.org" 
        <linux-rpi-kernel@lists.infradead.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 1, 2021 at 6:08 PM Phil Elwell <phil@raspberrypi.com> wrote:
> On 01/12/2021 15:38, Andy Shevchenko wrote:

...

> >>>      Fixes: 73345a18d464b ("pinctrl: bcm2835: Pass irqchip when adding
> >>>                              gpiochip")

> >>> Is it originally so strange indentation or is it only on my side?
> >>
> >> The "g" is below the "p" in the patch.
> >
> > Which is wrong. Tags mustn't be multilines (i.e. split over a single line).
>
> checkpatch disagrees:

I don't care less about checkpatch false positives. You have a chance
to fix it, btw.

-- 
With Best Regards,
Andy Shevchenko
