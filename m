Return-Path: <linux-gpio+bounces-39689-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UuHjNfffTmqyVwIAu9opvQ
	(envelope-from <linux-gpio+bounces-39689-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 01:40:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2535772B3A7
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 01:40:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lunn.ch header.s=20171124 header.b=iBQBRsya;
	dmarc=pass (policy=none) header.from=lunn.ch;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39689-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39689-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7290630453A8
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2026 23:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 076FF38B12F;
	Wed,  8 Jul 2026 23:38:26 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BC627A907;
	Wed,  8 Jul 2026 23:38:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783553905; cv=none; b=F1lkRf3YSFnuwWeCLbk9GNzSnaZ73GhDn0UUwjzkfh5afZWcXJQyGRVjnvbkhCx/hzjVOUzpDQ01QCBxfHhvFs1hrw1zrYLPhCUd7hx7Jathz1Xn0otMEv7FYIe+fhZw6wvsqD3mi2+sQjrKhsnLUOqUORpKFjyop2gQ89I3720=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783553905; c=relaxed/simple;
	bh=z/zULR4ObozUQeHkf5na3DNuyKzsZUv/YSXqAbvEl6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OrqxYMJWbW9Gn6Cv11B/C6Dr85noCTGdh3GdZeZSL+7bnYVorJijZUa4Jjb4EwZWclUW+5XEbIVI6FYPGHjkSJ4k5ELAbJyv+h2TaPx33ps2rJk/GTXaT5HT0PMa7Kjgq68HMo0ah+ky+Sw7AqFhfWEPR0iFW4qzTHcplGSGVZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=iBQBRsya; arc=none smtp.client-ip=156.67.10.101
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Jl9z+W9jZAgY1b/9Xr8mvruNgbR8g51yrBC1eDvlAY8=; b=iBQBRsyaXgdsI3TXyuQeHbcn5/
	tigDszoTvDuBP7AI7gA+OFv0bNLq0S1/jW3Pbhs/C8HmJ2omfzg4c2fwSMiXuzXHZgaEKEV8s/qcz
	iaFDHYK3AhiWOqAWZIq7S3SwhzRZtza6l9GDK9h822u4acf5qRff8MN3Xrr30A/U9xyU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1whbqO-00BPRo-GB; Thu, 09 Jul 2026 01:38:20 +0200
Date: Thu, 9 Jul 2026 01:38:20 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Ralph Sennhauser <ralph.sennhauser@gmail.com>,
	Rob Herring <robh@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2] gpio: mvebu: use devm_clk_get_optional_enabled()
Message-ID: <6e606bff-cdc3-4c4b-a122-38de39f31f43@lunn.ch>
References: <20260708224822.960617-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708224822.960617-1-rosenp@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39689-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:rosenp@gmail.com,m:linux-gpio@vger.kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:thierry.reding@gmail.com,m:ralph.sennhauser@gmail.com,m:robh@kernel.org,m:linux-kernel@vger.kernel.org,m:thierryreding@gmail.com,m:ralphsennhauser@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew@lunn.ch,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[lunn.ch:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lunn.ch:from_mime,lunn.ch:dkim,lunn.ch:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2535772B3A7

On Wed, Jul 08, 2026 at 03:48:22PM -0700, Rosen Penev wrote:
> The clock is obtained without doing any sort of cleanup on remove or
> anywhere else.

Didn't you say you could not unload this driver? Then why is cleanup
needed?

> Use the proper function to handle this. When it fails
> with -EPROBE_DEFER for example, return so that it can be handled.

Why would it fail with -EPROBE_DEFER? The only resource this driver
needs is optional clocks. If the SoC clock driver is missing, the SoC
is going to die very soon anyway, it is such a core part of the SoC.
If you access any register without the clock enabled, the SoC just
hard wedges. I've had to debug that situation.

> When
> the clock is not found, it's NULL and not a PTR_ERR. Handle that as
> well.

/**
 * devm_clk_get - lookup and obtain a managed reference to a clock producer.
 * @dev: device for clock "consumer"
 * @id: clock consumer ID
 *
 * Context: May sleep.
 *
 * Return: a struct clk corresponding to the clock producer, or
 * valid IS_ERR() condition containing errno.

The documentation disagrees with you.

Please take a step back. What is really broken here? What reports are
there from users? What is bothering people?

	Andrew

