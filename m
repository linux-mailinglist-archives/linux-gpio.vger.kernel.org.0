Return-Path: <linux-gpio+bounces-38698-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WhB4N5IyNGrrRAYAu9opvQ
	(envelope-from <linux-gpio+bounces-38698-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 20:01:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F756A207C
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 20:01:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=jINx0U3X;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38698-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38698-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3A12E302F689
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 18:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBD8B34A773;
	Thu, 18 Jun 2026 18:01:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A95B346769;
	Thu, 18 Jun 2026 18:01:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781805711; cv=none; b=kg5Z5+fDOiG8jNvxGNFoB3bI8O25Ks8xXKaeASwvPOdlqbAjouyt8Cv97sC2cqsVCEovl5F6Z6Qm8+NMSE9Z0uLg9FlWxZyc8ztph5SfSOY9GILxdydaEVTsjVRWtVC4Pj7aFXZ7E1EPAaxlEcxLVyMjnx7jhSAQpFZT94jcgkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781805711; c=relaxed/simple;
	bh=xhXa+Xy9vSaiTCP+0UBUjJ1L5LhSje05LiG7wgGSUx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I+Hypw9EeiQB62HnL4pLwXobJTqxAPW3uuKVG8+i2OsHUgU1I+912h3Uivwp9gsR5YKMm/TSVJYzPQN+jJWK46LGSIpO1xHpwSDp2ik60p4RhwSpwV4oHs7d7xP+RUMFAbpBOj7X+7cbOzFqUDbQZaSPdh3x8uGwiJDDro7/9ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jINx0U3X; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781805710; x=1813341710;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=xhXa+Xy9vSaiTCP+0UBUjJ1L5LhSje05LiG7wgGSUx8=;
  b=jINx0U3XNHw0gZ8G206v9mYtA0xahHEX9kaUXOoLeZ1R0b8N9b9JJ1Z2
   hFpfI4Qimviug1sglRks8z68Z/MqYm/yW45T/xas0fr52NN1lmH2BLlz2
   AdtZCFCuG1VS+i4SvudmpGx+6yVmuiYHe5BLpgR6FVOTkWbdd/jSAGyUe
   IYn0YDoLuWBxasQdIkoQjULNa4vRVydUgnqWG67OdVxHoLSwdDe0eylNo
   d+Qiwe9N1SsghD3gCwkCMnCU09BHJze4rn55Q3Qny3GBd5o0rvR+vIxjg
   1lOLoI/iwHeT6/UDaZ1qzMNdyYIKaE/xQPI9RO5ZM48aE6QJm8Bi8z+ji
   w==;
X-CSE-ConnectionGUID: qkpcD00/SDCR+qXFRYD1Xg==
X-CSE-MsgGUID: ILkoUrbkSZuKQWxtK4J9Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="85208937"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="85208937"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 11:01:49 -0700
X-CSE-ConnectionGUID: 141YkqsGR5+05KIbSxJpMQ==
X-CSE-MsgGUID: +Ij4U3ygSpC74Jeln+jKfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="247552164"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.10])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 11:01:42 -0700
Date: Thu, 18 Jun 2026 21:01:40 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marco Scardovi <scardracs@disroot.org>
Cc: Basavaraj Natikar <bnatikar@amd.com>, w_armin@gmx.de, brgl@kernel.org,
	linusw@kernel.org, linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	mario.limonciello@amd.com, westeri@kernel.org
Subject: Re: [PATCH v2 0/1] gpiolib: acpi: Add quirk for ASUS ROG Strix G16
 G614 series
