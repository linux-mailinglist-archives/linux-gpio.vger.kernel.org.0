Return-Path: <linux-gpio+bounces-39245-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SZj7C8zdQ2q6kgoAu9opvQ
	(envelope-from <linux-gpio+bounces-39245-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 17:16:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8C56E5D64
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 17:16:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=H1SLmrax;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39245-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39245-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 169EF3031835
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 15:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1315031D372;
	Tue, 30 Jun 2026 15:09:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25E2282F15;
	Tue, 30 Jun 2026 15:09:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782832178; cv=none; b=tWS/qzD2ndA43N1AFxKe4BKR5om9cqWJ0LinJovGM59Vp7018/B6abVhSe68gpeS23UJmk3B7Yv1MSNqjBDYmQX7SQcEn9BXpiChTPtoaV7UpHggNaMkmwhRwm91d4vsmQY0HL0V+Vi6dLM/+ph3S0TZ1B63vU/Lipim6Pyx/Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782832178; c=relaxed/simple;
	bh=KWj5R+S2Dy4FC7k6VAKYIRLxnpFocq9IIV56deniMyY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=miRAjPnfIE1/yhOfqHjj41LS2xaf+v5kOymELSBotOUEt6WURtEV2We5kXFuSiw4eUDOpgDCwZpfLsu+rmQuQ+Nf6+EiWJEMTg75ShuZuAc4PgnqFoRhEU2qV9LIHEtEUZrF+L2ydukhVaQHIR6MLxmWdKxEZMYcGrD1eZdIXtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H1SLmrax; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCAFE1F000E9;
	Tue, 30 Jun 2026 15:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782832177;
	bh=9A8TkRZZSmLlOK2f5rKGBD3XlOw17nYlH/8X8L5RN6Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=H1SLmraxE7rbAcQEOj/CdR8m6Q9s2MVFIvohLBqBLow+kPkgWF9qirmY+iggQrew9
	 Ygyl7w4Xg8E3wfP8zLxOoWjGcfOXraxyPqgKt0SFGDHlcisuhQliRe+UsXMLbJpRHA
	 U+HyDCRcDU+hzdoe4V0FJJ0jT8x8ZivBRW8+WZjKquBTrctMbSzUcpa+uJgzv6JRph
	 4n5FwbLSpbjHeLpIJoWV0M1U/Tmr2si+0sgLXAfQgU/ssveK6XA8cvU/Vf4eTHjvTa
	 HwO5O1ULT4UhUKRg9lDNip/13vJtkOdsm0q5BVCh8AMMv3XZXKt6p9WxXvqjfbMICy
	 IsCxJal7PJr+A==
From: Thomas Gleixner <tglx@kernel.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Sneh Mankad
 <sneh.mankad@oss.qualcomm.com>, Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH v3 5/8] irqchip/qcom-pdc: Configure PDC to pass through
 mode
In-Reply-To: <87echoqd7d.ffs@fw13>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <20260616-hamoa_pdc_v3-v3-5-4d8e1504ea75@oss.qualcomm.com>
 <87echoqd7d.ffs@fw13>
Date: Tue, 30 Jun 2026 17:09:34 +0200
Message-ID: <87bjcsqd3l.ffs@fw13>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
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
	TAGGED_FROM(0.00)[bounces-39245-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,fw13:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5F8C56E5D64

On Tue, Jun 30 2026 at 17:07, Thomas Gleixner wrote:
> On Tue, Jun 16 2026 at 14:55, Maulik Shah wrote:
>> +		for (int i = 0; i < pdc->region[n].cnt; i++) {
>> +			if (pdc_pin_is_gpio(i + pdc->region[n].pin_base) &&
>> +			    pdc->mode == PDC_SECONDARY_MODE)
>> +				pdc->clear_gpio(i + pdc->region[n].pin_base);
>> +
>
> Requires guard(irqsave)

before

>>+			pdc->enable_intr(i + pdc->region[n].pin_base, false);

obviously.

