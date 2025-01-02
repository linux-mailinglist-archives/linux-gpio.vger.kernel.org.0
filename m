Return-Path: <linux-gpio+bounces-14414-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E39C9FFC9B
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 18:09:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5474F3A2655
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 17:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8488A1714A1;
	Thu,  2 Jan 2025 17:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IGo/jLtU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60320155398
	for <linux-gpio@vger.kernel.org>; Thu,  2 Jan 2025 17:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735837738; cv=none; b=K/2VtwQebhtO/7KNLCvgg1NN2t1IjfIPb/1fLhhwag2jwShQ27ql4PHx97gt0+TbRBni21/pfj4T3VFheAJjywzww/MBkLOdCRfKxHzeBM6asQCCxPAKQHVM0ySvcw7+jLwBrgOmgR/wgfkzdMliI/1IYwqwGhMd55X++rvgn8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735837738; c=relaxed/simple;
	bh=+y5Qc+QXv7zgXZUMBU94HWxeMoxlUPT0oDvG4yRqs34=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=bHoeJINme0FDvnvL26Aj0/yxwNSMa1VjK/JypELtftCFvGvzfgfku1eWq3ABmD/jjI0f6iH4v17H0G2DWS+etT0pxKwEokU3KDyO71nUfYNTdBAdyLs+2fvWCGnGsvjWH0reK0YAX6w0AFXU2VW0gPbJBXL5ScP4gIDzEvcz5TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IGo/jLtU; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aaee0b309adso1238137366b.3
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jan 2025 09:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735837735; x=1736442535; darn=vger.kernel.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3MmTSLB1GLUjxn+FytU8mYbpXiYXxZJahOFpLuXkQM=;
        b=IGo/jLtUkRVo8Aej7BSpT99SD0CqtyHUNKnlUWai4LWXYahxDUehOKGUqX5Wa6c9Bh
         /ZZSPHZ6HdH+h0zqQHrdzz9M24KoYQQ9uGAIaKcpNKGzB26+GLgHP0ec6orleGY3cm4T
         qjo4WfvvEfCwPo0VADubMXC2yeSmf8T6Xdqs+RDWJw69tzEae1eE9rmSYkzWHx0w/4Um
         9zXSGRTT6X9ZwXsW1Dv/lNlFnDsP4yOaEv3YfQRlsDsOQv/re4OgR5vzixyTQMx63W0O
         jgyf0mESeILmdXXU0xAIkZ0GdRnmvwg9KVLDoeV0ZRrQwdcsshfe0s83zPaaLne/sW57
         8qEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735837735; x=1736442535;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t3MmTSLB1GLUjxn+FytU8mYbpXiYXxZJahOFpLuXkQM=;
        b=MHHQbjAMvUDdTA7vnEzTncPAyfFq3Ia5/hfjmRo9ovVDn498W4aywSfeu7DS+RtZ3r
         QcweLW2CLhxi5ZwbO6IqsgFdS4fcKvkBDBqhHbKi93VNDXfCOPF6uqCrPNshZN5ERlyN
         hSv4aS9dyAqXa1qYoh1LREm5+RAaPJ8afhUrhykOLX6lgaSvDdkPJHV8z9PQon9hgf1H
         IE0d9qKqFfV3bl1j6pawv7acM3jXoIhWcQP7ShRVQjfS4yzXuNkXX0vcTmtb+4c4AvIu
         LOlqmCWaQWflQdW81RywoAEBU7sehc0AgVzKap4kYj+sMXaNpkJR2spP/5k54yuJ4Iex
         fYTA==
X-Forwarded-Encrypted: i=1; AJvYcCVz9s/XJpokmFr7CL9z1B1H9SVyIQHiOUfBdG52oy4ojwy/fpW77KE2YsY+mCz1MqhFOgvNo/5enT3r@vger.kernel.org
X-Gm-Message-State: AOJu0YyOsXdYIRlioYGyZYk3ZlRt3kIHhzFgmXnT4YfCFYaNR4jYPqrA
	kEpFvBgH+NaAMWCT52OFRYVkhW7cfYz1PqqqLoKpdjz76+QnAn+s6nEv1x7rO3I=
X-Gm-Gg: ASbGncvJ/xrnBrGcKby2x3NVllkxbUNgrZ8UU1FAEnCKEsN8wVU1bj8vzo6k+pvOE8w
	X89m9I6tVfGVUo9FvGnmqqIBCI2jf2mwKaGIyjuCU07iBCUSE9Aiwhuc0OZJBBjEJbsZ4dp5UXM
	YEJNFfTNVqC2lN5avdWQuPEF0nvKoiD/eZfRBtznPhBj1IWC4DN1wqXt6cgXG02yqRs219+zp8s
	priy8Z4g5wI1bO5MJqvcmuQFWHKE1PUSrHhOe+Z49Y=
X-Google-Smtp-Source: AGHT+IGalCo0RjrtWUZhSEBvUVdgwvZnAZU9mHrUPXJXon3dRVa1ZUTtcJRF0xOPppg6ZGet8iO+Dg==
X-Received: by 2002:a17:907:7288:b0:aa6:a9fe:46dd with SMTP id a640c23a62f3a-aac346507b2mr3276921566b.38.1735837734609;
        Thu, 02 Jan 2025 09:08:54 -0800 (PST)
