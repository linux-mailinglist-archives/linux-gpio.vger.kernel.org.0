Return-Path: <linux-gpio+bounces-31483-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDjCMZyvhWkRFAQAu9opvQ
	(envelope-from <linux-gpio+bounces-31483-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Feb 2026 10:08:44 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F27FBD3B
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Feb 2026 10:08:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 340963049944
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Feb 2026 09:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B813350A1A;
	Fri,  6 Feb 2026 09:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="axK5xScw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BA02405EC
	for <linux-gpio@vger.kernel.org>; Fri,  6 Feb 2026 09:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770368589; cv=none; b=giG7JVi0pDw8kgA1EqYY4jlR0V6lpK2Bpb+1YixOqRVzD1xkdE2RX5QXnMLx/tsNV7rO1mLK5+3/bigioWE7KB0RtvLmLrusZUs6te41Bz7+AEoYIlNuHSCqs/ai0LpCh+ay6H8PlwpRjjZ3+JxdW+VDHjO060PhzxTlcPytqAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770368589; c=relaxed/simple;
	bh=tKfdQ0ne2qYG4J7V6pzJ/nncuATXkssSO/aUoqjKBis=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m9zdVSM5bDa39Ce2Gp0cUrmnH/XmIZ61micancUxuQwNL/YiPlkBbrHBtQ31l6RGMDAG0XVZS4ZXOzQ7OGM9xKueWZbvckxLQEWnqP4cviisce2cM3Jvi7tLrPBjOgrFuZOnM5g1oaD9e03MIPQ/G0zh3X6yJy1PfuK1PW+0U+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=axK5xScw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6224C116C6
	for <linux-gpio@vger.kernel.org>; Fri,  6 Feb 2026 09:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770368588;
	bh=tKfdQ0ne2qYG4J7V6pzJ/nncuATXkssSO/aUoqjKBis=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=axK5xScwg9Es8XR8c+zcPJTZrblR0hSuAgiTa3FpnZ/ILUjsehpmyc8ZfUzcSV3BR
	 3kz69K3onp5ixwum0IPqRLT4kYaPfttO8dZiBdIk3kimdNvxdhdk2OGXElO26jVWAt
	 uUyy/hEkT3hG5WSwkjq8f4a2dlKs1g8hU9+KsuLDCkexgM3AqzkJDh2PN5YPs8IDyP
	 YPsZps0ssXCoUlntAAJ4W9A8GbPlJZrZxoktXJBqvHf1nKbq3ARh38h5LScXEZo7eu
	 WrElexJdrJkaGOlry5xB/neEJFuaRPWRsP2O/ffyMLqpm4+gNh6TKgTZ5RY4ZltCGz
	 sBEpB6LxhOMhw==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-385c7507bc0so16456371fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 06 Feb 2026 01:03:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXdVjhSrJ7Rg54KMH4G12bYJNnZhJuWWpKe/oc358USJkke+AYY8+VfaGsfrDKkwUDygNTdtehuThbW@vger.kernel.org
X-Gm-Message-State: AOJu0YxdPo50qUhv0t083/CfLGv86X1hd9/cjMjkjw6rW8NtLnUX3SpF
	nBYOQr4ENOmy8SjYwSZyjWki//uGwY1WUbmyTvCz0n/0FnfhN93/NWrgcSJD+0RkFDfDRRlhxdS
	WO4tEEqBxPnIj74rHnSNzE/VMh0kfxHigms5nYH/obQ==
X-Received: by 2002:a2e:b2d4:0:b0:383:1bcc:119b with SMTP id
 38308e7fff4ca-386a0bcb53emr13479141fa.13.1770368587526; Fri, 06 Feb 2026
 01:03:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260205092840.2574840-1-tzungbi@kernel.org>
In-Reply-To: <20260205092840.2574840-1-tzungbi@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 6 Feb 2026 10:02:54 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfQCG3fAPdbtLO2iNqyu=Dq3-Urn9V5=FQBNVD5p-vyfg@mail.gmail.com>
X-Gm-Features: AZwV_QhFxeNBrmL9SPtme8oEV7zOBaeeXsHDys3k0_o0PdrX3hZCqOL2zDnGfrc
Message-ID: <CAMRc=MfQCG3fAPdbtLO2iNqyu=Dq3-Urn9V5=FQBNVD5p-vyfg@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: Fix resource leaks on errors in gpiochip_add_data_with_key()
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31483-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 48F27FBD3B
X-Rspamd-Action: no action

On Thu, Feb 5, 2026 at 10:29=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> Since commit aab5c6f20023 ("gpio: set device type for GPIO chips"),
> `gdev->dev.release` is unset.  As a result, the reference count to
> `gdev->dev` isn't dropped on the error handling paths.
>
> Drop the reference on errors.
>
> Also reorder the instructions to make the error handling simpler.
> Now gpiochip_add_data_with_key() roughly looks like:
>
>    >>> Some memory allocation.  Go to ERR ZONE 1 on errors.
>    >>> device_initialize().
>
>    gpiodev_release() takes over the responsibility for freeing the
>    resources of `gdev->dev`.  The subsequent error handling paths
>    shouldn't go through ERR ZONE 1 again which leads to double free.
>
>    >>> Some initialization mainly on `gdev`.
>    >>> The rest of initialization.  Go to ERR ZONE 2 on errors.
>    >>> Chip registration success and exit.
>
>    >>> ERR ZONE 2.  gpio_device_put() and exit.
>    >>> ERR ZONE 1.
>
> Cc: stable@vger.kernel.org
> Fixes: aab5c6f20023 ("gpio: set device type for GPIO chips")
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---

This looks good, I will queue this right after v7.0-rc1 is tagged
because this is way too risky for rc8. Let's let it spend a couple
weeks in next.

Bart

