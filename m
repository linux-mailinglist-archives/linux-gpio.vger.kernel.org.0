Return-Path: <linux-gpio+bounces-33850-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id G9dPEzQ/vGlzvwIAu9opvQ
	(envelope-from <linux-gpio+bounces-33850-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 19:23:48 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F10C82D0C58
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 19:23:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C4D47300DD7D
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 18:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B42C93F54D7;
	Thu, 19 Mar 2026 18:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RvMfhlDZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744313EC2E9;
	Thu, 19 Mar 2026 18:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773944621; cv=none; b=IN0KeLIDXB8yvtU79afL2V44HHXo27qdAfWusi2A6/4q+ukMHTuQAQkWvUAS6Xe9nOq/oz6693yUzNN2MAEaGKtdC/XYBT6pGNOm6bjDf3N0VFKfxJ2B5ttdha0jEjNQAQy2l4GivT7DyaMZbkvCZeAZ3Q5MHs9HX0OkDF+w3j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773944621; c=relaxed/simple;
	bh=B6ebB/LkkPL6h6P3zLEobxi1daTjkz/u/Q8WHQlgx/A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aDJg0VWunKpOFIq3HCligDd64THiv5sALCnUls0xyyJHCP7qynwyzKT2OrGCl+gwOwfdo5U5MAv14eEXTETizXiqGlUezWITkCuHaVGZ1LbhI7bLkrAub2fXpDyPZu3g1KlFzOxa7L8yfijrtvfOnrOPEsz3nSfKDZ+CUAyGMMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RvMfhlDZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6ECEC19424;
	Thu, 19 Mar 2026 18:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773944621;
	bh=B6ebB/LkkPL6h6P3zLEobxi1daTjkz/u/Q8WHQlgx/A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RvMfhlDZS4jiIzKe+NuiNEs9IglcMeYWKXbNGdAcIGG1DtoMNG2wNJC7Xo55sPcEq
	 QpPQUxvrgv6PXVnji+fMcdtinaujC8Bzg6o0QNtDSsGbNxHbccl+bg0WzBnxXfo37B
	 418R9alS9YtC1mifSd1n4SPbW3uFFQ+gvrwYaJyMDoQgh0cMHA+T/L3SW5u1mDQH4T
	 cfKVdVu+tuGNagPKf6T35w37pH/MjX4w6JmE6hYJNFDVlmUJp+DTTrrGDegNWeakkE
	 NF9ACEOty+Ed2KgQ2NbXAbCSScSPxhUEjEVrtnJYb76xUq1wBNCNYSnOy0I9SqMjBh
	 f+FU3rW0o24nw==
From: Lee Jones <lee@kernel.org>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-rtc@vger.kernel.org
In-Reply-To: <20260312085258.11431-4-clamor95@gmail.com>
References: <20260312085258.11431-4-clamor95@gmail.com>
Subject: Re: (subset) [PATCH v4 3/5] dt-bindings: mfd: max77620: convert to
 DT schema
Message-Id: <177394461661.2972514.17396038867409824051.b4-ty@kernel.org>
Date: Thu, 19 Mar 2026 18:23:36 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33850-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com,arm.com,samsung.com,bootlin.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F10C82D0C58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 12 Mar 2026 10:52:56 +0200, Svyatoslav Ryhel wrote:
> Convert max77620 devicetree bindings from TXT to YAML format. This patch
> does not change any functionality; the bindings remain the same. The
> thermal bindings are incorporated into the binding. GPIO controller
> function in MAX77620 has no dedicated node and is folded into the parent
> node itself.
> 
> 
> [...]

Applied, thanks!

[3/5] dt-bindings: mfd: max77620: convert to DT schema
      commit: 77c8585abf5d7409990b71ba333e839bf4597cb5

--
Lee Jones [李琼斯]


