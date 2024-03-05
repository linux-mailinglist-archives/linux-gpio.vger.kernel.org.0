Return-Path: <linux-gpio+bounces-4151-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5975887273A
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Mar 2024 20:02:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 141B428A5C2
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Mar 2024 19:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACFF624B29;
	Tue,  5 Mar 2024 19:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3Vx/ki12"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A431C1B81A
	for <linux-gpio@vger.kernel.org>; Tue,  5 Mar 2024 19:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709665344; cv=none; b=BfG1E5LycICtKm9QxR7jZRU49MCZFi5UjPZT/7nuHC2dhszoFojWcvaUgL6CWAXvGw8Amkayo0OhtTQiPdf0NCRYtwVE7drBi6F1mfuIDojd0OO57hPxPJqLLMloUtpDhh6viuvTSR+X3DALksCr9H97uNo74W++i8QCdWveuTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709665344; c=relaxed/simple;
	bh=K6FkNMPBXHerOI4xPkbioCN3A0D3+Ds7NwZGpoSSfe0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TZGkTGa5mx3mhpUk33bK6SsYB/lSgeMU2eQbVKFuqqbw5H8E8xjXIibXGDYpTVi6D8cQWePKedHVfzwmUag+ky4bTVyeQvGMJDM1r342QyjoNq+1Uc4YOfhCRsjLXzuVFM0AJkKJ1lrOVS27s6ChZ0x2a0DYnFTBEfoVmyXqNUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=3Vx/ki12; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3c19dd9ade5so3735436b6e.3
        for <linux-gpio@vger.kernel.org>; Tue, 05 Mar 2024 11:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1709665341; x=1710270141; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xBwFyKsVTwVp75+p2nwkinAD6Bz4XTPqba7sPzbW0JE=;
        b=3Vx/ki12OkG9eSjnqNnLIPf1HkuxdA4XBPXIjRZ9w58KHKzpNCzgY0JVed9PmQs4LI
         rZ9jlpK49HC9sqwvDjREV8J9VNn+GE0NBnJwCflbv/bNI2/Y9OFwYBuxnnShhpAhTSkx
         1zTiNizcpawsWPFQywsIh2ahOgYWYVqehEtp9Q9RBAQ9HGeKw4e4shhvgdGvKgxFm3Po
         J3JKs9BO5ZEWtdifoNqtqap/d3dvVHwj2Y1MZW40JnEFckLOvySJaxgUoaizGMe+EsqL
         UAMGnPMZ99nyV2tg3WTSwaXWHiN/wUYiUiwXzo5w4uwMxTZQYkD5XSgy2RQGOZWqdzbA
         cXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709665341; x=1710270141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xBwFyKsVTwVp75+p2nwkinAD6Bz4XTPqba7sPzbW0JE=;
        b=Nz6cq8SrK1GILJwMMBt4rZuy9lDexpMEJzMxQli4w5F9uwnm8v0gubDFoLfc181uwh
         nQ6/NGf1Ywys0ZeF0etIb1f0V0d2YP3dRW1zL/zojqfqr+7AtGmykVoRqBd+pU+EXcCi
         PQXQFw+gbSYddM83Jr6B8pt0agqL7VV6OA3qQJvFqf2odcM+XN3i6Kz9GvY2i2iWEsC8
         kBXQKtOQ96BtAaJSLJA6DwbqOec6GICs5kYJHaXa3rQ6AuWzC0MoCeT68loTkxMA41t0
         vf762pGpRy8h0aN3LS/ICMXX6of/jNY1GWq0lvdpIMZgfVc8BwMR6O3nZSmd0wHaXAjv
         xbMA==
