Return-Path: <linux-gpio+bounces-10439-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E7A985550
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2024 10:18:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53F2BB22A3D
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2024 08:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E88DE158DB9;
	Wed, 25 Sep 2024 08:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DYVqF/wm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700C3158D8B
	for <linux-gpio@vger.kernel.org>; Wed, 25 Sep 2024 08:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727252308; cv=none; b=URxWSa5r5djKz19m+gYattxNu179H3qXUOWPALRel1YlZJlyG77YP1v7UfaDvstabF7KdED/WGpP3IbTsry1Eb1W7KxGFseY3D4KYI46njHKRrm19X2oxkE3Ypb0OdE/BLl2z+M68xWekskYgsXSwYQ2j9KlzNmaNZexd+nQXrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727252308; c=relaxed/simple;
	bh=ZNN0WA2/p1ORgw0WLog369ZiQNy2kk/Mzv+YGlD0aSc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=L3UBOwfCBQYQMn1kBDVfJDvwLltNfhAq4n/MQWsIyHvzsVjeygZktK8PPs8qTe1J1PkNGYncgTuQ7VrydCUS3oXUV0wFUxIvX8s3xjdCGs4ixXA40ipcSiiRwpUVQuU+pcRpTx4POZXgb6UbQC4Uarvri7Dt0dQrvJgaf4x4Dyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DYVqF/wm; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42cb5b3c57eso63849835e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 25 Sep 2024 01:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727252305; x=1727857105; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CjViwqKoOuJx/lbhmfqAwvB3FRCAndqhaaKQMzHxtco=;
        b=DYVqF/wm5gdqbVfTe9EK/+0aiAIU70Z20kN5LXCHyXXsC2+A9KjoL+xX0jeu5qFgPd
         lRWaphLh2z4UWpRov70KdrYFMpSETuySqSnYeb9/VhackhZRbm73oH80Z0cJtuUal8+U
         CJz8+3A95q44b6RFHfwgjxBGufi37TLS/Pf4Jeo/DSrBiXTnTuAl4ew3rHkh6ybCjQsN
         aZgaw89hnGnL+lT4Tm68MF0Bzntr9iC3qcbj4m4z1jZ0dEeP8zo5HPMkLUuUmBlpZGSG
         rw4w3pbcXzsYlQKkgOMb4Ks/9iFuqpW7wCrMS2gyWkUCJFoBKR/Vca6u3zeAPTFgYbGJ
         8lHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727252305; x=1727857105;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CjViwqKoOuJx/lbhmfqAwvB3FRCAndqhaaKQMzHxtco=;
        b=K/ZbN4CXi9/1swQdidrsK6DvHvfcdo9khF8aTT2JoTD2kPmqQNfDdkbbF1r8YBYK+x
         bgUYM5YzGXro52MQcnpXun53MhnaUWPYj46q919CAILJhGz0R1OM+jqMxI1zC2f5pEHc
         eal9L+eHqXrhXmFNfwzKyl/qNP0zFJFd9/+i/EnNeoFG+/wqf3AW0MdCQNrvzDhkNj38
         kIP53eZ0PwN6pcV3tEiFZhFTo3HkpZTTgDc3XND7WU1fpy/OWeDd61gVR0IUGIQ53fSm
         Ls7iqDng00xF6/4OGZCsGVjuL8Ry1wpED+tZYB3fw4OZKgboHQchuBF5urEQiWFKknvg
         TWZg==
X-Forwarded-Encrypted: i=1; AJvYcCWvne3SKthpznydTzY/mBodyvG0sGujqfb8SnCkngL7gA6sRDVb3WAq1Y51Bd9MD8Rvid3DxzgBnHhL@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf5dc0u5PxaLfG2mAsc2W5hoAJ0XH4P0Unjf8UM6bIa2T6rhaS
	NsVM610mHiqVqUm4AkDhOZJ/4zYB2h5gXtBv6cNj2j4NbPuCdU4vRbkJWdxAcoI=
X-Google-Smtp-Source: AGHT+IGzTCJoMIje7BlfvPfP0lS5uStHPhLpQoLdhOq/3pwsQ/1Hd2BTnfsSIdO9RAY8hcw1bZBCyQ==
X-Received: by 2002:a05:600c:3d05:b0:42c:b9c8:2bb0 with SMTP id 5b1f17b1804b1-42e96103358mr11373925e9.4.1727252304561;
        Wed, 25 Sep 2024 01:18:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cbc2a8bcasm3362899f8f.9.2024.09.25.01.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 01:18:24 -0700 (PDT)
Date: Wed, 25 Sep 2024 11:18:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Mary Strodl <mstrodl@csh.rit.edu>,
	linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linus.walleij@linaro.org,
	brgl@bgdev.pl, linux-gpio@vger.kernel.org,
	Mary Strodl <mstrodl@csh.rit.edu>
Subject: Re: [PATCH v2] gpio: add support for FTDI's MPSSE as GPIO
Message-ID: <0c58010f-3d25-498b-a519-d79e7021cff1@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240919141014.4000958-1-mstrodl@csh.rit.edu>
Received: from imap.gmail.com (108.177.15.109:993) by stanley.mountain with

Hi Mary,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mary-Strodl/gpio-add-support-for-FTDI-s-MPSSE-as-GPIO/20240919-221626
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20240919141014.4000958-1-mstrodl%40csh.rit.edu
patch subject: [PATCH v2] gpio: add support for FTDI's MPSSE as GPIO
config: x86_64-randconfig-161-20240922 (https://download.01.org/0day-ci/archive/20240923/202409230158.XhvhLOyY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409230158.XhvhLOyY-lkp@intel.com/

smatch warnings:
drivers/gpio/gpio-mpsse.c:211 gpio_mpsse_get_multiple() warn: inconsistent returns '&priv->io_mutex'.

vim +211 drivers/gpio/gpio-mpsse.c

be777399e9baea Mary Strodl 2024-09-19  190  static int gpio_mpsse_get_multiple(struct gpio_chip *chip, unsigned long *mask,
be777399e9baea Mary Strodl 2024-09-19  191  				   unsigned long *bits)
be777399e9baea Mary Strodl 2024-09-19  192  {
be777399e9baea Mary Strodl 2024-09-19  193  	unsigned long i, bank, bank_mask;
be777399e9baea Mary Strodl 2024-09-19  194  	int ret;
be777399e9baea Mary Strodl 2024-09-19  195  	struct mpsse_priv *priv = gpiochip_get_data(chip);
be777399e9baea Mary Strodl 2024-09-19  196  
be777399e9baea Mary Strodl 2024-09-19  197  	mutex_lock(&priv->io_mutex);
be777399e9baea Mary Strodl 2024-09-19  198  	for_each_set_clump8(i, bank_mask, mask, chip->ngpio) {
be777399e9baea Mary Strodl 2024-09-19  199  		bank = i / 8;
be777399e9baea Mary Strodl 2024-09-19  200  
be777399e9baea Mary Strodl 2024-09-19  201  		if (bank_mask) {
be777399e9baea Mary Strodl 2024-09-19  202  			ret = gpio_mpsse_get_bank(priv, bank);
be777399e9baea Mary Strodl 2024-09-19  203  			if (ret < 0)
be777399e9baea Mary Strodl 2024-09-19  204  				return ret;

Needs to mutex_unlock(&priv->io_mutex) before returning.

be777399e9baea Mary Strodl 2024-09-19  205  
be777399e9baea Mary Strodl 2024-09-19  206  			bitmap_set_value8(bits, ret & bank_mask, i);
be777399e9baea Mary Strodl 2024-09-19  207  		}
be777399e9baea Mary Strodl 2024-09-19  208  	}
be777399e9baea Mary Strodl 2024-09-19  209  	mutex_unlock(&priv->io_mutex);
be777399e9baea Mary Strodl 2024-09-19  210  
be777399e9baea Mary Strodl 2024-09-19 @211  	return 0;
be777399e9baea Mary Strodl 2024-09-19  212  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


