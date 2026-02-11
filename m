Return-Path: <linux-gpio+bounces-31614-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFR/IpWqjGlasAAAu9opvQ
	(envelope-from <linux-gpio+bounces-31614-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 17:13:09 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F306126030
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 17:13:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BFD413004430
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 16:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64C2333B6EE;
	Wed, 11 Feb 2026 16:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iCrZKtLs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E7933AD92;
	Wed, 11 Feb 2026 16:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770826384; cv=none; b=GLLKidb0gJvUa9fXRFHQzX7aR4cDD9QXhJnM0+mWlAFQ6qpQ/6J3UmpLej5mW3q8KCGTXyRp6VyFE1DKdx1AEAmcjuiOnI3NWBsx4bHLUvy6zj4+DAadYaAniWvPH0TnGA47fL2EdZ1Gqj8e9C8u0ve/aPn0Dru+zf8W0Wr4wwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770826384; c=relaxed/simple;
	bh=8iJls6/Nn0Nnf+3DxmQiylsNiVOG9+OgQ6KqV4bL0hw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WrLFIQuEJLmz19nuyZhjWIWIZVFxAROxyAXs7N4qjr8SaA/L9OHzNPK1D6mvGjAchANPA98Morw19U8Yqhh/23wLqgw8Kx+Oru5tJtKZNAhH9C6VSUmdDStgp0GGgS8FRnceeH3yGp68hH5/0k3Ju8G7O1XTPDCZgtqcfF4MWtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=iCrZKtLs; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 273CB4E40C69;
	Wed, 11 Feb 2026 16:13:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EED36606B1;
	Wed, 11 Feb 2026 16:12:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5630411948F67;
	Wed, 11 Feb 2026 17:12:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770826379; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GLSoznGjK4wXaxCZZX7e0bNRIASf8PQPorLUxjFHDho=;
	b=iCrZKtLsdt3FHzFGi+EOo74a6rYrtDtBb2aFrSyV3NBJsEB8gvh7/rAHs4n1YnhJuKsZjf
	A7t1GeoYC6sv4DNkbbGdMPnuU1huqr1yxWhi6G/c5i/4aT6z6p4vFO0tgfRaVyMAhlcX3j
	ClmK5uqGTyZ5PlVAaHejKLtcQuh6zFDeh1z6aJGtjL9CySBLpmMfGYtFl0oAODlCf87Yeh
	kIKPsCGqwO4wGkmpaLp1OpFY54muV4qh63MmHZpgcqSqW+q14QUDb7c9wBpTNN5mW11Jl1
	Rm/k8lblUU4Q5gpfpCnsZOTHtHBg/7yyzA7Mo79N2XqT9P/S0LvjkIXV5rQZHQ==
Date: Wed, 11 Feb 2026 17:12:52 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan
 <saravanak@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Pascal Eberhard
 <pascal.eberhard@se.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v8 3/8] irqchip/ls-extirq: Use for_each_of_imap_item
 iterator
Message-ID: <20260211171252.34e4e6a1@bootlin.com>
In-Reply-To: <zlgj2xi72amihcs3r3vzifci6hrce7rio4bqx23aet6bo2f624@2qnwemabjlql>
References: <20260114093938.1089936-1-herve.codina@bootlin.com>
	<20260114093938.1089936-4-herve.codina@bootlin.com>
	<zlgj2xi72amihcs3r3vzifci6hrce7rio4bqx23aet6bo2f624@2qnwemabjlql>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31614-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linutronix.de,sang-engineering.com,linaro.org,bgdev.pl,kernel.org,glider.be,gmail.com,vger.kernel.org,se.com,bootlin.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herve.codina@bootlin.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:mid,bootlin.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9F306126030
X-Rspamd-Action: no action

Hi Ioana,

On Wed, 11 Feb 2026 12:03:00 +0200
Ioana Ciornei <ioana.ciornei@nxp.com> wrote:

> On Wed, Jan 14, 2026 at 10:39:32AM +0100, Herve Codina (Schneider Electric) wrote:
> > The ls-extirq driver parses the interrupt-map property. It does it using
> > open code.
> > 
> > Recently for_each_of_imap_item iterator has been introduce to help
> > drivers in this parsing.
> > 
> > Convert the ls-extirq driver to use the for_each_of_imap_item
> > iterator instead of open code.
> >   
> 
> The ls-extirq uses interrupt-map but it's a non-standard use documented
> in fsl,ls-extirq.yaml:
> 
> 	# The driver(drivers/irqchip/irq-ls-extirq.c) have not use standard DT
> 	# function to parser interrupt-map. So it doesn't consider '#address-size'
> 	# in parent interrupt controller, such as GIC.
> 	#
> 	# When dt-binding verify interrupt-map, item data matrix is spitted at
> 	# incorrect position. Remove interrupt-map restriction because it always
> 	# wrong.
> 
> This means that by using for_each_of_imap_item and the underlying
> of_irq_parse_imap_parent() on its interrupt-map property will
> effectively break its functionality.
> 
> Unfortunatelly, I am not sure how this can be fixed other than with a
> revert.
> 

Well, if this is the only solution due to non compliance with interrupt-map,
I am not opposed to the revert of the following patch:
  3ac6dfe3d7a23 ("irqchip/ls-extirq: Use for_each_of_imap_item iterator")

(SHA taken from next-20260205 tag)

Best regards,
Hervé

