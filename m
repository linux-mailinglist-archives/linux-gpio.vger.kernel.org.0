Return-Path: <linux-gpio+bounces-28607-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6BAC661D6
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 21:33:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F336835FA96
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 20:33:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41DD634A797;
	Mon, 17 Nov 2025 20:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IwaSjFcC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79E334A3D6;
	Mon, 17 Nov 2025 20:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763411601; cv=none; b=MaO4NXfYkNx1kGetw0JZPaxB3ne5hlYQYTWRxGMPasyHcgNj892jYsfMQ5xHDbAdPVjhyPor0DKn6m3iatsxbn1ivc9GVb8phLJkKPWvYL0ot6XUDtHIZCsx/2P+xDInVHAoj07VZV2UvxggaNUygj6hL8Pl/dcQfog/aDpTAYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763411601; c=relaxed/simple;
	bh=BV6A7dBjO90aTngR1VxmTz0Cc3FxYyV4HxPja2tfCrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FRnymgU4uFxkeFHtQgFOizADOIX5fXy92wQtO388geJVqm+631lm4CbnG0D3cJkKByOqxxyoIjsKsjFRITsPSnkrLt8qX4n+cP1Lmi/31hmWwl/Jbth/QgEMnQDDtnF7gc2On4Wnjf6KxXGMjwuSysB47fS12TznfyxNst/6Iao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IwaSjFcC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0045C2BC9E;
	Mon, 17 Nov 2025 20:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763411600;
	bh=BV6A7dBjO90aTngR1VxmTz0Cc3FxYyV4HxPja2tfCrs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IwaSjFcC+CJt1Xd6iGnljRiCT+H+mCtIJfZZ+jxJJZkfbreYXobKxC5EnfYfdCvyM
	 VXOFD5hZkGsx1FD6wEeEA6JpLieId9iZyELXldUOu8v3HckxnMs5Ox4ER5yai0fOkh
	 oMwU7JRSZWE8Z3yGFMxd75xXOObKyShqO11/EIefiYWQXwvovomp5j7IAGtAK7IhZj
	 h5nE6uSqqKCABwskWvxtc9x0P+by27/qalo9BDIA+e6xLfGyxmSPaGv6oSACQZO4k+
	 GjNCqszjwa04QVxS54Zza7rJbTRStyKG+kTv8tdtWSz07/MZJEPf7EaXbE5b6Eilir
	 7tpoV4h+NIHnA==
Date: Mon, 17 Nov 2025 12:33:18 -0800
From: Kees Cook <kees@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Mika Westerberg <westeri@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v4 01/10] string: provide strends()
Message-ID: <202511171230.F83EE85D0@keescook>
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-1-b51f97b1abd8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-gpio-shared-v4-1-b51f97b1abd8@linaro.org>

On Wed, Nov 12, 2025 at 02:55:30PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Implement a function for checking if a string ends with a different
> string and add its kunit test cases.
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  include/linux/string.h   | 18 ++++++++++++++++++
>  lib/tests/string_kunit.c | 13 +++++++++++++
>  2 files changed, 31 insertions(+)
> 
> diff --git a/include/linux/string.h b/include/linux/string.h
> index fdd3442c6bcbd786e177b6e87358e1065a0ffafc..929d05d1247c76eb9011fe34250b487834b2d3c9 100644
> --- a/include/linux/string.h
> +++ b/include/linux/string.h
> @@ -562,4 +562,22 @@ static inline bool strstarts(const char *str, const char *prefix)
>  	return strncmp(str, prefix, strlen(prefix)) == 0;
>  }
>  
> +/**
> + * strends - Check if a string ends with another string.
> + * @str - NULL-terminated string to check against @suffix
> + * @suffix - NULL-terminated string defining the suffix to look for in @str
> + *
> + * Returns:
> + * True if @str ends with @suffix. False in all other cases.

Maybe added "empty strings never match"?

> + */
> +static inline bool strends(const char *str, const char *suffix)

These are required to be non-NULL, so we might want to consider marking
them as such with the "nonnull" attribute. We don't use it much in Linux
yet, but I do see a few places.

e.g.:

static inline bool __attribute__((nonnull(1,2)))
strends(const char *str, const char *suffix)

> +{
> +	unsigned int str_len = strlen(str), suffix_len = strlen(suffix);
> +
> +	if (str_len < suffix_len)
> +		return false;
> +
> +	return !(strcmp(str + str_len - suffix_len, suffix));
> +}

We should probably add it to strlen and strcmp as well. :)

> +
>  #endif /* _LINUX_STRING_H_ */
> diff --git a/lib/tests/string_kunit.c b/lib/tests/string_kunit.c
> index 0ed7448a26d3aa0fe9e2a6a894d4c49c2c0b86e0..f9a8e557ba7734c9848d58ff986407d8000f52ee 100644
> --- a/lib/tests/string_kunit.c
> +++ b/lib/tests/string_kunit.c
> @@ -602,6 +602,18 @@ static void string_test_memtostr(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, dest[7], '\0');
>  }
>  
> +static void string_test_strends(struct kunit *test)
> +{
> +	KUNIT_EXPECT_TRUE(test, strends("foo-bar", "bar"));
> +	KUNIT_EXPECT_TRUE(test, strends("foo-bar", "-bar"));
> +	KUNIT_EXPECT_TRUE(test, strends("foobar", "foobar"));
> +	KUNIT_EXPECT_TRUE(test, strends("foobar", ""));
> +	KUNIT_EXPECT_FALSE(test, strends("bar", "foobar"));
> +	KUNIT_EXPECT_FALSE(test, strends("", "foo"));
> +	KUNIT_EXPECT_FALSE(test, strends("foobar", "ba"));
> +	KUNIT_EXPECT_TRUE(test, strends("", ""));
> +}

Thanks for adding tests! :)

> +
>  static struct kunit_case string_test_cases[] = {
>  	KUNIT_CASE(string_test_memset16),
>  	KUNIT_CASE(string_test_memset32),
> @@ -623,6 +635,7 @@ static struct kunit_case string_test_cases[] = {
>  	KUNIT_CASE(string_test_strlcat),
>  	KUNIT_CASE(string_test_strtomem),
>  	KUNIT_CASE(string_test_memtostr),
> +	KUNIT_CASE(string_test_strends),
>  	{}
>  };
>  
> 
> -- 
> 2.51.0
> 

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

