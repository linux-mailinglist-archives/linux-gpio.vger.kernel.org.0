Return-Path: <linux-gpio+bounces-36961-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Dk0BpqACGo/sgMAu9opvQ
	(envelope-from <linux-gpio+bounces-36961-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 16 May 2026 16:35:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA7955C1A1
	for <lists+linux-gpio@lfdr.de>; Sat, 16 May 2026 16:35:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF89430120F5
	for <lists+linux-gpio@lfdr.de>; Sat, 16 May 2026 14:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 526903DCD98;
	Sat, 16 May 2026 14:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lbc5XaXX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1188C224F3;
	Sat, 16 May 2026 14:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778942100; cv=none; b=m+ElEPK4OHYf+2FJOzG0T5sPeDc/Q+0/S4wADLQgwBTBanqHYcPj/1viQTTL6szUcBE1iUCBkw5v7gvIxUqA/Rcm89N/VrD0u4a96WKNxfm+HDmsyp5qZXb7w7X+SzZFOoYIfAoVFXdVdaZASKfVu5IJoAwcOyxjvKJTyYwKIa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778942100; c=relaxed/simple;
	bh=7FPVVjbFBDMkksgmJiXsOCiopoLzzbxZggJOR3J67Ew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W3ymU5UORUTfXs4L92rdQbmMuKveyaEpydZRnx0CAwgkzSY9W0MKZpVZ1C2QSOPylbnQ0z9J+Ps0duW5qUN7jO53VNc2nkYX/A5YtI+eYLCZfmpcKJWC6DE3B/8Kkczz7KG3TvJzygIhj0GF2pA2qm1J9HkSAwA82K3luZ8bNDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lbc5XaXX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F93EC19425;
	Sat, 16 May 2026 14:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778942099;
	bh=7FPVVjbFBDMkksgmJiXsOCiopoLzzbxZggJOR3J67Ew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lbc5XaXXuwZRLRq12Cg+NRERhha3IWqvQ6ZI0612tI58GojNahj6luIAy9qKkDhza
	 ovPL+PfuIefcN8Mrqx3YCDfX8mYeq6nZkvA9B9Yg7hsyj3g7WSrndLVpjaqz6W2Lx7
	 JBiMnDsBWIxmMIgVkksALOHpjuR5sXTOpTICemlvfU+y3MhMct/j75qtZFqu4Ynybl
	 YwTc2TesHzT1d51vvsthY5gNlKp6gii8MnF7WH44GROAYKm6IiBuhz5Fi/ZKjHQ/dt
	 ZqJrsTwfTdBNGcf1zKfquyu5xmkaFafL/Gc56rcWHEeP4yZDdFMj4JFhRP7UBjxgB1
	 YFmR/UryrNq6w==
Date: Sat, 16 May 2026 22:34:53 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Benson Leung <bleung@chromium.org>, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev, driver-core@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Johan Hovold <johan@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v10 8/9] platform/chrome: Protect cros_ec_device
 lifecycle with revocable
Message-ID: <agiAjVPrFaRiUouy@tzungbi-laptop>
References: <20260508105448.31799-1-tzungbi@kernel.org>
 <20260508105448.31799-9-tzungbi@kernel.org>
 <20260508115309.GA9254@nvidia.com>
 <agVCoxuTu7l60TH-@google.com>
 <20260514160214.GH787748@nvidia.com>
 <agbZLY0wn85JqTFV@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agbZLY0wn85JqTFV@google.com>
X-Rspamd-Queue-Id: CCA7955C1A1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36961-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 08:28:29AM +0000, Tzung-Bi Shih wrote:
> On Thu, May 14, 2026 at 01:02:14PM -0300, Jason Gunthorpe wrote:
> > On Thu, May 14, 2026 at 03:33:55AM +0000, Tzung-Bi Shih wrote:
> > 
> > > > Given you say this is such a bug I think you really should be sending
> > > > a series that is patches 5 through 7 from the other series and a
> > > > simple rwsem instead of misc_deregister_sync() to deal with this bug
> > > > ASAP. No need to complicate a simple bug fix in a driver with all
> > > > these core changes.
> > > 
> > > Apologies for missing this suggestion.
> > > 
> > > For "patches 5 through 7 from the other series" I guess you're referring:
> > > - https://lore.kernel.org/all/20260427134659.95181-6-tzungbi@kernel.org
> > > - https://lore.kernel.org/all/20260427134659.95181-7-tzungbi@kernel.org
> > > - https://lore.kernel.org/all/20260427134659.95181-8-tzungbi@kernel.org
> > 
> > Yes
> > 
> > > Could you provide a bit more detail on the rwsem approach?  I'm not
> > > entirely clear on what data or operations the rwsem would be protecting.
> > 
> > Just put a rwsem, or even scru, inside the driver's fops.
> > 
> > You can refactor that out to a misc or revocable later.
> 
> I see.  Thank you for your suggestion.  I will explore it and send out a
> new version.

https://lore.kernel.org/all/20260516143017.18560-1-tzungbi@kernel.org
is an attempt at it.

