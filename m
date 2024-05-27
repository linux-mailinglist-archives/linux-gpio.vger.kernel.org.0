Return-Path: <linux-gpio+bounces-6689-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3799B8D0E63
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 21:51:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 626A41C21A0D
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 19:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C1132556F;
	Mon, 27 May 2024 19:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LlJ4V0HW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF3022324
	for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 19:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716839480; cv=none; b=B7QucbzFSOEMKw/lpJiHmLVjZMkYpl7jZC5o6Z+VNTEpoMo2adPryAYBjaI3KrY2C6RgplABuP7mpP9TatpZ3esulKkzMI8VLLC4chQoRNnbFg/vTScCc/BKVigESm+nCtPAINvXcOw74QBNIFXitzwLwAbI5dhnV+huaxGCWlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716839480; c=relaxed/simple;
	bh=gjI0fUmyL++ztkU3RT0DG6sSqd55wePs8GlTawqTNH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cTb1aysa85cgb9h7kSDTERdH4wyxlMHft7+GPU9E2K+XQ77vct3wmTXrw3gdG6I/IcVhP+ElcIGnuQYjRp5oqxQ2eVc1c0nBj73MtVhtaUOjcbq9brkzK7ei75A2EA633vms4D8YsAw3YCyqx5Np7qHfQatVMj27NQ7hNylYTlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LlJ4V0HW; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716839477; x=1748375477;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=gjI0fUmyL++ztkU3RT0DG6sSqd55wePs8GlTawqTNH8=;
  b=LlJ4V0HWWEHCizKTgDfISY/feIVIZgsCBk+gYuSQxdsoJFHLz8Qr6vvB
   VfiE6tzEqtc3rmK3qoi+LFi2YIhgErk/qq73hlc+ftyK5oaN9PCyZZMhf
   Xd8W/RVLOOQHxJZckxeBUxZthd9m9LTFYjXvxmxuIWjMYUzSPT6xeNUQg
   NcKeo/EKW3oc0ReRmULjklrft5DO0BtHRv9E3eby/fyicNCyiurdzVpGf
   MfBx9b4P2nbkNplZMtpN6qPaAGFWxJM1v6iGiK8PZpyTV/BA4XNbcPU7l
   1KMZMA6a6NmYpGxaoyVR46YNYZOZwI6g21k28/Fn+OCGK6WRBoUD93xKD
   w==;
X-CSE-ConnectionGUID: OHKXXTwTRN2d6o6CthXNvQ==
X-CSE-MsgGUID: AyFlXKpuR6yi/OyLM3x5JA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="23833931"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="23833931"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:51:17 -0700
X-CSE-ConnectionGUID: t4/htuC/T4aCyCIz0F2Vdw==
X-CSE-MsgGUID: jK71MdYyR/e75Zq/1ThO4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="34923504"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:51:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sBgNE-0000000BMEU-469s;
	Mon, 27 May 2024 22:51:12 +0300
Date: Mon, 27 May 2024 22:51:12 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Erik Schilling <erik.schilling@linaro.org>,
	Phil Howard <phil@gadgetoid.com>,
	Viresh Kumar <viresh.kumar@linaro.org>, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][RFC/RFT 06/18] bindings: glib: add examples
Message-ID: <ZlTkMNQ5OGyAgf8A@smile.fi.intel.com>
References: <20240412122804.109323-1-brgl@bgdev.pl>
 <20240412122804.109323-7-brgl@bgdev.pl>
 <Zif8qBoZq7I3Xrbb@smile.fi.intel.com>
 <CAMRc=Mdp1_faK8_1GmyJZanMCDpW_503fRFsigg39+XPoV4acQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mdp1_faK8_1GmyJZanMCDpW_503fRFsigg39+XPoV4acQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, May 24, 2024 at 08:22:05PM +0200, Bartosz Golaszewski wrote:
> On Tue, Apr 23, 2024 at 8:23 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Fri, Apr 12, 2024 at 02:27:52PM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

...

> > > +     ret = g_gpiod_line_request_set_value(data->request, data->line_offset,
> > > +                                          data->value, &err);
> > > +     if (!ret) {
> >
> > ret == 0 equals error?!
> 
> It returns gboolean where false means error. This is a pattern in GLib.

For booleans we have a pattern like

	if (bool_func(...))

to imply it.

	ret = int_func(...);
	if (ret) // if (!ret)

kinda implies int. Does Glib has that type of pattern?

> > > +             g_printerr("failed to set line value: %s\n", err->message);
> > > +             exit(EXIT_FAILURE);
> >
> > Don't you have something like err->code to propagate?
> 
> What for? err->message is the human-readable string of the error.

If somebody wants to parse this with a script?

-- 
With Best Regards,
Andy Shevchenko



