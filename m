Return-Path: <linux-gpio+bounces-7760-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8AA91AA7C
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2024 17:07:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82479289B3D
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2024 15:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15E1A1990A3;
	Thu, 27 Jun 2024 15:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="btX4dnoO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E8B198A3E
	for <linux-gpio@vger.kernel.org>; Thu, 27 Jun 2024 15:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719500775; cv=none; b=S2hMB4uETkZy6wU3ZN/VGh0ZrcNd3/Fbnz2qk5bKa5m9jnSkkq0Rj4tqL0PSl5tnQx+oZM0KPr3ma4auSoQjeoGWyhii0H48+EVRuh9MNEQzOIYUZ1RYpgARvH9wwx5FwEnu5cZXQM95YFLT+BgTzd+LnZaUvC1gQD2jm2CD9Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719500775; c=relaxed/simple;
	bh=5xsNA/QPQLzzuhzfl9et6OQKfExj61HERL+3X/4e3uQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TIUzacbgoc3jepO3mNHuZZtzFON4CjKW7bFTF7abPxH3D0SYelxVRfsPTHIE8IuMDkBQhxyNPQlPXdUKVFqi6zQyZGIJVbce3tLtRhzjBoyr9mqpW5fSLpmaWaXF6JivtKZ/WVbqdGEVx3nNeChS8D8W9JpBYgZlV8WV22NIQaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=btX4dnoO; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ebed33cb65so91442871fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 27 Jun 2024 08:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719500772; x=1720105572; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nAVJ3LHDknC9kkdHtVG94Nn4/XkcYdSrZr63bx1zpFs=;
        b=btX4dnoOwbnMh2WXXHZjHgppMRjmg+5w6K3mcnGD3aJIB5vy5AH85e3tEEFimt824p
         rizYEGNzsLxqMeEe5rriDrvMZXO9+f53fE1B8sLsqVOxR1lmBjRM1GNeDN0AtvfbsU2W
         +53jS7paQJjArHQhZwDHHuzSIf/Ieq/38t8MVyNinqIthnKTuqlFCiPYsjcbefwnYvtt
         BVoQEba+3rUioUEVbf2LkX9GVIjSo6F12OFlMMUw1h2CSjTdjhoo3DFrWQ5KxGtegPHE
         liNVr2bqcykJnNHFKrtGVHRL0/zhzLsVBdKc50h6ui5jtOMUX5foDM5Ir87nEJd2S8Wn
         wQsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719500772; x=1720105572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nAVJ3LHDknC9kkdHtVG94Nn4/XkcYdSrZr63bx1zpFs=;
        b=sDZA/2F2yj4F66CL8aQI1haaropyjrdxim+eGBgHaUzQ0dMfWSDXxYK8Vaz46Wk0zu
         PW679XxwLFF56jOp8fPydJQnzfwvS3fZIZ1+hgEs6/5aGn3qCNtfIpV9YkfKSyEe4thh
         A/E+hjAB+oGyh6gsDo01As7VqXdbKhRLChRvmSRUovWwKhbGXBdE3wpVAuL0ej7VcuBO
         0ioJjOsHsIRShdj+h7lEj745rgCwdy7T/qxznArCt03Ccv1q5xamyDBqScWw3SyVr6Of
         OH+sWmVZx5Bduk5asKKInp9dEMucPEQCTkGdvz8ZOOCOBvBYOV5KnXa5QTamfiyZAQE7
         TP2w==
X-Gm-Message-State: AOJu0Ywx3mdk6Vqv6GxUOo0/Fx3mKWRixaSVvf+l1XndXFsgoCWcQrCp
	7XR3A8wqv/F4Pq2YrCZu22CaVNaSt36ytDEuamsGF+QFKfVaDtzD43rfn5QtC8xKP74mr7DuVxl
	ymZkEGPTQqsA38JvxLMRTyA8hac7q270wyefAichrdunYCu1O
X-Google-Smtp-Source: AGHT+IHavmbVAuYoPSB99Pe9LjLlXP4JvsBA172X2j161kXYh7ytCu97IkHw8oO/2zbHx0WPu5H+Fy/8NV896ZS6Tak=
X-Received: by 2002:a05:651c:ca:b0:2ec:140c:8985 with SMTP id
 38308e7fff4ca-2ec5936fb10mr107975841fa.36.1719500771928; Thu, 27 Jun 2024
 08:06:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240626053808.179457-1-warthog618@gmail.com> <20240626053808.179457-4-warthog618@gmail.com>
