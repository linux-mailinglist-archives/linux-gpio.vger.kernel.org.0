Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4CBF7CD75F
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Oct 2023 11:01:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbjJRJBI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Oct 2023 05:01:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbjJRJBG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Oct 2023 05:01:06 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA162F7
        for <linux-gpio@vger.kernel.org>; Wed, 18 Oct 2023 02:01:04 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50435ad51bbso8697746e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 18 Oct 2023 02:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697619663; x=1698224463; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZSpFNZO1arwmkyx+97hJB9n0j7JKmTEsg8eKLgN5W3I=;
        b=i0tapi9TzuJqMU124OQHL800D8HbfGbf7QPdhWt0OrKNRLNXIEki04cMf1Hj7cvWyi
         FznfgWnEoc9i6W8UrRxJRIYPHh3xajvt8ZuL8qdPX56IHqCs2CXRlPtT/il2aN7AoK6r
         WoWHYKazfnaVhzx9A6hSTIbaFntzU4Tcu0nyQtBykBK8wPjSD9+iNyC0Q+7mxN9vGyzy
         AEuTEpziO55hvRw6lawafd1i2O8CyRLCdAbuWvWek/metUaRQV1HtGqBbSJLdYnhqkcf
         cSzLGLekQJ4VF04tnFjyZnj3XnPnx9f9E4oq6+JV53Mb/+hR6uZDy7BVqvXLY8/L31Ay
         HXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697619663; x=1698224463;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZSpFNZO1arwmkyx+97hJB9n0j7JKmTEsg8eKLgN5W3I=;
        b=OkGcJCTGaRhFJFjWMRb8HqdrIWvxcfYnbYdPhYqvHe2AbSScBK1yyvUM8e/hilaMUW
         lZftoiXRIoziAt43V8RP+vvMcQCf8C6XKH6ojvjzY1VbEvVIFukUg1jPo9MK/JksIRF6
         hwB+fYyny2yT6gcGhFjsyv12mZOfSHZteUFxB5Scd6IOtwokBvVbFNQDCd/hsTMOLRvf
         eX6htsUXnwtCkewB7xUNEt3BPMcT68ewOjWB+mF9nsG+x2+PBZ7zDL0ij9gJHOjAFNez
         gzEbsTOv0AQ4l/zA6fdvU+/9xpLGLwNpmfm+THiq9EXo04ioeBBxbJocycQ3mwyijjC1
         /uGQ==
X-Gm-Message-State: AOJu0Yx7GljG/ydZHO3mgadXLYaxhOrB69R20nju1ZGYU3CVACgCUtQa
        69BtiLV4Z7HS9l65jD+EqxBMQQ==
X-Google-Smtp-Source: AGHT+IHfuSChl3m67DXdnoev5ggVFiwYwf9ghGOeVq7b/O0ZW2jEVoLQJADhG06GtJH0kVLil/+4mg==
X-Received: by 2002:ac2:4d86:0:b0:500:d970:6541 with SMTP id g6-20020ac24d86000000b00500d9706541mr3290410lfe.39.1697619662481;
        Wed, 18 Oct 2023 02:01:02 -0700 (PDT)
Received: from [172.30.204.55] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id h41-20020a0565123ca900b004fbc82dd1a5sm619906lfv.13.2023.10.18.02.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Oct 2023 02:01:02 -0700 (PDT)
Message-ID: <62645ba4-ab4a-491e-a9d8-6b7faebbb8cd@linaro.org>
Date:   Wed, 18 Oct 2023 11:00:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: lpass-lpi: allow slew rate bit in
 main pin config register
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20231013145935.220945-1-krzysztof.kozlowski@linaro.org>
 <20231013145935.220945-3-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231013145935.220945-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 10/13/23 16:59, Krzysztof Kozlowski wrote:
> Existing Qualcomm SoCs have the LPASS pin controller slew rate control
> in separate register, however this will change with upcoming Qualcomm
> SoCs.  The slew rate will be part of the main register for pin
> configuration, thus second device IO address space is not needed.
> 
> Prepare for supporting new SoCs by adding flag customizing the driver
> behavior for slew rate.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. Reversed xmas tree
> 
> v1: https://lore.kernel.org/all/20230901090224.27770-1-krzysztof.kozlowski@linaro.org/
> ---
Only because I know it'll be used soon:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
