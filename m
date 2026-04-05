Return-Path: <linux-gpio+bounces-34691-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHALIqm20mn+ZwcAu9opvQ
	(envelope-from <linux-gpio+bounces-34691-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Apr 2026 21:23:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 337E439F5FA
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Apr 2026 21:23:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26444301A918
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Apr 2026 19:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EC622F39B9;
	Sun,  5 Apr 2026 19:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dqdD/D/k"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA9D2F069D;
	Sun,  5 Apr 2026 19:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775416940; cv=none; b=LP7BPn5wZVlLf5U4Z5HBIcOBLLhoHxFLBR0GaF5/T4QICLlKJ0zvrg5Adl9yYl0Os5+RXSbf4sZvoHWVYmDTFMribyff5jA1yg7BlzAdVPEfnOwKATczFYlf4f+2/4vMyaC34IE2Xr+6eCUJkR+Cwdav2Pzx0pkVBkL9OkJVNYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775416940; c=relaxed/simple;
	bh=mZUV/W122YoheOkQInkEZtIizl/Cy+NtGl6p4rKlHPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IKGhGrwJJXEH8Q3M1slLNew2CtAXnVPdxp7U1S/F8wwzGD631ZY3s6JU4EIVMpLJFsnRWf/4buV1CWvGA6rM+1DhnSViHUeorVQ8jOuzOoee2bAnOH8NXRBqiABj4t73NS7cE3bGcnL7i7hPNvDUsTDfjfVafc6axYhQorKLfF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dqdD/D/k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 333B9C116C6;
	Sun,  5 Apr 2026 19:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775416940;
	bh=mZUV/W122YoheOkQInkEZtIizl/Cy+NtGl6p4rKlHPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dqdD/D/kmcVPjm9ZXKLCCwtAl9aDngIjEOoA2ewy0oWtT+sHyQkXrOqx3XEdVws2z
	 rSE8yo5EqyrvKl3KXqDAw8QPNaPL7bDuio5Cw3cWmXy7vYm2tffAiWbSQQXV0DFYWi
	 T+z4SuGsjHMJ30qtosyx9UtlC0WlTHFeFe0X9Fx8EXnSe1G04GRnrduZzi8OLuQtcJ
	 sgIrKN+Ue6v6pXfpZfTgG4vuHJAXhrbNs7aQ30ty5xJ3u8K5U/qr5frY9wH7gNTe0r
	 qqfx55AOF8L6N/2+zufe6UkUHUtFSd2iXqH/eiYI0Gv9nBDIS6+I7XsEyp3R6AaCXq
	 TsL6nPRpy0xCA==
Date: Sun, 5 Apr 2026 14:22:16 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Shawn Guo <shengchao.guo@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] pinctrl: qcom: add the TLMM driver for the Nord
 platforms
Message-ID: <adKz2wirCJ5n3OpK@baldur>
References: <20260403-nord-tlmm-v1-0-4864f400c700@oss.qualcomm.com>
 <20260403-nord-tlmm-v1-2-4864f400c700@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-nord-tlmm-v1-2-4864f400c700@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34691-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,oss.qualcomm.com,arndb.de,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 337E439F5FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 03:27:56PM +0200, Bartosz Golaszewski wrote:
[..]
> diff --git a/drivers/pinctrl/qcom/pinctrl-nord.c b/drivers/pinctrl/qcom/pinctrl-nord.c
[..]
> +enum nord_functions {
> +	msm_mux_gpio,
> +	msm_mux_aoss_cti,
> +	msm_mux_atest_char0,
> +	msm_mux_atest_char1,
> +	msm_mux_atest_char2,
> +	msm_mux_atest_char3,
> +	msm_mux_atest_char_start,
> +	msm_mux_atest_usb20,
> +	msm_mux_atest_usb21,
> +	msm_mux_aud_intfc0_clk,
> +	msm_mux_aud_intfc0_data0,
> +	msm_mux_aud_intfc0_data1,
> +	msm_mux_aud_intfc0_data2,
> +	msm_mux_aud_intfc0_data3,
> +	msm_mux_aud_intfc0_data4,
> +	msm_mux_aud_intfc0_data5,
> +	msm_mux_aud_intfc0_data6,
> +	msm_mux_aud_intfc0_data7,

Keeping functions like this split per pin forces the DT author to
write per-pin states. We avoid this by dropping/adjusting the function
suffix.

The only case where we want to see a suffix for a given endpoint is when
it's necessary to allow us to select some secondary function of that pin
(e.g. we've seen QUP SE instances that spread their 4 pins pair-wise
across only two pins, with two different functions).

[..]
> +	msm_mux_qup3_se0_l0_mira,
> +	msm_mux_qup3_se0_l0_mirb,
> +	msm_mux_qup3_se0_l1_mira,
> +	msm_mux_qup3_se0_l1_mirb,

Here's such example, where the first two pins of qup3_se0 have two
different mappings on gpio 102/103 (for some reason). So, we somehow
need two functions for these.

> +	msm_mux_qup3_se0_l2,
> +	msm_mux_qup3_se0_l3,
> +	msm_mux_qup3_se0_l4,
> +	msm_mux_qup3_se0_l5,
> +	msm_mux_qup3_se0_l6,

But in order to select qup3_se0 muxing on pins 102-108 the DT author
need to write 6 different pinctrl states; where 1-2 should suffice.

[..]
> +static const struct msm_pingroup nord_groups[] = {
[..]
> +	[102] = PINGROUP(102, qspi0, qup3_se0_l0_mira, qup3_se0_l1_mirb, _, _, _, _, _, _, _, _),
> +	[103] = PINGROUP(103, qspi1, qup3_se0_l1_mira, qup3_se0_l0_mirb, _, _, _, _, _, _, _, _),
> +	[104] = PINGROUP(104, qspi_clk, qup3_se0_l2, _, _, _, _, _, _, _, _, _),
> +	[105] = PINGROUP(105, qspi_cs0_n, qup3_se0_l3, gcc_gp5_clk, _, _, _, _, _, _, _, _),
> +	[106] = PINGROUP(106, qspi2, qup3_se0_l4, gcc_gp6_clk, _, _, _, _, _, _, _, _),
> +	[107] = PINGROUP(107, qspi3, qup3_se0_l5, _, _, _, _, _, _, _, _, _),
> +	[108] = PINGROUP(108, qspi_cs1_n, qup3_se0_l6, qdss_gpio, _, _, _, _, _, _, _, _),

Regards,
Bjorn

