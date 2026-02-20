Return-Path: <linux-gpio+bounces-31960-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDqjEfBmmGmJHgMAu9opvQ
	(envelope-from <linux-gpio+bounces-31960-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 14:51:44 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BEC1680D6
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 14:51:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E106301F9DC
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 13:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AF53349AF6;
	Fri, 20 Feb 2026 13:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="dmnFieFE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E5E3EBF10;
	Fri, 20 Feb 2026 13:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771595344; cv=none; b=qMgPywE6hIh8tKTv402XdUYmNZshXzjOF4Y00CpiFDO+Hz74rOPmvx/tFlxZxwfgZydz7BS2nsaiq+0Sp9XSJSZkGI9tZc9hXeu6p1KnmUW0NHjGgvDHCpxI/8a/CPGFwJUwp9xYuC5Aw7YfP/fY9x5Ckdw0EiRvSgbT9z35rLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771595344; c=relaxed/simple;
	bh=3BXF1tM0USpaMojgevZ6kSlIUvvjsOnZvrR0swOJu3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mCCMJCzfDyKA0YDwk9vo8QwBSiZnItjnuTPT9oMyQcMnX9YGguDxJHYQeYXlmRS0wMLrUcrZ4vYEU7rNk+aCec7OEDILbX4YCX72S+BuenxvmUqCJcVfZJUUBFiVFkMCTESC7L8fdlTY4ulhIWAFwE7FfMBBzvJOEE5faN0xOg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=dmnFieFE; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=wgcfjCXrMQA1cT1ghZ4LtmW9Dgt8xRzzWMSxnFexXNU=; b=dmnFieFEh1bv6Oa0n9DtfZi6b4
	0tfsxqocUapp/UnR5xKWfCqM2MFoQs+ypcZK8CModT83x1f1RDRNar40G5Wca+Zaf7biknwSiEH3f
	80daJaSI+HdSociiI7+bdjiqVr6k0dAob755Ub8hodVzhPga0//nfyjgd67hehzGur3w=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vtQsG-0084jE-3N; Fri, 20 Feb 2026 14:48:52 +0100
Date: Fri, 20 Feb 2026 14:48:52 +0100
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
Message-ID: <396819f2-dd00-4c09-8bc7-c035a5282a56@lunn.ch>
References: <20260212213656.662437-1-shenwei.wang@nxp.com>
 <20260212213656.662437-4-shenwei.wang@nxp.com>
 <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com>
 <13f9d767-61d6-4e29-b36e-6dcc860ccb11@lunn.ch>
 <fd257c80-d97f-45b0-a12f-3a1888ba81db@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd257c80-d97f-45b0-a12f-3a1888ba81db@foss.st.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31960-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lunn.ch:mid,lunn.ch:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E5BEC1680D6
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 10:16:42AM +0100, Arnaud POULIQUEN wrote:
> 
> 
> On 2/19/26 14:42, Andrew Lunn wrote:
> > > > +	u8 id;		/* Message ID Code */
> > > > +	u8 vendor;	/* Vendor ID number */
> > > 
> > > Does this fields above are mandatory, seems that it is just some constant
> > > values that are useless.
> > > 
> > > > +	u8 version;	/* Vendor-specific version number */
> > > 
> > > Why it is vendor specific? the version should represent the rpmsg-tty
> > > protocol version.
> > > 
> > > > +	u8 type;	/* Message type */
> > > > +	u8 cmd;		/* Command code */
> > > > +	u8 reserved[5];
> > > 
> > > What is the purpose of this reserved field?
> > 
> > They have an implementation of the other end running on there systems,
> > and it sounds like it is widely deployed, and they are trying to keep
> > backwards compatibility. The protocol also implements more than
> > GPIO. There is also I2C, maybe watchdog, i don't remember, but early
> > versions of this patchset had a list. Some of these fields are used
> > for some of these other devices.
> > 
> > I've been arguing it should be a clean design, with the protocol
> > focusing on GPIO. And that the rpmsg channel makes it clear this is a
> > GPIO device, the protocol itself does not need to include fields to
> > differentiate between GPIO, I2C etc.
> > 
> > When they start submitting I2C over rpmsg, i expect the same sort of
> > discussion will start again, so the likelihood of keeping backwards
> > compatible with there firmware seems low to me.
> 
> Agree with you.

Hi Shenwei

We now have two Maintainers who think you should make a clean
design...

You should go talk with your Management and decide what they want to
do. Drop this patch series and only support the out of tree driver? Or
rework this driver and the firmware to the liking of the mainline
Maintainers.

	Andrew

