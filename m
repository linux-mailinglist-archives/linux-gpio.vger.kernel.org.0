Return-Path: <linux-gpio+bounces-36754-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SN8VMSOFBGrNLAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36754-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 16:05:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E63A4534A8D
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 16:05:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78431328C033
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 13:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AC913F4119;
	Wed, 13 May 2026 13:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gmrV1wAj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7AA3F4112
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 13:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778679878; cv=none; b=B82God9dS3LULOVHhg2z+nCvUi+VEulZ/Swo6fPyDooieG6E897cpv3q8aeFeyewybkKMd25q2WdqhBu2RCtI6XFbwZ+b+NY7vD18LF2KTE9c/V+rgKj4Xq/yfw7OMDdKn/FyJo8LXz5lXyAr5uyk+A0KZnOjXHm2V7hBIZc3ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778679878; c=relaxed/simple;
	bh=WLPofoIDJAuNNby+SiZH/NA/RojapWeLMjEtzfWmowo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cg1YhLzC8LC7CewPOB4OyMl7nO/kDon/lnoA1a7flkNPd5LZwoEaWivO2ErP78GN6jtkT+IbUaleGPCT1A1OfEPlgvcaDX5iJXBYqVpi+70MkRYzrI86/kQG3+W3Emf2uJQ7+Ar5MFdBmOysrwDNgUzktXK/B0sIJJ+WjZrj7TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gmrV1wAj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5B81C2BCB8
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 13:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778679877;
	bh=WLPofoIDJAuNNby+SiZH/NA/RojapWeLMjEtzfWmowo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gmrV1wAjTuFZ8B+/uNkFq39V6vHIXSWTCoVcJoUBkcl2LJ7jmQqzlJlSTxOHeiZwq
	 t9GRUOWopIsNq9o5+OL74ivfDl/HQuVOUXYNhum8BcJI+9YELeGsWQqPFHljxKr/cp
	 slkxv9hbr7TAM/0fnWyU2BUuhoNb7ffyEWNYdddymC+NSIOM0vLFEE3CY+7yafY0ke
	 IwW50pyC0dkHPhRsvhHgJKRr3cD+16Kb7jx2EAYnO5J7kQhTedTukeK2b4bHmr8qR5
	 7nA2vD0rggqoYlsNUiVOt78ld+wbaX0A52Qp3mwfQe+CWmoUAqLRZOKkarLOdSv+Rj
	 J7tRd+HL4LDZQ==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39394e1e8f3so58911481fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 06:44:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9ZCuPfrPQL5PU0GJ9HaBq9Yt8gnZUxsKjDDEGRwx7vdG9ZeJl+BRFycCYhzWoechI0kgkdeJ6ORyyZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzpBKtZiYPpJgQpFv9trx9fhRLBtOXdrqY+MxOZ8w8Hgq6tAo5I
	xuF1q/az8BBgkwxggRCZOVmYYZW3zRiXkAerNvbWf+uOA5fIU2cQ5ACDS7m4y2IkFhsk7UTc3+b
	LZ35ct12Pi8EOOD4rUnqdm2Xg8yEOcBeF5pNVudYm4Q==
X-Received: by 2002:a05:651c:1587:b0:393:940e:d5eb with SMTP id
 38308e7fff4ca-3944b4576f5mr13098191fa.3.1778679876503; Wed, 13 May 2026
 06:44:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-gpio-timberdale-swnode-v3-0-9a1bc1b2b124@oss.qualcomm.com>
 <177754249703.2432539.15541841890441225607.b4-ty@b4> <20260430095235.GG1806155@google.com>
 <CAMRc=Md=eMGA4iSTJmd4_wBBDXEJRcbGyUQd5kjcFC6MGiy_fQ@mail.gmail.com> <20260513133950.GX305027@google.com>
In-Reply-To: <20260513133950.GX305027@google.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 13 May 2026 15:44:24 +0200
X-Gmail-Original-Message-ID: <CAMRc=Mf+rbxesi5QKYC4zAMT8Zem4kaFL-Km4NOmqi898QBtaw@mail.gmail.com>
X-Gm-Features: AVHnY4KY2LZ_KblLsuofDWStg43ljm4ZiedWstUt181Jcp_vpZremfhMTOQh37U
Message-ID: <CAMRc=Mf+rbxesi5QKYC4zAMT8Zem4kaFL-Km4NOmqi898QBtaw@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] gpio: timberdale: remove platform data header
To: Lee Jones <lee@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: E63A4534A8D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36754-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 3:39=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> On Mon, 11 May 2026, Bartosz Golaszewski wrote:
>
> > On Thu, Apr 30, 2026 at 11:52=E2=80=AFAM Lee Jones <lee@kernel.org> wro=
te:
> > >
> > > On Thu, 30 Apr 2026, Lee Jones wrote:
> > >
> > > > On Fri, 27 Mar 2026 11:49:06 +0100, Bartosz Golaszewski wrote:
> > > > > There are several GPIO driver header scattered directly under
> > > > > include/linux/. I'd like to either remove them or move then under
> > > > > include/linux/gpio/. In case of gpio-timberdale, the platform dat=
a
> > > > > struct can be replaced with generic device properties. This serie=
s does
> > > > > that. It can go either though the MFD tree or GPIO with an Ack fr=
om Lee.
> > > > >
> > > > >
> > > > > [...]
> > > >
> > > > Applied, thanks!
> > > >
> > > > [1/4] mfd: timberdale: move GPIO_NR_PINS into the driver
> > > >       commit: c44d171a52513bfd06b5d847b42b0c1013ddd46e
> > > > [2/4] mfd: timberdale: set up a software node for the GPIO cell
> > > >       commit: 2012c0d1b91767b68dedac127c3575cf816313e1
> > > > [3/4] gpio: timberdale: use device properties
> > > >       commit: 065d211f9ef7e60c510cbb3663ffdb7ca14efae2
> > > > [4/4] gpio: timberdale: remove platform data header
> > > >       commit: 0cb4edca4ed1325ddeb368f80807403cc37edc00
> > >
> > > Note to self: ib-mfd-gpio-7.2
> > >
> > > --
> > > Lee Jones
> >
> > Hi Lee!
> >
> > I received this notification from b4 but this series never made its
> > way into linux-next. Is there anything else I should do?
>
> This was sent 4 days before you asked:
>
> https://lore.kernel.org/r/20260507152835.GR305027@google.com
>
> Something not working?
>

I never got it in my inbox for some reason. Thanks!

Bart

