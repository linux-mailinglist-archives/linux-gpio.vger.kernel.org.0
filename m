Return-Path: <linux-gpio+bounces-31435-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMmXI8dFg2nqkgMAu9opvQ
	(envelope-from <linux-gpio+bounces-31435-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 14:12:39 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DB9E63BD
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 14:12:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 82C793006808
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Feb 2026 13:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B11F40B6E4;
	Wed,  4 Feb 2026 13:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bO32utGR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A4B40759F
	for <linux-gpio@vger.kernel.org>; Wed,  4 Feb 2026 13:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770210754; cv=none; b=X2Y622qc7+WWkhYKSZ9dORG4Th6JAS0SRwPEbaGdMiRRF8nlAXUdJEX7yeQTb+moBp6cKBYRTrtfzun5b644uORn6I5HVFtCbunEmkudXP4zO2Qjgx5MpYvPeYyws40/R7q2kJGMBWdiiKEIWQXM434bG2WSo3SEWpTlm8AE3/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770210754; c=relaxed/simple;
	bh=5j+moHM2KtRpYQgWDekL56HBMTabiSEQYjC6JVstQ74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DhwfJ8R4GM3Npg0hhpnelstcu5cBrk9jAx7EGMyffg+1WuckzixPxdQbp+e47mIhWYSTT7n1OZTJN0PlTlOkK0hjxi1lWrkbpK5/wL9w8+9HqLHs1qEuL4VjfNgpeVvNecKpyCmpB05SQypCEHlSuxfPTepH7PYCfVa7utUajxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bO32utGR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98C20C2BCB5
	for <linux-gpio@vger.kernel.org>; Wed,  4 Feb 2026 13:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770210754;
	bh=5j+moHM2KtRpYQgWDekL56HBMTabiSEQYjC6JVstQ74=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bO32utGR3L5Lmp5h6fVzRhe79L5lVoStU5Ezp826SbubZeqVVIr9A5o6ONqSUt1vc
	 slyznVKsoCA5rgPra7CIApFXTLC5+C+ufZB29lug7g9V1i5DfCLlcW0MIbfqG5FeC2
	 J9DtCsJc1k0TuGVVEUZ+I87IW7qPfTjFBz/jWmKLRjNN7/ztqDVPo6nOfPi1KA2sa7
	 63tZJqdG+Yf/7Lqaz/ju3HaFUyrk0GzEbAjh3DZLURPTvZdOouMnGiRcAHGRjBIUKo
	 iaul3yF/67DoHQDszQo0n5AGdhMs6yUaC8UhbYnL5ZKUaT84gaw17SQUlpe/wJxYdv
	 M6o6t6LxZz/Vw==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-382fa66fa9dso52654851fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Feb 2026 05:12:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV080/+eXYuj5wKKEu4SBPVb7EBKHTTbN6D3JcccBnd7K8B41GGltNXxrzQKbge3Z4wDsAAT2PzX7zr@vger.kernel.org
X-Gm-Message-State: AOJu0YzMJ7yXCw7yeIKZ41/dQTNb1kDRcd07ge9nTgGcSav8iRNA5LCd
	V+6JU0M78wJw1rNHa92i8c5Ujc4o91s6fi213qPD2NDDSmkLxUZAf7m7+WwntjHDOAvG0cWwbVB
	bCGiCSbkA+LGpgsKjDcCvcBBNv6/UQle+/hcjT00aCQ==
X-Received: by 2002:a05:651c:3135:b0:383:27b9:caae with SMTP id
 38308e7fff4ca-38691c54309mr13408971fa.9.1770210753084; Wed, 04 Feb 2026
 05:12:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260116080235.350305-1-tzungbi@kernel.org> <20260116080235.350305-2-tzungbi@kernel.org>
In-Reply-To: <20260116080235.350305-2-tzungbi@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 4 Feb 2026 14:12:20 +0100
X-Gmail-Original-Message-ID: <CAMRc=MeO9vD0SA1ZjPP_K-0FT8ePTNNoSRqfewQRc5dMR6-SBA@mail.gmail.com>
X-Gm-Features: AZwV_Qjmn5KU3dAH1Ehw8ovrLbiT4k4_-88Pdn1EEDH0WExhMr5nRpFc8fQ3D7s
Message-ID: <CAMRc=MeO9vD0SA1ZjPP_K-0FT8ePTNNoSRqfewQRc5dMR6-SBA@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] revocable: Revocable resource management
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Dan Williams <dan.j.williams@intel.com>, Jason Gunthorpe <jgg@nvidia.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-31435-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[18];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 21DB9E63BD
X-Rspamd-Action: no action