Message-ID: <ajQyhOuvripaiXEq@ashevche-desk.local>
References: <0e6ea9d5-68ac-4d18-b40a-25e70216b288@gmx.de>
 <b259a3a3-0440-4da6-a3bb-d840f5242ce2@amd.com>
 <ajQCOQzWEmNkzCVc@ashevche-desk.local>
 <AeA8zl9ySbqIYxvm7aBj4Q@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AeA8zl9ySbqIYxvm7aBj4Q@disroot.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-38698-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:scardracs@disroot.org,m:bnatikar@amd.com,m:w_armin@gmx.de,m:brgl@kernel.org,m:linusw@kernel.org,m:linux-acpi@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mario.limonciello@amd.com,m:westeri@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[amd.com,gmx.de,kernel.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ashevche-desk.local:mid,linux.intel.com:from_mime,intel.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 52F756A207C

On Thu, Jun 18, 2026 at 06:59:15PM +0200, Marco Scardovi wrote:
> On Thu, Jun 18, 2026 at 16:35:37 CEST, Andy Shevchenko wrote:
> > On Thu, Jun 18, 2026 at 06:46:28PM +0530, Basavaraj Natikar wrote:
> > > On 6/18/2026 4:44 AM, Marco Scardovi wrote:
> > > > On Wed, Jun 17, 2026 at 10:33 PM, Armin Wolf wrote:

...

> > > > I have extracted and decompiled the ACPI tables (DSDT and SSDTs) from
> > > > acpidump. You can find the raw acpidump.out and the decompiled ASL
> > > > tables in the following Google Drive folder:
> > > > https://drive.google.com/drive/folders/1aTqLAnUhrTsPdpA8tfOFyRopG3P3DGnc
> > > > ?usp=drive_link
> > > > 
> > > > As far as I can see/understand there is no _DSM method defined under the
> > > > GPIO controller device (AMDI0030) or the \_SB.GPIO scope.
> > > > 
> > > > Under the _AEI method (defined in SSDT9 line 188-193), pin 21 (0x15) and
> > > > pin 24 (0x18) are defined as:
> > > > 
> > > > GpioInt (Edge, ActiveBoth, ExclusiveAndWake, PullNone, 0x0000,
> > > > 
> > > >      "\\_SB.GPIO", 0x00, ResourceConsumer, ,
> > > >      )
> > > >      {
> > > >      
> > > >          0x0015 // Pin 21 (Touchpad attention line)
> > > >      
> > > >      }
> > > > 
> > > > When triggered, they evaluate the _EVT method which calls:
> > > > Case (0x15)
> > > > {
> > > > 
> > > >      \_SB.PCI0.SBRG.HNC0 (0x15, Zero)
> > > > 
> > > > }
> > > > 
> > > > Since Arg1 is Zero, HNC0 executes the Else branch, invoking M009 and
> > > > ATKM/ADTM, which stalls synchronously for ~36 seconds when executed
> > > > during the probe path at boot time.
> > > 
> > > I traced the _EVT for pin 21 through the dumps:
> > > 
> > > _EVT(0x15) → \_SB.PCI0.SBRG.HNC0(0x15, Zero). With Arg1==0 it takes the
> > > Else branch: M009(), then Notify(^^GPP0.PEGP, 0x81) "Information Change"
> > > to the dGPU, then ATKM(0xC0)/ADTM().
> 
> It seems I have much more to study about ACPI Tables. Sorry for the confusion
> and thank you for checking it out.
> 
> > > So this _AEI event is dGPU/graphics‑related (it notifies PEGP), not the
> > > touchpad — the earlier "touchpad" characterization is incorrect. The
> > > touchpad (TPD0, _HID "ASUE1416", _CID "PNP0C50") has its own GpioInt() in
> > > its _CRS on a different line (pin 0x08, Level/ActiveLow).
> > > 
> > > The ~36 s stall is consistent with these synchronous MMIO reads + dGPU
> > > notify \running in the boot probe path while the GPU isn't ready
> > > (no explicit Sleep in the path; a trace_method_name on HNC0/M049 would
> > > confirm the exact blocking access).
> > > Either way, running this AML synchronously at boot is the firmware issue
> > > the no_edge_events_on_boot quirk works around.
> > > 
> > > Could you update the commit message accordingly — in particular, drop the
> > > "touchpad" wording, since pin 21's _AEI event is the dGPU notify path, not
> > > the touchpad?
> 
> I'll do it. Let also me know for @Andy request below.
> 
> > Thanks for the details! The crucial and most important question here, is AMD
> > going to push OEM(s) to fix firmware accordingly?
> 
> It seems ASUS released a new BIOS update 2 days ago specifically for my device.
> You can find the new acpidump here:
> https://drive.google.com/drive/folders/1PYmF1R9n-6vHJVSH8bzEPZhRgdmBBJlT?usp=sharing

Have you tried it already?

At least the DSDT has neither _AEI, nor ActiveBoth for anything (except speaker
device). Looks promising to me as a fixed version.

-- 
With Best Regards,
Andy Shevchenko



