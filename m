Return-Path: <linux-gpio+bounces-7762-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC82291AB00
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2024 17:20:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 668951F2285B
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2024 15:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68B2B198827;
	Thu, 27 Jun 2024 15:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="d2lZXacc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F2D198A08
	for <linux-gpio@vger.kernel.org>; Thu, 27 Jun 2024 15:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719501628; cv=none; b=YGWaeIWwBZpd5pLJsyIqjdY5OipH/t5GVg4047x7HuxhgqxZTGXgzlLbP+xbDEtwNVSdklsxgTwx5YGl8T7/KmE8wxTQCn3LYMicUGwL5eQZayZUk13a1ebPaDMqb42X3jL2hJaNWjty5xYZ83gENBBCdx9QA7cYlXBiFWLfJxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719501628; c=relaxed/simple;
	bh=qn2ixVyyXCsO5ePVgLbp+ysoST/ZQZXuTgQsgzdlUy8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i23v58XCPg+dj3KElCD3NN7hMMplliRMSTS6y+aoC5yZEjMnzRq6Bj9FMRrKsUQKAot/Kbu0lN9OcBMt6FTZkJhak9LgkB1G67y2qSGPFglR3viv9o6uB7J2Mx3KdwqQRvGtCBGW6hFXT94rsNpdbKoHx5AvLMqBSraqVYsNwVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=d2lZXacc; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ec6635aa43so42326081fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 27 Jun 2024 08:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719501624; x=1720106424; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lkhnq0v84BAno+eELTF4Xfc6TkBd4owtSQ6dO7TeZAs=;
        b=d2lZXaccIxsURDxSCxs7OBObdFBEgCTxGuUUVkRU75Ba4ot3l0n1wh88HFCDvQIKL9
         2w59R1iaYtgKtyqUMTS/H1atWPNnIJD3N33VArG+iNFJ+E+SupXUzn7oCMTXbpZsFPUF
         libpdE0SeyQrBBDFD8WkULaZw9x2qStlrpNcrl8GhjCRukQfjmeCJcRu0oIf73e1sJYm
         a2IiGFEdlEJ6/Uj6Th7j+lIMirM4F9ZhJ5U0CrdYInimuBSlluiLQ+nvAYWRVl5r7SW+
         PceefAWgP//bhODL1O7kX3U/2kWmmVcuULKNw+dAX6LkZIzdf5Ei99qGwjvsVphFaMlx
         uGTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719501624; x=1720106424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lkhnq0v84BAno+eELTF4Xfc6TkBd4owtSQ6dO7TeZAs=;
        b=bddGW88y5qSbd+MjE2b/z4q1PwX7dInkGxhafIUXQilsb3kF3+O5Kd1fYKooe+jTc8
         ZapY4K13NLaT8K9qw8FEpH6TFtwaCysGst88eI+VOp+mm1uDvxQxThgSZBVGuXm8dx8K
         lzQtCdz74Cem5KV4LJOkZh+hk9r1T744ivE8anBI5xfsractHBUywUVmNcVRTO1lj+Yb
         SJJhMPacL5b4UdW8b0a6axUN0Zx4FeHnXg6nUXVtc7g6gltlKCe2S2s53AxRLgD+xoVM
         csocRstx8nuWEer2kux9VmtOFubFpQLPxL+Y5UzNpdelZnHnDN4ER85IguSXBnU+K+z/
         BOeQ==
X-Gm-Message-State: AOJu0Yw+LVYmKuJyNZAiFfUWdocU1uZSb1VPgeZHa1EVCVjpfPgyKtNV
	qkiYDAcxf9DwtBpSR4mgiqDuPyHyvx3jN3klBbz+McrHDgrGGKd2/0y+ZyC9Ir7DfXApqfxpKN7
	5ApGRSCayNq0L6QMHnVieAnry3+hjCOjubX4LhsJXFi8KDMD4
X-Google-Smtp-Source: AGHT+IGOA1yGPscbCHp2nabwa9RwJq/yr9BhXQe/HWvmeh3vTxkd8FzzmI+lsd2sFoyqlbvPSaguTTwxle0vI3eq9CQ=
X-Received: by 2002:a2e:8795:0:b0:2ec:4399:9bff with SMTP id
 38308e7fff4ca-2ec579c8da8mr91408281fa.42.1719501624170; Thu, 27 Jun 2024
 08:20:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240626053808.179457-1-warthog618@gmail.com> <20240626053808.179457-4-warthog618@gmail.com>
 <CAMRc=MdcdUJOU7uPY5Yu2dppvOBfLY_QbEuWH8Zdz28Pki7BSA@mail.gmail.com>
