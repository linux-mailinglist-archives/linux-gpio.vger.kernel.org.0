Return-Path: <linux-gpio+bounces-29811-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6B4CD8971
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 10:32:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCBDF3018D4F
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 09:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2BDD325701;
	Tue, 23 Dec 2025 09:32:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F116E22DFA5;
	Tue, 23 Dec 2025 09:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766482355; cv=none; b=HoI+yw3eZzz/MfDvyG4EuHYz5eXniaLe2CHk+DvjMDJ+QPNehwELKBLd9/mCwDD/1dKMFSpV8UYfRX2ygWkc5wPyd4arviJfIMH5L0YMR1EKLhnWNskHXCvuzyjeSTLe13JH6QlOzxn1+FJjDBbLdtGBxLIfulKHBXxSVoTXcIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766482355; c=relaxed/simple;
	bh=VWjjpO1LK4XCQlL+idU482vlwaxpjBKS1mUogd+WhL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GDHEQP1zsVwt+NgEGIwSPRJLcRVmrbGVQUC0+IRUwT/reVCp6c37OrYs/Zb8R6bgrg+92JF1BbSwCPJM1GPqr5Ki7xF9Tl6PXjnW9IqHL/eGIcdpamW8rdw/aWmi/lksrCb4nbqHvcx4DgDS6C+n3FiLcrtfWSSGeBiTL88KOzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id EA63E341437;
	Tue, 23 Dec 2025 09:32:32 +0000 (UTC)
Date: Tue, 23 Dec 2025 17:32:28 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Linus Walleij <linusw@kernel.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: spacemit: support I/O power domain
 configuration
Message-ID: <20251223093228-GYA1986709@gentoo.org>
References: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-0-5f1090a487c7@linux.spacemit.com>
 <20251223-kx-pinctrl-aib-io-pwr-domain-v1-2-5f1090a487c7@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-2-5f1090a487c7@linux.spacemit.com>

Hi Troy,

On 17:11 Tue 23 Dec     , Troy Mitchell wrote:
> IO domain power control registers are used to configure the operating
> voltage of dual-voltage GPIO banks. By default, these registers are
> configured for 3.3V operation. As a result, even when a GPIO bank is
> externally supplied with 1.8V, the internal logic continues to
> operate in the 3.3V domain, which may lead to functional failures.
> 
> This patch adds support for programming the IO domain power control
> registers, allowing dual-voltage GPIO banks to be explicitly configured
> for 1.8V operation when required.
> 
> Care must be taken when configuring these registers. If a GPIO bank is
> externally supplied with 3.3V while the corresponding IO power domain
> is configured for 1.8V, external current injection (back-powering)
> may occur, potentially causing damage to the GPIO pin.
> 
> Due to these hardware constraints and safety considerations, the IO
> domain power control registers are implemented as secure registers.
> Access to these registers requires unlocking via the AIB Secure Access
> Register (ASAR) in the APBC block before a single read or write
> operation can be performed.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  arch/riscv/boot/dts/spacemit/k1.dtsi  |   4 +-
>  drivers/pinctrl/spacemit/pinctrl-k1.c | 131 +++++++++++++++++++++++++++++++++-
>  2 files changed, 131 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index 7818ca4979b6a7755722919a5958512aa11950ab..23ecb19624f227f3c39de35bf3078379f7a2490e 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
dtsi should go as separated patch, then route to SoC tree

