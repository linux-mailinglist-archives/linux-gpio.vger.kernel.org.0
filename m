Return-Path: <linux-gpio+bounces-37912-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DtduLGxLIGrv0QAAu9opvQ
	(envelope-from <linux-gpio+bounces-37912-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 17:42:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F27F63954A
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 17:42:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="hHrV/x+P";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37912-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37912-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 20DD43021CAD
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 15:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AED93AE1AD;
	Wed,  3 Jun 2026 15:36:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DE53B47CF;
	Wed,  3 Jun 2026 15:36:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780500987; cv=none; b=hMcfzwGGWTuUf7+b4CpKef2D4JcTnlyLV4uRiM5/of9/UTXnJ35g7rhORYliPh+uvGi1Xzh8KDG4LFKSLv1/7UDvCpkaPN87tIWkFuQQS3t6Hp21AfZwi/hFW4aZlQUFaN7P8bEK79yKmRPeRiPNlGyLgZTg+jCctIWjpJnvLSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780500987; c=relaxed/simple;
	bh=WWl0wCb3pfPSLTyKbZGLBc+OPYdYxOFfCypVd82uDUk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VQWmtvwy726Xw3nsv0QsjErA2RGCCxyQ78h0ujnn7MXaVGBEiWMAGXBoaw549FbeGawaj69XhlYpNs3oTdhl5pdPIMkPBGW87C6ZK8QvLnNkeetZxmyQ8AlijdwIARpoCgHeTJyRpH0xwgNJUPugtwOEuufXzGkr0N2GIgUJJFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hHrV/x+P; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E2391F00893;
	Wed,  3 Jun 2026 15:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780500985;
	bh=SAkb5V6NtcCPmSvzm4+V97K1xoD0UopH40bZ8VjeIHw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=hHrV/x+PdTiushR0xNqUS/JtV+j0xltOIxRB/FiBKo8zKJqcILCvPurAh/xvON40n
	 u+c9irCJKkqd+80iJHfmqbSmgruuIYUJ6jA3gzKSiQ+HIU9g7EN5I4JILM3K6Tb4Ck
	 eztfJYNQ24L9nQfdBXFuMi1Pah/sGCuxpRBR19+Roiq9lg5ixmMBlL2TSZHBeQ5I3s
	 T40/FZMFy8rSO8qe08cLSvV+N7zXUEqtJlo6d81GCQMIPLthC0ygGDF7u6ghhPkeoE
	 nQOiXUrlRIx+YayPEXXy1EuwT3xdMSqguvCuFgOoOGke8omCS7ONP6mAW0oec1Jxnf
	 IEW/cmQKGPNqQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Sneh Mankad
 <sneh.mankad@oss.qualcomm.com>, Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH v2 5/8] irqchip/qcom-pdc: Configure PDC to pass through
 mode
In-Reply-To: <20260526-hamoa_pdc-v2-5-f6857af1ce91@oss.qualcomm.com>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
 <20260526-hamoa_pdc-v2-5-f6857af1ce91@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 17:36:22 +0200
Message-ID: <87zf1b63gp.ffs@fw13>
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
	TAGGED_FROM(0.00)[bounces-37912-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[fw13:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8F27F63954A

On Tue, May 26 2026 at 16:24, Maulik Shah wrote:
 
> +static inline bool pdc_pin_uses_seconary_mode(int pin_out)
> +{
> +	if (pdc->mode == PDC_SECONDARY_MODE && pin_out >= pdc->num_spis)
> +		return true;

  return pdcc>mode == ... && ...;

Perhaps?

> +static void qcom_pdc_ack(struct irq_data *d)
> +{
> +	if (pdc_pin_uses_seconary_mode(d->hwirq) && !irqd_is_level_type(d))
> +		pdc->clear_gpio(d->hwirq);
> +}
> +
> +static void qcom_pdc_gic_eoi(struct irq_data *d)
> +{
> +	if (pdc_pin_uses_seconary_mode(d->hwirq) && irqd_is_level_type(d))
> +		pdc->clear_gpio(d->hwirq);
> +
> +	irq_chip_eoi_parent(d);
> +}

Not that I care about the performance of your SoC, but those
conditionals can be completely avoided with separate irq chips.


