Return-Path: <linux-gpio+bounces-11870-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 351D59AD3C9
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 20:18:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 631C81C20D72
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 18:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E3491D0946;
	Wed, 23 Oct 2024 18:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="yMWIWMUY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375441E51D
	for <linux-gpio@vger.kernel.org>; Wed, 23 Oct 2024 18:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729707476; cv=none; b=Q5+jruMai1XwFnGgG8SjJO0rZw2oufaAWNLrHay8Wh9KxlPk8XykTsNWnTVICY8NcdOuVCmxXELBPcqMwoFmE4xEYSGiYGBhQAiKQ6aXkg7aspRdUAYP9s3vJkgKl045t3aZ4Jed87XQcA3PwePJMI29D0TGrDPBJhn+LLlyfEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729707476; c=relaxed/simple;
	bh=pZWtl2EpHSew7lMjBCtML8kpzjhx9aaa2qe8M2I9MKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qOwebI20VawirIGyu8oemJqND2Lgajvpnn70cOatc/SYEv8exkDXmKzF9lykn2VZnnMnFUfgbazmOZ8Qzp8I+Kw2JemOCL0+Ne7pz7nxmLbPmnlJMszMN0NsckjD4abWTE+9MgWb/uLRRB9lQS+0HaaUvz8dJkpfiX7+fVLHVIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=yMWIWMUY; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53b1fbb8be5so516377e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 23 Oct 2024 11:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729707472; x=1730312272; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pZWtl2EpHSew7lMjBCtML8kpzjhx9aaa2qe8M2I9MKg=;
        b=yMWIWMUYM+f4smWAEZU18sanTjLQEWua9Rg+7q+9GC2G2JCVb8BkQiQaoQzXri/vZN
         ZshZXkmEmQVGBZp2CJQVmN4AzySbIfvkvVGKUPQq9jmQTEODNhGn6jgtb2urSPjcwhZ7
         48+NWDfHr8TVe7HP5Dfjs63i6ECSq/DuZtCavVU72FkGXU3rw0FUXrOLVPZlRFEcbT0A
         ck8sPm+9m1UNzCH7Km/LQC5CLuVFCRh12OAjBFtscEOyWVCsW9aAsy1mj/n1kcDElRGw
         hQjxno2A3JsvJ38kwgcZhhkaNDa5o0IzqCrRwfRHGooZ9dGgoVPet5E4SznVR0p9lKHW
         0BNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729707472; x=1730312272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pZWtl2EpHSew7lMjBCtML8kpzjhx9aaa2qe8M2I9MKg=;
        b=neIS8z96aPivONja9ZuknrD7O5+CudaSQmiumqolczaqeWmDTqjT+IuFCzb8E5OcUG
         LATCIDyTFNPUaXhGc/EN5nIZHQguEmkcVGRvL/0WAd00HLnjhILbfc7FzqsXVGORerx5
         iAWwrDGw7EuIFNJ01ifJRWEYep9tNHTYOnMoF1TB2/pnO7vgF2qU/EBlAHDDGomHnKAt
         SS+S13ze8iIsSH7kFKBCheC3bKp5ReGs2dyCL6AVgDKWSDB+ADsHc1ZGX+5F2tSg9kXt
         5XlEkm1/QyjDrLfFh52aX7i0H2CmVDM6fz6vzKMTflXFfqzOULfVL/r3r4LODNeY3V2N
         9oRg==
X-Gm-Message-State: AOJu0Ywhd3GSXZdRlON2b1tDnLJ3zc1zWuytt69XmfP6Qqx76889Hkm5
	hLfPcU51aMM2Fau7xOMgSGJzeS4Uks6dQWjHYBRKyP3bdbS5Rf8Wdpn1i76nI/PpEf3hLvh4G/I
	GeWY7oj3DzsqybuctxfmdH0W1f6B/8qVD8R1qMKq4ejSBE2IfBDs=
X-Google-Smtp-Source: AGHT+IF+3D6OW3LIw1+tG4+78Bq2ooF8etU+cGiQzQk+PNgApmHeyhNNknAKUv6HdclEJjGrfA64kvwZIU388XCs6LQ=
X-Received: by 2002:a05:6512:2397:b0:539:f6e1:f28 with SMTP id
 2adb3069b0e04-53b131aec59mr2097383e87.30.1729707472083; Wed, 23 Oct 2024
 11:17:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=McbWNANVLGSFe6aXjcjMoekUwjov8vM1dSMy03Vp4nXzg@mail.gmail.com>
 <12535751.O9o76ZdvQC@g550jk>
In-Reply-To: <12535751.O9o76ZdvQC@g550jk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Oct 2024 20:17:40 +0200
Message-ID: <CAMRc=Md6j-xizVcYJoC7U03gDspfM6UR_h-1EBHAWhMEo=bRRQ@mail.gmail.com>
Subject: Re: [ANNOUNCE] libgpiod v2.2
To: Luca Weiss <luca@lucaweiss.eu>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 6:25=E2=80=AFPM Luca Weiss <luca@lucaweiss.eu> wrot=
e:
>
> On Dienstag, 22. Oktober 2024 13:16:17 Mitteleurop=C3=A4ische Sommerzeit =
Bartosz
> Golaszewski wrote:
> > I'm announcing the release of libgpiod v2.2.
> >
> > This is a big update for libgpiod bringing in the D-Bus daemon and its
> > command-line client, GLib bindings with GObject-introspection and a
> > slew of other updates and improvements. The detailed changelog can be
> > found in the NEWS file.
> >
> > The goal of the D-Bus API is to address the concerns about the lack of
> > persistence of GPIO state when the process that requested it exits.
> > Now the state can be stored inside the GPIO manager with which clients
> > can interact using a well known protocol.
> >
> > The release tarball and the git tree can be found over at kernel.org[1]=
[2].
> >
> > Bartosz
> >
> > [1] https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/
> > [2] git://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git
> >
> >
>
> Hi Bartosz!
>
> I'm noticing while packaging for Alpine that the file name of the install=
ed
> lib changed from libgpiod.so.3.1.2 in v2.1.3 to libgpiod.so.3.1.1 in v2.2=
 - so
> essentially it jumped back.
>
> I'm guessing this is not on purpose and while I don't think it should cau=
se
> issues in the distro, I wanted to make you aware.
>

Everytime I do a release, I bump the libtool ABI numbers as suggested
here[1] depending on how the code evolved between the versions.

I guess I bumped the revision everytime new fixes landed and were
released in v2.1.x stable branch but for master I only did it once
when releasing v2.2.

I'm not sure what exactly should be done with that. I can of course
set the libgpiod ABI to v2.1.4 in v2.2.1 bugfix release if that
doesn't cause any issues but it doesn't really feel right.

Any suggestions?

Bart

[1] https://www.gnu.org/software/libtool/manual/html_node/Updating-version-=
info.html

