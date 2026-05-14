Return-Path: <linux-gpio+bounces-36802-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sA5OAq9CBWqATwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36802-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 05:34:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBBD53D55A
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 05:34:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7F54B302F437
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 03:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE9573A3E80;
	Thu, 14 May 2026 03:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XnFu+ZVX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B617313523;
	Thu, 14 May 2026 03:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778729640; cv=none; b=hIE+9YDuMLoI6+VpvEf9ASegDOQ26KF9mNOH2FTworprVhV19zdMjz0gdks2AUMyYs7u/umUTdeOT3f5kVJsE64GXgzlW6mtQULvhLoaY4H9jSv0O2wG/R+OYSYBXbi2+ZQvFQX/zoP6r0wsy4g2bPsbkY+d+FOL8REUvhJmH78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778729640; c=relaxed/simple;
	bh=P8pTGq4h0SFxO4ZEAjZ7egC90TpJmRCY6YKSnyU+xF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z6diIHgSwGS73NEdLn8Z4b2TfIE/UE0Gx+gc7t7Ndgq/2IRVzcuYj0whDxgSoCrxYoaKoBrg5OeYvSOeWwy4ldH88L0MzOvzvLXRCwKfS+D3Zq951YVY0m0YLDT0svFjjVTTbYWpL325YmPA/tLaHn7lyqLlvv0v9AHh7drRiV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XnFu+ZVX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AD06C19425;
	Thu, 14 May 2026 03:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778729640;
	bh=P8pTGq4h0SFxO4ZEAjZ7egC90TpJmRCY6YKSnyU+xF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XnFu+ZVX/L8UdpJlYLGwc+pOhPzmPFIIwy7Spl5QSbQEcQRSjaCQ8jG9XFWT5o6OH
	 3UWru6Dkf1wTinXRFcdJV8OSC0LCg7JCqbytnwI5kevAdviDdytPMqxIRPMJ1hJLfu
	 4vS+DyL2S9c/YLY1mF+aFLseY+2EtZpsuiGBEnvpk+TiL6kSJyLsCtERjrvzKvGiA3
	 pit9m0dnNWZ6zGHI1VK4hlIYb44PMnsVh48tz9G5XY4Ri5+s++X8vtLuiz+A8QVn+B
	 v7gSiAVn6c3otgisYoCaT4bxGoc4hKsLpfNh8gePW0sLxTjY8cTazvg1CuDuiRdH06
	 VZJd7a/f0VP5Q==
Date: Thu, 14 May 2026 03:33:55 +0000
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
Message-ID: <agVCoxuTu7l60TH-@google.com>
References: <20260508105448.31799-1-tzungbi@kernel.org>
 <20260508105448.31799-9-tzungbi@kernel.org>
 <20260508115309.GA9254@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508115309.GA9254@nvidia.com>
X-Rspamd-Queue-Id: BBBBD53D55A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36802-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[]
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
> 
> Your other series where you only have to change
> drivers/platform/chrome/cros_ec_chardev.c just confirms how wrong this
> approach is.
> 
> Given you say this is such a bug I think you really should be sending
> a series that is patches 5 through 7 from the other series and a
> simple rwsem instead of misc_deregister_sync() to deal with this bug
> ASAP. No need to complicate a simple bug fix in a driver with all
> these core changes.

Apologies for missing this suggestion.

For "patches 5 through 7 from the other series" I guess you're referring:
- https://lore.kernel.org/all/20260427134659.95181-6-tzungbi@kernel.org
- https://lore.kernel.org/all/20260427134659.95181-7-tzungbi@kernel.org
- https://lore.kernel.org/all/20260427134659.95181-8-tzungbi@kernel.org

Could you provide a bit more detail on the rwsem approach?  I'm not
entirely clear on what data or operations the rwsem would be protecting.

