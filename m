Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6F991E87DD
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2020 21:32:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727851AbgE2TcJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 May 2020 15:32:09 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:41780 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726866AbgE2TcJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 May 2020 15:32:09 -0400
Received: by mail-il1-f194.google.com with SMTP id d1so3601541ila.8;
        Fri, 29 May 2020 12:32:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WLIXs+NotcPvB/2nb4x3iCIqRLOdwgpWw+TVrHgQ7j0=;
        b=ERTI6kSXnwWamk9l0USAM4M5xBqlvNPUquUx7649zbDUAVbrWUk0IV1MtKSBCMD3ki
         AatXgRT0EQOTHntgra+s1pAwJr3YYZYRsue7TgJsfDdXreXu8sy4IEamn+s/F2uUyg4U
         tg91pY4yPoISplrGHRiLKC2ZyjLaSvSRnz4aMYInIrlwlH16D9zimAKclrQ9YIA3HyNk
         +cG4SY+zo1IbkNyUFy2Jam/ksoKUkHmc5D2p9Imr2y7+rYh+5rx4AeEzPrB7yl6pzoVw
         V5DynPF/kDmaiTibo1u8OTK/LGCGcy+C6hZ/T3EXYGUjH+HHj4/rTQKcxTpkXc8myWfT
         IxTg==
X-Gm-Message-State: AOAM531B0yR0cybWVCt4ILKIw6wiVUuLwzxFARCZOEC3excNukLBJXnv
        FEPzI9VsV8OQ0os9cz/fuQ==
X-Google-Smtp-Source: ABdhPJzLV4Nh06NDTo1GqYtMBGKgDfGEco5yimV1fqmE6f7qX9jUhDGQjrePOOMW9O2eVU9uMOmh5A==
X-Received: by 2002:a92:c9c6:: with SMTP id k6mr9282512ilq.192.1590780727627;
        Fri, 29 May 2020 12:32:07 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id f26sm2734253ion.23.2020.05.29.12.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 12:32:06 -0700 (PDT)
Received: (nullmailer pid 2807651 invoked by uid 1000);
        Fri, 29 May 2020 19:32:05 -0000
Date:   Fri, 29 May 2020 13:32:05 -0600
From:   Rob Herring <robh@kernel.org>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        linux-kernel@vger.kernel.org,
        "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" 
        <linux-rpi-kernel@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        "maintainer:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." 
        <bcm-kernel-feedback-list@broadcom.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Scott Branden <sbranden@broadcom.com>,
        Ray Jui <rjui@broadcom.com>
Subject: Re: [PATCH 1/4] dt-bindings: pinctrl: Document 7211 compatible for
 brcm, bcm2835-gpio.txt
Message-ID: <20200529193205.GA2807600@bogus>
References: <20200528192112.26123-1-f.fainelli@gmail.com>
 <20200528192112.26123-2-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200528192112.26123-2-f.fainelli@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 28 May 2020 12:21:09 -0700, Florian Fainelli wrote:
> Document the brcm,bcm7211-gpio compatible string in the
> brcm,bcm2835-gpio.txt document.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
