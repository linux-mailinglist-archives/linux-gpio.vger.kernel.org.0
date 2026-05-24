Return-Path: <linux-gpio+bounces-37412-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOD/JPZTEmrGxwYAu9opvQ
	(envelope-from <linux-gpio+bounces-37412-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 24 May 2026 03:27:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCAB5C104F
	for <lists+linux-gpio@lfdr.de>; Sun, 24 May 2026 03:27:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8B38030074CE
	for <lists+linux-gpio@lfdr.de>; Sun, 24 May 2026 01:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C9AE23D297;
	Sun, 24 May 2026 01:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jhz7iK4s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE04222580;
	Sun, 24 May 2026 01:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779586033; cv=none; b=rGn3G+iAw1BHbKyVhD/SFF8SUHfzhErj5ULOZPv7fq97dmCzR1l5Yh7PXMDHlwzuf8HyvJJLfLZ7KtYRq+3Q/BHixLlPUN4lGSvfPcu5Q2JPJOMXevll8fAws/7vZhS30JX9R/yCCMN7UExgchA7ZY+TqPjjK7tZBpZKSYZeHXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779586033; c=relaxed/simple;
	bh=bWBrStZuXpTD4PVBcwXkbtifi1txjP2AbaVOCVckkwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mziB87Yl/Mrolklqu0O2FzIwyj0W9gWAUSdwZ1CU08PrZ3hcUwqmNMCE336AvqfAo4j4zLPx2bkT9Sn4lCU0Y22qSuCDol6hdL24UQd8EIU23qOcWfmEIwt650GMNZr5I/P8QXeLHt2kVMQHXA+vOwowCg03UtcQZi3SH/ggryU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jhz7iK4s; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779586032; x=1811122032;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=bWBrStZuXpTD4PVBcwXkbtifi1txjP2AbaVOCVckkwA=;
  b=jhz7iK4s4EYSGb0jrgEI6mSxrbwL5F+8SITzwAPMscd4z5slUWU5jndg
   DLhODf+jvfTj4VxaM1f4r4/2wYD4avJhAzNf/wHNo6ejaSRU2ZoE//P5r
   FVagv1b6H+CsUrS9J2u4SrPJTJElg7qKj3XlLRbQ1ji/8Lt45SvFuix1q
   lqPK2hHqd/8qMchShpmdeuiyMUFPRVhqgSdI7qyiduSnxW+kE6rpTf1xM
   Qb0zbJxo+ZUwa9OJtualsX0foWVqcXV1Ncv6BJ7fjg/MzzfBuEgShpGmw
   OTd0tXXBM2ILea7n/1imTgk0jFeWGwEXMAUcQFSVL+SwNrZKjvp90JmK7
   g==;
X-CSE-ConnectionGUID: 7CB/fEZOSpqucnhAfWIAUA==
X-CSE-MsgGUID: 6614asOOSAa9TT1bzX/qBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="79607437"
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="79607437"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 18:27:08 -0700
X-CSE-ConnectionGUID: LyWsdOGsQ6W+1tgHqIKy7w==
X-CSE-MsgGUID: l8OPKolxSmGrLmQi2/44rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="265105511"
Received: from lkp-server01.sh.intel.com (HELO 6ba8523b1a8f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 23 May 2026 18:27:05 -0700
Received: from kbuild by 6ba8523b1a8f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQxcN-000000000XT-2yYC;
	Sun, 24 May 2026 01:27:03 +0000
Date: Sun, 24 May 2026 09:26:06 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>,
	Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH] media: camif-core: Drop GPIO handling
Message-ID: <202605240943.CiZtuwD9-lkp@intel.com>
References: <20260523-s3c-camif-descriptors-v1-1-797052aab553@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260523-s3c-camif-descriptors-v1-1-797052aab553@kernel.org>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37412-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:mid,intel.com:dkim,01.org:url,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 8FCAB5C104F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Linus,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 254f49634ee16a731174d2ae34bc50bd5f45e731]

url:    https://github.com/intel-lab-lkp/linux/commits/Linus-Walleij/media-camif-core-Drop-GPIO-handling/20260523-063811
base:   254f49634ee16a731174d2ae34bc50bd5f45e731
patch link:    https://lore.kernel.org/r/20260523-s3c-camif-descriptors-v1-1-797052aab553%40kernel.org
patch subject: [PATCH] media: camif-core: Drop GPIO handling
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260524/202605240943.CiZtuwD9-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605240943.CiZtuwD9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605240943.CiZtuwD9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/samsung/s3c-camif/camif-core.c: In function 's3c_camif_remove':
>> drivers/media/platform/samsung/s3c-camif/camif-core.c:510:37: warning: unused variable 'pdata' [-Wunused-variable]
     510 |         struct s3c_camif_plat_data *pdata = &camif->pdata;
         |                                     ^~~~~


vim +/pdata +510 drivers/media/platform/samsung/s3c-camif/camif-core.c

babde1c243b255 drivers/media/platform/s3c-camif/camif-core.c         Sylwester Nawrocki       2012-08-22  506  
10ded2312724b4 drivers/media/platform/samsung/s3c-camif/camif-core.c Uwe Kleine-König         2023-03-26  507  static void s3c_camif_remove(struct platform_device *pdev)
babde1c243b255 drivers/media/platform/s3c-camif/camif-core.c         Sylwester Nawrocki       2012-08-22  508  {
babde1c243b255 drivers/media/platform/s3c-camif/camif-core.c         Sylwester Nawrocki       2012-08-22  509  	struct camif_dev *camif = platform_get_drvdata(pdev);
babde1c243b255 drivers/media/platform/s3c-camif/camif-core.c         Sylwester Nawrocki       2012-08-22 @510  	struct s3c_camif_plat_data *pdata = &camif->pdata;
babde1c243b255 drivers/media/platform/s3c-camif/camif-core.c         Sylwester Nawrocki       2012-08-22  511  
babde1c243b255 drivers/media/platform/s3c-camif/camif-core.c         Sylwester Nawrocki       2012-08-22  512  	media_device_unregister(&camif->media_dev);
9832e155f1ed30 drivers/media/platform/s3c-camif/camif-core.c         Javier Martinez Canillas 2015-12-11  513  	media_device_cleanup(&camif->media_dev);
babde1c243b255 drivers/media/platform/s3c-camif/camif-core.c         Sylwester Nawrocki       2012-08-22  514  	camif_unregister_media_entities(camif);
babde1c243b255 drivers/media/platform/s3c-camif/camif-core.c         Sylwester Nawrocki       2012-08-22  515  	v4l2_device_unregister(&camif->v4l2_dev);
babde1c243b255 drivers/media/platform/s3c-camif/camif-core.c         Sylwester Nawrocki       2012-08-22  516  
babde1c243b255 drivers/media/platform/s3c-camif/camif-core.c         Sylwester Nawrocki       2012-08-22  517  	pm_runtime_disable(&pdev->dev);
babde1c243b255 drivers/media/platform/s3c-camif/camif-core.c         Sylwester Nawrocki       2012-08-22  518  	camif_clk_put(camif);
d5e9bddb280576 drivers/media/platform/s3c-camif/camif-core.c         Dongliang Mu             2021-10-19  519  	s3c_camif_unregister_subdev(camif);
babde1c243b255 drivers/media/platform/s3c-camif/camif-core.c         Sylwester Nawrocki       2012-08-22  520  }
babde1c243b255 drivers/media/platform/s3c-camif/camif-core.c         Sylwester Nawrocki       2012-08-22  521  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

