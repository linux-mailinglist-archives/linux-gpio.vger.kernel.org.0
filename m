Return-Path: <linux-gpio+bounces-36575-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIYFAHPXAWryjwEAu9opvQ
	(envelope-from <linux-gpio+bounces-36575-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 15:19:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DF850EC11
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 15:19:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B0343061DC0
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 13:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F28A92DC331;
	Mon, 11 May 2026 13:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eFPjq6U+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25453E8C5C
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 13:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778505416; cv=none; b=tToJ2SkUa5I7kLlMyGJ9Z5XEhXAo3VrYNXghWZDpbBqtlGp5rOCs/4PGrUjTh9uaWQsHYJWEIjkO5c2QS7TuuMkn9flzfu+Ly+awwb568Y17NM+g8cHPWfiVnwU3euNxqYMYbaXzltaku3HxCmZxJs1IS/gQ6fHoO3iEzLTTFzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778505416; c=relaxed/simple;
	bh=/2hZE72bRvY2vUnMb/uhGG4GUPwZ4Vo5Uba2wxWzeMs=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hdY0M8RU6UYPXavbwyJ+jrR+tc2o5uHoF4Htrq+rt0KxXD0I6kh2Ex5QYnXmUnErK/cXGmXR9KH3/VyJtj87cgK1Ys3vSwrsiGlRz9LsUae+ybAGIxpvFLJVsBvIpco65r944R8bxtj8P6qpGsJIqVZ1MaftkNB0igUdMQ2TOww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eFPjq6U+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DEBFC2BCFA
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 13:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778505416;
	bh=/2hZE72bRvY2vUnMb/uhGG4GUPwZ4Vo5Uba2wxWzeMs=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=eFPjq6U+IgMAYS854sjcibMAZH0ZWHsSHL+ee+ca5sUM8z8vHGDyNGgy6nHILAFEn
	 aZEsSfHGnwdhzbg/Ouc7H4+Ndma7aJvVsJ6jw4HGI/TJUN6xxLLXxCTgXTIn+MASyL
	 WnBWx3P9hOrKBccfk8FJcSbbauIkogtpB7UTFfOeQ3r38+IzBiT/1zV+55nekpmhML
	 n2cD58euyddXH67u35yDhxaJ3L5991DH7X+oACqdflet2jawoLMf9zVbJPAhfGQJjh
	 CTwp1G751aOf7rYbrak6QYvYLHc+FgYSwmty5cfFZP6pdpZRU7KHhLhRasbAwrtC9O
	 Nlz7ggROpk8QA==
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12e332315a8so9578005c88.0
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 06:16:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8ifRcN9JkHUlxmgzTSeycVztih2qNHbyuWXvjfVNeNBmHTsqa/Ix0enJYddhi4QB71zJgyAdpKkqQI@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4uXxG2qtX63FtxhU/MkfkBIh3SJvw+eeqHhPZDRhQr9skCOcr
	g79rBmANY7th6vYsotTexDQCLTtoEQssKlfoSjZlBbSxLDzpQAL5IiIlRBtLiLFgkNoLpFMhr9J
	ghtvJL9lJylAq5dN/dirW/dx5g8MN+pfH+HpA3S/5Hg==
X-Received: by 2002:a05:7022:30b:b0:12d:ea4f:99de with SMTP id
 a92af1059eb24-132a72ba39emr4967688c88.0.1778505415636; Mon, 11 May 2026
 06:16:55 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 May 2026 06:16:52 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 May 2026 06:16:52 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260508105448.31799-2-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508105448.31799-1-tzungbi@kernel.org> <20260508105448.31799-2-tzungbi@kernel.org>
Date: Mon, 11 May 2026 06:16:52 -0700
X-Gmail-Original-Message-ID: <CAMRc=McRGoKdbpwyMO5x-Ttyr2n7+Chd8F2jwBF8j33SvNAGcg@mail.gmail.com>
X-Gm-Features: AVHnY4IuteIeCQ0FxTzykUZjCQ_3vcQ4MPefQlPh6VQezy9YwMm5Tip5tjjQRMU
Message-ID: <CAMRc=McRGoKdbpwyMO5x-Ttyr2n7+Chd8F2jwBF8j33SvNAGcg@mail.gmail.com>
Subject: Re: [PATCH v10 1/9] revocable: Revocable resource management
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, driver-core@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Johan Hovold <johan@kernel.org>, "Paul E . McKenney" <paulmck@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 63DF850EC11
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36575-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Action: no action

On Fri, 8 May 2026 12:54:40 +0200, Tzung-Bi Shih <tzungbi@kernel.org> said:
> The "revocable" mechanism is a synchronization primitive designed to
> manage safe access to resources that can be asynchronously removed or
> invalidated.  Its primary purpose is to prevent Use-After-Free (UAF)
> errors when interacting with resources whose lifetimes are not
> guaranteed to outlast their consumers.
>

...

> diff --git a/include/linux/revocable.h b/include/linux/revocable.h
> new file mode 100644
> index 000000000000..b66d41b92ee5
> --- /dev/null
> +++ b/include/linux/revocable.h
> @@ -0,0 +1,204 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright 2026 Google LLC
> + */
> +
> +#ifndef __LINUX_REVOCABLE_H
> +#define __LINUX_REVOCABLE_H
> +
> +#include <linux/cleanup.h>
> +#include <linux/kref.h>
> +#include <linux/srcu.h>
> +
> +/**
> + * struct revocable - A handle for resource provider.
> + * @srcu: The SRCU to protect the resource.
> + * @res:  The pointer of resource.  It can point to anything.
> + * @kref: The refcount for this handle.
> + * @embedded: Indicate if the handle is embedded in another struct.
> + *
> + * Note: All members of this structure are intended to be opaque and should
> + * not be accessed directly by the users.
> + */
> +struct revocable {
> +	struct srcu_struct srcu;
> +	void __rcu *res;
> +	struct kref kref;
> +	bool embedded;
> +};
> +
> +/**
> + * struct revocable_handle - A handle for resource consumer.
> + * @rev: The pointer of resource provider.
> + * @idx: The index for the SRCU critical section.
> + *
> + * Note: All members of this structure are intended to be opaque and should
> + * not be accessed directly by the users.
> + */
> +struct revocable_handle {
> +	struct revocable *rev;
> +	int idx;
> +};
> +
> +struct revocable *revocable_alloc(void *res);
> +int revocable_init(struct revocable *rev, void *res);
> +void revocable_revoke(struct revocable *rev);
> +void revocable_get(struct revocable *rev);
> +void revocable_put(struct revocable *rev);
> +
> +void revocable_handle_init(struct revocable *rev, struct revocable_handle *rh);
> +void revocable_handle_deinit(struct revocable_handle *rh);
> +void *revocable_try_access(struct revocable_handle *rh)
> +	__acquires(&rh->rev->srcu);
> +void revocable_withdraw_access(struct revocable_handle *rh)
> +	__releases(&rh->rev->srcu);
> +
> +DEFINE_FREE(access_rev, struct revocable_handle *, {
> +	revocable_withdraw_access(_T);
> +	revocable_handle_deinit(_T);
> +})
> +
> +#define _revocable_try_access_with(_rev, _rh, _res)				\
> +	struct revocable_handle _rh;						\
> +	struct revocable_handle *__UNIQUE_ID(name) __free(access_rev) = &_rh;	\
> +										\
> +	revocable_handle_init(_rev, &_rh);					\
> +	_res = revocable_try_access(&_rh)
> +
> +/**
> + * revocable_try_access_with() - A helper for accessing revocable resource
> + * @_rev: The pointer of resource provider.
> + * @_res: A pointer variable that will be assigned the resource.
> + *
> + * The macro simplifies the access-release cycle for consumers, ensuring that
> + * corresponding revocable_withdraw_access() and revocable_handle_deinit() are
> + * called, even in the case of an early exit.
> + *
> + * It creates a local variable in the current scope.  @_res is populated with
> + * the result of revocable_try_access().  Callers **must** check if @_res is
> + * ``NULL`` before using it.  The revocable_withdraw_access() function is
> + * automatically called when the scope is exited.
> + *
> + * Note: It shares the same issue with guard() in cleanup.h.  No goto statements
> + * are allowed before the helper.  Otherwise, the compiler fails with
> + * "jump bypasses initialization of variable with __attribute__((cleanup))".
> + */
> +#define revocable_try_access_with(_rev, _res)					\
> +	_revocable_try_access_with(_rev, __UNIQUE_ID(name), _res)
> +
> +/**
> + * revocable_try_access_or_return_err() - Variant of revocable_try_access_with()
> + * @_rev: The pointer of resource provider.
> + * @_res: A pointer variable that will be assigned the resource.
> + * @_err: The error code to return if resource is revoked.
> + *
> + * Similar to revocable_try_access_with() but returns from the current function
> + * with @_err if the resource is revoked.  Callers don't need to check @_res for
> + * ``NULL`` as this handles the revocation case by returning early.
> + */
> +#define revocable_try_access_or_return_err(_rev, _res, _err)			\
> +	_revocable_try_access_with(_rev, __UNIQUE_ID(name), _res);		\
> +	if (!_res)								\
> +		return _err
> +
> +/**
> + * revocable_try_access_or_return() - Variant of revocable_try_access_with()
> + * @_rev: The pointer of resource provider.
> + * @_res: A pointer variable that will be assigned the resource.
> + *
> + * Similar to revocable_try_access_or_return_err() but returns -ENODEV if the
> + * resource is revoked.
> + */
> +#define revocable_try_access_or_return(_rev, _res)				\
> +	revocable_try_access_or_return_err(_rev, _res, -ENODEV)
> +
> +/**
> + * revocable_try_access_or_return_void() - Variant of revocable_try_access_with()
> + * @_rev: The pointer of resource provider.
> + * @_res: A pointer variable that will be assigned the resource.
> + *
> + * Similar to revocable_try_access_or_return_err() but returns void if the
> + * resource is revoked.
> + */
> +#define revocable_try_access_or_return_void(_rev, _res)				\
> +	revocable_try_access_or_return_err(_rev, _res, )
> +
> +#define _revocable_try_access_with_scoped(_rev, _rh, _label, _res)		\
> +	for (struct revocable_handle _rh,					\
> +			*__UNIQUE_ID(name) __free(access_rev) = &_rh;		\
> +	     ({ revocable_handle_init(_rev, &_rh);				\
> +		_res = revocable_try_access(&_rh);				\
> +		true; });							\
> +	     ({ goto _label; }))						\
> +		if (0) {							\
> +_label:										\
> +			break;							\
> +		} else
> +
> +/**
> + * revocable_try_access_with_scoped() - Variant of revocable_try_access_with()
> + * @_rev: The pointer of resource provider.
> + * @_res: A pointer variable that will be assigned the resource.
> + *
> + * Similar to revocable_try_access_with() but with an explicit scope from a
> + * temporary ``for`` loop.
> + */
> +#define revocable_try_access_with_scoped(_rev, _res)				\
> +	_revocable_try_access_with_scoped(_rev, __UNIQUE_ID(name),		\
> +					  __UNIQUE_ID(label), _res)
> +
> +/**
> + * revocable_try_access_or_return_err_scoped() - Variant of revocable_try_access_with_scoped()
> + * @_rev: The pointer of resource provider.
> + * @_res: A pointer variable that will be assigned the resource.
> + * @_err: The error code to return if resource is revoked.
> + *
> + * Similar to revocable_try_access_with_scoped() but returns from the current
> + * function with @_err if the resource is revoked.  Callers don't need to check
> + * @_res for ``NULL`` as this handles the revocation case by returning early.
> + */
> +#define revocable_try_access_or_return_err_scoped(_rev, _res, _err)		\
> +	_revocable_try_access_with_scoped(_rev, __UNIQUE_ID(name),		\
> +					  __UNIQUE_ID(label), _res)		\
> +	if (!_res) {								\
> +		return _err;							\
> +	} else
> +
> +/**
> + * revocable_try_access_or_return_scoped() - Variant of revocable_try_access_with_scoped()
> + * @_rev: The pointer of resource provider.
> + * @_res: A pointer variable that will be assigned the resource.
> + *
> + * Similar to revocable_try_access_or_return_err_scoped() but returns -ENODEV
> + * if the resource is revoked.
> + */
> +#define revocable_try_access_or_return_scoped(_rev, _res)			\
> +	revocable_try_access_or_return_err_scoped(_rev, _res, -ENODEV)
> +
> +/**
> + * revocable_try_access_or_return_void_scoped() - Variant of revocable_try_access_with_scoped()
> + * @_rev: The pointer of resource provider.
> + * @_res: A pointer variable that will be assigned the resource.
> + *
> + * Similar to revocable_try_access_or_return_err_scoped() but returns void
> + * if the resource is revoked.
> + */
> +#define revocable_try_access_or_return_void_scoped(_rev, _res)			\
> +	revocable_try_access_or_return_err_scoped(_rev, _res, )
> +
> +/**
> + * revocable_try_access_or_skip_scoped() - Variant of revocable_try_access_with_scoped()
> + * @_rev: The pointer of resource provider.
> + * @_res: A pointer variable that will be assigned the resource.
> + *
> + * Similar to revocable_try_access_with_scoped() but skips the following code
> + * block if the resource is revoked.
> + */
> +#define revocable_try_access_or_skip_scoped(_rev, _res)				\
> +	_revocable_try_access_with_scoped(_rev, __UNIQUE_ID(name),		\
> +					  __UNIQUE_ID(label), _res)		\
> +	if (!_res) {								\
> +		break;								\
> +	} else
> +
> +#endif /* __LINUX_REVOCABLE_H */
> --
> 2.51.0
>
>

I have not looked into the implementation details all that much - that can
always be ironed out later - but for the API part: I quite like it now. The
resulting GPIO code looks cleaner and I think it's worth adding or v7.2.

Thanks for addressing the issues and perseverence.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Bart

