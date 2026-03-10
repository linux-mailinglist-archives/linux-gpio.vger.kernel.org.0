Return-Path: <linux-gpio+bounces-32886-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gM/qEPzcr2kzdAIAu9opvQ
	(envelope-from <linux-gpio+bounces-32886-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 09:57:32 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99437247BCD
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 09:57:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F344631AFF74
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 08:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CB2F43637D;
	Tue, 10 Mar 2026 08:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zct30tSL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E711439009
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 08:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773132707; cv=none; b=C2GOauCP6BujW1X/604Cfu4L68clPnPAMAMnrdAbdAqFTFHtm0YHx9XDRxTdybosewiFEoCG1wV1B0eUPYkhXoDY1GE9oDfvlpZzZqtYzLwp8HU+Gp9NWx+8K1oNSqxUF+70FO/xQ+JaAMJByvDiaVE/fZshCyvlfZpiVd8ZAeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773132707; c=relaxed/simple;
	bh=vVoj3FLi83VXmJyuCRq2Dd+bxXjKaU+NntpFAWe/BT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gZBDmKOZvzBQ6fyPEOVXUaD3+LlJBF0sCkGeITrtwqLVAVexJv7LwIDlHZBJdcj/dZYmiEOe+kL9irfq9wSywRuGUBre90Ga7BwnIbt4K5HmpSXt4eUgu+I42Pd4NM1zSH9tSwpGRZqK9pI6kgmz+FONUIMdvXDqyvFuAmdgdnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zct30tSL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B17B3C2BCAF
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 08:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773132706;
	bh=vVoj3FLi83VXmJyuCRq2Dd+bxXjKaU+NntpFAWe/BT4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Zct30tSL3h4O0vrlc0FGEfY06o2E9w0S4RpZ3oU4xghwLQTLssYmSSmsIOaAXXJed
	 GKp04zVWjV/rboXJu0znMzuHIhNcjAAHCPTqfjdOHx5SJOogCMDfFiXwQaeV6zNlj8
	 DZyLtTSXYgnjg+zrA9J5y5CyI2Tucq5+RKbfV0zVr7P7ZZHdlQKSI3dR4wndWrXYh8
	 4W4NSylgs6Xj1JcmztWDqzx7kskIHyPe4fUKskMhME8+fhxxKMlUrWlrpJ01IelZQ8
	 G0RZjP94IHthM+0mqwwd46gxPz/r4ZLGHNMhvCgMMgoFvulyrcuC3K43Rc2UQmbtts
	 hLwezImpohRfA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59dcdf60427so7509368e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 01:51:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVsIJVebCA9GOqgMT19q196ndFK9yOP7cl4M7FnngRXdtctw2Hld5ZKh9wK8WwkODiKwvze+Nz3x6s9@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc0pZTpHchrxijUFDApnF/DH9viGZE+GpXn77u9THDTYvz3hSB
	c9T7taMilaaEwUu9KUAnNFAbBrt8MqYStXUdsNBUmk6nR5jdlTsl/Ubj+WARgcqjyVYKNPfcnMZ
	Gg00YONBCVuegBigNsEvkiwTEEIFzwqnGz9eanS8Q1w==
X-Received: by 2002:a05:6512:304f:b0:5a1:3e8d:aa27 with SMTP id
 2adb3069b0e04-5a13e8dad62mr4744483e87.36.1773132705315; Tue, 10 Mar 2026
 01:51:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260308021535.48098-1-rosenp@gmail.com> <CAD++jLkLj235Q=U_9E-hSneW5E42JjU=dRBJxKJNnqwgBLCm=w@mail.gmail.com>
 <CAKxU2N9JbAzEYfmLpbw5b9Y6MsYUZ1FfLirfy8Hg8MCOUY6PAg@mail.gmail.com>
 <CAMRc=Me+oUX5xbNY7PX43cTH0e5ouu=Ex3TqhvWvoefmR7jYYQ@mail.gmail.com> <CAKxU2N8_V7U11X18Ja+=tdYPWT6jnmM7bYt+5GHgeXAXOJ5cng@mail.gmail.com>
In-Reply-To: <CAKxU2N8_V7U11X18Ja+=tdYPWT6jnmM7bYt+5GHgeXAXOJ5cng@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 10 Mar 2026 09:51:33 +0100
X-Gmail-Original-Message-ID: <CAMRc=Md3uAPzndudyvpFiLki8fkYHgAtumtaauXMkXwU4vANBA@mail.gmail.com>
X-Gm-Features: AaiRm52QyqGRA5XZTuwTzrHYnzWWeX8i1qdpXgK_Fun3PV5g-eaSB6k0RbEVzRo
Message-ID: <CAMRc=Md3uAPzndudyvpFiLki8fkYHgAtumtaauXMkXwU4vANBA@mail.gmail.com>
Subject: Re: [PATCH] gpio: msc313: remove kcalloc
To: Rosen Penev <rosenp@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, 
	Daniel Palmer <daniel@thingy.jp>, linux-hardening@vger.kernel.org, gustavoars@kernel.org, 
	Romain Perier <romain.perier@gmail.com>, 
	"moderated list:ARM/MStar/Sigmastar Armv7 SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 99437247BCD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,thingy.jp,gmail.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-32886-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Mon, Mar 9, 2026 at 11:00=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wrot=
e:
>
> On Mon, Mar 9, 2026 at 2:03=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
> >
> > On Mon, Mar 9, 2026 at 2:27=E2=80=AFAM Rosen Penev <rosenp@gmail.com> w=
rote:
> > >
> > > On Sun, Mar 8, 2026 at 5:06=E2=80=AFPM Linus Walleij <linusw@kernel.o=
rg> wrote:
> > > >
> > > > On Sun, Mar 8, 2026 at 3:15=E2=80=AFAM Rosen Penev <rosenp@gmail.co=
m> wrote:
> > > >
> > > > > Use a flexible array member to combine kzalloc and kcalloc.
> > > > >
> > > > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > > (...)
> > > > >  struct msc313_gpio {
> > > > >         void __iomem *base;
> > > > >         const struct msc313_gpio_data *gpio_data;
> > > >
> > > > Do you wanna add:
> > > >
> > > > const unsigned int saved_size;
> > > So in the code there's
> > >
> > > for (i =3D 0; i < gpio->gpio_data->num; i++)
> > >
> > > which is equivalent to match->num.
> > >
> > > __counted_by doesn't support pointers AFAIK.
> > > >
> >
> > This is a regular flexible array of u8. It should work fine with
> > __counted_by and I too am in favor of using it as it has become
> > standard for flexible arrays.
> That requires adding an extra variable in the struct.

That's ok, it's negligible and provides tangible advantages.

Please do the same for your other patches.

Bart