On Fri, Jan 16, 2026 at 9:03=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> Some resources can be removed asynchronously, for example, resources
> provided by a hot-pluggable device like USB.  When holding a reference
> to such a resource, it's possible for the resource to be removed and
> its memory freed, leading to use-after-free errors on subsequent access.
>
> The "revocable" mechanism addresses this by establishing a weak reference
> to a resource that might be freed at any time.  It allows a resource
> consumer to safely attempt to access the resource, guaranteeing that the
> access is valid for the duration of its use, or it fails safely if the
> resource has already been revoked.
>
> The implementation uses a provider/consumer model built on Sleepable
> RCU (SRCU) to guarantee safe memory access:
>
> - A resource provider, such as a driver for a hot-pluggable device,
>   allocates a struct revocable_provider and initializes it with a pointer
>   to the resource.
>
> - A resource consumer that wants to access the resource allocates a
>   struct revocable which acts as a handle containing a reference to the
>   provider.
>
> - To access the resource, the consumer uses revocable_try_access().
>   This function enters an SRCU read-side critical section and returns
>   the pointer to the resource.  If the provider has already freed the
>   resource, it returns NULL.  After use, the consumer calls
>   revocable_withdraw_access() to exit the SRCU critical section.  The
>   REVOCABLE_TRY_ACCESS_WITH() and REVOCABLE_TRY_ACCESS_SCOPED() are
>   convenient helpers for doing that.
>
> - When the provider needs to remove the resource, it calls
>   revocable_provider_revoke().  This function sets the internal resource
>   pointer to NULL and then calls synchronize_srcu() to wait for all
>   current readers to finish before the resource can be completely torn
>   down.
>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---

[snip]

> diff --git a/include/linux/revocable.h b/include/linux/revocable.h
> new file mode 100644
> index 000000000000..659ba01c58db
> --- /dev/null
> +++ b/include/linux/revocable.h
> @@ -0,0 +1,69 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright 2026 Google LLC
> + */
> +
> +#ifndef __LINUX_REVOCABLE_H
> +#define __LINUX_REVOCABLE_H
> +
> +#include <linux/compiler.h>
> +#include <linux/cleanup.h>
> +
> +struct device;
> +struct revocable;
> +struct revocable_provider;
> +
> +struct revocable_provider *revocable_provider_alloc(void *res);
> +void revocable_provider_revoke(struct revocable_provider *rp);
> +struct revocable_provider *devm_revocable_provider_alloc(struct device *=
dev,
> +                                                        void *res);
> +
> +struct revocable *revocable_alloc(struct revocable_provider *rp);
> +void revocable_free(struct revocable *rev);
> +void *revocable_try_access(struct revocable *rev) __acquires(&rev->rp->s=
rcu);
> +void revocable_withdraw_access(struct revocable *rev) __releases(&rev->r=
p->srcu);
> +
> +DEFINE_FREE(access_rev, struct revocable *, if (_T) revocable_withdraw_a=
ccess(_T))
> +
> +/**
> + * REVOCABLE_TRY_ACCESS_WITH() - A helper for accessing revocable resour=
ce
> + * @_rev: The consumer's ``struct revocable *`` handle.
> + * @_res: A pointer variable that will be assigned the resource.
> + *
> + * The macro simplifies the access-release cycle for consumers, ensuring=
 that
> + * revocable_withdraw_access() is always called, even in the case of an =
early
> + * exit.
> + *
> + * It creates a local variable in the current scope.  @_res is populated=
 with
> + * the result of revocable_try_access().  The consumer code **must** che=
ck if
> + * @_res is ``NULL`` before using it.  The revocable_withdraw_access() f=
unction
> + * is automatically called when the scope is exited.
> + *
> + * Note: It shares the same issue with guard() in cleanup.h.  No goto st=
atements
> + * are allowed before the helper.  Otherwise, the compiler fails with
> + * "jump bypasses initialization of variable with __attribute__((cleanup=
))".
> + */
> +#define REVOCABLE_TRY_ACCESS_WITH(_rev, _res)                           =
       \
> +       struct revocable *__UNIQUE_ID(name) __free(access_rev) =3D _rev; =
         \
> +       _res =3D revocable_try_access(_rev)
> +
> +#define _REVOCABLE_TRY_ACCESS_SCOPED(_rev, _label, _res)                =
       \
> +       for (struct revocable *__UNIQUE_ID(name) __free(access_rev) =3D _=
rev;     \
> +            (_res =3D revocable_try_access(_rev)) || true; ({ goto _labe=
l; }))   \
> +               if (0) {                                                 =
       \
> +_label:                                                                 =
               \
> +                       break;                                           =
       \
> +               } else
> +
> +/**
> + * REVOCABLE_TRY_ACCESS_SCOPED() - A helper for accessing revocable reso=
urce
> + * @_rev: The consumer's ``struct revocable *`` handle.
> + * @_res: A pointer variable that will be assigned the resource.
> + *
> + * Similar to REVOCABLE_TRY_ACCESS_WITH() but with an explicit scope fro=
m a
> + * temporary ``for`` loop.
> + */
> +#define REVOCABLE_TRY_ACCESS_SCOPED(_rev, _res)                         =
               \

Seeing this code used in GPIO, I would suggest a coding-style change
before it makes its way into other places:

revocable_try_access_with() looks better and is in line with most
other macros. There's no reason for capitalisation IMO and it makes
the code using it look like there was some issue with it, as if this
was a WARN() or something.

I'd suggest changing all these macros to using lowercase and queuing
it for v7.0.

Bartosz

> +       _REVOCABLE_TRY_ACCESS_SCOPED(_rev, __UNIQUE_ID(label), _res)
> +
> +#endif /* __LINUX_REVOCABLE_H */
> --
> 2.52.0.457.g6b5491de43-goog
>

