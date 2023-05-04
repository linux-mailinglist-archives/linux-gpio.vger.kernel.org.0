Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 766DA6F69DF
	for <lists+linux-gpio@lfdr.de>; Thu,  4 May 2023 13:27:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230054AbjEDL1K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 May 2023 07:27:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230211AbjEDL0y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 May 2023 07:26:54 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46D8F59D2
        for <linux-gpio@vger.kernel.org>; Thu,  4 May 2023 04:26:50 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-50bc4b88998so540401a12.3
        for <linux-gpio@vger.kernel.org>; Thu, 04 May 2023 04:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683199608; x=1685791608;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wAm0Ms50RBuBQUWsCH7mnryZ0Ty/pL6QPQW4ux5OXOc=;
        b=jRUeKBTv8reztpv61FqkPmZytNu1CYEVw/5vnkfOVUeU1o6Donl4SmGPXGLUxBpMj4
         7ScpHla2J1uUjs50HNs5N6fJpt5yc4WFOgooj5gxPR6zB2jw4LLBqcHvY/cKbTEs9yQ1
         v+cxEhecVPsShzhlzw1MAzGOambO/DT0SW0m3NPurOCaGDU2txwQKQxrGtQhVFRl0GFR
         cAR9teT4SUScVl45XQEdDLAQjtS8hQoh3jem27xQrC1cv3VHFCH4qkBs5ZM2K3FMo704
         0fo5ZQIrqDjYI+IUDcYHKbHz/hWQDD89gGDqNXGVrpb1wn9B8JUsvlrFAX75uTgZMS1M
         GjQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683199608; x=1685791608;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wAm0Ms50RBuBQUWsCH7mnryZ0Ty/pL6QPQW4ux5OXOc=;
        b=e/O8EM9YMayFXG9eq+Q08m3UGu5uI6H+kegPC8yFT4u5noKdg8rFS6aX6Yl4x/aBNI
         d7GybU2VrumRRufMpnz2UImPBAwseI6u8nNKg0U+a/KE/UNkypB/yR9+08LIScQnti9s
         IrAwLtVwJKoqYazTQrBV9S2svwQwQWX4JQok62Zt91LIeb2yl3vuUsSeDUD0V9zooYAE
         E4GVcgY2jtdW9e9+X4r6b00SBv7qgm9PdfHUS2i+BuN8xYvanogNQyJ3Ze9LtBGvRgug
         50/HX0vmNPtGC9MKdYAo0Rc/KnbhccidvRU939ABvsQDrRhrdofc1hRQGF4F0eqeLbV5
         9/Ug==
X-Gm-Message-State: AC+VfDygIP3oDNngXVvKNnI9t43cErP2zYygV7aYrgo+IJXSlyWdrjaV
        L5VEEwpI6wu3SAVxz793IpK6bg==
X-Google-Smtp-Source: ACHHUZ5yK2lt/IMYfyS93awRoHs7nxXWC9mxqAyC9zaEYDSGdeRLwFZz8Pe8r/MHRR7wkuU3mMylDQ==
X-Received: by 2002:a17:907:268a:b0:94f:2020:b5fb with SMTP id bn10-20020a170907268a00b0094f2020b5fbmr5629405ejc.27.1683199608642;
        Thu, 04 May 2023 04:26:48 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:cbf1:e7ef:fb81:e912? ([2a02:810d:15c0:828:cbf1:e7ef:fb81:e912])
        by smtp.gmail.com with ESMTPSA id ml12-20020a170906cc0c00b009659c23e78fsm1113658ejb.215.2023.05.04.04.26.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 04:26:48 -0700 (PDT)
Message-ID: <a7f0b4e6-0594-024a-b416-fe778eee16fe@linaro.org>
Date:   Thu, 4 May 2023 13:26:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 11/18] arm64: dts: qcom: sm8450: Add Qualcomm ramoops
 minidump node
Content-Language: en-US
To:     Mukesh Ojha <quic_mojha@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, corbet@lwn.net,
        keescook@chromium.org, tony.luck@intel.com, gpiccoli@igalia.com,
        catalin.marinas@arm.com, will@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        srinivas.kandagatla@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
References: <1683133352-10046-1-git-send-email-quic_mojha@quicinc.com>
 <1683133352-10046-12-git-send-email-quic_mojha@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1683133352-10046-12-git-send-email-quic_mojha@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 03/05/2023 19:02, Mukesh Ojha wrote:
> This enable dynamic reserve memory for Qualcomm ramoops device,
> Which will used to save ramoops frontend data and this region
> gets dumped on crash via Qualcomm's minidump infrastructure.
> qcom_pstore_minidump is the associated driver for this node.
> 
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 595533a..92d023f 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -614,6 +614,17 @@
>  			reg = <0x0 0xed900000 0x0 0x3b00000>;
>  			no-map;
>  		};
> +
> +		qcom_ramoops_md_region:qcom_ramoops_md {

No underscores in node names. Didn't we talk about this?

Best regards,
Krzysztof

