Return-Path: <linux-gpio+bounces-39625-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tHC2HF4HTmqzBwIAu9opvQ
	(envelope-from <linux-gpio+bounces-39625-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 10:16:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 000407230C7
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 10:16:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=n0MFymXY;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39625-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39625-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7891F300C007
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2026 08:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D53C3FFF9D;
	Wed,  8 Jul 2026 08:16:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E13D3AB260;
	Wed,  8 Jul 2026 08:16:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783498587; cv=none; b=scmZ3nnBeACnRx8sA50QFfZpXFgfsf2uyBLObjnO0pr4rBUQviRYTdGmYwW5N7BUABFpqajFxqQfx77aHSYxtenKTEbVWYwOMRDgJPN0j0gdF4zSQ78gxFMXbKGA2aOyn7dsrLm+vJQLdnMerQvIzRS2fz7wkCYKy/t0bUaWCSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783498587; c=relaxed/simple;
	bh=Y2krJb7C0OgCA9sS5ptXPw6N84h4QPJRqHYbomv+/JQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aegU76EXoeCZ2ZvGIyXUgIY9B0NUWzDqjCk+S+diJH7SCwFvz8CZdTfc3pYZPjs4SzO+ju6HgH1P4BdklOWa1xsrdAZvfQ8QWL3xHjGT0ZOdPkyIBeBPSIU9VdRItOz1rD1IXWS/Tm1h2T12LVddQKkTzvmW5M+y7YveBHIApyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n0MFymXY; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5101B1F000E9;
	Wed,  8 Jul 2026 08:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783498586;
	bh=hoiMUfefIhO/22z4j/RgowkVzpgWaSO743dDSJkhiCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n0MFymXYZZ0jS7v+5t2t+hCR/lXLM4YqFOLdgP/saTZo6cFSxmGXL1WcMxAjYan1S
	 7CQH17anrzKsY0JUZ9rpJD2C4Tmel7FZQmxCDAFWmL2uOA3axxRRjDr6cnzt2r8jTR
	 8ghLgWPSXkztRp0Kk4ToF42x6QEUAkCSr46WYXE/woToUFsEdB4KCzJMuL3iU+R4OO
	 nJnRzOd8ZtTwTYpoZgWFa0dDYWfO3MX45OcACsOhqMAE4SsaSBlUfQKnxRlpC0YlcV
	 UId3uIo5PXmjAJ00OuFNzyuvJw/hk6Y7Tnl+VC0eXhA+rwMgArAis6nlVHpdNW7PKE
	 Rpu/Vcv8rsGzg==
Date: Wed, 8 Jul 2026 10:16:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 02/12] dt-bindings: soc: fsl: qe: Set #interrupt-cells to
 2 to support interrupt type encoding
Message-ID: <20260708-spider-of-hypothetical-refinement-f7fbc3@quoll>
References: <20260703-qe-pic-gpios-v1-0-6c3e706e27dc@bootlin.com>
 <20260703-qe-pic-gpios-v1-2-6c3e706e27dc@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260703-qe-pic-gpios-v1-2-6c3e706e27dc@bootlin.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:paul.louvel@bootlin.com,m:qiang.zhao@nxp.com,m:chleroy@kernel.org,m:tglx@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:thomas.petazzoni@bootlin.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39625-lists,linux-gpio=lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[nxp.com,kernel.org,linux.ibm.com,ellerman.id.au,gmail.com,lists.ozlabs.org,lists.infradead.org,vger.kernel.org,bootlin.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,bootlin.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 000407230C7

On Fri, Jul 03, 2026 at 03:30:10PM +0200, Paul Louvel wrote:
> The QUICC Engine port interrupt controller can be configured to generate
> an interrupt on either a high-to-low transition or any change in the
> signal state on the related GPIOs.
> 
> Update the #interrupt-cells property to 2 so consumers can encode
> interrupt level information.
> 
> Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
> ---
>  .../devicetree/bindings/interrupt-controller/fsl,qe-ports-ic.yaml     | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


