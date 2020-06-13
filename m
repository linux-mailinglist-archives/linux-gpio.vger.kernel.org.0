Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B97D51F8219
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2020 10:43:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbgFMIn0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 13 Jun 2020 04:43:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:53324 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725783AbgFMIn0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 13 Jun 2020 04:43:26 -0400
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7507F20836;
        Sat, 13 Jun 2020 08:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592037805;
        bh=SyRgaHUOm/RP8zZ90+MyAGaRN4cSsWrzzNGHyfuBnCk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=BgrzEr0T3JoHmKZPf5JHHJjvygSMZGF5NKn+13GG7QHtIS/IBZ7akYkLuc0TbufY0
         IdI3tEBicGVpmTrhCjhPNSbLdEFx6l03HXU1AMn8ObSGPs2e5kB+GmV2Rt/rdkNQLA
         gC00pV5XYzyrAQW5/CPir6q3bWaJ154iM+O+UJ14=
Received: by mail-lj1-f173.google.com with SMTP id z9so13654752ljh.13;
        Sat, 13 Jun 2020 01:43:25 -0700 (PDT)
X-Gm-Message-State: AOAM530UMrNSLF4v9bMAv1GquAIAsJZVHEBg2VJ+ce9ilPP2+24WGcJW
        9BJyo7cAOyU92QRBAJcL7HThNO6/3AQ43YFnCPM=
X-Google-Smtp-Source: ABdhPJwZ1ylOrBsd6XVZmYSQ3sLMGYqoTKujz2SwyQaUfONmAEP2kaw8s4sWs89ZwT6ZjZ3AWnilqqgnG/azc96C0bc=
X-Received: by 2002:a2e:2a42:: with SMTP id q63mr9000358ljq.265.1592037803689;
 Sat, 13 Jun 2020 01:43:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200611095804.22026-1-f.suligoi@asem.it>
In-Reply-To: <20200611095804.22026-1-f.suligoi@asem.it>
From:   Guo Ren <guoren@kernel.org>
Date:   Sat, 13 Jun 2020 16:43:11 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTojGRnshstFwqu4xM_txeBOY=uFiWPTpXZPWv2uS6QqQ@mail.gmail.com>
Message-ID: <CAJF2gTTojGRnshstFwqu4xM_txeBOY=uFiWPTpXZPWv2uS6QqQ@mail.gmail.com>
Subject: Re: [PATCH] doc: devicetree: bindings: fix spelling mistake
To:     Flavio Suligoi <f.suligoi@asem.it>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-csky@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Acked-by: Guo Ren <guoren@kernel.org>

On Thu, Jun 11, 2020 at 5:58 PM Flavio Suligoi <f.suligoi@asem.it> wrote:
>
> Fix typo: "triger" --> "trigger"
>
> Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
> ---
>  Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.txt | 2 +-
>  .../devicetree/bindings/interrupt-controller/csky,mpintc.txt    | 2 +-
>  Documentation/devicetree/bindings/timer/csky,mptimer.txt        | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.txt b/Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.txt
> index ba455589f869..e1c49b660d3a 100644
> --- a/Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.txt
> +++ b/Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.txt
> @@ -12,7 +12,7 @@ Required properties for the top level node:
>     Only the GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW flags are supported.
>  - #interrupt-cells : Specifies the number of cells needed to encode an
>     interrupt. Should be 2. The first cell defines the interrupt number,
> -   the second encodes the triger flags encoded as described in
> +   the second encodes the trigger flags encoded as described in
>     Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
>  - compatible:
>    - "mediatek,mt7621-gpio" for Mediatek controllers
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.txt b/Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.txt
> index e13405355166..e6bbcae4d07f 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.txt
> @@ -10,7 +10,7 @@ Interrupt number definition:
>   16-31  : private  irq, and we use 16 as the co-processor timer.
>   31-1024: common irq for soc ip.
>
> -Interrupt triger mode: (Defined in dt-bindings/interrupt-controller/irq.h)
> +Interrupt trigger mode: (Defined in dt-bindings/interrupt-controller/irq.h)
>   IRQ_TYPE_LEVEL_HIGH (default)
>   IRQ_TYPE_LEVEL_LOW
>   IRQ_TYPE_EDGE_RISING
> diff --git a/Documentation/devicetree/bindings/timer/csky,mptimer.txt b/Documentation/devicetree/bindings/timer/csky,mptimer.txt
> index 15cfec08fbb8..f5c7e99cf52b 100644
> --- a/Documentation/devicetree/bindings/timer/csky,mptimer.txt
> +++ b/Documentation/devicetree/bindings/timer/csky,mptimer.txt
> @@ -8,7 +8,7 @@ regs is accessed by cpu co-processor 4 registers with mtcr/mfcr.
>   - PTIM_CTLR "cr<0, 14>" Control reg to start reset timer.
>   - PTIM_TSR  "cr<1, 14>" Interrupt cleanup status reg.
>   - PTIM_CCVR "cr<3, 14>" Current counter value reg.
> - - PTIM_LVR  "cr<6, 14>" Window value reg to triger next event.
> + - PTIM_LVR  "cr<6, 14>" Window value reg to trigger next event.
>
>  ==============================
>  timer node bindings definition
> --
> 2.17.1
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
