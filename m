Return-Path: <linux-gpio+bounces-35602-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEidNFqA72moBwEAu9opvQ
	(envelope-from <linux-gpio+bounces-35602-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 17:27:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74734475282
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 17:27:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A5C4A301AA93
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 15:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA75B336ED1;
	Mon, 27 Apr 2026 15:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="tE8BUc9F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D2F334C20;
	Mon, 27 Apr 2026 15:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777303535; cv=none; b=mVDR4AVuWzd7sSEv6R9DXMIH4DppWgQIbWconHQpnprMyFXIfH0pigj1zttZDRyISo1bC8QONhUBQQnIlupH4snZs8NOEZggM5eugDl8kjxYchRyxrjHamB01fheeCLQ/6jjaJu+0VFJUAHVsAYWWJ3wG58lEB/23GzpM0D1JR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777303535; c=relaxed/simple;
	bh=5eGJRBHsry8VLeF9PsLXNzqWC87KtCD87UrBpwfeRG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TPv4ykedtoiJQyeDbshsfNDHFV9QEY08C+AtMef1CivI8Ljt8UlInTLxuzpdJ05LqbLMzEm9It1dRxLYqf3QZRSwC3dcvYitl6hKletioWfS19GJk1ID50WMUkwkI6+BTMvmrec816lNz8Vx6KCclJseap5IUHAweam+bWGBeGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=tE8BUc9F; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=VLUeEUxHsvQjbEylxIKcyrfUDtvJeNDxCc7Z5Zfd5yc=; b=tE8BUc9FTlXsdeIjq04yFee+zA
	2G0Vv9L3FMf9i+K7vtJmHXhMn/4K6A8TJNevJm11U5Qvt0E5wSGUno14Mm5gTHXp7Ruo2MDu2Pskn
	lvf2IdG0jdHd2Co8ErqUga6Vllm1ichZGDNpzgAiYEskGOrsxOvZFP/SgKpO+XmmlAr4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wHNpr-000BP9-8e; Mon, 27 Apr 2026 17:25:23 +0200
Date: Mon, 27 Apr 2026 17:25:23 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Netdev <netdev@vger.kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH] [v4] wiznet: convert to GPIO descriptors
Message-ID: <992f111e-febc-436d-b7ca-fa167a858e93@lunn.ch>
References: <20260427142924.2702598-1-arnd@kernel.org>
 <20260427145010.GA2502144-robh@kernel.org>
 <57297b41-0f08-43eb-a73c-21a5461a4eb4@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57297b41-0f08-43eb-a73c-21a5461a4eb4@app.fastmail.com>
X-Rspamd-Queue-Id: 74734475282
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35602-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[lunn.ch:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,lunn.ch:dkim,lunn.ch:mid]

On Mon, Apr 27, 2026 at 05:17:24PM +0200, Arnd Bergmann wrote:
> On Mon, Apr 27, 2026, at 16:50, Rob Herring wrote:
> > On Mon, Apr 27, 2026 at 04:28:29PM +0200, Arnd Bergmann wrote:
> >> 
> >> The CONFIG_WIZNET_BUS_SHIFT value was apparently meant to be set
> >> at compile time to a machine specific value. This was always broken
> >> for multiplatform configurations with conflicting requirements, and
> >> in the mainline kernel it was set to 0 anyway. Leave it defined
> >> locally as 0 but rename it to something without the CONFIG_ prefix.
> >> 
> >> Acked-by: Rob Herring <robh@kernel.org>
> >
> > Well, 3 years later and I'm a bit grumpier seeing .txt binding 
> > additions. A new compatible plus new property we generally require 
> > converting the binding first. But I'm not going to revoke my ack here.
> >
> > Is there even a known user for this new compatible?
> 
> No, I'm not aware of any users neither the old nor the new
> compatible, it only popped up from my backlog of patches
> because of its usage of legacy GPIOs. From what I can
> tell, the only users of the non-DT MMIO interface were
> out of tree arch/blackfin/ boards.

I would suggest giving Nicolas Saenz Julienne time to speak up. If
Nicolas does not require it any more, i suggest removing it. That fits
with what we are trying to do at the moment in netdev, remove old
drivers.

	Andrew

