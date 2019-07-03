Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B89295DE16
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2019 08:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726792AbfGCGdk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Jul 2019 02:33:40 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:33150 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726490AbfGCGdk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Jul 2019 02:33:40 -0400
Received: by mail-lj1-f193.google.com with SMTP id h10so1131165ljg.0
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jul 2019 23:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5C6sYFoCfJEmSNXhEcsQJS3osfR2FTpDKkkqfF4k1GQ=;
        b=T5uMW4uSHvzBslwWf1jeBhT+n5Cf/c0kJOn0lA8OABqIvHfT0j7nh9/zIuT+pYK91q
         U+r0Di5XEIgmLnROgYxkZrhCgH/ssj62PAmn2/ZKgCK6UbtG+QkkZp/lhjxAgI5OXtNI
         srt17bziFFxk7B0XJkx/embWDCw9K4pSS3BM1HrRp0DK3PX0m4rgLwBuHJMnbfjWH03p
         1bMEd4Lcd4EumaAoIrUTsYZ+oA4zFZxj/whOkF0FwYkYx+Rx0AMx4ndgDwHLa2TjP23W
         KwqAmulPPAO0u9tiK7myBMvsinuZvhpsKJyMSRF45wIyDGBtx3HW1HaVN3JoebKdagju
         e9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5C6sYFoCfJEmSNXhEcsQJS3osfR2FTpDKkkqfF4k1GQ=;
        b=J2IpHyMTbU+Epcmw9JuVuZ3sXEuHwf9Pg/i+rkLEZTJ+pYTliJwHGG4gmND+7kCzay
         ZVgDrh5buwjt2BoSnSpp6h1cMopUO/X15ylQ4qtfWJznwq914LVsUPzvzg5DUS7k5Mp4
         jSraNnJvmib++CtdFc34d/SOrMpzA0etFEcIr+SvTY5bt5HMo48o6VOTJ40UP7MBwXdv
         Hu0tushjAinPJ3BpkjKxxsLJwvooKK2skN7Dst8Qn2JQ8uFfsJt312VshPvOQgpl1g41
         AAE+m3vaJ6w+xkvA1SBB4IwCGxWiElrxB9g11C+fsADzB6gsRKd43PVCmusR/Nw9HOtj
         1nIA==
X-Gm-Message-State: APjAAAXYycKAneT//J/wEU09biqaTPJIpR5utIudCIaufNgdRvlauUSr
        x7I9EhosZGNT2pPHp46MfnjsSBCveqzFjNLdKUgD3e/k
X-Google-Smtp-Source: APXvYqyHY2CnApH2ijuYSU8+wpZ6sK0LfVLGxfgRLgVxyO89A6+3UlXiyHmhIKbT6PE3IchMOYKS8xiSFD2+oNwXmYM=
X-Received: by 2002:a2e:2c14:: with SMTP id s20mr19867301ljs.54.1562135618073;
 Tue, 02 Jul 2019 23:33:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190624132531.6184-1-linus.walleij@linaro.org>
 <20190626210900.GA1629@codeaurora.org> <CACRpkdbxicUbg9NSaYsRMQG0Qo-WysdU07qD_T3rDEe7cjCcUw@mail.gmail.com>
 <20190628155817.GB24030@codeaurora.org>
In-Reply-To: <20190628155817.GB24030@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 3 Jul 2019 08:33:26 +0200
Message-ID: <CACRpkdaXTXODS67=ZE=8d_x_=ktjpCT_nqWpT-b6cnc14kGgFg@mail.gmail.com>
Subject: Re: [PATCH 1/4 v1] gpio: Add support for hierarchical IRQ domains
To:     Lina Iyer <ilina@codeaurora.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>, linux-tegra@vger.kernel.org,
        David Daney <david.daney@cavium.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Brian Masney <masneyb@onstation.org>,
        Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 28, 2019 at 5:58 PM Lina Iyer <ilina@codeaurora.org> wrote:

> >I might be wrong, but then I need to see some example
> >of hierarchies that need something more than what the
> >gpiolib core is providing and idiomatic enough that it can't
> >be rewritten and absolutely must have its own ops.
>
> Here is an example of what I am working on [1]. The series is based on
> this patch. What I want to point out is the .alloc function. The TLMM
> irqchip's parent could be a PDC or a MPM depending on the QCOM SoC
> architecture. They behave differently. The PDC takes over for the GPIO
> and handles the monitoring etc, while the MPM comes into play only after
> the SoC is in low power therefore TLMM needs to do its job. The way to
> cleanly support both of themis to have our own .alloc functions to help
> understand the the wakeup-parent irqchip's behavior.
>
> Since I need my own .ops, it makes the function below irrelevant to
> gpiolib. While I would still need a function to translate to parent
> hwirq, I don't see it any beneficial to gpiolib.

OK I see, I am holding the patch set back for v5.4 so we can make
sure that yours and also Brian Masney's drivers will be able to
work with this. Let's try to get this in shape for the next kernel.

Yours,
Linus Walleij
