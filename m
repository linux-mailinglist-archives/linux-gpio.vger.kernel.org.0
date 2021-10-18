Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04576432436
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Oct 2021 18:51:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233984AbhJRQyH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Oct 2021 12:54:07 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]:33711 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234122AbhJRQxk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Oct 2021 12:53:40 -0400
Received: by mail-ot1-f42.google.com with SMTP id 34-20020a9d0325000000b00552cae0decbso715762otv.0;
        Mon, 18 Oct 2021 09:51:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1NTSLH3QdLvvmqj7vILAc/uiqw3GWx2FXVOv+t3O/AM=;
        b=cuwqA0SCD0kzLEM0DfTTEgJf6XHycGjIYE7/Ur7eFU0xpow9kyW3Piv0fkLOXAX6QT
         wzPprCglI68RuaNfvrjl/aoDHLT2I1wjGJ/L1nLNsxDoVQt06QY061wJoUj9EB0H23Mv
         f2LROOyHZ0HVKRRa+ogInXsqpjvzhHorKiGTtXhqRICQyY/lfwVkkpEn7oiNiFoSahNn
         9RjVSjee3zi6+TknhYQNvfYCTXmEMhj/mSoY9t9CbtXUsck7h99d+QrpYuqTVJrWv2n5
         g4Palr7RbVAYIb+KmAx1/vXPCRXGnN8u4lqFc2LX1tvRRS7SnnNt9Cb/noe7sTUDtrLP
         Dxog==
X-Gm-Message-State: AOAM531I3Xf/i2PuVlXv73dhI5xxqsF6C9cIH0WzOnF2klqtnWDzb7LN
        2XLR9ODJbVyL2ZCY7CBRAQ==
X-Google-Smtp-Source: ABdhPJxK9TrO5botFJ05t5KKEIli/p7GGTMOOLDXufYNa+3UTvlC6ExS2JUfz4kktJbxvEPaoHkWUw==
X-Received: by 2002:a05:6830:2258:: with SMTP id t24mr767341otd.211.1634575889223;
        Mon, 18 Oct 2021 09:51:29 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id r5sm2589548oov.48.2021.10.18.09.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 09:51:28 -0700 (PDT)
Received: (nullmailer pid 2545603 invoked by uid 1000);
        Mon, 18 Oct 2021 16:51:27 -0000
Date:   Mon, 18 Oct 2021 11:51:27 -0500
From:   Rob Herring <robh@kernel.org>
To:     Horatiu Vultur <horatiu.vultur@microchip.com>
Cc:     Steen.Hegelund@microchip.com, devicetree@vger.kernel.org,
        robh+dt@kernel.org, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, lars.povlsen@microchip.com,
        p.zabel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com
Subject: Re: [PATCH v6 1/2] dt-bindings: pinctrl: pinctrl-microchip-sgpio:
 Add reset binding
Message-ID: <YW2mD3sYKa0JeJsD@robh.at.kernel.org>
References: <20211018085754.1066056-1-horatiu.vultur@microchip.com>
 <20211018085754.1066056-2-horatiu.vultur@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211018085754.1066056-2-horatiu.vultur@microchip.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 18 Oct 2021 10:57:53 +0200, Horatiu Vultur wrote:
> This describes the new binding which allows to call a reset driver from
> the pinctrl-microchip-sgpio driver.
> 
> Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
> ---
>  .../bindings/pinctrl/microchip,sparx5-sgpio.yaml           | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
