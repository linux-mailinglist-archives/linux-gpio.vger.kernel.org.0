Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 357FA3A834A
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jun 2021 16:53:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231228AbhFOOzv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Jun 2021 10:55:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230452AbhFOOzt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Jun 2021 10:55:49 -0400
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [IPv6:2001:4b7a:2000:18::166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76B22C061767;
        Tue, 15 Jun 2021 07:53:45 -0700 (PDT)
Received: from [192.168.1.101] (83.6.168.161.neoplus.adsl.tpnet.pl [83.6.168.161])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 2D2733F43E;
        Tue, 15 Jun 2021 16:53:42 +0200 (CEST)
Subject: Re: [PATCH v2 10/10] arm64: dts: qcom: sa8155p-adp: Add base dts file
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org
Cc:     bhupesh.linux@gmail.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>
References: <20210615074543.26700-1-bhupesh.sharma@linaro.org>
 <20210615074543.26700-11-bhupesh.sharma@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <0b012d77-8d61-f852-f455-8b6cceb03ebf@somainline.org>
Date:   Tue, 15 Jun 2021 16:53:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210615074543.26700-11-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,


> +
> +	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
> +
> +	vcc-supply = <&vreg_l10a_2p96>;
> +	vcc-max-microamp = <750000>;
> +	vccq-supply = <&vreg_l5c_1p2>;
> +	vccq-max-microamp = <700000>;
> +	vccq2-supply = <&vreg_s4a_1p8>;
> +	vccq2-max-microamp = <750000>;

You need to add "regulator-allow-set-load;" to the mentioned supplies,

as you're controlling the amperage here.


> +};
> +
> +&ufs_mem_phy {
> +	status = "okay";
> +
> +	vdda-phy-supply = <&vreg_l8c_1p2>;
> +	vdda-max-microamp = <87100>;
> +	vdda-pll-supply = <&vreg_l5a_0p88>;
> +	vdda-pll-max-microamp = <18300>;

Ditto


Konrad
