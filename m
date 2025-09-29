Return-Path: <linux-gpio+bounces-26654-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51085BA8718
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Sep 2025 10:46:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C4373B5860
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Sep 2025 08:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D754277C9D;
	Mon, 29 Sep 2025 08:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gUvj7K7r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33172750E1
	for <linux-gpio@vger.kernel.org>; Mon, 29 Sep 2025 08:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759135592; cv=none; b=UmeZ1pDzJ6cml0TDPns/Nm4yCDex12NBLcviZGBnr4gqQtPzi1rQgHJ+JzFbgiTpChT+I/lVj94K4Jzt6Chb7pCdRSrON+F90oUU3++G/ybDhBDbHj9EtBs/kcrdY3jZ9Ewk0VCRRqALQmHvkWyqW4d+QCcGoVo0KAoXkwY7wT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759135592; c=relaxed/simple;
	bh=BewtpsS8BJKVbE+kJssv6ZvhLH4bU0TwDjvg9fKBj0o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=kiseuBHGnJ+xw4mlvtUPRVnP6hqMb1SFuNoGBielMicNJngVDKparZMpCOSqPMAh0xxIl/IFoT+QDJI7pGn4p549W9QZGs4352B+NaYSCqZUMSCW13KGJtzyGfVYV4MTdQ2nVSV06e/rc5vVehVFccEpSpi3XbXunlTbNR1UEqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gUvj7K7r; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3ee15b5435bso2424427f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 29 Sep 2025 01:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759135588; x=1759740388; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sKLBhCJl5/nghFRodO0ItHfAYxbW+6msMIAhSSFvsw0=;
        b=gUvj7K7rIbOZ7yU9xVwgnyZRFdQLD4HhZ0ziUTZ1CWdU4Iy/e3QaeYtLxsgkFnlG7x
         plIuFnzTKa3QIR8OYAjZyYR+tjn+x7NcPjRJbkcxXlt9o7PqehLWP9J932wcMdoWpvQ/
         Xro4V8VVsLwv31EgmT78t0cpLhjNDZ2xDsWKTGRanaY9PRBGDenMKxIM1nXHnfnf9OZK
         zsV6UJ9uGJyb8QhWqjXZa+JGWnhXuKANx2A0V6wOyNFcD5eYGNMFFGBw9X5Dkfl6a9nO
         tc7DYOOJTtim711ivJ0DZEnkyJX/GMp064E89gSqu2sfLIsf6hlE++3gvaUYUaJC/xeb
         +c5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759135588; x=1759740388;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sKLBhCJl5/nghFRodO0ItHfAYxbW+6msMIAhSSFvsw0=;
        b=p0l+D8LinTmO9qHnwRwF6oMUHp+UIZ6d5BqSsAQvgV2ntQqOABP2VVeH3S7mrc9YsI
         79220LmQDobUjKoZaFOBtVbto4ZQYaa9Y0SkhoQDEZY7NDy89yhcIfqAzPVTNuAAv2P4
         bvlmfSEsrjulpCFUhWIAGGZbas9xx8PutHrPTgXL4GbV2+2LkBz6kGufSd0rktQpkGtU
         PC27YRf/wfYdcOpkaIJ5KymClgObz6jElGGGHrcyI79UR7RLA89FRyPeRVxka41y7U8Q
         kC0bSO1iefd58N4px0+tF6Ymx6Ax01rT2USlXOuPFo58Q1kogNNOM2+nYyCo7KnBRwZ3
         JpBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwEtIC6VO0qGHoNdXaDLDivuktF1UcVwwtnRpUOmphuv52hR/23K90vS39r7UhMRF+rWUHP+hifSa8@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm5ql10jf+NRcRvUZAH+r0Sf63sgyGAtLoh0ymy+0t70qo/9lu
	OqPiQeHHqAVI43yRLT9AN0YjF9CleYntrr7O6Rt83MdtZkwd2kKA3xN07AOYUzFgjyA=
