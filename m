Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7E071E87E4
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2020 21:33:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727924AbgE2TdS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 May 2020 15:33:18 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:35189 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726487AbgE2TdS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 May 2020 15:33:18 -0400
Received: by mail-il1-f195.google.com with SMTP id a14so3659346ilk.2;
        Fri, 29 May 2020 12:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HaHhSB17W/IlOTGOe08YGp7TtMhBgeaK7abHKzgcsJk=;
        b=unmaSPM+cU4RtL4XJDFPy3jViUNXoQ1JSo67Dwx4JYbGFWDgvxttH3LQPHCHytEalS
         MNas/NQJSWN4qNJVTPRllPk6u8ERZV60SBZ46qCPcaAZV6m3gQaoeSda89WV1jSimlVG
         U+mnONB4davzYV9KGLbQRxxS1T6jKFd0JpqB2EQMIILw7W8NamB7jDynhKYiWXK/Ls7r
         HF/CRmqojuHpalfSI9Mcuj1rjSQn3YEJelUkfEK+9chmBguEmB3c1KiHjWBEBrz7NFxV
         A569Gf9lapaM6b66XZ40bHSYT8DTneb9hpjRw0afc+MVOykobbx2T6gv1ZBt1+NVgEN6
         /fEg==
X-Gm-Message-State: AOAM530vA8NFzqblX7ZjOYdxlD0AbozwzQFcI0DQo9GPjuhJGFkwo9Y3
        PuST1KYY02KtlavqwPIUoQ==
X-Google-Smtp-Source: ABdhPJwGVdaivmdbooaEE6GOIo4lw23DLyUMNmBctT9PTU9ypysmC/lNyHdIIhPAdef7KLZQb4REwQ==
X-Received: by 2002:a92:507:: with SMTP id q7mr8789982ile.150.1590780797578;
        Fri, 29 May 2020 12:33:17 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id p69sm1807537ili.75.2020.05.29.12.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 12:33:16 -0700 (PDT)
Received: (nullmailer pid 2809579 invoked by uid 1000);
        Fri, 29 May 2020 19:33:15 -0000
Date:   Fri, 29 May 2020 13:33:15 -0600
From:   Rob Herring <robh@kernel.org>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        "maintainer:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." 
        <bcm-kernel-feedback-list@broadcom.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" 
        <linux-rpi-kernel@lists.infradead.org>,
        "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/4] dt-bindings: pinctrl: Document optional BCM7211
 wake-up interrupts
Message-ID: <20200529193315.GA2807797@bogus>
References: <20200528192112.26123-1-f.fainelli@gmail.com>
 <20200528192112.26123-3-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200528192112.26123-3-f.fainelli@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 28, 2020 at 12:21:10PM -0700, Florian Fainelli wrote:
> BCM7211 supports wake-up interrupts in the form of optional interrupt
> lines, one per bank, plus the "all banks" interrupt line.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  .../devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt         | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt b/Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt
> index dfc67b90591c..5682b2010e50 100644
> --- a/Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt
> @@ -16,7 +16,9 @@ Required properties:
>    second cell is used to specify optional parameters:
>    - bit 0 specifies polarity (0 for normal, 1 for inverted)
>  - interrupts : The interrupt outputs from the controller. One interrupt per
> -  individual bank followed by the "all banks" interrupt.
> +  individual bank followed by the "all banks" interrupt. For BCM7211, an
> +  additional set of per-bank interrupt line and an "all banks" wake-up
> +  interrupt may be specified.

Is 'all banks' the name? Generally 'wakeup' is used for a wake up irq.

Rob
