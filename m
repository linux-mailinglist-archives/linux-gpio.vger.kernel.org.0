Return-Path: <linux-gpio+bounces-39275-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ra/kIyjFRGqi0goAu9opvQ
	(envelope-from <linux-gpio+bounces-39275-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 09:43:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9066EACB9
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 09:43:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b="mhrn/KN3";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39275-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39275-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F3D8330273B4
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 07:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E5213C061F;
	Wed,  1 Jul 2026 07:37:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A9E3BB675
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 07:37:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782891424; cv=none; b=bPlJRu3dtLQFVOv5ijbmFJIjzRIrte24ngyq9QPFbIn/xtSH4Au0+wwnPEXvFMfTDK5oSl63yWbFjI5uE45usErvRY4mK8mCsmZZRHMwasM5uQhn1o384iL+eXvEZjP+G5Q1jOJpVMWcnFleT7Gr5+3IzDY3ZwsYeXOQmWZtk0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782891424; c=relaxed/simple;
	bh=O8sAXPsLeWIj+Zf+Cv6htz22VypJij/uGHXjf62DrWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ncRUjwSDF1h0NV9HMBGb5vbUEkHvV4b+YXICYotJH89cFR6lWe7UHU/6bvZU6XQ2ri8x2BVebIN6E9Rk3Q+3h8n7akwYUt+Np+c8tXSSbr0vhMJM4m6fPt2HLU+IExArmpRsiNNivta0dJG2xXDd/4OnqjHp/EJOsNWCvhYtvdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mhrn/KN3; arc=none smtp.client-ip=192.198.163.8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782891422; x=1814427422;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=O8sAXPsLeWIj+Zf+Cv6htz22VypJij/uGHXjf62DrWY=;
  b=mhrn/KN3JkZ5aUAlpBftnC8FZ5F0sZzRwmmbX7MXMLbrsc6i/n+aycAS
   w5EgtWNPVS3wIcvlligI2Of2K/ws8Q+lRL3XvRRD8Rx8x0PPA4PmqvrnV
   ABGU9sra785/WCUzdzH+SLnCaSSzabiD0Mfqk59wjIDhldsvlbq8Qab+y
   B38Qeu9xaBhWS5m4i4vLNkK5GvB0Kq5OEfUKICYZSzt/zEYrsFzNKyK1O
   1vJ0k1UPqGQHq8EiW+YmVvOZ9MsS1DyozS9qpfGZ0/XH5KJ3StrILbEK2
   P/xvO+NToyohmdT1BCUUXMQdlMNoWKcOi2dO/YhamegvOACini5N7AffK
   A==;
X-CSE-ConnectionGUID: Kb22RfYmQgS12tEPnjfP+w==
X-CSE-MsgGUID: e5uxeSceS/eQOAq452RS6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="101159704"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="101159704"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 00:36:53 -0700
X-CSE-ConnectionGUID: b47CuKEHSRiA7Udv1vxShQ==
X-CSE-MsgGUID: WUg7lWiNSm6sA4Fhcy6ysA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="252070357"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.65])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 00:36:50 -0700
Date: Wed, 1 Jul 2026 10:36:47 +0300
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
Message-ID: <akTDj-YJjuDOBc0i@ashevche-desk.local>
References: <20260630-loongson-gpio-v1-1-576908831fa0@gmail.com>
 <CAMRc=MdtRj6c3Bg72QMaAEMPovNyUdqWL_qDPGb1p=Cu=cETvA@mail.gmail.com>
 <akOxdBR_-rOweHXB@ashevche-desk.local>
 <B77A4E49-774C-4DB2-9CA6-FFBE14F1EF94@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <B77A4E49-774C-4DB2-9CA6-FFBE14F1EF94@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-39275-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,shankerwangmiao.gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linux.intel.com:from_mime,ashevche-desk.local:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C9066EACB9

