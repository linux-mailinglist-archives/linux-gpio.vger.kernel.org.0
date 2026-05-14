Return-Path: <linux-gpio+bounces-36853-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJSrBofbBWomcgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36853-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 16:26:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE835430ED
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 16:26:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C1E33161E16
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 14:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0F65413222;
	Thu, 14 May 2026 14:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XkEHt8uW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DA63C3795;
	Thu, 14 May 2026 14:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778768008; cv=none; b=PTrNGJopReBMfBAidsvxBwEcL1GGhQRRfkFQMsXpwCPKUOitqI3GTSuxWBhpRzaifSX+05EOQYSrI4mMq7KcVyhYYruTWeyvbq8l89WBgaAxSEMiCbVpNQj86yb4/9IGU1qwKgLF3e+3X2CrMUiDqzz48AF1+7vCRx/JyB9iUz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778768008; c=relaxed/simple;
	bh=vecM+NvydGm3n5aPBbo+HzeFwabzmwcQucOYFjvSKhg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kwjCRzThnwefPdKeteG2ClmP5uvai4FTyAVEAsaubauB2YSw6YDcqIRqB0SRSX0sQi8nhXb/+OxWhNFXqLhWwJL1+bL/mDh2Kp6LLDtXdcz7o5V1FmZcabHGcLbjgL1wFmGvP7hpZYTp9cbV39igHnuEedEaKesT056qxLF97z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XkEHt8uW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8635C2BCB8;
	Thu, 14 May 2026 14:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778768008;
	bh=vecM+NvydGm3n5aPBbo+HzeFwabzmwcQucOYFjvSKhg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XkEHt8uWWQKSBKZ28HG2MVM7OP5TcnsspKmi+712eDUBP08VVTF3q7cwbdL7vIDrL
	 P40fcVGnciFBb/xwmE+oj6q3lT4AGb/EwNz8qhuKp7AcviwDM9s/NqKv5OThLSZCqi
	 IHur3CiTebWzCJOq5EeAjzhZEs8uHJT5Qaav0rrqVsslds8y+y5gVGaKlwbDf5bO/9
	 etsbVV3oJG08NkrhZ5YkrLDojMKCL8Tfv+EGQH2RZjPeNXbJf3EfJX+Lqao/QtqF1H
	 2FSn4NyD+u4CVGU0G49LIMN0wOus1x0FawEKPtAVg6wbPCjbnWFNBkcqcvTP65RUBE
	 hdfoMDt2mAI7A==
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
In-Reply-To: <20260428-upstream_pinctrl-v8-2-eb8ef9ab0498@aspeedtech.com>
References: <20260428-upstream_pinctrl-v8-2-eb8ef9ab0498@aspeedtech.com>
Subject: Re: (subset) [PATCH v8 2/3] dt-bindings: mfd: aspeed,ast2x00-scu:
 Describe AST2700 SCU0
Message-Id: <177876800455.2774299.12102353346237716077.b4-ty@b4>
Date: Thu, 14 May 2026 15:13:24 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
X-Rspamd-Queue-Id: 6FE835430ED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36853-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Tue, 28 Apr 2026 17:49:46 +0800, Billy Tsai wrote:
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
      commit: 821fe4172d2a220278d6d279b695b3e299c1614f

--
Lee Jones [李琼斯]


