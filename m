Return-Path: <linux-gpio+bounces-33986-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMGQBrNywGmDHwQAu9opvQ
	(envelope-from <linux-gpio+bounces-33986-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Mar 2026 23:52:35 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 880082EB17D
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Mar 2026 23:52:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7FBE43008533
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Mar 2026 22:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F16C237F017;
	Sun, 22 Mar 2026 22:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tWacZ4Q2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B454B32BF42;
	Sun, 22 Mar 2026 22:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774219949; cv=none; b=oMNfM6h3Vz5biSF/jfZJg/WDrh5JY453rJDKnsZmHH2uW4cgwrLkQC26htUEnwIHl8s+RQ0XMUu/oyJc4gygv3LHHfjm4P5RgtCJZ9/ITIZ4UyZaMk3O1t5WkpqHyoRn8hwocWudNdhBdb3Jg86q9chZln1oxmDhzbPOk2WjvPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774219949; c=relaxed/simple;
	bh=/E0I7SHxfbeMY2aFFQs5bRnGazi8aAt/7tDku6BIrBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IeP60xKvy5ze+6WqpGtL6mK0vcnDNwifpV+tRFW8ejVxvx9FERUHj8RZIUdTSebOAqKYHDY/FR1/4sG3mIooPvGv0/ZghatGXn/Ux05QIb4c1rUXdh4BxoHEgrKqicZ07VvmVDG71PPw6i4tPV3R15TMfDKuDA+30yjsWgZQl4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tWacZ4Q2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F4176C19424;
	Sun, 22 Mar 2026 22:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774219949;
	bh=/E0I7SHxfbeMY2aFFQs5bRnGazi8aAt/7tDku6BIrBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tWacZ4Q2HRu9WdBHT3Qbl+yGMKMpoz3ysKkTq0SJkkAp/ee6vAw6l1ohZxKCr/mKM
	 ksxo6akJ2IIkf/Q9S7o/+Ao9SCkkAJxl966eCTuE7edbfu07l3Slifb9LcV2GrYW8S
	 BetyvETbmo8jnVC8ttebN4BBNnlbOmJC8/ugpzMbF9yh4AK/y+gOGdn0qDH1AvGDde
	 AEwjbsZNnOyj2KRSZZfA4MB8qpUqYHj0qB4pIu7FflbcqqvZjrFPstSvWCEZYvDvml
	 oIDoJ/67f01AwjYH53+RIFVUl+VXdanzuwwHRzti1/0dPnn3ZRPKLDNh4ipM5l55yp
	 wlF95bD5Tevow==
Date: Sun, 22 Mar 2026 17:52:27 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>, linux-gpio@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-riscv@lists.infradead.org,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v13 1/5] dt-bindings: gpio: fix microchip,mpfs-gpio
 interrupt documentation
Message-ID: <177421994732.40940.10998133655165024029.robh@kernel.org>
References: <20260318-gift-nearest-fd3ef3e4819b@spud>
 <20260318-fondly-tradition-90b8241f0cc8@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-fondly-tradition-90b8241f0cc8@spud>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-33986-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 880082EB17D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 18 Mar 2026 11:04:32 +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The microchip,mpfs-gpio binding suffered greatly due to being written
> with a narrow minded view of the controller, and the interrupt bits
> ended up incorrect. It was mistakenly assumed that the interrupt
> configuration was set by platform firmware, based on the FPGA
> configuration, and that the GPIO DT nodes were the only way to really
> communicate interrupt configuration to software.
> 
> Instead, the mux should be a device in its own right, and the GPIO
> controllers should be connected to it, rather than to the PLIC.
> Now that a binding exists for that mux, try to fix the misconceptions
> in the GPIO controller binding.
> 
> Firstly, it's not possible for this controller to have fewer than 14
> GPIOs, and thus 14 interrupts also. There are three controllers, with
> 14, 24 & 32 GPIOs each. The fabric core, CoreGPIO, can of course have
> a customisable number of GPIOs.
> 
> The example is wacky too - it follows from the incorrect understanding
> that the GPIO controllers are connected to the PLIC directly. They are
> not however, with a mux sitting in between. Update the example to use
> the mux as a parent, and the interrupt numbers at the mux for GPIO2 as
> the example - rather than the strange looking, repeated <53>.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/gpio/microchip,mpfs-gpio.yaml    | 24 ++++++++++++-------
>  1 file changed, 15 insertions(+), 9 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


