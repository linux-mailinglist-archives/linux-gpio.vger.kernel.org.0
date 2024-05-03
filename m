Return-Path: <linux-gpio+bounces-6080-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F418BB1DA
	for <lists+linux-gpio@lfdr.de>; Fri,  3 May 2024 19:33:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D78B1F2184B
	for <lists+linux-gpio@lfdr.de>; Fri,  3 May 2024 17:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79E08157E98;
	Fri,  3 May 2024 17:33:33 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2718BA55
	for <linux-gpio@vger.kernel.org>; Fri,  3 May 2024 17:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714757613; cv=none; b=dKTizryIb9P6rCj4dJgA/wQ8vEW2gbL7bgyFJ9db5HhVHkTs05icHTCW5ZKbdiMIUAxWkk7Fhw2w9vtgotgXcZsgU929xHTtPiNsJuBXtKwQNLb7TSHMwpHy4W2dw3d/aBuP0zx7VXXXVUWdY6TSMIlulIfQaCQMhkfwOeWVSh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714757613; c=relaxed/simple;
	bh=aruAahFQv70dEvddGp5OXOWym1rGEc2zGLhd90bHSkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k8bU0QHDDOde61FpXGzxL0RsIdQh1QkiL1CyTlF9z8CVbuYUm6tm122OolfYFRPdj6bLDdQv6MgJPM/2o2iY2VHX+5CjbEQWaFKCDl7d6bMyKV7fvIKLeAljZnnfsVwBeX9yARteu3CnxqdPzkDi+djWmYa8oSZplsaHJmVGezM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
X-CSE-ConnectionGUID: R8w9KGlPQ2Gm83Iq1jRVCg==
X-CSE-MsgGUID: yfLw0DVAQOWeScKwbeqgXw==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="21983384"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="21983384"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 10:33:31 -0700
X-CSE-ConnectionGUID: aui29yz/Qg24JUuKZRvnfg==
X-CSE-MsgGUID: pz+GJqOtTvGvaTK7xCp82w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="32006610"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 10:33:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1s2wmj-00000003iyg-3sZy;
	Fri, 03 May 2024 20:33:25 +0300
Date: Fri, 3 May 2024 20:33:25 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v8 3/9] platform: cznic: turris-omnia-mcu: Add support
 for MCU connected GPIOs
Message-ID: <ZjUf5TDbgRxbkYSv@smile.fi.intel.com>
References: <20240430115111.3453-1-kabel@kernel.org>
 <20240430115111.3453-4-kabel@kernel.org>
 <CAHp75VdV_JmbS1pM11Pf8S5vWU8X1FrKpw3aAtTHK0tsLua5fg@mail.gmail.com>
 <20240503084306.klwzn67drsidq6l6@kandell>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240503084306.klwzn67drsidq6l6@kandell>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, May 03, 2024 at 10:43:06AM +0200, Marek Behún wrote:
> On Fri, May 03, 2024 at 07:05:34AM +0300, Andy Shevchenko wrote:

...

> > > +       err = omnia_cmd_read(client, cmd, &reply, (__fls(bits) >> 3) + 1);
> > 
> > Perhaps a helper for this (__fls(x) >> 3 + (y)) ? It seems it's used
> > in a few places.
> 
> It is used 3 times:
>   rlen = ((__fls(rising) >> 3) << 1) + 1;
>   flen = ((__fls(falling) >> 3) << 1) + 2;
>   err = omnia_cmd_read(client, cmd, &reply, (__fls(bits) >> 3) + 1);
> 
> The last one is not compatible with the first two (because of the "<< 1").
> 
> The first two instances are contained within a function that is dedicated
> to "computing needed reply length".
> 
> I could probably do something like
> 
>   static inline unsigned int
>   omnia_compute_reply_len(uin32_t mask, bool interleaved, unsigned int offset)
>   {
>           return ((__fls(mask) >> 3) << interleaved) + 1 + offset;
>   }
> 
> Then the 3 instances would become
> 
>   rlen = omnia_compute_reply_len(rising, true, 0);
>   flen = omnia_compute_reply_len(falling, true, 1);
>   err = omnia_cmd_read(client, cmd, &reply,
>                        omnia_compute_reply_len(bits, false, 0));
> 
> What do you think?

Fine, but think about these bit operations, I believe it can be optimised.

-- 
With Best Regards,
Andy Shevchenko



