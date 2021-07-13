Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31CDE3C79C9
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jul 2021 00:44:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236344AbhGMWrF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Jul 2021 18:47:05 -0400
Received: from mail-io1-f46.google.com ([209.85.166.46]:37821 "EHLO
        mail-io1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235536AbhGMWrF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jul 2021 18:47:05 -0400
Received: by mail-io1-f46.google.com with SMTP id l18so24280033iow.4;
        Tue, 13 Jul 2021 15:44:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/1Qu7cMHa9uzbYo7ijXv1POZZirJoa4gkML3s+GgcbM=;
        b=YB+q+JcDes5UEmWpTam8FQyGmc1MqGYlOcfz1lgaSv+AcUn0mhKxR5bFYtyY8HbRKf
         8TaLMs6hWiFtdWHP4smAWg+t2SGx4sh7hjNemtRuV6CUCh2tVKEl8080IpMKpdPZTVLy
         PqxMwizF/g11kXy73vE4ecIaA8zs4sCpi2hf7jPXm3ciz0hncvNhBpPN4S0T9jo1U6Eg
         HuYBBiN7kGVFFzNnK2555BrEMk6eSpqSBwLmlWGp+SNhfJPazOWoF4UHIMGJIRQrg6BA
         bp6hqLCU0xkI/J/6mSsAN66fwyYmnbraqO9Hih04hZcwaUXSDn3JoXpt4OGqq30phMOp
         2eyg==
X-Gm-Message-State: AOAM531cf8Iy/bhWejrJ5ZBaOkP6TK/tga6ocbW9o0D2PZ1gWh0Dbplq
        gZQP0hyTASihc0pB8vjlHg==
X-Google-Smtp-Source: ABdhPJzvmAfJKZ7SSfXPpwfF6OxiNSXzxMH5ZbpeWkU8qDr2LMSI2feSX2xxnpi1I9TrTAAvde/cuQ==
X-Received: by 2002:a05:6602:8c3:: with SMTP id h3mr4877942ioz.144.1626216254403;
        Tue, 13 Jul 2021 15:44:14 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id c19sm193611ili.62.2021.07.13.15.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 15:44:13 -0700 (PDT)
Received: (nullmailer pid 987828 invoked by uid 1000);
        Tue, 13 Jul 2021 22:44:10 -0000
Date:   Tue, 13 Jul 2021 16:44:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Steven Lee <steven_lee@aspeedtech.com>
Cc:     "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>, Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ryan_chen@aspeedtech.com, Hongweiz@ami.com,
        billy_tsai@aspeedtech.com, Andrew Jeffery <andrew@aj.id.au>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Joel Stanley <joel@jms.id.au>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v6 2/9] dt-bindings: aspeed-sgpio: Add ast2600 sgpio
Message-ID: <20210713224410.GA987786@robh.at.kernel.org>
References: <20210712100317.23298-1-steven_lee@aspeedtech.com>
 <20210712100317.23298-3-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210712100317.23298-3-steven_lee@aspeedtech.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 12 Jul 2021 18:03:09 +0800, Steven Lee wrote:
> AST2600 SoC has 2 SGPIO master interfaces one with 128 pins another one
> with 80 pins. Add ast2600-sgpiom compatibles and update descriptions to
> introduce the max number of available gpio pins that AST2600 supported.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> ---
>  Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
