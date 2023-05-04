Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AAD26F6591
	for <lists+linux-gpio@lfdr.de>; Thu,  4 May 2023 09:14:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbjEDHOI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 May 2023 03:14:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbjEDHOH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 May 2023 03:14:07 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18F3D173B
        for <linux-gpio@vger.kernel.org>; Thu,  4 May 2023 00:14:05 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2a8b082d6feso1560971fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 04 May 2023 00:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683184443; x=1685776443;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fC32ZRL6kv8V/7o8EGUr1mtZobBUgWUVglha3gwf8ss=;
        b=SKg0wIfLaLDnuauS+QNo+ttQkKMyX0p/sZ1KfMllPb9bPgx0sMEFrOosJEwQJqFBdY
         wdWWmFf8C/l/3uLBTHhG+/iyxOn6Do7W+6sFqQt5qDl2E+RCyKhHnZzHacoNRdbVqQ5m
         lQ5ZIcWhbbQL0CTZkKKpjThRy97Kgz/haVJTKFCnvPQ2oEW2IF/OBH94ki02CmcTy9Z9
         k6IoUswj4PAWNobK0Tkc1ASV4hmdtkx5J5nqYreU5HvczJEJYjXSZgAumAI5p92cPpoi
         +nk+3CKDzkgfEXLkcjCpFbFW5VhLYVOpLCMdsxWsaMA2AANRUtrvcHHkQr6gzFjt3X5X
         Jr2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683184443; x=1685776443;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fC32ZRL6kv8V/7o8EGUr1mtZobBUgWUVglha3gwf8ss=;
        b=XlHRRXwOsLyujPXIQGR+pR/HzlXwk08ZLexnYvPZDrKrG/hKtG2W0QVt8MwYJ4Lufr
         DcSKHumxeXUeQ/lRp7SN1abyepeF+hyyWouopAiKkzmMN5tZfh0sFIPRFCtYecfdnLcz
         pK2bEgapuX7/0bnRhds9plBvMN340AkgIEsocDEM6WYOn4qxhgKoutbc65VaFBef3v4B
         HOVHsOaOnNpi3jwF6KVfW27rjRsFipy+FdhXbdTHIo8Qz+Rj3mmF3tz8b0EqW09LOn+x
         Kv6y61v10iI9qtoKjQx0ABcVk54ZNwGdrojzZpZcnA9+3SxrPwl2AdxyBMxJNGg/vNMN
         QcoQ==
X-Gm-Message-State: AC+VfDw60XcUfsSjsjhTbE4X+GldYcFA1N7eOSDrypc4kQXctAYc7mqB
        503AE/d0a3mUURcAb4YGvxj9gQ==
X-Google-Smtp-Source: ACHHUZ68E5CT+tz5TBMWB/yNgy/q68QX2qmngSSqztLupWyrwNdOkkrkNo9hgynnEpklbx+XHjkw6g==
X-Received: by 2002:a2e:9785:0:b0:2ab:d1b:dcb2 with SMTP id y5-20020a2e9785000000b002ab0d1bdcb2mr635844lji.38.1683184443371;
        Thu, 04 May 2023 00:14:03 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id f2-20020ac25082000000b004eed63bc08csm6402214lfm.131.2023.05.04.00.14.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 00:14:02 -0700 (PDT)
Message-ID: <21b500a5-2c4a-e156-61b3-aa0a2f4f5183@linaro.org>
Date:   Thu, 4 May 2023 09:14:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 11/18] arm64: dts: qcom: sm8450: Add Qualcomm ramoops
 minidump node
Content-Language: en-US
To:     Mukesh Ojha <quic_mojha@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, corbet@lwn.net, keescook@chromium.org,
        tony.luck@intel.com, gpiccoli@igalia.com, catalin.marinas@arm.com,
        will@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, srinivas.kandagatla@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
References: <1683133352-10046-1-git-send-email-quic_mojha@quicinc.com>
 <1683133352-10046-12-git-send-email-quic_mojha@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
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



On 3.05.2023 19:02, Mukesh Ojha wrote:
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
Missing space after ':'

node names should not contain underscores

minidump {

or

ramoops {

would probably be better names for this node
> +			alloc-ranges = <0x0 0x00000000 0xffffffff 0xffffffff>;
> +			size = <0x0 0x200000>;
> +			no-map;
> +		};
> +	};
> +
> +	qcom_ramoops_md {
Node names should be generic (e.g. ramdump or something) and should
not contain underscores.

Konrad
> +		compatible = "qcom,sm8450-ramoops-minidump", "qcom,ramoops-minidump";
> +		memory-region = <&qcom_ramoops_md_region>;
>  	};
>  
>  	smp2p-adsp {
