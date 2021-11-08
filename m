Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90254449C55
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Nov 2021 20:23:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237126AbhKHT0a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Nov 2021 14:26:30 -0500
Received: from mail-ot1-f44.google.com ([209.85.210.44]:35756 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236881AbhKHT03 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Nov 2021 14:26:29 -0500
Received: by mail-ot1-f44.google.com with SMTP id p11-20020a9d4e0b000000b0055a5741bff7so27191853otf.2;
        Mon, 08 Nov 2021 11:23:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mqDTQKApc2kTQofGLT1IqukelJnzReC5kPeApeje4eQ=;
        b=Dj/knTZ6lJaGcGhgaWsoHL11w+dhi7xs3NHN5SW57ADxxWZ8gbVHBTm6PSwQHJQbxR
         4z7TXwiwXLYQj4VGWQtTPkYA/ONHBqOx8lYdC5aT/cWQ7GoE5OdJEdFVbaepslmsb8kN
         ZKkw0JElse+utK/YK+KV1rTXmlMm7+mIfReXHkuQPppLZDmD49NaDgqAmWCTtd/oA4GZ
         74ZiphCxcfH0TZKN0y3RELCUIVVlFmHN2nx3nTtsZO8/D0UiLBI0kR1CfkNQ5eSX8t5p
         VbXBxWRBPxiE/clOZOibiYo2X8pBHS+8BaF38nKBFQ8NFnHjmlv7LS0+jdmP5qCfAboM
         QngA==
X-Gm-Message-State: AOAM532IOnBEAox2AxTOxd+jTDfBFE8HwS48i+MLGB+/y9YDw0LLSru9
        mspvHeFLB4NmjidL0u3Yag==
X-Google-Smtp-Source: ABdhPJx3lD+3O7Jj4V4I2UeMIrVZzQhO2yLBSmbuSXbXCfKKOjcBoqXOQ295XzMoPvfirkaupaeHjA==
X-Received: by 2002:a9d:a2b:: with SMTP id 40mr1224332otg.100.1636399424614;
        Mon, 08 Nov 2021 11:23:44 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id z22sm6441009oth.63.2021.11.08.11.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 11:23:44 -0800 (PST)
Received: (nullmailer pid 4062547 invoked by uid 1000);
        Mon, 08 Nov 2021 19:23:43 -0000
Date:   Mon, 8 Nov 2021 13:23:43 -0600
From:   Rob Herring <robh@kernel.org>
To:     Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>
Cc:     devicetree@vger.kernel.org, UNGLinuxDriver@microchip.com,
        Kavyasree.Kotagiri@microchip.com, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
        robh+dt@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: ocelot: Add Lan966x SoC support
Message-ID: <YYl5P4r6HZSWnxuv@robh.at.kernel.org>
References: <20211029092703.18886-1-kavyasree.kotagiri@microchip.com>
 <20211029092703.18886-2-kavyasree.kotagiri@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211029092703.18886-2-kavyasree.kotagiri@microchip.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 29 Oct 2021 14:57:02 +0530, Kavyasree Kotagiri wrote:
> Add documentation for the compatible designated for Lan966x.
> 
> Signed-off-by: Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>
> ---
>  .../devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.txt        | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
