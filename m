Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 626955EC3DF
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Sep 2022 15:12:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232157AbiI0NMM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Sep 2022 09:12:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232458AbiI0NMG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Sep 2022 09:12:06 -0400
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [IPv6:2001:4b7a:2000:18::167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3810118769A
        for <linux-gpio@vger.kernel.org>; Tue, 27 Sep 2022 06:11:44 -0700 (PDT)
Received: from [192.168.1.101] (95.49.29.188.neoplus.adsl.tpnet.pl [95.49.29.188])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id C9DEE3F33A;
        Tue, 27 Sep 2022 15:11:41 +0200 (CEST)
Message-ID: <6d64de60-90af-5452-642e-8a6247629022@somainline.org>
Date:   Tue, 27 Sep 2022 15:11:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2 06/33] ARM: dts: qcom: msm8974: align TLMM pin
 configuration with DT schema
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220926074415.53100-1-krzysztof.kozlowski@linaro.org>
 <20220926074415.53100-7-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220926074415.53100-7-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 26.09.2022 09:43, Krzysztof Kozlowski wrote:
> DT schema expects TLMM pin configuration nodes to be named with
> '-state' suffix and their optional children with '-pins' suffix.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad
>  .../qcom-msm8974-lge-nexus5-hammerhead.dts    | 30 +++++++++----------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
> index 6daceaa87802..8138f37233aa 100644
> --- a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
> +++ b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
> @@ -573,43 +573,43 @@ bcrmf@1 {
>  };
>  
>  &tlmm {
> -	sdc1_on: sdc1-on {
> -		clk {
> +	sdc1_on: sdc1-on-state {
> +		clk-pins {
>  			pins = "sdc1_clk";
>  			drive-strength = <16>;
>  			bias-disable;
>  		};
>  
> -		cmd-data {
> +		cmd-data-pins {
>  			pins = "sdc1_cmd", "sdc1_data";
>  			drive-strength = <10>;
>  			bias-pull-up;
>  		};
>  	};
>  
> -	sdc2_on: sdc2-on {
> -		clk {
> +	sdc2_on: sdc2-on-state {
> +		clk-pins {
>  			pins = "sdc2_clk";
>  			drive-strength = <6>;
>  			bias-disable;
>  		};
>  
> -		cmd-data {
> +		cmd-data-pins {
>  			pins = "sdc2_cmd", "sdc2_data";
>  			drive-strength = <6>;
>  			bias-pull-up;
>  		};
>  	};
>  
> -	mpu6515_pin: mpu6515 {
> +	mpu6515_pin: mpu6515-state {
>  		pins = "gpio73";
>  		function = "gpio";
>  		bias-disable;
>  		input-enable;
>  	};
>  
> -	touch_pin: touch {
> -		int {
> +	touch_pin: touch-state {
> +		int-pins {
>  			pins = "gpio5";
>  			function = "gpio";
>  
> @@ -618,7 +618,7 @@ int {
>  			input-enable;
>  		};
>  
> -		reset {
> +		reset-pins {
>  			pins = "gpio8";
>  			function = "gpio";
>  
> @@ -627,25 +627,25 @@ reset {
>  		};
>  	};
>  
> -	panel_pin: panel {
> +	panel_pin: panel-state {
>  		pins = "gpio12";
>  		function = "mdp_vsync";
>  		drive-strength = <2>;
>  		bias-disable;
>  	};
>  
> -	bt_pin: bt {
> -		hostwake {
> +	bt_pin: bt-state {
> +		hostwake-pins {
>  			pins = "gpio42";
>  			function = "gpio";
>  		};
>  
> -		devwake {
> +		devwake-pins {
>  			pins = "gpio62";
>  			function = "gpio";
>  		};
>  
> -		shutdown {
> +		shutdown-pins {
>  			pins = "gpio41";
>  			function = "gpio";
>  		};
