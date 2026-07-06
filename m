Return-Path: <linux-gpio+bounces-39487-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XKNVLgA7S2rWNwEAu9opvQ
	(envelope-from <linux-gpio+bounces-39487-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 07:20:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0734270C8D5
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 07:20:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=V8Bo7fPA;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39487-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39487-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D301300CE6D
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 05:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 487723B27C4;
	Mon,  6 Jul 2026 05:19:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677A13A9014
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 05:19:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783315190; cv=none; b=qOyWltgyGNTJKzltF0qngbvKLp3vyvjxDfnX8TcQlCjKNEOV46AXWf2/jLjK2NaB0enmtECmIKh4EntlA5b12eB4sOn3SBl3GY9cSUYoasv5Jp+EA4ZITLfoZq0ammNC9k6qP57GVg7Af0Cr+Xmcjsye1O8O+TG4CXfW6ZrFIF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783315190; c=relaxed/simple;
	bh=rbP5rYbfMvvr3FjKR7T/l14MdqyXwgubJ2557vWHm70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V/H67yQWqi2ge2bjis4XNY3k2j7rqDkeXQQEfEV1IVCdaoreWaLZqjADInOuQ5fjx6Bb6Ts+eq+TJeyU7rwVF+7FwLeJ1IN8TB5pVrca+1+B04JRgr+ydgTPzhJ/UyqObtPgtIUMr5QtMZImpg7r9Ph+FAx5gjg8kIw6CgUQIgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V8Bo7fPA; arc=none smtp.client-ip=198.175.65.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783315187; x=1814851187;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=rbP5rYbfMvvr3FjKR7T/l14MdqyXwgubJ2557vWHm70=;
  b=V8Bo7fPADGrEjggihl9fieQScooCcMiyXltb2pb49v9p7Ec4Ojx1XBS1
   /GFI5vGRfjbcua1LJ0xUSIi5x470nDSgG5f5/PY+pOuvHXzm7ZO+sqiVf
   gJc3jruRqrXImnfWu6RGzL4iLqovMlQV6GDw0DFAWl9ShJp7V+I1Sus4x
   SAHLvxWM4jidnteGHJUI4nEJSSSmQCvX2MPPIACOJraidJqWzJ1oFB8Xw
   WafHRGXhl1gfH3Wm7Or2Av+lA2GUSv47h8JKD7CGsdECXoWaYeheGTDO0
   mgmpQgo96uaYW89FHEN3mVsyg/cUA7uHCt7xal1x8uDb65ok1p+z7/1E+
   Q==;
X-CSE-ConnectionGUID: 917PrBcBSgS/Eot/2BcANQ==
X-CSE-MsgGUID: 7wBHQj4EQbCPEmxyEmxkrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="106736028"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="106736028"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 22:19:46 -0700
X-CSE-ConnectionGUID: jqiJuCQERpKgcM3Cs6lPDA==
X-CSE-MsgGUID: rOTP9gM7SGq08bIQD6OoSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="257942014"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.48])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 22:19:42 -0700
Date: Mon, 6 Jul 2026 08:19:40 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Xi Ruoyao <xry111@xry111.site>
Cc: Miao Wang <shankerwangmiao@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jianmin Lv <lvjianmin@loongson.cn>, WANG Xuerui <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-gpio@vger.kernel.org,
	Yinbo Zhu <zhuyinbo@loongson.cn>, Linus Walleij <linusw@kernel.org>,
	Hongchen Zhang <zhanghongchen@loongson.cn>,
	Liu Peibao <liupeibao@loongson.cn>,
	Juxin Gao <gaojuxin@loongson.cn>,
	Mika Westerberg <westeri@kernel.org>,
	Mingcong Bai <jeffbai@aosc.io>
Subject: Re: [PATCH RFC] gpio: loongson-64bit: Add back the support for
 gsi_idx_map
