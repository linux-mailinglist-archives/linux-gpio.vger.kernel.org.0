Return-Path: <linux-gpio+bounces-33781-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YUzqONVcu2n+jAIAu9opvQ
	(envelope-from <linux-gpio+bounces-33781-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 03:17:57 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DB92C4D54
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 03:17:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 677983016D13
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 02:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BECA36C58F;
	Thu, 19 Mar 2026 02:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mPzNyffa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEE01386C9;
	Thu, 19 Mar 2026 02:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773886671; cv=none; b=Ump9v14fjfeMAbchx6nzof+bZ/dY+XGWEXldK4jD4+MucGkawbXc96KRBmZAgu85YSWL283PCcjGu3ngp8UGrc3X/ZJ+mWjPIIgGvX2OBpFNyS7LlvxA7IA1tUmgPhc24oGG2rF8+X0fYYrXFkow7uZ7mqLcFHes8oisZ5SvGW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773886671; c=relaxed/simple;
	bh=DQjLr/K8biwI+whh98ugYPFyJ36aZy2gPjkU1WgMzvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jKlCcwZGCR2/9lvCrSZ+7QchQgc6BzQ/XHkfk6JWiQQs7RxVwqGC+BmwY+wD+W1USiEt9B2O/81AuT/3jFL/Bvm53YQ5Aa0x/ITrkFMmAVgZYmzy7gdXH3pSMbs5C9wBsnzu0Vjim/lQsGEKIKZ27qKXjSGFkJAolfptBC3+i/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mPzNyffa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E669C2BC9E;
	Thu, 19 Mar 2026 02:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773886670;
	bh=DQjLr/K8biwI+whh98ugYPFyJ36aZy2gPjkU1WgMzvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mPzNyffalaUf2bm5ypHRp5M58PZDstWSfOIRw+3UHBOz32Q9eFC7fxQAI4PIRCqqs
	 B11el9tUfZf42nJZY3suEs9OC7w3CCw/RCRJzl25zl31WXKQ1gzgld5OmCRAD5pt0V
	 AZkyNj3lvYmWfVaF53IwO0F990ckMPm16BW9hXgqzVYISWelGMWvBSnlUWwk09VYvT
	 7EawFjpF3YiXG8pBFwD2UL3GP6N0m0J9Yj0s3sCnIq8lvfEpm7tN81trxshV7oR+d3
	 fIndxYtjyMuLDn16MdROptNHp3nWBv7ZS27xv8lIxfo7Cap+8+a9sVaziDVQUFTbM+
	 GcpuhcV89X41w==
Date: Wed, 18 Mar 2026 21:17:46 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Introduce IPQ5210 TLMM driver
Message-ID: <abtbnafiKkswWSy1@baldur>
References: <20260318-ipq5210_tlmm-v2-0-182d47b3d540@oss.qualcomm.com>
 <20260318-ipq5210_tlmm-v2-2-182d47b3d540@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-ipq5210_tlmm-v2-2-182d47b3d540@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33781-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 93DB92C4D54
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 12:44:31PM +0530, Kathiravan Thirumoorthy wrote:
> diff --git a/drivers/pinctrl/qcom/pinctrl-ipq5210.c b/drivers/pinctrl/qcom/pinctrl-ipq5210.c
[..]
> +static const struct pinfunction ipq5210_functions[] = {
[..]
> +	MSM_PIN_FUNCTION(qup_se5_l01),
> +	MSM_PIN_FUNCTION(qup_se5_l10),
> +	MSM_PIN_FUNCTION(qup_se5_l11),
> +	MSM_PIN_FUNCTION(qup_se5_l2),
> +	MSM_PIN_FUNCTION(qup_se5_l3),
> +	MSM_PIN_FUNCTION(qup_se5_l4),
> +	MSM_PIN_FUNCTION(qup_se5_l5),

Listing each pin of each QUP SE as their own function forces the DT
author to write one state definition per pin. Group these into their
logical functions instead.

Same thing with other logical functions that you have split into
multiple separate functions.

> +	MSM_PIN_FUNCTION(resout),
> +	MSM_PIN_FUNCTION(rx_los00),
> +	MSM_PIN_FUNCTION(rx_los01),
> +	MSM_PIN_FUNCTION(rx_los10),
> +	MSM_PIN_FUNCTION(rx_los11),
> +	MSM_PIN_FUNCTION(rx_los20),
> +	MSM_PIN_FUNCTION(rx_los21),
> +	MSM_PIN_FUNCTION(sdc_clk),
> +	MSM_PIN_FUNCTION(sdc_cmd),
> +	MSM_PIN_FUNCTION(sdc_data),
> +	MSM_PIN_FUNCTION(tsens_max),
> +};
> +
> +static const struct msm_pingroup ipq5210_groups[] = {
> +	[0] = PINGROUP(0, sdc_data, qspi_data, pwm, _, _, _, _, _, _),
> +	[1] = PINGROUP(1, sdc_data, qspi_data, pwm, _, _, _, _, _, _),
> +	[2] = PINGROUP(2, sdc_data, qspi_data, pwm, _, _, _, _, _, _),
> +	[3] = PINGROUP(3, sdc_data, qspi_data, pwm, _, _, _, _, _, _),
> +	[4] = PINGROUP(4, sdc_cmd, qspi_cs_n, _, _, _, _, _, _, _),
> +	[5] = PINGROUP(5, sdc_clk, qspi_clk, _, _, _, _, _, _, _),
> +	[6] = PINGROUP(6, qup_se0_l2, led0, pwm, _, cri_trng0, qdss_tracedata_a, _, _, _),
> +	[7] = PINGROUP(7, qup_se0_l3, led1, pwm, _, cri_trng1, qdss_tracedata_a, _, _, _),
> +	[8] = PINGROUP(8, qup_se0_l0, pwm, audio_pri2, audio_pri2, _, cri_trng2, qdss_tracedata_a, _, _),

How can both function 3 and 4 be "audio_pri2", do you expect the system
integrator to be able to select function 4?

> +	[9] = PINGROUP(9, qup_se0_l1, led2, pwm, _, cri_trng3, qdss_tracedata_a, _, _, _),
> +	[10] = PINGROUP(10, pon_rx_los, qup_se3_l3, pwm, _, _, qdss_tracedata_a, _, _, _),
> +	[11] = PINGROUP(11, pon_active_led, qup_se3_l2, pwm, _, _, qdss_tracedata_a, _, _, _),
> +	[12] = PINGROUP(12, pon_tx_dis, qup_se2_l3, pwm, audio_pri0, audio_pri0, _, qrng_rosc0, qdss_tracedata_a, _),
> +	[13] = PINGROUP(13, gpn_tx_dis, qup_se2_l2, pwm, audio_pri3, audio_pri3, _, qrng_rosc1, qdss_tracedata_a, _),

Same here.

Regards,
Bjorn

