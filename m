Return-Path: <linux-gpio+bounces-35341-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJK2KtmP6GmpMQIAu9opvQ
	(envelope-from <linux-gpio+bounces-35341-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 11:07:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A733443C17
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 11:07:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EAC1F300D17A
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 09:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 064C53C1401;
	Wed, 22 Apr 2026 09:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aChn/Gdq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611BC3B27EC;
	Wed, 22 Apr 2026 09:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776848834; cv=none; b=beolwYrESwCaU9zR75YB9tdtFCwrtHQSCboOBYBJ1kPv20f7LOZvVzwtCz6WkCtT0cxgBSle36JwM0dGSp1CB/LjZbZCqQgUmLdq3VR5ukDWHyViND5i6VR6jruEuByIAbHk3bSMnPB7TZEka23DV99pADiPwK38KX6sSZaikJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776848834; c=relaxed/simple;
	bh=tNQoplVn3lwOKy/hV4N5PlwdB5qg3RTXGvP9n0QBC6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UarUm/DGfPcgV2VwK1kwUlXKAp1svkd7ORo0mceOLlF47MOdliJEW2/TqDcp2A+zmzSQ7i2NGDmQlw7JuCeE4CM94ESompQd5OyKJo4pSajiRTNVoGX2NkOAu2zT9EzvTpDj70qkdPc6j0xhqqOPvUeS3U58rAM25WhTeCZt/X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aChn/Gdq; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776848833; x=1808384833;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tNQoplVn3lwOKy/hV4N5PlwdB5qg3RTXGvP9n0QBC6E=;
  b=aChn/GdqFpy05KSnU4QT0uGopR3S/cLvWcv5r7V/JkFvyhS1pbFIWUGp
   Ab5ySyBjL2ZyPZ1rr6ZJaDIipU7ZAIN0ccRdqrrFaDhctzazh5JTxAsWb
   ZVtujM5mpaks+jcu4yY43g5aJzTi/azjC0S0e5QYDidIO1afXSEXJIF7b
   haXCQEC6ICpHbokOS5HZIiwfBdLLFWKdFExr1VAT89ucsT5ttfBdzRnCR
   Ei4qRtyC5igFm+k4/mZNWErCpTJvwxHYCaQCDpMD6rQJJw4SBfluFuCvq
   AituSpBSWchy5XnbeIwGnSEGXEZ/7+o48l6BFk1caHi6bHiRVLv4QTaCy
   A==;
X-CSE-ConnectionGUID: YgjGyE7yTOCR31YXIIUcBA==
X-CSE-MsgGUID: yKw/l7egT+SiYaLdOn4miA==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="80383788"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="80383788"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 02:07:12 -0700
X-CSE-ConnectionGUID: rBryd8lWSkK/5lhqi0Ihgg==
X-CSE-MsgGUID: CRJRPTLZSIGwnGDLFtlr9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="237342720"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 22 Apr 2026 02:07:11 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 6693D95; Wed, 22 Apr 2026 11:07:09 +0200 (CEST)
Date: Wed, 22 Apr 2026 11:07:09 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Marco Scardovi <mscardovi95@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Francesco Lauritano <francesco.lauritano1@protonmail.com>,
	Mario Limonciello <superm1@kernel.org>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"open list:GPIO ACPI SUPPORT" <linux-gpio@vger.kernel.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"westeri@kernel.org" <westeri@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [BUG] 36-second boot delay due to by
 acpi_gpio_handle_deferred_request_irqs on ASUS ROG Strix G16 (2025)
Message-ID: <20260422090709.GB557136@black.igk.intel.com>
References: <6iFCwGH2vssb7NRUTWGpkubGMNbgIlBHSz40z8ZsezjxngXpoiiRiJaijviNvhiDAGIr43bfUmdxLmxYoHDjyft4DgwFc3Pnu5hzPguTa0s=@protonmail.com>
 <4402ed86-77f5-4a47-a9e1-8d57a709bb15@kernel.org>
 <woxnPhTYiKi2aLzBK8GnO8DpvdgYjQc-P42uhJOzyrcYC3Gdstht27hML8yNHgOklhm2MgGA7wt9gGZ17BHoWlG0vqJuVVJDgCSev8udfds=@protonmail.com>
 <NIIS8XD_nSRvp36X39GxcDRAWsaScQIFx6o9JsFCbyBZk5PqznRdxg9EDDb_9tzWd5TcjzxrRtFx5_uLCVa5wJAYykW2k0Ue_XPMPtWCQiY=@protonmail.com>
 <e8ed4d4e-37e1-4577-bf80-62fcefbef7dc@kernel.org>
 <ReQS8sQSGy3UTuG6tyPvoOb8_037sC6A2yXsSFNuXY1PlTFtCcDHnjf8vufEsk8avBSIL46U0qE-ZjTJD1xsbVYZ6_d2-wlTOZ2NJ2coTsc=@protonmail.com>
 <20251218063954.GT2275908@black.igk.intel.com>
 <b57b44c3-ea96-4189-8b70-71bf4a80d29b@kernel.org>
 <20251218103831.GW2275908@black.igk.intel.com>
 <51f999d7-2064-47dc-8d9b-e262588bfbdb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <51f999d7-2064-47dc-8d9b-e262588bfbdb@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35341-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,protonmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.24:email];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.21:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.1.99:email,intel.com:dkim]
