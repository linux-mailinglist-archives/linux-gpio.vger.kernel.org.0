Return-Path: <linux-gpio+bounces-34481-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEA/H37Jy2lXLwYAu9opvQ
	(envelope-from <linux-gpio+bounces-34481-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 15:17:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C56A36A17D
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 15:17:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 425EA3037C06
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 13:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E341A3E3C74;
	Tue, 31 Mar 2026 13:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d0/Mp2KD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42A339A06D;
	Tue, 31 Mar 2026 13:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774962929; cv=none; b=srjV8E0AWxxuyxHROInaO7uFc8QlSj2TDRGK9eZ1qAE/axRrjgV7awZQh7n4bz1Ut5+QoAtLvVBFUEYKl+fzBckAtyxwhJdJdn90qKcIUPj3KbAEhd6+5NU6vH2J1Omf2uOojfoj8eUjsQYvnR4NKOQs4P+6o8bbWs0AkEiFUds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774962929; c=relaxed/simple;
	bh=N9U9Gngl2zsYLg9hbnhmxsUnpHqzZ9ArTNxcIheBEMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tgEXH6GLfG2Bkbd51l1jRWQKnmhuw/rT0oB0YfhUwsKAcCMV3IwJmXuZ6s1WFu8Opm/iJ6qL98ThlFgfKfdOlA/6l54eJ1qd2o0bR9BTBlqym1XHUM/y2Ki2M8lLgEmYkpeSW83cUcYfv4iAgcILSDzNUjCw1b4C6AGUI7LUp28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d0/Mp2KD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CF33C19423;
	Tue, 31 Mar 2026 13:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774962929;
	bh=N9U9Gngl2zsYLg9hbnhmxsUnpHqzZ9ArTNxcIheBEMk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d0/Mp2KD1+SHhoVMmrPN7U0nPS3F0FXhLKOS51MQIBpNEs56cUwq+TeQEtmlygyQ+
	 DJ3zr2CpPvwUmg0UCIqwuG+HfsTk4+GzxclYkcPVpZMJc5bexA/1AU2MzFoayWqrD3
	 qCzf8WTfD7Ruzgwp6x3AZcfTOkMI5Y116/bZK6KmdDK5rcLz4vDACGjymqnw8yIhlP
	 feN1Qot7CeMRe0BcM+wTI6QPuBQ1XYjvEvNnuQO/ZAC/t3sGoiwXCYJn7URmQR8OUK
	 71OMK1JEAzkD+pACUks2m+NvWKTsL0xiL3NzTSqBrkH9uajFshQKTIFLvymSDsBrvU
	 lN3vEKEBLDHog==
From: Conor Dooley <conor@kernel.org>
To: linux-gpio@vger.kernel.org,
	Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>
Subject: Re: (subset) [PATCH v13 0/5] PolarFire SoC GPIO interrupt support
Date: Tue, 31 Mar 2026 14:14:45 +0100
Message-ID: <20260331-dominion-conjoined-c87ec5bc7db2@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318-gift-nearest-fd3ef3e4819b@spud>
References: <20260318-gift-nearest-fd3ef3e4819b@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=784; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=La/xA4DusqX4r/5LF/aVUUmPtgQGBCIF7OcFbPPMG+Q=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJmnTxw5+OC3SizjVmlzhoLCtucfPfkFH//arGZYeIo31 mbLsUCvjlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzk+hmG/8m2+VuqLtxNOVF3 UFnw4EzGrYZGZpktV6frTLty/eLaqTcY/gedUD/iOK21dPvmzM962q0Cb4O0wqbtlen4GJW8oen hHkYA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34481-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6C56A36A17D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Conor Dooley <conor.dooley@microchip.com>

On Wed, 18 Mar 2026 11:04:31 +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Yo,
> 
> Here's a v3 with an extra patch updating the gpio binding from fished
> out from my old branch, fixing the examples and setting the permitted
> values of gpios for the controllers on polarfire soc and the existing
> binding patch's example fixed.
> 
> [...]

Gonna interpret the ack and lack of response to me asking if the gpio
change was mine to take as it being the case.
Applied to riscv-soc-for-next, thanks!

[2/5] gpio: mpfs: Add interrupt support
      https://git.kernel.org/conor/c/e57b53f0f36a
[3/5] dt-bindings: soc: microchip: document PolarFire SoC's gpio interrupt mux
      https://git.kernel.org/conor/c/5f3575cc73dc
[4/5] soc: microchip: add mpfs gpio interrupt mux driver
      https://git.kernel.org/conor/c/bd34cdd6d214

Thanks,
Conor.

