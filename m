Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43B2D255152
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Aug 2020 00:48:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728035AbgH0Wsx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 18:48:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727954AbgH0Wsw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Aug 2020 18:48:52 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D84BCC061264
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2020 15:48:51 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id f26so8254451ljc.8
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2020 15:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tAhVF/lp+H6tBW93mDrhb4tgJc8T1p36H5TE5ih8Y+E=;
        b=DyYENwkw29xv/LZxUcN0akYXQX65UMM6NqVrbimJyi5aMHJ34b14rRJZklIXJTP5Q4
         oyP1kpK5/+/zA6J77DjGvp9zObV8p3p8FxiyBbe6U7KjFEKjUvgOZ93KgJ0r8drBUlnW
         4MHLSAxIxrjF9UqQmRNGQWk2K1aR8OtOpd4qXQEIRjfoW1c8NZu95YyA479GXPAl/YKG
         bQFszbMU+875aRGN4BK9h83gLCwT33LpXB/AU6INVK3bYaPM8Thnq5EqlS1jeWAb8jj6
         hpFjxOJ7d4XYvKeYRm+2epP8Plh4K9C66G7XwwiWfaRdEfW37zL8apWseXFHy9X/wu19
         PTWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tAhVF/lp+H6tBW93mDrhb4tgJc8T1p36H5TE5ih8Y+E=;
        b=LJn0xZFVOXFDKEn+2WPoD2e0kbZ1kOhqtgb8vrPSprB5yaE6iavtLXyJyS3cObw2v5
         Oz9aVs2pwSXoS1JABQ5vqaKnCVjiLyz0Xe7pBSNMQKernx+IyE/6wBGelxmc6yLdh4Pz
         +QQNdL+IgxiXVDg/PpnRCB1hV69+BuVY1ShCXG1OGI3kPR/dGZQQpobqB7SvOiBP4IBs
         3bZGfjiwutZiltfrCtjPIyf4HvQpvnnX3RLbDkIq/3JtmrNXb+OmDKKy7XXWf12YxtRD
         iE/8rUl7YmKoh6RIMmXqzb9bkwuhgS1vlcpdegT0iLE2L6+8L33jfibdyMA45U5jM9Ks
         GY7g==
X-Gm-Message-State: AOAM532g+xqgdo6lhOz8NGy69CPuP3jzbgJSwf7tFL1pE9J5EQFaPHq7
        26XTV6f3gxIgo8ST+2/gGU3rZ0wko5DW+V3g5wV8hQ==
X-Google-Smtp-Source: ABdhPJwXTAWlBfqievxoKW4me/4Ay0cZ1uhkfg/HNUIEXiiNhjWBBOIj9UhAQ7sN5/Cj9PnL+OfbRp2wb+AmgFlDPgI=
X-Received: by 2002:a2e:4e09:: with SMTP id c9mr11105712ljb.283.1598568530371;
 Thu, 27 Aug 2020 15:48:50 -0700 (PDT)
MIME-Version: 1.0
References: <1598113021-4149-1-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1598113021-4149-1-git-send-email-mkshah@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Aug 2020 00:48:39 +0200
Message-ID: <CACRpkdYhY8bSkMYPXoXH_-L91cLeinkhOvW07t6Y3_Jz7KoU0Q@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] irqchip: qcom: pdc: Introduce irq_set_wake call
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        =?UTF-8?Q?open_list=3AGPIO_SUBSYSTEM_=3Clinux=2Dgpio=40vger=2Ekernel=2Eorg=3E=2C_Andy_?=
         =?UTF-8?Q?Gross_=3Cagross=40kernel=2Eorg=3E=2C_Thomas_Gleixner_=3Ctglx=40linutronix=2E?=
         =?UTF-8?Q?de=3E=2C_Jason_Cooper_=3Cjason=40lakedaemon=2Enet=3E=2C_Doug_Anderson_=3Cdia?=
         =?UTF-8?Q?nders=40chromium=2Eorg=3E=2C_Rajendra_Nayak_=3Crnayak=40codeaurora=2Eorg=3E=2C?=
         =?UTF-8?Q?_Lina_Iyer_=3Cilina=40codeaurora=2Eorg=3E=2C?= 
        <dianders@chromium.org>, Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        =?UTF-8?Q?open_list=3AGPIO_SUBSYSTEM_=3Clinux=2Dgpio=40vger=2Ekernel=2Eorg=3E=2C_Andy_?=
         =?UTF-8?Q?Gross_=3Cagross=40kernel=2Eorg=3E=2C_Thomas_Gleixner_=3Ctglx=40linutronix=2E?=
         =?UTF-8?Q?de=3E=2C_Jason_Cooper_=3Cjason=40lakedaemon=2Enet=3E=2C_Doug_Anderson_=3Cdia?=
         =?UTF-8?Q?nders=40chromium=2Eorg=3E=2C_Rajendra_Nayak_=3Crnayak=40codeaurora=2Eorg=3E=2C?=
         =?UTF-8?Q?_Lina_Iyer_=3Cilina=40codeaurora=2Eorg=3E=2C?= 
        <lsrao@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Aug 22, 2020 at 6:17 PM Maulik Shah <mkshah@codeaurora.org> wrote:

> Changes in v5:

The series:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Feel free to merge this through the irqchip tree,

Yours,
Linus Walleij