Received: from localhost ([2001:9e8:d59a:5d00::f39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e895d31sm1809052366b.61.2025.01.02.09.08.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 09:08:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Jan 2025 18:08:53 +0100
Message-Id: <D6RR4E5JUME3.21P9OBSIQH21V@linaro.org>
Cc: "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>,
 <linux-gpio@vger.kernel.org>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>, "Vincent Fazio"
 <vfazio@xes-inc.com>, "Kent Gibson" <warthog618@gmail.com>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Phil Howard" <phil@gadgetoid.com>, "Viresh
 Kumar" <viresh.kumar@linaro.org>
From: "Erik Schilling" <erik.schilling@linaro.org>
Subject: Re: [PATCH libgpiod 5/5] doc: use sphinx in conjunction with
 doxygen
X-Mailer: aerc 0.18.2
References: <20241220-improve-docs-v1-0-799b86991dec@linaro.org>
 <20241220-improve-docs-v1-5-799b86991dec@linaro.org>
In-Reply-To: <20241220-improve-docs-v1-5-799b86991dec@linaro.org>

On Fri Dec 20, 2024 at 5:46 PM CET, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Integrate the API documentation generated with doxygen for the core C
> API and C++ bindings into sphinx using breathe. Integrate python docs
> with sphinx using autodoc and the import mock feature which allows us to
> avoid having to build the C extension.
>
> Update configure.ac to check for sphinx-build in addition to doxygen and
> make the main Makefile trigger a sphinx build on `make doc` (although
> the docs can also be generated without starting the build system by
> running: `sphinx-build ./doc/ doc/sphinx-output`).
>
> Create a tree of .rst documents with branches for libgpiod, libgpiodcxx
> and python APIs.
>
> Move the introduction text from the main header into the relevant .rst
> file.
>
> Remove obsolete Doxyfile.in and create a static Doxygen under doc/ where
> all the documentation now lives.
>
> Update .gitignore where needed.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  .gitignore                    |   2 -
>  Doxyfile.in                   | 105 ------------------------------------=
------
>  Makefile.am                   |  54 ++++++++++++++++++++--
>  README                        |  12 ++---
>  configure.ac                  |   8 +++-
>  doc/.gitignore                |   5 ++
>  doc/Doxyfile                  |  12 +++++
>  doc/conf.py                   |  63 +++++++++++++++++++++++++
>  doc/core_api.rst              |  58 +++++++++++++++++++++++
>  doc/core_chip_info.rst        |  11 +++++
>  doc/core_chips.rst            |  11 +++++
>  doc/core_edge_event.rst       |  11 +++++
>  doc/core_line_config.rst      |  11 +++++
>  doc/core_line_defs.rst        |  11 +++++
>  doc/core_line_info.rst        |  11 +++++
>  doc/core_line_request.rst     |  11 +++++
>  doc/core_line_settings.rst    |  11 +++++
>  doc/core_line_watch.rst       |  11 +++++
>  doc/core_misc.rst             |  11 +++++
>  doc/core_request_config.rst   |  11 +++++
>  doc/cpp_api.rst               |  33 +++++++++++++
>  doc/cpp_chip.rst              |  12 +++++
>  doc/cpp_chip_info.rst         |  12 +++++
>  doc/cpp_edge_event.rst        |  12 +++++
>  doc/cpp_edge_event_buffer.rst |  12 +++++
>  doc/cpp_exceptions.rst        |  18 ++++++++
>  doc/cpp_info_event.rst        |  12 +++++
>  doc/cpp_line.rst              |  24 ++++++++++
>  doc/cpp_line_config.rst       |  12 +++++
>  doc/cpp_line_info.rst         |  12 +++++
>  doc/cpp_line_request.rst      |  15 ++++++
>  doc/cpp_line_settings.rst     |  12 +++++
>  doc/cpp_misc.rst              |  16 +++++++
>  doc/cpp_request_config.rst    |  12 +++++
>  doc/index.rst                 |  28 +++++++++++
>  doc/python_api.rst            |  31 +++++++++++++
>  doc/python_chip.rst           |  12 +++++
>  doc/python_chip_info.rst      |  12 +++++
>  doc/python_edge_event.rst     |  12 +++++
>  doc/python_exceptions.rst     |  17 +++++++
>  doc/python_info_event.rst     |  12 +++++
>  doc/python_line.rst           |  27 +++++++++++
>  doc/python_line_info.rst      |  12 +++++
>  doc/python_line_request.rst   |  12 +++++
>  doc/python_line_settings.rst  |  12 +++++
>  doc/python_misc.rst           |  13 ++++++
>  include/gpiod.h               |  36 ---------------
>  sphinx/conf.py                |  68 ---------------------------
>  sphinx/contents.rst           |  24 ----------
>  49 files changed, 733 insertions(+), 249 deletions(-)

Tested-by: Erik Schilling <erik.schilling@linaro.org>

> diff --git a/README b/README
> index 80ad939..8d8fe79 100644
> --- a/README
> +++ b/README
> @@ -333,14 +333,12 @@ bindings use the standard tests module layout and t=
he #[test] attribute.
>  DOCUMENTATION
>  -------------
> =20
> -All API symbols exposed by the core C API and C++ bindings are documente=
d with
> -doxygen markup blocks. Doxygen documentation can be generated by executi=
ng
> -'make doc' given that the doxygen executable is available in the system.
> +The project uses sphinx to automatically generate the documentation. The=
 system
> +needs to provide doxygen and sphinx-build programs. With those in place,=
 the
> +build can be invoked with 'make doc'. This generates documentation for t=
he core
> +C API as well as C++ and python bindings.

I also lacked the `breathe` package. Maybe worth mentioning here?

- Erik

