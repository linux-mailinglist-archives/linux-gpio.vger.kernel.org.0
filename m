Return-Path: <linux-gpio+bounces-39286-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6va4H/zSRGrd1QoAu9opvQ
	(envelope-from <linux-gpio+bounces-39286-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 10:42:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0056EB378
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 10:42:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=TMR4Sr8s;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39286-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39286-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83ADD3035ABC
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 08:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BC1F3BB675;
	Wed,  1 Jul 2026 08:37:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9803B27EE
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 08:37:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782895057; cv=none; b=KWAR7pzd5jz40UQ9FtL7hZ02YLt68fSSMv7g7qx1Q/EPv5sbfjFyxpIwdR9BicqZ3qBBNy9fnuNO+Fu7rtFPBxRL5HIeeDzADZFdM410bay7OHhqIH95JYvwTyQqHUcvqnbssqYOBZQ2UHgxNEDNxxX7mPYLDORPSDZQH4v6wUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782895057; c=relaxed/simple;
	bh=ibr3trW046GTISZ4YZkUyEhaznvyzC8fo4nEv3VLwE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rM5TcJ5eTNsj5o7pKJGshbQVPwt3ARafsKCfMBno337BsxtT8LpmEuelM5L54NYOeFf4pQWxwp1JyXOwWgRdTWqE8/7KKArF8HQWy1Y2hfwaRZUrhtYU+VBPAs2beIAcLz1aTsgjHTKBNAE4DU8AbVEiEhrF20dNUIs7mn1IU+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TMR4Sr8s; arc=none smtp.client-ip=192.198.163.14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782895056; x=1814431056;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ibr3trW046GTISZ4YZkUyEhaznvyzC8fo4nEv3VLwE8=;
  b=TMR4Sr8sCWF6RzuTP4vj8g+3aamhvGVziqs/HyVGKO7GmXfoYKX+hJLV
   DhU/khx+9K7XX+Gws88avWwSV1aGD9okn/PwkqCuZ9qcPBVaC5jA8URjQ
   Z9wto4R0qreVOgtPwWpGGcJg/7LMDy4SnUk9lPEpMH2SOYT/Uq0ISFo5m
   eDYNk0MXNbBpxkd3rPZgirV52bgHWIbUQV8WDHVpKJ4nF5SvZVhREChFx
   lpo8T4R61kX0ZeDqSX2vfNEq+D+Vc+J6tnEsbKb5gLPrsZApqc1ZLWauw
   wdQThWVkmoKpjqsYwM4t1+qaJI/uTCOCRLxoHIEM3Sb/xJ9Jmj5LfgfMs
   w==;
X-CSE-ConnectionGUID: gIxRQPJRSS2aSnvkAAXpyw==
X-CSE-MsgGUID: F2WEHAAjT0+Ee0pRxZwMIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="83675598"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="83675598"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 01:37:35 -0700
X-CSE-ConnectionGUID: +WHNsPyuRW2rCqGpdow7jw==
X-CSE-MsgGUID: iGljcSSySMiAy+C0tvcCWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="290632996"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.65])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 01:37:32 -0700
Date: Wed, 1 Jul 2026 11:37:29 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Miao Wang <shankerwangmiao@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jianmin Lv <lvjianmin@loongson.cn>, WANG Xuerui <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-gpio@vger.kernel.org,
	Yinbo Zhu <zhuyinbo@loongson.cn>, Linus Walleij <linusw@kernel.org>,
	Hongchen Zhang <zhanghongchen@loongson.cn>,
	Liu Peibao <liupeibao@loongson.cn>,
	Juxin Gao <gaojuxin@loongson.cn>,
	Mika Westerberg <westeri@kernel.org>
Subject: Re: [PATCH RFC] gpio: loongson-64bit: Add back the support for
 gsi_idx_map
