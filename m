Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21E395EFF82
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Sep 2022 23:56:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbiI2V4w (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Sep 2022 17:56:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbiI2V4v (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Sep 2022 17:56:51 -0400
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86E8C145959;
        Thu, 29 Sep 2022 14:56:50 -0700 (PDT)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-131886d366cso3394531fac.10;
        Thu, 29 Sep 2022 14:56:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=EJen2ttDhFxOc16LaWiBXDkrf31fuKODtOYbjKdt6ns=;
        b=XBok32O8Umq95jvQz89Jj4AE6z0EVXn4vW8wyU1Af/4WA1G6Wv7SmEIE0yJDpKWehE
         Pko0rKSyeuVCpHoT/8v7ZbIdnsinHaQ2yK+H/qzoSyZuOCz4AR1wPs3bcU7SVYWMxV+q
         FYG8hk1TKrjsszdYSAVFMis9pmzzKedeRZ6vSPx4rNjMzhzOnW98aqko2Q8KtV+NmYX1
         lHWEStP65Q2JpjGcFdXvuo5ctrFrehxQ62Tz74xT99NDj7Tqzie7e4FrCpLyh2lcyn+Y
         VkbtSfmbj5+m3o7D6wOZKwH7Q/RI/X4/oSA7oyvt2cATLS/5NxsNnuq0YoUUIXSU4+c9
         DUEw==
X-Gm-Message-State: ACrzQf2BYGVbM8FmVnAcntcBHmUp5WNw7tqyRCKAwJ1mosI2FvA0Axvq
        jV7Zw9tDnOj8gUzZbU67nw==
X-Google-Smtp-Source: AMsMyM47C0YmzwZluUIw8W3m576jCvxFl3M9CN/HsBS7NJTg3YWg1qmkyc+v/BX9cx6f5EXgyQzgJQ==
X-Received: by 2002:a05:6870:b508:b0:12d:1c59:90d9 with SMTP id v8-20020a056870b50800b0012d1c5990d9mr9785566oap.199.1664488609670;
        Thu, 29 Sep 2022 14:56:49 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t7-20020a9d66c7000000b00636d0984f5asm205815otm.11.2022.09.29.14.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 14:56:49 -0700 (PDT)
Received: (nullmailer pid 2775235 invoked by uid 1000);
        Thu, 29 Sep 2022 21:56:48 -0000
Date:   Thu, 29 Sep 2022 16:56:48 -0500
From:   Rob Herring <robh@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-stm32@st-md-mailman.stormreply.com,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: st,stm32: Document
 interrupt-controller property
Message-ID: <166448860809.2775190.4452882592081127280.robh@kernel.org>
References: <20220926204752.381798-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220926204752.381798-1-marex@denx.de>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 26 Sep 2022 22:47:52 +0200, Marek Vasut wrote:
> Document interrupt-controller property and its interrupt-cells.
> This fixes dtbs_check warnings when building current Linux DTs:
> 
> "
> arch/arm/boot/dts/stm32mp153c-dhcom-drc02.dtb: pinctrl@50002000: gpio@5000a000: '#interrupt-cells', 'interrupt-controller' do not match any of the regexes: 'pinctrl-[0-9]+'
> "
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>  .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml          | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
