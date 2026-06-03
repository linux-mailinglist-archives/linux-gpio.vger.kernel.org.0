Return-Path: <linux-gpio+bounces-37908-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9ENYME9LIGrc0QAAu9opvQ
	(envelope-from <linux-gpio+bounces-37908-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 17:42:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6042463952F
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 17:42:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=G6HoOvL0;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37908-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37908-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B782A3537F8C
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 15:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2D903DA5DB;
	Wed,  3 Jun 2026 15:24:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1753D905D;
	Wed,  3 Jun 2026 15:24:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780500278; cv=none; b=l1ayDfX7XWBdC5OE72Wh79z+Iwz1aNn6iidJwqwkXDvNHylP31MiOm71G7m1O9wed4Ayz7fK7avsm9ONgzV/6ysSn3CWrKoqqfW0gf5bHBkWINsJBzwGy/tAwkcx9/Xn+2s8FEJxCkt26HVNHKpT/oLbd5CIZI9/9Aex5PQuaV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780500278; c=relaxed/simple;
	bh=Wo7WvU7hG8UqR9oM2FnHyCbJ2ufNLi2uCnx5PAG0TkE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gVz+C9LnFwZrrFjnpJ3ly1uA1lygQihAk3h0Lsuom6AkQK6IWMaufyhquJ+ThehglQ2SqrQw+/WCmMgRu+zV839cDZ0TsvoXHhKfElz6zfCZWbQ7jDSgM54kQ2Ukj79lCA3UoGxObs5m8O3Z/zJiWICwRUa5qU7Ya0uLIxke0yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G6HoOvL0; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0E651F00893;
	Wed,  3 Jun 2026 15:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780500277;
	bh=HNdlC6+cJBidtlUlePuZph88tbBAg1I6k9N5mrg/fMQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=G6HoOvL0sJEIKMxnx6ll5qujs8+SC7yKk9xA6cXa3zIRKuRU04wbyn6GA3zQgdo43
	 6mllWBQAm6fS+66v+cTX8r00MBIwB2MX7JraKXbUCZINs5VnGbceFvNOQz18gvtL4B
	 pXK3agdUJ/tF0xTUwUvvONJ82RG+sUEyk62zFyex9u252DlU6pj4jFCCJDQR/l0pSS
	 SDkt5uUiabA22dblq6QCIT63d4k46DV1nqD2zrelIZm70aC7190cOLc6cO1Q4nD7Je
	 miHBWlzwG6Fz4kk6lxwUdcTYLtS9dG9DkbVVkBO+u7Re8hmKWmSnlZ2g9sZtlqEcKN
	 TkutyJ+RsqAtw==
From: Thomas Gleixner <tglx@kernel.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Sneh Mankad
 <sneh.mankad@oss.qualcomm.com>, Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/8] irqchip/qcom-pdc: Move all statics to struct
 pdc_desc
In-Reply-To: <20260526-hamoa_pdc-v2-2-f6857af1ce91@oss.qualcomm.com>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
 <20260526-hamoa_pdc-v2-2-f6857af1ce91@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 17:24:34 +0200
Message-ID: <87bjdr7ikt.ffs@fw13>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
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
	TAGGED_FROM(0.00)[bounces-37908-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fw13:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6042463952F

On Tue, May 26 2026 at 16:24, Maulik Shah wrote:
> @@ -221,9 +231,9 @@ static void pdc_enable_intr(struct irq_data *d, bool on)
>  {
>  	unsigned long flags;
>  
> -	raw_spin_lock_irqsave(&pdc_lock, flags);
> -	__pdc_enable_intr(d->hwirq, on);
> -	raw_spin_unlock_irqrestore(&pdc_lock, flags);
> +	raw_spin_lock_irqsave(&pdc->lock, flags);

While at it please convert this to:

      guard(raw_spinlock_irqsave)(...);

The _irqsave is not really required when invoked from the irqchip
callbacks with irq desc lock held and interrupts disabled, but that's
also magically invoked from other contexts. So you could spare that
irqsave by wrapping the other callsite into:

        guard(irq)() or scoped_guard(irq)

> +	pdc->enable_intr(d->hwirq, on);
> +	raw_spin_unlock_irqrestore(&pdc->lock, flags);
>  }
>  
>  static void qcom_pdc_gic_disable(struct irq_data *d)
> @@ -348,10 +358,10 @@ static struct pdc_pin_region *get_pin_region(int pin)
>  {
>  	int i;
>  
> -	for (i = 0; i < pdc_region_cnt; i++) {
> -		if (pin >= pdc_region[i].pin_base &&
> -		    pin < pdc_region[i].pin_base + pdc_region[i].cnt)
> -			return &pdc_region[i];
> +	for (i = 0; i < pdc->region_cnt; i++) {

for (int i = 0; ....

> +		if (pin >= pdc->region[i].pin_base &&
> +		    pin < pdc->region[i].pin_base + pdc->region[i].cnt)
> +			return &pdc->region[i];
>  
> +	raw_spin_lock_init(&pdc->lock);
> +
>  	pdc_domain = irq_domain_create_hierarchy(parent_domain,
>  					IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP,
>  					PDC_MAX_IRQS,

Please fix up the coding style here according to

https://docs.kernel.org/process/maintainer-tip.html

