Return-Path: <linux-gpio+bounces-36375-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KA0OIRCd/GnJRwAAu9opvQ
	(envelope-from <linux-gpio+bounces-36375-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 16:09:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1882C4E9D98
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 16:09:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF64B3059307
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 14:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D842F3FBED3;
	Thu,  7 May 2026 14:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eznREBL+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E89537BE60;
	Thu,  7 May 2026 14:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778162589; cv=none; b=cDoCMQslWSfj30Z5UZ4FNxA5g8Aqn9QUp/XjtDNf66cNlfeyMLZjOiKNbzWCHeR1Rq2uz2YnhDod0XSJ7183uC3Ph3lVds6V7bevaSUAYSyGOLP6GpgOCy8S6zlAQ1L77IHB9bGOp3q26oNgh5em2cWdAlRr+ABDJRu0GRM5JMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778162589; c=relaxed/simple;
	bh=jyuVFQpYFnIAVWhCEnjNlutVh3WPNcOXa3xc2KxdMYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eIs0SBc+vQFupiCAEpnpYrfkbBuSVGWzp01jQEqUmnzPST5HuToIyClYMWSeEjrXxji6ep43aPB6CBqWMwTuASM+1kAsGTRV7JPIgJvIrVvWTNNc0ZKpYBbKGr701zIuSMmcI7hgqhcjt7D3dFzD8pwsolFNXqEMyxDJbx/SpwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eznREBL+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9972AC2BCB2;
	Thu,  7 May 2026 14:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778162589;
	bh=jyuVFQpYFnIAVWhCEnjNlutVh3WPNcOXa3xc2KxdMYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eznREBL+qNKkanfIG+aTygQcLiDLfZrLND26zqwNnw+NnWQqdjLRaLbOU4vPhoslI
	 tSA2q04yy15s4rYLHZ82vq3sXkyr//zSLnpjP5SMFBAbrk3UpSAI9hVF34E7cDCZIE
	 fMr4Fa884Fc5iHxn9zD0XzThv9WRlrLFiwPRPkyQoAACssvSOwA2sZzDaSid4ofc7A
	 dd70Au51prePJ3YVB08ONVFQVuzeLmI8JE2X06l2pprE2g4i9Sufe6OLjUP/1C07N8
	 5Rl9/WnpRjlbgRZRvhxP3uK342ueIDqGq4KUY6IKe4efreIm7cRbB7UOQMgdCn1oxL
	 JBbAnpvmrRN9Q==
Date: Thu, 7 May 2026 22:03:03 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev, driver-core@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Johan Hovold <johan@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v9 1/9] revocable: Revocable resource management
Message-ID: <afybl1LWaESdtX5U@tzungbi-laptop>
References: <20260427135841.96266-1-tzungbi@kernel.org>
 <20260427135841.96266-2-tzungbi@kernel.org>
 <CAMRc=McG41iHWfY+3U4Xp6YNFCwbt_zAUE-2417LrQVrTfdWjA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McG41iHWfY+3U4Xp6YNFCwbt_zAUE-2417LrQVrTfdWjA@mail.gmail.com>
X-Rspamd-Queue-Id: 1882C4E9D98
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36375-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Tue, May 05, 2026 at 05:55:40AM -0700, Bartosz Golaszewski wrote:
> On Mon, 27 Apr 2026 15:58:33 +0200, Tzung-Bi Shih <tzungbi@kernel.org> said:
> > diff --git a/include/linux/revocable.h b/include/linux/revocable.h
> > new file mode 100644
> > index 000000000000..2bcf23f01ace
> > --- /dev/null
> > +++ b/include/linux/revocable.h
> > @@ -0,0 +1,214 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright 2026 Google LLC
> > + */
> > +
> > +#ifndef __LINUX_REVOCABLE_H
> > +#define __LINUX_REVOCABLE_H
> > +
> > +#include <linux/cleanup.h>
> > +#include <linux/compiler.h>
> 
> I don't think you need this header.

