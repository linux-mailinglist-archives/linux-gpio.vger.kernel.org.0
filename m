Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 678049CD20
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2019 12:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730469AbfHZKNc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Aug 2019 06:13:32 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:39957 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730482AbfHZKNb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Aug 2019 06:13:31 -0400
Received: by mail-lf1-f65.google.com with SMTP id b17so11845975lff.7
        for <linux-gpio@vger.kernel.org>; Mon, 26 Aug 2019 03:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=t5IFyVt9ycUTswozYtX7dDQi6y3j9+8f5c65D6FhaJk=;
        b=V2kDrxIwe3zBsUdenFJteBOLthl93Ehz+6GkRgF8H67aCPc6C4NT6avkNNDp2rA9vB
         q8hjjP7wJE+alfVoFDtR03iPo3a1VZ96woLncoAgaLqYQWF2kCNFc0yPd2wWOT3AxmXq
         8t/dP0va+AY6rAeI9PlV7NUMYU9dUZSNJMeGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=t5IFyVt9ycUTswozYtX7dDQi6y3j9+8f5c65D6FhaJk=;
        b=IDHsqe4hY/ARlHbjhkS1435MQ3XWXNkLJsMyno/cEGt4n7RiPUGaZx0hrr1hSVjtl9
         MXVsaYQ0MD1ZYezF9uNqVr1VQ266OEgXlqfOAoii96qWlZ81Xfg65oQZ9qwDq8rjxAAp
         Lj1jMCIwim4w2kGneQksACNeeO3U8piVuxv2AyJYZoLaddYq+LIoA1L+475mTCFmr+pF
         S6CCqsW4vS90FH6mqTxri1MwsWTGd04rb197n5rItyVunVpPREF10rryRqNE+/YO3kSU
         HsMIjtUxqjl5+gyUH5zJPQ/TY5HoamIiZoG0YXnNlOfkHDU6kE3Vdbjacygs0YHf+yJm
         luoA==
X-Gm-Message-State: APjAAAVNs5XCK94tXX0rrKMD09dZhYAR4+kdQj24u9ptlqsPR2KYX/cX
        AQEPci3NAAMJ3EWN/JQ3HcbDBQ==
X-Google-Smtp-Source: APXvYqwT5Lvtv0r+bFYvEOW2LjCvYtNI9bYRgtzeC1tRpJDtm/RJUlStouFMu+qIBYaMc1hxPS7l9w==
X-Received: by 2002:a19:2d19:: with SMTP id k25mr1777488lfj.76.1566814408505;
        Mon, 26 Aug 2019 03:13:28 -0700 (PDT)
