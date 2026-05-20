Return-Path: <linux-gpio+bounces-37208-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMrBCCrKDWo33QUAu9opvQ
	(envelope-from <linux-gpio+bounces-37208-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 16:50:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9195900F6
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 16:50:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A46831979EA
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 14:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 591DD3ED3BA;
	Wed, 20 May 2026 14:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MEYFAo/s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEF7272E61;
	Wed, 20 May 2026 14:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288214; cv=none; b=EwuM5U1KpXIIWhVQtdM2UHd1lEtkkT6IJtP8PPkSQd1JHRyr3o3WBferqdwAVyyBJj/orCczE4L3tsqpYpOZNVt3NZyBTXrzhppYa/iuSFuAsKq+w+Qm6bIHPnb4RYsA6K3lw9Ox8f0GyJel+b/tHqNxw1LaJQTL0THOK6AyKDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288214; c=relaxed/simple;
	bh=C78k4C1+t/CRfddPyFQ2Rl+kG8vf7Tb76KfkXjAEprU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HcTVrI7WYI5CsrsrEBDEreQGZIXkAu/7cwGSA15WM3iQ0b93hobb2sTzyunUz/o50C0nqOddMNVB88dRwMmlBzPbHhjuJzCzmqLEq/jRjngHqaQ6OK1amoWIvcrgEYu2kYNGAAoFo8qDi7wQ4DAaCGa+E+T0tRGb3ZTJkdYrJuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MEYFAo/s; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43DE61F00893;
	Wed, 20 May 2026 14:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779288212;
	bh=dQbuftW1Dswfh8UjRtvt8jMWgNKtgGpobxc7mm/y8M8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MEYFAo/sifgemFgE3i2c/qG0t36EfY4Vm8VA6haQyEKuAPOKWhwYAvREwF30EcIJ+
	 idMTk38KIuZ7UmRhX+7E4W94DWidnrTjobRmZVjvFtR739eHNPepO0YSa3z7LTCIEs
	 EYg5JEAqiduiOsJ//BLw58uKmr7rOk8ELb4QbsnM3nYDfcdEdnORaid5pl2iBg9uVV
	 vFp1JA07vMb2hpQgqfHIUjpq3C3CZrKTF1zPE0sHjuyaTi9fDOZ/cKT6Aj1lVk37OR
	 Rs8BoDIFlxaSenFjEnsmQcofS8cRMab87wKT/ix8M5OmV/RX4u8tLOeDk/okJc+6C4
	 xuRPeJx8L88/g==
Date: Wed, 20 May 2026 15:43:26 +0100
From: Lee Jones <lee@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Billy Tsai <billy_tsai@aspeedtech.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v9 2/3] dt-bindings: mfd: aspeed,ast2x00-scu: Describe
 AST2700 SCU0
Message-ID: <20260520144326.GE2767592@google.com>
References: <20260506-upstream_pinctrl-v9-0-0636e22343ad@aspeedtech.com>
 <20260506-upstream_pinctrl-v9-2-0636e22343ad@aspeedtech.com>
 <CAD++jL=3p9BvDgaot3=emM4Zn5jU-ZAUKtB4UwT1HzDiyzKq4Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jL=3p9BvDgaot3=emM4Zn5jU-ZAUKtB4UwT1HzDiyzKq4Q@mail.gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37208-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,aspeedtech.com:email]
X-Rspamd-Queue-Id: 9D9195900F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 11 May 2026, Linus Walleij wrote:

> On Wed, May 6, 2026 at 10:07 AM Billy Tsai <billy_tsai@aspeedtech.com> wrote:
> 
> > AST2700 consists of two interconnected SoC instances, each with its own
> > System Control Unit (SCU). The SCU0 provides pin control, interrupt
> > controllers, clocks, resets, and address-space mappings for the
> > Secondary and Tertiary Service Processors (SSP and TSP).
> >
> > Describe the SSP/TSP address mappings using the standard
> > memory-region and memory-region-names properties.
> >
> > Disallow legacy child nodes that are not present on AST2700, including
> > p2a-control and smp-memram. The latter is unnecessary as software can
> > access the scratch registers via the SCU syscon.
> >
> > Also allow the AST2700 SoC0 pin controller to be described as a child
> > node of the SCU0, and add an example illustrating the SCU0 layout,
> > including reserved-memory, interrupt controllers, and pinctrl.
> >
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> 
> This is an MFD patch in the middle of a pinctrl series, I think Lee
> should apply this.
> FWIW:
> Acked-by: Linus Walleij <linusw@kernel.org>

Already applied v8.

-- 
Lee Jones

