Return-Path: <linux-gpio+bounces-23675-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1DFB0EDC6
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 10:56:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 060C0188708C
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 08:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D827A28000C;
	Wed, 23 Jul 2025 08:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="vsd3U9TC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4866F26B09F
	for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 08:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753260985; cv=none; b=HJ2EcRM0ueBWJ2cj96bcYbL26P9GKbhTv/ccrgBYUNhsIqm8/Z6AtPWQpw0deDFpSHuOadgDWKnRglsTvqBVRiahFsFH7Y8q2fD54K+1QtBlg/NxjMhsX4H+I4ZLPsbqvaZmCl5euAlf4ZV99QitvFgPn3j8ifthmhGl/zJSB4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753260985; c=relaxed/simple;
	bh=pKfFZp2aAMklQ5SX9OmDUFvlYgua0YhIOqQ1WL41ngo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=QB+Uf4qYaKRAocJTt+T0yIdAkQUeBPqWH0lYsAmSrK1XQ2OveOXb9i8j6g1jC5YEBEhY7ys1pryUQy+Imj7CG4uPcP2PEhA2FpQ+Y9AM1UqGtyAhQPByhwXqDUA7JlwDobXKijYVMqNdopV6xt2N5UuxrDDa4P5RtoAQwcSrm7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=vsd3U9TC; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45610582d07so49798215e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 01:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753260981; x=1753865781; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6rGaBNJulF9f5vmJOMw68zRS3mhNqVlOhwgfSeWX1Xc=;
        b=vsd3U9TCdUNq2Jhj5O6NmCpjnD38iyDOteE3uDuJM21ZeBltI0DnoXvGYz8jh2it8X
         +JCklLVDKJ09zMmB6G8T9Wfh5EXmVn6tqPXj8kgKcEtb2ArV/t+a5uHF2P2z6WlwqQqc
         ERUY6D6XkLVhRe04gdf6h08ewk+vFIrI5+zY0yFerwCsNPl7eYY9fOM/uCrAUWfKHfAH
         Y3XqmEed3w3N4W2bVOAZhQBOuCuudUQfhRNuQu8fITkGFaoVtuSjHzunxCVVhud0lIon
         OqCYl59DkiZDPQHibRYAh2LA0U6P09UayYVzHWCBVTyPNXYGaTve6GUXphYyBchIdiyv
         5ORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753260981; x=1753865781;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6rGaBNJulF9f5vmJOMw68zRS3mhNqVlOhwgfSeWX1Xc=;
        b=lE4RMK9tT7z+fQGChjWxjiJP1ADwxM7Vpc3UNp4/KXr2FFhvZsAJZdAU2zckS7t+Iy
         z5POdpbbvdWcAHSLIfnxMu/B+vk9L4qAXl/UPYkYeNop8Ydxh60MacHCjeRBPn52dpwl
         si+ZZmyeadrVn7R/xKe3N1thySE5sA63WebEkVFvPkjRsrcHqHZQSGIzkkKYf5S9wPmE
         P+dh+VFhUEQTAofCMqJkEdv7Qzm/AwWNgWvRdmpI5JI70ArZw7EYdzwTMIQGrbcG6QLP
         u/FQh3hJp14lCvtJFkhpHXj3AQ2j3Si0Jt6t5JGToJ6CKlSQ5i/dwgoDl/P6LVUr3prw
         TFhg==
X-Gm-Message-State: AOJu0Yy1buPJbZilMUIjVxxj/dMA4W0I61Hk9J3HgKMYLUVOrwZtVHKJ
	9r1p8y6ECFdl10uuPiwUprrlrBAAjabsB0ehvl3zMnF5zVgAOppUzwOWWOvvysBSIsI=
X-Gm-Gg: ASbGncum3GbjSmLYmn5o7fS4Ug1fwC/AwE+nb9fwOSMZz7N/0u0oVGGlrword2PhFV3
	BDOFmYmZBQtc7aFA67yPcmNfueLtPJJzEXGH84tt6wpmfw6oSuyN165ImdLesJB//7oYGJLzP8r
	TLP263P5VpS6jwd4LBjEpWoY6U3CfRg709Nr9gypIM3bf+PIncEGynAkS8+p8L3WEhI/h9fRWk9
	hcGN6gVCD4POq2YVHAta59vfqhuaif5+ORVyVKxMYMSMKqK01rCYPF/MFPBXqXXi4RlBxkaEsIZ
	o03JWV894MDO/4sCDE9HY+xgaZYPJTVmxfo3rlZxrpz0lInmuFY3aGjveNCXJ2qXZeN+vGtH4w=
	=
