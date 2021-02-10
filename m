Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93614316F98
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Feb 2021 20:06:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234345AbhBJTFd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Feb 2021 14:05:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234388AbhBJTFS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Feb 2021 14:05:18 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EDFDC06178C
        for <linux-gpio@vger.kernel.org>; Wed, 10 Feb 2021 11:04:32 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id t2so1706404pjq.2
        for <linux-gpio@vger.kernel.org>; Wed, 10 Feb 2021 11:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+RWsSc5VwdQd6zHyHuxyEXtbTzZ5E9+VuXqJg3MTRlQ=;
        b=0kSKB9lj8bih7NnwIBjoGGomAqDsACWnchjZyhQc8Kj5N4g49cPS0ua7qu+XZy/k4L
         NedH90amngrt8DclGVmhh79O0k8/077ZNN6yEQcNcw7ngM8tySbKvk10iwkca+ja7Gw1
         JJDt5epyaZRdvfsWimo5g5PGvPTVowyth+ML2m05Y22yPXgMJwBOZRQiBgpLWHu5cyPm
         jJvkLFlFWT0hIGV5GcGMhgQEY5DJJrGI8OBCRqUOjjFRe93ndrVDcfQ76xzK9uTA+ryT
         iapORoeNeCNVxFa5RYU5yj+qcWvELmxrYM8bdD/3DfjuYQ4C2N8aHt55ZzE4z0Xl4xTN
         0I5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+RWsSc5VwdQd6zHyHuxyEXtbTzZ5E9+VuXqJg3MTRlQ=;
        b=jttVubmdeRK6puC8ZzxiuNXW7ScO5xC+liMazKL/apEdrJ2CcNT/IZe3PsrYEdxyBC
         LhEuPyOlVyUaPPHSuOLZx4prF4QOBFb1t0hquyiT2oGPq2BE5+ToAMDqH1KoShpyPO6i
         LlsqAK6dVeTzNR2WAUJ+LKAXRavYEwenzigj6pQzwpnYN8tFhkMT1NgDkdhxHMH0SsXq
         7EwVDDnWB5p1e/lfVyroc9+KKJb5qveUU24asthBCiTJAZ1xj64SL6Q2g4bPfZKxPj/i
         v65wGsi1CGU0DtAD8aJVBxAIh0jdjLhI3TqxX+zixIj6jV26QmqmIvdh+SvdfxYAmk58
         hJlQ==
X-Gm-Message-State: AOAM531L9urkMRU+initgOq6PGyhrjvB9Yjm0rHEmSlYb3ohNamy04YZ
        /pY0a+mpLxuOK1NIMCdRqopLnQ==
X-Google-Smtp-Source: ABdhPJwls+1h88qdS6hD37XBCBWACabqbC1VVBCbElze2dTJeOE81ckFfBZI3zbvwCKH7qsmIdVkLg==
X-Received: by 2002:a17:90a:ad09:: with SMTP id r9mr326849pjq.51.1612983871999;
        Wed, 10 Feb 2021 11:04:31 -0800 (PST)
Received: from x1 ([2601:1c0:4701:ae70:7b19:df69:92d6:528e])
        by smtp.gmail.com with ESMTPSA id v4sm2908667pff.156.2021.02.10.11.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 11:04:31 -0800 (PST)
Date:   Wed, 10 Feb 2021 11:04:28 -0800
From:   Drew Fustini <drew@beagleboard.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kbuild@lists.01.org, Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>, lkp@intel.com,
        kbuild-all@lists.01.org
Subject: Re: [PATCH v2 2/2] pinctrl: pinmux: Add pinmux-select debugfs file
Message-ID: <20210210190428.GA188420@x1>
References: <20210210074946.155417-3-drew@beagleboard.org>
 <20210210182044.GY2696@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210210182044.GY2696@kadam>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 10, 2021 at 09:20:44PM +0300, Dan Carpenter wrote:
> Hi Drew,
> 
> url:    https://github.com/0day-ci/linux/commits/Drew-Fustini/pinctrl-pinmux-Add-pinmux-select-debugfs-file/20210210-160108
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
> config: i386-randconfig-m021-20210209 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

Does it makes sense for me to include that tag in this patch?

It's not really a fix but rather creating a new feature through debugfs.
I am wondering if it might confuse people reading the git log as to
whether the Reported-by: was with regards to the addition of
'pinmux-select' to debugfs, rather than it was just reporting that my
goto handling was incorrect.

I think it makes sense for me to mention that in the PATCH changelog but
that won't be in the git commit message.