In-Reply-To: <20240626053808.179457-4-warthog618@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 27 Jun 2024 17:06:00 +0200
Message-ID: <CAMRc=MdcdUJOU7uPY5Yu2dppvOBfLY_QbEuWH8Zdz28Pki7BSA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 3/3] bindings: python: tests: add coverage of
 kernel reconfigure as-is behaviour
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 7:39=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> The kernel's handling of reconfigure with default values, as is the
> case for providing a None value as the settings to the Python bindings'
> reconfigure_lines(), resets any flags set to non-default values when the
> line is requested to their default values.  While the flags are cleared,
> the kernel makes no corresponding change to the electrical settings -
> though subsequent calls to get and set values will apply the updated
> flags.
>
> The tests for missing or None settings are extended to demonstrate the
> issue for active_low and drive flags, though the issue applies to all
> flags.
>
> The tests fail unless the kernel is patched to ignore reconfiguration
> of lines without direction set.
>

Does it mean the kernel patches (at least the first two in the series)
are meant to be backported?

Bart

> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  bindings/python/tests/tests_line_request.py | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/bindings/python/tests/tests_line_request.py b/bindings/pytho=
n/tests/tests_line_request.py
> index 2f375d6..79167f1 100644
> --- a/bindings/python/tests/tests_line_request.py
> +++ b/bindings/python/tests/tests_line_request.py
> @@ -5,7 +5,7 @@ import errno
>  import gpiod
>
>  from . import gpiosim
> -from gpiod.line import Direction, Edge, Value
> +from gpiod.line import Direction, Drive, Edge, Value
>  from unittest import TestCase
>
>  Pull =3D gpiosim.Chip.Pull
> @@ -462,7 +462,9 @@ class ReconfigureRequestedLines(TestCase):
>          self.sim =3D gpiosim.Chip(num_lines=3D8, line_names=3D{3: "foo",=
 4: "bar", 6: "baz"})
>          self.chip =3D gpiod.Chip(self.sim.dev_path)
>          self.req =3D self.chip.request_lines(
> -            {(0, 2, "foo", "baz"): gpiod.LineSettings(direction=3DDirect=
ion.OUTPUT)}
> +            {(0, 2, "foo", "baz"): gpiod.LineSettings(direction=3DDirect=
ion.OUTPUT,
> +                                                      active_low=3DTrue,
> +                                                      drive=3DDrive.OPEN=
_DRAIN)}
>          )
>
>      def tearDown(self):
> @@ -511,6 +513,8 @@ class ReconfigureRequestedLines(TestCase):
>      def test_reconfigure_with_default(self):
>          info =3D self.chip.get_line_info(2)
>          self.assertEqual(info.direction, Direction.OUTPUT)
> +        self.assertTrue(info.active_low)
> +        self.assertEqual(info.drive, Drive.OPEN_DRAIN)
>          self.req.reconfigure_lines({
>              0: gpiod.LineSettings(direction=3DDirection.INPUT),
>              2: None,
> @@ -520,10 +524,14 @@ class ReconfigureRequestedLines(TestCase):
>          self.assertEqual(info.direction, Direction.INPUT)
>          info =3D self.chip.get_line_info(2)
>          self.assertEqual(info.direction, Direction.OUTPUT)
> +        self.assertTrue(info.active_low)
> +        self.assertEqual(info.drive, Drive.OPEN_DRAIN)
>
>      def test_reconfigure_missing_offsets(self):
>          info =3D self.chip.get_line_info(2)
>          self.assertEqual(info.direction, Direction.OUTPUT)
> +        self.assertTrue(info.active_low)
> +        self.assertEqual(info.drive, Drive.OPEN_DRAIN)
>          self.req.reconfigure_lines(
>                  {(6, 0): gpiod.LineSettings(direction=3DDirection.INPUT)=
}
>              )
> @@ -531,6 +539,8 @@ class ReconfigureRequestedLines(TestCase):
>          self.assertEqual(info.direction, Direction.INPUT)
>          info =3D self.chip.get_line_info(2)
>          self.assertEqual(info.direction, Direction.OUTPUT)
> +        self.assertTrue(info.active_low)
> +        self.assertEqual(info.drive, Drive.OPEN_DRAIN)
>
>      def test_reconfigure_extra_offsets(self):
>          info =3D self.chip.get_line_info(2)
> --
> 2.39.2
>

