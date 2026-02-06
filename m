Return-Path: <linux-gpio+bounces-31489-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHHtKTLLhWlWGgQAu9opvQ
	(envelope-from <linux-gpio+bounces-31489-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Feb 2026 12:06:26 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEA8FD00F
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Feb 2026 12:06:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 113A230074A2
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Feb 2026 11:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DD8B3939C4;
	Fri,  6 Feb 2026 11:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hT5Jq3Xg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016FB21ABAA
	for <linux-gpio@vger.kernel.org>; Fri,  6 Feb 2026 11:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770375981; cv=none; b=DgyQgsQqrA2STLovjs4nlph/oCP8Oz8Ho5BDsFMOQNHJ/H+mfwQ0A4+i0YicSpwt4hYT1okIvzI9+lZEm6W5h91uOmlYM/qmpVAoJqIROqNTsBeSBPnI9EE6NtQIscDb3JmwqmpyGu/jyg8VHISkKp14kWBkKKp2aY0oYvrAAQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770375981; c=relaxed/simple;
	bh=EGEJlk6cOz4AMubi7kWA6gkfjA0ebwHErmB9bL0MgUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IzXI4ruKe+guX19JKbna7rYtbThwTesmqwsLsH+JuWjufVQLQfvCPukF9D5zDFODEUTlvKXPN51cNmHTLw1bmhT2FPhY6dKJteSVvKkudyXWNes27BXm1AzZawGa+kg7ebZZDZ43etD9ZggiTA3A7L02J3xhQBlU7lX43cHAie0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hT5Jq3Xg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F716C116C6
	for <linux-gpio@vger.kernel.org>; Fri,  6 Feb 2026 11:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770375980;
	bh=EGEJlk6cOz4AMubi7kWA6gkfjA0ebwHErmB9bL0MgUY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hT5Jq3Xg3Je/0ZvLfUSRlw55PLzMpPRMsFNxYFCr2Un7T0zAQITPuz/1o5kxXgKXf
	 1adrlwZFthyRsLHm5lpRG0T/NkHNrLLSpJrKCyaQ/5hKdMnGwpE49iC/UPIco5dPSY
	 h640m3mkZR3om2m29/dSt2X64XqwAIe1od4MyJQb/dyPDHIsQGLjLB4HK7V8nC2BXw
	 zCj1V35X1F5Lu/LbbaS6ahNBm1TLryOOk5Q158HqovuWgWlODp67rplpSReHrcn5Vq
	 dOswK8kcqnJoGOyKL7fKNmEyYA1V2gD3jJ73IMy3L3Lo6gpRt1XtKznU2lSBL3Mbwr
	 32Q/M3MX3rMUw==
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-649ba412cd4so1962693d50.0
        for <linux-gpio@vger.kernel.org>; Fri, 06 Feb 2026 03:06:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWDc9D3tawf9d2kpGWY4O4tC1C2jSu+zMmNtmLiB3J5iCHQV/cnaWgE4pxi954LmW3KfDTrALdvbrRQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyWVDlsfRdHOboHlnd8lZlbHdt4GeGKVrk+mOpkyxHAzESRfBU9
	8rB34oR5SXXLIuG8tm7Laa5SsJMeeXK3lirSudLFpzQs5bAltzYuoZXoYT34GFpNhaUabhLNIXv
	9z80E4kEuB0NBLgDqwuXq2VAsWSgbodM=
X-Received: by 2002:a53:bf0b:0:b0:649:cc0d:a99b with SMTP id
 956f58d0204a3-649f1e67b3amr1713050d50.11.1770375979976; Fri, 06 Feb 2026
 03:06:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260204080122.2300224-1-andriy.shevchenko@linux.intel.com>
 <20260204123727.GP2275908@black.igk.intel.com> <aYNHtw7QumfvgeX8@smile.fi.intel.com>
In-Reply-To: <aYNHtw7QumfvgeX8@smile.fi.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 6 Feb 2026 12:06:07 +0100
X-Gmail-Original-Message-ID: <CAD++jLnioN3Hb83Qf20PeQX=kpCKH4MQ1eLTeKuizm3tTHzUGw@mail.gmail.com>
X-Gm-Features: AZwV_Qj_97uy8_-32gsApwiZdCec2IxvnbpqbFPRmBdYl4NaHcQQXzc02ljsVqA
Message-ID: <CAD++jLnioN3Hb83Qf20PeQX=kpCKH4MQ1eLTeKuizm3tTHzUGw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: intel: Align Copyright note with
 corporate guidelines
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31489-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,intel.com:email]
X-Rspamd-Queue-Id: 4FEA8FD00F
X-Rspamd-Action: no action

On Wed, Feb 4, 2026 at 2:21=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Wed, Feb 04, 2026 at 01:37:27PM +0100, Mika Westerberg wrote:
> > On Wed, Feb 04, 2026 at 09:01:22AM +0100, Andy Shevchenko wrote:
> > > The Copyright note must follow the
> > >
> > >     Copyright (C) <year(s)> Intel Corporation
> > >
> > > template, where (C) is always capitalised and <year(s)> either
> > > a single year or a range. Update the Intel pin control drivers
> > > to follow.
> > >
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >
> > Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
>
> Thank you!
> Lunus, can you apply this directly into your tree, please?

Yeah I just applied it!

Yours,
Lunus Walleij

