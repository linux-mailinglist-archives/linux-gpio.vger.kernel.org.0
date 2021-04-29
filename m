Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C63B36E97E
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Apr 2021 13:23:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231708AbhD2LYB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Apr 2021 07:24:01 -0400
Received: from mga03.intel.com ([134.134.136.65]:25753 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231665AbhD2LYA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 29 Apr 2021 07:24:00 -0400
IronPort-SDR: T0cMsCHVYO7SZDvx50kg94nHzNGRfQObCf7mkE5ewU8adm8XjpZcuwFK+hPqZRHu/WX0Bkf1+q
 Kv36rmk/A6YA==
X-IronPort-AV: E=McAfee;i="6200,9189,9968"; a="197028799"
X-IronPort-AV: E=Sophos;i="5.82,259,1613462400"; 
   d="scan'208";a="197028799"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2021 04:23:14 -0700
IronPort-SDR: Cw3sR6RjP9de7jQPahQ39FA6GVWSsUe1dSU7wxEDtmZryb89q+v07RPD4DEauvPsrU4P8+fupd
 QcnRqk6Zhiqw==
X-IronPort-AV: E=Sophos;i="5.82,259,1613462400"; 
   d="scan'208";a="424038278"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2021 04:23:12 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lc4lB-0087Wh-Vt; Thu, 29 Apr 2021 14:23:09 +0300
Date:   Thu, 29 Apr 2021 14:23:09 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH 2/3] libgpiosim: new library for controlling
 the gpio-sim module
Message-ID: <YIqXHXU/tqxXjaKA@smile.fi.intel.com>
References: <20210429094734.9585-1-brgl@bgdev.pl>
 <20210429094734.9585-3-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210429094734.9585-3-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 29, 2021 at 11:47:33AM +0200, Bartosz Golaszewski wrote:
> Add a C library for controlling the gpio-sim kernel module from various
> libgpiod test suites. This aims at replacing the old gpio-mockup module
> and its user-space library - libgpio-mockup - in the project's tree.

...

> +	rv = uname(&un);
> +	if (rv)
> +		return -1;

Wondering why in all such cases instead of returning error code from upper
layer we shadow it with -1.

...

> +GPIOSIM_API void gpiosim_ctx_unref(struct gpiosim_ctx *ctx)
> +{
> +	if (--ctx->refcnt == 0) {

	if (--refcnt)
		return;

?


> +		close(ctx->pending_dir_fd);
> +		close(ctx->live_dir_fd);
> +
> +		if (ctx->cfs_mnt_dir) {
> +			umount(ctx->cfs_mnt_dir);
> +			rmdir(ctx->cfs_mnt_dir);
> +			free(ctx->cfs_mnt_dir);
> +		}
> +
> +		free(ctx);
> +	}
> +}

...

> +/* We don't have mkdtempat()... :( */

But we have tmpnam() / tmpnam_r(), why to reinvent it below?

> +static char *make_random_dir_at(int at)
> +{
> +	static const char chars[] = "abcdefghijklmnoprstquvwxyz"
> +				    "ABCDEFGHIJKLMNOPRSTQUVWXYZ"
> +				    "0123456789";
> +	static const unsigned int namelen = 16;
> +
> +	unsigned int idx, i;
> +	char *name;
> +	int ret;
> +
> +	name = malloc(namelen);
> +	if (!name)
> +		return NULL;
> +
> +again:
> +	for (i = 0; i < namelen; i++) {
> +		ret = getrandom(&idx, sizeof(idx), GRND_NONBLOCK);
> +		if (ret != sizeof(idx)) {
> +			if (ret >= 0)
> +				errno = EAGAIN;
> +
> +			free(name);
> +			return NULL;
> +		}
> +
> +		name[i] = chars[idx % (GPIOSIM_ARRAY_SIZE(chars) - 1)];
> +	}
> +
> +	ret = mkdirat(at, name, 0600);
> +	if (ret) {
> +		if (errno == EEXIST)
> +			goto again;
> +
> +		free(name);
> +		return NULL;
> +	}
> +
> +	return name;
> +}

...

> +	for (i = 0; i < num_names; i++) {
> +		len = names[i] ? strlen(names[i]) : 0;
> +		/* Length of the name + '"'x2 + ', '. */

This x2 is  kinda hard to get on the first glance, perhaps:

		/* Length of the '"' + name + '"' + ', '. */

?

> +		size += len + 4;
> +	}
> +
> +	buf = malloc(size);
> +	if (!buf)
> +		return -1;
> +
> +	memset(buf, 0, size);

calloc() ?


> +	for (i = 0; i < num_names; i++)
> +		written += snprintf(buf + written, size - written,
> +				    "\"%s\", ", names[i] ?: "");
> +	buf[size - 2] = '\0';

Dunno if you can use asprintf() and actually replace NULL by "" in the original
array. Ah, see you already using it somewhere else, why not here?

...

> +	while (--tries) {

I consider such loops better in a form of

	do {
		...
	} while (--tries);


> +	}

-- 
With Best Regards,
Andy Shevchenko


