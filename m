Return-Path: <linux-gpio+bounces-39944-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id el1HFvSSVGrJngMAu9opvQ
	(envelope-from <linux-gpio+bounces-39944-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 09:25:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE097481D9
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 09:25:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=WDUzqBkr;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39944-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39944-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E36EA3028E96
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 07:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4872F36D9EC;
	Mon, 13 Jul 2026 07:21:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D95369208;
	Mon, 13 Jul 2026 07:21:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783927267; cv=none; b=J026giuZV8ag1XjyasCJiRFtZu+E8rIWGdWYbGcfuidntBePkHWbRWIlX9Q6H4GEfj99xPhqn+7FG6a5qZHUL3NJxfvfZAN2hFNqiWxxJJFBizueaNfHULwQvUbuwaVSajnW++AR9Vakj0lICscutPW57ELJVoyUw56nYlNd8g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783927267; c=relaxed/simple;
	bh=bh+yWpaolJOY4sNtQpKR1RIVMCXF1XcI2rvHN1xdAFE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=F0S6+6rwao0cX2WAngDMw/21WYDF4AxvWH8FxtxRisKxusSIchO0ECNnSLYCJ5vQ0bItCZukJD6mC5QKLxS0NftVFYao9BJOcPaLKY+jgClf46Du81MJ6JxqPCND0M/osXenkggkEEeUA4qoELISV+O8/tafNBZYhrIUuwT+Yyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WDUzqBkr; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11DFA1F00A3A;
	Mon, 13 Jul 2026 07:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783927265;
	bh=9kh43brSP66vzmTm95XDdhXt8cQARCKIA1zAbg8pOVM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=WDUzqBkrtCpK6dx62PadWwp7PdY5wC7lf0VjbjmJK4tvqJx75MzyAy0mZqQOcOjdI
	 aCn7dPFajLxErrr+E9spI5pjB4T8pE8nNrqjP0c/Bwv4Ky3f37mhUu/rikPQ6tzWKM
	 WDU0JAU4t4AJSzjSGFEm/y5uekRIs5mwyGhPQFqUivv1ED97uD8VaJeRlZzTR6/mv3
	 yFy2oBa9iB/ufr+aGIplCjWMumy6f1qHDS7EySrxExjixdVCABjq0+Y/OOc2pmkfXQ
	 mazTF43ahrtGVU5DJA3YnNii5uCWbgi8ZhrcRchZY/HUqXbpzq04atSsniG9pkl6oi
	 q7VTkZyLPCX+g==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: peter.griffin@linaro.org, robh@kernel.org, conor+dt@kernel.org, 
 linusw@kernel.org, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 hajun.sung@samsung.com
In-Reply-To: <20260627171228.2687857-1-alim.akhtar@samsung.com>
References: <20260627171228.2687857-1-alim.akhtar@samsung.com>
Subject: Re: (subset) [PATCH v3 0/6] Add minimal Exynos8855 SoC support
Message-Id: <178392726162.27536.18104050175290327938.b4-ty@b4>
Date: Mon, 13 Jul 2026 09:21:01 +0200
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
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
	TAGGED_FROM(0.00)[bounces-39944-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DFE097481D9


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

[1/6] dt-binding: ARM: samsung: Add Samsung Exynos8855
      https://git.kernel.org/krzk/linux/c/4b4a2ce19af5badef165c109d0d6d9f7c102914a
[5/6] arm64: dts: exynos: add initial support for Samsung Exynos8855 smdk
      https://git.kernel.org/krzk/linux/c/f03058d3768c3ec4af0fab7a36d0631423cb3cf5
[6/6] MAINTAINERS: Add entry for Samsung Exynos8855 SoC
      https://git.kernel.org/krzk/linux/c/a87d503a0ab077b0d9892290ab7dbec29f922eb1

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


