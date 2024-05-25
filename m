Return-Path: <linux-gpio+bounces-6618-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6CA8CED74
	for <lists+linux-gpio@lfdr.de>; Sat, 25 May 2024 03:54:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C7F8281F8C
	for <lists+linux-gpio@lfdr.de>; Sat, 25 May 2024 01:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0149C10F2;
	Sat, 25 May 2024 01:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g6oVHHiI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB5010F1
	for <linux-gpio@vger.kernel.org>; Sat, 25 May 2024 01:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716602078; cv=none; b=Ph4ZHiclux+pk03JPxQLyPhv0FA6bMuLupBv1LAs3n1ztE0Ja9tG8T1jNTqtU4bwDe6UvgA0uOyh7B1YYuSluWBJ0heEqdsqw6rB7ofBR0ElheDcos9A3akx/yeq915hq+Pl+4yXQ5uJtAc5PM2KLymh9wpnKqRWRZXnNIb2Ql4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716602078; c=relaxed/simple;
	bh=EEIo0IiZwYktHD6FEy4eEEzoNhU0Yr/mq/no868Hn+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J6rO3h8dFe59VVpQ20qZ9brAv2SWOOznhryoNiFGKPN5gHoR0RjzHguS9qGZnsKYNNheaJO4tpNAvDE94PN+0yndBt3y9uqUhifo2dM/uNwi0Egyo808hC2ul/pfbr8UPuvK8ZGYhwT7oCcLmVg4fM4URpM9wOjJDoGZUBf6YL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g6oVHHiI; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-681907af4e7so1178962a12.1
        for <linux-gpio@vger.kernel.org>; Fri, 24 May 2024 18:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716602076; x=1717206876; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7RVwHPVnkjfXhsi/E7z9+z7+IwFcPydtgXk6blM9oxw=;
        b=g6oVHHiI3EVLEGG9W+CiollRWwqTlPI+pMO1cxAEOsi/YjY5lOe4qX9etUI8eAFlbE
         w2uXvAEZFjd6IIrcoyj/R1PasE+L4e5SIH83FQN5xjOiibykQQdtDShsz8Iv+uMagSYd
         xqCyAHuMPl9IziY/V4lQ02n/eYCScej7T0iqybjxyCg4V9spGXvZuWKbQEtY+vZHutHr
         gqPjMjGvIQggvYF2LHuxS5pfRjXnLHRiar1N78fVq82LojmbqhQ9cH8vNThm9GnuxK5c
         pPIDiJQk5X8LAYmL4KZKrWlxZxKhKGNpmfhada5fB/Wli0KY+F/lgx+66/+2jlY1l7Gj
         Lr3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716602076; x=1717206876;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7RVwHPVnkjfXhsi/E7z9+z7+IwFcPydtgXk6blM9oxw=;
        b=jYad0HtzCZZTj03+X4wTpEpKI+iXBZDKCj8s7qepfcB+dkW2FTiewVJKIKHXtrKLr6
         agoFtXvCKPuM1BCKWQZM7H0xs3TjEGTVjBFN+/7fa8f+yBFgjmK7009G6ybjBrcaK8NU
         TviaszZXI/9xe/19wefAK8l7cJuIl+lsgM8HZ01AQ4mIq9N2n5zKbXSbaZtRp4Eg7vUt
         USOIZOxpDa+MtQMEC/egnGm/ByKNDLoIvf6SsfFaQhFLOXdEiDTfsuMdy2d6ZRUwgOQ5
         0rK19puQcI+22O8Jv8HZrk3mfRV98bocnLDfcVGFm3Ywh4biRXV6ne1C9UIrC8bcqLEx
         ADng==
X-Forwarded-Encrypted: i=1; AJvYcCVu5hLRiRytfYGPtVxhiTK7QB6DJse/ZTnZr+Dyw40Sh6kecv3YGLJzVo+7JAOdtG3ZOUZDyqMbm1RPMuZuJ81wDEz8Q0FGgNCc3A==
X-Gm-Message-State: AOJu0YxI/pQqlFQtjM1xqWiukN/+C/YTxe+AyDvETEAa+f16a/D8RCSb
	9Z+nugSuakgNqF9TyhseqBGBkKRAIaJFa7RoW32b7LB4qIn9Fb3cJW6bQg==
X-Google-Smtp-Source: AGHT+IGpovO75EXjJNZP8lVxgbeF6Qu5PmGaS1XfSewwhZH3ID8+rqhoeNBqAD84gEYYFCBOADX85Q==
X-Received: by 2002:a05:6a21:3398:b0:1af:db2d:d36b with SMTP id adf61e73a8af0-1b212d2a178mr4807570637.15.1716602076499;
        Fri, 24 May 2024 18:54:36 -0700 (PDT)
Received: from rigel (60-241-107-82.static.tpgi.com.au. [60.241.107.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c96ccfasm20331445ad.147.2024.05.24.18.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 18:54:36 -0700 (PDT)
Date: Sat, 25 May 2024 09:54:31 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod 2/4] tools: tests: use $@ instead of $*
Message-ID: <20240525015431.GA5731@rigel>
References: <20240524-fix-bash-tests-v1-0-1397c73073a6@linaro.org>
 <20240524-fix-bash-tests-v1-2-1397c73073a6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240524-fix-bash-tests-v1-2-1397c73073a6@linaro.org>

On Fri, May 24, 2024 at 08:03:28PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> $@ does not break up quoted arguments which is what we want in all cases
> in the bash test-suite. Use it instead of $*.
>

I believe it needs to be "$@".  Everywhere.

Where do we use quoted arguments/whitespaced parameters?
So this is purely about "good" shell?  In that case why stop here - e.g.
shellcheck picks up a load more "Double quote to prevent splitting/globbing"
and the like.

> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  tools/gpio-tools-test.bash | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/tools/gpio-tools-test.bash b/tools/gpio-tools-test.bash
> index abb2f5d..8b4f054 100755
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
> +	$@ || return 0
> +	fail " '$@': command did not fail as expected"
>  }
>
>  # Check if the string in $2 matches against the pattern in $1.
> @@ -71,7 +71,7 @@ gpiosim_chip() {
>
>  	mkdir -p $BANKPATH
>
> -	for ARG in $*
> +	for ARG in $@
>  	do
>  		local KEY=$(echo $ARG | cut -d"=" -f1)
>  		local VAL=$(echo $ARG | cut -d"=" -f2)
> @@ -253,7 +253,7 @@ dut_regex_match() {
>  }
>
>  dut_write() {
> -	echo $* >&${COPROC[1]}
> +	echo $@ >&${COPROC[1]}
>  }
>

Does echo care?  I realise a linter, and that includes Andy, will complain
here, but is there a practical difference?

Cheers,
Kent.

>  dut_kill() {
> @@ -283,7 +283,7 @@ tearDown() {
>  }
>
>  request_release_line() {
> -	$SOURCE_DIR/gpioget -c $* >/dev/null
> +	$SOURCE_DIR/gpioget -c $@ >/dev/null
>  }
>
>  #
>
> --
> 2.43.0
>

