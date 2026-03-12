Return-Path: <linux-gpio+bounces-33224-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAMgCdx2sml/MwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33224-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 09:18:36 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8655326EC77
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 09:18:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 608383076AF3
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 08:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 489CF37B002;
	Thu, 12 Mar 2026 08:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UG9o+8Hk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07789377032
	for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 08:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773303417; cv=none; b=pQJMpu3QY32eUAaDtR46Uv3uQVPIn9BDzHDnBtAUiWVwiCW/1Xzlkk9wHHXXVBj+PWBZiv2N72uKUPycCYX407La/s5pA6w2C0fvKm9AMuUcwcRqkMvMQxS3qNkRcvZLtptBN6vV2qsrNuzpwLpr5rejdr+ZtpCaNaId7fOFkUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773303417; c=relaxed/simple;
	bh=D4WWa8Y5yjK/moIqWIvtf/ihJJy5NFelb2nndJ9FSiw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EVW9iieqh70rWXGrdez/nZoo2htrrAA8sK8UWcVDIck7smyq/or0tSpbJjdAYsk6Vm5qLQDY00o/l/7gIuI+lvPhX/wLMVIYZdP9oTGAwNtbze6M4xgA7UdcgPY1NUtrYoObAQCfv24PeMx9dd+hPrDlBJ4UQAr1uMYP8vGkW1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UG9o+8Hk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C85C0C19424
	for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 08:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773303416;
	bh=D4WWa8Y5yjK/moIqWIvtf/ihJJy5NFelb2nndJ9FSiw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UG9o+8Hkin/VcRIuTk58als4P05HRvouID08yN+ZS8NfubSdX0XCqztWtQHbaN9bk
	 SRXivH25nCCcdpd5r3lU6cAj1+XmG7eqGA93sWoMDf9WAcutFVyAOQzmExki0mxPcG
	 0kwFu4vFKQ5O5VXknhgD+PUs9IfsGQ0NaCP8K9BC+FvyNgUkt7uYOrGx+/765opza/
	 wo9GLu9O0ht+opLa4maNTE40eh7FNKyCLGgOVIC4IiXjreE9WGpbgWg48PhMbnP8Am
	 pZ/bTD33SRbwIHSKwGvWzbtoyWdnO1IhV/qzzHY5yX2RgQx5535enMdkQEacucFaYO
	 nfL1YzkmufduQ==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-794719afcd4so6927577b3.1
        for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 01:16:56 -0700 (PDT)
X-Gm-Message-State: AOJu0YyjoKGQFZv2IJsiL2XkCLkDUgKKoyoCKOPkfwi8J/P/5TuPRhvs
	GEbwsE1bIVgFh7knPHew84mxnYE5TQ+f3feNvjG5bgZanEK+6cpIWasjmIA2hyP03yirKa48Kia
	bOe+PoTGxUU6VxkFr1M2/fYZncb8oX+s=
X-Received: by 2002:a05:690c:90:b0:798:6619:f1ab with SMTP id
 00721157ae682-79917fa9637mr47647187b3.54.1773303416146; Thu, 12 Mar 2026
 01:16:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310222040.10324-1-rosenp@gmail.com> <CAD++jLmR8TZHMbiSBaUmUvPYvP9bPOmr0a=yq4M7FNRFF4EzcQ@mail.gmail.com>
 <CAKxU2N9fExr=72E6ZPs+VqCe+eSzyxS8zbcCU2PPcqKjvqiO_g@mail.gmail.com>
In-Reply-To: <CAKxU2N9fExr=72E6ZPs+VqCe+eSzyxS8zbcCU2PPcqKjvqiO_g@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 12 Mar 2026 09:16:45 +0100
X-Gmail-Original-Message-ID: <CAD++jLkErpPjZq7BUsa5X7ievDD7B2QUsOA6k5dPyN6=2=2Wpw@mail.gmail.com>
X-Gm-Features: AaiRm538VBJiBN-ob7H39qqeYRzq5Zr80Zd1bwmEyCAbn0Q-s6w4cMSBPpX2svk
Message-ID: <CAD++jLkErpPjZq7BUsa5X7ievDD7B2QUsOA6k5dPyN6=2=2Wpw@mail.gmail.com>
Subject: Re: [PATCHv2] gpio: ljca: reduce struct allocation
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Lixu Zhang <lixu.zhang@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33224-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8655326EC77
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 12:19=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wro=
te:
> On Wed, Mar 11, 2026 at 5:57=E2=80=AFAM Linus Walleij <linusw@kernel.org>=
 wrote:
> > On Tue, Mar 10, 2026 at 11:21=E2=80=AFPM Rosen Penev <rosenp@gmail.com>=
 wrote:
> >
> > > +       size_t num;
> >
> > What about naming it num_connect_modes?
> > (and unsigned in as Sakari says.)
>
> Too long IMO. Makes the most sense to match variable names.

This is one of those times I would bring up Rusty Russell's
API item #6 "The name tells you how to use it." well,
does it? Number of what?

Yours,
Linus Walleij

