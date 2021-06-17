Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB66C3ABEE2
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jun 2021 00:26:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232258AbhFQW2k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Jun 2021 18:28:40 -0400
Received: from relay06.th.seeweb.it ([5.144.164.167]:46365 "EHLO
        relay06.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232159AbhFQW2j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Jun 2021 18:28:39 -0400
Received: from [192.168.1.101] (83.6.168.10.neoplus.adsl.tpnet.pl [83.6.168.10])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 97CE23F643;
        Fri, 18 Jun 2021 00:26:29 +0200 (CEST)
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: sa8155p-adp: Add base dts file
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org
Cc:     bhupesh.linux@gmail.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, agross@kernel.org,
        Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20210617054548.353293-1-bhupesh.sharma@linaro.org>
 <20210617054548.353293-6-bhupesh.sharma@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <017932d3-ad1d-976c-2be4-f2beab7df1bd@somainline.org>
Date:   Fri, 18 Jun 2021 00:26:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210617054548.353293-6-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 17.06.2021 07:45, Bhupesh Sharma wrote:
> Add base DTS file for SA8155p Automotive Development Platform.
> It enables boot to console, adds tlmm reserved range and ufs flash.
> It also includes pmic file.
>
> SA8155p-adp board is based on sa8155p Qualcomm Snapdragon SoC.
> SA8155p platform is similar to the SM8150, so use this as base
> for now.
>
> Cc: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>

> +
> +&qupv3_id_1 {
> +	status = "okay";
> +};
>
This tiny reference is unsorted,


besides that:


Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>


Konrad

