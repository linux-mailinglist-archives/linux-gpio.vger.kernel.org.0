Return-Path: <linux-gpio+bounces-11059-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E05CB99503D
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 15:35:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C2DD280F96
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 13:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 976CA1DF72C;
	Tue,  8 Oct 2024 13:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EQ9Pw0eX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6891DF265
	for <linux-gpio@vger.kernel.org>; Tue,  8 Oct 2024 13:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728394499; cv=none; b=rg28Ksv8IJpAOzAx0omVveAiDEyp8/ipUp7uIY9PQQOx2wHTraiPq1zCWEp2pMZm5yh1oL8FK4iVjSP00V6LO/YNUv2fqzSm2YJYljOqrx3R/Zd79F9++baqnnOZHmOVzYfzUAgicBzF/XhOh/bl5ACKDxxVtwuWFjiKqnS9hcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728394499; c=relaxed/simple;
	bh=LlI/3VAcQZ+3AbBVYtjFI2Ko/b6xWXvd2+7Wh7mjloc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FkRWibQKzGsaXipg+9heNL4phLxyWpJtqni+r4TigbOmh9zJHOw66RNymYB4cD/GEtv3QHrjdtmCNy2u9lX8wGpMH1j7qa7xV/jbIjYKJEWUx73EcyBtXDeKzolXviFbyGJL7U1GtwSXYEkPSPlsqFcJp7HshiGvJk4ZQrQv2g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=EQ9Pw0eX; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5398fb1a871so5564865e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Oct 2024 06:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728394496; x=1728999296; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EM+l54a/PSal4U9AlNEjYrogrXcX4YWaJenfmbnGr0A=;
        b=EQ9Pw0eXbD7IMcmaloWzNl78ToYZcVhnfltp17TmePQeApSPPLBijlnqNvw6iP3uDb
         vNbUjJ1iSCtQU6n51IfyZn7t/m5mTpi9mpJhdW5PdAT7kzWycu40sOVCDuMhQ8oZyzGQ
         xaQXzJjN1NBiKgHatC9QkbejNg0BR292F6rw++svWGTkQdTMlZHPnoKhRwS8OoIj2Vae
         iRxDv5vHHgd8V6VMI87cXJQ100awdq9EKFqmCwK3QDid91ROcjZgVEKaPuPwndoZssWX
         eqmGnjm2Oq6HNR1oz52Bw52bA4FL7ool+SZIHJIxp2dpQPL26ZSmPJB30g1f8Ky/fINN
         CDRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728394496; x=1728999296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EM+l54a/PSal4U9AlNEjYrogrXcX4YWaJenfmbnGr0A=;
        b=ekEn7ZaTwZtddbpIIpsIMCECHpRUXmKdK+ESOyNLNkZds2m+HVNyl4HVZDgVfkWLBz
         O1yzsRp9kttjABM4WsEJhs0jm1o/K4rh0EIRrZvnVeK4f8lFWI4Oq85VA7wjd7CpWrPV
         /LsCwyEI58wg6NODFsdRJ4DL3O671C3lOsLgGh1HYhsyIIWeVNKtsPKE3B/r7tCisWkH
         Gtb3R6jLTWbKUU0evD0w5i1ReHY1n0OPUYmkcfmTmqRxePcnYO3S9Uiz6/QZBNGqtaxW
         S3rzJ7GOk4WCzlcg1KvZGovm2mDgRFnfpmDKL9B5xqqcPgC1Qzz4CFB9dKU1s+a6yq4P
         tHFg==
X-Gm-Message-State: AOJu0YzqDKfPJtA9X0SYlWJrRwJ77y2Mdn5ttJoiqj25O10bnVWskdwn
	EsIxT2IUCJqVssGpvt5OG4S5iGpOlX+7QBU2h2/suASJHTexuwSNWiOrA/JSOz7/boW41Xge6pW
	VVweiQkvhBwa4iCIY9jfoxClA2/d2r1Go9OLCdQ==
X-Google-Smtp-Source: AGHT+IGJcbJXxTBFxRNkinfwcRcZhFFkM+0uPfxor2/JnwNgmaVZOfa1oJO9Ey4k88tgAoTgMcDCZ7Sn0+6dNFHtBJE=
X-Received: by 2002:a05:6512:1091:b0:536:548a:ff89 with SMTP id
 2adb3069b0e04-539ab8ae3eamr7890280e87.39.1728394496044; Tue, 08 Oct 2024
 06:34:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240927-vfazio-mypy-v1-0-91a7c2e20884@xes-inc.com> <20240927-vfazio-mypy-v1-20-91a7c2e20884@xes-inc.com>
In-Reply-To: <20240927-vfazio-mypy-v1-20-91a7c2e20884@xes-inc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Oct 2024 15:34:44 +0200
Message-ID: <CAMRc=Mdu+5k1TSUc3OPZoh20EeL13RoLRznen5dKK0wnRxaKjw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 20/22] bindings: python: tests: annotate
 internal members
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, vfazio@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 8:57=E2=80=AFPM Vincent Fazio <vfazio@xes-inc.com> =
wrote:
>
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> ---
>  bindings/python/tests/tests_chip.py       | 10 +++++++---
>  bindings/python/tests/tests_chip_info.py  | 13 ++++++++++---
>  bindings/python/tests/tests_edge_event.py | 11 +++++++++--
>  bindings/python/tests/tests_info_event.py | 30 +++++++++++++++++++++++++=
-----
>  bindings/python/tests/tests_line_info.py  | 13 +++++++++++--
>  5 files changed, 62 insertions(+), 15 deletions(-)
>
> diff --git a/bindings/python/tests/tests_chip.py b/bindings/python/tests/=
tests_chip.py
> index 89d5df4341eceefbc0eed9b880ac641caa682af5..b719f6ba402c962b3ba8029ce=
f61ed28fd1a525a 100644
> --- a/bindings/python/tests/tests_chip.py
> +++ b/bindings/python/tests/tests_chip.py
> @@ -3,6 +3,7 @@
>
>  import errno
>  import os
> +from typing import Optional
>  from unittest import TestCase
>
>  import gpiod
> @@ -70,7 +71,7 @@ class ChipBooleanConversion(TestCase):
>
>  class ChipProperties(TestCase):
>      def setUp(self) -> None:
> -        self.sim =3D gpiosim.Chip()
> +        self.sim: Optional[gpiosim.Chip] =3D gpiosim.Chip()
>          self.chip =3D gpiod.Chip(self.sim.dev_path)
>
>      def tearDown(self) -> None:
> @@ -78,6 +79,7 @@ class ChipProperties(TestCase):
>          self.sim =3D None
>
>      def test_get_chip_path(self) -> None:
> +        assert self.sim

Please say in the commit message why this is needed because I don't
understand this line and others below.

Bart

