Return-Path: <linux-gpio+bounces-6081-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3A28BB379
	for <lists+linux-gpio@lfdr.de>; Fri,  3 May 2024 20:51:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E13CC1C2261F
	for <lists+linux-gpio@lfdr.de>; Fri,  3 May 2024 18:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65A5B12F38E;
	Fri,  3 May 2024 18:51:26 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E7A1CD1F
	for <linux-gpio@vger.kernel.org>; Fri,  3 May 2024 18:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714762286; cv=none; b=GBx9LnZjouDi7sZBF1+h9c/7cgj1FBolfNlISonfqSwiyJyhWI3ftTVuz5vVqhyk4az2eDpIYYEeP739J9CJbSHPJIRBhKMlJJd/hO5s+VYafFBw8Wc/4K81pytO3AAR+M4bccWTzxMqaKqNUeZUWnLUN+2lEvvcEFKMsnxY5xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714762286; c=relaxed/simple;
	bh=m12Xeg+g5b80YHIclpzkcCPZdgWcaI3dueu1TEdXHbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dYDwi2cQCRRbXDCclln/rE4qLdZyyQssTj+fYrZ+SjLdRHryT7GNfkTtbBF+jvQlc4aZ0Qp9ub7fHqvPEEkJwQPXJgp0gSiwgrVHZYpRZ904g0JkYntiVpUjW/gVQY2NzGB83WNXzK27dWJIfG/yqM6wb8AmINKwlTBLlf8BLkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
X-CSE-ConnectionGUID: yaIvb5DNS1Sykd4wmFjBJQ==
X-CSE-MsgGUID: SoYKettySpClnZQkcsCDEA==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10509218"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="10509218"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 11:51:24 -0700
X-CSE-ConnectionGUID: dKRrv1NhT6yZxBQ0JzrGLw==
X-CSE-MsgGUID: 5l4OOg/JTamZ8TdErJJ1lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="32333518"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 11:51:21 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1s2y06-00000003kTF-0t5s;
	Fri, 03 May 2024 21:51:18 +0300
Date: Fri, 3 May 2024 21:51:17 +0300
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
Message-ID: <ZjUyJSuGthKH0q4q@smile.fi.intel.com>
References: <20240430115111.3453-1-kabel@kernel.org>
 <20240430115111.3453-4-kabel@kernel.org>
 <CAHp75VdV_JmbS1pM11Pf8S5vWU8X1FrKpw3aAtTHK0tsLua5fg@mail.gmail.com>
 <20240503082714.ow5qtqu2myi3z2ug@kandell>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240503082714.ow5qtqu2myi3z2ug@kandell>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, May 03, 2024 at 10:28:17AM +0200, Marek Behún wrote:
> On Fri, May 03, 2024 at 07:05:34AM +0300, Andy Shevchenko wrote:
> > On Tue, Apr 30, 2024 at 2:51 PM Marek Behún <kabel@kernel.org> wrote:

...

> > > +static const char * const omnia_mcu_gpio_templates[64] = {
> > > +       /* GPIOs with value read from the 16-bit wide status */
> > > +       [4]  = "gpio%u.MiniPCIe0 Card Detect",
> > > +       [5]  = "gpio%u.MiniPCIe0 mSATA Indicator",
> > > +       [6]  = "gpio%u.Front USB3 port over-current",
> > > +       [7]  = "gpio%u.Rear USB3 port over-current",
> > > +       [8]  = "gpio%u.Front USB3 port power",
> > > +       [9]  = "gpio%u.Rear USB3 port power",
> > > +       [12] = "gpio%u.Front Button",
> > > +
> > > +       /* GPIOs with value read from the 32-bit wide extended status */
> > > +       [16] = "gpio%u.SFP nDET",
> > > +       [28] = "gpio%u.MiniPCIe0 LED",
> > > +       [29] = "gpio%u.MiniPCIe1 LED",
> > > +       [30] = "gpio%u.MiniPCIe2 LED",
> > > +       [31] = "gpio%u.MiniPCIe0 PAN LED",
> > > +       [32] = "gpio%u.MiniPCIe1 PAN LED",
> > > +       [33] = "gpio%u.MiniPCIe2 PAN LED",
> > > +       [34] = "gpio%u.WAN PHY LED0",
> > > +       [35] = "gpio%u.WAN PHY LED1",
> > > +       [36] = "gpio%u.LAN switch p0 LED0",
> > > +       [37] = "gpio%u.LAN switch p0 LED1",
> > > +       [38] = "gpio%u.LAN switch p1 LED0",
> > > +       [39] = "gpio%u.LAN switch p1 LED1",
> > > +       [40] = "gpio%u.LAN switch p2 LED0",
> > > +       [41] = "gpio%u.LAN switch p2 LED1",
> > > +       [42] = "gpio%u.LAN switch p3 LED0",
> > > +       [43] = "gpio%u.LAN switch p3 LED1",
> > > +       [44] = "gpio%u.LAN switch p4 LED0",
> > > +       [45] = "gpio%u.LAN switch p4 LED1",
> > > +       [46] = "gpio%u.LAN switch p5 LED0",
> > > +       [47] = "gpio%u.LAN switch p5 LED1",
> > > +
> > > +       /* GPIOs with value read from the 16-bit wide extended control status */
> > > +       [48] = "gpio%u.eMMC nRESET",
> > > +       [49] = "gpio%u.LAN switch nRESET",
> > > +       [50] = "gpio%u.WAN PHY nRESET",
> > > +       [51] = "gpio%u.MiniPCIe0 nPERST",
> > > +       [52] = "gpio%u.MiniPCIe1 nPERST",
> > > +       [53] = "gpio%u.MiniPCIe2 nPERST",
> > > +       [54] = "gpio%u.WAN PHY SFP mux",
> > > +};
> > 
> > You may reduce the memory footprint of these just by doing "gpio%u."
> > part(s) outside. Here compiler won't compress this (as in the case of
> > repetitive string literals),
> 
> Are you saying that I should dynamically create another array just to
> pass it to the gpiochip's names pointer?

I have looked into this again and now I'm puzzled how you tested this.
To me it seems that those gpio%u will go as a fixed string to the user space,
there is no %u --> number substitution happens. Moreover, this data anyway
is redundant. Userspace and debugfs all have line numbers being printed.

...

> > > +       for_each_set_bit(i, mask, ARRAY_SIZE(omnia_gpios)) {
> > > +               if (omnia_gpios[i].cmd == CMD_GET_STATUS_WORD)
> > > +                       __assign_bit(i, bits, sts_bits & omnia_gpios[i].bit);
> > > +               else if (omnia_gpios[i].cmd == CMD_GET_EXT_STATUS_DWORD)
> > > +                       __assign_bit(i, bits, ext_sts_bits &
> > > +                                             omnia_gpios[i].bit);
> > 
> > One line?
> 
> That would be 81 columns, which I would like to avoid.

81?! It's fine! Even documentation allows that for the readability.

> I can remove the _bits suffix from these variables, though. What do you
> think?

Make sense as well.

> > > +               else if (omnia_gpios[i].cmd == CMD_GET_EXT_CONTROL_STATUS)
> > > +                       __assign_bit(i, bits, ext_ctl_bits &
> > > +                                             omnia_gpios[i].bit);
> > 
> > Ditto?
> > 
> > > +       }

-- 
With Best Regards,
Andy Shevchenko