Message-ID: <akTRyQqXuSU6pl71@ashevche-desk.local>
References: <20260630-loongson-gpio-v1-1-576908831fa0@gmail.com>
 <CAMRc=MdtRj6c3Bg72QMaAEMPovNyUdqWL_qDPGb1p=Cu=cETvA@mail.gmail.com>
 <akOxdBR_-rOweHXB@ashevche-desk.local>
 <B77A4E49-774C-4DB2-9CA6-FFBE14F1EF94@gmail.com>
 <akTDj-YJjuDOBc0i@ashevche-desk.local>
 <A12FA264-0A0B-4CB3-BBCC-51380591F0E1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <A12FA264-0A0B-4CB3-BBCC-51380591F0E1@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-39286-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:shankerwangmiao@gmail.com,m:brgl@kernel.org,m:devnull+shankerwangmiao.gmail.com@kernel.org,m:chenhuacai@kernel.org,m:lvjianmin@loongson.cn,m:kernel@xen0n.name,m:jiaxun.yang@flygoat.com,m:linux-gpio@vger.kernel.org,m:zhuyinbo@loongson.cn,m:linusw@kernel.org,m:zhanghongchen@loongson.cn,m:liupeibao@loongson.cn,m:gaojuxin@loongson.cn,m:westeri@kernel.org,m:devnull@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,shankerwangmiao.gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,intel.com:email,vger.kernel.org:from_smtp,linux.intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CA0056EB378

On Wed, Jul 01, 2026 at 04:07:43PM +0800, Miao Wang wrote:
> > 2026年7月1日 15:36，Andy Shevchenko <andriy.shevchenko@linux.intel.com> 写道：
> > On Tue, Jun 30, 2026 at 08:42:43PM +0800, Miao Wang wrote:
> >>> 2026年6月30日 20:07，Andy Shevchenko <andriy.shevchenko@linux.intel.com> 写道：
> >>> On Tue, Jun 30, 2026 at 07:45:52AM +0000, Bartosz Golaszewski wrote:
> >>>> On Mon, 29 Jun 2026 23:05:28 +0200, Miao Wang via B4 Relay
> >>>> <devnull+shankerwangmiao.gmail.com@kernel.org> said:

...

> >>>>> This patch adds back the support for gsi_idx_map, which is used in the
> >>>>> ACPI DSDT table to describe the mapping between the GPIO line number to
> >>>>> the index of the interrupt number in the declared interrupt resources.
> >>>>> 
> >>>>> This property was removed in Loongson CPU Universal Specification for
> >>>>> Interface Between PC/Server System Firmware and Kernel v4.1 in November,
> >>>>> 2023, but still in use in firmwares released this year. A sample of
> >>>>> an affected DSDT entry from a 3C6000 board I'm currently using is:
> >>> 
> >>> Oh my gosh, can somebody actually try to consult first with the Linux kernel
> >>> developers before adding non-standard and wrongly named properties, please?
> >> 
> >> Inferred from the time when gsi_idx_map was removed from the spec, I believe
> >> that the removal might be because the maintainers suggestion against introducing
> >> gsi_idx_map. However, the firmwares "in the wild" have not followed the change.
> > 
> > But what is the outcome of not using that mapping. Do you have something wrong
> > or not working?
> 
> Yes. As shown in the DSDT entry, when the mapping is given by the firmware, the
> number of given interrupts in _CRS does not equal to ngpios. In my example,
> ngpios is 32, but the number of interrupts given in _CRS is 8, and the request
> for irq on gpio lines whose number larger than 8 will fail with -ENXIO. To
> clarify, the entry is taken from the firmware I am currently using, and the
> firmware is released on February this year.

Right, so with the given example everything can be done without using the (now)
unspecified property. Do you have more examples of DSDT of these platforms?

