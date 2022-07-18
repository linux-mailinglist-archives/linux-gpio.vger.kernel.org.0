Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E5695784D5
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jul 2022 16:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233338AbiGROIw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jul 2022 10:08:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235231AbiGROIv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jul 2022 10:08:51 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23FD7FE2
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 07:08:49 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id d12so19498273lfq.12
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 07:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=8CqAs9Ua7Pm8Q2XSJh/dswnbeNdXHzd1llWNOHbIuD0=;
        b=AZP+58llLmJC3ISGeRpqLe8S5SU5cyj1U9du0bCtxTz57c1auuFp1bdrqbtDZqmdH+
         jsoBPRqy9ceu6SiyC5bv8BCTvN4fTtcQb8pUA+539DHYzGFvk2FHHXWj+uTKBRwiUPkX
         yJd8kYfdlgQPDkA8rODq9IlHRtUkLX8P68eCbpivN4Cm3n+cCeIJfX9WggoGOe22Kyau
         Crn2aYQ21U+SKMhrcO+5y5LpZNWp+DhgS8aibz/SYGLlQzPHDvDpda+v7VDtly9UEXzO
         kJ8/IWI2xzQqXN+XzeRacveJoDw6jox0hBhtkS76wku+21Ff2wzlcHu2opjhZXXljR1J
         SnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8CqAs9Ua7Pm8Q2XSJh/dswnbeNdXHzd1llWNOHbIuD0=;
        b=MCy945BAWMKx/5WZppj50ttxmoByWkV2ZpKI6BFc/e45D7FEyaUz48X2TxvBRMbpDE
         C5+BXpOARpeh0h2L4fO+mvFz3Oab3lYZ2uuf98WmZXYgUDJBdqSKDKs7m4XwJdE+rW/1
         OqXHIOn9sPdCUP77kE3bzfWIdWfbAAfqKBtNOQJMSEVQV3EQhuvf7hK952sDtxyIQ3c0
         PJS5eo5z1cMecQqhWAbr9PsWZex7CFXxq4Z4V/s3zNkzdIcxhBdTkecVw718jz8EtxgZ
         jC81O0f+SrJHmYIdCqr3e7ZR4gSCltcHzOQTkHv2XszRDSrfq+Fsar/jCCyVWYmfg+qn
         hhoQ==
X-Gm-Message-State: AJIora89K0TDCLWaeOm9Up+P466yTNNgiHosI/jEgB2GtiM1hQV/PNSB
        wYdXcYVxJ/Ug06VB06az+j61MA==
X-Google-Smtp-Source: AGRyM1tMdIUR9jHUwbcEC9/NAS7p2+/gpqVLsPo9FDRHsddDPnRJMiUKece0HNK6p14XKK1PqS1IrA==
X-Received: by 2002:a05:6512:1684:b0:47f:5f27:b006 with SMTP id bu4-20020a056512168400b0047f5f27b006mr15108397lfb.225.1658153327547;
        Mon, 18 Jul 2022 07:08:47 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id p26-20020ac246da000000b0048a256f50b3sm2016576lfo.102.2022.07.18.07.08.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jul 2022 07:08:47 -0700 (PDT)
Message-ID: <67c5ed4a-022a-e2b4-cbbb-ca6818bf4881@linaro.org>
Date:   Mon, 18 Jul 2022 16:08:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: mt8188: add pinmux definition
Content-Language: en-US
To:     Hui Liu <hui.liu@mediatek.com>, linus.walleij@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        matthias.bgg@gmail.com
Cc:     srv_heupstream@mediatek.com, johnson.wang@mediatek.com,
        zhiyong.tao@mediatek.com, sean.wang@mediatek.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220718113813.23787-1-hui.liu@mediatek.com>
 <20220718113813.23787-3-hui.liu@mediatek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220718113813.23787-3-hui.liu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 18/07/2022 13:38, Hui Liu wrote:
> From: "Hui.Liu" <hui.liu@mediatek.com>
> 
> This commit adds pinmux definition for mt8188 platform.
> 
> Signed-off-by: Hui.Liu <hui.liu@mediatek.com>
> ---
>  include/dt-bindings/pinctrl/mt8188-pinfunc.h | 1280 ++++++++++++++++++
>  1 file changed, 1280 insertions(+)
>  create mode 100644 include/dt-bindings/pinctrl/mt8188-pinfunc.h
> 
> diff --git a/include/dt-bindings/pinctrl/mt8188-pinfunc.h b/include/dt-bindings/pinctrl/mt8188-pinfunc.h
> new file mode 100644
> index 000000000000..bb764b67159b
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/mt8188-pinfunc.h

Vendor,name
mediatek,mt8188-pinfunct.h

> @@ -0,0 +1,1280 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

Dual license.

Best regards,
Krzysztof
