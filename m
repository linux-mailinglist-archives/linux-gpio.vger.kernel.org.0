Return-Path: <linux-gpio+bounces-11042-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBA8994E07
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 15:12:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 94702B24A48
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 13:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B3F61DF73C;
	Tue,  8 Oct 2024 13:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GSVtuxQP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAED91DF24B
	for <linux-gpio@vger.kernel.org>; Tue,  8 Oct 2024 13:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728392928; cv=none; b=WpXYT/2/HiK0bf5xAAGrTsp4i9hvxPppSATPnVU3XTiLRGkUsJm07S6bFZ7S4F9MMvoSBnym/K/7HWFA+L1UCM/3b9qke/wM1DmFum33dgVypvB0+mUEd6BTdIPjptHYdPIGgwFFDcCDaknJVUk/PmqHYrlecwME6kMOn/rzRbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728392928; c=relaxed/simple;
	bh=fPj0sPG/zxuBufy+ne53K8ep+EWVgSB8YTiJMTeLQDg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tlNJdYqVVcT4TkeNpV3pcMwgit7AlTQykxgY31NVUIuFpzhOILHXtrFssQgO8m1eFbZ6WIphCkwaP7noNcg28FmEPJf7LlCU1F3eDDxU/4eZFyWd8bj0xJ79pgpwhbUJiZE6+ie3PN/idFcAOWu+f6e3e1vBoMlN8unrgTnwMfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=GSVtuxQP; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fad6de2590so84176721fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Oct 2024 06:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728392924; x=1728997724; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNiAf8zD4Fmsc4mfvWkwgkO2zlxmqdZFbYDwGQaHBPc=;
        b=GSVtuxQPv7ysT0a6GFdBhH2Yka58DbfF7uIByfXtRWu5HzhXNDXiAMR2XJ8IjwQMIM
         5LSaAeLasOVQi6nX1x6EcaV9LCQ0hit/enVymiq6hgqt4DKb4gXhO6JgVMD6TuiqQHiw
         JBnmVHIyaNgLqsMM8i7rBwq7M3unDjn894QSvpV5UfXIgVJ+vjr6l53ouNW1ISoE2mlB
         uYCCtutrCVPipAM8FYuuwfVEhyPWbY/jvTFjlATu8TDpaW61ys+zvcEbg3tjTIrqQ0ff
         ewrei9HitxQKhqmGhBm5DWIDmyV9gGXbMWYCQBqanZlNUF8nPW0zfoOck5prlv248LfK
         YPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728392924; x=1728997724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rNiAf8zD4Fmsc4mfvWkwgkO2zlxmqdZFbYDwGQaHBPc=;
        b=KVVY6uxfcJDbHh/SDhtIfVIPuNolOGEsy+fZBRva5b+s5Uw6HM3fJho2HLpwvC7MSE
         ktTStWPc4XcnvrdzGeSh4HY9TfUNwghOLnhyr5krvsj1FnhFo/M7rPyheq2HacvEjLEk
         TUag5JpDzRGbWX3L0gtLpFl0xFqWzuRx1x1qmuT/J5d07gpuK8N/7WUmcxxoHBL8Dns0
         Zy0L0a/JXYi0aIhVm/T1UwVwgp5o20uENIkQwMcIgJyv2idwSK4H9YNOVi48T9cTjZMk
         BJdtFur9wF41Y8uKaOT3M5pLQy3VUHsVpBxMb9DAs332cy2lAQ+WacLRIMn63ieJCMej
         2MHQ==
X-Gm-Message-State: AOJu0YzELYdcxRkUi4v3TWWI5yuQ5xLv3QMJXBooLYA5mpT7vH8Qo+Qb
	XuCdEvQD/5n22QA+nHWBpzYCcXn9aZaP+Frn7uYGx7g9PmsOmFBH4HQVsxWbedCHiZ4T+vprFpg
	ZJ0Yn7TgwcJ4hY7ude4pRlHtjnfUEvgCDxeBbLRb8Ow5PupF7
X-Google-Smtp-Source: AGHT+IHauFCdnn3cnmNe3QkG5Y+f5o/W9nRRXRJp4dtle6w2Vwod1t1wb5FqfV2WBEg1fNz5IPF2xFI96ot79BCj6po=
X-Received: by 2002:a05:651c:1989:b0:2fa:d49d:45ae with SMTP id
 38308e7fff4ca-2faf3c0c2bcmr111220591fa.8.1728392923883; Tue, 08 Oct 2024
 06:08:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240927-vfazio-mypy-v1-0-91a7c2e20884@xes-inc.com> <20240927-vfazio-mypy-v1-5-91a7c2e20884@xes-inc.com>
In-Reply-To: <20240927-vfazio-mypy-v1-5-91a7c2e20884@xes-inc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Oct 2024 15:08:32 +0200
Message-ID: <CAMRc=McBrLXD0FSNe4dr3+1oSt7eqYPN4p_Wshn1D6V5KZPdhg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 05/22] bindings: python: add type stubs for _ext
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, vfazio@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 8:57=E2=80=AFPM Vincent Fazio <vfazio@xes-inc.com> =
wrote:
>

No empty commit messages please.

> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> ---
>  bindings/python/gpiod/_ext.pyi | 93 ++++++++++++++++++++++++++++++++++++=
++++++
>  bindings/python/setup.py       |  2 +-
>  2 files changed, 94 insertions(+), 1 deletion(-)
>
> diff --git a/bindings/python/gpiod/_ext.pyi b/bindings/python/gpiod/_ext.=
pyi
> new file mode 100644
> index 0000000000000000000000000000000000000000..1beb80dde9f080b729374b9dc=
69322c01fc37889
> --- /dev/null
> +++ b/bindings/python/gpiod/_ext.pyi
> @@ -0,0 +1,93 @@
> +# SPDX-License-Identifier: LGPL-2.1-or-later
> +# SPDX-FileCopyrightText: 2024 Vincent Fazio <vfazio@gmail.com>
> +
> +from typing import Optional
> +
> +from .chip_info import ChipInfo
> +from .edge_event import EdgeEvent
> +from .info_event import InfoEvent
> +from .line import Value
> +from .line_info import LineInfo
> +
> +class LineSettings:
> +    def __init__(
> +        self,
> +        direction: int,
> +        edge_detection: int,
> +        bias: int,
> +        drive: int,
> +        active_low: bool,
> +        debounce_period: int,
> +        event_clock: int,
> +        output_value: int,
> +    ) -> None: ...
> +
> +class LineConfig:
> +    def __init__(self) -> None: ...
> +    def add_line_settings(self, offsets: list[int], settings: LineSettin=
gs) -> None: ...
> +    def set_output_values(self, global_output_values: list[Value]) -> No=
ne: ...
> +
> +class Request:
> +    def release(self) -> None: ...
> +    def get_values(self, offsets: list[int], values: list[Value]) -> Non=
e: ...
> +    def set_values(self, values: dict[int, Value]) -> None: ...
> +    def reconfigure_lines(self, line_cfg: LineConfig) -> None: ...
> +    def read_edge_events(self, max_events: Optional[int]) -> list[EdgeEv=
ent]: ...
> +    @property
> +    def chip_name(self) -> str: ...
> +    @property
> +    def num_lines(self) -> int: ...
> +    @property
> +    def offsets(self) -> list[int]: ...
> +    @property
> +    def fd(self) -> int: ...
> +
> +class Chip:
> +    def __init__(self, path: str) -> None: ...
> +    def get_info(self) -> ChipInfo: ...
> +    def line_offset_from_id(self, id: str) -> int: ...
> +    def get_line_info(self, offset: int, watch: bool) -> LineInfo: ...
> +    def request_lines(
> +        self,
> +        line_cfg: LineConfig,
> +        consumer: Optional[str],
> +        event_buffer_size: Optional[int],
> +    ) -> Request: ...
> +    def read_info_event(self) -> InfoEvent: ...
> +    def close(self) -> None: ...
> +    def unwatch_line_info(self, line: int) -> None: ...
> +    @property
> +    def path(self) -> str: ...
> +    @property
> +    def fd(self) -> int: ...
> +
> +def is_gpiochip_device(path: str) -> bool: ...
> +
> +api_version: str
> +
> +# enum constants
> +BIAS_AS_IS: int
> +BIAS_DISABLED: int
> +BIAS_PULL_DOWN: int
> +BIAS_PULL_UP: int
> +BIAS_UNKNOWN: int
> +CLOCK_HTE: int
> +CLOCK_MONOTONIC: int
> +CLOCK_REALTIME: int
> +DIRECTION_AS_IS: int
> +DIRECTION_INPUT: int
> +DIRECTION_OUTPUT: int
> +DRIVE_OPEN_DRAIN: int
> +DRIVE_OPEN_SOURCE: int
> +DRIVE_PUSH_PULL: int
> +EDGE_BOTH: int
> +EDGE_EVENT_TYPE_FALLING: int
> +EDGE_EVENT_TYPE_RISING: int
> +EDGE_FALLING: int
> +EDGE_NONE: int
> +EDGE_RISING: int
> +INFO_EVENT_TYPE_LINE_CONFIG_CHANGED: int
> +INFO_EVENT_TYPE_LINE_RELEASED: int
> +INFO_EVENT_TYPE_LINE_REQUESTED: int
> +VALUE_ACTIVE: int
> +VALUE_INACTIVE: int
> diff --git a/bindings/python/setup.py b/bindings/python/setup.py
> index 1f04b9939b47dc7b960679b6f24e87a6f2a4e46f..54790dfd88e77762719fce3d9=
194499e8ff39d73 100644
> --- a/bindings/python/setup.py
> +++ b/bindings/python/setup.py
> @@ -224,7 +224,7 @@ setup(
>      name=3D"gpiod",
>      url=3D"https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git",
>      packages=3Dfind_packages(exclude=3D["tests", "tests.*"]),
> -    package_data=3D{"gpiod": ["py.typed"]},
> +    package_data=3D{"gpiod": ["py.typed", "_ext.pyi"]},
>      python_requires=3D">=3D3.9.0",
>      ext_modules=3D[gpiod_ext],
>      cmdclass=3D{"build_ext": build_ext, "sdist": sdist},
>
> --
> 2.34.1
>

I had no idea this was possible, thanks!

Looks good.

Bart

