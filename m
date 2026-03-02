Return-Path: <linux-gpio+bounces-32367-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEB3EVBSpWmU8wUAu9opvQ
	(envelope-from <linux-gpio+bounces-32367-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 10:03:12 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 454B91D5307
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 10:03:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1D19C3004053
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2026 09:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E19D383C8E;
	Mon,  2 Mar 2026 09:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="D9PYJG/1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EFF32AAA7;
	Mon,  2 Mar 2026 09:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772442184; cv=none; b=GBLCyc4Km06MW0v3gGpc7yKKuiaauLA4yBHO9kWY09CHxFlMQwp8t6+yFRVF2cRWdBOdflLzD2AvJMGLetOMIKTZ3F9ff+0xHcMKcjhI7bnvIRuM2CvkLVPRpCoh/9kcyY/i/d6n1NTREb8RJGk5TIO6a3zYm1EdcH4hlKWfM4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772442184; c=relaxed/simple;
	bh=HqDGFp+UYqI/mx0bI5p+bcmqtOa2Q99aQWYKS/JmNBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wokcoanj1rnCwEtal6wy+/hON5MMAeBkYWb0Te7uCZp+IeXmocj3tII0IB5Rq4qM/iUy+3e+Dv+tDCYYTGOVSIUQuwaknICXJnf1NNf0z2xjc+9ZpKGtbFWuCYbeys85nj8EcF+PHmtWM1HUc+WJFEcenyAmtGSI/GK1gv/oIVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=D9PYJG/1; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 787A3C40F8A;
	Mon,  2 Mar 2026 09:03:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 553CE5FE89;
	Mon,  2 Mar 2026 09:03:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5C63210369474;
	Mon,  2 Mar 2026 10:02:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772442180; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RbOLWapj2Sdu5RKu4bV2/ciyBZZjSU315sJ15hiTWUU=;
	b=D9PYJG/1SSdEjAptVAwMp3G+jvjqTqCNWcoMr2pQlvogqVdd5LE62pA89peIHNMpBw3VBL
	5a5KNQ2tpppodSS0XYV0ru+HxxzVbvSDXel0My0S4n28S5YH10x5HKnw9gPQ1kZ2cY6PjM
	ZlIe3xdcHYBxaaQuWxX7+i7EiqsrZfH0HR4jZ6LsIaYhYwEYJ8Fan9Whncyr5tSDiSV17Z
	kIlDFT5DeFj9iE6pSM7j0/inUdO9oabjUy1ZM3z96hVH7poCcDY4KgaNdAcR73NuSOZO/7
	fw3vbHmTNJpjFNHjSm3+Asv16Cld7n4s0DoKql9W14ARwoBo6+eiwLh3jsNDvw==
Date: Mon, 2 Mar 2026 10:02:55 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Thomas Gleixner <tglx@linutronix.de>, Daire McNamara
 <daire.mcnamara@microchip.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC v11 2/4] dt-bindings: soc: microchip: document PolarFire
 SoC's gpio interrupt mux
Message-ID: <20260302100255.5d9639b1@bootlin.com>
In-Reply-To: <20260227-unbounded-disposal-dcac091b8ec2@spud>
References: <20260227-ajar-wolverine-7ce1ebd79821@spud>
	<20260227-unbounded-disposal-dcac091b8ec2@spud>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32367-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herve.codina@bootlin.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:mid,bootlin.com:dkim,bootlin.com:email,microchip.com:email]
X-Rspamd-Queue-Id: 454B91D5307
X-Rspamd-Action: no action

Hi Conor,

On Fri, 27 Feb 2026 14:52:28 +0000
Conor Dooley <conor@kernel.org> wrote:

> From: Conor Dooley <conor.dooley@microchip.com>
> 
> On PolarFire SoC there are more GPIO interrupts than there are interrupt
> lines available on the PLIC, and a runtime configurable mux is used to
> decide which interrupts are assigned direct connections to the PLIC &
> which are relegated to sharing a line.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé

