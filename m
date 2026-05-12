Return-Path: <linux-gpio+bounces-36657-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOj2Ef7mAmpEyQEAu9opvQ
	(envelope-from <linux-gpio+bounces-36657-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 10:38:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E62351CD24
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 10:38:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AECB73011F41
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 08:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46E3D4963C9;
	Tue, 12 May 2026 08:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="szMVbBJR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7261E368D71;
	Tue, 12 May 2026 08:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778574985; cv=none; b=N4WZ2lOFeTOczGNzUsF7NwPOt/rY4ZJu0uPE3knff/gWW/pafzO7KGzRXjvNT8j06jd82A0XhCCzp6AfwwEaw5Q6Wh695Q7krET48p8sex4+dlvl7AcIEmzk0ekFQUXs4zJspF9ihfeLSUINpobkjXXQReExX+l5XWfTiBEA7qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778574985; c=relaxed/simple;
	bh=1faRd0h0qROCxzA1jK/FqDN9ymT0agjcJZ/rWTV6ajc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OB+196okgIu3SOy2UYVhMLCRmToSZKxGvbri7q6ao6fLhHgtLM2rXY6Zb75IvyPSACW8LIfSUYmaJ52PzpUg4HGYWN2vkhiNvWPkRYRxMD4rRj4UMYLRY3dbkqy3/MZ1F5YXklXaf6vPjbd6yOB/XGR4DQ1W+vHn85DDwgFVlPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=szMVbBJR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3161CC59;
	Tue, 12 May 2026 10:36:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778574974;
	bh=1faRd0h0qROCxzA1jK/FqDN9ymT0agjcJZ/rWTV6ajc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=szMVbBJRuobz+jlQZ1NsZPIOXNtCb4kd2JLIBISlP91bRkbPqbc2hMWE/zjF6g5+m
	 E/hMSJzWUmJTUWb3QMpKz54jnt167mXq3yrb+VHxks8EB9QJpfWBeJPr5OjY/xRqI/
	 aIAUSJiSeR9gY4tTt4zSWTNqU4ngCN/6dSviaetc=
Date: Tue, 12 May 2026 11:36:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Benson Leung <bleung@chromium.org>, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev, driver-core@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Johan Hovold <johan@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v10 8/9] platform/chrome: Protect cros_ec_device
 lifecycle with revocable
Message-ID: <20260512083620.GA4128@killaraus.ideasonboard.com>
References: <20260508105448.31799-1-tzungbi@kernel.org>
 <20260508105448.31799-9-tzungbi@kernel.org>
 <20260508115309.GA9254@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260508115309.GA9254@nvidia.com>
X-Rspamd-Queue-Id: 3E62351CD24
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36657-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 08:53:09AM -0300, Jason Gunthorpe wrote:
> On Fri, May 08, 2026 at 06:54:47PM +0800, Tzung-Bi Shih wrote:
> >  struct cros_ec_device *cros_ec_device_alloc(struct device *dev)
> > @@ -47,6 +49,15 @@ struct cros_ec_device *cros_ec_device_alloc(struct device *dev)
> >  	if (!ec_dev)
> >  		return NULL;
> >  
> > +	ec_dev->its_rev = revocable_alloc(ec_dev);
> > +	if (!ec_dev->its_rev)
> > +		return NULL;
> > +	/*
> > +	 * Drop the extra reference for the caller as the caller is the
> > +	 * resource provider.
> > +	 */
> > +	revocable_put(ec_dev->its_rev);
> > +
> >  	ec_dev->din_size = sizeof(struct ec_host_response) +
> >  			   sizeof(struct ec_response_get_protocol_info) +
> >  			   EC_MAX_RESPONSE_OVERHEAD;
> 
> FWIW I am still very much against seeing any revokable concept used
> *between two drivers*. That will turn the kernel's lifetime model into
> spaghetti code.

I agree, I really think it will become a huge mess that we will
massively regret.

/me feels like Cassandra

> Your other series where you only have to change
> drivers/platform/chrome/cros_ec_chardev.c just confirms how wrong this
> approach is.
> 
> Given you say this is such a bug I think you really should be sending
> a series that is patches 5 through 7 from the other series and a
> simple rwsem instead of misc_deregister_sync() to deal with this bug
> ASAP. No need to complicate a simple bug fix in a driver with all
> these core changes.
> 
> Once the bug is fixed you can continue to try to propose more general
> solutions.

-- 
Regards,

Laurent Pinchart

