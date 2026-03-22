Return-Path: <linux-gpio+bounces-33987-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4I/NK6ZzwGmiHwQAu9opvQ
	(envelope-from <linux-gpio+bounces-33987-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Mar 2026 23:56:38 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A7E2EB19E
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Mar 2026 23:56:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6308F300A127
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Mar 2026 22:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50AD637F734;
	Sun, 22 Mar 2026 22:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sYfyquHH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105A436C9D5;
	Sun, 22 Mar 2026 22:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774220193; cv=none; b=DCFid0RMxLxDf/WN3yr1JjJB3lik+3j8fZ1r3i/Q/SFtSfF4bG07OQwt3iex0vPYoPyHinPPr++HC4CocAzL7/2892VkSkjj1mfBzKBayx62tQQeN4wi+X7Htq65cmhNZQh9s4SEe3AdimV83xZMCAhOSkUM6h7ZPnWpQaQ72t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774220193; c=relaxed/simple;
	bh=oCbRxSNH1GuDwX+8hbSmIUfP9Ox64Oewx5GCbypmbrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AuXCKeS8FPHPj83KL4YTuIoxBz/Cflvg3DtBnHO/MFqzEsziH0y39y6tvB3eu5DGqs6Oipjt5s9PK4dc+/RmC1lqzu5beqdRS3FlunKSNDwbJ8Dmae3OTq5puK3ZhcqOqYzfEM5NyYiHaQdiU9wPTWXP58RbgRfwC4yOXUeyGbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sYfyquHH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7458DC19424;
	Sun, 22 Mar 2026 22:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774220192;
	bh=oCbRxSNH1GuDwX+8hbSmIUfP9Ox64Oewx5GCbypmbrE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sYfyquHHkQAVCrmwdtiaYpNhgK08pwTkqNMi3BlSAhMeQRwoQ17Kds49Lg/OGqmCL
	 SWCjyCpgWftnu/AWJvxj/64iOQS+iQz1qj7oSPQSXyYP8N1iRfaPBeKrZykMD8KBZK
	 mkF7FsdOUiwBjsTf7fWF+ZgCMadBvYaRAvl1ev9b/BYnFRNBNcxfCIr1Rl6/jADjGx
	 j34+fk2qe+PBJpLOpC6vqhskMkZ0O4ZGlPMBBkNGV3nuAB1A8VXFhUcbvBO/XmYIiD
	 T2k6JGgykJ98veW45UkW9VvkpLVAcTcn3UDeVqBUaQaaZRXr5CDguRkflSGm/UcPJc
	 9aEQ8oHR7u8pw==
Date: Sun, 22 Mar 2026 17:56:31 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Palmer Dabbelt <palmer@dabbelt.com>, devicetree@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH v13 3/5] dt-bindings: soc: microchip: document PolarFire
 SoC's gpio interrupt mux
Message-ID: <177422019104.46273.4844839015391961546.robh@kernel.org>
References: <20260318-gift-nearest-fd3ef3e4819b@spud>
 <20260318-whisking-steadily-91b2497f6fb9@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-whisking-steadily-91b2497f6fb9@spud>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-33987-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 14A7E2EB19E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 18 Mar 2026 11:04:34 +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> On PolarFire SoC there are more GPIO interrupts than there are interrupt
> lines available on the PLIC, and a runtime configurable mux is used to
> decide which interrupts are assigned direct connections to the PLIC &
> which are relegated to sharing a line.
> 
> Reviewed-by: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../soc/microchip/microchip,mpfs-irqmux.yaml  | 103 ++++++++++++++++++
>  .../microchip,mpfs-mss-top-sysreg.yaml        |   4 +
>  2 files changed, 107 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


