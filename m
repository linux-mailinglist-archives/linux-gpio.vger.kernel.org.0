Return-Path: <linux-gpio+bounces-6300-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A689D8C281A
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 17:44:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C45528312D
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 15:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01394172763;
	Fri, 10 May 2024 15:44:32 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5BF171657;
	Fri, 10 May 2024 15:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715355871; cv=none; b=k+/03CDYmGEo20+LAZ6hoR8mWgyDocjg5mAsFK4+4A9E//2OZzQP/0uu6V0yRybYyzdQDhs4NzP8AW1wTyPwbMA1RCX5fk2xmjvzAZcjJNisrp7tbYvx4yYUBkz+Mwqvghgjv3hWBsQfyz/an/mqKTlyg7t+eFdzUqhgc2EvztM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715355871; c=relaxed/simple;
	bh=a/+7r1DFyfr6biTbFWHHIWfRzKDpLn+3QlJZv2BY4UE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pNIio7lgeWXE+jLaFpKFIZKt7gwi2Rw+p/l0/+kvR34uAlruz7LGPQb/5pLA5Wh6dwN5MLexbpnTlRfMq8wKllEGtGF18yJ9ju5p7eKnqqwCdSqCX7gYrLpyuGmeWh773HTsapwI16wnCqp/nc+P4XAlPxZ75y2z8VjDU4t5/BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
X-CSE-ConnectionGUID: xOqRiDVnSgC5YlEHSDx5Ww==
X-CSE-MsgGUID: xHkAJ3zKRV6BbpfzMDlwrw==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="28827417"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="28827417"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 08:44:30 -0700
X-CSE-ConnectionGUID: h1YPf0ejRC+t5782D2zuPg==
X-CSE-MsgGUID: 9IoXcfQ8SiSQ5S13wD4zPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="29760828"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 08:44:26 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1s5SQ2-000000069NR-1xrl;
	Fri, 10 May 2024 18:44:22 +0300
Date: Fri, 10 May 2024 18:44:22 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v10 2/9] platform: cznic: Add preliminary support for
 Turris Omnia MCU
Message-ID: <Zj5A1qoH-aWbT3XU@smile.fi.intel.com>
References: <20240510101819.13551-1-kabel@kernel.org>
 <20240510101819.13551-3-kabel@kernel.org>
 <CAHp75VfdSqRbhek3eCPtdPtrv2FJyhpG0XvKFMfT9yrDsCjY2Q@mail.gmail.com>
 <20240510153629.bd3gkfm4he2rybui@kandell>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240510153629.bd3gkfm4he2rybui@kandell>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, May 10, 2024 at 05:36:29PM +0200, Marek Behún wrote:
> On Fri, May 10, 2024 at 04:41:20PM +0300, Andy Shevchenko wrote:
> > On Fri, May 10, 2024 at 1:18 PM Marek Behún <kabel@kernel.org> wrote:

...

> > > +       err = omnia_cmd_read(client, cmd, &reply, sizeof(reply));
> > > +       if (!err)
> > > +               *dst = le32_to_cpu(reply);
> > > +
> > > +       return err;
> > 
> > Introduced here and "fixed" in the next patch. Something wrong with
> > rebasing / squashing?
> > 
> > You will need a v11 anyway. And you have now much more time for it,
> > don't forget to update the kernel version and date in the ABI
> > documentation.
> 
> It would seem so. I will send v11 also with the GPIO changes (to use
> __set_bit() and friends).

I hope it will make v6.11.

-- 
With Best Regards,
Andy Shevchenko



