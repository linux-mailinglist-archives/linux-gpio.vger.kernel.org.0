Return-Path: <linux-gpio+bounces-5951-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AE78B7B4E
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Apr 2024 17:18:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2865280CF2
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Apr 2024 15:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0989716D9B6;
	Tue, 30 Apr 2024 15:17:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4579A14374B;
	Tue, 30 Apr 2024 15:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714490274; cv=none; b=psfzSfjpfMyjSezZACu4CNjVP1PeQ2oFfBVzDupdzUAd50seqSoD3g1zMGRx7WQLB3ir7zt4hqE1Cc0uuTBreSRXts9MsYb6T6qpC4izRYJKggzumbLIES0Xvx9oiJkx2S+w3JqyK/GOknNneqhyxW1khezpeN7vQeIbgfsiRs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714490274; c=relaxed/simple;
	bh=hfwCkwjPcU8cN7z5dqeh+y23jTb8DWvjNhtN8qkepwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nCAYwb9cNN7+vj7ICIZKAjo+sv+TSLT/hkSk4coqLv5wpVyomtABVWRVzNPbC8e4/u6b/7ItSlSEERL63XSH0aNz0+3+7lyjwSeK8a50NUQlk19nu5rUli00AAoko+Xxt4JN7s/LTeYlGq8vScif+rm8TT6+FJwIhxl9QUagenw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
X-CSE-ConnectionGUID: Xmj6mZUhQgCSGml27egZgA==
X-CSE-MsgGUID: R4VfQOo+RBekbSYuxF0x9A==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="13997565"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; 
   d="scan'208";a="13997565"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 08:17:52 -0700
X-CSE-ConnectionGUID: G1Vsk4kTRDGDBosz8shwAA==
X-CSE-MsgGUID: fmqUP9TbSnOUcSyrzZVqVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; 
   d="scan'208";a="26904672"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 08:17:49 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1s1pEn-00000002hj1-2C7p;
	Tue, 30 Apr 2024 18:17:45 +0300
Date: Tue, 30 Apr 2024 18:17:45 +0300
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
Subject: Re: [PATCH v8 2/9] platform: cznic: Add preliminary support for
 Turris Omnia MCU
Message-ID: <ZjELmaD3aQEuEa5K@smile.fi.intel.com>
References: <20240430115111.3453-1-kabel@kernel.org>
 <20240430115111.3453-3-kabel@kernel.org>
 <CAHp75VcgfvyZ9rcNev9CpQEN3CkUVozEkv+ycaQggPbE4tx+1Q@mail.gmail.com>
 <20240430160507.45f1f098@dellmb>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240430160507.45f1f098@dellmb>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 30, 2024 at 04:05:07PM +0200, Marek Behún wrote:
> On Tue, 30 Apr 2024 15:53:51 +0300
> Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Tue, Apr 30, 2024 at 2:51 PM Marek Behún <kabel@kernel.org> wrote:

...

> > > +static int omnia_get_version_hash(struct omnia_mcu *mcu, bool bootloader,
> > > +                                 u8 version[static OMNIA_FW_VERSION_HEX_LEN])
> > 
> > Interesting format of the last parameter. Does it make any difference
> > to the compiler if you use u8 *version?
> 
> The compiler will warn if an array with not enough space is passed as
> argument.

Really?

> > > +{
> > > +       u8 reply[OMNIA_FW_VERSION_LEN];
> > > +       int err;
> > > +
> > > +       err = omnia_cmd_read(mcu->client,
> > > +                            bootloader ? CMD_GET_FW_VERSION_BOOT
> > > +                                       : CMD_GET_FW_VERSION_APP,
> > > +                            reply, sizeof(reply));
> > > +       if (err)
> > > +               return err;  
> > 
> > > +       version[OMNIA_FW_VERSION_HEX_LEN - 1] = '\0';
> > > +       bin2hex(version, reply, OMNIA_FW_VERSION_LEN);  
> > 
> > Hmm... I would rather use returned value
> > 
> > char *p;
> > 
> > p = bin2hex(...);
> > *p = '\0';
> > 
> > return 0;
> 
> OK. I guess
> 
>   *bin2hex(version, reply, OMNIA_FW_VERSION_LEN) = '\0';
> 
> would be too crazy, right?

Yes, it's not a Python :-)

> > > +       return 0;
> > > +}  

...

> > > +               dev_err(dev, "Cannot read MCU %s firmware version: %d\n", type,
> > > +                       err);  
> > 
> > One  line?
> 
> I'd like to keep this driver to 80 columns.

Then better to have a logical split then?

			dev_err(dev, "Cannot read MCU %s firmware version: %d\n",
				type, err);

...

> > > +               omnia_info_missing_feature(dev, "feature reading");  
> > 
> > Tautology. Read the final message. I believe you wanted to pass just
> > "reading" here.
> 
> No, I actually wanted it to print
>   Your board's MCU firmware does not support the feature reading
>   feature.
> as in the feature "feature reading" is not supported.
> I guess I could change it to
>   Your board's MCU firmware does not support the feature reading.
> but that would complicate the code: either I would need to add
> " feature" suffix to all the features[].name, or duplicate the
> info string from the omnia_info_missing_feature() function.

From point of a mere user (as I am towards this driver) I consider
the tautology confusing.

	...the 'reading' feature

may be a good compromise.

...

> > > +       memcpy(mcu->board_first_mac, &reply[9], ETH_ALEN);  
> > 
> > There is an API ether_copy_addr() or so, don't remember by heart.
> > You also need an include for ETH_ALEN definition.
> 
> Doc for ether_addr_copy says:
>   Please note: dst & src must both be aligned to u16.
> since the code does:
>   u16 *a = (u16 *)dst;
>   const u16 *b = (const u16 *)src;
> 
>   a[0] = b[0];
>   a[1] = b[1];
>   a[2] = b[2]
> 
> Since I am copying from &reply[9], which is not u16-aligned, this won't
> work.

It would work on architectures that support misaligned accesses, but in general
you are right. Perhaps a comment on top to avoid "cleanup" patches like this?

...

> > > +enum omnia_ctl_byte_e {
> > > +       CTL_LIGHT_RST           = BIT(0),
> > > +       CTL_HARD_RST            = BIT(1),
> > > +       /* BIT(2) is currently reserved */
> > > +       CTL_USB30_PWRON         = BIT(3),
> > > +       CTL_USB31_PWRON         = BIT(4),
> > > +       CTL_ENABLE_4V5          = BIT(5),
> > > +       CTL_BUTTON_MODE         = BIT(6),
> > > +       CTL_BOOTLOADER          = BIT(7)  
> > 
> > Keep trailing comma as it might be extended (theoretically). And you
> > do the similar in other enums anyway.
> 
> ctl_byt is 8-bit, so this enum really can't be extended.

I understand that (even before writing the previous reply).

> In fact I need
> to drop the last comma from omnia_ext_sts_dword_e and omnia_int_e.

Who prevents from having in a new firmware let's say

 BIT(31) | BIT(1)

as a new value?

From Linux perspective these are not terminating lines.

-- 
With Best Regards,
Andy Shevchenko



