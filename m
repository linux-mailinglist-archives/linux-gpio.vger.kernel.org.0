Return-Path: <linux-gpio+bounces-11069-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05808995299
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 16:57:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC438283550
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 14:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92A601DF998;
	Tue,  8 Oct 2024 14:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PLJ46l7c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9EF165F08
	for <linux-gpio@vger.kernel.org>; Tue,  8 Oct 2024 14:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728399466; cv=none; b=BvCu5AlIjvoKzu6q3urLJe2yq2cpSOmFMdWu5UvXhARpaamuC8ow7UiA3f2GjVmJ1CCZlDWLiWgCWVXGNBV6FvcFiKNuDY6/FT1CyIUBna1bfS+9O58/2KG0BQDKY2jJ5xlYccvh2Iiwf6iZrCJtYrCAXtkugtVwi6YJl2sgFUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728399466; c=relaxed/simple;
	bh=2O6mlxbXjwqAxAkbPjSWOWi1d9MZpvRgzftBJL1K1gM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a3KGyafAJMtgmNLLCUoq2Nd/EbbTSiYAfIeLLpig3HHahGPiLCdmG2JKTmwwopkjMCEn+lMdmObZSK5sZ1xyqH5v+9lSBIgfkUrXex1BMCkPba94j1xIR2AN2BdbM5Qzk921w8xaMXfmHawiI9DjGNiY4Ynbw2kG99jIzDNOY24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PLJ46l7c; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-84f9aa39710so413790241.2
        for <linux-gpio@vger.kernel.org>; Tue, 08 Oct 2024 07:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728399464; x=1729004264; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nGzvNZMAA6+TgWvWO+5QBYAo4gQiBvkx2bDlTZSKpx8=;
        b=PLJ46l7cujvvtokvZ4jLD9DD9Lx0KLVujPjfs0qR1Wh+4Sjhaqoocoa9jPGPi8dLV0
         ilrdkVFcsJLtlVCz6BObvHaNw7t1TmOUz9PQhayHHqp4vUJZ1JsTI4E9Lom9IdYJr2ki
         wP2eqfxl3X2h0H4iE1K9HChxXQAp5RDA4X/MRrsJUmFn+Ld9K2YZg5OVrJ3fb68cQhAj
         F7NWbumpKxOVrq6XHWA/Ei6a1h3UX7Zra1KZaXJER2jxV76vpvwdYPmKC5omZPyl2SOC
         0AYsZMC6b2xlkWsogxR+d79T6wiqm21cfMeV+tytQVyaJL/vSHHy1pN6GUNYTZ77p60w
         XQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728399464; x=1729004264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nGzvNZMAA6+TgWvWO+5QBYAo4gQiBvkx2bDlTZSKpx8=;
        b=XTz33ox4lUba0ihpS1xeXxSqyN9/Nz1MOoJ4fAnSEXsNVBFoQIUrkIQQL5HUN+ksEX
         xz3EFrrgGL/fZae1eUmkJlQh0Py7OpA+chjFHutWK8+5Wiq9Nrc7aiI8cgRThZ5JQQ4E
         gHrDljEn5hFB33eIARibijja8TlLNhRAEL8HCdBP/1tA37Qs8DELFyam7FyFhUml0z0o
         TsJ/iEhRmkFYsdbRZ261rUYjUfBdnK9z9l3CgyGsWhE/PsFEqutR79PXdTXe85KYAoxh
         DVUz0Uo6TZJ1ytHG5OWpQhMmCf0XfzH76aDxtrDehViDGygShUeX8mIzhZQDV2wdVjtx
         UDhg==
X-Forwarded-Encrypted: i=1; AJvYcCWqnLDfqvH54Ir7wMJVzkbEei1dBus8RO0TL1306PdOEr9V7SxuWmVSBI5xAOruRbVu55CptQLyLReM@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv+KU9iucWUOZL9j5uGctbPbzOIlWUNtsExYm8zv6HeaiiIbg3
	2chxDTQEHBPnxk4NBiXuOR+FIZIlPLC2+MayoyZnpvhJspUUUoTRc9LTTkqu1A+D8p2WA65x5Py
	ZkySa/y4ohdAqBeSNVs7cS9WHBKk0E+p6
X-Google-Smtp-Source: AGHT+IFSK+kmbuQ/eU9Da3T9dbQ3P5zXnHz5/MmK10OjJbd17n+4odgMmU3tFccuKK1rsMbxmxL8cooe/TG+LRTXfe0=
X-Received: by 2002:a05:6102:c8d:b0:4a3:cab7:18c2 with SMTP id
 ada2fe7eead31-4a40578d76emr11708752137.15.1728399463642; Tue, 08 Oct 2024
 07:57:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240927-vfazio-mypy-v1-0-91a7c2e20884@xes-inc.com>
 <20240927-vfazio-mypy-v1-7-91a7c2e20884@xes-inc.com> <CAMRc=MenC69BPpkqkU_9H5_skdeFP1nHTKx5_rHCaG0U5-v0xg@mail.gmail.com>
In-Reply-To: <CAMRc=MenC69BPpkqkU_9H5_skdeFP1nHTKx5_rHCaG0U5-v0xg@mail.gmail.com>
From: Vincent Fazio <vfazio@gmail.com>
Date: Tue, 8 Oct 2024 09:57:32 -0500
Message-ID: <CAOrEah507_TM2JV29agMwGKmvKOTfpPvwO4rLEz7Gaq-NAPmsQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 07/22] bindings: python: fix Chip union-attr
 type errors
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Vincent Fazio <vfazio@xes-inc.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2024 at 8:16=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
>
> Ok, so I don't really understand what is happening here. We're going
> to re-assign _chip in every function? What happens to cast() if _chip
> IS None?

In this scenario, self._chip cannot be None. The self._check_closed() guard
ensures this, however, type checkers (at least mypy) cannot infer that from=
 the
current code pattern.

`cast` is informing the type checker that past this point, self._chip shoul=
d
not be considered as None and it's safe to reference attributes off the obj=
ect

This seemed like the cleanest alternative, though others are:

* use a local variable for the cast result. This may be less confusing but
  incurs more changed lines

    self._check_closed()
    chip =3D cast(_ext.Chip, self._chip)
    return chip.path

* use asserts. These aren't always enforced during runtime so we cannot rep=
lace
  _check_closed but it does inform the type checker that it can narrow the =
type.
  Using both is ok, just slightly redundant.

    self._check_closed()
    assert self._chip is not None
    return self._chip.path

* add a `if self._chip is None` check that duplicates _check_closed
(or replace it completely)

* other "creative" solutions like a wrapper that returns a Chip or
throws an exception if it's None.

    def _chip_or_exc(self) -> Chip:
        if self._chip is None:
            raise Exception
        return self._chip

    chip =3D self._chip_or_exc()
    return chip.path

>
> Bart

