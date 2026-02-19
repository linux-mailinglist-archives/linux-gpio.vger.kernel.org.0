Return-Path: <linux-gpio+bounces-31876-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBxYGpo/l2lXwAIAu9opvQ
	(envelope-from <linux-gpio+bounces-31876-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 17:51:38 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BC525160CCB
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 17:51:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9BBA5301BC3B
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 16:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7D07347BC5;
	Thu, 19 Feb 2026 16:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Sw6hUFMr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C6B29B8D0;
	Thu, 19 Feb 2026 16:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771519846; cv=none; b=YzC3RBo5Ufj241qv1eQQ1aK2uTR5cIYdNSHb9DyAPIEDXPiRyBGfts2Cg8wKA+UN1gXJrIN/SoYj4xgXGxMeLS1KzKpQ3CEVt2yc0yRP3iC6sbXSDIoDSqc8g+DIpCRlB5cO4t+Xh/T1fhwUTekHg1p15txCNSJqEQmi6nUn6p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771519846; c=relaxed/simple;
	bh=Ix0q3XwtF+QSMu1HtI9zG8FK2zCDvrFiUdkaI9hF8f8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aI6duc7GLXB0GgBAepUj8P5GfRI80/x29NoPRIIIUXqIq7ngfo65Lcmpk3hcJogRmur8U7ZEVk1cJdHCI3n8pj102AmQYNKb9g2Tp9P4Oz8u3aByB3DnDpLmydaHXW5F4M/h7y14tJ/6bKbq2wpa9VF/XMgkx2c0rU5H5xnCnjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Sw6hUFMr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EA50C4CEF7;
	Thu, 19 Feb 2026 16:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771519846;
	bh=Ix0q3XwtF+QSMu1HtI9zG8FK2zCDvrFiUdkaI9hF8f8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sw6hUFMr8R1d3e/QhpkH2SppFHYRXLhPoyxvaTAbOuySWkd4tOJ3VpXWeOJWZDxVl
	 KqDtAWGSTk5qmQnkHulnNqlt99v9B1MdNr9o2K2CTDkXn+trcMT71vsAbNk1RXBsDo
	 gvwJYUtnkEUHaZoZb5BjdHbTgTofNoIa+zy53oq8=
Date: Thu, 19 Feb 2026 17:50:41 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/2] driver core: provide device_match_fwnode_ext()
Message-ID: <2026021936-ducking-unnerve-6f72@gregkh>
References: <20260219-device-match-secondary-fwnode-v1-0-a64e8d4754bc@oss.qualcomm.com>
 <20260219-device-match-secondary-fwnode-v1-1-a64e8d4754bc@oss.qualcomm.com>
 <2026021900-trekker-twenty-9daa@gregkh>
 <CAMRc=MekX-pXJEs7W9vn8-exAXyfNN3JMwrVNDPXg0b77X1NNw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MekX-pXJEs7W9vn8-exAXyfNN3JMwrVNDPXg0b77X1NNw@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31876-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linux.intel.com,lists.linux.dev,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,linuxfoundation.org:email,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: BC525160CCB
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 05:39:47PM +0100, Bartosz Golaszewski wrote:
> On Thu, Feb 19, 2026 at 5:36 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Feb 19, 2026 at 05:31:22PM +0100, Bartosz Golaszewski wrote:
> > > Provide an extended variant of device_match_fwnode() that also tries to
> > > match the device's secondary fwnode.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > > ---
> > >  drivers/base/core.c        | 14 ++++++++++++++
> > >  include/linux/device/bus.h |  1 +
> > >  2 files changed, 15 insertions(+)
> > >
> > > diff --git a/drivers/base/core.c b/drivers/base/core.c
> > > index f599a1384eec90c104601422b04dc2b4c19d4382..bbf1337978fafc35eb94bda85e0bb7f6879879c0 100644
> > > --- a/drivers/base/core.c
> > > +++ b/drivers/base/core.c
> > > @@ -5326,6 +5326,20 @@ int device_match_fwnode(struct device *dev, const void *fwnode)
> > >  }
> > >  EXPORT_SYMBOL_GPL(device_match_fwnode);
> > >
> > > +int device_match_fwnode_ext(struct device *dev, const void *fwnode)
> >
> > No kernel doc to explain what this function does?
> >
> > :(
> >
> 
> It's not like any of the other variants from this file were documented
> but ok, I can add it in v2. Still, I'd like to hear if this even makes
> sense.

I agree, most of them don't have documentation, but I can't figure out
what _ext() means here so a bit of a hint would be nice :)

I don't know if it makes sense, I'll let the others argue about that.

thanks,

greg k-h

