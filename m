Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE7475EC3C8
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Sep 2022 15:10:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232552AbiI0NKp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Sep 2022 09:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232515AbiI0NKe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Sep 2022 09:10:34 -0400
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [IPv6:2001:4b7a:2000:18::171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89CFC1822ED;
        Tue, 27 Sep 2022 06:10:14 -0700 (PDT)
Received: from [192.168.1.101] (95.49.29.188.neoplus.adsl.tpnet.pl [95.49.29.188])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 931633F412;
        Tue, 27 Sep 2022 15:10:11 +0200 (CEST)
Message-ID: <028ab5c5-46d3-fc1f-71b8-a2548645386a@somainline.org>
Date:   Tue, 27 Sep 2022 15:10:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2 01/33] arm64: dts: qcom: ipq6018-cp01-c1: correct
 blspi1 pins
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
 <20220926074415.53100-2-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220926074415.53100-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 26.09.2022 09:43, Krzysztof Kozlowski wrote:
> When BLSPI1 (originally SPI0, later renamed in commit f82c48d46852
> ("arm64: dts: qcom: ipq6018: correct QUP peripheral labels")) was added,
> the device node lacked respective pin configuration assignment.   It
> used also blsp0_spi function but that was probably the same mistake as
> naming it SPI0.
> 
> Fixes: 5bf635621245 ("arm64: dts: ipq6018: Add a few device nodes")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad
>  arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
> index 1ba2eca33c7b..afc2dc79767d 100644
> --- a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
> @@ -37,6 +37,8 @@ &blsp1_i2c3 {
>  
>  &blsp1_spi1 {
>  	cs-select = <0>;
> +	pinctrl-0 = <&spi_0_pins>;
> +	pinctrl-names = "default";
>  	status = "okay";
>  
>  	flash@0 {
> @@ -57,7 +59,7 @@ i2c_1_pins: i2c-1-pins {
>  
>  	spi_0_pins: spi-0-pins {
>  		pins = "gpio38", "gpio39", "gpio40", "gpio41";
> -		function = "blsp0_spi";
> +		function = "blsp1_spi";
>  		drive-strength = <8>;
>  		bias-pull-down;
>  	};
