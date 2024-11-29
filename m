Return-Path: <linux-gpio+bounces-13349-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C099DC05D
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Nov 2024 09:18:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9678C1636AA
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Nov 2024 08:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7089715A87C;
	Fri, 29 Nov 2024 08:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G+wqLbTS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152F812B93;
	Fri, 29 Nov 2024 08:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732868312; cv=none; b=IW0KFnT/TBZbodV+ER56ClkqmtqSyugvOEt8CEMDmeITRpVlyT6tSZHXgEjAG4I2mVBMTtoqewozzm2zEcVGhRtbOk0sc9j6KEiOJ9aWDSY2iQt/wmffziY6NqBBXqHOVjcKugceADuCO/YpA+Rnbv2RxkqFlw+OqsNJYbN8QsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732868312; c=relaxed/simple;
	bh=xMkz6fERXZNiSubbZRI0VHrYzPilrzXZT5lEy2tOasE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BUjNjnsTPuQTPtLxFIEw6ziZiB8633exRyqnbf19E/7nRpROLTNvm5v4hALFqQ2nmVMsNchnPI9miZ+Ga4O1vqWZ/luGaYA6fW84+aVPSZCGBBWoL+orNwlKbCaXU06rM02xppZP89YuCbkaDytJhgzyWf18ubAyWkhioiPO2WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G+wqLbTS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2CB9C4CECF;
	Fri, 29 Nov 2024 08:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732868311;
	bh=xMkz6fERXZNiSubbZRI0VHrYzPilrzXZT5lEy2tOasE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=G+wqLbTSN94HvN9PGn5apNt+U/YqWXKbg0ykmuhdigeAISMBgUtyaJqwi4Sw9kKu/
	 FWCbqtSUkEdqMpt9AGIcUa+WtaOMukVDvkT46bDbm6Eya0JGlPLm7UefSa5cmQ037x
	 JhcZ49CrvixhMLHiOillSF8xVYcaUER0AuV2UyuCnjNY50SykAXOtSl9ZZzUr7fuOr
	 nPzM7rcS8BZ+KHysU9CXeZ6xgcv/6tXmjMhVS38l5UzjOyUwo+6nnWYSTpK1+vYYae
	 ZE7ZPuoLbFKOC25IhGQiuE7TBXNtgmn1fpb3uEHfIGhqChJuqRoVeuxyXDRaMuqRkt
	 I4ZK18cY7Afog==
Message-ID: <b310587f-c6c3-41dd-83bf-6affbcc65730@kernel.org>
Date: Fri, 29 Nov 2024 09:18:21 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] phy: qcom: qmp-usbc: Add DP phy mode support on
 QCS615
To: Xiangxu Yin <quic_xiangxuy@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, quic_lliu6@quicinc.com, quic_fangez@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-gpio@vger.kernel.org
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-3-09a4338d93ef@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241129-add-displayport-support-for-qcs615-platform-v1-3-09a4338d93ef@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/11/2024 08:57, Xiangxu Yin wrote:
> Extended DP support for QCS615 USB or DP phy. Differentiated between
> USBC and DP PHY using the match table’s type, dynamically generating
> different types of cfg and layout attributes during initialization based
> on this type. Static variables are stored in cfg, while parsed values
> are organized into the layout structure.
> 
> Signed-off-by: Xiangxu Yin <quic_xiangxuy@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h |    1 +
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c   | 1453 ++++++++++++++++++++++++----
>  2 files changed, 1254 insertions(+), 200 deletions(-)



...