> @@ -565,10 +565,12 @@ i2c8: i2c@d401d800 {
>  
>  		pinctrl: pinctrl@d401e000 {
>  			compatible = "spacemit,k1-pinctrl";
> -			reg = <0x0 0xd401e000 0x0 0x400>;
> +			reg = <0x0 0xd401e000 0x0 0x400>,
> +			      <0x0 0xd401e800 0x0 0x34>;
>  			clocks = <&syscon_apbc CLK_AIB>,
>  				 <&syscon_apbc CLK_AIB_BUS>;
>  			clock-names = "func", "bus";
> +			spacemit,apbc = <&syscon_apbc 0x50>;
>  		};
>  
>  		pwm8: pwm@d4020000 {
> diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
> index 8ca247fb8ba0321c02423f9739130e03277d1053..b3ffb32f88a79ebf6b64e62a7846df60b92799fe 100644
> --- a/drivers/pinctrl/spacemit/pinctrl-k1.c
> +++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
> @@ -7,8 +7,10 @@
>  #include <linux/io.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/regmap.h>
>  #include <linux/seq_file.h>
>  #include <linux/spinlock.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  
> @@ -47,6 +49,25 @@
>  #define PAD_PULLUP		BIT(14)
>  #define PAD_PULL_EN		BIT(15)
>  
> +#define IO_PWR_DOMAIN_GPIO2_Kx  0x0c
> +#define IO_PWR_DOMAIN_MMC_Kx    0x1c
> +
> +#define IO_PWR_DOMAIN_GPIO3_K1  0x10
> +#define IO_PWR_DOMAIN_QSPI_K1   0x20
> +
> +#define IO_PWR_DOMAIN_GPIO1_K3  0x04
> +#define IO_PWR_DOMAIN_GPIO5_K3  0x10
> +#define IO_PWR_DOMAIN_GPIO4_K3  0x20
> +#define IO_PWR_DOMAIN_QSPI_K3   0x2c
> +
> +#define IO_PWR_DOMAIN_V18EN	BIT(2)
> +
> +#define APBC_ASFAR		0x00
> +#define APBC_ASSAR		0x04
> +
> +#define APBC_ASFAR_AKEY		0xbaba
> +#define APBC_ASSAR_AKEY		0xeb10
> +
>  struct spacemit_pin_drv_strength {
>  	u8		val;
>  	u32		mA;
> @@ -78,6 +99,10 @@ struct spacemit_pinctrl {
>  	raw_spinlock_t				lock;
>  
>  	void __iomem				*regs;
> +	void __iomem				*io_pd_reg;
> +
> +	struct regmap				*regmap_apbc;
> +	u32					regmap_apbc_offset;
>  };
>  
>  struct spacemit_pinctrl_data {
> @@ -85,6 +110,7 @@ struct spacemit_pinctrl_data {
>  	const struct spacemit_pin	*data;
>  	u16				npins;
>  	unsigned int			(*pin_to_offset)(unsigned int pin);
> +	unsigned int			(*pin_to_io_pd_offset)(unsigned int pin);
>  	const struct spacemit_pinctrl_dconf	*dconf;
>  };
>  
> @@ -146,6 +172,56 @@ static unsigned int spacemit_k3_pin_to_offset(unsigned int pin)
>  	return offset << 2;
>  }
>  
> +static unsigned int spacemit_k1_pin_to_io_pd_offset(unsigned int pin)
> +{
> +	unsigned int offset = 0;
> +
> +	switch (pin) {
> +	case 47 ... 52:
> +		offset = IO_PWR_DOMAIN_GPIO3_K1;
> +		break;
> +	case 75 ... 80:
> +		offset = IO_PWR_DOMAIN_GPIO2_Kx;
> +		break;
> +	case 98 ... 103:
> +		offset = IO_PWR_DOMAIN_QSPI_K1;
> +		break;
> +	case 104 ... 109:
> +		offset = IO_PWR_DOMAIN_MMC_Kx;
> +		break;
> +	}
> +
> +	return offset;
> +}
> +
> +static unsigned int spacemit_k3_pin_to_io_pd_offset(unsigned int pin)
> +{
> +	unsigned int offset = 0;
> +
> +	switch (pin) {
> +	case 0 ... 20:
> +		offset = IO_PWR_DOMAIN_GPIO1_K3;
> +		break;
> +	case 21 ... 41:
> +		offset = IO_PWR_DOMAIN_GPIO2_Kx;
> +		break;
> +	case 76 ... 98:
> +		offset = IO_PWR_DOMAIN_GPIO4_K3;
> +		break;
> +	case 99 ... 127:
> +		offset = IO_PWR_DOMAIN_GPIO5_K3;
> +		break;
> +	case 132 ... 137:
> +		offset = IO_PWR_DOMAIN_MMC_Kx;
> +		break;
> +	case 138 ... 144:
> +		offset = IO_PWR_DOMAIN_QSPI_K3;
> +		break;
> +	}
> +
> +	return offset;
> +}
> +
>  static inline void __iomem *spacemit_pin_to_reg(struct spacemit_pinctrl *pctrl,
>  						unsigned int pin)
>  {
> @@ -365,6 +441,38 @@ static int spacemit_pctrl_check_power(struct pinctrl_dev *pctldev,
>  	return 0;
>  }
>  
> +static void spacemit_set_io_pwr_domain(struct spacemit_pinctrl *pctrl,
> +				      const struct spacemit_pin *spin,
> +				      const enum spacemit_pin_io_type type)
> +{
> +	u32 offset = pctrl->data->pin_to_io_pd_offset(spin->pin);
> +	u32 val = 0;
> +
> +	/* Other bits are reserved so don't need to save them */
> +	if (type == IO_TYPE_1V8)
> +		val = IO_PWR_DOMAIN_V18EN;
> +
> +	/*
> +	 * IO power domain registers are protected and cannot be accessed
> +	 * directly. Before performing any read or write to the IO power
> +	 * domain registers, an explicit unlock sequence must be issued
> +	 * via the AIB Secure Access Register (ASAR).
> +	 *
> +	 * The unlock sequence allows exactly one subsequent access to the
> +	 * IO power domain registers. After that access completes, the ASAR
> +	 * keys are automatically cleared, and the registers become locked
> +	 * again.
> +	 *
> +	 * This mechanism ensures that IO power domain configuration is
> +	 * performed intentionally, as incorrect voltage settings may
> +	 * result in functional failures or hardware damage.
> +	 */
> +	regmap_write(pctrl->regmap_apbc, pctrl->regmap_apbc_offset + APBC_ASFAR, APBC_ASFAR_AKEY);
> +	regmap_write(pctrl->regmap_apbc, pctrl->regmap_apbc_offset + APBC_ASSAR, APBC_ASSAR_AKEY);
> +
> +	writel_relaxed(val, pctrl->io_pd_reg + offset);
> +}
> +
>  static int spacemit_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
>  					 struct device_node *np,
>  					 struct pinctrl_map **maps,
> @@ -572,7 +680,8 @@ static int spacemit_pinconf_get(struct pinctrl_dev *pctldev,
>  
>  #define ENABLE_DRV_STRENGTH	BIT(1)
>  #define ENABLE_SLEW_RATE	BIT(2)
> -static int spacemit_pinconf_generate_config(const struct spacemit_pin *spin,
> +static int spacemit_pinconf_generate_config(struct spacemit_pinctrl *pctrl,
> +					    const struct spacemit_pin *spin,
>  					    const struct spacemit_pinctrl_dconf *dconf,
>  					    unsigned long *configs,
>  					    unsigned int num_configs,
> @@ -646,6 +755,7 @@ static int spacemit_pinconf_generate_config(const struct spacemit_pin *spin,
>  			default:
>  				return -EINVAL;
>  			}
> +			spacemit_set_io_pwr_domain(pctrl, spin, type);
>  		}
>  
>  		val = spacemit_get_driver_strength(type, dconf, drv_strength);
> @@ -701,7 +811,7 @@ static int spacemit_pinconf_set(struct pinctrl_dev *pctldev,
>  	const struct spacemit_pin *spin = spacemit_get_pin(pctrl, pin);
>  	u32 value;
>  
> -	if (spacemit_pinconf_generate_config(spin, pctrl->data->dconf,
> +	if (spacemit_pinconf_generate_config(pctrl, spin, pctrl->data->dconf,
>  					     configs, num_configs, &value))
>  		return -EINVAL;
>  
> @@ -724,7 +834,7 @@ static int spacemit_pinconf_group_set(struct pinctrl_dev *pctldev,
>  		return -EINVAL;
>  
>  	spin = spacemit_get_pin(pctrl, group->grp.pins[0]);
> -	if (spacemit_pinconf_generate_config(spin, pctrl->data->dconf,
> +	if (spacemit_pinconf_generate_config(pctrl, spin, pctrl->data->dconf,
>  					     configs, num_configs, &value))
>  		return -EINVAL;
>  
> @@ -795,6 +905,7 @@ static const struct pinconf_ops spacemit_pinconf_ops = {
>  
>  static int spacemit_pinctrl_probe(struct platform_device *pdev)
>  {
> +	struct device_node *np = pdev->dev.of_node;
>  	struct device *dev = &pdev->dev;
>  	struct spacemit_pinctrl *pctrl;
>  	struct clk *func_clk, *bus_clk;
> @@ -816,6 +927,18 @@ static int spacemit_pinctrl_probe(struct platform_device *pdev)
>  	if (IS_ERR(pctrl->regs))
>  		return PTR_ERR(pctrl->regs);
>  
> +	pctrl->io_pd_reg = devm_platform_ioremap_resource(pdev, 1);
> +	if (IS_ERR(pctrl->io_pd_reg))
> +		return PTR_ERR(pctrl->io_pd_reg);
> +
> +	pctrl->regmap_apbc =
> +		syscon_regmap_lookup_by_phandle_args(np, "spacemit,apbc", 1,
> +						     &pctrl->regmap_apbc_offset);
Can you simply use syscon_regmap_lookup_by_phandle(), then define 
#define APBC_ASFAR		0x50
#define APBC_ASSAR		0x54

> +
> +	if (IS_ERR(pctrl->regmap_apbc))
> +		return dev_err_probe(dev, PTR_ERR(pctrl->regmap_apbc),
> +				     "failed to get syscon\n");
> +
>  	func_clk = devm_clk_get_enabled(dev, "func");
>  	if (IS_ERR(func_clk))
>  		return dev_err_probe(dev, PTR_ERR(func_clk), "failed to get func clock\n");
> @@ -1118,6 +1241,7 @@ static const struct spacemit_pinctrl_data k1_pinctrl_data = {
>  	.data = k1_pin_data,
>  	.npins = ARRAY_SIZE(k1_pin_desc),
>  	.pin_to_offset = spacemit_k1_pin_to_offset,
> +	.pin_to_io_pd_offset = spacemit_k1_pin_to_io_pd_offset,
>  	.dconf = &k1_drive_conf,
>  };
>  
> @@ -1455,6 +1579,7 @@ static const struct spacemit_pinctrl_data k3_pinctrl_data = {
>  	.data = k3_pin_data,
>  	.npins = ARRAY_SIZE(k3_pin_desc),
>  	.pin_to_offset = spacemit_k3_pin_to_offset,
> +	.pin_to_io_pd_offset = spacemit_k3_pin_to_io_pd_offset,
>  	.dconf = &k3_drive_conf,
>  };
>  
> 
> -- 
> 2.52.0
> 

-- 
Yixun Lan (dlan)

