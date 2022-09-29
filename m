Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEE3D5EFF80
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Sep 2022 23:56:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229449AbiI2V4f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Sep 2022 17:56:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbiI2V4e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Sep 2022 17:56:34 -0400
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE5F3140199;
        Thu, 29 Sep 2022 14:56:33 -0700 (PDT)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-131ea99262dso1124277fac.9;
        Thu, 29 Sep 2022 14:56:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=V9zVHpuWkh/i7x7TQRfGROzdebyc2nbt6mtcwCC/H2s=;
        b=KTtQFv4cWpbNf+yDLTvilDYM5pwhqtAQ+M4/F2Gh6GHafEJQzpB8PoALFalxASGnsA
         z8F1ZKZgfWcCc0Qn5z8dzaPpBjc5h/t7MAoUFLZ+sZ1Itjd9wytx12Wf/v0AXiNVJ5aL
         IrTqDjG1fl2u9yrzUJo6NoJGHhdsFIp9wLbhU6kXTJ8pyj+9j2ykHmc+1GkjUMdxZ3gD
         pugBFlfrzrOhytGgpthlpBe7wCzUFxw9HPsXEagjZ+pBOf3kH8Ch9sCCZ7YeKY61ECJc
         ZxZCnDb2A0MmXNOUCxmCrYX3mcI1e0FTZH5OLrXhfjlF8GHk/FCmgSoJfA0u3AGHzz7N
         2X8w==
X-Gm-Message-State: ACrzQf2BcCL4oDcFhfLNv0VpYqKEYB5HgSFwCCYy+H1ypAn/NVM/VzCo
        vXUzf0DvAsQrU2bdtckLJw==
X-Google-Smtp-Source: AMsMyM4q8qqCa206penQyorIBTJoLeOZmP4X4ZijAKx++JcFwG/uTedysH1VCHoh4TMmaMzoMTADNw==
X-Received: by 2002:a05:6870:c391:b0:10c:a937:aaf1 with SMTP id g17-20020a056870c39100b0010ca937aaf1mr3062395oao.272.1664488593146;
        Thu, 29 Sep 2022 14:56:33 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id o8-20020a056870524800b0013185365eb7sm235997oai.28.2022.09.29.14.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 14:56:32 -0700 (PDT)
Received: (nullmailer pid 2774818 invoked by uid 1000);
        Thu, 29 Sep 2022 21:56:32 -0000
Date:   Thu, 29 Sep 2022 16:56:32 -0500
From:   Rob Herring <robh@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-gpio@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: pinctrl: st,stm32: Document gpio-hog
 pattern property
Message-ID: <166448859158.2774756.9828897136767131481.robh@kernel.org>
References: <20220926204735.381779-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220926204735.381779-1-marex@denx.de>
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

On Mon, 26 Sep 2022 22:47:35 +0200, Marek Vasut wrote:
> Document gpio-hog pattern property and its subnodes.
> This fixes dtbs_check warnings when building current Linux DTs:
> 
> "
> arch/arm/boot/dts/stm32mp153c-dhcom-drc02.dtb: pinctrl@50002000: gpio@50003000: 'rs485-rx-en-hog' does not match any of the regexes: 'pinctrl-[0-9]+'
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
>  .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml       | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
