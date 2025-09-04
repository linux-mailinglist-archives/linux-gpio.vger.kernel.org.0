Return-Path: <linux-gpio+bounces-25563-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7D7B43215
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 08:13:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDA364822B3
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 06:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A85E6222562;
	Thu,  4 Sep 2025 06:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="A3mCLcqX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8941A23A9
	for <linux-gpio@vger.kernel.org>; Thu,  4 Sep 2025 06:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756966426; cv=none; b=TeuCGT25I7HhD4ciE9GTUIT+48vprSZ0XBHke9xY4XThhcVcuT2StdLCRoJo9yA6k1scMQ9rmAkNqJ/sxaUow/MN8xXnhTFb/1hHig43FK2LHarL6Rn0NoqWf/1SPDKtzvxQY1Um0ws+FhPW9Fvnf9D5BS9tTDp78xvCXh2WuGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756966426; c=relaxed/simple;
	bh=U+3Gn4Enwv7YKOTmIaHJtKcyckvyzsG0vUmk5y5tOwg=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=kdNx6SDnXIJhjx4IovgABFrEDVhY48pqxjLdlMkPrq3v3Pj2zgmDyNynzw63zd0stjBUqEnBkBXKldHppm5gMFSuvVpCvGYltr1UNw0t5KqvN85ZEk9W7ZLhyO96wnG40SkMLVxWv0i/jLhvMgVO43uH+A9SYmV/z4hgVK98oyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=A3mCLcqX; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-24cbd9d9f09so8949265ad.2
        for <linux-gpio@vger.kernel.org>; Wed, 03 Sep 2025 23:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1756966424; x=1757571224; darn=vger.kernel.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M9x520C4KcpeQNTPlITzJrq1YQYy1LuAcRbqhLB8Dwg=;
        b=A3mCLcqX8nYvM7NzcfFTk1MKyFLqUindpzyPu9BOTVwuIlxxjgwE4jUeS40fyYohI0
         DYK8pnKVbkfWh6rzKAz9Ybr8LzCdMxjw+C+iouPSL+qp/hugxShAQIr6vTbmP7HwxzUJ
         zR/buJglYuQKPdLz7T5K8HSn0wL/9TrTJdPgv2Ib1PINO8CqECLGSP/sSoJq8PxcdhL3
         ztlVKDI1GToOtBbweZRpwz8fXQhg7v20NwNW3Qwmg+FAtPbHXRJkUvYc/GnVFpSOCdKI
         AlgEnJyaavaxKm7y3kDvgFSx+LF6NY2Q1jIgtfay2G5a+j3u6CwAoDiGV8dqVSbZZfl/
         mK/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756966424; x=1757571224;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M9x520C4KcpeQNTPlITzJrq1YQYy1LuAcRbqhLB8Dwg=;
        b=VyolKIwLmmCtlPiDv5gQMCjMbyseBjgyAetiip2Omtv4ugxZM3OcvoIVTrk0MknjNX
         F2mPsdsDAZ3ZeGkTxYcZ7ln39brJSWH1yvtctoYqNnAGAbMsQnLtnaBptcUFK6MXn5e0
         xJGIT4qiA9e/RcVbCo7HrPzrDMUywkvn8M8VlkUtvR/HE0t+zw5k6mo4pKqdyDX77pvA
         ZO+jkMRX1/ZHTiLlJrporBeuwbo7sZ1u8iwVTErH13PBo6s5STx9LCk5UWWi+ySFuyen
         S2Jdp98WzS3lFpmsLHxt9klfi+ZnqY57r31DTHzxBt9t+GrNoNOR7F6U/9Zvvu3I0v+a
         QCHQ==
X-Gm-Message-State: AOJu0YwQZy9wHNbfTjvnY44e4SDBaEbbb9+7JCkhQukDZMOxqKrXpYS4
	c7VEG+oAREi4dDq+KMBlu+lyskOQBuz7LstJtR4/0BQRRxbgqYPBr2lMbYI2ufhTloU=
