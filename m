Return-Path: <linux-gpio+bounces-32176-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEkjAnD8nmm+YAQAu9opvQ
	(envelope-from <linux-gpio+bounces-32176-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Feb 2026 14:43:12 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A40B41984A8
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Feb 2026 14:43:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D70B9300DCC5
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Feb 2026 13:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C087D3B8D6A;
	Wed, 25 Feb 2026 13:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kI6nKVAG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DD83939BA
	for <linux-gpio@vger.kernel.org>; Wed, 25 Feb 2026 13:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772026980; cv=none; b=uiqwTSpZtpXKA+u+u0LQPO0Lka8eYEgC/Yn5amVFTlAMcWzimgfWsC6GRH5UbDxgf92AqL6SROZYE7v6UbrOkY5xl/V+YxJKY/Uuen4w47cYILK4am1TKQ2nP01DyQhh9ALDuqV0bMG2kjCTJ4O5nsG0Xv0S4EnEkux/KjDzTiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772026980; c=relaxed/simple;
	bh=sZq7CJgOX8BpAWg4KZQQtwpzCSGI328g9DiySOCIW/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z8NtKLoIJCMIj9A00J2LHkj8lOMACpijmB4t4vfsRgcA5lRMIEzFwwYu/yzFs7XPWu8NOUNM4EDYRnE3YA3IEzcrRJmbCyRcIWNUsRr2/1jHe57IH5FZzql45Orbmen71RalqZKngUA3rwr/PgqZYdZbytX6rKPGxC9D3LRjnmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kI6nKVAG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17966C19421
	for <linux-gpio@vger.kernel.org>; Wed, 25 Feb 2026 13:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772026980;
	bh=sZq7CJgOX8BpAWg4KZQQtwpzCSGI328g9DiySOCIW/o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kI6nKVAGlRo/t8OU7TVdYdAB9mhdAPHaURZ8oB1eE++IFcQBPCZlaIf7x1CtWqGNs
	 vdgC+FOvah/FYOIQYwhW4BpK9MYIvKGCj6kSW8t7Cc9BUHoI79lX38xahk4QiMk58V
	 hbU1E0bFL8xtj2/b+Jm8Zxl87Y54fZ6OyYWMKWhtYPg8khr/TYOee0CIP/h6JQWc99
	 fxKEClNbpjPWD7HDolwHWqFF2UG/zGp2izOY2706emMBwleE+/KsYQZ41mYGuAQOet
	 QaV2cMnN8jOPyO7ww98cK5div21SG/gwxf8QHOKsi5kE0m7eZKcM+gWT9oQDfcAktJ
	 PE12jPmsQF65w==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-386714da2a2so51162661fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 25 Feb 2026 05:42:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWJanZrpeGCSeU2lbLlAIQ46R4NYRPnzZqkTowUOgLjO/rZGT4Rm9U3RQ2LcExh7DFNOQV45LTpdX8w@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1ua3rwGP8zoyiZr+aFgfVc5l3/S4pFvRDFeoR1YbFdCvWeldO
	AOzVuyBbI9vr9wbWIsybSeUELFKigJbKcmijGg5KUIR8qywpp/ZKqKmdcpyP2lH21Q+MnQM2azs
	KqiCjdftjxHbYjmdGXIIoNDWCL8AHEfyA/lZP8goOdQ==
X-Received: by 2002:a05:651c:f08:b0:387:421c:3cc with SMTP id
 38308e7fff4ca-389ee265578mr1704521fa.16.1772026978738; Wed, 25 Feb 2026
 05:42:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225132259.26815-1-pranavkharche7@gmail.com>
In-Reply-To: <20260225132259.26815-1-pranavkharche7@gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 25 Feb 2026 14:42:47 +0100
X-Gmail-Original-Message-ID: <CAMRc=McPNNWBmMVUcRHtLjt6NudESAnGpHa6-md1Cxm9HbgOjA@mail.gmail.com>
X-Gm-Features: AaiRm50sYMrxhNPtTKKmHM_AuXAWLDT7t1VbfHsVtzrmRxXle48FyjMBHmFSuHA
Message-ID: <CAMRc=McPNNWBmMVUcRHtLjt6NudESAnGpHa6-md1Cxm9HbgOjA@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: gpiolib-swnode: Remove deprecated label fallback
 for GPIO device lookup
To: Pranav Kharche <pranavkharche7@gmail.com>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, 
	dan.carpenter@linaro.org, lkp@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32176-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A40B41984A8
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 2:23=E2=80=AFPM Pranav Kharche <pranavkharche7@gmai=
l.com> wrote:
>
> Signed-off-by: Pranav Kharche <pranavkharche7@gmail.com>
> ---
>  drivers/gpio/gpiolib-swnode.c | 18 +-----------------
>  1 file changed, 1 insertion(+), 17 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-swnode.c b/drivers/gpio/gpiolib-swnode.=
c
> index 0d7f3f09a0b4..d6ab5bf0d2f1 100644
> --- a/drivers/gpio/gpiolib-swnode.c
> +++ b/drivers/gpio/gpiolib-swnode.c
> @@ -43,23 +43,7 @@ static struct gpio_device *swnode_get_gpio_device(stru=
ct fwnode_handle *fwnode)
>  fwnode_lookup:
>         gdev =3D gpio_device_find_by_fwnode(fwnode);
>         if (!gdev && gdev_node && gdev_node->name)
> -               /*
> -                * FIXME: We shouldn't need to compare the GPIO controlle=
r's
> -                * label against the software node that is supposedly att=
ached
> -                * to it. However there are currently GPIO users that - k=
nowing
> -                * the expected label of the GPIO chip whose pins they wa=
nt to
> -                * control - set up dummy software nodes named after thos=
e GPIO
> -                * controllers, which aren't actually attached to them. I=
n this
> -                * case gpio_device_find_by_fwnode() will fail as no devi=
ce on
> -                * the GPIO bus is actually associated with the fwnode we=
're
> -                * looking for.
> -                *
> -                * As a fallback: continue checking the label if we have =
no
> -                * match. However, the situation described above is an ab=
use
> -                * of the software node API and should be phased out and =
the
> -                * following line - eventually removed.
> -                */
> -               gdev =3D gpio_device_find_by_label(gdev_node->name);
> +
>
>         return gdev ?: ERR_PTR(-EPROBE_DEFER);
>  }
> --
> 2.34.1
>

Sigh... Are you an AI model?

