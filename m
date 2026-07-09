Return-Path: <linux-gpio+bounces-39720-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XYMAOfFaT2pEfAIAu9opvQ
	(envelope-from <linux-gpio+bounces-39720-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 10:25:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA7272E3CB
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 10:25:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=UQL3AXnn;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39720-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39720-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 13EFD305E3BA
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2026 08:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 943FD3F8705;
	Thu,  9 Jul 2026 08:23:29 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30E23D6689
	for <linux-gpio@vger.kernel.org>; Thu,  9 Jul 2026 08:23:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783585409; cv=none; b=r1RivOYMWyb5pol7rk21Bm9XO2TjVpeTOu6rxCvPK87cFnvRA08jmlulcfz7pS2MStgK2Idzq+CU1xdnjNyviLQYve2qp3Wt8DI+jLGWSkD1Zv4vRWtvvX2qA/BsYdQJOZw/HHhgf3Qf3sZOWyZJbKIWXGfoc0DTuVTSN8YVBB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783585409; c=relaxed/simple;
	bh=6Ied3ittILH0SrgaGw661g66NqWsEQKh/BF7h1MMXmo=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=azC/nNMzmNZ8fzrT5UIB7ErHtT/vONVvSN+uHFT9XoUDE+OoN/gyLmM1go28pzVYyQ9IWaAeC7Do9z+1cI8WZDgX+aVsphV/7XAKYCBzuZd4TkoqxK7Ju7PL2y0qe8Y+uflg9frt9MbX9oZp7kF0ifNvqGvogNgj8tQwkWTMqR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UQL3AXnn; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A79A91F00AC4
	for <linux-gpio@vger.kernel.org>; Thu,  9 Jul 2026 08:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783585407;
	bh=JX57usYGbmwSuLis8nZD6Khzp7TX8N2nVp+nRSDo+18=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=UQL3AXnngU02OKLyPwoUNvEUG8N8F0LykMwrCzDxzw2fUZi6kKutCscS9XzjWgibd
	 JkZg4Yz2jIvZ6H1fOcemfFo9uOwmJFKcCmOlvqU7k/U+q+yHpjSZBIkP5JFl4CBiGy
	 uYuQwVWMUj3fN4KjaDJGHMKUDZBWLM9wr202mEu5nTDSiZAbIuCx0tvvgcDG2PWLy6
	 ieCxDYULCTBQmGIJTARhNkawua3oV9BmSTlsbAzT29K1HkHnvNJQLriw9gQRJ4LTya
	 jMeEI3eyDoZJsCgt65jm+mTQFYdJxzZDgGkSIcnyq/VjRqfUbO/LmbkNlHwBPMkCxW
	 wAgaayYYLRc1Q==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39c83acb86eso5431071fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jul 2026 01:23:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq1Vysfjv01p8U9AExQGYSIKUFQxeKEJNrJGytmiUvvZLLTpC7NnhmP0hB/XOPGNLp+A1Ukvnrad2aZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxLm5Ak67AOqKzjjcvAcBSUSQCymt1RTJPaU5NhdnMDEdwESCqf
	mqjpO6z8yYQE9lBvfTk9xcTFFVsT1BAaatpDU+BQTQ4OmU8KSquGhxEh8rGccgIX1okGHNuhmi2
	SKCzuOvLRJv67tWi01NtHAmcdrnTL5l/OBkmX3TkvgA==
X-Received: by 2002:a05:651c:cf:b0:39b:b6d:59a1 with SMTP id
 38308e7fff4ca-39c7995088amr10707071fa.3.1783585406379; Thu, 09 Jul 2026
 01:23:26 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Jul 2026 01:23:25 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Jul 2026 01:23:24 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260708114924.1069239-3-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708114924.1069239-1-prasad.kumpatla@oss.qualcomm.com> <20260708114924.1069239-3-prasad.kumpatla@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 01:23:24 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfE3thXsff0JO2f2Ly_+CqzDfqs8V9CdcrT84h81OFV3A@mail.gmail.com>
X-Gm-Features: AVVi8CdTNc-86OaQqwT6qb7warmJNN6NrVU1VuyhoUcS_2X108_MW-QkjDl-vGs
Message-ID: <CAMRc=MfE3thXsff0JO2f2Ly_+CqzDfqs8V9CdcrT84h81OFV3A@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] ASoC: qcom: q6prm: add support for LPASS LPR
 resource voting
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39720-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:prasad.kumpatla@oss.qualcomm.com,m:krzk@kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:andersson@kernel.org,m:brgl@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:srini@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5BA7272E3CB

