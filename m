Return-Path: <linux-gpio+bounces-4496-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A384F8815DD
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Mar 2024 17:44:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43D19B22644
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Mar 2024 16:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 930DC664A7;
	Wed, 20 Mar 2024 16:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="uCkdiWW8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F90E664A6
	for <linux-gpio@vger.kernel.org>; Wed, 20 Mar 2024 16:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710953041; cv=none; b=EFewLr0fIrOZYErUuC8V6lbVe1e+5C+nhx1AdomB0o3jC0QtVfG4+OsMHIjSpigUpNzrjN4ijhtQBrrZJLfCdVmnJVjISxAv35Vczaesd0B82yGFWXTIaWKEmDD73aa7McRkIB4v1q0Uj9u2q3lvNavSd7C5HIx35ocjtKasGaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710953041; c=relaxed/simple;
	bh=nqeeb32WudGxDjIbz+7vegNGJCDKLn0KzpfROPjfDgM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cFFGsXbDymTTeASu3flOUb8CeYYi3NqEgKSVxWv52KL6dxFwgzGacxsqWShMa7NY5k6cSjAeCLVTCCL7yyDQY1Pwt/an98Qc54keKrAXXihUTGKy2Bv6IeZpgk3aCxYUvzxnWzSe4W8q8/nxI9ZwF74d01H4TdNMwq0ytvM3j9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=uCkdiWW8; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d4541bf57eso783691fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 20 Mar 2024 09:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1710953037; x=1711557837; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8kvOBKUSeIonvI4xu9kj+BAxlMyXDZGZXLZwaoXjqS8=;
        b=uCkdiWW8HX96YYFAHo8x62nA173GqZNo0TB4zFbA5IjjuiKzZRLYE/XvwDO9oIqQ7n
         yjVu5eLXJ8XpimbA4CzNOH9Zu6a9g6uLs/uo8v+BWK/qLk3vzVECmMEXscqLXsntDr/d
         yH34u/nAMCO84SO/zIjxWXjlcpJu9maedGZSNFQweNszZAXr4rqoJzqBm+JdcsxGqx7c
         k/dOtuENu1FV+55wCq4TBN4P1s3g7dC29WQGdNxMn5ig37odKJQWAawkjf2/S30anpl8
         u66MdjynGDLkyxuCvAhjc4+LtpbYWgm7/yi1lh1xL6l3wdFShR4nrV4RB0j+CEdMf84r
         b0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710953037; x=1711557837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8kvOBKUSeIonvI4xu9kj+BAxlMyXDZGZXLZwaoXjqS8=;
        b=jlewQ27NdWi0ys3OQjshFEGbDOjVk6tvvV2DvUu+THlxVYDAzPy6mp4vPuyRQyGER7
         pVY0LZgPkVArkRCaiXpB41j1hgd7gkxUdVBAtyfGxNJSH3tEq3ucMBxK/xJ64vlI3yPl
         jR4vK/qRKKCbUmMxosi1+TB6sFr6rrN3GKjsKEbJu3Y809v9qbFZaihzFf0zA7etXC8I
         cu+nC/OtxhnsWjG1KbDpUF9biIkxTqryaplyxQRrjWpRkhIU82w6zAvAM2hxfQgeYy6y
         KrTzG9nrG1eZOFehD+has80a0RnKMBD8yeBz+jhRCeECvbH+CSawof5OS+RnC4PxL5Qm
         pLyQ==
X-Gm-Message-State: AOJu0YzhUDHVSZwSrvUzpMA+WxFXSJnh79n6E8ev1G+IXJaQh5IKKcaz
	Yg+ACwOcLViDxE4b7m38HszQeFEpTGtb6W31THQw95T/Hl+k0u7v3nEOqrmntqo7ceETnNQYXLI
	iHf2lJneARUQW8CIKgZZlrvzdexNhwszJNZSW6LljPes3YVfp
X-Google-Smtp-Source: AGHT+IHolPHnUxgehExz/X59N0P6i9Je90fxWN3eipSeRL26D0pQl3UuuL9CqFI1UgnEJjc7SJWy5d5lToyhkgr5z04=
X-Received: by 2002:a2e:9f07:0:b0:2d4:76d6:e9c9 with SMTP id
 u7-20020a2e9f07000000b002d476d6e9c9mr10673622ljk.52.1710953037522; Wed, 20
 Mar 2024 09:43:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240320134957.7928-1-orbea@riseup.net>
