Return-Path: <linux-gpio+bounces-39196-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GutnIpGxQ2oefQoAu9opvQ
	(envelope-from <linux-gpio+bounces-39196-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 14:07:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D566E3FC3
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 14:07:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=Mt8uFPju;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39196-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39196-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 02C3F30302F0
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 12:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E69EE40803F;
	Tue, 30 Jun 2026 12:07:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D4A34A3DB
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 12:07:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782821243; cv=none; b=Ea39CxOd9MOTuyg4lStjZS7WNk99bYdpkc+SiBACkRbAuAKDwc1rzPuGWEgsILrLVlvyetJomFS9Ldy+jAErUYjLePqVpsim9T+XKwjO1nHLMP6Yg60G04O4e1bd7hOq2Vbp3ZHf6RFv0sSrJ3NHDr25+9eeumkEDOwiFgdjDjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782821243; c=relaxed/simple;
	bh=AJ52d1yQLK8OY8GoqNYxFvc+m9iyUW3wdCqsnatWDWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n5+bTfHFEkNZGs9k1MX0YMz5T1swqPmfxMRuzx3WtPqBDf8iCD3gnr3NMlyTiwdZfH4xTouV+tyxDC0vsmY495/XYQzxD7X7sR24TnpmtV7KxjvE6eaPHct1xYOJqACAw4MZQnIndPYQVuqrsimTxyhSlGiXPM6+GXRhuxi1R1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mt8uFPju; arc=none smtp.client-ip=192.198.163.12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782821242; x=1814357242;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AJ52d1yQLK8OY8GoqNYxFvc+m9iyUW3wdCqsnatWDWI=;
  b=Mt8uFPjuhfcSI0kN2/3iMqlVlljrQE9XF0bTF2F4ozt235wqphrMGs7m
   5LmCpgivd1JjpzDEyWmPNhLvsZ2D2T023n5wfDO0D2UGIoqNJMNACe1Sx
   2QweV5uUY8VyQt+2Yc8dQet5pKgRSdQNbnhwPFjFAhhvflwMQzeKGfh+o
   KamMWPI9rX6bxE2oPyfo6cWwIp+2rsKiRaGdJKfThtma4L1BuFOwIF6qA
   wzVTFTU0He9sbvnxWIdvnnwko+bIdfQ3sCZK+EcaVRlF6AogX/9qjH5Gr
   9/urevi+Fsw+R+LyW8T3yLw3rhoSjhboNQYw0bfW7Doab53s335hxcrhx
   w==;
X-CSE-ConnectionGUID: XL5w7FOYSDOVC674DSIqDA==
X-CSE-MsgGUID: wgk5b8GgRz2qiPqFPi7lAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="87368925"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="87368925"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 05:07:21 -0700
X-CSE-ConnectionGUID: 8V0jMHu4SRSCNK1CJMrZKQ==
X-CSE-MsgGUID: IQ4Gb1MLTc+3Rpp2rwXsVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="248879656"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.96])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 05:07:18 -0700
Date: Tue, 30 Jun 2026 15:07:16 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: shankerwangmiao@gmail.com,
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
Message-ID: <akOxdBR_-rOweHXB@ashevche-desk.local>
References: <20260630-loongson-gpio-v1-1-576908831fa0@gmail.com>
 <CAMRc=MdtRj6c3Bg72QMaAEMPovNyUdqWL_qDPGb1p=Cu=cETvA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdtRj6c3Bg72QMaAEMPovNyUdqWL_qDPGb1p=Cu=cETvA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39196-lists,linux-gpio=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:shankerwangmiao@gmail.com,m:devnull+shankerwangmiao.gmail.com@kernel.org,m:chenhuacai@kernel.org,m:lvjianmin@loongson.cn,m:kernel@xen0n.name,m:jiaxun.yang@flygoat.com,m:linux-gpio@vger.kernel.org,m:zhuyinbo@loongson.cn,m:linusw@kernel.org,m:zhanghongchen@loongson.cn,m:liupeibao@loongson.cn,m:gaojuxin@loongson.cn,m:westeri@kernel.org,m:devnull@kernel.org,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,loongson.cn,xen0n.name,flygoat.com,vger.kernel.org];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,shankerwangmiao.gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ashevche-desk.local:mid,intel.com:dkim,linux.intel.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 18D566E3FC3

On Tue, Jun 30, 2026 at 07:45:52AM +0000, Bartosz Golaszewski wrote:
> On Mon, 29 Jun 2026 23:05:28 +0200, Miao Wang via B4 Relay
> <devnull+shankerwangmiao.gmail.com@kernel.org> said:

> > This patch adds back the support for gsi_idx_map, which is used in the
> > ACPI DSDT table to describe the mapping between the GPIO line number to
> > the index of the interrupt number in the declared interrupt resources.
> >
> > This property was removed in Loongson CPU Universal Specification for
> > Interface Between PC/Server System Firmware and Kernel v4.1 in November,
> > 2023, but still in use in firmwares released this year. A sample of
> > an affected DSDT entry from a 3C6000 board I'm currently using is:

Oh my gosh, can somebody actually try to consult first with the Linux kernel
developers before adding non-standard and wrongly named properties, please?

> > Device (GPO1) {
> >   Name (_HID, "LOON000F")
> >   Name (_CRS, ResourceTemplate () {
> >     QWordMemory ( // Omitted, not related
> >     )
> >     Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, ) {
> >       0x00000010, 0x00000011, 0x00000012, 0x00000013,
> >       0x00000014, 0x00000015, 0x00000016, 0x00000017,
> >     }
> >   Name (_DSD, Package (0x02) {
> >     ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301")
> >     Package (0x03) {
> >       Package (0x02) { "gpio_base", 0x50 } // Ignored by the driver

Yes, it's non-standard property. It's a broken one in terms of the style.
See DT binding documentation.

> >       Package (0x02) { "ngpios", 0x20 }
> >       Package (0x02) { "gsi_idx_map", Package (0x20) {
> >         0, 1, 2, 3, 4, 5, 6, 7,
> >         0, 1, 2, 3, 4, 5, 6, 7,
> >         0, 1, 2, 3, 4, 5, 6, 7,
> >         0, 1, 2, 3, 4, 5, 6, 7,
> >       }}
> >     }
> >   }
> > }
> >
> > As can be seen in the DSDT entry, the mapping is essential for obtaining
> > the IRQ number from a GPIO line number. Otherwise, when IRQ is requested
> > for the line numbers largers than 7, it will fail with -ENXIO.

This doesn't look good. Why can't we simply hardcode the proper behaviour based
on the _HID? The gsi_idx_map seems quite regular and periodic, do you have some
other examples with different mapping?

> > The code in this patch is mostly picked from the version 5 of Yinbo's
> > original patch.

> Cc'ing ACPI GPIO maintainers.

Thanks, Bart!

-- 
With Best Regards,
Andy Shevchenko



