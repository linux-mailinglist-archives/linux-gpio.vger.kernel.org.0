Return-Path: <linux-gpio+bounces-38511-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4dVMLHpoMGo2SwUAu9opvQ
	(envelope-from <linux-gpio+bounces-38511-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 23:02:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA7F68A17E
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 23:02:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=FqaphBUY;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38511-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38511-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1C2E30B0CD8
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 21:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6BB03812CD;
	Mon, 15 Jun 2026 21:02:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917142EEE68;
	Mon, 15 Jun 2026 21:02:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781557332; cv=none; b=aAoV7MyVY82ijMVHaWXc5n1Ixt7efxA735DN+aoS0ZyjwVSIRtnkD8I4B0gDfjPt97bdC2J9w+2tBbJgb8YKC+jhWKl3wK98EHB5pziAfbPN27WP0qyudX1OIIkevKFxiEAAIIxcr1O6YR7j4JXPNB8JM2rJUfSK1Zpy8dOipa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781557332; c=relaxed/simple;
	bh=OlePNWR5/1nGdD1RedQ2sy3wF3TMZnM2NoOj6fHCCeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rNTNTKkcbGSETqxsiX8lTXFmsdNoFVgsnEn/vg53hP7OHwM/ihdfkIPICtv41e37edbTDU3oh6gswPfAECRpJ4ss8Ks6oZ5Vn4XOPugDWAebX9LJ7wFaRl6uCH8Ws4QRn4bhCsGyQqrIb2ogm8PJQQtLoKx/JzZ2KoQMWmaQ6aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FqaphBUY; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0172A1F000E9;
	Mon, 15 Jun 2026 21:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781557331;
	bh=xEKp2DSh6Cy/POePnOFuqOBvNOmMnmN3Jyldv9mhR4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FqaphBUYz3K7XXL6pM9rWyHbso93NkFRu3wMlhIh4dQ8dIr1WAB9JWPMGswSSEl7V
	 kW4h2Z7mslIo6TVKn1XGV4Ap8SNtXCGkX4YgC05y2A+0DQH+pmN4MT7z0pqMzPNvRm
	 inM170kpZPZ9DeXxtSgEPiECnL+CUEUFe63CVl0RbKu3pBrxFL1HOZcMlUefQCsWPM
	 boNGEJ/eHkUOIgQ0vFkWoeIY/ElIfq0ZZQxC9QthI1iBblwO89XN8LI2hqUOl7MrAD
	 Yhkfa/ut2KQHlZ84Aab3hUbOnOG8PrJy0kzlTMBDnoZvxO9XA8oqpds4GDsLVcRisJ
	 LhMRSluURMY7g==
Date: Mon, 15 Jun 2026 16:02:10 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: pinctrl: qcom,pmic-gpio: Add Qualcomm
 PMK7750
Message-ID: <178155731026.1668856.13949680393199336333.robh@kernel.org>
References: <20260612090426.23403-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612090426.23403-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38511-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:abel.vesa@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:andersson@kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3CA7F68A17E


On Fri, 12 Jun 2026 11:04:27 +0200, Krzysztof Kozlowski wrote:
> Document Qualcomm PMK7750 GPIO used with Eliza SoC.  PMIC is almost the
> same as PMK8550, thus compatible with it.
> 
> Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v3:
> 1. Drop stale pmk7750 from main enum lisrt (the big one) - leftover of
>    previous version
> 
> Changes in v2:
> 1. Add fallback compatible.
> ---
>  .../bindings/pinctrl/qcom,pmic-gpio.yaml      | 151 +++++++++---------
>  1 file changed, 78 insertions(+), 73 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