In-Reply-To: <20240320134957.7928-1-orbea@riseup.net>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 20 Mar 2024 17:43:46 +0100
Message-ID: <CAMRc=Mc1JOf97jQKPL_k3u=NWJBf2aGGDPTw5kaem3t3SzSxig@mail.gmail.com>
Subject: Re: [PATCH] bindings: cxx: link using the libtool archives
To: orbea@riseup.net
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 20, 2024 at 2:50=E2=80=AFPM <orbea@riseup.net> wrote:
>
> From: orbea <orbea@riseup.net>
>
> When linking with internal dependencies that were built with libtool the
> most reliable method is to use the libtool archive (.la) files.
>
> When building with slibtool it fails when it doesn't find the -lgpiod
> linker flag, but if libgpiod is already installed to the system it will
> be built using the system version instead of the newly built libraries.
>
> Gentoo issue: https://bugs.gentoo.org/913899
>
> Signed-off-by: orbea <orbea@riseup.net>
> ---
>  bindings/cxx/Makefile.am          | 2 +-
>  bindings/cxx/examples/Makefile.am | 2 +-
>  bindings/cxx/tests/Makefile.am    | 6 +++---
>  3 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/bindings/cxx/Makefile.am b/bindings/cxx/Makefile.am
> index 1eafaa2..e2a89cf 100644
> --- a/bindings/cxx/Makefile.am
> +++ b/bindings/cxx/Makefile.am
> @@ -24,8 +24,8 @@ libgpiodcxx_la_CXXFLAGS =3D -Wall -Wextra -g -std=3Dgnu=
++17
>  libgpiodcxx_la_CXXFLAGS +=3D -fvisibility=3Dhidden -I$(top_srcdir)/inclu=
de/
>  libgpiodcxx_la_CXXFLAGS +=3D $(PROFILING_CFLAGS)
>  libgpiodcxx_la_LDFLAGS =3D -version-info $(subst .,:,$(ABI_CXX_VERSION))
> -libgpiodcxx_la_LDFLAGS +=3D -lgpiod -L$(top_builddir)/lib
>  libgpiodcxx_la_LDFLAGS +=3D $(PROFILING_LDFLAGS)
> +libgpiodcxx_la_LIBADD =3D $(top_builddir)/lib/libgpiod.la
>
>  include_HEADERS =3D gpiod.hpp
>
> diff --git a/bindings/cxx/examples/Makefile.am b/bindings/cxx/examples/Ma=
kefile.am
> index 64ced20..eca4d64 100644
> --- a/bindings/cxx/examples/Makefile.am
> +++ b/bindings/cxx/examples/Makefile.am
> @@ -3,7 +3,7 @@
>
>  AM_CXXFLAGS =3D -I$(top_srcdir)/bindings/cxx/ -I$(top_srcdir)/include
>  AM_CXXFLAGS +=3D -Wall -Wextra -g -std=3Dgnu++17
> -AM_LDFLAGS =3D -lgpiodcxx -L$(top_builddir)/bindings/cxx/
> +LDADD =3D $(top_builddir)/bindings/cxx/libgpiodcxx.la
>
>  noinst_PROGRAMS =3D \
>         async_watch_line_value \
> diff --git a/bindings/cxx/tests/Makefile.am b/bindings/cxx/tests/Makefile=
.am
> index 02b5b6d..4d40d33 100644
> --- a/bindings/cxx/tests/Makefile.am
> +++ b/bindings/cxx/tests/Makefile.am
> @@ -4,9 +4,9 @@
>  AM_CXXFLAGS =3D -I$(top_srcdir)/bindings/cxx/ -I$(top_srcdir)/include
>  AM_CXXFLAGS +=3D -I$(top_srcdir)/tests/gpiosim/
>  AM_CXXFLAGS +=3D -Wall -Wextra -g -std=3Dgnu++17 $(CATCH2_CFLAGS)
> -AM_LDFLAGS =3D -lgpiodcxx -L$(top_builddir)/bindings/cxx/
> -AM_LDFLAGS +=3D -lgpiosim -L$(top_builddir)/tests/gpiosim/
> -AM_LDFLAGS +=3D -pthread
> +AM_LDFLAGS =3D -pthread
> +LDADD =3D $(top_builddir)/bindings/cxx/libgpiodcxx.la
> +LDADD +=3D $(top_builddir)/tests/gpiosim/libgiosim.la

Please test your changes, this is a typo and it doesn't build. It
should have been "libgpiosim".

I fixed it up when applying.

Thanks,
Bartosz

>
>  noinst_PROGRAMS =3D gpiod-cxx-test
>
> --
> 2.43.2
>
>

