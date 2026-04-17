Return-Path: <linux-gpio+bounces-35206-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CXmM87U4WnQyQAAu9opvQ
	(envelope-from <linux-gpio+bounces-35206-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2026 08:35:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F4441777E
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2026 08:35:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DC7A030B75F8
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2026 06:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3104031B83B;
	Fri, 17 Apr 2026 06:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mjZABKtr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536042DB79E;
	Fri, 17 Apr 2026 06:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776407723; cv=none; b=CZoeIPVslZlYvG6p0kxJsReOFs2IMPowe6LuiUBPBZuj/J1tnYit44ppq+dXVYXz7++q57VchZGggKCzrK2LLLKz9Wt8oR8ljh9rCUWZn28kH2p8GsCGQe57tdl6AQqwaQQwwCUSE98Se1RZExTZeWsZxObUkDucyYGUfDPy1u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776407723; c=relaxed/simple;
	bh=FZVuPVFR0V8fBBWIA2H5GECKnMRT1zPbHEZi5F4E0XA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c4o0PUn94+TUXhzXuN6s8MOsXwOPN9WvEaEKUGAp1hyYd+sZMinqsgT/ELDlJ+O00Rgocg4kohVIc3V+c8yRrAjbHErVYTe9jz4hwAYQFe+4jTIuESmaKaCDMtz+B9h+7cI96FZOSK3dat7/syTVWaoMwCUucusBju4FPIRT0Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mjZABKtr; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776407721; x=1807943721;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=FZVuPVFR0V8fBBWIA2H5GECKnMRT1zPbHEZi5F4E0XA=;
  b=mjZABKtrG5jzeZKYftY6UhkaSOcja/E2vK2lSZfnePSZfDXVgN0knbpT
   Me0q3IdRHnf1QXQpN3MuoUSaCTGZKQaUm7FTI7gyKV0UwwA5alQNBnrT2
   k+y6YOXviJ8/PIrD9UNYOjj3ZTQAb04baQFrixnXnLfRdq/hJIVkPJs2K
   J1qwjI1QP5+8rYEyWpHzsKvj4DVq4sd5LosfOY21KXqQPFusw7t+yzUoj
   jvpwbBw+pvAYOkO4kt5gOAeX6ipgm45PjZddnfw9FILzhEQ1BIbpphvQW
   ZDUvxV3zXve4G1Lc0zNslui3AD/+bwRmNQMvb94KsJRLI3tysA4ia6bjb
   g==;
X-CSE-ConnectionGUID: cqoanP7gRleFMJuQRh5v+Q==
X-CSE-MsgGUID: cquwl0k3SCK0PZJ6ivOELw==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="81298687"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="81298687"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 23:35:21 -0700
X-CSE-ConnectionGUID: FfaqMCLqRfWJdEIHn4mXwA==
X-CSE-MsgGUID: P8pC7coxRmCg/syrDlqKrA==
X-ExtLoop1: 1
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.78])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 23:35:17 -0700
Date: Fri, 17 Apr 2026 09:35:14 +0300
From: "andriy.shevchenko@intel.com" <andriy.shevchenko@intel.com>
To: Deep Pani <Deep.Pani@mediatek.com>
Cc: Fred-WY Chen =?utf-8?B?KOmZs+WogeWuhyk=?= <Fred-WY.Chen@mediatek.com>,
	Lei Xue =?utf-8?B?KOiWm+ejiik=?= <Lei.Xue@mediatek.com>,
	Mandeep S <Mandeep.S@mediatek.com>,
	Qingliang Li =?utf-8?B?KOm7juaZtOS6rik=?= <Qingliang.Li@mediatek.com>,
	"sean.wang@kernel.org" <sean.wang@kernel.org>,
	Yaoy Wang =?utf-8?B?KOeOi+eRtueRtik=?= <ot_yaoy.wang@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yong Mao =?utf-8?B?KOavm+WLhyk=?= <yong.mao@mediatek.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	Cathy Xu =?utf-8?B?KOiuuOWNjuWptyk=?= <ot_cathy.xu@mediatek.com>,
	Shunxi Zhang =?utf-8?B?KOeroOmhuuWWnCk=?= <ot_shunxi.zhang@mediatek.com>,
	Ye Wang =?utf-8?B?KOeOi+WPtik=?= <ot_ye.wang@mediatek.com>