> +	/* program default setting first */
> +	writel(0x2A, tx + QSERDES_V3_TX_TX_DRV_LVL);
> +	writel(0x20, tx + QSERDES_V3_TX_TX_EMP_POST1_LVL);
> +	writel(0x2A, tx2 + QSERDES_V3_TX_TX_DRV_LVL);
> +	writel(0x20, tx2 + QSERDES_V3_TX_TX_EMP_POST1_LVL);
> +
> +	writel(voltage_swing_cfg, tx + QSERDES_V3_TX_TX_DRV_LVL);
> +	writel(pre_emphasis_cfg, tx + QSERDES_V3_TX_TX_EMP_POST1_LVL);
> +	writel(voltage_swing_cfg, tx2 + QSERDES_V3_TX_TX_DRV_LVL);
> +	writel(pre_emphasis_cfg, tx2 + QSERDES_V3_TX_TX_EMP_POST1_LVL);
> +
> +	return 0;
> +}
> +
> +static int qcs615_qmp_configure_dp_phy(struct qmp_usbc *qmp)
> +{
> +	struct qmp_phy_dp_layout *layout = to_dp_layout(qmp);
> +	u32 status;
> +
> +	writel(0x01, layout->dp_phy + QSERDES_DP_PHY_CFG);
> +	writel(0x05, layout->dp_phy + QSERDES_DP_PHY_CFG);
> +	writel(0x01, layout->dp_phy + QSERDES_DP_PHY_CFG);
> +	writel(0x09, layout->dp_phy + QSERDES_DP_PHY_CFG);
> +
> +	writel(0x20, layout->dp_serdes + QSERDES_COM_RESETSM_CNTRL);
> +
> +	// C_READY

Use Linux coding style.

Anyway, drop all useless comments. Say something useful or don't say
anything.

> +	if (readl_poll_timeout(layout->dp_serdes + QSERDES_COM_C_READY_STATUS,
> +			status,
> +			((status & BIT(0)) > 0),
> +			500,
> +			10000)) {
> +		dev_err(qmp->dev, "C_READY not ready\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	// FREQ_DONE
> +	if (readl_poll_timeout(layout->dp_serdes + QSERDES_COM_CMN_STATUS,
> +			status,
> +			((status & BIT(0)) > 0),
> +			500,
> +			10000)){
> +		dev_err(qmp->dev, "FREQ_DONE not ready\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	// PLL_LOCKED
> +	if (readl_poll_timeout(layout->dp_serdes + QSERDES_COM_CMN_STATUS,
> +			status,
> +			((status & BIT(1)) > 0),
> +			500,
> +			10000)){
> +		dev_err(qmp->dev, "PLL_LOCKED not ready\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	writel(0x19, layout->dp_phy + QSERDES_DP_PHY_CFG);
> +	udelay(10);
> +
> +	// TSYNC_DONE
> +	if (readl_poll_timeout(layout->dp_phy + QSERDES_V3_DP_PHY_STATUS,
> +			status,
> +			((status & BIT(0)) > 0),
> +			500,
> +			10000)){
> +		dev_err(qmp->dev, "TSYNC_DONE not ready\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	// PHY_READY
> +	if (readl_poll_timeout(layout->dp_phy + QSERDES_V3_DP_PHY_STATUS,
> +			status,
> +			((status & BIT(1)) > 0),
> +			500,
> +			10000)){
> +		dev_err(qmp->dev, "PHY_READY not ready\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	writel(0x3f, layout->dp_tx + QSERDES_V3_TX_TRANSCEIVER_BIAS_EN);
> +	writel(0x10, layout->dp_tx + QSERDES_V3_TX_HIGHZ_DRVR_EN);
> +	writel(0x0a, layout->dp_tx + QSERDES_V3_TX_TX_POL_INV);
> +	writel(0x3f, layout->dp_tx2 + QSERDES_V3_TX_TRANSCEIVER_BIAS_EN);
> +	writel(0x10, layout->dp_tx2 + QSERDES_V3_TX_HIGHZ_DRVR_EN);
> +	writel(0x0a, layout->dp_tx2 + QSERDES_V3_TX_TX_POL_INV);
> +
> +	writel(0x18, layout->dp_phy + QSERDES_DP_PHY_CFG);
> +	writel(0x19, layout->dp_phy + QSERDES_DP_PHY_CFG);
> +
> +	if (readl_poll_timeout(layout->dp_phy + QSERDES_V3_DP_PHY_STATUS,
> +			status,
> +			((status & BIT(1)) > 0),
> +			500,
> +			10000)){
> +		dev_err(qmp->dev, "PHY_READY not ready\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	return 0;
> +}
> +
> +static int qcs615_qmp_calibrate_dp_phy(struct qmp_usbc *qmp)
> +{
> +	static const u8 cfg1_settings[] = {0x13, 0x23, 0x1d};
> +	struct qmp_phy_dp_layout *layout = to_dp_layout(qmp);
> +	u8 val;
> +
> +	layout->dp_aux_cfg++;
> +	layout->dp_aux_cfg %= ARRAY_SIZE(cfg1_settings);
> +	val = cfg1_settings[layout->dp_aux_cfg];
> +
> +	writel(val, layout->dp_phy + QSERDES_DP_PHY_AUX_CFG1);
> +
> +	qmp_usbc_check_dp_phy(qmp, "pos_calibrate");
> +
> +	return 0;
> +}
> +
> +static int qmp_usbc_com_init(struct phy *phy)
>  {
>  	struct qmp_usbc *qmp = phy_get_drvdata(phy);
> -	const struct qmp_phy_cfg *cfg = qmp->cfg;
> -	void __iomem *pcs = qmp->pcs;
> +	int num_vregs;
>  	u32 val = 0;
>  	int ret;
> +	unsigned int reg_pwr_dn;
>  
> -	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
> +	if (qmp->type == QMP_PHY_USBC_USB) {


Sorry, all this code is unreviewable. Organize your changes in logical,
reviewable chunks.

> +		struct qmp_phy_usb_cfg *cfg = to_usb_cfg(qmp);
> +
> +		num_vregs = cfg->num_vregs;
> +		reg_pwr_dn = cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL];
> +	} else {

...

> +		.compatible = "qcom,qcs615-qmp-dp-phy",
> +		.data =  &(struct dev_cfg) {
> +			.type = QMP_PHY_USBC_DP,
> +			.cfg = &qcs615_dpphy_cfg,
> +		},
>  	}, {
>  		.compatible = "qcom,sdm660-qmp-usb3-phy",
> -		.data = &sdm660_usb3phy_cfg,
> +		.data =  &(struct dev_cfg) {
> +			.type = QMP_PHY_USBC_USB,
> +			.cfg = &sdm660_usb3phy_cfg,
> +		},
>  	}, {
>  		.compatible = "qcom,sm6115-qmp-usb3-phy",
> -		.data = &qcm2290_usb3phy_cfg,
> +		.data =  &(struct dev_cfg) {
> +			.type = QMP_PHY_USBC_USB,
> +			.cfg = &qcm2290_usb3phy_cfg,
> +		},
>  	},
>  	{ },
>  };
> +


You make some random changes all over this file. No, clean it up.

>  MODULE_DEVICE_TABLE(of, qmp_usbc_of_match_table);
>  
>  static struct platform_driver qmp_usbc_driver = {
> 


Best regards,
Krzysztof

