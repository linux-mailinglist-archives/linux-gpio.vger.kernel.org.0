Return-Path: <linux-gpio+bounces-37531-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNDJCf1+FWqtWAcAu9opvQ
	(envelope-from <linux-gpio+bounces-37531-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 13:07:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 986BC5D4AAD
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 13:07:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 07838300FB4D
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 11:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13F583DCDAA;
	Tue, 26 May 2026 11:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bltu/fUZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88EB3D9038
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 11:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779793657; cv=none; b=s3uJgR15yzTiJhJEaXT3thkANlTkqjVJLvyr91FkdQn+h6G8ECnmHZvIcWGUS/xunE31LFfRCRSCInHHdADDN/9OHj6DQAjVu2tYF2W8leYwwkCDebPk6Oir7Zp3LWxKl7estnNBV1/sooUvO3EmkrksXwAmeMuZP/e/7fP/34g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779793657; c=relaxed/simple;
	bh=apLfsfv0Zuxu4x41/D6y6qqvAEw+JtmWcoJ6QMWvc0M=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B/ddHmokXk5eikuPzv3nmXhcaiEGk340a2gFuGnzHQXYP22AhS4r5xS0T5gy3SLAPeGNz0bX2elLliWznGOH1it1zlRrl/NdcEvZ5jkYWI+H9c0iuaBL50TdzlCeqhcd1RTPoQS44vardsYZ12OGaJfu+UKnnpIutJUV5PI1VbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bltu/fUZ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FB901F00A3C
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 11:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779793656;
	bh=NEHy/uQhle/W+rRn6IyRGtaD7BhxmVr+zdyzoNGna98=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=bltu/fUZeC9i4aTl7CQTAbV7vDzw2cQvr4rLqOYvwvv+Quk7UdNxJM+zLwYrchSev
	 px0qB68stRgPbFks4pmsvqcdein+bU+1uk2ywyfqLC5/VRsghb9PlKIvWfYTLUVap7
	 Z4wNNWeE496mUVliaaY5wWsOyHw6QruJK5D5ESpXClzVMh1AtsJBvq1FGXcT3pKwvX
	 el69XwCmkeFh4JvnVb0pmw7Ei4RAjYOBrr4IlCl4qjkzcj26Kbt0UUaGgxDztaN+2M
	 p1IdPLgKbJUxgdEDsuuHyMO6qsD2saAA4p604r0go6S8DTERl+lijmO6qgiM+poli3
	 +P/tc6/cGqJQQ==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3937014be0cso40470921fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 04:07:36 -0700 (PDT)
X-Gm-Message-State: AOJu0YzNmgWhmTmBId6vG/zD6mjIW+XkD5eIZ0QlPd2M9DjJ1HfhbYlF
	NWVE80eFY9ZnU+C7gtcugwHt7hJwEGxCkLyfgiomFOMEHCz4lLht5k22IvEd/54hPB7e8hAhvZt
	4frVuVTNT9OBOHotBKa8az1kVFE0gdO0cVe/DpkE7uw==
X-Received: by 2002:a05:651c:2101:b0:38c:594e:ffd4 with SMTP id
 38308e7fff4ca-395d8d668c4mr53301751fa.25.1779793655300; Tue, 26 May 2026
 04:07:35 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 26 May 2026 07:07:33 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 26 May 2026 07:07:33 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260522200419.105496-3-vfazio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522200419.105496-1-vfazio@gmail.com> <20260522200419.105496-3-vfazio@gmail.com>
Date: Tue, 26 May 2026 07:07:33 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mfh=NkxE-i88gvfC2X1dMTX_2wXT4G4bvvzOvTxxq7=qA@mail.gmail.com>
X-Gm-Features: AVHnY4KFTrLOa0ENPYBcueoPXq4T8g9EK3r26sdoubjKHJLkXgped5-M91tmeJA
Message-ID: <CAMRc=Mfh=NkxE-i88gvfC2X1dMTX_2wXT4G4bvvzOvTxxq7=qA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 2/3] bindings: python: support free-threaded CPython
To: Vincent Fazio <vfazio@gmail.com>
Cc: linux-gpio@vger.kernel.org, brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37531-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,python.org:url];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 986BC5D4AAD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 22 May 2026 22:04:17 +0200, Vincent Fazio <vfazio@gmail.com> said:
> PEP 703 [0] discusses making the GIL optional in certain builds of the
> CPython interpreter.
>
> This build option was available experiementally in Python 3.13 but has
> since been stabilized in Python 3.14 per PEP 779 [1].
>
> According to the porting guide [2], there is no strict requirement that
> C extensions must be thread-safe.
>
> Experiments have shown that no logic changes are required if callers
> use sychronization mechanisms provided by the Python standard library.
>
> The documentation has been updated to call this out specifically using
> terminology from the porting guide [3].
>
> [0]: https://peps.python.org/pep-0703/
> [1]: https://peps.python.org/pep-0779/
> [2]: https://py-free-threading.github.io/porting/#define-and-document-thread-safety-guarantees
> [3]: https://py-free-threading.github.io/documentation-principles/#free-threading-terminology
>
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> ---
>  bindings/python/README.md                | 8 +++++++-
>  bindings/python/gpiod/ext/module.c       | 5 ++++-
>  bindings/python/pyproject.toml           | 2 +-
>  bindings/python/tests/gpiosim/ext.c      | 3 +++
>  bindings/python/tests/system/ext.c       | 3 +++
>  bindings/python/tests/tests_threading.py | 3 +++
>  docs/python_api.rst                      | 6 ++++++
>  7 files changed, 27 insertions(+), 3 deletions(-)
>
> diff --git a/bindings/python/README.md b/bindings/python/README.md
> index 2faa6f4..f3cd77a 100644
> --- a/bindings/python/README.md
> +++ b/bindings/python/README.md
> @@ -5,10 +5,16 @@
>
>  These are the official Python bindings for [libgpiod](https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/about/).
>
> +Both GIL-enabled and free-threaded CPython are supported.
> +
> +The Python bindings, much like the C API they wrap, are not thread-safe and do
> +require external synchronization by the caller to serialize access to objects
> +shared across threads.

Do we need to document which classes and methods need synchronization?

Bart