Ack, will remove it in the next version.

> 
> > +#include <linux/kref.h>
> > +#include <linux/srcu.h>
> > +
> > +/**
> > + * enum revocable_alloc_type - The allocation method for a revocable provider.
> > + * @REVOCABLE_DYNAMIC: The struct revocable was dynamically allocated using
> > + *                     revocable_alloc() and its lifetime is managed by
> > + *                     reference counting.
> > + * @REVOCABLE_EMBEDDED: The struct revocable is embedded within another
> > + *                      structure.  Its lifetime is tied to the parent
> > + *                      structure and is not reference counted.
> > + */
> > +enum revocable_alloc_type {
> > +	REVOCABLE_DYNAMIC,
> > +	REVOCABLE_EMBEDDED,
> > +};
> 
> Maybe we don't need this public enum at all, we could just use a different
> release callback for kref_put() depending on how the revocable was allocated?
> 
> The enum is not used elsewhere so it doesn't make sense to document it as if it
> was part of the revocable API.
> 
> > +
> > +/**
> > + * struct revocable - A handle for resource provider.
> > + * @srcu: The SRCU to protect the resource.
> > + * @res:  The pointer of resource.  It can point to anything.
> > + * @kref: The refcount for this handle.
> > + * @alloc_type: The memory allocation type.
> > + */
> > +struct revocable {
> > +	struct srcu_struct srcu;
> > +	void __rcu *res;
> > +	struct kref kref;
> > +	enum revocable_alloc_type alloc_type;
> 
> This could be replaced with the pointer to the release callback, assigned
> by revocable_alloc()/revocable_init() respectively.
> 

Ack, will remove the enum.  A boolean is sufficient given that the
allocation type is binary.

> > +};
> > +
> > +/**
> > + * struct revocable_consumer - A handle for resource consumer.
> > + * @rev: The pointer of resource provider.
> > + * @idx: The index for the SRCU critical section.
> 
> Should any of these be accessed directly by the user? Maybe document them
> as __private?

I don't think that is necessary.  All members in both struct revocable and
struct revocable_consumer are intended to be opaque and should not be
accessed directly by users.  However, I made them public structures
because:
- The try_access_* macros need to allocate a struct revocable_consumer
  locally.
- KUnit tests require access to these members for verification.

I can add a comment to the structure definitions noting that they should
be treated as private.  Does it make sense?

> 
> > + */
> > +struct revocable_consumer {
> > +	struct revocable *rev;
> > +	int idx;
> > +};
> 
> I'd rename it to struct revocable_handle which indicates better what it is:
> it's a handle *owned* by the consumer.

Ack, will rename it.

> 
> > +
> > +void revocable_get(struct revocable *rev);
> > +void revocable_put(struct revocable *rev);
> > +
> > +struct revocable *revocable_alloc(void *res);
> > +void revocable_revoke(struct revocable *rev);
> > +int revocable_embed_init(struct revocable *rev, void *res);
> > +void revocable_embed_destroy(struct revocable *rev);
> > +
> > +void revocable_init(struct revocable *rev, struct revocable_consumer *rc);
> > +void revocable_deinit(struct revocable_consumer *rc);
> 
> If we hid the release logic, we could drop revocable_embed_destroy() and use
> the same refcounting functions for both variants. I'd suggest the following:
> 
> For refcounting (same for both variants):
> 
> 	void revocable_get(struct revocable *rev);
> 	void revocable_put(struct revocable *rev);
> 
> For dynamic variant:
> 
> 	struct revocable *revocable_alloc(void *res);
> 
> For embedded:
> 
> 	int revocable_init(struct revocable *rev, void *res);
> 
> For handles:
> 
> 	void revocable_handle_init(struct revocable *rev, struct
> revocable_consumer *rc);
> 	void revocable_handle_deinit(struct revocable_consumer *rc);
> 
> Does it make sense?

That makes sense.  I'll fix this in the next version.

