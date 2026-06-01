Return-Path: <linux-gpio+bounces-37746-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIoxIlMnHWoTWAkAu9opvQ
	(envelope-from <linux-gpio+bounces-37746-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Jun 2026 08:31:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C061761A33C
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Jun 2026 08:31:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C47493001A6F
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jun 2026 06:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFF0E35674D;
	Mon,  1 Jun 2026 06:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="XodwgwdM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249C93546E7;
	Mon,  1 Jun 2026 06:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780295499; cv=none; b=NbcoFnnsNoVbvHbUOxpBkVJwr3JE6j8zjKH4uLsTwHvOPJDbt2uZIKM6IYBTncHWAuzvYVZALGzKKqXTJOgujUfKe8aMNSypphXwu63K6RyV6mjnj6DbM0/h79+RLF64j6zxAJ2YScwBYVtzbup/2qMKr1oFLWaqok1raLX/jG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780295499; c=relaxed/simple;
	bh=A9tyDmGWPXvFOaV/jXMsq20WZaTkGaA1XVM/dRk/f6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XfqtfXpz9daT04RIytmK5TdRF5dLdNpMs/Fb9EHQXEqsjlWOuNNIgnR57BekDGd+khtcnoXxuFL5t8yQQWG30qUalY2CKb+yrF6kRvcs2+PgdIuQA+vCu2usQ0nfGSMzQ+M641s7WeTBSa6Ge4MyYKaTW8nEdpE+y4tA671fTac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=XodwgwdM; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 65DFD266E7;
	Mon,  1 Jun 2026 08:31:34 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2QQlFJmI-a1V; Mon,  1 Jun 2026 08:31:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1780295493; bh=A9tyDmGWPXvFOaV/jXMsq20WZaTkGaA1XVM/dRk/f6Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XodwgwdMoRm2pThB/ela+S2hLD/oeFWz6dxBv1YZzM0fsv3HVXrMxBeRKcO+F+jvN
	 r1ZEnrwxOg62Sl84kMcQBDBTxWmwb9b54300EoKg4qjGLybgmroqTA8m+pFoCyUsJo
	 sA4h9BC3eQkBdPf3lTzdNgm69L5VcDTpv69WaDGINSh9qMZkk0nxKS4QwAJ9HQ4KIf
	 OgCEuntwz5TKixCnKQnfmK6uKhidWtObkWKT3zJ6UbC8D4avbJQVtXWsBXHkIwcdQW
	 FSQytkSD0cPY24txRrmkNIWT05T7v0457YEkJ4dR9sYnGJhg/dk+lbb2IAkXj7R87j
	 dtk42QnOfKSOg==
From: Marco Scardovi <scardracs@disroot.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Mika Westerberg <westeri@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 2/2] gpiolib: acpi: fix out-of-bounds pointer arithmetic in
 acpi_gpio_package_count
Date: Mon, 01 Jun 2026 08:31:16 +0200
Message-ID: <n2_NwWYBRGa8ixTcAQysQw@disroot.org>
In-Reply-To: <20260601051735.GN3102@black.igk.intel.com>
References:
 <20260530094012.184276-1-scardracs@disroot.org>
 <20260530094012.184276-3-scardracs@disroot.org>
 <20260601051735.GN3102@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[disroot.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37746-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[scardracs@disroot.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,disroot.org:email,disroot.org:mid,disroot.org:dkim]
X-Rspamd-Queue-Id: C061761A33C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In data luned=C3=AC 1 giugno 2026 07:17:35 Ora legale dell=E2=80=99Europa c=
entrale, Mika=20
Westerberg ha scritto:
> On Sat, May 30, 2026 at 11:40:12AM +0200, Marco Scardovi wrote:
> > When counting GPIOs in an ACPI package, encountering a reference or
> > string causes the element pointer to be advanced by 3 (element +=3D 3)
> > and then by 1 (element++).
> >=20
> > If a malformed ACPI package contains fewer than 4 remaining elements
> > when a reference or string is processed, this pointer arithmetic
> > advances the element pointer past the end of the package elements
> > array. This results in undefined behavior and can cause out-of-bounds
> > reads.
>=20
> How can it cause out-of-bounds reads? We increase "element" but the next
> iteration checks that it is still inside "end" and it's never dereference=
d.
> Maybe I'm missing something?
>
Hi Mika,

I agree that `element` is not dereferenced after the loop exits.

My main concern is the parser logic rather than the pointer arithmetic
itself.

A GPIO connection is defined to consist of 4 package elements
(a reference/string followed by 3 integers), but the loop condition only
checks whether at least one element remains:

```
element < end
```

As a result, a malformed package containing fewer than 4 remaining elements
can still be processed as if it were a complete GPIO entry. This can lead
to a GPIO connection being accounted for even though the descriptor is
structurally incomplete.

Such truncated descriptors should be rejected with `-EPROTO` rather than
being accepted as valid input.

Ensuring sufficient remaining elements before entering the loop also
guarantees that pointer arithmetic stays within the defined bounds of the
package, but the primary issue is the acceptance of incomplete GPIO entries.
>
> > Fix this by ensuring at least 4 elements remain in the package before
> > advancing the element pointer, returning -EPROTO if the package
> > structure is invalid.
> >=20
> > Signed-off-by: Marco Scardovi <scardracs@disroot.org>
> > ---
> >=20
> >  drivers/gpio/gpiolib-acpi-core.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/drivers/gpio/gpiolib-acpi-core.c
> > b/drivers/gpio/gpiolib-acpi-core.c index 049e4cbc14ed..494dcd166aef
> > 100644
> > --- a/drivers/gpio/gpiolib-acpi-core.c
> > +++ b/drivers/gpio/gpiolib-acpi-core.c
> > @@ -1310,6 +1310,8 @@ static int acpi_gpio_package_count(const union
> > acpi_object *obj)>=20
> >  		switch (element->type) {
> >  		case ACPI_TYPE_LOCAL_REFERENCE:
> >=20
> >  		case ACPI_TYPE_STRING:
> > +			if (end - element < 4)
> > +				return -EPROTO;
> >=20
> >  			element +=3D 3;
> >  			fallthrough;
> >  	=09
> >  		case ACPI_TYPE_INTEGER:





