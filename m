Return-Path: <linux-gpio+bounces-31865-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IUmIp4Tl2n7uAIAu9opvQ
	(envelope-from <linux-gpio+bounces-31865-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 14:43:58 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F99E15F33B
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 14:43:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 975E83030B27
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 13:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A387A33A9FE;
	Thu, 19 Feb 2026 13:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="ZQ+CO1Cu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E3C86277;
	Thu, 19 Feb 2026 13:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771508554; cv=none; b=N8tlKRwYrVZTT0zMaU4JaZRQH5rGp4ZixioCMdIbiFJUpNoFqZ3+MqGX75RlFwaGrcPm26pfcFoLdYVu55c+KQLf9ufaSxuh8Z8JHy84QDVQuUNmA2wB0cNC/XtJp4iBdGp11s6k38wXZEZ0eD1frjwWEbPr9WnQ9QBW+/DnXUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771508554; c=relaxed/simple;
	bh=MPW4DEn5P3My4mx8HNR2D1Qa3+cpIreLCA5+A4gMwYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i/O/w+EGVJYjk6XLcd5AenzkznropJB2LA0D2lMU+cF8qzDdoE9IqjkR1tsnWOTJFUO91dGPR5JdK5IKw8cgoazbLc/F/BiPbSc+8SPVvmrwmnD4xyb3pMEzjxNi5GHAID0QMFDLL38MTHXRlEXsXSL+ZJYX4qTEZukFZhPNZg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=ZQ+CO1Cu; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=m71zW88H7K19uDqB/mJVa6SLvXopmaXhdyjRMA5F7Ug=; b=ZQ+CO1CuHmS7qG0gJgND/e2zBA
	/ubCjr4WIUdnz0YjIla8GiDmOEPHMbPXJFH2bv/HTmr4xfkGKBqUFqcA4c3jySyxFZM4s03A0s2GQ
	9g8b2lZ2UOhZudKslVqwCiLVlV81XNuoZ5oZ6RPNggjSHFkeqIASVLsOy26sY9Zax3Ec=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vt4IR-007v3K-BB; Thu, 19 Feb 2026 14:42:23 +0100
Date: Thu, 19 Feb 2026 14:42:23 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Shenwei Wang <shenwei.wang@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Message-ID: <13f9d767-61d6-4e29-b36e-6dcc860ccb11@lunn.ch>
References: <20260212213656.662437-1-shenwei.wang@nxp.com>
 <20260212213656.662437-4-shenwei.wang@nxp.com>
 <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31865-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,kernel.org,lwn.net,linaro.org,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[lunn.ch:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lunn.ch:mid,lunn.ch:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2F99E15F33B
X-Rspamd-Action: no action

> > +	u8 id;		/* Message ID Code */
> > +	u8 vendor;	/* Vendor ID number */
> 
> Does this fields above are mandatory, seems that it is just some constant
> values that are useless.
> 
> > +	u8 version;	/* Vendor-specific version number */
> 
> Why it is vendor specific? the version should represent the rpmsg-tty
> protocol version.
> 
> > +	u8 type;	/* Message type */
> > +	u8 cmd;		/* Command code */
> > +	u8 reserved[5];
> 
> What is the purpose of this reserved field?

They have an implementation of the other end running on there systems,
and it sounds like it is widely deployed, and they are trying to keep
backwards compatibility. The protocol also implements more than
GPIO. There is also I2C, maybe watchdog, i don't remember, but early
versions of this patchset had a list. Some of these fields are used
for some of these other devices.

I've been arguing it should be a clean design, with the protocol
focusing on GPIO. And that the rpmsg channel makes it clear this is a
GPIO device, the protocol itself does not need to include fields to
differentiate between GPIO, I2C etc.

When they start submitting I2C over rpmsg, i expect the same sort of
discussion will start again, so the likelihood of keeping backwards
compatible with there firmware seems low to me.

	   Andrew

