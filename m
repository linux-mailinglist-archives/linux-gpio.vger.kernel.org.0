Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 982FA5EFF7C
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Sep 2022 23:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229447AbiI2V4T (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Sep 2022 17:56:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiI2V4S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Sep 2022 17:56:18 -0400
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 689AE13D1FA;
        Thu, 29 Sep 2022 14:56:17 -0700 (PDT)
Received: by mail-oi1-f169.google.com with SMTP id m130so2964433oif.6;
        Thu, 29 Sep 2022 14:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=D8Kzu6/oUlXFxvg+6E7aKSySK9Mlh0ChMnK2mROPKCE=;
        b=AoTXGGSijEbXTdqGcpl2g034Fks7fa6r6P7VgeHAyapAFGA+QgO5WygPHlTbVQ4I2j
         4qFVyVPzN12fB50aWolFFrOel20iA7r6mIUBuKjUkzb3A+o6W+gJNoGIhj5bziueFfPC
         hxoaJSCOmAM1SRxVOKyo8uI0frL5aaQWWOq5uGEpaEuiaSXqLHfHx7ZlAAULcnMJTpAL
         xRdGAGmq+am3LRwP+c/olROXcLPBB/m3pSrmmwbH8tG5/39gH40HYlT77C5T2lDouBRo
         780BUH8XTEOLo6L14PKGyS98Oq13wt9osB3PaYoEcpY0udgbTo0Pt9/aZZn3ksDxlpSI
         higg==
X-Gm-Message-State: ACrzQf0AaB8xntqW3KD7l7UXjQpXbavHGlXivUg+eV2tuVpxppkOKx8U
        baL/oM7rbMyR+s7/3z8H8g==
X-Google-Smtp-Source: AMsMyM6vkT/2Iy7WkSiRvFEP9tOdvyNHCt/e98BoJAO+18wdaCWPiS6KSTW4OzCKS/X9LylcQX5ajA==
X-Received: by 2002:a05:6808:3012:b0:351:3f4:d060 with SMTP id ay18-20020a056808301200b0035103f4d060mr8127189oib.241.1664488576681;
        Thu, 29 Sep 2022 14:56:16 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r63-20020acaf342000000b00342d18cc2fdsm112068oih.53.2022.09.29.14.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 14:56:16 -0700 (PDT)
Received: (nullmailer pid 2774408 invoked by uid 1000);
        Thu, 29 Sep 2022 21:56:15 -0000
Date:   Thu, 29 Sep 2022 16:56:15 -0500
From:   Rob Herring <robh@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: st,stm32: Document gpio-line-names
Message-ID: <166448857513.2774347.13258639802949517982.robh@kernel.org>
References: <20220926204724.381760-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220926204724.381760-1-marex@denx.de>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 26 Sep 2022 22:47:24 +0200, Marek Vasut wrote:
> Document gpio-line-names property as valid property.
> This fixes dtbs_check warnings when building current Linux DTs:
> 
> "
> arch/arm/boot/dts/stm32mp153c-dhcom-drc02.dtb: pinctrl@50002000: gpio@50009000: 'gpio-line-names' does not match any of the regexes: 'pinctrl-[0-9]+'
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
>  Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