On Tue, Jun 30, 2026 at 08:42:43PM +0800, Miao Wang wrote:
> > 2026年6月30日 20:07，Andy Shevchenko <andriy.shevchenko@linux.intel.com> 写道：
> > On Tue, Jun 30, 2026 at 07:45:52AM +0000, Bartosz Golaszewski wrote:
> >> On Mon, 29 Jun 2026 23:05:28 +0200, Miao Wang via B4 Relay
> >> <devnull+shankerwangmiao.gmail.com@kernel.org> said:
> > 
> >>> This patch adds back the support for gsi_idx_map, which is used in the
> >>> ACPI DSDT table to describe the mapping between the GPIO line number to
> >>> the index of the interrupt number in the declared interrupt resources.
> >>> 
> >>> This property was removed in Loongson CPU Universal Specification for
> >>> Interface Between PC/Server System Firmware and Kernel v4.1 in November,
> >>> 2023, but still in use in firmwares released this year. A sample of
> >>> an affected DSDT entry from a 3C6000 board I'm currently using is:
> > 
> > Oh my gosh, can somebody actually try to consult first with the Linux kernel
> > developers before adding non-standard and wrongly named properties, please?
> 
> Inferred from the time when gsi_idx_map was removed from the spec, I believe
> that the removal might be because the maintainers suggestion against introducing
> gsi_idx_map. However, the firmwares "in the wild" have not followed the change.

But what is the outcome of not using that mapping. Do you have something wrong
or not working?

> >>> Device (GPO1) {
> >>>  Name (_HID, "LOON000F")
> >>>  Name (_CRS, ResourceTemplate () {
> >>>    QWordMemory ( // Omitted, not related
> >>>    )
> >>>    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, ) {
> >>>      0x00000010, 0x00000011, 0x00000012, 0x00000013,
> >>>      0x00000014, 0x00000015, 0x00000016, 0x00000017,
> >>>    }
> >>>  Name (_DSD, Package (0x02) {
> >>>    ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301")
> >>>    Package (0x03) {
> >>>      Package (0x02) { "gpio_base", 0x50 } // Ignored by the driver
> > 
> > Yes, it's non-standard property. It's a broken one in terms of the style.
> > See DT binding documentation.
> 
> To clarify, I agree that this property should be redundant and ignored by
> the driver and global gpio numbers should be assigned dynamically by the
> kernel.
> 
> >>>      Package (0x02) { "ngpios", 0x20 }
> >>>      Package (0x02) { "gsi_idx_map", Package (0x20) {
> >>>        0, 1, 2, 3, 4, 5, 6, 7,
> >>>        0, 1, 2, 3, 4, 5, 6, 7,
> >>>        0, 1, 2, 3, 4, 5, 6, 7,
> >>>        0, 1, 2, 3, 4, 5, 6, 7,
> >>>      }}
> >>>    }
> >>>  }
> >>> }
> >>> 
> >>> As can be seen in the DSDT entry, the mapping is essential for obtaining
> >>> the IRQ number from a GPIO line number. Otherwise, when IRQ is requested
> >>> for the line numbers largers than 7, it will fail with -ENXIO.
> > 
> > This doesn't look good. Why can't we simply hardcode the proper behaviour based
> > on the _HID? The gsi_idx_map seems quite regular and periodic, do you have some
> > other examples with different mapping?
> 
> According to the manual, the gpio controllers in HID LOON0007 and LOON000F are
> actually embedded into the CPU chip and the interrupt lines are hard wired so
> that all the gpio lines of the gpio controller share in total 8 irqs such that
> the i-th line is wired to the (i%8)-th irq. So the mapping for these two models
> are fixed. I have no idea about the behavior of other kinds of controllers, which
> should be answered by Loongson personales.

OK.

> So far, there are known to be 2 styles of DSDT entries. One is defined by
> the latest Firmware Spec, to list all the irq numbers in _CRS, e.g. Name (_CRS,
> ResourceTemplate () { Interrupt () { 0x10, 0x11, .., 0x17, 0x10, 0x11, ..., 0x17,
> ... (in total ngpios entries) } }). The other is defined by the previous Firmware
> spec, to use the property `gsi_idx_map` to map the gpio line number to the irq
> number listed in the ResourceTemplate. The former should now be compatible with
> the current implementation of the driver in the kernel, while the later not. I
> believe that although being abandoned by the spec, the later should also be
> considered and supported by the driver, since it is used by the firmwares in the
> wild.

This is clear. What's unclear is the necessity of adding this mapping. Is that
mapping shuffled in an arbitrary way?

Second question, why one can't update firmware to fix this to follow the
specification? From above DSDT I do *not* see the need in this mapping.
Everything can be simply deducted from the number of Interrupt() resources
and ngpios at run-time without touching the property.

> Looking forward to your advice on this.
> 
> >>> The code in this patch is mostly picked from the version 5 of Yinbo's
> >>> original patch.

-- 
With Best Regards,
Andy Shevchenko



