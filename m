Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0AFF2762D8
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Sep 2020 23:08:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726681AbgIWVIf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Sep 2020 17:08:35 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:32916 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726134AbgIWVIf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Sep 2020 17:08:35 -0400
Received: by mail-il1-f194.google.com with SMTP id y2so1044871ila.0;
        Wed, 23 Sep 2020 14:08:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2zO/8HNF5KNw07rfxTT1L4hthK6uxIq7jcot+sHBRf4=;
        b=QA08uZV3rTx4YoAt5dA8oNfUUBsCon9eHq/aeBTmQ0btLPb3wXDFvsIRzX8IaFXSTc
         +I64AsvP0nHQraec8gLTXlSGi1VuLtHfI/QMIyMFH4fT5V3OuqsUr7jNnw/5ivQb4wop
         yOHUvhkUvQJYP4sDqnbeW88hupO9DVZTP78kYOGkozuShjelKEBwQp1c1cvZuAEUWpFc
         VbgPOxnZbRNsHm7IxUFcBvjfv2B8WAstP/Gk6xvkYAL5pG4FCXMm+9t3iYf4ifp3hr1k
         g2Uc8PMZXyROP5Wusn0YRYLu1mZlw7m3NjZUNSTR1WdMwuviLrOh28+WksqslTZCbpbP
         Pp9A==
X-Gm-Message-State: AOAM53216b2QVxlfiDFJmAT82sDzxkNPF6cZWwGwHwMoJYkleqjcvfAu
        KXoVd5SCoTQCoE6LvAMRBg==
X-Google-Smtp-Source: ABdhPJzijCKYWELUQwfg2URaf9zqFF6I/Sr1Hdfu+M53n7Tkg0djvVya9S5j5mdbYLvHdHHlcIyI6g==
X-Received: by 2002:a92:5f94:: with SMTP id i20mr1503312ill.106.1600895314595;
        Wed, 23 Sep 2020 14:08:34 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id p5sm420990ilg.32.2020.09.23.14.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 14:08:34 -0700 (PDT)
Received: (nullmailer pid 1312988 invoked by uid 1000);
        Wed, 23 Sep 2020 21:08:33 -0000
Date:   Wed, 23 Sep 2020 15:08:33 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Stefan Agner <stefan@agner.ch>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Anson Huang <Anson.Huang@nxp.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v3 2/4] dt-bindings: gpio: fsl-imx-gpio: add i.MX ARMv6
 and ARMv7 compatibles
Message-ID: <20200923210833.GA1312931@bogus>
References: <20200920195848.27075-1-krzk@kernel.org>
 <20200920195848.27075-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200920195848.27075-2-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, 20 Sep 2020 21:58:46 +0200, Krzysztof Kozlowski wrote:
> Several DTSes with ARMv6 and ARMv7 i.MX SoCs introduce their own
> compatibles so add them to fix dtbs_check warnings like:
> 
>   arch/arm/boot/dts/imx35-pdk.dt.yaml: gpio@53fa4000:
>     compatible: ['fsl,imx35-gpio', 'fsl,imx31-gpio'] is not valid under any of the given schemas
> 
>   arch/arm/boot/dts/imx51-babbage.dt.yaml: gpio@73f90000:
>     compatible: ['fsl,imx51-gpio', 'fsl,imx35-gpio'] is not valid under any of the given schemas
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v2:
> 1. None, split from previous patchset using common GPIO schema
> ---
>  .../devicetree/bindings/gpio/fsl-imx-gpio.yaml       | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
