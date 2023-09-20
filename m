Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26FBA7A7373
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Sep 2023 08:58:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232386AbjITG6X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Sep 2023 02:58:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbjITG6X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Sep 2023 02:58:23 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2123EB9
        for <linux-gpio@vger.kernel.org>; Tue, 19 Sep 2023 23:58:16 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2c038a1e2e6so10002501fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 19 Sep 2023 23:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695193094; x=1695797894; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0wrCOVhLC2r5zAg8aEKZ+Z8LShRgLvtb2yTC7pbk7TQ=;
        b=YQiMcdBV9Ocw5NEAxkdBv4TlHAOthCsVhiIrMOKfVs5cJI7pvixMp6eJ26/ixtJdy6
         TVm7q9AhxJLv3NP5GTLOYorEPcxjcNWErVx931jlp49iJ4fPvTCCmJpvogrL4vPmml9C
         qFbFtYzq3+ufRpB2jPy4Duh2Hnf8meaBL/vVwJvDymvGyFPvUz+JtoJUheIbZEUL/bJF
         uAeqxQov0NiQlyRiT458cVdpZ4ONNcDMdKDY6RQLKcdrvNHFB0fpYVOz1ZV1EzGdO+z9
         GGKuE1F31Ft5PNTxFim+XFj82ivuI5jxi1dB8mjdSkFwIsddDkpBzBSAx5NJK5S2HB2t
         ByRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695193094; x=1695797894;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0wrCOVhLC2r5zAg8aEKZ+Z8LShRgLvtb2yTC7pbk7TQ=;
        b=GoZn4AYKZPCGSD07fy3y9j4krmWjU+pZ0fum2WJ7heevHS2dgWWFYs1656UR78m7W2
         PK78mF2pLih5C9qDsF9QXSp2s6vjMTF2kGfVnuQxdVBo+ebOoMgjvWubZE7XakCFBlp/
         YEywuiZN8L2QokSQSGokhrgShygYUnXvp5NoKyopSPWxENodKfRnlgrzRdnOCRBvLtPE
         OEi96WV500NZcVrJ/kPxofVxHxbS3Aye6YiqUG5lnKRihkDr7RyeufhrhPyDWWa6zx7N
         kXqHL4U/0fOg20BIdnDlclAS+/7YL8rJue7ptr1NpMUY3BuXATCsrTrEIIFAt5qfWblj
         IHrw==
X-Gm-Message-State: AOJu0YwuLnZPGjFXU3KREWugQ245RKtOI4T/WGIWU0ID+gPMHEXo28b8
        J08I4hLNBH8JanOoFiDddO6RPQ==
X-Google-Smtp-Source: AGHT+IGGRGWJd2RdfNcTxy8s5cuxAYG70VTNMg3Wae8gXHW03xrfqtu1s97T1TvazYsLDmqBBx8TpQ==
X-Received: by 2002:a2e:924d:0:b0:2c0:300a:82ed with SMTP id v13-20020a2e924d000000b002c0300a82edmr1360955ljg.7.1695193094292;
        Tue, 19 Sep 2023 23:58:14 -0700 (PDT)
Received: from [172.20.24.238] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id rn5-20020a170906d92500b0099bd5d28dc4sm8839120ejb.195.2023.09.19.23.58.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 23:58:13 -0700 (PDT)
Message-ID: <d2f6bfbb-fd08-a551-51d3-f81d9237e060@linaro.org>
Date:   Wed, 20 Sep 2023 08:58:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: qcom: Add SM4450 pinctrl
Content-Language: en-US
To:     Tengfei Fan <quic_tengfan@quicinc.com>, andersson@kernel.org,
        agross@kernel.org, konrad.dybcio@linaro.org,
        linus.walleij@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_tsoni@quicinc.com, quic_shashim@quicinc.com,
        quic_kaushalk@quicinc.com, quic_tdas@quicinc.com,
        quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com,
        quic_ajipan@quicinc.com, kernel@quicinc.com
References: <20230920064739.12562-1-quic_tengfan@quicinc.com>
 <20230920064739.12562-2-quic_tengfan@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230920064739.12562-2-quic_tengfan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 20/09/2023 08:47, Tengfei Fan wrote:
> Add device tree binding Documentation details for Qualcomm SM4450
> TLMM device.
> 
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>



> +    properties:
> +      pins:
> +        description:
> +          List of gpio pins affected by the properties specified in this
> +          subnode.
> +        items:
> +          oneOf:
> +            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-1][0-9]|12[0-5])$"

Your driver and gpio-ranges in example tell you have 136 GPIOs, not 126.
It's v3 but still counting GPIOs is incorrect :/

Best regards,
Krzysztof

