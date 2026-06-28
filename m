Return-Path: <linux-gpio+bounces-39075-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D84aESlgQWoDogkAu9opvQ
	(envelope-from <linux-gpio+bounces-39075-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2026 19:55:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9F06D496E
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2026 19:55:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=packett.cool header.s=key1 header.b="q6N3im/n";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39075-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39075-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=packett.cool;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E617301A70B
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2026 17:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DD742F7F0C;
	Sun, 28 Jun 2026 17:55:32 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1048C270545;
	Sun, 28 Jun 2026 17:55:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782669332; cv=none; b=XlRGDghpWFVQLYKEZoqG19m6N/NCJLGKRrXR2qTjSRXwx/92n5k+AA+uQWy1kmJth/I2otLuKImSVEzAoWjVbopuKl1cB/XSaFKc6biMQEQAj5yG4nWsqPb9Tcqni5IDx33B0GbwRaO+JCKwd7XLCU38t1dGKgZMLq4gKGymzgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782669332; c=relaxed/simple;
	bh=2CITBd7/18CBzbO8NNksy39726jDFXG6TU9lyUfD+GA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U9C5fEgcC10aJh2UdPJzfEBnKVlk5TGxMlg4Lj+eajrBzmZElCwMhG+t17GaCC4QURis+ZNhMMVY99njWQKQE3QITSbcrxRQOJsv34UKAyXT0+WpRqhG4hrdeSHGLXYaLduIFx9eENgJKjo2nwsW3JMN+GvQK2SVqd3X9dG1D0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=q6N3im/n; arc=none smtp.client-ip=95.215.58.187
Message-ID: <5e59c3a3-b492-40f0-9db1-5ef9f95d77b6@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1782669317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U0xAeg+eNrWlm0+W61UvKbaI5qPbR3lC4Fub+e8id8w=;
	b=q6N3im/n2Y0zVf+KlcOnIUa0QJI6dOf5WbsOmsHDcV1V5r+az6+w2ARCmwN42KuP19FePn
	ChaE6AkkYL3LvVuKa/LmB6yKZn38NvDYTciUzlZuKgO0WEWqPNLwzHo0Mmjaurs6MAjPlL
	AJH3i4C8l61sx+mGAkemkR1HhW2Am9iVHpCkMZ34ea6N41fhJiHK2pfFrbsj4VyKEdt11d
	ksEALkH/LgFgz/oYJuEL+inrpbXzlzy44ZdUuc8APNTkwGYLSUeGiZDFQ7fhnNSKtZCdNj
	5XmMcfUQlOdIJwS7AbcgKSeEBvxRn5gnMrVTqQjazRQnW5eJp4HhQg76emEwpQ==
Date: Sun, 28 Jun 2026 14:54:52 -0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 3/8] irqchip/qcom-pdc: Remove pdc_enable_intr() wrapper
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <20260616-hamoa_pdc_v3-v3-3-4d8e1504ea75@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20260616-hamoa_pdc_v3-v3-3-4d8e1504ea75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maulik.shah@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[val@packett.cool,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-39075-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[packett.cool:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[packett.cool:dkim,packett.cool:mid,packett.cool:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CA9F06D496E


On 6/16/26 6:25 AM, Maulik Shah wrote:
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
>   drivers/irqchip/qcom-pdc.c | 13 ++++---------
>   1 file changed, 4 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
> index b9acb0f25c9c..6c556464d37c 100644
> --- a/drivers/irqchip/qcom-pdc.c
> +++ b/drivers/irqchip/qcom-pdc.c
> @@ -206,6 +206,8 @@ static void pdc_enable_intr_bank(int pin_out, bool on)
>   	index = FIELD_GET(IRQ_ENABLE_BANK_INDEX_MASK, pin_out);
>   	mask = FIELD_GET(IRQ_ENABLE_BANK_BIT_MASK, pin_out);
>   
> +	guard(raw_spinlock)(&pdc->lock);
> [..]

whoops..

[    0.197090] BUG: spinlock bad magic on CPU#7, swapper/0/1
[    0.197104]  lock: 0xffff0001022e37b0, .magic: 00000000, .owner: 
<none>/-1, .owner_cpu: 0
[    0.197122] CPU: 7 UID: 0 PID: 1 Comm: swapper/0 Not tainted 
7.1.0-next-20260626-uwu+ #128 PREEMPT(full)
[    0.197129] Hardware name: motorola Motorola Edge 30 
(Tianma)/Motorola Edge 30 (Tianma), BIOS 2026.07-rc2-g432bcf301c03-dirty 
07/01/2026
[    0.197133] Call trace:
[    0.197135]  show_stack+0x24/0x38 (C)
[    0.197148]  __dump_stack+0x28/0x38
[    0.197156]  dump_stack_lvl+0x7c/0xa8
[    0.197165]  dump_stack+0x18/0x30
[    0.197172]  spin_dump+0x7c/0x98
[    0.197179]  do_raw_spin_lock+0xa4/0x140
[    0.197189]  _raw_spin_lock+0x2c/0x40
[    0.197195]  pdc_enable_intr_bank+0x40/0x128
[    0.197201]  qcom_pdc_probe+0x3bc/0x520

Gotta also move the spinlock init to before the call to 
pdc_setup_pin_mapping..

~val


