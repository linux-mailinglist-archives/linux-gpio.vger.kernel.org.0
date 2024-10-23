Return-Path: <linux-gpio+bounces-11863-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEAB9AD067
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 18:27:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 078281F224F7
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 16:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDBE31CDFC2;
	Wed, 23 Oct 2024 16:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="gi36szbJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45CE1CB536
	for <linux-gpio@vger.kernel.org>; Wed, 23 Oct 2024 16:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729700763; cv=none; b=I+QIYOSZLVH62pshgs6ppoDE4t9tEkZKMDgbv7Kohq/d1sNMsA6ejoYvBkZmv7U4wvsXAeKNmyx81eod1Vd/c7U33LYvoZ2eVo/InjDyLaPHFpmHEy2WVjlJn2YK/fWdHtpI2J4hRvQmbuiMcPTs5uwZ/CYc2Jw0xTyQi1Vl5lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729700763; c=relaxed/simple;
	bh=ufkCmIfHGwkRq0NOnWddAuhThAyI5e6R6yR6zbcP94Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CBERL5ACTLOyKDFKh/B+TFObivnW5UtipZfoPIpNg8Az9R8Zm0OGToge0mSYr6Z0qIvgQJtVldCgHsbyYY26eMV4oFtaJynvMfm9iqBg/OhT8gGbiALeaFdof72HNg4rUq7hogblJ7poN33fgsd79Ott8ExZI5v1Jln3Q3INCLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=gi36szbJ; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1729700753; bh=ufkCmIfHGwkRq0NOnWddAuhThAyI5e6R6yR6zbcP94Y=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=gi36szbJFRxkguR0KHVTDxCfoGrzAjlqrE1tQhCVKaojH1RqATmk+6yQY5hyDOKfS
	 8K6OBg6+9Rv2oEu3xXEPuicW9vgm1airnVb9RByaCsFC6j2CbZBKws4QgBWwT2Yk81
	 qX7T/9DvlioKpk51twwKhCBUVsrF8/u9ZF10mrzM=
From: Luca Weiss <luca@lucaweiss.eu>
To: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [ANNOUNCE] libgpiod v2.2
Date: Wed, 23 Oct 2024 18:25:52 +0200
Message-ID: <12535751.O9o76ZdvQC@g550jk>
In-Reply-To:
 <CAMRc=McbWNANVLGSFe6aXjcjMoekUwjov8vM1dSMy03Vp4nXzg@mail.gmail.com>
References:
 <CAMRc=McbWNANVLGSFe6aXjcjMoekUwjov8vM1dSMy03Vp4nXzg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Dienstag, 22. Oktober 2024 13:16:17 Mitteleurop=C3=A4ische Sommerzeit Ba=
rtosz=20
Golaszewski wrote:
> I'm announcing the release of libgpiod v2.2.
>=20
> This is a big update for libgpiod bringing in the D-Bus daemon and its
> command-line client, GLib bindings with GObject-introspection and a
> slew of other updates and improvements. The detailed changelog can be
> found in the NEWS file.
>=20
> The goal of the D-Bus API is to address the concerns about the lack of
> persistence of GPIO state when the process that requested it exits.
> Now the state can be stored inside the GPIO manager with which clients
> can interact using a well known protocol.
>=20
> The release tarball and the git tree can be found over at kernel.org[1][2=
].
>=20
> Bartosz
>=20
> [1] https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/
> [2] git://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git
>=20
>=20

Hi Bartosz!

I'm noticing while packaging for Alpine that the file name of the installed=
=20
lib changed from libgpiod.so.3.1.2 in v2.1.3 to libgpiod.so.3.1.1 in v2.2 -=
 so=20
essentially it jumped back.

I'm guessing this is not on purpose and while I don't think it should cause=
=20
issues in the distro, I wanted to make you aware.

Regards
Luca



