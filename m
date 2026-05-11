Return-Path: <linux-gpio+bounces-36597-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBTNIDkaAmognwEAu9opvQ
	(envelope-from <linux-gpio+bounces-36597-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 20:04:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B9F51409C
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 20:04:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 72CA63010649
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 18:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BE99478870;
	Mon, 11 May 2026 18:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ts1dnUUL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B25477981;
	Mon, 11 May 2026 18:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778522675; cv=none; b=ngVS5WlbSnipA4QdUEzf/NIuUZLebbYQSYoUxGhcF6YUyPht1OkqAAkqI98Qcp01q/1BBsdJdVC3GVdAUKh0OqHGa7qsOQPg3ntB7L27pcjYw+czEdphstmy2cLUt4cOGpo2S9Td/6vrW3GifzBSSJoZympYry1GR/YRKqw2vA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778522675; c=relaxed/simple;
	bh=5DDXjZwKmfb4MfZeTjaL80NJLxAk06ehb8Ek4HeG/mU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qQhvHxLaBcX+tVRqQRVZ4ng69vsvbNAOKSmgZjVVZym5XxwkKPaONG0daDgqG7WwcarU2Llbp6s10W+RR20jP7E8eoF8PpRLaCoTl2dKdTdKp8bVNjVHtCvL4h9mBQwAf3DF1US5kqpjKVJZlhIUZnXy3v6alwQMS07mMvtNGiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ts1dnUUL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 802CAC2BCB0;
	Mon, 11 May 2026 18:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778522675;
	bh=5DDXjZwKmfb4MfZeTjaL80NJLxAk06ehb8Ek4HeG/mU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ts1dnUULzU9zFWKjj9emjX/Tm1WS5BunucS/Ej7tr4CY95wvcWrQU3gCv+VavWxml
	 WHgNdSfyK5t5hCN9muEQ+IIW0wdYUXZN3WHozApVrNCjgMM9zTpI9INMGfWLta2y2e
	 f7MYrSJo/FZ1V7jkaZteAjpJLSQZmjDKJsBJwZ/jvQSnGOAJqeQXh3K0iNAp4aROyY
	 e0qKaRJ6mSD2oaCmbGvzbD+3p8XvSb7lG9P5VhOR0Nw9YgzuwC5sNeIMyR+cwfGXrA
	 WVPICvMe+EbtQole5FseQH0D9MVPUtwcNkEvnp2dXuTwlBHqrGwLHqKV7Pc+q+CfOt
	 Uq2M23vqmjxXg==
Date: Mon, 11 May 2026 13:04:31 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] pinctrl: qcom: eliza: Split QUP1_SE4 lanes
Message-ID: <agIZOAa6nYSb5PWX@baldur>
References: <20260423-fix-eliza-pinctrl-v3-0-68b24893ae63@pm.me>
 <20260423-fix-eliza-pinctrl-v3-4-68b24893ae63@pm.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-fix-eliza-pinctrl-v3-4-68b24893ae63@pm.me>
X-Rspamd-Queue-Id: 35B9F51409C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36597-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, Apr 23, 2026 at 04:43:46AM +0000, Alexander Koskovich wrote:
> QUP1_SE4 shares GPIO_36 & GPIO_37 for both L0/L1 and L3/L2 so the
> function name cannot be the same or the alternate function cannot
> be selected.
> 
> Split them up into individual lane functions so boards can specify.
> 

This works, but it forces the DeviceTree source author to write a state
per pin even though these are typically configured in pairs.

What we did for hawi was to use the naming: qup1_se4_01 and qup1_se4_23
to express the two possible function pairs.


I don't have any strong opinions on how to proceed with this platform
(eliza), but I'm hoping we can follow the pair-wise scheme going
forward.

Regards,
Bjorn

> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  drivers/pinctrl/qcom/pinctrl-eliza.c | 30 ++++++++++++++++++++++++------
>  1 file changed, 24 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-eliza.c b/drivers/pinctrl/qcom/pinctrl-eliza.c
> index 8f74756771b8..40e263e35b45 100644
> --- a/drivers/pinctrl/qcom/pinctrl-eliza.c
> +++ b/drivers/pinctrl/qcom/pinctrl-eliza.c
> @@ -568,7 +568,10 @@ enum eliza_functions {
>  	msm_mux_qup1_se2_l3_mira,
>  	msm_mux_qup1_se2_l3_mirb,
>  	msm_mux_qup1_se3,
> -	msm_mux_qup1_se4,
> +	msm_mux_qup1_se4_l0,
> +	msm_mux_qup1_se4_l1,
> +	msm_mux_qup1_se4_l2,
> +	msm_mux_qup1_se4_l3,
>  	msm_mux_qup1_se5,
>  	msm_mux_qup1_se6,
>  	msm_mux_qup1_se6_l1_mira,
> @@ -1017,8 +1020,20 @@ static const char *const qup1_se3_groups[] = {
>  	"gpio44", "gpio45", "gpio46", "gpio47",
>  };
>  
> -static const char *const qup1_se4_groups[] = {
> -	"gpio36", "gpio37", "gpio37", "gpio36",
> +static const char *const qup1_se4_l0_groups[] = {
> +	"gpio36",
> +};
> +
> +static const char *const qup1_se4_l1_groups[] = {
> +	"gpio37",
> +};
> +
> +static const char *const qup1_se4_l2_groups[] = {
> +	"gpio37",
> +};
> +
> +static const char *const qup1_se4_l3_groups[] = {
> +	"gpio36",
>  };
>  
>  static const char *const qup1_se5_groups[] = {
> @@ -1321,7 +1336,10 @@ static const struct pinfunction eliza_functions[] = {
>  	MSM_PIN_FUNCTION(qup1_se2_l3_mira),
>  	MSM_PIN_FUNCTION(qup1_se2_l3_mirb),
>  	MSM_PIN_FUNCTION(qup1_se3),
> -	MSM_PIN_FUNCTION(qup1_se4),
> +	MSM_PIN_FUNCTION(qup1_se4_l0),
> +	MSM_PIN_FUNCTION(qup1_se4_l1),
> +	MSM_PIN_FUNCTION(qup1_se4_l2),
> +	MSM_PIN_FUNCTION(qup1_se4_l3),
>  	MSM_PIN_FUNCTION(qup1_se5),
>  	MSM_PIN_FUNCTION(qup1_se6),
>  	MSM_PIN_FUNCTION(qup1_se6_l1_mira),
> @@ -1418,8 +1436,8 @@ static const struct msm_pingroup eliza_groups[] = {
>  	[33] = PINGROUP(33, qup1_se1, ibi_i3c, host2wlan_sol, gcc_gp3, _, _, _, _, _, _, _),
>  	[34] = PINGROUP(34, qup1_se1, qup1_se5, tb_trig_sdc1, ddr_bist_start, qdss_gpio_tracedata, _, _, _, _, _, _),
>  	[35] = PINGROUP(35, qup1_se1, qup1_se5, tb_trig_sdc2, gcc_gp2, qdss_gpio_tracedata, _, _, _, _, _, _),
> -	[36] = PINGROUP(36, qup1_se4, qup1_se4, ibi_i3c, _, _, _, _, _, _, _, _),
> -	[37] = PINGROUP(37, qup1_se4, qup1_se4, ibi_i3c, _, _, _, _, _, _, _, _),
> +	[36] = PINGROUP(36, qup1_se4_l0, qup1_se4_l3, ibi_i3c, _, _, _, _, _, _, _, _),
> +	[37] = PINGROUP(37, qup1_se4_l1, qup1_se4_l2, ibi_i3c, _, _, _, _, _, _, _, _),
>  	[38] = PINGROUP(38, _, _, _, _, _, _, _, _, _, _, _),
>  	[39] = PINGROUP(39, _, _, _, _, _, _, _, _, _, _, _),
>  	[40] = PINGROUP(40, qup1_se6, qup1_se2, qup1_se6_l3_mira, _, qdss_gpio_tracedata, gnss_adc1, ddr_pxi1, _, _, _, _),
> 
> -- 
> 2.53.0
> 
> 

