Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A19C839E02F
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jun 2021 17:22:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbhFGPY3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Jun 2021 11:24:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:60590 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230212AbhFGPY2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 7 Jun 2021 11:24:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A693C60C3D;
        Mon,  7 Jun 2021 15:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623079357;
        bh=AkvIZcOQR2MjwlCMTjuU8Ke8Ur/AqM0yyXCdXSHEmT0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=r4trKSgMEv1ujYT26qffTcHnjCB78vQbzvPmedPzR04Wif7Dvy9GUxCHND6d0Ufcy
         vjX9kz8BjVDrRZoJpAQd3zXMmz7jLo+nwZ+UZ9W5+PsaCpxD1qsGMTM3AuC3blgENQ
         Bb/hga9U+05XmSNQa2ucPjtEOZUJH5gXGibW3MOTEBHcU4hBidQRTHISicPnyRkVSf
         q2fLCRl8ZIl7GCRbr9bzNfOawa9Y6rldJ4AsSxLrcz/mzMvEq34RMMaMvdb2wAgNK1
         T41iF6yM6/pSg9aLJs7HU7qNZ+6ZPJm6Gx/vVrFb6o1V2MxPkPcSNxMKybKLY0/wep
         9jFkL3bBBxWqQ==
Date:   Mon, 7 Jun 2021 20:52:33 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bhupesh.linux@gmail.com
Subject: Re: [PATCH 8/8] arm64: dts: qcom: sa8155p-adp: Add base dts file
Message-ID: <YL45uRr6+Q3jvPrO@vkoul-mobl>
References: <20210607113840.15435-1-bhupesh.sharma@linaro.org>
 <20210607113840.15435-9-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210607113840.15435-9-bhupesh.sharma@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 07-06-21, 17:08, Bhupesh Sharma wrote:
> Add base DTS file for sa8155p-adp and enable boot to console,
> tlmm reserved range and also include pmic file(s).

I see ufs added too, pls mention that as well

 --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -71,6 +71,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-xiaomi-beryllium.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-hdk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-mtp.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sa8155p-adp.dtb

I think this should go before sdm..


> +		vdd_usb_hs_core:
> +		vdda_pll_hv_cc_ebi01:
> +		vdda_pll_hv_cc_ebi23:
> +		vdda_ufs_2ln_core:
> +		vdda_ufs_2ln_core:
> +		vdda_usb_ss_core:
> +		vdda_usb_ss_dp_core_1:
> +		vdda_usb_ss_dp_core_2:
> +		vdda_sp_sensor:
> +		vdda_qlink_lv:
> +		vdda_qlink_lv_ck:
> +		vdda_qrefs_0p875_5:

I didnt find these labels very useful, so maybe remove?
It helped me to understand that a regulator is vreg_l5a_0p88 as it
implies I am using l5a with 0p88V :)

> +		vreg_l5a_0p88: ldo5 {
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <880000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;

Pls do add regulator-name property, it helps in understanding which ldo
in logs/debugfs, otherwise ldo5 will comes for both pmics

-- 
~Vinod
