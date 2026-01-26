Return-Path: <linux-gpio+bounces-31075-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCFCJcR0d2n7ggEAu9opvQ
	(envelope-from <linux-gpio+bounces-31075-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 15:05:56 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B53894E7
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 15:05:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55581304C968
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 13:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D99BA33B6C5;
	Mon, 26 Jan 2026 13:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nDYnglkz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B26423B61B;
	Mon, 26 Jan 2026 13:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769435902; cv=none; b=TDSVBgNEJH7cLQWuZW/R8SoIXcPRwcmX68SmgsSdzM1sNYV0u7jqoE/083MfHo6SMKjqHW+tzK+fbx+XJ1l7hfKcqnCo98iXRzOZ0CDzLfYkWszj5FPdKEBn+ZptyW9f5g8BF43ykeX5o+nhFkAZ2W7DIQGAioi8sWdZzY3M8/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769435902; c=relaxed/simple;
	bh=RtHetFmUEXwciULc0GdQkNg6vLMwT9i40Cxcw/PXJxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hBHk1kcnLtddesUg8RGkPEtIODHcxZYtTh1qwsgUaJ5b4mGDGFoEmgEC8y8pSAogFyOwKwD08j01cFIdyxJfm7oHK2Z99H++3DDyqaqzIcMZcgy+HLAxb0IiJi+7jbNOtEF8RJtiHkrm0zIf+sTmf6YPTRiqkY61+kK42QN7T78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nDYnglkz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36287C116C6;
	Mon, 26 Jan 2026 13:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769435902;
	bh=RtHetFmUEXwciULc0GdQkNg6vLMwT9i40Cxcw/PXJxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nDYnglkzRkdUTIgLg8zF2yhAiofNf1KmW0aB7f8FG10JPDTBY9KYsDqgrKGjXlDdy
	 oTXICNmDUB++rgsnskdz6ostpx0kTTKZoXG6m7dsCDHQ1UPpFAQ+ulcNfNucNwfTOU
	 6luWJpEQsljQq19IQYiUJ6e/uJYOYJdZLJhZcmHWLatZejr9ghc1JpNzFdLvTo5NPu
	 xot6T+NlPTRb5KsFNnzve3KW0iPtkzIY1MhHZGtV8/CT4tsuIQ1KWEgZFLluVelxHy
	 zMQ2voDqjqaF2P1Fj8yoL3MXienIL1JsXYAB8shBAfdvcgK1y8lj0h13WoJwL0D2mt
	 +x6b9PjLQPFog==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vkN6f-000000005P0-1JW0;
	Mon, 26 Jan 2026 14:58:17 +0100
Date: Mon, 26 Jan 2026 14:58:17 +0100
From: Johan Hovold <johan@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 22/23] gpiolib: Leverage revocable for other independent
 lifecycle instances
Message-ID: <aXdy-b3GOJkzGqYo@hovoldconsulting.com>
References: <20260116081036.352286-1-tzungbi@kernel.org>
 <20260116081036.352286-23-tzungbi@kernel.org>
 <aXT45B6vLf9R3Pbf@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXT45B6vLf9R3Pbf@hovoldconsulting.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31075-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F1B53894E7
X-Rspamd-Action: no action

On Sat, Jan 24, 2026 at 05:52:53PM +0100, Johan Hovold wrote:
> On Fri, Jan 16, 2026 at 08:10:35AM +0000, Tzung-Bi Shih wrote:
> > There are independent lifecycle instances (e.g., other drivers) can save
> > a raw pointer to the struct gpio_device (e.g., via gpio_device_find())
> > or struct gpio_desc (e.g., via gpio_to_desc()).  In some operations,
> > they have to access the underlying struct gpio_chip.
> > 
> > Leverage revocable for them so that they don't need to handle the
> > synchronization by accessing the SRCU explicitly.
> > 
> > Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> 
> >  static int gpiod_get_raw_value_commit(const struct gpio_desc *desc)
> >  {
> > -	struct gpio_device *gdev;
> >  	struct gpio_chip *gc;
> >  	int value;
> > +	DEFINE_REVOCABLE(rev, desc->gdev->chip_rp);
> 
> DEFINE_REVOCABLE() is racy and can lead to use-after-free since nothing
> prevents chip_rp from being revoked and freed while the
> revocable_alloc() hidden in DEFINE_REVOCABLE() is running.

This was supposed to say "revocable_init()" (i.e. revocable_alloc()
without the memory allocation).
 
> >  
> > -	/* FIXME Unable to use gpio_chip_guard due to const desc. */
> > -	gdev = desc->gdev;
> > -
> > -	guard(srcu)(&gdev->srcu);
> > -
> > -	gc = srcu_dereference(gdev->chip, &gdev->srcu);
> > +	REVOCABLE_TRY_ACCESS_WITH(rev, gc);
> >  	if (!gc)
> >  		return -ENODEV;
 
Johan

