Return-Path: <linux-gpio+bounces-37214-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kC/FNHrfDWro4QUAu9opvQ
	(envelope-from <linux-gpio+bounces-37214-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 18:21:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C22B0591C4F
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 18:21:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2B27D3044E33
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 16:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ECA0366DB5;
	Wed, 20 May 2026 16:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UAbLHAkM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE961363C74;
	Wed, 20 May 2026 16:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779293985; cv=none; b=ezHEGR6wsKvJYCPCBn04ldEEYo5qK7CecGP9O9YIM2HzpyBDjEamfU5ZXUUk+txSYJaDZU0vBn0meQZbdTp/CZwxi09re6Az1AnIkBXjVV3sVF0gu8evOfB+ZOxYZC8gjFLOAYVbhBCf+lYXvHAnKPiJ7KzXZtbjpr1ENepqNlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779293985; c=relaxed/simple;
	bh=y3IJJel2SV+elLnTl1LRAbl2jRHC/FhsFh4ElCymLb0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eJZCVXVBfrJzu5wL7FgexSAtygn5qat9GyaYQcW/0fi8kzmoTfB9es6Nrl7sORSTJTb5TM5e9eE2TGP5t3PdcfPGlrmtZ9mEJdT5dPYBE4Qs7Cs//g2qkBYHAmJ7GyeVHChS6IXk47GsHu5KRaL3bzg/ELYuhjgBC4VzO7bnKck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UAbLHAkM; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 028501F000E9;
	Wed, 20 May 2026 16:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779293984;
	bh=lcFr4GXWcFgpdMsR0YpSiDmQfe7WFM8ih6yZ4Ym8toU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=UAbLHAkMzuHKyLBGmWUbQOs1aRHHDL4buL7lBKmWTcjjvxVBgQPLHprxAqsF0xcVC
	 bGKFfJBqOhqCGgDyy+ZeE7Cvs3/zqfwhfMtvgQBpaYOLpMsWhSUkr+inXRso39D2HH
	 35afQ8qh3ik7eBX1qIVmbWCfUOycl8BqgtCseG9AZXKUZsSnFUUAkYlal+px4JYbNB
	 yzc2vR7biGKHAB8QCHN1Egl9918+SWHhSvHDg/HFiIQFrkABXa22NhBJvwkquF8R7h
	 N1BGOkdt9V5etiW5CXhwg2li86PjrDc9/rsXD8e+8gggRh/MA2+WG9weLIL+uonrdH
	 bn3+qSLtmsw0Q==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
 linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260506-upstream_pinctrl-v9-2-0636e22343ad@aspeedtech.com>
References: <20260506-upstream_pinctrl-v9-2-0636e22343ad@aspeedtech.com>
Subject: Re: (subset) [PATCH v9 2/3] dt-bindings: mfd: aspeed,ast2x00-scu:
 Describe AST2700 SCU0
Message-Id: <177929398073.2887671.10050314935691000480.b4-ty@b4>
Date: Wed, 20 May 2026 17:19:40 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37214-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C22B0591C4F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 06 May 2026 16:06:19 +0800, Billy Tsai wrote:
> AST2700 consists of two interconnected SoC instances, each with its own
> System Control Unit (SCU). The SCU0 provides pin control, interrupt
> controllers, clocks, resets, and address-space mappings for the
> Secondary and Tertiary Service Processors (SSP and TSP).
> 
> Describe the SSP/TSP address mappings using the standard
> memory-region and memory-region-names properties.
> 
> [...]

Applied, thanks!

[2/3] dt-bindings: mfd: aspeed,ast2x00-scu: Describe AST2700 SCU0
      commit: 0aac47aa41a1f73752fe3993526494c6df013eac

--
Lee Jones [李琼斯]


