Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C4DD35855B
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Apr 2021 15:56:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231759AbhDHN4X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Apr 2021 09:56:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231758AbhDHN4X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Apr 2021 09:56:23 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9163FC061762
        for <linux-gpio@vger.kernel.org>; Thu,  8 Apr 2021 06:56:10 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id n138so4209435lfa.3
        for <linux-gpio@vger.kernel.org>; Thu, 08 Apr 2021 06:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DdaKYAD+3uox0bnZyMc0CsziZH9vJmOYjQVhGpA3+bo=;
        b=YVghXLhw3Z1qU+4wuVKseRBYeubkYqgAsKCgA0PxXp6D+PFpFAqS9YyfftG/bJcAOe
         tfR/28lkz8QJ0zOYBx6bCWSNSAHVV2Hc3wLV94wD7EDkgsUtqfGRN2GENGFACqN9QhE3
         eDKrudUengMXc/PEE+vIrkJlxaeoTr8L4SCvioqPpdZOegqqMS7A2X5dc3yrhYXqVykb
         8ybpP5k4ITTpptf/kANs7HKh5UAmHvtoO9AiO0rwpcDDJNeR5FrjBKah8bsKRaKNZ31Y
         ZQ186ms7DHjsoxRYYyOc5bsDEf7mdZvubUrwnHJ6D5bCDWwvz38CmH0WUGx0KX/gp5j3
         68gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DdaKYAD+3uox0bnZyMc0CsziZH9vJmOYjQVhGpA3+bo=;
        b=MMQoKtUIr+/VrAvv2qR8xacA7Unv/jLOQ1ygPiIBlWf95E61Iwm3RpJvwkNqJAOb/j
         tkenGWzMomyUKLBJ8JkisC/bdf9GFabi5nyIv0gvqBTE0AFb+mQL7aezsmjzF619ptbV
         UudoxZVjahKmGrmzM4nvIdEfooAOn8u1vc5svtEbrd9k7yDmICagf796p9pU7ZNeW896
         W3sGVd0/BzlJ2jVu01NCgKA/kVoWxW9CKGZ88i/ApI5/eyKHyn1fPxrE3Hv7J7Bf1lLu
         LR2jbqs6eBnB+94Vh2H96bp+d8ZqLcoplmGq8ETfSu5FW1WdleUud9a44oknT6gSMXcc
         ZuxA==
X-Gm-Message-State: AOAM531VlNaDR+ObYvGf+8MbSVlHH1fhEYHB/JXESBw3O/Fdd4tbAGL9
        hVz8AhcA3ISPPzHz2bZGWYJrfFBome3Mzem6PSYpXw==
X-Google-Smtp-Source: ABdhPJycTGo9B/FZL0du4dld8W6D9Zxj3z3lWKgajccSdIPeTFaPJjD+54DfV1FLl972qg+8JKE5ENgx5iKvvmlQYgc=
X-Received: by 2002:a05:6512:3a85:: with SMTP id q5mr6435636lfu.465.1617890168968;
 Thu, 08 Apr 2021 06:56:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210324081923.20379-1-noltari@gmail.com> <CACRpkdZE55ixxSp6H1SKx19trGE_uVGgkLttzAVQuLzw4=Jutw@mail.gmail.com>
 <609f038d-3037-5cda-b489-f0816eb95658@gmail.com>
In-Reply-To: <609f038d-3037-5cda-b489-f0816eb95658@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 8 Apr 2021 15:55:58 +0200
Message-ID: <CACRpkdZubgHyBqPnZxOw7QXgf=AHMcb1E0Y7bj5v3v_Am+3Ttw@mail.gmail.com>
Subject: Re: [PATCH v9 00/22] pinctrl: add BCM63XX pincontrol support
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 30, 2021 at 10:57 AM =C3=81lvaro Fern=C3=A1ndez Rojas
<noltari@gmail.com> wrote:

> > Now, what about a patch set for the IRQ support? :)
>
> If you could give me some guidance on that matter it would be much
> appreciated, because your comments [1] are now outdated since I switched
> to GPIO_REGMAP
> [1]
> http://patchwork.ozlabs.org/project/linux-gpio/patch/20210225164216.21124=
-3-noltari@gmail.com/

I think it mostly holds: GPIOLIB_IRQCHIP should always be used if there
is a reasonably straight-forward interrupts whether cascaded or hierarchica=
l.
Very few exceptions there. If there is one IRQ line per GPIO
line, the hierarchical support should be used as outlined. GPIO_REGMAP
should be mostly (famous last words) orthogonal.

Yours,
Linus Walleij
