Return-Path: <linux-gpio+bounces-37909-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5zmwBcdJIGoW0QAAu9opvQ
	(envelope-from <linux-gpio+bounces-37909-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 17:35:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C81FB639405
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 17:35:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=fRFAzz31;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37909-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37909-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 20F7730B0759
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 15:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED8A03D647A;
	Wed,  3 Jun 2026 15:25:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22903CF67A;
	Wed,  3 Jun 2026 15:25:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780500335; cv=none; b=WHn53n/+YyIMMB44BJ5peO+/VhJdiWIp9SuRr1Wcqvhb+YSLHgpRg+cV1OLS3KWOPH4D32LKVVoaSjQmThA+FMfkJNq1D2HMyv7q9ntjpktw7a29Rx2Qc0cBe4BJpg8XocjNfkiS35J9dqHTeQ/z3sueHRAfK7hqjcaMup+5uq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780500335; c=relaxed/simple;
	bh=3T9XLXoNnQY5DKXl9mg8JORPuTpniOa8MzjuOk0JoTQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Tx0aXDygbKvLDY+2LZSTQKOdeGSsjwlZek+xkGMSjXLyprlrp93uXVXKChC4wOpcuP+f3qQMVTmmAYCCrPk6SQDGnN6n6ZO+y56mJreKbtA8vQoZvo5sxa5OhcqYFfv7/y+cAKleC7XsNobwFtdRPVfjGRuadox4jIM3+WPD5KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fRFAzz31; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA2EF1F00893;
	Wed,  3 Jun 2026 15:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780500334;
	bh=9z/91wdszmHSOY/XimjV6/xEynDtvQK2rKYHHDh8JsE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=fRFAzz3157zLlLdTXvtinX/acXVmpkbkkG7EoWHxDK3/BzeshPFgeFnGMXSjA1lq7
	 +xGiwcsERiOx77n7KVJtvKxvp+CwxYuk/ip4PpxDwJPa6hBb7QGcAVoJJJgBRsMFWN
	 EiX1+lwIxND5rWpJ0FTEzG5t4eQl9kaCsrL02FkW8tCt1kUzpUTQsfId2evzA0LQFM
	 UcmLaIiH5xKcNZEEhFJba++abdXmE2fa4TSGzQRKJtujbsf07xYf8xi7vGYjEXVP3P
	 z2wDR+MBfVcIF52UbdrM3pLAPMa2YBs3YhOCbaXHggc3MYo+C/K4fM+L2x9R3F0QpQ
	 MgySOF9o4xSlg==
From: Thomas Gleixner <tglx@kernel.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Sneh Mankad
 <sneh.mankad@oss.qualcomm.com>, Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/8] irqchip/qcom-pdc: Remove pdc_enable_intr() wrapper
In-Reply-To: <20260526-hamoa_pdc-v2-3-f6857af1ce91@oss.qualcomm.com>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
 <20260526-hamoa_pdc-v2-3-f6857af1ce91@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 17:25:31 +0200
Message-ID: <878q8v7ij8.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maulik.shah@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tglx@kernel.org,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-37909-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,fw13:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C81FB639405

On Tue, May 26 2026 at 16:24, Maulik Shah wrote:

> pdc->enable_intr() function already points to respective version
> specific enable function. pdc_enable_intr() now only kept as wrapper.
> Remove the wrapper and invoke pdc->enable_intr() from caller.
>
> Locking in pdc_enable_intr() applies lock to all pdc->enable_intr()
> however its only required for pdc_enable_intr_bank() which uses
> a shared bank across all interrupts. pdc_enable_intr_cfg() do not
> required locking as IRQ_CFG registers are one per interrupt. Move
> locking accordingly.
>
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  drivers/irqchip/qcom-pdc.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
> index 8f7802139e4e..db76737646e1 100644
> --- a/drivers/irqchip/qcom-pdc.c
> +++ b/drivers/irqchip/qcom-pdc.c
> @@ -201,11 +201,14 @@ static void pdc_x1e_irq_enable_write(u32 bank, u32 enable)
>  static void pdc_enable_intr_bank(int pin_out, bool on)
>  {
>  	unsigned long enable;
> +	unsigned long flags;
>  	u32 index, mask;
>  
>  	index = FIELD_GET(GENMASK(31, 5), pin_out);
>  	mask = FIELD_GET(GENMASK(4, 0), pin_out);
>  
> +	raw_spin_lock_irqsave(&pdc->lock, flags);

guard()