Subject: Re: [PATCH 1/3] pinctrl: mediatek: Add gpio-range record in pinctrl
 driver
Message-ID: <aeHUog7MXCdtEImh@ashevche-desk.local>
References: <20251125023639.2416546-1-lei.xue@mediatek.com>
 <20251125023639.2416546-2-lei.xue@mediatek.com>
 <aSdBt937C6Cjj_8s@black.igk.intel.com>
 <cbb135cbd2c6255537fb55e35c39fc5529e7de78.camel@mediatek.com>
 <9e802950ae47071bb34bb373419dc89c9add9d0b.camel@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9e802950ae47071bb34bb373419dc89c9add9d0b.camel@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	FROM_DN_EQ_ADDR(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35206-lists,linux-gpio=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[mediatek.com,kernel.org,collabora.com,vger.kernel.org,linaro.org,lists.infradead.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: 61F4441777E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 01:33:09PM +0000, Deep Pani wrote:
> Hi Andy,
> 
> You mean gpiochip_add_pin_range(), correct?
> 
> IIRC, that adds to gpiochip's range, not the range we are using for our
> pinctrl driver. 
> 
> The range we are utilizing inside our hardware is of the type struct
> pinctrl_gpio_range. There is no callback in gpiochip that handles this
> type of range

I see, thanks for elaboration.

> I also recall that gpiochip_add_data() doesn't initialize the hw but
> rather initializes the gpiochip from the hw data we will provide in
> mtk_build_gpiochip().

It does for IRQ if one specifies an IRQ chip.

> Thus  we need a function which will help
> initialize the pinctrl_gpio_range inside our pinctrl driver structure.
> This is why we make the mtk_pinctrl_gpio_range_init function here.

But this sounds like the solution from other end of a stick.
OTOH there are a few drivers that use this approach.

> For the second question, we are keeping it because before ACPI is
> invoked we still need some other pins to be configured, especially if
> different pins have different styles of pull configuration. The method
> we use is to define those configurations in the pinctrl-mt8901.c file
> which determines the gpio ranges and maps pinctrl device to acpi, one
> set of gpio ranges per configuration, for different type of pull
> configurations we have different gpio ranges, this callback helps add
> them into the pinctrl subsystem such that other device maintainers can
> easily leverage that subsystem to add their resources in their _CRS
> calls using the common interfaces. 
> 
> Thus we need to keep both the functions.

OK.

> On Thu, 2026-03-26 at 12:33 +0000, Fred-WY Chen (陳威宇) wrote:
> > On Wed, 2025-11-26 at 19:06 +0100, Andy Shevchenko wrote:
> > > 
> > > External email : Please do not click links or open attachments
> > > until
> > > you have verified the sender or the content.

Please, get rid of this header, it's not compatible with OSS development
process.

> > > On Tue, Nov 25, 2025 at 10:36:34AM +0800, Lei Xue wrote:
> > > > Kernel GPIO subsystem mapping hardware pin number to a different
> > > > range of gpio number. Add gpio-range structure to hold
> > > > the mapped gpio range in pinctrl driver. That enables the kernel
> > > > to search a range of mapped gpio range against a pinctrl device.
> > > 
> > > ...
> > > 
> > > >  static int mtk_build_gpiochip(struct mtk_pinctrl *hw)
> > > >  {
> > > >       struct gpio_chip *chip = &hw->chip;
> > > 
> > > >       if (ret < 0)
> > > >               return ret;
> > > > 
> > > > +     mtk_pinctrl_gpio_range_init(hw, chip);
> > > > +
> > > >       return 0;
> > > 
> > > We have a callback for that in struct gpio_chip. Any reason not to
> > > use it?
> > > 
> > > >  }
> > > 
> > > ...
> > > 
> > > > +     pinctrl_add_gpio_range(hw->pctrl, &hw->range);
> > > 
> > > Not sure if this is needed.
> > 
> > Could you please check this and feedback?

-- 
With Best Regards,
Andy Shevchenko



