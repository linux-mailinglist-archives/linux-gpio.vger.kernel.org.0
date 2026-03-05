Return-Path: <linux-gpio+bounces-32557-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cI/lFWNeqWlc6QAAu9opvQ
	(envelope-from <linux-gpio+bounces-32557-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 11:43:47 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5134F20FE60
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 11:43:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C5EDE301281A
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Mar 2026 10:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE4533822B4;
	Thu,  5 Mar 2026 10:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mkI+wHkA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B165237FF6D
	for <linux-gpio@vger.kernel.org>; Thu,  5 Mar 2026 10:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772707414; cv=none; b=GAdzbSogWliVUjPS+K2Zt334jQci+yqkt3uAVOJmuv+t3mlRi4CytnxH21XCrgsaAsnQOO60LC6rKiFhxfeA6/7Ka4nKxSETw/i51h3lbpaD+9TEFGUmTiCET61EVRaMJyGVobYX3C6Lf0/ZKGjSowOEXHJchyWwXEKkC1+Muoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772707414; c=relaxed/simple;
	bh=BDXLchQzcpuCt+RlIax/cWPhjWIHs2fygcRWDyjz/Dg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=goWXfUdIf8dc5PrAUUhviyVA3i9ZpCzIIJHqDjV5YQ++ALVoBPGQFOTiFuBKT55bWg9XgaH9dAFTYvoUfx7USmXGWvJz9D2hAAJ4GCdZkBF0cByX0mkz0BKDn87lGLguXJuHcYhGsDzVPRHn6E6YGZ1OKRHEf2RIdzBLblgvn2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mkI+wHkA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F695C19422
	for <linux-gpio@vger.kernel.org>; Thu,  5 Mar 2026 10:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772707414;
	bh=BDXLchQzcpuCt+RlIax/cWPhjWIHs2fygcRWDyjz/Dg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mkI+wHkAxCfJLWvBYkkZ2AuL01yyOHRvp/FWfhBZRLkx4Zum7wNcYbPL6XutHDxl/
	 UFA0lSp8Hcq8Uv+DmXIdVd+HcSvNmrJfZG1kVE2TGLtV+NJpdKd2vd5KI8u3ZV1xJp
	 6g98egKpdKUwgfZFSzxFvsmP2ZEvMD6UJn5CcIbaLI8fBLU0Bv8ajumJxBRZMCNFgN
	 IYNrS2gnXvPUrXGO6gJbiFe0UuV4a358MZlcmZbbp+GtXjR5yv1ZTUmqRQKCZSNtSa
	 4dAtCMAkuVpxqUcwxXgxMxQVbTHIJFa8e56qVARnd4CY/WH7CHUmnZKkGtlXx0y8yN
	 5XRLQAWTdqMEw==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38a1eb8b560so44338821fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 05 Mar 2026 02:43:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUCUyac+dhrlI0bW6joD3QH9/q2BAMdWZtoWr5B3L08J7eQiDKhcsojKUox6YguNA6oXJ/FSALP42Ta@vger.kernel.org
X-Gm-Message-State: AOJu0YwhYE4YtWYd3FBHr8jx9LN1kmRyAXpU5laOHZWRPLxM8KfyuoLv
	eu1lfxUTR0YX8i53I+BevaayT2lqyktgsU24d/f/6kf2mRFN/B6kyS5vkroDsb5LPw/RYREAmZd
	PDRjdG8hNk6ox39nxJVjavuy48RECc3an5WC1CqjRcg==
X-Received: by 2002:a2e:be0d:0:b0:38a:35be:bf4e with SMTP id
 38308e7fff4ca-38a35bec193mr6150651fa.24.1772707413045; Thu, 05 Mar 2026
 02:43:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7187C401290C256B+20260304084808.440955-1-xujialu@vimux.org> <1777BBA64A3D0F97+20260304105215.536399-1-xujialu@vimux.org>
In-Reply-To: <1777BBA64A3D0F97+20260304105215.536399-1-xujialu@vimux.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 5 Mar 2026 11:43:20 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfBqPP3W0nCvyM9hqmgZbX8SVSZ0DGrJwLdKoAK7gqgvA@mail.gmail.com>
X-Gm-Features: AaiRm52fjOUc5LZjGz_yqLKyR-H0G9JuRRVR4dArrtK_1qhyD2My05Xe08G1ZBw
Message-ID: <CAMRc=MfBqPP3W0nCvyM9hqmgZbX8SVSZ0DGrJwLdKoAK7gqgvA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Remove <linux/of_gpio.h>
To: Jialu Xu <xujialu@vimux.org>
Cc: kees@kernel.org, krzk@kernel.org, linusw@kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 5134F20FE60
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32557-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Action: no action

On Wed, Mar 4, 2026 at 11:52=E2=80=AFAM Jialu Xu <xujialu@vimux.org> wrote:
>
> Convert the last three NFC consumers of <linux/of_gpio.h> to the
> GPIO descriptor API, then remove the deprecated header entirely.
>
> Changes in v2:
> - Add rename quirks in gpiolib-of.c for s3fwrn5 legacy DT properties
>   (s3fwrn5,en-gpios -> en, s3fwrn5,fw-gpios -> wake) to preserve
>   backward compatibility with old device trees. (Linus Walleij)
>
> Jialu Xu (3):
>   nfc: s3fwrn5: convert to gpio descriptors
>   nfc: nfcmrvl: convert to gpio descriptors
>   gpio: remove of_get_named_gpio() and <linux/of_gpio.h>
>
>  drivers/gpio/TODO                | 28 ----------------
>  drivers/gpio/gpiolib-of.c        | 31 +++---------------
>  drivers/nfc/nfcmrvl/main.c       | 46 +++++++++-----------------
>  drivers/nfc/nfcmrvl/nfcmrvl.h    |  4 ++-
>  drivers/nfc/nfcmrvl/uart.c       | 23 +++++++++----
>  drivers/nfc/nfcmrvl/usb.c        |  2 +-
>  drivers/nfc/s3fwrn5/i2c.c        | 55 +++++---------------------------
>  drivers/nfc/s3fwrn5/phy_common.c | 11 +++----
>  drivers/nfc/s3fwrn5/phy_common.h |  5 +--
>  drivers/nfc/s3fwrn5/uart.c       | 45 +++++++-------------------
>  include/linux/of_gpio.h          | 38 ----------------------
>  11 files changed, 67 insertions(+), 221 deletions(-)
>  delete mode 100644 include/linux/of_gpio.h
>
> --
> 2.47.3
>

Hi!

I really appreciate the work but your patches need to carry your
Signed-off-by tags under the commit messages before they can be
considered.

Bartosz