Message-ID: <aks67K3v2VNIkyRF@ashevche-desk.local>
References: <20260630-loongson-gpio-v1-1-576908831fa0@gmail.com>
 <CAMRc=MdtRj6c3Bg72QMaAEMPovNyUdqWL_qDPGb1p=Cu=cETvA@mail.gmail.com>
 <akOxdBR_-rOweHXB@ashevche-desk.local>
 <B77A4E49-774C-4DB2-9CA6-FFBE14F1EF94@gmail.com>
 <akTDj-YJjuDOBc0i@ashevche-desk.local>
 <A12FA264-0A0B-4CB3-BBCC-51380591F0E1@gmail.com>
 <akTRyQqXuSU6pl71@ashevche-desk.local>
 <AA7111AC-196F-41F7-A47B-E5118F7D26F2@gmail.com>
 <akThvlKr5MdbNloj@ashevche-desk.local>
 <73df1090f513777f3c0c4bfd1b9fc01f430ce9c3.camel@xry111.site>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <73df1090f513777f3c0c4bfd1b9fc01f430ce9c3.camel@xry111.site>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39487-lists,linux-gpio=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:xry111@xry111.site,m:shankerwangmiao@gmail.com,m:brgl@kernel.org,m:devnull+shankerwangmiao.gmail.com@kernel.org,m:chenhuacai@kernel.org,m:lvjianmin@loongson.cn,m:kernel@xen0n.name,m:jiaxun.yang@flygoat.com,m:linux-gpio@vger.kernel.org,m:zhuyinbo@loongson.cn,m:linusw@kernel.org,m:zhanghongchen@loongson.cn,m:liupeibao@loongson.cn,m:gaojuxin@loongson.cn,m:westeri@kernel.org,m:jeffbai@aosc.io,m:devnull@kernel.org,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,loongson.cn,xen0n.name,flygoat.com,vger.kernel.org,aosc.io];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,shankerwangmiao.gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,intel.com:email,intel.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0734270C8D5

On Mon, Jul 06, 2026 at 01:55:57AM +0800, Xi Ruoyao wrote:
> On Wed, 2026-07-01 at 12:45 +0300, Andy Shevchenko wrote:
> > On Wed, Jul 01, 2026 at 04:56:11PM +0800, Miao Wang wrote:
> > > > 2026年7月1日 16:37，Andy Shevchenko <andriy.shevchenko@linux.intel.com> 写道：
> > > > On Wed, Jul 01, 2026 at 04:07:43PM +0800, Miao Wang wrote:
> > > > > > 2026年7月1日 15:36，Andy Shevchenko <andriy.shevchenko@linux.intel.com> 写道：
> > > > > > On Tue, Jun 30, 2026 at 08:42:43PM +0800, Miao Wang wrote:
> > > > > > > > 2026年6月30日 20:07，Andy Shevchenko <andriy.shevchenko@linux.intel.com> 写道：
> > > > > > > > On Tue, Jun 30, 2026 at 07:45:52AM +0000, Bartosz Golaszewski wrote:
> > > > > > > > > On Mon, 29 Jun 2026 23:05:28 +0200, Miao Wang via B4 Relay
> > > > > > > > > <devnull+shankerwangmiao.gmail.com@kernel.org> said:

...

> > > > > > > > > > This patch adds back the support for gsi_idx_map, which is used in the
> > > > > > > > > > ACPI DSDT table to describe the mapping between the GPIO line number to
> > > > > > > > > > the index of the interrupt number in the declared interrupt resources.
> > > > > > > > > > 
> > > > > > > > > > This property was removed in Loongson CPU Universal Specification for
> > > > > > > > > > Interface Between PC/Server System Firmware and Kernel v4.1 in November,
> > > > > > > > > > 2023, but still in use in firmwares released this year. A sample of
> > > > > > > > > > an affected DSDT entry from a 3C6000 board I'm currently using is:
> > > > > > > > 
> > > > > > > > Oh my gosh, can somebody actually try to consult first with the Linux kernel
> > > > > > > > developers before adding non-standard and wrongly named properties, please?
> > > > > > > 
> > > > > > > Inferred from the time when gsi_idx_map was removed from the spec, I believe
> > > > > > > that the removal might be because the maintainers suggestion against introducing
> > > > > > > gsi_idx_map. However, the firmwares "in the wild" have not followed the change.
> > > > > > 
> > > > > > But what is the outcome of not using that mapping. Do you have something wrong
> > > > > > or not working?
> > > > > 
> > > > > Yes. As shown in the DSDT entry, when the mapping is given by the firmware, the
> > > > > number of given interrupts in _CRS does not equal to ngpios. In my example,
> > > > > ngpios is 32, but the number of interrupts given in _CRS is 8, and the request
> > > > > for irq on gpio lines whose number larger than 8 will fail with -ENXIO. To
> > > > > clarify, the entry is taken from the firmware I am currently using, and the
> > > > > firmware is released on February this year.
> > > > 
> > > > Right, so with the given example everything can be done without using the (now)
> > > > unspecified property. Do you have more examples of DSDT of these platforms?
> > > 
> > > Sorry, I only possess limited number of loongarch devices.

