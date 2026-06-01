Return-Path: <linux-gpio+bounces-37750-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CqjKEA8HWoqWQkAu9opvQ
	(envelope-from <linux-gpio+bounces-37750-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Jun 2026 10:01:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE4361B38E
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Jun 2026 10:01:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0506C300C58B
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jun 2026 07:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A1F238838A;
	Mon,  1 Jun 2026 07:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="awMPDWjo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC02C38330A;
	Mon,  1 Jun 2026 07:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780300458; cv=none; b=MQJoYxYYTq3q8xHeYnkCSvc5WHdtOPeTFFqMr25zzBYcjfgAfUjFylt6L0eq8LQO5a2pFyUz3amlxF/MQoVdD75AP9nnuKhutWJY0PHR3czg45/ArwigZV+xPiQqzWUvb2yYtLH7IbywSzvgSlQG/9AQF/iOB3HftuNJ/npUsYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780300458; c=relaxed/simple;
	bh=Ik6ainCX66BzJ2Qfs+GvgOivesqakYk67fQ8G/ADhF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SBDGwLc7g4K6LtZHPyBckSEz0VQoNhY55+8nmJnZtec8HnBrkE2kLuMav34jaZs14wg+fEypSTDemX+dViMKnX05UBSh5HvHJVfuslFglxsRG7eANTYpSou9iiyjnt4AwFVMqdOqoQ2wHXdpNEY69LGqHp/wzKrIRDuHu7ChNv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=awMPDWjo; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 8D19426D73;
	Mon,  1 Jun 2026 09:54:13 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ODjpnW_pSBb; Mon,  1 Jun 2026 09:54:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1780300453; bh=Ik6ainCX66BzJ2Qfs+GvgOivesqakYk67fQ8G/ADhF4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=awMPDWjoT4sXwQCokgHyMDtUb6KIgfR+wVCMN1soGgfzhMpC7QaLvNYHnH5BsTEtI
	 pg3rV+xSTuixXNnkC0etfnbmHAHejoB0VOkH52REnlR4GsLHeQ9blfOTkrHAT0HvG/
	 9TrKxJuDme1shdK3sMD0D8DrHSx4rq+O1wg1vcZQQAKu1EFQpw7mEbyZ2di/cmimd+
	 aJdLk7dY8qAa8VHYhV5+wSvDyc4AiJDlh6mVtUmUTSyEOZNjf+5ijsiVyzKtmC3P5A
	 bgG4eMxb4OqPQaCfuivfjp191sgiMhtazwLCXckvhEamrEGugtZD8sUaUQCxVIu9Uk
	 iIqxcYl5WDR+Q==
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
Date: Mon, 01 Jun 2026 09:53:59 +0200
Message-ID: <XIZQ_cBiSFe35zZxB6k2Jw@disroot.org>
In-Reply-To: <20260601071703.GP3102@black.igk.intel.com>
References:
 <20260530094012.184276-1-scardracs@disroot.org>
 <n2_NwWYBRGa8ixTcAQysQw@disroot.org>
 <20260601071703.GP3102@black.igk.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[disroot.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37750-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[scardracs@disroot.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 3DE4361B38E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In data luned=C3=AC 1 giugno 2026 09:17:03 Ora legale dell=E2=80=99Europa c=
entrale, Mika=20
Westerberg ha scritto:
> Hi,
>=20
> On Mon, Jun 01, 2026 at 08:31:16AM +0200, Marco Scardovi wrote:
> > In data luned=C3=AC 1 giugno 2026 07:17:35 Ora legale dell=E2=80=99Euro=
pa centrale,
> > Mika
> >=20
> > Westerberg ha scritto:
> > > On Sat, May 30, 2026 at 11:40:12AM +0200, Marco Scardovi wrote:
> > > > When counting GPIOs in an ACPI package, encountering a reference or
> > > > string causes the element pointer to be advanced by 3 (element +=3D=
 3)
> > > > and then by 1 (element++).
> > > >=20
> > > > If a malformed ACPI package contains fewer than 4 remaining elements
> > > > when a reference or string is processed, this pointer arithmetic
> > > > advances the element pointer past the end of the package elements
> > > > array. This results in undefined behavior and can cause out-of-boun=
ds
> > > > reads.
> > >=20
> > > How can it cause out-of-bounds reads? We increase "element" but the n=
ext
> > > iteration checks that it is still inside "end" and it's never
> > > dereferenced.
> > > Maybe I'm missing something?
> >=20
> > Hi Mika,
> >=20
> > I agree that `element` is not dereferenced after the loop exits.
> >=20
> > My main concern is the parser logic rather than the pointer arithmetic
> > itself.
> >=20
> > A GPIO connection is defined to consist of 4 package elements
> > (a reference/string followed by 3 integers), but the loop condition only
> > checks whether at least one element remains:
> >=20
> > ```
> > element < end
> > ```
> >=20
> > As a result, a malformed package containing fewer than 4 remaining
> > elements
> > can still be processed as if it were a complete GPIO entry. This can le=
ad
> > to a GPIO connection being accounted for even though the descriptor is
> > structurally incomplete.
>=20
> Does it take into account that GPIOs are optional in some cases so this is
> totally valid:
>=20
>   Package () {
>       "cs-gpios",
>       Package () {
>          ^GPIO, 19, 0, 0,
>          ^GPIO, 20, 0, 0,
>          0,
>          ^GPIO, 21, 0, 0,
>       }
>   }
>=20
> I'm worried that this breaks things rather than improves. If your intent =
is
> to "harden" against malicios ACPI tables then there are much worse things
> than this that can be done (e.g we run a full bytecode interpreter inside
> the kernel with not much restrictions and all that bytecode comes from the
> ACPI tables).
>=20
> Have you verified this change against any system that actually calls this
> function?
>
Hi Mika,

thanks for the detailed explanation =E2=80=94 I think your point is
absolutely correct.

Looking again at the code and considering the valid ACPI cases you
mentioned (including optional GPIO entries and non-strict packages),
I realize my patch was too aggressive and based on an incorrect
assumption about the parsing invariants.

I was incorrectly assuming that each GPIO descriptor must always
consist of a strict 4-element sequence, which led me to interpret
partial or irregular packages as invalid.

I also tested the change only with virtme-ng, as I do not have
access to real hardware, but I agree this is not sufficient to
validate the behavior in real systems.

The check I proposed would likely reject valid real-world cases and
effectively change the semantics of the parser rather than fixing a
real issue.

Given this, I agree the change is not appropriate and I will drop the
patch.

Sorry for the noise, and thanks for the clarification.
Marco
>=20
> > Such truncated descriptors should be rejected with `-EPROTO` rather than
> > being accepted as valid input.
> >=20
> > Ensuring sufficient remaining elements before entering the loop also
> > guarantees that pointer arithmetic stays within the defined bounds of t=
he
> > package, but the primary issue is the acceptance of incomplete GPIO
> > entries.>=20
> > > > Fix this by ensuring at least 4 elements remain in the package befo=
re
> > > > advancing the element pointer, returning -EPROTO if the package
> > > > structure is invalid.
> > > >=20
> > > > Signed-off-by: Marco Scardovi <scardracs@disroot.org>
> > > > ---
> > > >=20
> > > >  drivers/gpio/gpiolib-acpi-core.c | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > >=20
> > > > diff --git a/drivers/gpio/gpiolib-acpi-core.c
> > > > b/drivers/gpio/gpiolib-acpi-core.c index 049e4cbc14ed..494dcd166aef
> > > > 100644
> > > > --- a/drivers/gpio/gpiolib-acpi-core.c
> > > > +++ b/drivers/gpio/gpiolib-acpi-core.c
> > > > @@ -1310,6 +1310,8 @@ static int acpi_gpio_package_count(const union
> > > > acpi_object *obj)>
> > > >=20
> > > >  		switch (element->type) {
> > > >  		case ACPI_TYPE_LOCAL_REFERENCE:
> > > >=20
> > > >  		case ACPI_TYPE_STRING:
> > > > +			if (end - element < 4)
> > > > +				return -EPROTO;
> > > >=20
> > > >  			element +=3D 3;
> > > >  			fallthrough;
> > > >  	=09
> > > >  		case ACPI_TYPE_INTEGER:





