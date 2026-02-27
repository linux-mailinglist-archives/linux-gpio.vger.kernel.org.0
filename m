Return-Path: <linux-gpio+bounces-32258-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFkWMJZXoWldsQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32258-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 09:36:38 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F161B49A5
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 09:36:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E07130254FC
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 08:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E20E3815D5;
	Fri, 27 Feb 2026 08:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ecDAo0g9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DF83603E3
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 08:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772181395; cv=none; b=abCEJ7aL8LvRVrcTDD3AqbwYJjXxzvCbR0rLJTzDD9oXfR28h2Fw1465cXD0hGCaNz2dwbMSwPdxWyAJagnluj1YKVUcCwmLSj8WqlbFJLfS5E4/rY1LL1tGuBKsofGfckXqJl4KB9bNx6HQBOw1+iDBkVvjbozKqg/aZJz0m7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772181395; c=relaxed/simple;
	bh=bbgjOQnHcJUBMpEYuaXe+wadEQ9CZafq+Gkj5UU1Cb8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HAg4v37viv293SM22MHoR+JrOOwhC/BZ6o85vtlKQy4KZhfAYNQeumOIgIX1vZYyJbRxNT5y4/fv/dKU1zY0r42qSMyikHwiSpe1LNPsdmBFg0uanIKLFQZsoMn18xkl9MFiN18LYQNGrmT9+XWLcf+CDtMw+aOCEm01Ng0EFSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ecDAo0g9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED602C19422
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 08:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772181395;
	bh=bbgjOQnHcJUBMpEYuaXe+wadEQ9CZafq+Gkj5UU1Cb8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ecDAo0g9K1jD+7nI4GOh5tzrFGkek7wtF/5w9zwvDnfKicD/NiTIprkFX+0R99ZPY
	 1grOfyBSATFFn/I6vwIWcJydXuBbaXOFTEYRWNbMjcKv6j2CMN21tU3dPQ0RYiJYib
	 PevimyKWE+dYS5voRi1s6fBGw0vfWATMsVAX+6b6eBv8Bm8FMUPjIYM9maXrUG+MXd
	 ASCmLXCiJri6prADcOrz5mU54skzH4m1qCXtYf9A6fBbhMSeTTgRmNtr8qT/x0qh+A
	 XGmQm646pKGyJgL3tNhudZYy4uHDMIlBWb747B8fJgUhtMRSi4iar4UPWPOXT31sGJ
	 JdgES8a5dg4Cw==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-389e4330e32so19999571fa.0
        for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 00:36:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVzqUXPCFgOgI38sMqGWTE5MiydMbP7FntPSVHI7wSsGUt0gYFWeZ4gRHwkVU3kFQghiWmKocwclt1a@vger.kernel.org
X-Gm-Message-State: AOJu0YyjJ4ZJhvhxnfaFuP6ngkNd81uellajN1k+DZo9Dx/gypW8ZnpV
	xjUMblaNirIw043WlgDmu8Hxbm5gyI4aJ3sha9NJ5Jb0afYt/vqgQuBFayusZSV8zlfiyVzeVwx
	VhR0RCNGqf8pWroZX0IM0l0Jcw38Z7i9nRJzn17DBAw==
X-Received: by 2002:a2e:b449:0:b0:385:f7ce:f322 with SMTP id
 38308e7fff4ca-389ff36387cmr6975081fa.35.1772181393593; Fri, 27 Feb 2026
 00:36:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260224162606.645147-1-pranavkharche7@gmail.com> <CAD++jLmkTyRfPR2KKb39E9EhCcz+qroMMGzah2oqLKq06t2W5g@mail.gmail.com>
In-Reply-To: <CAD++jLmkTyRfPR2KKb39E9EhCcz+qroMMGzah2oqLKq06t2W5g@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 27 Feb 2026 09:36:21 +0100
X-Gmail-Original-Message-ID: <CAMRc=MeTHMzDFC=CLJ+40ft1jAHN7U+wcsJuSQQiuP6z35-wRw@mail.gmail.com>
X-Gm-Features: AaiRm53mtC2ZviB8tpAf5xXQQv9hdpRz3NaC4Tt_LAVp_PUs4oJEwta-h3xJ39o
Message-ID: <CAMRc=MeTHMzDFC=CLJ+40ft1jAHN7U+wcsJuSQQiuP6z35-wRw@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpiolib-swnode: Remove deprecated label fallback
 for GPIO device lookup
To: Linus Walleij <linusw@kernel.org>
Cc: Pranav Kharche <pranavkharche7@gmail.com>, linus.walleij@linaro.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,linaro.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-32258-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 43F161B49A5
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 11:04=E2=80=AFPM Linus Walleij <linusw@kernel.org> =
wrote:
>
> On Tue, Feb 24, 2026 at 5:27=E2=80=AFPM Pranav Kharche <pranavkharche7@gm=
ail.com> wrote:
>
> > Signed-off-by: Pranav Kharche <pranavkharche7@gmail.com>
>
> Empty commit message, NACK.
>
> Provide a detailed explanation to why this is not needed anymore.
>
> Also I don't belive such an explanation exists.
>

Hi Linus,

Yes, this needs to stay until we make sure all the users are converted
to using real fwnodes attached to their GPIO providers. The comment
very clearly explains that.

Bart

