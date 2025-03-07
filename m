Return-Path: <linux-gpio+bounces-17269-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE2EA56C22
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 16:32:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A33C91895163
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 15:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBEE321CC68;
	Fri,  7 Mar 2025 15:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LJFbhPhv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBFD21A427;
	Fri,  7 Mar 2025 15:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741361568; cv=none; b=M2r6H/Z7utttNTQraIuywko8ZI8+d9D2drLhjrPsyIEG7t7AIcAaCfc5P6U8pbvRmwgrb4OWSLQxdHpy9TCBJUVGLZO4HN0iJmtiKPIBzfERBL9gY25c/AaLRaXzvn+kDXVRKOyx1tyURVXu3UjmXtuiFMaVrlb7RLE4UBNLbgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741361568; c=relaxed/simple;
	bh=P6kCAZ5ZpDQWJG0YnkMF36cA4hpLqxXKrIV2JIPCqRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oNci8OFwsgAFhmcMk+Cn8r8cBbTrfgd9HSzfiDlbYI95VKlGjogw0TiZXdnrKvxupXpOZ3VyGrRdo1PJ1SwwOaPirxXxvmaD149KZnVP0eu245OztRdqUzTTrUjulcRXODzYiIEpYpIwvjsDD/B2NGBYGiEwfvoEYSXCtoI80rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LJFbhPhv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3075C4CED1;
	Fri,  7 Mar 2025 15:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741361567;
	bh=P6kCAZ5ZpDQWJG0YnkMF36cA4hpLqxXKrIV2JIPCqRY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LJFbhPhvA5vC2BJKJNUkGZDWg296GKv+7SdaxfN0bywmv+dyBrBgFcN8UkhRJoONa
	 uGT8UHFRApp9aBEoMNIZrVlSP8YBcNdKJ/jReJ4P3oz0yc5hBiAIcU0tYjr9ZXrT6f
	 WNPZNTmOxFmTxoXAafZtS+nvZvEttA9ZYttazhB4pMH6A103riZUdeUBApSloWBbn1
	 36kQeQOKOCy5dYz6k5XVBZDPMxSrPUKZGV/9lFYJboSDvhQQ0yAL3HFOYBJjbOkS0Y
	 QSoUQ+xMmjgOi6oJAsqISnY+aLvvdpsu18IObX/kLCW8oJqW96K4cCuRYy0C7dBLhr
	 F58H/c/jUiT8Q==
Message-ID: <92ecfdc3-3feb-41ec-8cc9-0379e3c951bb@kernel.org>
Date: Fri, 7 Mar 2025 16:32:39 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/14] ASoC: mediatek: mt8196: add platform driver
To: "Darren.Ye" <darren.ye@mediatek.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
References: <20250307124841.23777-1-darren.ye@mediatek.com>
 <20250307124841.23777-12-darren.ye@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250307124841.23777-12-darren.ye@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/03/2025 13:47, Darren.Ye wrote:
> +
> +static int mt8196_afe_runtime_suspend(struct device *dev)
> +{
> +	struct mtk_base_afe *afe = dev_get_drvdata(dev);
> +	unsigned int value = 0;
> +	unsigned int tmp_reg = 0;
> +	int ret = 0, i;
> +
> +	dev_dbg(afe->dev, "%s() ready to stop\n", __func__);

Core already provides this. Drop.

> +
> +	if (!afe->regmap) {
> +		dev_info(afe->dev, "%s() skip regmap\n", __func__);
> +		goto skip_regmap;
> +	}
> +
> +	/* Add to be off for free run*/
> +	/* disable AFE */
> +	regmap_update_bits(afe->regmap, AUDIO_ENGEN_CON0, 0x1, 0x0);
> +
> +	ret = regmap_read_poll_timeout(afe->regmap,
> +				       AUDIO_ENGEN_CON0_MON,
> +				       value,
> +				       (value & AUDIO_ENGEN_MON_SFT) == 0,
> +				       20,
> +				       1 * 1000 * 1000);
> +	dev_dbg(afe->dev, "%s() read_poll ret %d\n", __func__, ret);
> +	if (ret)
> +		dev_info(afe->dev, "%s(), ret %d\n", __func__, ret);
> +
> +	/* make sure all irq status are cleared */
> +	for (i = 0; i < MT8196_IRQ_NUM; ++i) {
> +		regmap_read(afe->regmap, irq_data[i].irq_clr_reg, &tmp_reg);
> +		regmap_update_bits(afe->regmap, irq_data[i].irq_clr_reg,
> +				   AFE_IRQ_CLR_CFG_MASK_SFT | AFE_IRQ_MISS_FLAG_CLR_CFG_MASK_SFT,
> +				   tmp_reg ^ (AFE_IRQ_CLR_CFG_MASK_SFT |
> +				   AFE_IRQ_MISS_FLAG_CLR_CFG_MASK_SFT));
> +	}
> +
> +	/* reset sgen */
> +	regmap_write(afe->regmap, AFE_SINEGEN_CON0, 0x0);
> +	regmap_update_bits(afe->regmap, AFE_SINEGEN_CON1,
> +			   SINE_DOMAIN_MASK_SFT,
> +			   0x0 << SINE_DOMAIN_SFT);
> +	regmap_update_bits(afe->regmap, AFE_SINEGEN_CON1,
> +			   SINE_MODE_MASK_SFT,
> +			   0x0 << SINE_MODE_SFT);
> +	regmap_update_bits(afe->regmap, AFE_SINEGEN_CON1,
> +			   INNER_LOOP_BACKI_SEL_MASK_SFT,
> +			   0x0 << INNER_LOOP_BACKI_SEL_SFT);
> +	regmap_update_bits(afe->regmap, AFE_SINEGEN_CON1,
> +			   INNER_LOOP_BACK_MODE_MASK_SFT,
> +			   0xff << INNER_LOOP_BACK_MODE_SFT);
> +
> +	regmap_write(afe->regmap, AUDIO_TOP_CON4, 0x3fff);
> +
> +	/* reset audio 26M request */
> +	regmap_update_bits(afe->regmap,
> +			   AFE_SPM_CONTROL_REQ, 0x1, 0x0);
> +
> +	/* cache only */
> +	regcache_cache_only(afe->regmap, true);
> +	regcache_mark_dirty(afe->regmap);
> +
> +skip_regmap:
> +	mt8196_afe_disable_clock(afe);
> +	return 0;
> +}
> +
> +static int mt8196_afe_runtime_resume(struct device *dev)
> +{
> +	struct mtk_base_afe *afe = dev_get_drvdata(dev);
> +	int ret = 0;
> +
> +	ret = mt8196_afe_enable_clock(afe);
> +	dev_dbg(afe->dev, "%s(), enable_clock ret %d\n", __func__, ret);

So you are debugging every call. I think you do not trust your code, right?

> +
> +	if (ret)
> +		return ret;
> +
> +	if (!afe->regmap) {
> +		dev_info(afe->dev, "%s() skip regmap\n", __func__);

Why dev_info? How is this condition even possible?


> +		goto skip_regmap;
> +	}
> +	regcache_cache_only(afe->regmap, false);
> +	regcache_sync(afe->regmap);
> +
> +	/* set audio 26M request */
> +	regmap_update_bits(afe->regmap, AFE_SPM_CONTROL_REQ, 0x1, 0x1);
> +
> +	/* IPM2.0: Clear AUDIO_TOP_CON4 for enabling AP side module clk */
> +	regmap_write(afe->regmap, AUDIO_TOP_CON4, 0x0);
> +
> +	/* Add to be on for free run */
> +	regmap_write(afe->regmap, AUDIO_TOP_CON0, 0x0);
> +	regmap_write(afe->regmap, AUDIO_TOP_CON1, 0x0);
> +	regmap_write(afe->regmap, AUDIO_TOP_CON2, 0x0);
> +
> +	/* Can't set AUDIO_TOP_CON3 to be 0x0, it will hang in FPGA env */
> +	regmap_write(afe->regmap, AUDIO_TOP_CON3, 0x0);
> +
> +	regmap_update_bits(afe->regmap, AFE_CBIP_CFG0, 0x1, 0x1);
> +
> +	/* force cpu use 8_24 format when writing 32bit data */
> +	regmap_update_bits(afe->regmap, AFE_MEMIF_CON0,
> +			   CPU_HD_ALIGN_MASK_SFT, 0 << CPU_HD_ALIGN_SFT);
> +
> +	/* enable AFE */
> +	regmap_update_bits(afe->regmap, AUDIO_ENGEN_CON0, 0x1, 0x1);
> +
> +skip_regmap:
> +	return 0;


...

> +
> +typedef int (*dai_register_cb)(struct mtk_base_afe *);
> +static const dai_register_cb dai_register_cbs[] = {
> +	mt8196_dai_adda_register,
> +	mt8196_dai_i2s_register,
> +	mt8196_dai_tdm_register,
> +	mt8196_dai_memif_register,
> +};
> +
> +static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
> +{
> +	int ret, i;
> +	unsigned int tmp_reg = 0;
> +	int irq_id;
> +	struct mtk_base_afe *afe;
> +	struct mt8196_afe_private *afe_priv;
> +	struct resource *res;
> +	struct device *dev;
> +
> +	pr_info("+%s()\n", __func__);

No, drop.

> +
> +	ret = of_reserved_mem_device_init(&pdev->dev);
> +	if (ret)
> +		dev_dbg(&pdev->dev, "failed to assign memory region: %d\n", ret);
> +
> +	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(34));
> +	if (ret)
> +		return ret;
> +
> +	afe = devm_kzalloc(&pdev->dev, sizeof(*afe), GFP_KERNEL);
> +	if (!afe)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, afe);
> +
> +	afe->platform_priv = devm_kzalloc(&pdev->dev, sizeof(*afe_priv),
> +					  GFP_KERNEL);
> +	if (!afe->platform_priv)
> +		return -ENOMEM;
> +
> +	afe_priv = afe->platform_priv;
> +
> +	afe->dev = &pdev->dev;
> +	dev = afe->dev;
> +
> +	/* init audio related clock */
> +	ret = mt8196_init_clock(afe);
> +	if (ret) {
> +		dev_info(dev, "init clock error: %d\n", ret);

How are you handling deferred probe? Why aren't you using dev_err_probe?

But more important - why do you keep printing errors multiple times,
including ENOMEM?

This is really poor coding style.

> +		return ret;
> +	}
> +
> +	pm_runtime_enable(&pdev->dev);
> +	if (!pm_runtime_enabled(&pdev->dev))
> +		goto err_pm_disable;
> +
> +	/* Audio device is part of genpd.
> +	 * Set audio as syscore device to prevent
> +	 * genpd automatically power off audio
> +	 * device when suspend
> +	 */
> +	dev_pm_syscore_device(&pdev->dev, true);
> +
> +	/* regmap init */
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +
> +	afe->base_addr = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(afe->base_addr))
> +		return PTR_ERR(afe->base_addr);
> +
> +	/* enable clock for regcache get default value from hw */
> +	pm_runtime_get_sync(&pdev->dev);
> +
> +	afe->regmap = devm_regmap_init_mmio(&pdev->dev, afe->base_addr,
> +					    &mt8196_afe_regmap_config);
> +	if (IS_ERR(afe->regmap))
> +		return PTR_ERR(afe->regmap);
> +
> +	/* IPM2.0 clock flow, need debug */
> +
> +	regmap_read(afe->regmap, AFE_IRQ_MCU_EN, &tmp_reg);
> +	regmap_write(afe->regmap, AFE_IRQ_MCU_EN, 0xffffffff);
> +	regmap_read(afe->regmap, AFE_IRQ_MCU_EN, &tmp_reg);
> +	/* IPM2.0 clock flow, need debug */
> +
> +	pm_runtime_put_sync(&pdev->dev);
> +
> +	regcache_cache_only(afe->regmap, true);
> +	regcache_mark_dirty(afe->regmap);
> +
> +	/* init gpio */
> +	ret = mt8196_afe_gpio_init(afe);
> +	if (ret)
> +		dev_info(dev, "init gpio error\n");