X-Rspamd-Queue-Id: 3A733443C17
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Wed, Apr 22, 2026 at 09:51:01AM +0200, Marco Scardovi wrote:
> 
> On 12/18/25 11:38, Mika Westerberg wrote:
> > On Thu, Dec 18, 2025 at 11:33:14AM +0100, Hans de Goede wrote:
> > > Hi,
> > > 
> > > On 18-Dec-25 07:39, Mika Westerberg wrote:
> > > > On Wed, Dec 17, 2025 at 07:19:56PM +0000, Francesco Lauritano wrote:
> > > > > On Wednesday, December 17th, 2025 at 7:01 PM, Mario Limonciello <superm1@kernel.org> wrote:
> > > > > 
> > > > > > On 12/17/25 10:57 AM, Francesco Lauritano wrote:
> > > > > > 
> > > > > > > On Wednesday, December 17th, 2025 at 4:12 PM, Francesco Lauritano francesco.lauritano1@protonmail.com wrote:
> > > > > > > 
> > > > > > > > The _AEI defines 5 GPIO interrupts. Narrowed it down to two:
> > > > > > > > 
> > > > > > > > gpiolib_acpi.ignore_interrupt=AMDI0030:00@21,AMDI0030:00@24
> > > > > > > > 
> > > > > > > > This fixes the delay. Pins 0x15 and 0x18 both call: \_SB.PCI0.SBRG.HNC0()
> > > > > > > Traced it further. HNC0(pin, 0) takes the Else branch and calls:
> > > > > > > ATKM(0xC0)
> > > > > > > ADTM(Zero)
> > > > > > > 
> > > > > > > ADTM calls NOD2(), which is the actual culprit:
> > > > > > > 
> > > > > > > While ((Arg0 != RDNT))
> > > > > > > {
> > > > > > > If ((Local0 >= 0x0F)) { Break }
> > > > > > > Notify (^^GPP0.PEGP, Arg0)
> > > > > > > Local0++
> > > > > > > Sleep (Local0 * 0x64)
> > > > > > > }
> > > > > > > 
> > > > > > > It notifies the dGPU and polls RDNT, sleeping 100, 200, ... 1500ms per iteration.
> > > > > > > Max 15 loops = ~12s per pin. GPU doesn't respond at boot so it maxes out.
> > > > > > > 
> > > > > > > Two pins, ~12s each, ~24-36s total.
> > > > > > > 
> > > > > > > Francesco
> > > > > > 
> > > > > > Any idea why isn't the dGPU responding? I would have expected
> > > > > > https://git.kernel.org/torvalds/c/4d4c10f763d78 sets up policy that it's
> > > > > > in D0.
> > > > > > 
> > > > > > Is the dGPU turned off in BIOS or through some reverse engineered
> > > > > > tool/API or something?
> > > > > dmesg without the workaround:
> > > > > [    1.005184] pci 0000:01:00.0: PME# supported from D0 D3hot
> > > > > [    1.288811] pci 0000:01:00.0: vgaarb: VGA device added
> > > > > [   38.250139] nvidia: loading out-of-tree module taints kernel.
> > > > > [   38.369358] nvidia 0000:01:00.0: enabling device (0000 -> 0003)
> > > > > [   39.744421] NVRM: GPS ACPI DSM called before _acpiDsmSupportedFuncCacheInit
> > > > > 
> > > > > GPU is in D0 from 1.0s. nvidia loads at 38.2s after the GPIO hang completes.
> > > > > 
> > > > > No weird tools/APIs besides userspace utils (asusctl/supergfxctl).
> > > > > 
> > > > > No changes to BIOS factory defaults other than disabling Fast Boot.
> > > > > dGPU is active, Display Mode is Dynamic (hybrid).
> > > > > 
> > > > > Traced RDNT - it's set by GPS function 19 in the ACPI tables:
> > > > > Case (0x13)
> > > > > {
> > > > >      Debug = "GPS fun 19"
> > > > >      \_SB.PCI0.SBRG.RDNT = (Local1 + 0xD1)
> > > > > }
> > > > > 
> > > > > As far as I can understand GPIO initcall blocks at late_initcall_sync, preventing nvidia
> > > > > from loading in time to respond. Based on the timing, GPU is awake but nothing can
> > > > > register a handler while kernel is stuck at NOD2 polling loop.
> > > > I wonder if you could try with the nouveau driver so that it's built-in to
> > > > the kernel proper? Then it should be ready at the time these events
> > > > trigger.
> > > That is not really a workable solution though.
> > Yeah, I did not meant it to be the "solution" rather just to check whether
> > it is related if the GPU driver is there or not. You cannot build the
> > proprietary driver into the kernel so that's why I suggested the
> > open-source one.
> 
> Hi Everyone,
> 
> I would start saying sorry for the necrobump. I faced the same problem on my
> G614PR and fixed the same way as Francesco.
> 
> Do you happen to know if there is any news about this? I'm currently on
> CachyOS with kernel 7.0 and noticed it behaves the same way as 6.19.
> 
> I'm on to try patches or provide more infos if needed, even if I have to
> admit I know Linux but not that deeply.

