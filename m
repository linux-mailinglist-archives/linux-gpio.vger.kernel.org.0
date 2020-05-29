Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ADAD1E8B3E
	for <lists+linux-gpio@lfdr.de>; Sat, 30 May 2020 00:22:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726898AbgE2WWi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 May 2020 18:22:38 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:33146 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbgE2WWi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 May 2020 18:22:38 -0400
Received: by mail-il1-f195.google.com with SMTP id y17so4065038ilg.0;
        Fri, 29 May 2020 15:22:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Wc0UZ31C0R3iMEWNK6qgINTbfHE6rJcur/PJ3R+10SA=;
        b=eq8wLPTI/Co0O1esqdnTCoWC+SS0AThD7gfyXjqlkhSZ3iF+VJW4TTRIYgYM/wQ3su
         3ykIcqaAQR50qS7M74vWlPV6stNpK3sE3/y58aghHPma2/unWivvqcE7CHVP4tu2f6mC
         g9IvpsvF68scTuNcXZ6LmPuESzUPxnJcWSUwl4IIQ9QUsvAW4iUK6fpyhBxQ7xc/s6DZ
         Z159pShTyhaRVRu6+H1qh4GORwDPnTEi02CU8KC1XYQisTIEdgUoV+SOpOQKCmNtaSip
         pvCvLJ3Un5VadIGhjnb5dgBkYDZEXNVVDmKd6Vsh1JW7AibUwKGWV5FfslyZO4rtBYAr
         QDnQ==
X-Gm-Message-State: AOAM533J5FxDYcxuYgS7Q/DDWnxClmymZ5l8CLJylh+ieq3qNY1C8rPt
        AS8WiCzI23DkdOld0TnGlw==
X-Google-Smtp-Source: ABdhPJyW7aiqVBA3hBYuboTheA0HD4gSduG5P8ca7spP8PYPak05yBl+9zeFg6CIcYzK5ANh312zbg==
X-Received: by 2002:a92:9ac7:: with SMTP id c68mr9620013ill.53.1590790956445;
        Fri, 29 May 2020 15:22:36 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id h23sm4349826ioj.39.2020.05.29.15.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 15:22:35 -0700 (PDT)
Received: (nullmailer pid 3095678 invoked by uid 1000);
        Fri, 29 May 2020 22:22:33 -0000
Date:   Fri, 29 May 2020 16:22:33 -0600
From:   Rob Herring <robh@kernel.org>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Scott Branden <sbranden@broadcom.com>,
        "maintainer:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." 
        <bcm-kernel-feedback-list@broadcom.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ray Jui <rjui@broadcom.com>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        linux-kernel@vger.kernel.org,
        "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" 
        <linux-rpi-kernel@lists.infradead.org>,
        "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: pinctrl: Document optional BCM7211
 wake-up interrupts
Message-ID: <20200529222233.GA3095594@bogus>
References: <20200529191522.27938-1-f.fainelli@gmail.com>
 <20200529191522.27938-3-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529191522.27938-3-f.fainelli@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 29 May 2020 12:15:20 -0700, Florian Fainelli wrote:
> BCM7211 supports wake-up interrupts in the form of optional interrupt
> lines, one per bank, plus the "all banks" interrupt line.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  .../devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt         | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
