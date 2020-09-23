Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D5B22762DB
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Sep 2020 23:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726709AbgIWVIs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Sep 2020 17:08:48 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:45500 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726134AbgIWVIs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Sep 2020 17:08:48 -0400
Received: by mail-il1-f193.google.com with SMTP id h2so957584ilo.12;
        Wed, 23 Sep 2020 14:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BJgV/v1mJgmbFu7dhPTnjwdZ+z8kXr/SxEQWpEUFHhQ=;
        b=RiuxHluZEjExvfqhNtpqYSuaU4e0WNKYh9AGTUs0cCve9dVp0pVVHp1uiUHuk3u8WS
         GuqMJ42MgZPU53IAs6vIxD84gVY45/JCUpL3f86tXyHCYdaqPc+B6V/zM1+GCdp6SS8r
         ceFsiVr4IrnRle4U+4z875hqmQhr0yCW//hM0DFhqGXHIg9vOrAy3Yvp8TdZJcTmVs90
         CdQhvTfYifm6qI0MF523F6Nb6yATS4GS4DFwdOrxcMADfBAwhKoLr1UfwjJnh8p1+ZEM
         tNqzoneDel1iXz2gvoatIZVT7fd56daFJ7QU0jGJ0L+b5DUP8hiCTxGEtIy7cSwkZJxC
         AOOQ==
X-Gm-Message-State: AOAM530cq6kUDA0lpU/fiTfn+Rt+PSeIkmTnUIoQdeL33IkdQae5WVUb
        lqr8IsCO6ZhxjpxLB8sE+g==
X-Google-Smtp-Source: ABdhPJz3Yvj6UjdeyCs78n+u5VY8+LOBvKfJwAjKgNn4KfSRBrahZD/SL0Hxi4vGpf1/yifbbu/woA==
X-Received: by 2002:a92:aa98:: with SMTP id p24mr457766ill.17.1600895327208;
        Wed, 23 Sep 2020 14:08:47 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id p8sm443116ilj.36.2020.09.23.14.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 14:08:46 -0700 (PDT)
Received: (nullmailer pid 1313404 invoked by uid 1000);
        Wed, 23 Sep 2020 21:08:45 -0000
Date:   Wed, 23 Sep 2020 15:08:45 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Anson Huang <Anson.Huang@nxp.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Stefan Agner <stefan@agner.ch>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: gpio: fsl-imx-gpio: add
 gpio-line-names
Message-ID: <20200923210845.GA1313375@bogus>
References: <20200920195848.27075-1-krzk@kernel.org>
 <20200920195848.27075-3-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200920195848.27075-3-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, 20 Sep 2020 21:58:47 +0200, Krzysztof Kozlowski wrote:
> Describe common "gpio-line-names" property to fix dtbs_check warnings
> like:
> 
>   arch/arm/boot/dts/imx53-m53menlo.dt.yaml: gpio@53f84000:
>     'gpio-line-names' does not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v2:
> 1. None, split from previous patchset using common GPIO schema
> ---
>  Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
