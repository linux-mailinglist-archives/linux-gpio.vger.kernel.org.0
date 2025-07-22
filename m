Return-Path: <linux-gpio+bounces-23619-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 72017B0D7B5
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 13:07:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64B3F3A8BF7
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 11:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76D082E3AE4;
	Tue, 22 Jul 2025 11:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eI6CL/zW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EADE2D77EF;
	Tue, 22 Jul 2025 11:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753182391; cv=none; b=a+4uZcH11cINDNxzGzhWkKUeL/wD+kWQXzTXV5AxPJh52tMa0ulaRGcExeItLQsJNuJDO71Dw0Qs3xGpBWDtCkUD0KPUsRgyvBM35fRWKHY7ZPdzD29cHDj8OhGaKqz9iumGVh2mQY1qC4dTAFaSUbZCNnCmvTyyLplEGpfTHyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753182391; c=relaxed/simple;
	bh=WmTyzbLH4oLKJgpVVgk7hwxo8f7Kv2pNKzivxS+yqXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fgtXql4hTl2oEy/mmtqWID300LKzGuwf44G4pPOx4E4NRMBMXoD3XLn4jeXTYQtKqFjWqM8nNd/BW8TIeHUpqZ5Zxe8MCLOE12bFKzydy/zUaW0Xmi2lTtiw1XAI7WVwDm18c3BLslBJwgByVPwrWyr2fNjVEfevcn4kLp2dmbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eI6CL/zW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70AC8C4CEF4;
	Tue, 22 Jul 2025 11:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753182390;
	bh=WmTyzbLH4oLKJgpVVgk7hwxo8f7Kv2pNKzivxS+yqXs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eI6CL/zW2RxWAh0gdUpOCkIIZ2CjTyOMwXT6Kw0khI+yLqpmGmxphPQRrXePcJ+wN
	 BAeP+sRmRe/0UhT/lOswVwyEWeWyHgcSCNI7JBlPuP7ZFH+uLcE6KaGUhCrOB9VWBx
	 2TAe6VRpAjIa2trToznqyJ2bsGx0nCZjgdG15Jo7tV0wX++5kX9W+/a0+2m2YM4e4J
	 ajA7v50mvLbelDh4reRr1XOmnITRN7elYcCbInXs49jhdR606/XlhkHFMpbN/R1PrJ
	 JgHJi3O4XyNbU8UNPimcwpu/e5C+KyeyEPmQpZXRKh1DxP5D0VD62IoGmIFfQxNG0P
	 1/BN7KiExH75w==
Message-ID: <a006f099-578f-45aa-b165-64e28b8f930e@kernel.org>
Date: Tue, 22 Jul 2025 13:06:24 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] ASoC: codecs: wsa883x: Handle shared reset GPIO
 for WSA883x speakers
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, quic_pkumpatl@quicinc.com,
 kernel@oss.qualcomm.com
References: <20250718104628.3732645-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250718104628.3732645-3-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250721-hairy-aardwolf-of-enterprise-bbc99f@kuoka>
 <d614d8e3-963d-4d34-9b15-1544c7a22cf0@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <d614d8e3-963d-4d34-9b15-1544c7a22cf0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/07/2025 12:56, Mohammad Rafi Shaik wrote:
> 
> 
> On 7/21/2025 1:53 PM, Krzysztof Kozlowski wrote:
>> On Fri, Jul 18, 2025 at 04:16:28PM +0530, Mohammad Rafi Shaik wrote:
>>> On some Qualcomm platforms such as QCS6490-RB3Gen2, the multiple
>>> WSA8830/WSA8835 speakers share a common reset (shutdown) GPIO.
>>> To handle such cases, use the reset controller framework along
>>> with the "reset-gpio" driver.
>>>
>>> Register devm action to safely disable the regulator on device removal
>>> to prevents a potential release warning from _regulator_put().
>>
>> It is not possible to remove the device - suppress bind attrs. How did
>> you trigger that?
>>
> Ack,
> 
> I encountered the warning as regulator was being released unexpectedly,
> triggering _regulator_put() warnings. While the device itself isn't 
> removed, Registering the devm action ensures safe cleanup without 
> triggering warnings.

Logs are cut - you do not see the most important part, who puts the
regulator?

How unregistering regulator solves the incomplete get/put paths? It
feels like you are hiding real problem instead of fixing it.

> 
> Please check the below logs.
> 
> I could use some suggestions for this issue. please help with some 
> suggestions how i can approve this design.
> 
> Thanks,
> Rafi.


...

