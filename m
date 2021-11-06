Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00025446CDF
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Nov 2021 08:35:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233634AbhKFHhk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 6 Nov 2021 03:37:40 -0400
Received: from smtprelay0121.hostedemail.com ([216.40.44.121]:33614 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232099AbhKFHhi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 6 Nov 2021 03:37:38 -0400
Received: from omf20.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay07.hostedemail.com (Postfix) with ESMTP id CD4F7181D2090;
        Sat,  6 Nov 2021 07:34:56 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf20.hostedemail.com (Postfix) with ESMTPA id EE66118A5F8;
        Sat,  6 Nov 2021 07:34:52 +0000 (UTC)
Message-ID: <6f27043dc7c50a7447b8fdcb6126f4c67a5936a5.camel@perches.com>
Subject: Re: [PATCH v1 01/19] lib/string_helpers: Introduce
 kasprintf_strarray()
From:   Joe Perches <joe@perches.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Cc:     Bamvor Jian Zhang <bamv2005@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Andy Shevchenko <andy@kernel.org>
Date:   Sat, 06 Nov 2021 00:34:51 -0700
In-Reply-To: <20211105124242.27288-1-andriy.shevchenko@linux.intel.com>
References: <20211105124242.27288-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.10
X-Stat-Signature: 1ifh16fok5zodoyg17ub7y551gue9gq8
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: EE66118A5F8
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/zHRdlX+53TMDzXto5pNOnstJ0U8Gbcpk=
X-HE-Tag: 1636184092-287531
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 2021-11-05 at 14:42 +0200, Andy Shevchenko wrote:
> We have a few users already that basically want to have array of
> sequential strings to be allocated and filled.
> 
> Provide a helper for them (basically adjusted version from gpio-mockup.c).

I think this is overkill and unnecessary bloat for the number of
actual or possible in-tree uses.  The devm_ variant too.

And it'd be useful to have an 0/n patch cover letter describing
why the patchset is useful so I could reply to that instead of the
1/n.

> diff --git a/include/linux/string_helpers.h b/include/linux/string_helpers.h
[]
> @@ -100,6 +100,7 @@ char *kstrdup_quotable(const char *src, gfp_t gfp);
>  char *kstrdup_quotable_cmdline(struct task_struct *task, gfp_t gfp);
>  char *kstrdup_quotable_file(struct file *file, gfp_t gfp);
>  
> +char **kasprintf_strarray(gfp_t gfp, const char *prefix, size_t n);
>  void kfree_strarray(char **array, size_t n);
>  
>  #endif
> diff --git a/lib/string_helpers.c b/lib/string_helpers.c
[]
> @@ -674,6 +674,39 @@ char *kstrdup_quotable_file(struct file *file, gfp_t gfp)
>  }
>  EXPORT_SYMBOL_GPL(kstrdup_quotable_file);
>  
> +/**
> + * kasprintf_strarray - allocate and fill array of sequential strings
> + * @gfp: flags for the slab allocator
> + * @prefix: prefix to be used
> + * @n: amount of lines to be allocated and filled
> + *
> + * Allocates and fills @n strings using pattern "%s-%zu", where prefix
> + * is provided by caller. The caller is responsible to free them with
> + * kfree_strarray() after use.
> + *
> + * Returns array of strings or NULL when memory can't be allocated.
> + */
> +char **kasprintf_strarray(gfp_t gfp, const char *prefix, size_t n)
> +{
> +	char **names;
> +	size_t i;
> +
> +	names = kcalloc(n + 1, sizeof(char *), gfp);
> +	if (!names)
> +		return NULL;
> +
> +	for (i = 0; i < n; i++) {
> +		names[i] = kasprintf(gfp, "%s-%zu", prefix, i);
> +		if (!names[i]) {
> +			kfree_strarray(names, i);
> +			return NULL;
> +		}
> +	}
> +
> +	return names;
> +}
> +EXPORT_SYMBOL_GPL(kasprintf_strarray);
> +
>  /**
>   * kfree_strarray - free a number of dynamically allocated strings contained
>   *                  in an array and the array itself


