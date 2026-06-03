Return-Path: <linux-gpio+bounces-37911-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c+M2INVUIGoU1QAAu9opvQ
	(envelope-from <linux-gpio+bounces-37911-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 18:22:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8D3639AC0
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 18:22:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=XLjdw6Ol;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37911-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37911-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1982730A06A1
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 15:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8989B38D40E;
	Wed,  3 Jun 2026 15:33:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787A533DEC2;
	Wed,  3 Jun 2026 15:33:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780500790; cv=none; b=iBMM5iictaFGbH4/k414nOn+u/T+vG56hyN1OzJQzr2OC0jAf+uMq14CLYm9Inp5XIw9+wTnQJ+n0RzoAHSzSwIga13+yGVL0RNLMcfNsQXpG2HKUD1PKCGgkXNNkrRsIrYh7+DWnK8wzlaRl8P6JLRU0E6oHijiAl5FWwM0HGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780500790; c=relaxed/simple;
	bh=QaoXYUZ1KX+3rTwMZiqjG5bpOAZKziB6V8JGosfvqpE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KSlcLlykKYyoGYDtHwOlk8x70vC/Xsv9KgVtB8Pz2pRytWXu5MbHSwgwl5fgQPedrYxs7ydcU8ZLGzb9mXCu0gybnSSVE5KL+lvFInj5Y3MTL9Lqrf3Ps/D4hSTwuhEd+ogiaTDID58KwyFmE2vardTplf4MxOuI9/DlxpjdDf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XLjdw6Ol; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 670431F00893;
	Wed,  3 Jun 2026 15:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780500789;
	bh=iV1HV4/JIxJ9K22eiAig7puQk1qXi3wzIYtTmf8/mWA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=XLjdw6OlhEt7dGw5U/4Dbaa7aSrqSp9TGJF/dDxhSB4dxmHE/86+t+qtYfHPKNORr
	 V+wcJuvvnMV3tQ0t7Hy82aRj0egH+S5abPWGRCf3oAxitMKHGK1dK1d5fJmoT7GwYS
	 67upp/W7GraNJ0+5M21zClr/s9mpNcHGRKx2byiHB+iauPjdVpH5X3CPvZj4ilkYQl
	 j8kRYF8V5noJB9ZWd6DkER7HRxfACP92rLt2kEVJQhdvperD83HnzKMpR53g4KJtGY
	 5BXp7DQQdWHZSbOYgXkRztoLTAqMtGHGaY5/eOr4AeybASC61y+biLE+rg2lEUUA1F
	 4WK4XwpOEy4yg==
From: Thomas Gleixner <tglx@kernel.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Sneh Mankad
 <sneh.mankad@oss.qualcomm.com>, Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/8] irqchip/qcom-pdc: restructure version support
In-Reply-To: <20260526-hamoa_pdc-v2-1-f6857af1ce91@oss.qualcomm.com>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
 <20260526-hamoa_pdc-v2-1-f6857af1ce91@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 17:33:06 +0200
Message-ID: <871pen7i6l.ffs@fw13>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
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
	TAGGED_FROM(0.00)[bounces-37911-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fw13:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C8D3639AC0

On Tue, May 26 2026 at 16:24, Maulik Shah wrote:
> ---
>  drivers/irqchip/qcom-pdc.c | 193 +++++++++++++++++++++++++++++++++++----------
>  1 file changed, 150 insertions(+), 43 deletions(-)

Applying patch _PATCH_v2_1_8_irqchip_qcom_pdc_restructure_version_support.patch
patching file drivers/irqchip/qcom-pdc.c
Hunk #1 FAILED at 21.
Hunk #2 FAILED at 45.
Hunk #3 FAILED at 55.
Hunk #4 succeeded at 61 (offset -8 lines).
Hunk #5 FAILED at 85.
Hunk #6 FAILED at 113.
Hunk #7 succeeded at 206 (offset -10 lines).
Hunk #8 succeeded at 366 (offset -9 lines).
Hunk #9 FAILED at 412.
Hunk #10 succeeded at 436 (offset -10 lines).
Hunk #11 succeeded at 451 (offset -10 lines).
6 out of 11 hunks FAILED -- rejects in file drivers/irqchip/qcom-pdc.c