As far as I can tell no updates unfortunately. I guess we could go with
slightly updated patch from Francesco, like below that just ignores those
two interrupts. Can you try if that works for you?

This list of devices that suffer from the "edge events on boot" seems to be
growing so maybe we should re-think if that should be enabled for all
systems or limit to the problematic ones (although that list could get big
too ;-))

diff --git a/drivers/gpio/gpiolib-acpi-quirks.c b/drivers/gpio/gpiolib-acpi-quirks.c
index a0116f004975..4e60a176ac93 100644
--- a/drivers/gpio/gpiolib-acpi-quirks.c
+++ b/drivers/gpio/gpiolib-acpi-quirks.c
@@ -392,6 +392,23 @@ static const struct dmi_system_id gpiolib_acpi_quirks[] __initconst = {
 			.ignore_wake = "VEN_0488:00@355",
 		},
 	},
+	{
+		/*
+		 * The ASUS ROG Strix G16 (2025) ACPI GPIO configuration
+		 * causes acpi_gpio_handle_deferred_request_irqs() to
+		 * stall for ~36 seconds during boot so ignore the two
+		 * interrupts involved.
+		 *
+		 * Found in BIOS G614PP.307.
+		 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "ROG Strix G16 G614PP_G614PP"),
+		},
+		.driver_data = &(struct acpi_gpiolib_dmi_quirk) {
+			.ignore_interrupt = "AMDI0030:00@21,AMDI0030:00@24",
+		},
+	},
 	{} /* Terminating entry */
 };
 

