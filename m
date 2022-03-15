Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 173254D9FC8
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Mar 2022 17:19:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235918AbiCOQUJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Mar 2022 12:20:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349967AbiCOQUI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Mar 2022 12:20:08 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 122401276F
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 09:18:56 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id n7so21340417oif.5
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 09:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Em5xMVZQLrR/NiGDTVcPyJrzArjc9v1y2RjbKDoAxeE=;
        b=r/KHFxIQ9cNwkwMWJ3NuTgoaVO3mOgYvQuaisHpfb+9E3mGbiubIEz2IVbo+LFoLtS
         op1qcF0AwXhIawa188FdjIDE26JCkFsJvex0bVM89bNv3ayaIjXwi7pTWODS0E7J0mda
         2vwR43HJFUbRGC+HoEYnD1vRMUnyURRY1lUa04PAYjKuAv95jne7O8HeyDqvufZaoHcB
         WlxlQdC3WKzhNH8aOsAoWfPge6/uEAHRgbPdB7C3lFwJ+XlodgG6KEWpl/UZJ4FDLBEI
         mXdnmzJuBtLtiH2XvtXl/dIuib00ZJBPojHDsd7YjmhTEyhpb9O2MugMyXeAXpN4rxfS
         4gBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Em5xMVZQLrR/NiGDTVcPyJrzArjc9v1y2RjbKDoAxeE=;
        b=jDC2P48xyp/0gemGwwooEXdCPec7FvD6o1zdKHN3YpOT997N1wgVjEgQlenFq41PB8
         X0vtF8tp36VeLo7mWO6/TBMA7PEMAZSJTWGZOtzuBFGsGoG9SUSFfoL5tH1A4aH8sur3
         IGYCwnw2fS1Mq1R/+yscWgRZnHlPIOfowdcVAvonpMDAMS06RNsI14/g2E5ZpHMCVzhZ
         5Fm87QAB+Xuu2m3PW5nE39XCbXBUK9/r+Zt7HvCZJP+ByPUQYoNzWYjbDm5gPFwP7Yk7
         OHrUhLJ6jCBSKe8gky6v76vHAihucGuBulvXhcsCMAYh2Sfdfnsi1LtrKBrZ2jnwKaJh
         M5mw==
X-Gm-Message-State: AOAM533iZO+EEDv8feudJGGF/eIU9/nWEp5l1Big/06ynQMTTxTRd7YV
        qQH/46Q/UoQ2g4r7r9BjA+u15wmZm1T8NA==
X-Google-Smtp-Source: ABdhPJyhH0FJKDNG5YJgwlpKc0zXAThsoAg9TgnVRbKIaK5fAgXk6gNRuZtozK0JSwjPv6FTm8Frgg==
X-Received: by 2002:aca:2110:0:b0:2ec:b1cf:2dda with SMTP id 16-20020aca2110000000b002ecb1cf2ddamr2105902oiz.143.1647361135489;
        Tue, 15 Mar 2022 09:18:55 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id 37-20020a9d0328000000b005b2265711fcsm9276523otv.16.2022.03.15.09.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 09:18:54 -0700 (PDT)
Date:   Tue, 15 Mar 2022 11:18:53 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, maz@kernel.org,
        quic_mkshah@quicinc.com, linux-gpio@vger.kernel.org,
        linus.walleij@linaro.org, robh+dt@kernel.org,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: sm8150: Add pdc interrupt
 controller node
Message-ID: <YjC8bfY2U1WyV8FY@builder.lan>
References: <20220226184028.111566-1-bhupesh.sharma@linaro.org>
 <20220226184028.111566-4-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220226184028.111566-4-bhupesh.sharma@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat 26 Feb 12:40 CST 2022, Bhupesh Sharma wrote:

> Add pdc interrupt controller for sm8150.
> 
> Cc: Maulik Shah <quic_mkshah@quicinc.com>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index 6012322a5984..aaeacd379460 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -1626,6 +1626,16 @@ system-cache-controller@9200000 {
>  			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  
> +		pdc: interrupt-controller@b220000 {
> +			compatible = "qcom,sm8150-pdc", "qcom,pdc";
> +			reg = <0 0x0b220000 0 0x400>;
> +			qcom,pdc-ranges = <0 480 94>, <94 609 31>,
> +					  <125 63 1>;

When I look at the platform documentation I get the impression that this
should be: <0 480 94>, <94 609 32>;

Can you confirm that the last signal is correctly described?

Regards,
Bjorn

> +			#interrupt-cells = <2>;
> +			interrupt-parent = <&intc>;
> +			interrupt-controller;
> +		};
> +
>  		ufs_mem_hc: ufshc@1d84000 {
>  			compatible = "qcom,sm8150-ufshc", "qcom,ufshc",
>  				     "jedec,ufs-2.0";
> -- 
> 2.35.1
> 