X-Google-Smtp-Source: AGHT+IE/eqs8P6q7a2fvwhpzqDJVuqveKp751CNe8wZ1w89bI6q1NjgHl59a0tXiBUlCvCP9f0fz8A==
X-Received: by 2002:a05:600c:4e56:b0:442:dc75:5625 with SMTP id 5b1f17b1804b1-45868c7afbbmr16189555e9.5.1753260981239;
        Wed, 23 Jul 2025 01:56:21 -0700 (PDT)
Received: from localhost ([2001:9e8:d59e:4100::f39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4586919e44esm16492055e9.16.2025.07.23.01.56.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 01:56:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Jul 2025 10:56:20 +0200
Message-Id: <DBJB5B3JR92T.62Z38O3IM9JD@riscstar.com>
Subject: Re: [PATCH libgpiod 2/2] bindings: rust: unify imports in examples
Cc: <linux-gpio@vger.kernel.org>, "Bartosz Golaszewski"
 <bartosz.golaszewski@linaro.org>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>, "Viresh Kumar"
 <viresh.kumar@linaro.org>, "Linus Walleij" <linus.walleij@linaro.org>
From: "Erik Schilling" <erik@riscstar.com>
X-Mailer: aerc 0.20.1
References: <20250723-rust-examples-imports-v1-0-4c87e07a9b79@linaro.org>
 <20250723-rust-examples-imports-v1-2-4c87e07a9b79@linaro.org>
In-Reply-To: <20250723-rust-examples-imports-v1-2-4c87e07a9b79@linaro.org>

On Wed Jul 23, 2025 at 10:16 AM CEST, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Some example source files avoid imports at the top of the file in favor
> of overusing the namespaces in the code itself. The ones that do import
> modules either group the imports or have a separate "use" in each line.
> Let's unify the imports in example and use the brief approach of
> grouping the modules inside use statements.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  .../libgpiod/examples/buffered_event_lifetimes.rs  | 23 ++++++++++++----=
----
>  .../rust/libgpiod/examples/find_line_by_name.rs    |  6 ++++--
>  bindings/rust/libgpiod/examples/get_chip_info.rs   |  4 ++--
>  bindings/rust/libgpiod/examples/get_line_info.rs   |  6 +++---
>  bindings/rust/libgpiod/examples/get_line_value.rs  | 19 ++++++++++------
>  .../libgpiod/examples/get_multiple_line_values.rs  | 17 +++++++++------
>  .../examples/reconfigure_input_to_output.rs        | 25 +++++++++++++---=
------
>  .../rust/libgpiod/examples/toggle_line_value.rs    |  7 ++++--
>  .../examples/toggle_multiple_line_values.rs        |  7 ++++--
>  bindings/rust/libgpiod/examples/watch_line_info.rs |  6 +++---
>  .../rust/libgpiod/examples/watch_line_rising.rs    |  4 ++--
>  .../rust/libgpiod/examples/watch_line_value.rs     |  4 ++--
>  .../examples/watch_multiple_line_values.rs         |  4 ++--
>  13 files changed, 80 insertions(+), 52 deletions(-)
>
> diff --git a/bindings/rust/libgpiod/examples/buffered_event_lifetimes.rs =
b/bindings/rust/libgpiod/examples/buffered_event_lifetimes.rs
> index 8dbb4963b638ff9f8592f76ac85c6e106f3ddfa9..7589e1f4187d364f28477c0d4=
10b7e666608ac88 100644
> --- a/bindings/rust/libgpiod/examples/buffered_event_lifetimes.rs
> +++ b/bindings/rust/libgpiod/examples/buffered_event_lifetimes.rs
> @@ -5,26 +5,31 @@
>  // An example demonstrating that an edge event must be cloned to outlive
>  // subsequent writes to the containing event buffer.
> =20
> -use libgpiod::line;
> +use libgpiod::{
> +    chip::Chip,
> +    line::{Config as LineConfig, Edge, Settings},
> +    request::{Buffer, Config as ReqConfig, Event},

I wonder if this renaming at import time for the configs may be slightly
confusing... But not having particulary strong opinions here...