> [   10.679294][   T90] ------------[ cut here ]------------
> [   10.684772][   T90] WARNING: CPU: 1 PID: 90 at 
> /drivers/regulator/core.c:2450 _regulator_put+0x50/0x60
> [   10.694344][   T90] Modules linked in: snd_soc_hdmi_codec 
> phy_qcom_edp venus_dec venus_enc videobuf2_dma_contig rpmsg_ctrl 
> qrtr_smd fastrpc rpmsg_char videobuf2_memops qcom_pd_mapper nb7vpq904m 
> msm lontium_lt9611uxc ucsi_glink typec_ucsi pmic_glink_altmode 
> qcom_battmgr aux_hpd_bridge ath11k_ahb ath11k hci_uart rtc_pm8xxx btqca 
> coresight_stm bluetooth qcom_pon stm_core venus_core pwrseq_qcom_wcn 
> drm_exec mac80211 ocmem v4l2_mem2mem gpu_sched videobuf2_v4l2 videodev 
> nvmem_qcom_spmi_sdam qcom_spmi_adc_tm5 snd_soc_sc8280xp 
> drm_display_helper qcom_vadc_common snd_soc_qcom_sdw coresight_tmc 
> snd_soc_qcom_common videobuf2_common qcom_stats coresight_etm4x 
> qcom_q6v5_pas phy_qcom_qmp_combo usb_f_qdss mc drm_dp_aux_bus 
> ecdh_generic qcom_pil_info qcom_q6v5 ecc coresight_replicator aux_bridge 
> coresight_csr qcom_sysmon coresight_funnel pwrseq_core gpi typec 
> i2c_qcom_geni qcom_common coresight icc_bwmon llcc_qcom qcom_glink_smem 
> qcrypto pinctrl_sc7280_lpass_lpi mdt_loader snd_soc_lpass_wsa_macro 
> sha256_generic pinctrl_lpass_lpi
> [   10.694524][   T90]  snd_soc_lpass_va_macro display_connector 
> snd_soc_lpass_macro_common authenc drm_kms_helper libdes qrtr libarc4 
> icc_osm_l3 qcom_rng pmic_glink cfg80211 rfkill drm fuse ipv6
> [   10.804083][   T90] CPU: 1 UID: 0 PID: 90 Comm: kworker/u32:4 Not 
> tainted 6.14.0 #1
> [   10.811959][   T90] Hardware name: Qualcomm Technologies, Inc. 
> Robotics RB3gen2 (DT)
> [   10.819920][   T90] Workqueue: events_unbound deferred_probe_work_func
> [   10.826643][   T90] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT 
> -SSBS BTYPE=--)
> [   10.834510][   T90] pc : _regulator_put+0x50/0x60
> [   10.839362][   T90] lr : regulator_put+0x30/0x48
> [   10.844118][   T90] sp : ffff8000809e3670
> [   10.848244][   T90] x29: ffff8000809e3670 x28: 0000000000000000 x27: 
> ffff70941a04a080
> [   10.856300][   T90] x26: 0000000000000000 x25: ffffbfa860a9bee8 x24: 
> ffffbfa860e79cb0
> [   10.864354][   T90] x23: ffff709406e62640 x22: ffff709418668808 x21: 
> ffff8000809e3710
> [   10.872409][   T90] x20: ffff709415e81840 x19: ffffbfa86119b680 x18: 
> 00000000ffffffff
> [   10.880462][   T90] x17: ffffbfa86013d058 x16: ffffbfa8601cbac4 x15: 
> ffff709419a70b48
> [   10.888517][   T90] x14: 0000000000000000 x13: ffff709400032b10 x12: 
> 0000000000000000
> [   10.896573][   T90] x11: 0000000000000000 x10: ffffbfa85fdbcc60 x9 : 
> ffffbfa85fdbc7e0
> [   10.904627][   T90] x8 : ffff709418668ab0 x7 : ffff709418668ab0 x6 : 
> ffff709418668ab0
> [   10.912676][   T90] x5 : ffff709418668ab0 x4 : ffff709418668ab0 x3 : 
> ffff709415e807c0
> [   10.920727][   T90] x2 : ffff709406e62640 x1 : 0000000000000001 x0 : 

Everything above is irrelevant.

> ffff709415e81840
> [   10.928781][   T90] Call trace:
> [   10.932024][   T90]  _regulator_put+0x50/0x60 (P)
> [   10.936877][   T90]  regulator_put+0x30/0x48
> -----------

And this is only relevant information which tells nothing. Are you sure
you pasted FULL log?

> 
> Thanks & Regards,
> Rafi.
> 
>> Best regards,
>> Krzysztof
>>
> 


Best regards,
Krzysztof