On Wed, 8 Jul 2026 13:49:22 +0200, Prasad Kumpatla
<prasad.kumpatla@oss.qualcomm.com> said:
> Add support for issuing LPASS low-power resource (LPR) votes through
> the PRM interface.
>
> Some platforms (e.g. Hawi) require the LPASS to be kept active via LPR
> resource voting instead of the existing hardware core vote mechanism.
> Handle this by introducing support for PARAM_ID_RSC_CPU_LPR when the
> LPR vote clock ID is requested.
>
> For LPR requests, use the appropriate parameter ID and payload format
> to disable CPU subsystem sleep, ensuring that the LPASS register space
> remains accessible.
>
> Also add the corresponding clock mapping for LPASS_HW_LPR_VOTE and make
> the q6dsp clock ID range consistent with the dt-bindings by deriving
> it from Q6AFE_MAX_CLK_ID.
>
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---
>  sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c |  2 +-
>  sound/soc/qcom/qdsp6/q6prm-clocks.c       |  2 ++
>  sound/soc/qcom/qdsp6/q6prm.c              | 18 ++++++++++++++----
>  sound/soc/qcom/qdsp6/q6prm.h              |  1 +
>  4 files changed, 18 insertions(+), 5 deletions(-)
>
> diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
> index 03838582a..79527a367 100644
> --- a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
> +++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
> @@ -12,7 +12,7 @@
>  #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>  #include "q6dsp-lpass-clocks.h"
>
> -#define Q6DSP_MAX_CLK_ID			104
> +#define Q6DSP_MAX_CLK_ID			Q6AFE_MAX_CLK_ID
>  #define Q6DSP_LPASS_CLK_ROOT_DEFAULT		0
>
>
> diff --git a/sound/soc/qcom/qdsp6/q6prm-clocks.c b/sound/soc/qcom/qdsp6/q6prm-clocks.c
> index 4c574b48a..2b2b3872e 100644
> --- a/sound/soc/qcom/qdsp6/q6prm-clocks.c
> +++ b/sound/soc/qcom/qdsp6/q6prm-clocks.c
> @@ -63,6 +63,8 @@ static const struct q6dsp_clk_init q6prm_clks[] = {
>  		       "LPASS_HW_MACRO"),
>  	Q6DSP_VOTE_CLK(LPASS_HW_DCODEC_VOTE, Q6PRM_HW_CORE_ID_DCODEC,
>  		       "LPASS_HW_DCODEC"),
> +	Q6DSP_VOTE_CLK(LPASS_HW_LPR_VOTE, Q6PRM_HW_LPR_VOTE,
> +		       "LPASS_HW_LPR_VOTE"),
>  };
>
>  static const struct q6dsp_clk_desc q6dsp_clk_q6prm __maybe_unused = {
> diff --git a/sound/soc/qcom/qdsp6/q6prm.c b/sound/soc/qcom/qdsp6/q6prm.c
> index 04892fb44..22ace8bcb 100644
> --- a/sound/soc/qcom/qdsp6/q6prm.c
> +++ b/sound/soc/qcom/qdsp6/q6prm.c
> @@ -31,10 +31,16 @@ struct q6prm {
>  #define PARAM_ID_RSC_HW_CORE		0x08001032
>  #define PARAM_ID_RSC_LPASS_CORE		0x0800102B
>  #define PARAM_ID_RSC_AUDIO_HW_CLK	0x0800102C
> +#define PARAM_ID_RSC_CPU_LPR		0x08001A6E
> +
> +#define LPR_CPU_SS_SLEEP_DISABLED	0x1
>
>  struct prm_cmd_request_hw_core {
>  	struct apm_module_param_data param_data;
> -	uint32_t hw_clk_id;
> +	union {
> +		u32 hw_clk_id;
> +		u32 lpr_state;
> +	};
>  } __packed;
>
>  struct prm_cmd_request_rsc {
> @@ -62,6 +68,7 @@ static int q6prm_set_hw_core_req(struct device *dev, uint32_t hw_block_id, bool
>  	struct prm_cmd_request_hw_core *req;
>  	gpr_device_t *gdev = prm->gdev;
>  	uint32_t opcode, rsp_opcode;
> +	bool lpr_req = hw_block_id == Q6PRM_HW_LPR_VOTE;

Please use braces here for better readability.

>
>  	if (enable) {
>  		opcode = PRM_CMD_REQUEST_HW_RSC;
> @@ -82,10 +89,13 @@ static int q6prm_set_hw_core_req(struct device *dev, uint32_t hw_block_id, bool
>
>  	param_data->module_instance_id = GPR_PRM_MODULE_IID;
>  	param_data->error_code = 0;
> -	param_data->param_id = PARAM_ID_RSC_HW_CORE;
> +	param_data->param_id = lpr_req ? PARAM_ID_RSC_CPU_LPR : PARAM_ID_RSC_HW_CORE;
>  	param_data->param_size = sizeof(*req) - APM_MODULE_PARAM_DATA_SIZE;
>
> -	req->hw_clk_id = hw_block_id;
> +	if (lpr_req)
> +		req->lpr_state = LPR_CPU_SS_SLEEP_DISABLED;
> +	else
> +		req->hw_clk_id = hw_block_id;
>
>  	return q6prm_send_cmd_sync(prm, pkt, rsp_opcode);
>  }
> @@ -94,7 +104,6 @@ int q6prm_vote_lpass_core_hw(struct device *dev, uint32_t hw_block_id,
>  			     const char *client_name, uint32_t *client_handle)
>  {
>  	return q6prm_set_hw_core_req(dev, hw_block_id, true);
> -
>  }
>  EXPORT_SYMBOL_GPL(q6prm_vote_lpass_core_hw);
>
> @@ -210,6 +219,7 @@ static int prm_probe(gpr_device_t *gdev)
>  	cc->gdev = gdev;
>  	mutex_init(&cc->lock);
>  	init_waitqueue_head(&cc->wait);
> +
>  	dev_set_drvdata(dev, cc);

These newline ninja changes are just unneeded noise in this patch.

>
>  	if (!q6apm_is_adsp_ready())
> diff --git a/sound/soc/qcom/qdsp6/q6prm.h b/sound/soc/qcom/qdsp6/q6prm.h
> index a988a3208..bd5ee0c40 100644
> --- a/sound/soc/qcom/qdsp6/q6prm.h
> +++ b/sound/soc/qcom/qdsp6/q6prm.h
> @@ -87,6 +87,7 @@
>  #define Q6PRM_LPASS_CLK_ROOT_DEFAULT	0
>  #define Q6PRM_HW_CORE_ID_LPASS		1
>  #define Q6PRM_HW_CORE_ID_DCODEC		2
> +#define Q6PRM_HW_LPR_VOTE		3
>
>  int q6prm_set_lpass_clock(struct device *dev, int clk_id, int clk_attr,
>  			  int clk_root, unsigned int freq);
> --
> 2.34.1
>
>

Bart