Do not print errors twice.

> +
> +	/* init memif */
> +	/* IPM2.0 no need banding */
> +	afe->memif_32bit_supported = 1;
> +	afe->memif_size = MT8196_MEMIF_NUM;
> +	afe->memif = devm_kcalloc(dev, afe->memif_size, sizeof(*afe->memif),
> +				  GFP_KERNEL);
> +
> +	if (!afe->memif)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < afe->memif_size; i++) {
> +		afe->memif[i].data = &memif_data[i];
> +		afe->memif[i].irq_usage = memif_irq_usage[i];
> +		afe->memif[i].const_irq = 1;
> +	}
> +
> +	mutex_init(&afe->irq_alloc_lock);       /* needed when dynamic irq */
> +
> +	/* init irq */
> +	afe->irqs_size = MT8196_IRQ_NUM;
> +	afe->irqs = devm_kcalloc(dev, afe->irqs_size, sizeof(*afe->irqs),
> +				 GFP_KERNEL);
> +

Drop blank line

> +	if (!afe->irqs)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < afe->irqs_size; i++)
> +		afe->irqs[i].irq_data = &irq_data[i];
> +
> +	/* request irq */
> +	irq_id = platform_get_irq(pdev, 0);
> +	if (irq_id <= 0) {

Please read documentation of platform_get_irq().

> +		dev_info(dev, "%pOFn no irq found\n", dev->of_node);

Why dev_info?

> +		return irq_id < 0 ? irq_id : -ENXIO;
> +	}
> +	ret = devm_request_irq(dev, irq_id, mt8196_afe_irq_handler,
> +			       IRQF_TRIGGER_NONE,
> +			       "Afe_ISR_Handle", (void *)afe);
> +	if (ret) {
> +		dev_info(dev, "could not request_irq for Afe_ISR_Handle\n");
> +		return ret;
> +	}
> +	ret = enable_irq_wake(irq_id);
> +	if (ret < 0)
> +		dev_info(dev, "enable_irq_wake %d err: %d\n", irq_id, ret);
> +
> +	/* init sub_dais */
> +	INIT_LIST_HEAD(&afe->sub_dais);
> +
> +	for (i = 0; i < ARRAY_SIZE(dai_register_cbs); i++) {
> +		ret = dai_register_cbs[i](afe);
> +		if (ret) {
> +			dev_info(afe->dev, "dai register i %d fail, ret %d\n",
> +				 i, ret);
> +			goto err_pm_disable;
> +		}
> +	}
> +
> +	/* init dai_driver and component_driver */
> +	ret = mtk_afe_combine_sub_dai(afe);
> +	if (ret) {
> +		dev_info(afe->dev, "mtk_afe_combine_sub_dai fail, ret %d\n",
> +			 ret);
> +		goto err_pm_disable;
> +	}
> +
> +	/* others */
> +	afe->mtk_afe_hardware = &mt8196_afe_hardware;
> +	afe->memif_fs = mt8196_memif_fs;
> +	afe->irq_fs = mt8196_irq_fs;
> +	afe->get_dai_fs = mt8196_get_dai_fs;
> +	afe->get_memif_pbuf_size = mt8196_get_memif_pbuf_size;
> +
> +	afe->runtime_resume = mt8196_afe_runtime_resume;
> +	afe->runtime_suspend = mt8196_afe_runtime_suspend;
> +
> +	afe->request_dram_resource = mt8196_afe_dram_request;
> +	afe->release_dram_resource = mt8196_afe_dram_release;
> +
> +	/* register component */
> +	ret = devm_snd_soc_register_component(&pdev->dev,
> +					      &mt8196_afe_component,
> +					      afe->dai_drivers,
> +					      afe->num_dai_drivers);
> +	if (ret) {
> +		dev_info(dev, "afe component err: %d\n", ret);

Why not dev_err? You have this unusual pattern all over your code.

> +		goto err_pm_disable;
> +	}
> +	return 0;
> +
> +err_pm_disable:
> +	pm_runtime_disable(&pdev->dev);
> +	return ret;
> +}



Best regards,
Krzysztof