X-Forwarded-Encrypted: i=1; AJvYcCXCIWGj6QClmplNi265K9ciXYNg9qHBA2Pw9FRtMz2lljk4VUJZPTN+N8DTvqcprxxkRnyzdEEw4AUEavJ7shr2sk2FjE1FnavqVw==
X-Gm-Message-State: AOJu0YzXzmsG+gOvprYeI78J4oouR1gtRixUbOVcMqlmvCW7t4oJ/+LU
	ciQBLCfyZcbdsZb/SLlE5z1amzyrUNEna1YNVrbfsCqyhYNH3WX7s4b7Wb/Z6O+kRmyOOqjH63G
	z85auf9biRj3+f4Trc0bVNFXmCKycm4mZQofD+0mursxD0WTqUqs=
X-Google-Smtp-Source: AGHT+IEWrieqCghcMtuAiU8+E4g1wtb0MN+anUUpKGJrOGNU5YfOBzlImhJC+Y9W4AXeVKQmrFK59za9cu/REtKiSrk=
X-Received: by 2002:a05:6808:14d:b0:3c2:1944:e2f9 with SMTP id
 h13-20020a056808014d00b003c21944e2f9mr223145oie.17.1709665340696; Tue, 05 Mar
 2024 11:02:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240305002124.7552-1-warthog618@gmail.com>
In-Reply-To: <20240305002124.7552-1-warthog618@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 5 Mar 2024 20:02:09 +0100
Message-ID: <CAMRc=McneyUZztqtdrsbGG1E+DWhBxq2cQH7OWMEStaJjKLkCA@mail.gmail.com>
Subject: Re: [PATCH] selftest: gpio: remove obsolete gpio-mockup test
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-gpio@vger.kernel.org, bartosz.golaszewski@linaro.org, 
	andriy.shevchenko@linux.intel.com, christophe.leroy@csgroup.eu, 
	shuah@kernel.org, bamv2005@gmail.com, Pengfei Xu <pengfei.xu@intel.com>, 
	Yi Lai <yi1.lai@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 5, 2024 at 1:26=E2=80=AFAM Kent Gibson <warthog618@gmail.com> w=
rote:
>
> With the removal of the ARCH_NR_GPIOS, the number of available GPIOs
> is effectively unlimited, causing the gpio-mockup module load failure
> test that overflowed the number of GPIOs to unexpectedly succeed, and
> so fail.
>
> The test is no longer relevant so remove it.
> Promote the "no lines defined" test so there is still one load
> failure test in the basic set.
>
> Fixes: 7b61212f2a07 ("gpiolib: Get rid of ARCH_NR_GPIOS")
> Reported-by: Pengfei Xu <pengfei.xu@intel.com>
> Reported-by: Yi Lai <yi1.lai@intel.com>
> Closes: https://lore.kernel.org/linux-gpio/ZC6OHBjdwBdT4sSb@xpf.sh.intel.=
com/
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  tools/testing/selftests/gpio/gpio-mockup.sh | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/tools/testing/selftests/gpio/gpio-mockup.sh b/tools/testing/=
selftests/gpio/gpio-mockup.sh
> index 0d6c5f7f95d2..fc2dd4c24d06 100755
> --- a/tools/testing/selftests/gpio/gpio-mockup.sh
> +++ b/tools/testing/selftests/gpio/gpio-mockup.sh
> @@ -377,13 +377,10 @@ if [ "$full_test" ]; then
>         insmod_test "0,32,32,44,-1,22,-1,31" 32 12 22 31
>  fi
>  echo "2.  Module load error tests"
> -echo "2.1 gpio overflow"
> -# Currently: The max number of gpio(1024) is defined in arm architecture=
.
> -insmod_test "-1,1024"
> +echo "2.1 no lines defined"
> +insmod_test "0,0"
>  if [ "$full_test" ]; then
> -       echo "2.2 no lines defined"
> -       insmod_test "0,0"
> -       echo "2.3 ignore range overlap"
> +       echo "2.2 ignore range overlap"
>         insmod_test "0,32,0,1" 32
>         insmod_test "0,32,1,5" 32
>         insmod_test "0,32,30,35" 32
> --
> 2.39.2
>
>

Applied, thanks!

Bart