In-Reply-To: <CAMRc=MdcdUJOU7uPY5Yu2dppvOBfLY_QbEuWH8Zdz28Pki7BSA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 27 Jun 2024 17:20:13 +0200
Message-ID: <CAMRc=MfsV3B4SG73GRtusnKfHPtRA7mmQEo0DHRxG_bqYkWNTg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 3/3] bindings: python: tests: add coverage of
 kernel reconfigure as-is behaviour
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2024 at 5:06=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Wed, Jun 26, 2024 at 7:39=E2=80=AFAM Kent Gibson <warthog618@gmail.com=
> wrote:
> >
> > The kernel's handling of reconfigure with default values, as is the
> > case for providing a None value as the settings to the Python bindings'
> > reconfigure_lines(), resets any flags set to non-default values when th=
e
> > line is requested to their default values.  While the flags are cleared=
,
> > the kernel makes no corresponding change to the electrical settings -
> > though subsequent calls to get and set values will apply the updated
> > flags.
> >
> > The tests for missing or None settings are extended to demonstrate the
> > issue for active_low and drive flags, though the issue applies to all
> > flags.
> >
> > The tests fail unless the kernel is patched to ignore reconfiguration
> > of lines without direction set.
> >
>
> Does it mean the kernel patches (at least the first two in the series)
> are meant to be backported?
>
> Bart

Well, that was a stupid question, they both have the Fixes: tag...

Bart

>
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > ---
> >  bindings/python/tests/tests_line_request.py | 14 ++++++++++++--
> >  1 file changed, 12 insertions(+), 2 deletions(-)
> >
> > diff --git a/bindings/python/tests/tests_line_request.py b/bindings/pyt=
hon/tests/tests_line_request.py
> > index 2f375d6..79167f1 100644
> > --- a/bindings/python/tests/tests_line_request.py
> > +++ b/bindings/python/tests/tests_line_request.py
> > @@ -5,7 +5,7 @@ import errno
> >  import gpiod
> >
> >  from . import gpiosim
> > -from gpiod.line import Direction, Edge, Value
> > +from gpiod.line import Direction, Drive, Edge, Value
> >  from unittest import TestCase
> >
> >  Pull =3D gpiosim.Chip.Pull
> > @@ -462,7 +462,9 @@ class ReconfigureRequestedLines(TestCase):
> >          self.sim =3D gpiosim.Chip(num_lines=3D8, line_names=3D{3: "foo=
", 4: "bar", 6: "baz"})
> >          self.chip =3D gpiod.Chip(self.sim.dev_path)
> >          self.req =3D self.chip.request_lines(
> > -            {(0, 2, "foo", "baz"): gpiod.LineSettings(direction=3DDire=
ction.OUTPUT)}
> > +            {(0, 2, "foo", "baz"): gpiod.LineSettings(direction=3DDire=
ction.OUTPUT,
> > +                                                      active_low=3DTru=
e,
> > +                                                      drive=3DDrive.OP=
EN_DRAIN)}
> >          )
> >
> >      def tearDown(self):
> > @@ -511,6 +513,8 @@ class ReconfigureRequestedLines(TestCase):
> >      def test_reconfigure_with_default(self):
> >          info =3D self.chip.get_line_info(2)
> >          self.assertEqual(info.direction, Direction.OUTPUT)
> > +        self.assertTrue(info.active_low)
> > +        self.assertEqual(info.drive, Drive.OPEN_DRAIN)
> >          self.req.reconfigure_lines({
> >              0: gpiod.LineSettings(direction=3DDirection.INPUT),
> >              2: None,
> > @@ -520,10 +524,14 @@ class ReconfigureRequestedLines(TestCase):
> >          self.assertEqual(info.direction, Direction.INPUT)
> >          info =3D self.chip.get_line_info(2)
> >          self.assertEqual(info.direction, Direction.OUTPUT)
> > +        self.assertTrue(info.active_low)
> > +        self.assertEqual(info.drive, Drive.OPEN_DRAIN)
> >
> >      def test_reconfigure_missing_offsets(self):
> >          info =3D self.chip.get_line_info(2)
> >          self.assertEqual(info.direction, Direction.OUTPUT)
> > +        self.assertTrue(info.active_low)
> > +        self.assertEqual(info.drive, Drive.OPEN_DRAIN)
> >          self.req.reconfigure_lines(
> >                  {(6, 0): gpiod.LineSettings(direction=3DDirection.INPU=
T)}
> >              )
> > @@ -531,6 +539,8 @@ class ReconfigureRequestedLines(TestCase):
> >          self.assertEqual(info.direction, Direction.INPUT)
> >          info =3D self.chip.get_line_info(2)
> >          self.assertEqual(info.direction, Direction.OUTPUT)
> > +        self.assertTrue(info.active_low)
> > +        self.assertEqual(info.drive, Drive.OPEN_DRAIN)
> >
> >      def test_reconfigure_extra_offsets(self):
> >          info =3D self.chip.get_line_info(2)
> > --
> > 2.39.2
> >

