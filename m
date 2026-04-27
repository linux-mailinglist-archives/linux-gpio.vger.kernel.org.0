Return-Path: <linux-gpio+bounces-35598-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEwCBlJ472n9BgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35598-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 16:53:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBA7474BB2
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 16:53:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8CAFD3007B2C
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 14:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10A0C3A759F;
	Mon, 27 Apr 2026 14:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="an+CbRDC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C671FBEB0;
	Mon, 27 Apr 2026 14:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777301328; cv=none; b=VTPinHMnigMfl6XwXmygj9bU8625O8obHrVF0u3U0QS+OUAoWpeGwsvmnXjFSuOZfVK0BE8jiVUWpJ9kjMZb0Db3x0lrplcTnGPtKWkuveY+g52QR1Mq5hQ7NCCAkZ7An8izikK+cSnOTyS9Vgh6mbAus44hlHKMrvG+tAgzxQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777301328; c=relaxed/simple;
	bh=xELjnsD2nntviaMuLAcUvc9vtT3nPDW/+I9+DmI4Gxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=su0ffDxZMUpYFmrMW/y/zArDN87H4AKpRhVdqXXlufsn7xDW83Njxm2sicdAAzL7Klga1J/xIiivo43976XMJVI2vIfjZMCS+LYwTXtlMLbc0+s7G5yY6gbzjNNZuS897RW4IKuF0g9tXz8OYg5/hFe7KefyVsnQnhTUgQ87cnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=an+CbRDC; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=VQGiL/B5rHD7mVT0Vt1EvekIqOlhDKRdgOwOAyd+KjY=; b=an+CbRDC38HI8tK+uxf1lSSodM
	Wm0PvtoJ8z/d+bEgWSI2Wy0bLkYqSxJZC2BR6zUmrn/JMmW+P/rVt99baJlcU+6nL3v5TgeSt+Zha
	p8mK41WNsruOm+VP07RTxD3MkebIYLvY+crpLMTz8Eh7tcZHVepkrW51SVXntSkawSm0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wHNGJ-000B9v-Kq; Mon, 27 Apr 2026 16:48:39 +0200
Date: Mon, 27 Apr 2026 16:48:39 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Arnd Bergmann <arnd@kernel.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] [v4] wiznet: convert to GPIO descriptors
Message-ID: <bcf1d4a1-e99b-4ce2-8849-8cb1d10aa3f2@lunn.ch>
References: <20260427142924.2702598-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427142924.2702598-1-arnd@kernel.org>
X-Rspamd-Queue-Id: 1CBA7474BB2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35598-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[lunn.ch:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,lunn.ch:dkim,lunn.ch:mid]

On Mon, Apr 27, 2026 at 04:28:29PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The w5100/w5300 drivers only support probing with old platform data in
> MMIO mode, or probing with DT in SPI mode. There are no users of this
> platform data in tree, and from the git history it appears that the only
> users of MMIO mode were on the (since removed) blackfin architecture.

A quick grep does not find any .dts files referencing the compatible.

> It would probably be possible to just remove the MMIO mode driver
> completely, but it seems fine otherwise, and fixing it to use the modern
> interface seems easy enough.

Last real development work on this driver was:

Author: Nicolas Saenz Julienne <nsaenz@kernel.org>
Date:   Wed Jun 12 14:25:25 2019 +0200

    net: ethernet: wiznet: w5X00 add device tree support
    
    The w5X00 chip provides an SPI to Ethernet inteface. This patch allows
    platform devices to be defined through the device tree.

Nicolas, are you still using it?

	Andrew

