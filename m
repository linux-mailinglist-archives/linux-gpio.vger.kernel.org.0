Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B32E5FF329
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Oct 2022 19:51:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230024AbiJNRvj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Oct 2022 13:51:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230056AbiJNRvi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Oct 2022 13:51:38 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAD981D2B40
        for <linux-gpio@vger.kernel.org>; Fri, 14 Oct 2022 10:51:35 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id ot12so12135859ejb.1
        for <linux-gpio@vger.kernel.org>; Fri, 14 Oct 2022 10:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BRzfRKDxaeHVs/GEuc3GGv5B2DGMz09Y1rLFxYGdPvQ=;
        b=I3Yc27ujyXHn3kpemFL/t4UfgZ6B6RErsnMNAgfreS3Cunh0XiPoSf9816h489ap+X
         mvPVmo5Ne8pI0UiM2yQ3NvBnVcye05CPWEbXR9zUG6eysQiFII9iSDIMjRcXDiHOCUSk
         jbsqcRBowfBAGQobB0S3A7J3aY61u0YLMFd/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BRzfRKDxaeHVs/GEuc3GGv5B2DGMz09Y1rLFxYGdPvQ=;
        b=69PO7E8d0XY8UsHS4fLDuTuocodJFQB7VWJEVQsNoYGy6Iuwk3sMqUHgSIsinrcghB
         svD+hsWvDf1EWVaBsvopeOo8q7bRSDHITu06NYceWxu0U04Kn5P4fjqKvnmnPUNVNB/I
         Og1BWu8jnqIsgFHT9WI8H8uK+bh86BeUntx5NQan03l0fIm0TbKPi1X/LDIzn38gt+u4
         usO/Yezqp6nBMKYYZRqEnQ2tLJt5rmpNylT/jwVgg4vf6SZ6cmXjF2WXKwoXG78cKmxW
         vr2oaS4tEEGXYjjZf2QKd2G5xTtf6AOkyKK5sKqzz2GdKqMkeRjy5h9G5iXKx6V1k5a0
         f9OA==
X-Gm-Message-State: ACrzQf2pb65gJpMZ9/D/dq3objVU2l0ipaMVNmp73ZI75N8UIQx/tl6z
        B0KJAq/9dAHVnefAuhH/qs49asldlcsU+cC5
X-Google-Smtp-Source: AMsMyM6+cbkNVuaj8e3ULf0baKGbn4WNpHnpbE4xJztxoITlHDF4am/CFOwu/dKZkuJ9EwCiwBg6ow==
X-Received: by 2002:a17:907:703:b0:78e:25be:5455 with SMTP id xb3-20020a170907070300b0078e25be5455mr2960470ejb.630.1665769893907;
        Fri, 14 Oct 2022 10:51:33 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id kv20-20020a17090778d400b0078d261f9f44sm1810155ejc.224.2022.10.14.10.51.32
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Oct 2022 10:51:33 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id u10so8740335wrq.2
        for <linux-gpio@vger.kernel.org>; Fri, 14 Oct 2022 10:51:32 -0700 (PDT)
X-Received: by 2002:adf:dd0c:0:b0:22e:4bf6:6c08 with SMTP id
 a12-20020adfdd0c000000b0022e4bf66c08mr4224068wrm.617.1665769892087; Fri, 14
 Oct 2022 10:51:32 -0700 (PDT)
MIME-Version: 1.0
References: <20221013184700.87260-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221013184700.87260-1-krzysztof.kozlowski@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 14 Oct 2022 10:51:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V9ofaQJSHaLoU=HVyOvezMjFQ7HeqMVcCaEjYBn9U5zg@mail.gmail.com>
Message-ID: <CAD=FV=V9ofaQJSHaLoU=HVyOvezMjFQ7HeqMVcCaEjYBn9U5zg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sc7180-trogdor-homestar: fully
 configure secondary I2S pins
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Thu, Oct 13, 2022 at 11:49 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The Trogdor Homestar DTSI adds additional GPIO52 pin to secondary I2S pins
> ("sec_mi2s_active") and configures it to "mi2s_1" function.
>
> The Trogdor DTSI (which is included by Homestar) configures drive
> strength and bias for all "sec_mi2s_active" pins, thus the intention was
> to apply this configuration also to GPIO52 on Homestar.
>
> Reported-by: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Fixes: be0416a3f917 ("arm64: dts: qcom: Add sc7180-trogdor-homestar")

> ---
>
> Changes since v1:
> 1. New patch
>
> Not tested on hardware.
>
> Cc: Doug Anderson <dianders@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
> index 1bd6c7dcd9e9..bfab67f4a7c9 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
> @@ -194,6 +194,12 @@ pinmux {
>                 pins = "gpio49", "gpio50", "gpio51", "gpio52";
>                 function = "mi2s_1";
>         };
> +
> +       pinconf {
> +               pins = "gpio49", "gpio50", "gpio51", "gpio52";
> +               drive-strength = <2>;
> +               bias-pull-down;
> +       };

Personally I wouldn't have replicated the "drive-strength" and
"bias-pull-down" here (nor would I have replicated the "function =
"mi2s_1"" in the node above but I didn't notice it before). ...but it
doesn't really hurt, the resulting dtb (after combining all includes)
isn't changed, and you've about to clean this up in your next patch.

Thus:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