X-Gm-Gg: ASbGncvXdl8TKYeswQjV9tLkhlzH5oOkHX9cG+m+B9OPswJ1sEKb2XnGht34BqNsu6/
	xZ3bsQ5mJ1M8w7iiIE1xSkv6DeYK27SHQ3zrF8aTFudfdyc+aMQv6rXbYnLiLz3f27Lm1EahTf7
	eqXCdIDkN0fkWzCVfc0NpLNT841gS2vc9zIOFMFgmnW7vm4renSk99frWUE8IWn5fW6QI4vnsLy
	IQpfQjuTAc4mGJ7JCF28jNLAaNnqpW0icOla+jZpfRhPRp9Kd/rbApE1VhVec33BAmnMVFh34d4
	Sztknyv6zHAP6TEO3IuYIR91xEUU0VOoIDz4iuHmgswJ/F9+l688u5KSmm0ID4fcqoSUR8fc3Yk
	G2J0nLFbq
X-Google-Smtp-Source: AGHT+IFYEZLkbm7gUY0dcC5+zLBJnft5ulXCuG9BnOFXd57oICs/T/3ZkZvxXGR8+QmFlI5UrbPa3w==
X-Received: by 2002:a17:903:41d0:b0:246:d70e:ea82 with SMTP id d9443c01a7336-2494486f946mr254901215ad.5.1756966423720;
        Wed, 03 Sep 2025 23:13:43 -0700 (PDT)
Received: from localhost ([2001:9e8:d5a3:d00::35e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2490375b6d0sm178977165ad.62.2025.09.03.23.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 23:13:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Sep 2025 08:13:36 +0200
Message-Id: <DCJSM4YMJPS8.PKMGUC3X61TM@riscstar.com>
From: "Erik Schilling" <erik@riscstar.com>
Subject: Re: [PATCH libgpiod 0/7] build: detach the libgpiod API version
 from the libgpiod package version
Cc: <linux-gpio@vger.kernel.org>, "Bartosz Golaszewski"
 <bartosz.golaszewski@linaro.org>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Kent Gibson" <warthog618@gmail.com>, "Vincent
 Fazio" <vfazio@xes-inc.com>, "Viresh Kumar" <viresh.kumar@linaro.org>
X-Mailer: aerc 0.20.1
References: <20250903-api-version-detach-v1-0-027ca5928518@linaro.org>
In-Reply-To: <20250903-api-version-detach-v1-0-027ca5928518@linaro.org>

On Wed Sep 3, 2025 at 3:01 PM CEST, Bartosz Golaszewski wrote:
> The versioning of libgpiod has become quite messy due to the rapid
> evolution of the project in its initial stages (which forced an ABI
> version change without bumping the API) and later extension with several
> bindings and tools kept in the same repository.
>
> Currently the library API version and the package version are the same
> but we're at a stage where the core C API will most likely remain quite
> stable but we're still extending other features of the project, like
> the DBus API, tools and possibly other bindings. Bumping the C API
> version because we added new features to included programs makes no
> sense so this series proposes to detach the core C API version from the
> libgpiod package version (except for the major version updates but I
> don't expect there to be one anytime soon).
>
> The core C API will also apply to C++ and GLib bindings as they track
> the C API closely. Rust and Python bindings already have their own API
> versions.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Bartosz Golaszewski (7):
>       bindings: cxx: move misc.hpp inclusion to the correct place
>       build: define a separate API version for the core C library
>       core: change the behavior of gpiod_api_version()
>       tests: update library API version string tests
>       tools: display C API *and* libgpiod package version for '-v'
>       dbus: manager: display C API *and* libgpiod package version for '-v=
'
>       dbus: gpiocli: display the libgpiod package version for --version
>
>  bindings/cxx/gpiod.hpp                 | 1 +
>  bindings/cxx/gpiodcxx/line-request.hpp | 2 --
>  bindings/cxx/tests/tests-misc.cpp      | 2 +-
>  bindings/glib/tests/tests-misc.c       | 2 +-
>  bindings/python/tests/tests_module.py  | 2 +-
>  configure.ac                           | 4 ++++
>  dbus/client/gpiocli.c                  | 2 +-
>  dbus/manager/gpio-manager.c            | 5 +++--
>  lib/misc.c                             | 2 +-
>  tests/tests-misc.c                     | 2 +-
>  tools/tools-common.c                   | 3 ++-
>  11 files changed, 16 insertions(+), 11 deletions(-)
> ---
> base-commit: d0006cc3d57b0e8fe090a1596934340c34e69ab4
> change-id: 20250901-api-version-detach-67d8e984d529
>
> Best regards,
> --=20
> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Looks reasonable to me!

Acked-by: Erik Wierich <erik@riscstar.com>