> >>>>> Device (GPO1) {
> >>>>> Name (_HID, "LOON000F")
> >>>>> Name (_CRS, ResourceTemplate () {
> >>>>>   QWordMemory ( // Omitted, not related
> >>>>>   )
> >>>>>   Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, ) {
> >>>>>     0x00000010, 0x00000011, 0x00000012, 0x00000013,
> >>>>>     0x00000014, 0x00000015, 0x00000016, 0x00000017,
> >>>>>   }
> >>>>> Name (_DSD, Package (0x02) {
> >>>>>   ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301")
> >>>>>   Package (0x03) {
> >>>>>     Package (0x02) { "gpio_base", 0x50 } // Ignored by the driver
> >>> 
> >>> Yes, it's non-standard property. It's a broken one in terms of the style.
> >>> See DT binding documentation.
> >> 
> >> To clarify, I agree that this property should be redundant and ignored by
> >> the driver and global gpio numbers should be assigned dynamically by the
> >> kernel.
> >> 
> >>>>>     Package (0x02) { "ngpios", 0x20 }
> >>>>>     Package (0x02) { "gsi_idx_map", Package (0x20) {
> >>>>>       0, 1, 2, 3, 4, 5, 6, 7,
> >>>>>       0, 1, 2, 3, 4, 5, 6, 7,
> >>>>>       0, 1, 2, 3, 4, 5, 6, 7,
> >>>>>       0, 1, 2, 3, 4, 5, 6, 7,
> >>>>>     }}
> >>>>>   }
> >>>>> }
> >>>>> }
> >>>>> 
> >>>>> As can be seen in the DSDT entry, the mapping is essential for obtaining
> >>>>> the IRQ number from a GPIO line number. Otherwise, when IRQ is requested
> >>>>> for the line numbers largers than 7, it will fail with -ENXIO.
> >>> 
> >>> This doesn't look good. Why can't we simply hardcode the proper behaviour based
> >>> on the _HID? The gsi_idx_map seems quite regular and periodic, do you have some
> >>> other examples with different mapping?
> >> 
> >> According to the manual, the gpio controllers in HID LOON0007 and LOON000F are
> >> actually embedded into the CPU chip and the interrupt lines are hard wired so
> >> that all the gpio lines of the gpio controller share in total 8 irqs such that
> >> the i-th line is wired to the (i%8)-th irq. So the mapping for these two models
> >> are fixed. I have no idea about the behavior of other kinds of controllers, which
> >> should be answered by Loongson personales.
> > 
> > OK.
> > 
> >> So far, there are known to be 2 styles of DSDT entries. One is defined by
> >> the latest Firmware Spec, to list all the irq numbers in _CRS, e.g. Name (_CRS,
> >> ResourceTemplate () { Interrupt () { 0x10, 0x11, .., 0x17, 0x10, 0x11, ..., 0x17,
> >> ... (in total ngpios entries) } }). The other is defined by the previous Firmware
> >> spec, to use the property `gsi_idx_map` to map the gpio line number to the irq
> >> number listed in the ResourceTemplate. The former should now be compatible with
> >> the current implementation of the driver in the kernel, while the later not. I
> >> believe that although being abandoned by the spec, the later should also be
> >> considered and supported by the driver, since it is used by the firmwares in the
> >> wild.
> > 
> > This is clear. What's unclear is the necessity of adding this mapping. Is that
> > mapping shuffled in an arbitrary way?
> 
> According to the partial information I currently have, I don't think the mapping
> would shuffle arbitrarily.
> 
> > Second question, why one can't update firmware to fix this to follow the
> > specification? From above DSDT I do *not* see the need in this mapping.
> > Everything can be simply deducted from the number of Interrupt() resources
> > and ngpios at run-time without touching the property.
> 
> I have no idea why on the firmware side the spec was not followed for three
> years. When ignoring this mapping, there would be a problem if the number
> of given Interrupt() resources is less than ngpios. When this mapping is
> referred, there will be a ground truth for which irq number a gpio line
> belongs to. To be specific, suppose the number of Interrupt() resources
> is m and ngpios is n. In the current spec, where m equals to n, such ground
> truth also exists. However, when m is less than n and this mapping is
> ignored, the mapping will become ambiguous. Should the irq number be i%m
> for gpio line i, or i%8 and reject the irq requests when m is less than 8?

My suggestion is to restore the logic in the code for the above-like mappings.

You count Interrupt() resources, you have 'ngpios' property. Now, when you
do need to map an IRQ line, you simply do it in a way of

	IRQ line % amount of Interrupt() resources

It will give you the same without reading that property. I believe that's why
the specification removed the need, because in this case it's not needed and
may be easily derived from the existing information.

Can somebody from Loongson shed a light on what's going on here?

-- 
With Best Regards,
Andy Shevchenko