> 
> smatch warnings:
> drivers/pinctrl/pinmux.c:762 pinmux_select() error: uninitialized symbol 'gname'.
> 
> vim +/gname +762 drivers/pinctrl/pinmux.c
> 
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  678  static ssize_t pinmux_select(struct file *file, const char __user *user_buf,
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  679  				   size_t len, loff_t *ppos)
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  680  {
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  681  	struct seq_file *sfile = file->private_data;
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  682  	struct pinctrl_dev *pctldev = sfile->private;
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  683  	const struct pinmux_ops *pmxops = pctldev->desc->pmxops;
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  684  	const char *const *groups;
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  685  	char *buf, *fname, *gname;
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  686  	unsigned int num_groups;
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  687  	int fsel, gsel, ret;
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  688  
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  689  	if (len > (PINMUX_MAX_NAME * 2)) {
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  690  		dev_err(pctldev->dev, "write too big for buffer");
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  691  		return -EINVAL;
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  692  	}
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  693  
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  694  	buf = devm_kzalloc(pctldev->dev, PINMUX_MAX_NAME * 2, GFP_KERNEL);
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  695  	if (!buf)
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  696  		return -ENOMEM;
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  697  
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  698  	fname = devm_kzalloc(pctldev->dev, PINMUX_MAX_NAME, GFP_KERNEL);
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  699  	if (!fname) {
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  700  		ret = -ENOMEM;
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  701  		goto free_buf;
> 
> The gotos are out of order.  They should be in mirror/reverse order of
> the allocations:
> 
> free_gmane:
> 	devm_kfree(pctldev->dev, gname);
> free_fname:
> 	devm_kfree(pctldev->dev, fname);
> free_buf:
> 	devm_kfree(pctldev->dev, buf);

Thank you, yes, I should have caught this.

> 
> But also why do we need to use devm_kfree() at all?  I thought the whole
> point of devm_ functions was that they are garbage collected
> automatically for you.  Can we not just delete all error handling and
> return -ENOMEM here?

Andy replied already that it is incorrect for me to be using devm_*() in
the debugfs write operation.  I'll be changing the code to use normal
kzalloc() and thus will need to keep the goto error handling (but with
the correct order as you pointed out).

> 
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  702  	}
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  703  
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  704  	gname = devm_kzalloc(pctldev->dev, PINMUX_MAX_NAME, GFP_KERNEL);
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  705  	if (!buf) {
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  706  		ret = -ENOMEM;
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  707  		goto free_fname;
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  708  	}
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  709  
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  710  	ret = strncpy_from_user(buf, user_buf, PINMUX_MAX_NAME * 2);
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  711  	if (ret < 0) {
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  712  		dev_err(pctldev->dev, "failed to copy buffer from userspace");
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  713  		goto free_gname;
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  714  	}
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  715  	buf[len-1] = '\0';
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  716  
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  717  	ret = sscanf(buf, "%s %s", fname, gname);
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  718  	if (ret != 2) {
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  719  		dev_err(pctldev->dev, "expected format: <function-name> <group-name>");
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  720  		goto free_gname;
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  721  	}
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  722  
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  723  	fsel = pinmux_func_name_to_selector(pctldev, fname);
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  724  	if (fsel < 0) {
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  725  		dev_err(pctldev->dev, "invalid function %s in map table\n", fname);
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  726  		ret = -EINVAL;
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  727  		goto free_gname;
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  728  	}
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  729  
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  730  	ret = pmxops->get_function_groups(pctldev, fsel, &groups, &num_groups);
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  731  	if (ret) {
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  732  		dev_err(pctldev->dev, "no groups for function %d (%s)", fsel, fname);
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  733  		goto free_gname;
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  734  
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  735  	}
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  736  
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  737  	ret = match_string(groups, num_groups, gname);
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  738  	if (ret < 0) {
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  739  		dev_err(pctldev->dev, "invalid group %s", gname);
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  740  		goto free_gname;
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  741  	}
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  742  
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  743  	ret = pinctrl_get_group_selector(pctldev, gname);
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  744  	if (ret < 0) {
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  745  		dev_err(pctldev->dev, "failed to get group selectorL %s", gname);
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  746  		goto free_gname;
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  747  	}
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  748  	gsel = ret;
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  749  
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  750  	ret = pmxops->set_mux(pctldev, fsel, gsel);
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  751  	if (ret) {
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  752  		dev_err(pctldev->dev, "set_mux() failed: %d", ret);
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  753  		goto free_gname;
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  754  	}
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  755  
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  756  	return len;
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  757  free_buf:
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  758  	devm_kfree(pctldev->dev, buf);
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  759  free_fname:
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  760  	devm_kfree(pctldev->dev, fname);
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  761  free_gname:
> 99b2f99aa41aa7 Drew Fustini  2021-02-09 @762  	devm_kfree(pctldev->dev, gname);
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  763  	return ret;
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  764  }
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

Thank you,
Drew
