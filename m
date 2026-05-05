Return-Path: <linux-gpio+bounces-36204-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCuPK/Hp+WmsFAMAu9opvQ
	(envelope-from <linux-gpio+bounces-36204-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 15:00:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 159BD4CE16E
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 15:00:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6EABC30C45A0
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 12:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7809346E4E;
	Tue,  5 May 2026 12:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IRlsSHll"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BC539A075
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 12:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777985746; cv=none; b=GcH9jm2hbQU2smmuz1hoHMvK2gh6oTxoAQvruFZM0Kij9UsDPZI0mePqWQER306yauOpwr4Ipz6qdvDdz8jcqHqR9FMVgeCCgi+WcrgwdhBZaYPQph8FiixaOmuqanCHIJIxKFxHqGGTWvJByLEjymROC+EH8TzDAObUoFkeun0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777985746; c=relaxed/simple;
	bh=UnN0jOPebvT4ULqsOFlg4D3U21PYxFyl5bPxVCb+01s=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ssIWZH8K1npVHkbAuOW7r2pC7IFDEVIrYnNk3mJem9tcq/djV3cDdq81y9t82b6UKaF/GJfJnZgZC3VvXewL/xJBn/3BAxWzXMZEv2nlUR4TznMie+xI2M4/DZcw5ICwjToiHnPKP59RJ1zGYEreTKpndSTnptdWv/fwjpDBGzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IRlsSHll; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 216F2C2BCC7
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 12:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777985746;
	bh=UnN0jOPebvT4ULqsOFlg4D3U21PYxFyl5bPxVCb+01s=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=IRlsSHllZD8/BQuRnRn6ONlKN4qlDzwn3ekAO14LWzEJKCcUgI2hurnCRL8xzBFNx
	 suQqXUngXfqglxi1QUCGF1Lwi3ZpTdfesFOXzVp1Et8Q0WKfeu/5ZGctL32HnbrX9q
	 TpoECMP8Tg7fzz1nmrdfpWWZlhXiNGWIUTzWvIfzymVHbUFar08jvGg4Gl8UUzBLCj
	 5Zvda88au5BJ/JevMqoA5jwIsPGCbR3d5dsL4dkDaaqeXd4hGZkEJOljjtwC+aLq3T
	 5/a9CTzBICrHDbhmKUuRBaOoubGld68PchNtFSBKrOvSUt+EDLar9MfjnWnz12+cNI
	 7Gu09GrBtLbgQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a746f9c092so5764421e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 05:55:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/+E2OcQz6vYCsI/WOLhQKRvTkzFdAj/bd0veLOhWcl0Fcyhgk81AZv1tYdgMS1JybfpLfzCcjqHL1A@vger.kernel.org
X-Gm-Message-State: AOJu0YxbP1x2nHsz4wUG3y95eDEgkmvD+DSxI6daSdkxReQztKIm+/OE
	0Cf7vvceVTwv/SzCsgknefe6I2HuZKY7G/LtjQ/C1lAkUo33+1xGIWHL9ERp80ESFLDvaUILNTD
	HXDAnK4/UXLxNggJ5eY4W1EgyCN2BtjlZgBP4rGeQJQ==
X-Received: by 2002:a05:6512:2396:b0:5a8:6def:7e38 with SMTP id
 2adb3069b0e04-5a87e8a74afmr1340645e87.15.1777985744792; Tue, 05 May 2026
 05:55:44 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 May 2026 05:55:40 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 May 2026 05:55:40 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260427135841.96266-2-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427135841.96266-1-tzungbi@kernel.org> <20260427135841.96266-2-tzungbi@kernel.org>
Date: Tue, 5 May 2026 05:55:40 -0700
X-Gmail-Original-Message-ID: <CAMRc=McG41iHWfY+3U4Xp6YNFCwbt_zAUE-2417LrQVrTfdWjA@mail.gmail.com>
X-Gm-Features: AVHnY4JHhyoRRLQHDzVdkZddcUWNNiJ_tsC-WyKv8TzUklOV0hBAVmtSZU68jtM
Message-ID: <CAMRc=McG41iHWfY+3U4Xp6YNFCwbt_zAUE-2417LrQVrTfdWjA@mail.gmail.com>
Subject: Re: [PATCH v9 1/9] revocable: Revocable resource management
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, driver-core@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Johan Hovold <johan@kernel.org>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Dan Williams <dan.j.williams@intel.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 159BD4CE16E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36204-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On Mon, 27 Apr 2026 15:58:33 +0200, Tzung-Bi Shih <tzungbi@kernel.org> said:
> The "revocable" mechanism is a synchronization primitive designed to
> manage safe access to resources that can be asynchronously removed or
> invalidated.  Its primary purpose is to prevent Use-After-Free (UAF)
> errors when interacting with resources whose lifetimes are not
> guaranteed to outlast their consumers.
>
> This is particularly useful in systems where resources can disappear
> unexpectedly, such as those provided by hot-pluggable devices like
> USB.  When a consumer holds a reference to such a resource, the
> underlying device might be removed, causing the resource's memory to
> be freed.  Subsequent access attempts by the consumer would then lead
> to UAF errors.
>
> Revocable addresses this by providing a form of "weak reference" and
> a controlled access method.  It allows a resource consumer to safely
> attempt to access the resource.  The mechanism guarantees that any
> access granted is valid for the duration of its use.  If the resource
> has already been revoked (i.e., freed), the access attempt will fail
> safely, typically by returning NULL, instead of causing a crash.
>
> It uses a provider/consumer model built on Sleepable RCU (SRCU) to
> guarantee safe memory access:
>
> - A resource provider, such as a driver for a hot-pluggable device,
>   allocates a struct revocable and initializes it with a pointer
>   to the resource.
>
> - A resource consumer that wants to access the resource allocates a
>   struct revocable_consumer containing a reference to the provider.
>
> - To access the resource, the consumer uses revocable_try_access().
>   This function enters an SRCU read-side critical section and returns
>   the pointer to the resource.  If the provider has already freed the
>   resource, it returns NULL.  After use, the consumer calls
>   revocable_withdraw_access() to exit the SRCU critical section.  There
>   are some macro level helpers for doing that.
>
>   The API provides the following contract:
>
>   - revocable_try_access() can be safely called from both process and
>     atomic contexts.
>   - It is permitted to sleep within the critical section established
>     between revocable_try_access() and revocable_withdraw_access().
>   - revocable_try_access() and the matching revocable_withdraw_access()
>     must occur in the same context.  For example, it is illegal to
>     invoke revocable_withdraw_access() in an irq handler if the matching
>     revocable_try_access() was invoked in process context.
>
> - When the provider needs to remove the resource, it calls
>   revocable_revoke().  This function sets the internal resource
>   pointer to NULL and then calls synchronize_srcu() to wait for all
>   current readers to finish before the resource can be completely torn
>   down.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---

...

> diff --git a/include/linux/revocable.h b/include/linux/revocable.h
> new file mode 100644
> index 000000000000..2bcf23f01ace
> --- /dev/null
> +++ b/include/linux/revocable.h
> @@ -0,0 +1,214 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright 2026 Google LLC
> + */
> +
> +#ifndef __LINUX_REVOCABLE_H
> +#define __LINUX_REVOCABLE_H
> +
> +#include <linux/cleanup.h>
> +#include <linux/compiler.h>

I don't think you need this header.

> +#include <linux/kref.h>
> +#include <linux/srcu.h>
> +
> +/**
> + * enum revocable_alloc_type - The allocation method for a revocable provider.
> + * @REVOCABLE_DYNAMIC: The struct revocable was dynamically allocated using
> + *                     revocable_alloc() and its lifetime is managed by
> + *                     reference counting.
> + * @REVOCABLE_EMBEDDED: The struct revocable is embedded within another
> + *                      structure.  Its lifetime is tied to the parent
> + *                      structure and is not reference counted.
> + */
> +enum revocable_alloc_type {
> +	REVOCABLE_DYNAMIC,
> +	REVOCABLE_EMBEDDED,
> +};

Maybe we don't need this public enum at all, we could just use a different
release callback for kref_put() depending on how the revocable was allocated?

The enum is not used elsewhere so it doesn't make sense to document it as if it
was part of the revocable API.

> +
> +/**
> + * struct revocable - A handle for resource provider.
> + * @srcu: The SRCU to protect the resource.
> + * @res:  The pointer of resource.  It can point to anything.
> + * @kref: The refcount for this handle.
> + * @alloc_type: The memory allocation type.
> + */
> +struct revocable {
> +	struct srcu_struct srcu;
> +	void __rcu *res;
> +	struct kref kref;
> +	enum revocable_alloc_type alloc_type;

This could be replaced with the pointer to the release callback, assigned
by revocable_alloc()/revocable_init() respectively.

> +};
> +
> +/**
> + * struct revocable_consumer - A handle for resource consumer.
> + * @rev: The pointer of resource provider.
> + * @idx: The index for the SRCU critical section.

Should any of these be accessed directly by the user? Maybe document them
as __private?

> + */
> +struct revocable_consumer {
> +	struct revocable *rev;
> +	int idx;
> +};

I'd rename it to struct revocable_handle which indicates better what it is:
it's a handle *owned* by the consumer.

> +
> +void revocable_get(struct revocable *rev);
> +void revocable_put(struct revocable *rev);
> +
> +struct revocable *revocable_alloc(void *res);
> +void revocable_revoke(struct revocable *rev);
> +int revocable_embed_init(struct revocable *rev, void *res);
> +void revocable_embed_destroy(struct revocable *rev);
> +
> +void revocable_init(struct revocable *rev, struct revocable_consumer *rc);
> +void revocable_deinit(struct revocable_consumer *rc);

If we hid the release logic, we could drop revocable_embed_destroy() and use
the same refcounting functions for both variants. I'd suggest the following:

For refcounting (same for both variants):

	void revocable_get(struct revocable *rev);
	void revocable_put(struct revocable *rev);

For dynamic variant:

	struct revocable *revocable_alloc(void *res);

For embedded:

	int revocable_init(struct revocable *rev, void *res);

For handles:

	void revocable_handle_init(struct revocable *rev, struct
revocable_consumer *rc);
	void revocable_handle_deinit(struct revocable_consumer *rc);

Does it make sense?

Other (try_access_*, etc.) helpers look good. And the API in general looks
pretty good to me too.

Bart

