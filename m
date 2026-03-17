Return-Path: <linux-gpio+bounces-33603-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJJaFPkjuWm1sQEAu9opvQ
	(envelope-from <linux-gpio+bounces-33603-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 10:50:49 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A252A73FA
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 10:50:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 38DE13079DF9
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 09:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F21D39F184;
	Tue, 17 Mar 2026 09:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cnQMs3yD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3ED5371CE2
	for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 09:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773740731; cv=none; b=tcYqzDx2krTaAkST8qCI14jdoL6HqIW3ALK8EYsoypaCdtOEDYNTQDR0WJiSfEuIidHKzz3XLBY1X+z51UcADAIsag+K+suLN12q3gs8490EsA8K1oRwGsh/9gaAyssWhOdemPuZfUkWFR+Nmh7+gyBLC3ibBvdjETip8or9ixg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773740731; c=relaxed/simple;
	bh=JGBz0SdiTulLcKwRUnaZplsI+zj2QfUegXT7Nov2gO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pK+3nlX0YaKO+OQOuj0RT/+jPZH1eY0Bm/z/bMYmHFY+KY+tMLWNc0i7haQxBHrePVA0MXNG8g1qYHDGJAyZJDzIG2ngH4bDgG7gV7xEg4QSz488zIMm9vpRldJG4Ik1eaWPuQPqB2tvjyimBQoIFH6HRsYNe+dwL6EliBJV5LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cnQMs3yD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A88F7C19425
	for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 09:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773740730;
	bh=JGBz0SdiTulLcKwRUnaZplsI+zj2QfUegXT7Nov2gO4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cnQMs3yDCcmFOrk4R10NlxOp1qHZasnz84rJHrEAlX/FnzPd7AGcSz1uiUV6vwg+l
	 okDB/3MJJyLOD73Iaw4DXFwZB7Tx6OYBMXzlfbpTH4qGGR34HYApEstbaCSaVmoN6j
	 YuNlvAGrDMmZ4D++z0JIDgLqf4drvNKBLvAICWv1Ujf3Bv71kD7lIsNn6DAc5FsrpD
	 n8wlOnUvtY6BEb5j3HWCiNOt8HmcYS82Ok/lvPq+4gZJmKNEtGNXWQQjTcUBb1VqiW
	 YqKJit6vU6BWfc5HbyVFR4oa7B8hbhPBMGsNBlrHScYTtLjLb0ds8MkB6eXf18T7gS
	 L3Jc/vOUao1DQ==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-79801df3e42so7972387b3.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 02:45:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVe2yUmKmKAr7JWKgKKHcaEG0cNdJGKGLecmxA1YIDMKya8H+D7fKbJbPLMLQ3I327UU9rj29fx6tX8@vger.kernel.org
X-Gm-Message-State: AOJu0YwU5dZB/hAFZ5m/xc9DxwS+ZNpCQ3uJUowX4N4dCqOB5sRObZoX
	N+2GwATeEVDgBHqkaZ0RB94zR9TkeGBR+sc8zpiwvUhsjJUa9Fegph1RCJPthKGNMuIh5cv3hZU
	1KVQxi5sDgNcS+t6ZOKT1h5paY2vR67A=
X-Received: by 2002:a05:690c:9688:b0:79a:3564:ee8d with SMTP id
 00721157ae682-79a618e6111mr20649057b3.26.1773740730046; Tue, 17 Mar 2026
 02:45:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312193717.12221-1-rosenp@gmail.com> <7jwgbrijeldghk44tdg2be5q7o7vuj5np3nlbl2pxuln6c7ll7@ntuquxxdnfmm>
 <CAD++jLnTJGt2YXo6ASXEjPPsMbrr+Mz3RKcCVeUpaWEMPm6DOQ@mail.gmail.com> <bh5rgccasvor5xjunkc7wjp3resyulehnqafhzlfwqx2ealwxw@eqohebwzjq2a>
In-Reply-To: <bh5rgccasvor5xjunkc7wjp3resyulehnqafhzlfwqx2ealwxw@eqohebwzjq2a>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Mar 2026 10:45:19 +0100
X-Gmail-Original-Message-ID: <CAD++jLkKqF4ooL7zC0dyT+k7o1MC7AyY-Xat5xSTzSZ6KdLHfw@mail.gmail.com>
X-Gm-Features: AaiRm50c28ehMzG3FZtQnMIktiveKhdLesYuHZvx6K3Ld6TrmqPk05dY8AJLm7s
Message-ID: <CAD++jLkKqF4ooL7zC0dyT+k7o1MC7AyY-Xat5xSTzSZ6KdLHfw@mail.gmail.com>
Subject: Re: [PATCHv3] gpio: virtio: remove one kcalloc
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Rosen Penev <rosenp@gmail.com>, linux-gpio@vger.kernel.org, 
	"Enrico Weigelt, metux IT consult" <info@metux.net>, Viresh Kumar <vireshk@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	"open list:VIRTIO GPIO DRIVER" <virtualization@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,metux.net,kernel.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33603-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linaro.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 33A252A73FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 9:49=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.o=
rg> wrote:
> On 16-03-26, 15:00, Linus Walleij wrote:
> > On Fri, Mar 13, 2026 at 7:09=E2=80=AFAM Viresh Kumar <viresh.kumar@lina=
ro.org> wrote:
> >
> > > I wonder if it is worth it anymore. Why combining allocations is bett=
er when we
> > > are ending up using more memory ?
> >
> > For the same reason we are starting to use Rust in the kernel, despite
> > it sometimes will take more memory essentially. __counted_by() enforce
> > the same type of runtime size checks as Rust do on arrays.
>
> Right. I don't have any issue with __counted_by(). It does the right thin=
g for
> flexible length arrays. But we don't need a flexible length array here an=
d so my
> question.

So why check for something that "can't go wrong".

IIUC it still removes undefined behaviour from the object code.

If someone managed to compromise the kernel using return-oriented programmi=
ng
they cannot call back into this function to overwrite the memory
beyond where the
array is stored, because the runtime checks will block this.

But Kees & Gustavo can tell if I understand this correctly.

Yours,
Linus Walleij

