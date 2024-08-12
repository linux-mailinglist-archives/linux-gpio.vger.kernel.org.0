Return-Path: <linux-gpio+bounces-8719-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB66094EDF3
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2024 15:20:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71C451F22E90
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2024 13:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE4B117C216;
	Mon, 12 Aug 2024 13:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gTiYJspA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA5E17ADEB
	for <linux-gpio@vger.kernel.org>; Mon, 12 Aug 2024 13:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723468799; cv=none; b=Z+/PJ5VvHnxampimGLvEr1EACQoU6gG9TrsfMM9/wni5xz9dFMgjABUxErkN3FAyLHXiBcBIE+vJpv5AFPvEomC2kE5aIa+EAf4IlUXy8t19q1Mg17Fe0DbbGbfWsaASK4KAaWyAylzQnbj/KLj9ZALDahsypIpLAJpQK9vqwPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723468799; c=relaxed/simple;
	bh=q6nawpiOAlkUGoV1IFA2llgODJTQNbXCkOSfFG5UJJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BngWqWBTdKGtSPugBEcT+83kjMK3x2FwfCeT2Zj4BrM1jkU932w/loEBhQywon8HE+8VdaasNckOCfNtxaMtGfH3yZHolW2G08ePNTKZHb2DTVdhoG1QLPIa3f2qlSUzMPKLb2vbOutocnr7NQ1B1T682BoJalBLRu+C66ejFXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gTiYJspA; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723468798; x=1755004798;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q6nawpiOAlkUGoV1IFA2llgODJTQNbXCkOSfFG5UJJA=;
  b=gTiYJspAxQFA1Ol7zcpQShODq7KlL4SnypZaTlsR4J15OlCduTcYcsjp
   TarIHDzHSS43HVq+AWrBGTprjweZA4UT7XP9wHnVtKjSjRv6SG2ZrjTCw
   6gtxZxsO1nv4QmoWvgJo5+RIsyzesOwGLufXfwHjwwDpLFlNabsdvX9BO
   953Foc6w4Pbn6lGTDYnOA25F6tjgROZ0jEre8zn/StTOHMZKqJKXKmyLj
   7Q17+ESdjLLTg9897wj8ePYx6D7PIjTR7sJ6JKO/cLqegioQvi4TYTVHM
   YrNqxnzxU3eDuPWy5nsmRpqTNT6n/LAWugLEwRslbhHHSp4QS+8yk6ubX
   w==;
X-CSE-ConnectionGUID: LuFqACA2S4GaM5r2rWfbOw==
X-CSE-MsgGUID: WVI+fnclQUyZfC8W98r/yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21231702"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="21231702"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 06:19:57 -0700
X-CSE-ConnectionGUID: PiW1nUcrSnqXOBqlTUl85A==
X-CSE-MsgGUID: 7rFZWHXoTAuEgvtFB+VIpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="58184674"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 06:19:55 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sdUxj-0000000EM5d-2M8u;
	Mon, 12 Aug 2024 16:19:51 +0300
Date: Mon, 12 Aug 2024 16:19:51 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Erik Schilling <erik.schilling@linaro.org>,
	Phil Howard <phil@gadgetoid.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Philip Withnall <philip@tecnocode.co.uk>,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>
Subject: Re: [PATCH libgpiod v5 0/4] dbus: add GLib-based D-Bus daemon and
 command-line client
Message-ID: <ZroL98SPRlaL9O8w@smile.fi.intel.com>
References: <20240812-dbus-v5-0-ead288509217@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812-dbus-v5-0-ead288509217@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Aug 12, 2024 at 10:22:21AM +0200, Bartosz Golaszewski wrote:
> I'm resending it once more but with commits squashed into how they'll appear
> in git once applied upstream. I think the code is in good enough shape that
> it can now go into the master branch and any further development can happen
> from there.
> 
> Big thanks to Philip Withnall <philip@tecnocode.co.uk> for his thorough review
> of this series. I think I addressed most of the issues pointed out.
> 
> This series introduces the D-Bus API definition and its implementation in the
> form of a GPIO manager daemon and a companion command-line client as well as
> GLib bindings to libgpiod which form the base on which the former are built.
> 
> While I split the GLib and D-Bus code into several commits for easier review,
> I intend to apply all changes to bindings/glib/ and dbus/ as two big commits
> in the end as otherwise the split commits are not buildable until all of them
> are applied.
> 
> The main point of interest is the D-Bus interface definition XML at
> dbus/lib/io.gpiod1.xml as it is what defines the actual D-Bus API. Everything
> else can be considered as implementation details as it's easier to change
> later than the API that's supposed to be stable once released.
> 
> The first two patches expose the test infrastructure we use for the core
> library and tools to the GLib bindings and dbus code. Next we add the GLib
> bindings themselves. Not much to discuss here, they cover the entire libgpiod
> API but wrap it in GObject abstractions and plug into the GLib event loop.
> 
> Finally we add the D-Bus code that's split into the daemon and command-line
> client. I added some examples to the README and documented the behavior in
> the help text of the programs as well as documented the interface file with
> XML comments that gdbus-codegen can parse and use to generate docbook output.
> 
> For D-Bus, most of the testing happens in the command-line client bash tests.
> It has a very good coverage of the daemon's code and also allows to run the
> daemon through valgrind and verify there are no memory leaks and invalid
> accesses.

Thanks for doing this!

I was on the long vacation and would not have time to look into this in months,
I think. So whenever this lands into Buildroot, I will use it and hence try to
test the thingy.

-- 
With Best Regards,
Andy Shevchenko



