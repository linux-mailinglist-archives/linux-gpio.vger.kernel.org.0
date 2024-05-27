Return-Path: <linux-gpio+bounces-6653-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 094178D0051
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 14:44:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B87E0283EC3
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 12:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 219F615E5B8;
	Mon, 27 May 2024 12:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gv+JlzdZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C23113AA2A
	for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 12:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716813866; cv=none; b=pzDtlkdUQerxhmy9pZY22pazZjVpWAoTlJTSvyouOxuiJu4h3iQuQJV6TAHGk+n8O071mNjX6DvkCjdSgJu4hjt9kK/7t33/GeaW8SsMQFWiHhULSQcD+HyqNQ2vBzQ+/pneZ4S7mFju5+Zmwz3IvKadbs4N2MsizGe1+j8RoKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716813866; c=relaxed/simple;
	bh=KNd0kECrzlWx/UkgWQhrXWLiuPT7HJZLdi7he6H6Xfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nZGAlJeq/rUs/9pGlpK/Gqg63sNsjO9AACmgYon1o+AEhgerx0j44i9t1NwObypfQQ3RaLh6S7jPqA0vPW3dggEQIRybYhSvA7wI0K6e1wPOFQz+Mh7TQ+L/f5tNNyFUJ7a2fdJ/AVsbMhZz4V9+Gl2LizVCslreq3WrGECRUjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gv+JlzdZ; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1f4a52b94c3so6276955ad.3
        for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 05:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716813865; x=1717418665; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yf1aRYXWE7Cv5rRB0WUCfqwS4Vwcsb/fpGpLjxX8Cak=;
        b=Gv+JlzdZC0duWC8BUBFW/1gkC0EvhiKGSNqnDKWmSgva2NT15uf8JTbTLVZKsN+7bY
         Ae7LMcXjd7cll+b2ZryXy1NArkTdJjbz8Kh8EcQiKYDsntCnfiE1x+efjXIBASjNVOMp
         hyOPhKIRW4bzt8ibXOhK5+D5C7xGdh1FUJS5PGQ1rPGMSvR8cbTr5HkTQnmEC4OnZd39
         KXZSR0HpbGHM/TjgQiB0y40Rnh6fzF4va2Og87NFdyHZmEVJk2K1rjR1h9mISm9i1FGm
         L7vBOaBFAmubmPzQbHGycROz0vCoH4RJ4eTwSBOxV/m9+EzdvcuW89MSDxXlnb3ZhEak
         GFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716813865; x=1717418665;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yf1aRYXWE7Cv5rRB0WUCfqwS4Vwcsb/fpGpLjxX8Cak=;
        b=J7kpfbZ6n/k+OBGuqPSII2gnjXcU33m2+xQ2f1jyMGIvlTpqBsGOunMttoVUgFnCCY
         PR82kMHidsCmk7XjCC4SALF61GHNogG1EBzDzKHAfYBNc65wrEC6bNOZgTIhXhtJ+/UV
         8nLsO7Bj3xTxU/ZrkOhKnBJ3C00MpBkpL3XM1+T63B1fBLIyDl2htM3bGuzDDs+GjQ04
         zFtkju3/Gabu+yEEl1wPqYHOTpLvVRTv75tMhchntV10NmnWJ3L1XEMDTvSg+Q6A3YJz
         uS9Ar1WjAb4CCudDxUHJ41G8BrK4RLrfeOnj0e0YPqAMQd2J/Sb3gdAHuXrjdjustQ6V
         QU2w==
X-Forwarded-Encrypted: i=1; AJvYcCXmidTapRz471nu1E/hlvAvqoRZSCgPcQaUbcP/FoSv/eguCgRHQ4pOX8M+bLC8BHGfI7W+g/xj23PB3bgoSQMrpawhiG9vKxYtDQ==
X-Gm-Message-State: AOJu0YxQeYczH8VmKEX2xsdA3B2fBM5bPbohRp3S+NRuV0/mrAAwcqcP
	t0DuZYX3kIAlVnsTF+LGIoa3d5jcIujGYydO9GgeWRmVQfG8hmwe
X-Google-Smtp-Source: AGHT+IGY9bRZ6w2QL3MSU4A/Nj/Nxj0wrqRbpzLZ7YzQzPhITrAactCm5tdzX/7catd2hTPIPP0GFg==
X-Received: by 2002:a17:902:e809:b0:1f3:135c:f717 with SMTP id d9443c01a7336-1f4486b9e24mr100496035ad.14.1716813864697;
        Mon, 27 May 2024 05:44:24 -0700 (PDT)
Received: from rigel (60-241-107-82.static.tpgi.com.au. [60.241.107.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f4b83ffffasm6449145ad.173.2024.05.27.05.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 05:44:24 -0700 (PDT)
Date: Mon, 27 May 2024 20:44:20 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod v2 2/4] tools: tests: use "$@" instead of $*
Message-ID: <20240527124420.GA108041@rigel>
References: <20240527-fix-bash-tests-v2-0-05d90cea24cd@linaro.org>
 <20240527-fix-bash-tests-v2-2-05d90cea24cd@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527-fix-bash-tests-v2-2-05d90cea24cd@linaro.org>

On Mon, May 27, 2024 at 02:02:34PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> $@ does not break up quoted arguments which is what we want in all cases
> in the bash test-suite. Use it instead of $*. While at it: prevent
> globbing with double quotes but allow variable expansion.
>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  tools/gpio-tools-test.bash | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/tools/gpio-tools-test.bash b/tools/gpio-tools-test.bash
> index abb2f5d..dde26b4 100755
> --- a/tools/gpio-tools-test.bash
> +++ b/tools/gpio-tools-test.bash
> @@ -27,10 +27,10 @@ GPIOSIM_APP_NAME="gpio-tools-test"
>  MIN_KERNEL_VERSION="5.17.4"
>  MIN_SHUNIT_VERSION="2.1.8"
>
> -# Run the command in $* and fail the test if the command succeeds.
> +# Run the command in $@ and fail the test if the command succeeds.
>  assert_fail() {
> -	$* || return 0
> -	fail " '$*': command did not fail as expected"
> +	"$@" || return 0
> +	fail " '$@': command did not fail as expected"
>  }
>

Ironically, shellcheck doesn't like the '$@' in the fail string[1], so you
should use $* there.

It also doesn't like looping on find results in patch 4[2], though that
is not related to your change, so leave it and I'll fix it later?

Cheers,
Kent.

[1] https://www.shellcheck.net/wiki/SC2145
[2] https://www.shellcheck.net/wiki/SC2044

