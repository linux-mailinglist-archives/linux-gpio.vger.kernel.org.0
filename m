Return-Path: <linux-gpio+bounces-36602-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKgsNH0nAmrFoQEAu9opvQ
	(envelope-from <linux-gpio+bounces-36602-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 21:01:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1DC514C94
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 21:01:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CB14F30597AD
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 19:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E67CF47AF63;
	Mon, 11 May 2026 19:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t0kzrspg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9F43659FD
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 19:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778526072; cv=none; b=OYYkzHEdix+AZDeR6dTlfEZG8VDveeWe4gWgP3D53aax9FvMwZX/mwDlHgGY52EagGftVU38m1TLClOgH9kiOC3jXB5He4z12XvZll85XMj+ytnBYJf8jLoi3VKoNGbnjMqZ+zEjMhkcWWWPujrDBHkqNMpVsruk6aX2oA1TwuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778526072; c=relaxed/simple;
	bh=zCfbq/FNPtgJXMkOhHVEDcnrAvMjATc+rq5JpuuJYdY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sr37d5jsf6tPlcUT/3mr3C99fczHv//sKS9/8iW8Xedm/brjF4Uv07juyTIevwmg2o9J2+nTkc2DYw0vHciujh7ymFJBI4O8hlo0WiiMxwslfqZukgUvajgKyPQB75MEcjxq4U/OMu3RgryN5b1P+Woecj4a5IcMlV6iRR5eaC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t0kzrspg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 776A9C4AF09
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 19:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778526072;
	bh=zCfbq/FNPtgJXMkOhHVEDcnrAvMjATc+rq5JpuuJYdY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=t0kzrspgOmZrYp7N4DHhPTE/oEu3/C9gPMyJEeLSeUdL1vzsCHwPM9/xLzw1tkbJb
	 NzXn6nhpm6oCZMHIc2oDvEYHKI4xZtt1wpximTb+0glmqdF/HMdnr2IMaA8Tts7ezF
	 IXB7+Y5abqwEPOZtkQkl/FdxwI/DzBW8bdb4E8vv/SQ4i4/jQ2Wk/O7qr0xV6t0nLk
	 Su2MZyw0SFIcyRg+Nu//d2YbJQnwrhO3WOBi3T4e4KKIa6FM6p8v/ISsOP2fs8Zp+G
	 WqcdWi5D/2a4mvTstj/LhX1Q0ccAbbRy9E8CONuyVs/6Pi6oT4KV/dZAGAwzhgUhb9
	 foyrRQph22i1A==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a8d1f43432so1768170e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 12:01:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8ED/HhnVC1xWgIE/eOedRVjZ+7CbWd6Dg18DbgoOJkNCW011UAOVVlS9Qq4pw51x9O8k/La76p7XuW@vger.kernel.org
X-Gm-Message-State: AOJu0YyN9uK29JszI8zcNJ3G1bRu6BSAbBAw+ZY8pAOS8iWpbfJQ8O2t
	xqHy7htnn9NwyvdikLH4y9NbQujJ6gwMUub2+ynx8A8BbUT2cQEt8Nx1PeqmeE64P9PqJ7gT1xw
	eALxPr1sfF1Xc4aC715gZTynsOgFEtlU=
X-Received: by 2002:a05:6512:2247:b0:5a8:8df8:1dca with SMTP id
 2adb3069b0e04-5a88df8291emr7763647e87.29.1778526071202; Mon, 11 May 2026
 12:01:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508-regmap-gpio-sparse-fixed-dir-v2-0-deee84df3027@kernel.org>
 <20260508-regmap-gpio-sparse-fixed-dir-v2-1-deee84df3027@kernel.org> <DIFNX8HLL7X3.JGSENU7W32X4@kernel.org>
In-Reply-To: <DIFNX8HLL7X3.JGSENU7W32X4@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 21:00:59 +0200
X-Gmail-Original-Message-ID: <CAD++jLkMuViSFNa2iyHu35JwyCO5VFXBGAuY43h2MiB_Ls7jCg@mail.gmail.com>
X-Gm-Features: AVHnY4KiXzGizRve0kZB6O4jn7NJihgOI6X7oiLfhbMewn0iqt07iSnOIvAnkTk
Message-ID: <CAD++jLkMuViSFNa2iyHu35JwyCO5VFXBGAuY43h2MiB_Ls7jCg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpio: regmap: Support sparsed fixed direction
To: Michael Walle <mwalle@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alex Elder <elder@riscstar.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 4F1DC514C94
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36602-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 9:18=E2=80=AFAM Michael Walle <mwalle@kernel.org> w=
rote:
> On Fri May 8, 2026 at 2:51 PM CEST, Linus Walleij wrote:

> > On some regmapped GPIOs apparently only a sparser selection
> > of the lines (not all) are actually fixed direction.
> >
> > Support this situation by adding an optional bitmap indicating
> > which GPIOs are actually fixed direction and which are not.
>
> Thanks, this patch looks good. But could we invert the logic and use
> fixed_direction_mask as that feels more natural to me?

Sure!

> And for legacy reasons, so we don't have to change the drivers:

I don't think any drivers would need changing, the idea was that
if the new *sparse bitmap is NULL (as in the old drivers) all lines are
assumed to be fixed direction.

But I think your idea is maybe more intuitive so let's try that.

Yours,
Linus Walleij

