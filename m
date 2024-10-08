Return-Path: <linux-gpio+bounces-11062-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D311C995049
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 15:38:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 064621C217EE
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 13:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E93181D3653;
	Tue,  8 Oct 2024 13:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="FdC9U4kF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD56E17C7C9
	for <linux-gpio@vger.kernel.org>; Tue,  8 Oct 2024 13:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728394680; cv=none; b=LxSVivai+Vw7kDRxjOfi4iHpwf4wAfpbbWZSS0vvl7nJ1VValtNQcZsYafcm2X5faYPRNRv2ozBeDmbQvzip1h8fAhnqaFu+P/o3vC7ghujKtfC9eVFhcnPnD6qr6dLOyu8+ytQ7T6ITxU+tAVXusU+knRfD9N0ye2Eu7EeAc5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728394680; c=relaxed/simple;
	bh=xD2xrCFV+4g3FvOYrF0v+VTbGFCz7lk/iimOU17O4yw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tPn+7ZckGnw6tV4/MUnrceswqjidqWTJLgnjeAc7JjiFuDHXfE9iPxYRjFpZuMiDiI9VhUdLBj3g8AFJgwSNCZlJtlzew6XyZMnX7jk0AlfxcKx93CrgkYCzWzrIjwvIQ/PgJI+cKfvbsWrwXcgqkqrvbk2xq6pbJ0Mrl8s+EWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=FdC9U4kF; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5398e7dda5fso5662383e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Oct 2024 06:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728394677; x=1728999477; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xD2xrCFV+4g3FvOYrF0v+VTbGFCz7lk/iimOU17O4yw=;
        b=FdC9U4kFAWoXQwgAW+LqdQlqMiVopDjDTZmEbLwgOOXTqh9KALK3ggMzxi1IelLx+K
         fGblX1zXP4X0JLF7HxQ/ux1zVO5tKaAY8kY1DIDWxHXlPgjYT5p5DwgWuMgitxHX2zAx
         huqx7lguFL/jgQGnMutVOtKF81WMdceyiW1/pdw/UYRscIROzvvp2QA/Y3jMFGl6fi8w
         pH9f9qA7fe26mlUCsbQqRZyz4d4aRXxSeM4KzqeH9FtQtLw3/eFWZVKbYvwbdfg3bjzE
         p6Ko2OivGX9Nois21TA87GEde7cLZS/mR4pwr2xzDYAL8wTRnyrQqNywLXPKGS+jMpTU
         Hoyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728394677; x=1728999477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xD2xrCFV+4g3FvOYrF0v+VTbGFCz7lk/iimOU17O4yw=;
        b=QI/y21neSrpD+xZMCvAbTVMr8I/Z0GHgo+uT/z29/vLPE99CWUCrLyfhYGBTVt6E+E
         +IZIvtkE2wzQQ5/sjniSNlhN+36mXTxizYC1sFTvgcOooBXJ4TEI/rUChmoAOPgvmlUC
         yxXgu0zCgimPHi8Dt/eRE8L4zqukabKE41H0gXiFIh0J/6j6g3GWexvS0NjAMQwyg9EN
         8jJYrElRFQUR1E1Ze9cSi9TqmS0Vy+XDDmE0Joppytyf3/04M1RwkWNNpm9oAq6TIcgH
         GB4deVirlqTgri6NKbMQ8yXl3Tl+SXi4eR3fxlmUcCbbLn/fqLwyFuXrlbDrpSzWNxho
         2Vhg==
X-Gm-Message-State: AOJu0YybbVtSJozGQEQq6750ZtvGQkF904qiEa9oZwk0CTXl+D4Bl4LI
	Z7cFLfI9uRn5pMG+jdzi0uJVLO9I/hVQO3rq5aL/jdSzJH0gUDEJcA6LEU1FF6MbeeGBqkiD41J
	A7m04nDF5aX+XzMgg2G65s3RUeIvHBEZGl6GiM1fpWHPVGuBb
X-Google-Smtp-Source: AGHT+IFmlxH+N52Gzs0Ix202yPBd7+yTtgsdH4t7sOVeGsU72ZX2nswvPPPxnIn738gHJvIrfFkfj07uUed2376c5u0=
X-Received: by 2002:a05:6512:33d0:b0:535:6cde:5c4d with SMTP id
 2adb3069b0e04-539ab85b38dmr8360340e87.3.1728394676868; Tue, 08 Oct 2024
 06:37:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240927-vfazio-mypy-v1-0-91a7c2e20884@xes-inc.com>
In-Reply-To: <20240927-vfazio-mypy-v1-0-91a7c2e20884@xes-inc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Oct 2024 15:37:45 +0200
Message-ID: <CAMRc=MczLrE7PfO6xnXcMzcXcK4kmYNxhYrJ1hY=jxiZJBpQJA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 00/22] bindings: python: conform to mypy and
 ruff linter recommendations
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, vfazio@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 9:05=E2=80=AFPM Vincent Fazio <vfazio@xes-inc.com> =
wrote:
>
> This patch series employs mypy [0] and ruff [1] to ensure the gpiod
> library has correctly typed public interfaces, is performing proper type
> checking internally, is consistently formatted in a standard code style
> that targets Python 3.9 syntax, and passes a subset of linting checks.
>
> Patches 1 and 2 remove unused imports, sort the remainder, and ensure
> the publicly usable classes are available from the gpiod base module.
>
> Patches 3 and 4 fix and add annotations to the gpiod bindings.
>
> Patches 5-13 fix type and lint errors internal to the bindings.
>
> Patch 14 fixes a duplicate test name identified by the linter.
>
> Patch 15 and 16 remove unused imports, sort the remainder, and fix lint
> errors related to a shadowed export.
>
> Patches 17 and 18 fix and add annotations to the test gpiod bindings.
>
> Patches 19-21 fix type and lint errors internal to the tests.
>
> Patch 22 adds mypy and ruff configuration to pyproject.toml and adds
> documentation to the readme so future patches can be evaluated against a
> standard set of rules.
>
> There should be no functional changes that impact existing code as part
> of this series.
>
> All unit tests continue to pass without changes and code coverage has
> not changed.
>
> After this series is applied, the public type annotations will reflect
> the argument expectations of the class methods so consumers can type
> check their code against the gpiod type annotations.
>
> [0]: https://mypy.readthedocs.io/en/stable/
> [1]: https://docs.astral.sh/ruff/
>
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> ---

Phew! Nice work!

My main concern is the lack of proper commit messages which makes some
of the changes confusing to me - an intermediate python developer.

I added some other requests, some commits will need splitting into two
but overall this looks nice and I'll be happy to pick it up.

Bart

