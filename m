Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB64243BC39
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Oct 2021 23:19:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239494AbhJZVWP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Oct 2021 17:22:15 -0400
Received: from mail-oi1-f172.google.com ([209.85.167.172]:38484 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235364AbhJZVWO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Oct 2021 17:22:14 -0400
Received: by mail-oi1-f172.google.com with SMTP id t4so525662oie.5;
        Tue, 26 Oct 2021 14:19:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YtuFL+DDjYN57vIvaMf5OxVDuH9t3HGano//L4CGuFY=;
        b=N2PwtMXtDTOMigwBkWQHzNciuBYg72BBCt9i5COHKUhOcFn1S4/zfX6WMuX18waz7/
         M5ZDBUy3QUxA+MDp58a8wxCdYfIVoN3VbBAUpLP56sjgwzYmmDSyCXEFHAY9KYPr0axz
         nAZnz9SVakUSmM9sKLODbK9IQdDymAFYLk8haMZGPJrw9pvrvOsxgfpz95ZdxSLAlU+o
         G9F+ABmyzzPCUw+inRa3KQZvDuskFi0fZlZ1LozlgAPFQeI5ZGdRAAoOtvvdcR0wOEsf
         KUsE/y3ihHOERFrt2I7dREkqpWw1RcXBHy39strW84PfdK1irymDmXgXTK0UMPkSYGjR
         m0Yg==
X-Gm-Message-State: AOAM531XvuvYQV+C91ZVD1ZbuMe3zbh19r7lLwhDFiaqUUn79Nx9muj1
        iLwREe4iZrz5UBDe13hnnXrEs0Twxw==
X-Google-Smtp-Source: ABdhPJz0cDDYFbf7NCIWKBGCBrfhTk4dF7R5uxebjjb175aMZMkPHGOblMWPfqiWinh1L0gGWJSIpg==
X-Received: by 2002:a05:6808:1910:: with SMTP id bf16mr911438oib.17.1635283189371;
        Tue, 26 Oct 2021 14:19:49 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id q15sm4771394otm.15.2021.10.26.14.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 14:19:48 -0700 (PDT)
Received: (nullmailer pid 3272618 invoked by uid 1000);
        Tue, 26 Oct 2021 21:19:47 -0000
Date:   Tue, 26 Oct 2021 16:19:47 -0500
From:   Rob Herring <robh@kernel.org>
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        git@xilinx.com, Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        monstr@monstr.eu, Srinivas Neeli <srinivas.neeli@xilinx.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: zynq: Add power-domains
Message-ID: <YXhw87Uae2jgYiOI@robh.at.kernel.org>
References: <655523d7bf9658eb0b8e49a06c8b79a04052e5d5.1634286595.git.michal.simek@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <655523d7bf9658eb0b8e49a06c8b79a04052e5d5.1634286595.git.michal.simek@xilinx.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 15 Oct 2021 10:29:57 +0200, Michal Simek wrote:
> Describe optional power-domain property to fix dts_check warnings.
> The similar change was done by commit 8c0aa567146b ("dt-bindings: gpio:
> fsl-imx-gpio: Add power-domains").
> 
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> ---
> 
>  Documentation/devicetree/bindings/gpio/gpio-zynq.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
