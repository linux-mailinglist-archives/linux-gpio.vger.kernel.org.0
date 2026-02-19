Return-Path: <linux-gpio+bounces-31887-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +A1aGO5Ll2m2wQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31887-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 18:44:14 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BEA1615CB
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 18:44:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4182A302AD17
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 17:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E53734DB7B;
	Thu, 19 Feb 2026 17:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iPlqBcNJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20592262808
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 17:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771523049; cv=none; b=NMNHuNYxI/U5tnA5exgmXQ6RTc3hr3lO5bwUGYv+Ok6Ei5U8KuN59i5L0DNz1tjJaeUYvKwBogR4sQ29dPeUTRQSqqg8cuPNTPmB/w64er7FWMxcwdEJ93b/4+8H1U8+RhP7xH8V69Yja0NZ0ThYvwhWAJjsc8wZnesN6k7JL6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771523049; c=relaxed/simple;
	bh=+Q/hfvdBdQUY6Wu5YKwK+a99TISSUTCRozSuUhGSyUQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tp8WhCuamUt77gBqM8zNOhjY3NGDUYUTNe9FCLXMOrRoiMtrda+423nB1sMsIJd5gEKIw3V4YJdSPvprNXFP6Y1cSisXCih9cLG50/neZ5HImk+nNIZ0hANuc5sQ2hJHgmJcSGqTf1Km9XKBb2FUPoAmyRODsgpZnH6HVplODTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iPlqBcNJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D09B0C19421
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 17:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771523048;
	bh=+Q/hfvdBdQUY6Wu5YKwK+a99TISSUTCRozSuUhGSyUQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iPlqBcNJQEfw6vvbPT6zsMT/vU2SkuNJE2HTC44zLzHHuXXMKzlfwzKYwZBr0Tukg
	 WbhUpWzPPtgSvR8BWhEOenziecWO021NlLw3pxn+rH0c9g0ujIIq6KSeQQbsqqNWVU
	 xCE8AwlWqnA37ZB9BPdHBk0c2XE0rxGT3CfYYuv5dC4PO0BbkI7Wa2CXLEWvKmYQiq
	 SYwr/nBrENLhXomija6tvGv/7NYZqsRsAvaqdqEHo+YvtHoJtuV7HtnZ2pagaQRGj5
	 zumjNkZQHclKxvMZZ/Efz1hFiErfIMUiRdU1HoEqwVdAXqPMQ0ajLg8bN7C3wcncIX
	 lcdq+MzR9K89A==
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-64ad79dfb7cso1211696d50.2
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 09:44:08 -0800 (PST)
X-Gm-Message-State: AOJu0YwOJiP1dBZxaArnwH6D6T5rPYVp2oTP8aGslohk/Z7C7Kh19wJX
	PaaeOhB5Bi8yZcpQJXrtVBGAW04fHN68WTYaUE51By+e4NgkuePsyYra2XIs/JGSAoA52hJa1e2
	BltlHtuDMZM8FQ7bM3r/a3FNvB17IrdI=
X-Received: by 2002:a53:e30e:0:b0:64a:dc34:f50a with SMTP id
 956f58d0204a3-64c556c8369mr3820254d50.66.1771523048070; Thu, 19 Feb 2026
 09:44:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216211021.3019827-1-james.hilliard1@gmail.com>
In-Reply-To: <20260216211021.3019827-1-james.hilliard1@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Feb 2026 18:43:57 +0100
X-Gmail-Original-Message-ID: <CAD++jLnOouLSt324=iKVnYd5v3HMBaMG_U4=8k-ixoqkek5niQ@mail.gmail.com>
X-Gm-Features: AaiRm503QN4pcGRY7EISqwLjXNwGsOs-d0S5lk74KtNyUWXXm4ljFU-nwR1cWfI
Message-ID: <CAD++jLnOouLSt324=iKVnYd5v3HMBaMG_U4=8k-ixoqkek5niQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] gpiolib: of: add gpio-line node support
To: James Hilliard <james.hilliard1@gmail.com>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
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
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31887-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 05BEA1615CB
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 10:10=E2=80=AFPM James Hilliard
<james.hilliard1@gmail.com> wrote:

> Allow GPIO controller child nodes marked with "gpio-line" to apply
> probe-time direction/flags without hogging the line.
>
> Extend OF gpiochip scanning and OF dynamic reconfiguration handling to
> process gpio-line nodes alongside gpio-hog nodes.
>
> Some boards need probe-time GPIO direction/value setup while still
> leaving lines available for later userspace or driver requests. GPIO
> hogs can initialize lines but reserve them permanently.
>
> Add gpiod_apply_line_init() as a core helper for one-shot line
> initialization and use it for gpio-line setup.
>
> Because gpio-line initialization does not reserve ownership, subsequent
> consumer requests remain normal requests and may reconfigure or release
> the line as usual.
>
> Support "gpio-line-name" for setting the visible line name. For
> gpio-hog nodes, keep "line-name" semantics as the hog consumer label.
>
> Some boards only need to name a small subset of GPIO lines. Doing this
> generally requires defining a full gpio-line-names array with empty
> placeholders for unrelated lines.
>
> In overlays, gpio-line-names replacement is all-or-nothing. Names from
> base DT and multiple overlays for the same gpiochip do not compose,
> because each update replaces the full property.
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

I like this looks of this, there might be some minor code duplication
with hogs, but the core idea is sane and very similar to what has been
discussed in the past.

It's minimalist, it's elegant, it does the job.

If for nothing else, so for the sake of making the previous attempts
count for something, and because I personally align with this idea,
and because at least three (3!)  attempts in the past by different
people for the same idea:
Reviewed-by: Linus Walleij <linusw@kernel.org>

... and if we apply the patch in the end I would have their names
added to the commit as Co-developed-by:

> Depends on:
>   - https://github.com/devicetree-org/dt-schema/pull/185

That's the real trick isn't it?
FWIW I approved it.

Yours,
Linus Walleij

