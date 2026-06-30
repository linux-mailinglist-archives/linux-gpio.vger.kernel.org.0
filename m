Return-Path: <linux-gpio+bounces-39240-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mMkMGKrXQ2rpjwoAu9opvQ
	(envelope-from <linux-gpio+bounces-39240-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 16:50:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0D76E5924
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 16:50:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=jcpfsMI0;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39240-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39240-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A638231307A2
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 14:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29B304192F1;
	Tue, 30 Jun 2026 14:46:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153913F0AB6;
	Tue, 30 Jun 2026 14:46:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782830809; cv=none; b=bmVVf34T2Cfd3p3AniN3pWpiQl8om7r+StSH9kYibMN62Pqta/uOP+5hva0QT52VrI6c2XD29gww4jqgQjY/ds+fLe2PE0NaRVBFcwSYT+DwW555OLUQ5cur0H0QbMwQFHnh8XNjSZnnQKxhTgeN526uexckX2BmDyno0JlPWpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782830809; c=relaxed/simple;
	bh=DLIdamcxujGmprppFt9NtsCNxBtM/Us+m3JNK/blc2c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ogQV/pURByqvbzRJhwjc/v5yQ3pYNwUkBQ1+snErNpcorpmf1tU+QBRcf3pq3SwIK5N34wsGV+BP1IDOqYMxWqfhck3WXMvK1hVngF8FRH4OGYztVe0CcDBIHjWkkrPih1ynhufo+p5YtoJX5RvTt1HNOuNI8T4RVSU4F4y1gk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jcpfsMI0; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B7161F000E9;
	Tue, 30 Jun 2026 14:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782830808;
	bh=j6OwDerxhRjXIaHh1FTuELXdWa9x8UdInRjOIqNsTNQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=jcpfsMI0dql7IfEYZHk4tat9YX6F50U6Wvcrj3Lx2+aW5GFgJW8qepL1WWB8Ig+8G
	 OAw1PMVkWNJThwQiwi3sJeW1YwH9+Pa5EmKANzh/TUededsFiNI2ioyAGLwrZCwJdd
	 qlviuu/PmdGKUIGEfliMzrWVyJ2taoYbTKfEMwxZqc5nLqvqqfYSYMoNUeRJkilV4Z
	 VhRFGzUVl0ioU7SPAwfodyX5vM9Al6nkNytndXmKBKH7UJtTgU6XKa4Fobb6Tw1m18
	 fqxxerwBVfberfAWkgs2TLy+qi2AGWCi4hdG9SwDHdPgtbk5VImkr275PKRDDgsktd
	 SzbHczpJRcB3A==
From: Thomas Gleixner <tglx@kernel.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Sneh Mankad
 <sneh.mankad@oss.qualcomm.com>, Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/8] irqchip/qcom-pdc: Move all statics to struct
 pdc_desc
In-Reply-To: <20260616-hamoa_pdc_v3-v3-2-4d8e1504ea75@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <20260616-hamoa_pdc_v3-v3-2-4d8e1504ea75@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 16:46:45 +0200
Message-ID: <87jyrgqe5m.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[tglx@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:maulik.shah@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39240-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,fw13:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AD0D76E5924

On Tue, Jun 16 2026 at 14:55, Maulik Shah wrote:
> -		for (i = 0; i < pdc_region[n].cnt; i++)
> -			__pdc_enable_intr(i + pdc_region[n].pin_base, 0);
> +		for (int i = 0; i < pdc->region[n].cnt; i++)
> +			pdc->enable_intr(i + pdc->region[n].pin_base, 0);

This needs a guard(raw_spinlock_irqsave)() when invoking
pdc->enable_intr(). The probe function is only invoked
with interrupts disabled during early boot. If it's called later, then
this still works, but lockdep will be rightfully upset.




