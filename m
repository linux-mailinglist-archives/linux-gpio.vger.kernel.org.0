Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1F2968367E
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Jan 2023 20:26:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231738AbjAaT0a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Jan 2023 14:26:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231674AbjAaT02 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Jan 2023 14:26:28 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A6A91C31A
        for <linux-gpio@vger.kernel.org>; Tue, 31 Jan 2023 11:26:21 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id j32-20020a05600c1c2000b003dc4fd6e61dso6408250wms.5
        for <linux-gpio@vger.kernel.org>; Tue, 31 Jan 2023 11:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VzPkXOHbz8Le+wd3tCw/7FSTfXtAkNQsxSH/0GMjgNU=;
        b=AX/EGNKMV/LuJMwUZT/LStgmTrGGH58Sl0Ji5WxdXCXbNJxxS40BCUCf+ndPIGCfPe
         UG+nkxvoGZLjVRMFvfJV/TlGJewjwZJgK0dB8wJxpuTuQElNoccgdLF0bPHWlX/oP4Jg
         Rn1EheZMMpjxAByphimqAc4Lpy58FLG65PoacfrU+0BAAGeU2NU5rlb9ZhVX6PM3HRvN
         qlzqSS7dwavsda/F+g+UrbfLT9SzzeV0bNbRDtmYYBcarJsH4l3NA3C53psSS//YNiLy
         1q5z33c2HLp6K9Pp1U4mQ7OeK8X1BHfeVMHVeYYbNAX0RZdb3+E1egNn39iL3S+Fw4xl
         5g1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VzPkXOHbz8Le+wd3tCw/7FSTfXtAkNQsxSH/0GMjgNU=;
        b=xEXf4v9a6MF4LFLi6z3ol2h3RbpjhJrEgpRGX2imGY5JvP67ZVlOtnLFlCasGRDK3t
         TTx+mhqPrZk+KcK3PEK9uRCLTnI+lXrZKCFNNPQD9fyCZokTbQNEqFt0tTe4uHVb15JG
         Ldpa+p32gQEnbvmbiEH1tnl06jOc4yuSh6S++yIWw0xv2/MKjiBimsKmLwkvr3jxi87v
         RwdDLIAmM8Du9R12atFYPK32iBakTanQuYljEFFTd1GS3tM9AvY0I7ifJMYylUWTyE72
         aZqr6jbGPdt7/VO3dQNUDcYmBOqud18TOBV6PqvV9jcMpaGuP40T951DzewWEzV4rWc+
         qgRw==
X-Gm-Message-State: AO0yUKUa4OFJ+hZVP7vdkGME05HcABqcxCY1j/4LRhJrQv7U2eAf2sba
        YLTVYo6S4OqbjeJLu5gnpTfzFA==
X-Google-Smtp-Source: AK7set9IBoahZt6Ksn6WPy/P/+aaveyfGzglq0Ci/LduNStiS7I2fR3gwTh0Ziv8SxJC2eyjwg9SQQ==
X-Received: by 2002:a05:600c:3b16:b0:3dc:489e:1867 with SMTP id m22-20020a05600c3b1600b003dc489e1867mr4864386wms.36.1675193179614;
        Tue, 31 Jan 2023 11:26:19 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id fk11-20020a05600c0ccb00b003db01178b62sm3169250wmb.40.2023.01.31.11.26.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 11:26:19 -0800 (PST)
Message-ID: <c031fad0-8f3b-60dc-9429-7bd78ae8a2d0@linaro.org>
Date:   Tue, 31 Jan 2023 20:26:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V2 8/9] arm64: dts: qcom: add IPQ5332 SoC and MI01.2 board
 support
Content-Language: en-US
To:     Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linus.walleij@linaro.org, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, arnd@arndb.de, dmitry.baryshkov@linaro.org,
        marcel.ziswiler@toradex.com, nfraprado@collabora.com,
        robimarko@gmail.com, quic_gurus@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230130114702.20606-1-quic_kathirav@quicinc.com>
 <20230130114702.20606-9-quic_kathirav@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230130114702.20606-9-quic_kathirav@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 30/01/2023 12:47, Kathiravan Thirumoorthy wrote:
> From: Kathiravan T <quic_kathirav@quicinc.com>
> 
> Add initial device tree support for the Qualcomm IPQ5332 SoC and
> MI01.2 board.
> 
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>


> +		sdhc: mmc@7804000 {
> +			compatible = "qcom,ipq5332-sdhci", "qcom,sdhci-msm-v5";
> +			reg = <0x07804000 0x1000>, <0x07805000 0x1000>;
> +
> +			interrupts = <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hc_irq", "pwr_irq";
> +
> +			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
> +				 <&gcc GCC_SDCC1_APPS_CLK>,
> +				 <&xo_board>;
> +			clock-names = "iface", "core", "xo";
> +			mmc-ddr-1_8v;
> +			mmc-hs200-1_8v;

No, our discussion did not finish. These are not properties of the SoC
in most cases. Why do you say there are part of the SoC? Is your SoC
coming with the same memory? Memory embedded in the SoC, not in the
board? If yes, the status is incorrect.

> +			max-frequency = <192000000>;

Same


Best regards,
Krzysztof

