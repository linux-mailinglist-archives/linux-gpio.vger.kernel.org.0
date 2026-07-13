Return-Path: <linux-gpio+bounces-39943-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CYOnJliRVGrMnQMAu9opvQ
	(envelope-from <linux-gpio+bounces-39943-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 09:18:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 00100747F1C
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 09:18:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=nHFyHMkJ;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39943-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39943-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 231E7303432B
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 07:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B305B371D1F;
	Mon, 13 Jul 2026 07:17:34 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B2036F8F0;
	Mon, 13 Jul 2026 07:17:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783927054; cv=none; b=u94Pjl9gO0KZ6TT69SQNT6sAHUz/rg8w2qwWGmrRT9VzfAu2140NLI8fnF1opnT9L7VnIn5qafPGldhLQkabAie1UIytYgYPLl9H8DGk7yuClP7igdDqhKPEyTHRYk7/QnJAXASBHLYh1TYFjLz0pnkl2ze+mv7TmtGDO3GUTOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783927054; c=relaxed/simple;
	bh=vyybhEh8PKk3vyT4oI4jCm9a19ruelsebq4ZoJG6dJ4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YuuzcVrUqZgI9CUcTmme37QPWLbiW2CcL1mA/n2altGuV7kwPvXx9xrUevMrCObHcPdaJTAhp95atE/pacmpu2CWP26RBblrGNWWDo+bbmenmqgqcZ+WiGRxOfi4g4KOdxx/7PEv4zhHoXRhh+t6SPj9J/ogdvluDmd6bjS1H5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nHFyHMkJ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1C491F000E9;
	Mon, 13 Jul 2026 07:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783927052;
	bh=/AAvWdg2tf7XP0ClRJ7QU4XdfQ70zfzUpBK5iJU8WwM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=nHFyHMkJP2WBYIOdOxc0UBT0Ihj/u5mg9JK7iZbPdOZcBPMx9K92N7r6UHN2pXRG6
	 TsiD0GeqmCY7B79z0R4GUEkqis1tasFpHsNuBr9LisGw4Ao6Ukos5MYagXHVnM315V
	 Ma6h8YkqIeT1O8GKOGJIWId2ZiM35RcjJxGXpwXDx0qitUOS8/D6U1T3jttFYYXX9h
	 LbY2psslNEOJGn1cAVKD96rO/K4KAIIsj5LaW9fcbi6XQhuYCnwGZA/2xnuh3esJ2e
	 MCgdqC4U3n2YZL9dHTsogxBNYYRCRLyeBQATWMGsD74DAm/bXf3goK6Nzv6BMRAiYV
	 5PEyeo4rWMj4A==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: peter.griffin@linaro.org, robh@kernel.org, conor+dt@kernel.org, 
 linusw@kernel.org, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 hajun.sung@samsung.com
In-Reply-To: <20260627171228.2687857-1-alim.akhtar@samsung.com>
References: <20260627171228.2687857-1-alim.akhtar@samsung.com>
Subject: Re: (subset) [PATCH v3 0/6] Add minimal Exynos8855 SoC support
Message-Id: <178392704864.26180.1741165766885448528.b4-ty@b4>
Date: Mon, 13 Jul 2026 09:17:28 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:peter.griffin@linaro.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:alim.akhtar@samsung.com,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:hajun.sung@samsung.com,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-39943-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 00100747F1C


On Sat, 27 Jun 2026 22:42:22 +0530, Alim Akhtar wrote:
> This series adds initial support for the Exynos8855 SoC and also
> initial SMDK board support.
> 
> Exynos8855 is octa-core CPUs, a combination of Cortex-A720 and Cortex-A520,
> arranged in 3 clusters. And other peripheral for mobile application.
> 
> This initial support consists of CPUs, pinctrl and related nodes
> needed for initial kernel boot.
> 
> [...]

Applied, thanks!

[2/6] dt-binding: pinctrl: samsung: Add exynos8855-pinctrl compatible
      https://git.kernel.org/pinctrl/samsung/c/8e8bad1e2ab599174c21dd2d0ba6fcf5f82dafa5
[3/6] pinctrl: samsung: Add Exynos8855 pinctrl configuration
      https://git.kernel.org/pinctrl/samsung/c/d441836c9d704d0f3db5dbf44df87af2ba7a9d26
[4/6] dt-bindings: pinctrl: samsung: Add exynos8855-wakeup-eint compatible
      https://git.kernel.org/pinctrl/samsung/c/7cd3475913736239696e0111d4d5845d9e0a79b6

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