Received: from [172.16.11.28] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id n2sm2026320lfl.62.2019.08.26.03.13.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Aug 2019 03:13:27 -0700 (PDT)
Subject: Re: [PATCH v1 1/2] vsprintf: introduce %dE for error constants
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20190824233724.1775-1-uwe@kleine-koenig.org>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <ff5d3756-7fac-84ed-ba1e-ff0a4ece32be@rasmusvillemoes.dk>
Date:   Mon, 26 Aug 2019 12:13:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190824233724.1775-1-uwe@kleine-koenig.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 25/08/2019 01.37, Uwe Kleine-König wrote:
> 	pr_info("probing failed (%dE)\n", ret);
> 
> expands to
> 
> 	probing failed (EIO)
> 
> if ret holds -EIO (or EIO). This introduces an array of error codes. If
> the error code is missing, %dE falls back to %d and so prints the plain
> number.
> 
> Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
> ---
> Hello
> 
> there are many code sites that benefit from this. Just grep for
> "(%d)" ...
> 
> As an example the follow up patch converts a printk to use this new
> format escape.
> 
> Best regards
> Uwe
> 
>  Documentation/core-api/printk-formats.rst |   3 +
>  lib/vsprintf.c                            | 193 +++++++++++++++++++++-
>  2 files changed, 195 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
> index c6224d039bcb..81002414f956 100644
> --- a/Documentation/core-api/printk-formats.rst
> +++ b/Documentation/core-api/printk-formats.rst
> @@ -35,6 +35,9 @@ Integer types
>  		u64			%llu or %llx
>  
>  
> +To print the name that corresponds to an integer error constant, use %dE and
> +pass the int.
> +
>  If <type> is dependent on a config option for its size (e.g., sector_t,
>  blkcnt_t) or is architecture-dependent for its size (e.g., tcflag_t), use a
>  format specifier of its largest possible type and explicitly cast to it.
> diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> index b0967cf17137..672eab8dab84 100644
> --- a/lib/vsprintf.c
> +++ b/lib/vsprintf.c
> @@ -533,6 +533,192 @@ char *number(char *buf, char *end, unsigned long long num,
>  	return buf;
>  }
>  
> +#define ERRORCODE(x) { .str = #x, .err = x }
> +
> +static const struct {
> +	const char *str;
> +	int err;
> +} errorcodes[] = {
> +	ERRORCODE(EPERM),
...
> +	ERRORCODE(ERECALLCONFLICT),
> +};
> +
> +static noinline_for_stack
> +char *errstr(char *buf, char *end, unsigned long long num,
> +	     struct printf_spec spec)
> +{
> +	char *errname = NULL;
> +	size_t errnamelen, copy;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(errorcodes); ++i) {
> +		if (num == errorcodes[i].err || num == -errorcodes[i].err) {
> +			errname = errorcodes[i].str;
> +			break;
> +		}
> +	}

Not sure I'm a fan of iterating this array. Yes, the errno values are a
bit sparse, but maybe one could use a dense array with O(1) lookup for
those < 128 and then have an exceptional table like yours for the rest.
But if you do keep this whole array thing, please do as Andrew suggested
and compact it somewhat (4 bytes per entry plus the storage for the
strings themselves is enough, see e.g. e1f0bce3), and put EINVAL and
other common things near the start (at least EINVAL is a lot more common
than ENOEXEC).

> +	if (!errname) {
> +		/* fall back to ordinary number */
> +		return number(buf, end, num, spec);
> +	}
> +
> +	copy = errnamelen = strlen(errname);
> +	if (copy > end - buf)
> +		copy = end - buf;
> +	buf = memcpy(buf, errname, copy);

This is buggy, AFAICT. buf may be beyond end (that's the convention), so
end-buf (which is a ptrdiff_t, which is probably a signed type, but it
gets converted to a size_t when compared to copy) can be a huge number,
so copy>end-buf is false.

Please just use the string() helper that gets used for printing other
fixed strings (as well as %s input).

And add tests to lib/test_printf.c, that would catch this sort of thing
immediately.

> +	return buf + errnamelen;
> +}
> +
>  static noinline_for_stack
>  char *special_hex_number(char *buf, char *end, unsigned long long num, int size)
>  {
> @@ -2566,7 +2752,12 @@ int vsnprintf(char *buf, size_t size, const char *fmt, va_list args)
>  				num = va_arg(args, unsigned int);
>  			}
>  
> -			str = number(str, end, num, spec);
> +			if (spec.type == FORMAT_TYPE_INT && *fmt == 'E') {
> +				fmt++;
> +				str = errstr(str, end, num, spec);

drivers/staging/speakup/speakup_bns.c has a %dE, have you checked
whether you're breaking that one? It's hard to grep for all the
variations, %-0*.5dE is also legal and would be caught here.

This has previously been suggested as a %p extension, and I think users
would just as often have an ERR_PTR() as a plain int or long. Since we
already have %p[alphanumeric] as a special kernel thing, why not do
that? It's more convenient to convert from ints/longs to error pointers

  pr_err("Uh-oh: %pE", ERR_PTR(ret));

than the other way around

  pr_err("Uh-oh: %dE", PTR_ERR(p)); // oops, must be %ldE

Kernel size impact? Have you considered making it possible to opt-out
and have %dE just mean %d?

Rasmus