X-Gm-Gg: ASbGncsXwsU+li7C31YLvkluMcOtOQrHTzpiVZkvMG65HuRLyKi5+a4eEnC6KfYrkdh
	SW0wqQpHXuEPDnFdVfisdDF455WJMWQf/kT1HEWMmHXbCtui6qzIjlnHLjJYW/dsk7nK64pxoWS
	hgExb1OsGRXFFEeUmOe28aoIDu8OwqijENoiTkrmwIOmaU251HEfrKDXO8Y051p0OurGR1DZKN0
	bdpT596TcB0vD/ANZ09PgkYnkE4+TJTn5i1TSkEc3DS1MJr03CCYIb5guKfnuTrp+3nQyRdfDsU
	9trv5roSWjDU8o+fXjL/wgUl3mm08yvxowfgVow2SZ3PV3te64OU59uLFWCwQ521ecw40Jsh2Xk
	AwvawGIHFkmTupOoeDpDq1GyRoShEP+Sugx+48hI=
X-Google-Smtp-Source: AGHT+IFiyH/6Im62Ydr3EApKzn0Bk8jV3H19/X49G59QAzu2t8JmF/PPcqoUX8ITQu/9MCv12t8qSw==
X-Received: by 2002:a05:6000:268a:b0:3e4:f194:2886 with SMTP id ffacd0b85a97d-40e436428d0mr13085167f8f.19.1759135588199;
        Mon, 29 Sep 2025 01:46:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-40fb72fb017sm17297267f8f.3.2025.09.29.01.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 01:46:27 -0700 (PDT)
Date: Mon, 29 Sep 2025 11:46:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Mary Strodl <mstrodl@csh.rit.edu>,
	linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linus.walleij@linaro.org,
	brgl@bgdev.pl, linux-gpio@vger.kernel.org,
	Mary Strodl <mstrodl@csh.rit.edu>
Subject: Re: [PATCH v2 1/3] gpio: mpsse: use rcu to ensure worker is torn down
Message-ID: <202509290823.hreUi6Tp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923133304.273529-2-mstrodl@csh.rit.edu>