> > Yeah, we definitely need some input from Loongson people.

^^^^

> > > > > > > > > > Device (GPO1) {
> > > > > > > > > > Name (_HID, "LOON000F")
> > > > > > > > > > Name (_CRS, ResourceTemplate () {
> > > > > > > > > >  QWordMemory ( // Omitted, not related
> > > > > > > > > >  )
> > > > > > > > > >  Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, ) {
> > > > > > > > > >    0x00000010, 0x00000011, 0x00000012, 0x00000013,
> > > > > > > > > >    0x00000014, 0x00000015, 0x00000016, 0x00000017,
> > > > > > > > > >  }
> > > > > > > > > > Name (_DSD, Package (0x02) {
> > > > > > > > > >  ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301")
> > > > > > > > > >  Package (0x03) {
> > > > > > > > > >    Package (0x02) { "gpio_base", 0x50 } // Ignored by the driver
> > > > > > > > 
> > > > > > > > Yes, it's non-standard property. It's a broken one in terms of the style.
> > > > > > > > See DT binding documentation.
> > > > > > > 
> > > > > > > To clarify, I agree that this property should be redundant and ignored by
> > > > > > > the driver and global gpio numbers should be assigned dynamically by the
> > > > > > > kernel.
> > > > > > > 
> > > > > > > > > >    Package (0x02) { "ngpios", 0x20 }
> > > > > > > > > >    Package (0x02) { "gsi_idx_map", Package (0x20) {
> > > > > > > > > >      0, 1, 2, 3, 4, 5, 6, 7,
> > > > > > > > > >      0, 1, 2, 3, 4, 5, 6, 7,
> > > > > > > > > >      0, 1, 2, 3, 4, 5, 6, 7,
> > > > > > > > > >      0, 1, 2, 3, 4, 5, 6, 7,
> > > > > > > > > >    }}
> > > > > > > > > >  }
> > > > > > > > > > }
> > > > > > > > > > }
> > > > > > > > > > 
> > > > > > > > > > As can be seen in the DSDT entry, the mapping is essential for obtaining
> > > > > > > > > > the IRQ number from a GPIO line number. Otherwise, when IRQ is requested
> > > > > > > > > > for the line numbers largers than 7, it will fail with -ENXIO.
> > > > > > > > 
> > > > > > > > This doesn't look good. Why can't we simply hardcode the proper behaviour based
> > > > > > > > on the _HID? The gsi_idx_map seems quite regular and periodic, do you have some
> > > > > > > > other examples with different mapping?
> > > > > > > 
> > > > > > > According to the manual, the gpio controllers in HID LOON0007 and LOON000F are
> > > > > > > actually embedded into the CPU chip and the interrupt lines are hard wired so
> > > > > > > that all the gpio lines of the gpio controller share in total 8 irqs such that
> > > > > > > the i-th line is wired to the (i%8)-th irq. So the mapping for these two models
> > > > > > > are fixed. I have no idea about the behavior of other kinds of controllers, which
> > > > > > > should be answered by Loongson personales.
> > > > > > 
> > > > > > OK.
> > > > > > 
> > > > > > > So far, there are known to be 2 styles of DSDT entries. One is defined by
> > > > > > > the latest Firmware Spec, to list all the irq numbers in _CRS, e.g. Name (_CRS,
> > > > > > > ResourceTemplate () { Interrupt () { 0x10, 0x11, .., 0x17, 0x10, 0x11, ..., 0x17,
> > > > > > > ... (in total ngpios entries) } }). The other is defined by the previous Firmware
> > > > > > > spec, to use the property `gsi_idx_map` to map the gpio line number to the irq
> > > > > > > number listed in the ResourceTemplate. The former should now be compatible with
> > > > > > > the current implementation of the driver in the kernel, while the later not. I
> > > > > > > believe that although being abandoned by the spec, the later should also be
> > > > > > > considered and supported by the driver, since it is used by the firmwares in the
> > > > > > > wild.
> > > > > > 
> > > > > > This is clear. What's unclear is the necessity of adding this mapping. Is that
> > > > > > mapping shuffled in an arbitrary way?
> > > > > 
> > > > > According to the partial information I currently have, I don't think the mapping
> > > > > would shuffle arbitrarily.
> > > > > 
> > > > > > Second question, why one can't update firmware to fix this to follow the
> > > > > > specification? From above DSDT I do *not* see the need in this mapping.
> > > > > > Everything can be simply deducted from the number of Interrupt() resources
> > > > > > and ngpios at run-time without touching the property.
> > > > > 
> > > > > I have no idea why on the firmware side the spec was not followed for three
> > > > > years. When ignoring this mapping, there would be a problem if the number
> > > > > of given Interrupt() resources is less than ngpios. When this mapping is
> > > > > referred, there will be a ground truth for which irq number a gpio line
> > > > > belongs to. To be specific, suppose the number of Interrupt() resources
> > > > > is m and ngpios is n. In the current spec, where m equals to n, such ground
> > > > > truth also exists. However, when m is less than n and this mapping is
> > > > > ignored, the mapping will become ambiguous. Should the irq number be i%m
> > > > > for gpio line i, or i%8 and reject the irq requests when m is less than 8?
> 
> It's not true for the HID LOON000D (7A2000 GPIO controller) which is
> also handled by this driver.  In that controller, each of GPIO 0-3 has
> one dedicated IRQ line but the others GPIOs (4-55) share one IRQ line. 
> See https://github.com/AOSC-Tracking/linux/commit/31bd7e208e5b for how I
> worked it around downstream.  IIUC reading gsi_idx_map should resolve
> the issue for LOON000D as well.
> 
> We can also hard code i % 8 or MIN(i, 4) but then we'd need to check the
> HID.  I can live with either way.
> 
> But in either way I'd want to keep the big sticking-out warning, like
> "gsi_idx_map property is deprecated, consider upgrading your firmware"
> in this patch.  If we use the hard coded logic it can be "having
> Interrupt() resources less than ngpios is deprecated, consider upgrading
> your firmware."

But I am not sure it would work for the case you just described. I don't
remember if duplicates are allowed in the _CRS for the same device, id est
Interrupt(foo) repeated as many times as you need.

> Some vendors of Loongson-based board firmwares have a bad tendency to
> only issue a firmware update if the OEM pays them for some money like
> $100,000 and the OEMs are often reluctant to pay.  Loongson itself does
> things better: their own board products receive periodical firmware
> update for free.  But Loongson itself does not produce laptops so the
> laptops based on Loongson CPU often ships a firmware from such a rogue
> vendor, and if the laptop uses a I2C-HID touchpad it will not work
> without the LOON000D hack as HID-over-I2C have to use a GPIO as
> interrupt source.  Then the users cannot use the upstream kernel.
> 
> Yes we should try to punish the rouge vendors (maybe even changing the
> warning to "please avoid any product from this firmware vendor in the
> future":

We (Linux kernel) are grown from that type of nagging. The polite way is to
dev_warn(dev, FW_BUG) or similar. But this should be confirmed by Loongson.

> I do recommend the users to avoid one particular firmware
> vendor whenever I have to explain this issue to a frustrated user who
> just found the touchpad is not working).  But IMO we shouldn't banish
> the users to some "commercial" distros with downstream patches: we'd be
> actually "awarding" those rogue firmware vendors by pushing the users to
> a commercial solution, as the commerical distro vendors are likely
> affiliated with the rogue firmware vendors on the stock market.

Right.

So, let me state again, we need an input from Loongson on clarification on what
to do with the property. Because what I read from your reply is that property
must stay and specification update was a wrong move.

-- 
With Best Regards,
Andy Shevchenko



