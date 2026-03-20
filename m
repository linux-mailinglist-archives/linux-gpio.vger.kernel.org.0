Return-Path: <linux-gpio+bounces-33925-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENqFEldOvWlr8gIAu9opvQ
	(envelope-from <linux-gpio+bounces-33925-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 14:40:39 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2C82DB1A2
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 14:40:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE8B33069AFF
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 13:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B75128640B;
	Fri, 20 Mar 2026 13:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pWw8Tlzq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D312F282F23
	for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2026 13:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774013943; cv=none; b=UNru8j+6HwSAndlRSYZsqRAcbS5e3IrklKi8sb8/jnEn5klewQMNBfEmIoPvxWREFGQKC9UgCDWzbjdoBSJtlkyQutx2n0gJGFyAGoW79pgs6+R5f32yjvjxAWp/BukZXI9AtnFErSTpPznLBkTwzxikzIeAw6tAaZRMUl7A1eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774013943; c=relaxed/simple;
	bh=sZj6DnCZyjt8HONClCcyxov7+5CPr/w7swwMeT/AqK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XHKPhQnTpLBKkWL1iMltgGajXdGzNCkhpy1zkLzMBSjuOI4DgQ9VIMJY6+j9v4fvh1rVwjuvjRvnpfWh4+QtEN9Zd4i/gqC+HIcqPW8rS3mn3Dt94wyJD8+wEJtmsUYNnqHf+M8+K6I+1lUWG4h3HaFT17JRb/ByXfaOoDqHIB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pWw8Tlzq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84B6FC2BCAF
	for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2026 13:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774013943;
	bh=sZj6DnCZyjt8HONClCcyxov7+5CPr/w7swwMeT/AqK4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pWw8TlzqDFoHwph3KDyCSQ9RWZggThxWkYDWtzDwwA0OIl26SBNnmwGWKyvUXmk/t
	 bDLDIfQVoweCT0QWhN0hi/0CePrQWqmS/okWujQXl9z7ibN9U45Lzqz1VW/yCKJsuL
	 MzwLiURiT9v/+P645X5uU+LGcWCbwl40Dnbck1lk2C9v9I+xfiROV6akOGoDyOYm9m
	 ybisSgzmIc3gqLHWG3qszlgjPkLjzPZYq7n0Mjx38D/dDYimOxAAVffyGCutrjAJnp
	 tW5/FuvQhXUMUm8MLBImdZgQ+0tofCMU3qAMmnuJwf2h7w14LjTpiyWg1t0PIHk4FI
	 eMEo4Cg1OE8oQ==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-79a3e2e64f4so14469467b3.1
        for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2026 06:39:03 -0700 (PDT)
X-Gm-Message-State: AOJu0YwjJfdnfBMr36sakOPxRM/aIHm6xpzqkrPMZCPUk3amVF+PGOqO
	L9k9QE8wVaA73IAcArRelJMMTHN2f5xoZhxq901akd0T8OiBwgZWo6N7Gkhu9jzinOUnouYqjTU
	jYX3Y7I0EyIsxX3ZbWNcIQKmzZMGY18Y=
X-Received: by 2002:a05:690c:22c4:b0:798:e281:a4f3 with SMTP id
 00721157ae682-79a90ba02a2mr31740737b3.40.1774013942875; Fri, 20 Mar 2026
 06:39:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320005338.30355-1-rosenp@gmail.com>
In-Reply-To: <20260320005338.30355-1-rosenp@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Mar 2026 14:38:50 +0100
X-Gmail-Original-Message-ID: <CAD++jLkpvSb+cQXoXV-9+2b8eQRYYJpKQzuf+6xAqarQsOL0_Q@mail.gmail.com>
X-Gm-Features: AaiRm51rZsRwW4njnIt6SHlMGSJepFEH4f2OsTyDiAdp7pcBmT6TD4IrYRReTow
Message-ID: <CAD++jLkpvSb+cQXoXV-9+2b8eQRYYJpKQzuf+6xAqarQsOL0_Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: dwapb: reduce allocation to single kzalloc
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Hoan Tran <hoan@os.amperecomputing.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33925-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.943];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: CB2C82DB1A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 1:53=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrot=
e:

> Instead of kzalloc + kcalloc, Combine the two using a flexible array
> member.
>
> Allows using __counted_by for extra runtime analysis. Move counting
> variable to right after allocation as required by __counted_by.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

