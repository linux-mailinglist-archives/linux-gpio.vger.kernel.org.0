Return-Path: <linux-gpio+bounces-31609-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFElIkVhjGmWlwAAu9opvQ
	(envelope-from <linux-gpio+bounces-31609-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 12:00:21 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AFA123B1A
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 12:00:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EB5E93006698
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 11:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1140E313E39;
	Wed, 11 Feb 2026 11:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KIuES/E9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C677C312807
	for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2026 11:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770807615; cv=none; b=Inz2xOOoh3l6fEXQX9n2KsMFjsHwhbE89p0Js0fy0sFAg+9BNHuiPtPsi3hj++3cNZ1aO7iLuadrtcfrce9X6jfAMYi0LIvDQYdRJKBOGYnNKlSVdiMludaLRdiS8v+bQnZrPsitBwx8QHErc3hPxM1XO0qvAZ1akCBUwSNfI3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770807615; c=relaxed/simple;
	bh=Q71D41HJjDx/GVXMsiZbcdIPx/7NN5WfZWD+Ad6buLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HzLwDdhG4cE6AO9VNOHqjEdsVpKboYyEYKrn0nQBv2586gVfW8n8TiLj/hKbxjw/jOI7debtfO3t1FN8RWuWagtmHcG+N2uRYItWwa7yWtSjSn7j5nBGx9oPPvwAoT2VCWd/Id3sHl+mAedr6BNCcVfs5q95Y1GNqqB/ZfjcGUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KIuES/E9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B8B8C19424
	for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2026 11:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770807615;
	bh=Q71D41HJjDx/GVXMsiZbcdIPx/7NN5WfZWD+Ad6buLc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KIuES/E9Zxr0JhTFbRlVNUpdyHoLKrXMSAi174g8Z/nFbvA67EIris5nCJUGUX43f
	 awUQ++/cJc+e9gvDXKBz5OTcid8DKxtm3Je5XG3xwn+KSq59g66GIar+QNhsqUD7um
	 Jm2pimQokD0D7p/34eVKtmVDCtD1lT5QXeg4nkFylmgZ5UoTeQFq85ZOFKvveWwRnd
	 Osxa4Ub2p4fqqpsbchbNG2SwYLWrVtc51vbG6vu6lm/Y26AP/ZL4YNDTOeRSxj/1kA
	 n4vyL4y3cEUssNkNy8a1E/LMZDzJBH5kha0RHHO13kYEnqoc03o0y66p1ExEHz7/G1
	 i+ed20svQ4L1Q==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3870d178a9aso9671fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2026 03:00:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWEfYkXJIre0aDWMA6QjxxhPEAahkI9RFgHmGF2QuwdNMaeY3KyIv2FVcJ6VdGR7R77rFBVn4M6i7/F@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5rh9c+dR7uEqn4IvNb2vyYIDU7a1sDgzMs0ONCWMb0Nl8VrkA
	AWNYqC6UZeiYmKWMpIc/BRfYYjbegxtWHFZGa44K/AegNq8TfALAzpdi/qKikMknQhh/qUaCvYP
	eGuqQdfHkAN2ASM4c0HdiRd7rHrqay/JXNHD3ZbVzAQ==
X-Received: by 2002:a2e:a907:0:b0:37f:d911:5941 with SMTP id
 38308e7fff4ca-386b5103281mr59331011fa.21.1770807614137; Wed, 11 Feb 2026
 03:00:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211081355.3028947-1-james.hilliard1@gmail.com>
 <20260211081355.3028947-2-james.hilliard1@gmail.com> <CAMRc=MfgoKmsNAmn3rO2jDL-ZArMX2Jh-n4SnV6rpzRY3KSwuA@mail.gmail.com>
 <CAMuHMdWS-ZaL1nLS=C=hjBVJeVtgNYX-XgWf-8Oy4cGt6OMGDg@mail.gmail.com>
 <CAMRc=MdRn=791YHaGZ7s+rwftJ84PYRivOO8gPPbCMNF6MUH3w@mail.gmail.com> <2c5734db-1e62-4aeb-9c6a-ef14939575c2@kernel.org>
In-Reply-To: <2c5734db-1e62-4aeb-9c6a-ef14939575c2@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 11 Feb 2026 12:00:01 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mdx38dS9TkeasRUPMcpwMiwz8+gzozoJxNbbkMSd5C_dg@mail.gmail.com>
X-Gm-Features: AZwV_QiNulaSg29fYtlPqFXRPoXswOw661F4KORcSFwxHLjwXxf6fZiop2O2gec
Message-ID: <CAMRc=Mdx38dS9TkeasRUPMcpwMiwz8+gzozoJxNbbkMSd5C_dg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: aggregator: add gpio-aggregator DT compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, James Hilliard <james.hilliard1@gmail.com>, 
	linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Stein <linux@ew.tq-group.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux-m68k.org,gmail.com,vger.kernel.org,kernel.org,ew.tq-group.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31609-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,mail.gmail.com:mid,linux-m68k.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 85AFA123B1A
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 11:49=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 11/02/2026 11:38, Bartosz Golaszewski wrote:
> > On Wed, Feb 11, 2026 at 10:50=E2=80=AFAM Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote:
> >>
> >>>>
> >>>>  static const struct of_device_id gpio_aggregator_dt_ids[] =3D {
> >>>> +       {
> >>>> +               .compatible =3D "gpio-aggregator",
> >>>> +       },
> >>>>         {
> >>>>                 .compatible =3D "gpio-delay",
> >>>>                 .data =3D (void *)FWD_FEATURE_DELAY,
> >>>> --
> >>>> 2.43.0
> >>>>
> >>>
> >>> Regardless of the DT bindings - this change is perfectly fine. We do
> >>> that for other "virtual" devices like gpio-sim, gpio-virtuser, etc. I
> >>> would just ask you to document it under
> >>> Documentation/admin-guide/gpio/gpio-aggregator.rst.
> >>
> >> This is not a pure virtual device, but for use with actual hardware.
> >>
> >> Nacked-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >>
> >
> > Well, it is a virtual device in that there's no actual "aggregator"
> > device on the board. It virtually aggregates GPIOs into a separate
> > chip for user's convenience. While there's no such device as a
> > gpio-aggregator - and so we must not put it into bindings nor into
> > mainline devicetree sources - having a compatible matching in the
> > driver is perfectly fine IMO. Just like gpio-sim.
>
> I already wrote, you cannot have undocumented compatible. There are even
> explicit checks for this - in schema and checkpatch - so with your
> approach you accept known warnings. Really, no, and fact we need to keep
> discussing it:
>
> Nacked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
> Best regards,
> Krzysztof

Krzysztof disciplined me in private and promised the beatings will
continue until my understanding improves. I retract my statement, this
is of course wrong and NAKed.

Bartosz