Hi Mary,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mary-Strodl/gpio-mpsse-use-rcu-to-ensure-worker-is-torn-down/20250923-214710
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20250923133304.273529-2-mstrodl%40csh.rit.edu
patch subject: [PATCH v2 1/3] gpio: mpsse: use rcu to ensure worker is torn down
config: i386-randconfig-141-20250929 (https://download.01.org/0day-ci/archive/20250929/202509290823.hreUi6Tp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202509290823.hreUi6Tp-lkp@intel.com/

New smatch warnings:
drivers/gpio/gpio-mpsse.c:341 gpio_mpsse_poll() error: dereferencing freed memory 'worker' (line 342)
drivers/gpio/gpio-mpsse.c:604 gpio_mpsse_disconnect() error: dereferencing freed memory 'worker' (line 605)

vim +/worker +341 drivers/gpio/gpio-mpsse.c

a14b0c5e3b0741 Mary Strodl 2025-09-23  304  static void gpio_mpsse_poll(struct work_struct *my_work)
c46a74ff05c0ac Mary Strodl 2024-10-09  305  {
c46a74ff05c0ac Mary Strodl 2024-10-09  306  	unsigned long pin_mask, pin_states, flags;
c46a74ff05c0ac Mary Strodl 2024-10-09  307  	int irq_enabled, offset, err, value, fire_irq,
c46a74ff05c0ac Mary Strodl 2024-10-09  308  		irq, old_value[16], irq_type[16];
a14b0c5e3b0741 Mary Strodl 2025-09-23  309  	struct mpsse_worker *worker;
a14b0c5e3b0741 Mary Strodl 2025-09-23  310  	struct mpsse_worker *my_worker = container_of(my_work, struct mpsse_worker, work);
a14b0c5e3b0741 Mary Strodl 2025-09-23  311  	struct mpsse_priv *priv = my_worker->priv;
a14b0c5e3b0741 Mary Strodl 2025-09-23  312  	struct list_head destructors = LIST_HEAD_INIT(destructors);
c46a74ff05c0ac Mary Strodl 2024-10-09  313  
c46a74ff05c0ac Mary Strodl 2024-10-09  314  	for (offset = 0; offset < priv->gpio.ngpio; ++offset)
c46a74ff05c0ac Mary Strodl 2024-10-09  315  		old_value[offset] = -1;
c46a74ff05c0ac Mary Strodl 2024-10-09  316  
a14b0c5e3b0741 Mary Strodl 2025-09-23  317  	/*
a14b0c5e3b0741 Mary Strodl 2025-09-23  318  	 * We only want one worker. Workers race to acquire irq_race and tear
a14b0c5e3b0741 Mary Strodl 2025-09-23  319  	 * down all other workers. This is a cond guard so that we don't deadlock
a14b0c5e3b0741 Mary Strodl 2025-09-23  320  	 * trying to cancel a worker.
a14b0c5e3b0741 Mary Strodl 2025-09-23  321  	 */
a14b0c5e3b0741 Mary Strodl 2025-09-23  322  	scoped_cond_guard(mutex_try, ;, &priv->irq_race) {
a14b0c5e3b0741 Mary Strodl 2025-09-23  323  		scoped_guard(rcu) {
a14b0c5e3b0741 Mary Strodl 2025-09-23  324  			list_for_each_entry_rcu(worker, &priv->workers, list) {
a14b0c5e3b0741 Mary Strodl 2025-09-23  325  				/* Don't stop ourselves */
a14b0c5e3b0741 Mary Strodl 2025-09-23  326  				if (worker == my_worker)
a14b0c5e3b0741 Mary Strodl 2025-09-23  327  					continue;
a14b0c5e3b0741 Mary Strodl 2025-09-23  328  
a14b0c5e3b0741 Mary Strodl 2025-09-23  329  				scoped_guard(raw_spinlock_irqsave, &priv->irq_spin)
a14b0c5e3b0741 Mary Strodl 2025-09-23  330  					list_del_rcu(&worker->list);
a14b0c5e3b0741 Mary Strodl 2025-09-23  331  
a14b0c5e3b0741 Mary Strodl 2025-09-23  332  				/* Give worker a chance to terminate itself */
a14b0c5e3b0741 Mary Strodl 2025-09-23  333  				atomic_set(&worker->cancelled, 1);
a14b0c5e3b0741 Mary Strodl 2025-09-23  334  				/* Keep track of stuff to cancel */
a14b0c5e3b0741 Mary Strodl 2025-09-23  335  				INIT_LIST_HEAD(&worker->destroy);
a14b0c5e3b0741 Mary Strodl 2025-09-23  336  				list_add(&worker->destroy, &destructors);
a14b0c5e3b0741 Mary Strodl 2025-09-23  337  			}
a14b0c5e3b0741 Mary Strodl 2025-09-23  338  		}
a14b0c5e3b0741 Mary Strodl 2025-09-23  339  		/* Make sure list consumers are finished before we tear down */
a14b0c5e3b0741 Mary Strodl 2025-09-23  340  		synchronize_rcu();
a14b0c5e3b0741 Mary Strodl 2025-09-23 @341  		list_for_each_entry(worker, &destructors, destroy)
a14b0c5e3b0741 Mary Strodl 2025-09-23 @342  			gpio_mpsse_stop(worker);

This needs to be list_for_each_entry_save() because gpio_mpsse_stop()
frees the worker.  Or kfree_rcu() inside an rcu lock or something.

a14b0c5e3b0741 Mary Strodl 2025-09-23  343  	}
a14b0c5e3b0741 Mary Strodl 2025-09-23  344  
a14b0c5e3b0741 Mary Strodl 2025-09-23  345  	while ((irq_enabled = atomic_read(&priv->irq_enabled)) &&

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


