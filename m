Return-Path: <linux-gpio+bounces-35562-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NpaO3BW72n5AQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35562-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 14:28:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B564727F6
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 14:28:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C2265301A505
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 12:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4E13B8D4A;
	Mon, 27 Apr 2026 12:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iPsUaoQG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7FB3B6343;
	Mon, 27 Apr 2026 12:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777292892; cv=none; b=gkVdc9NW5S/gbE78BPHgMnVwmn4I+80KBbcevyzIWMaS4YAHBszlrTz2TSkl0e1ZmoWgXViw1SSa2KHrJ6DDL0Z93gpwOO070f8jY0A/kZ1l17ceZUtrdyiVv3mWq6cl6s6Aw3FB6tySsnkoEeWrDAyZfPojoN+1WUMB9/jrM4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777292892; c=relaxed/simple;
	bh=LmTSRFR3z7Z5T9lVwbK0Xia+NCM5uQm5zF+OL4a3bAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hasZI0uPCV5vjbBZ1goeSa+tzn2Zy/JwiyWkCNdheG621vCz1Cb85Vmuxut+6z+QCHIZlhDWbWAM1z5MvNZoWp0dD+GtG7AX64sHIdlc42DW3DgCvBgZasZBOnG5M7tA8aL/WooxjmLu0F3ryMH9Mx4t2DEMRilGNVvl6MEWdAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iPsUaoQG; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777292890; x=1808828890;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=LmTSRFR3z7Z5T9lVwbK0Xia+NCM5uQm5zF+OL4a3bAw=;
  b=iPsUaoQGi6gks3yLgYW/6LTqy/F60Bw+gOezXF0I8CGVB+y8o0Y3WohT
   fgU665RP9+TaTchDAxRDhsNXMgSO0mlT+nWww5W2K4IlkN/KdMYRcF3Oh
   ejgxDNXNvUpjtyY/a3+K5w5AyxOOMXX8qG9tgGNen1W0EIIy/TW+6WaHs
   D5lEnF69K+6YuLKRragLVWV1djRHMn+KOLiacs3OlB4f0PcygeybBCOhT
   3aDLO0ExRI8YcARo+lAEOyKW0svlGqTkkNKrW4kj6hRch/Lqm7khliB6h
   B8/+dQQ7cFPGQFjpjS9J0ajtJucXmP+WO2kbJDBUKJUdkaqz0FRIKjXH/
   w==;
X-CSE-ConnectionGUID: kN8fYmWYTWmQzNlLId0ZhQ==
X-CSE-MsgGUID: eccRn1vYTKCx+AdyQodmRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="77203890"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="77203890"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 05:28:09 -0700
X-CSE-ConnectionGUID: DY7A+fRwQX26PTQrz1utgg==
X-CSE-MsgGUID: cUQq0kE/Tve0cbbpqecwXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="227097317"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 27 Apr 2026 05:28:08 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id A3A9795; Mon, 27 Apr 2026 14:28:06 +0200 (CEST)
Date: Mon, 27 Apr 2026 14:28:06 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Mario Limonciello <superm1@kernel.org>,
	Marco Scardovi <mscardovi95@gmail.com>,
	Francesco Lauritano <francesco.lauritano1@protonmail.com>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"open list:GPIO ACPI SUPPORT" <linux-gpio@vger.kernel.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"westeri@kernel.org" <westeri@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [BUG] 36-second boot delay due to by
 acpi_gpio_handle_deferred_request_irqs on ASUS ROG Strix G16 (2025)
Message-ID: <20260427122806.GN557136@black.igk.intel.com>
References: <b57b44c3-ea96-4189-8b70-71bf4a80d29b@kernel.org>
 <20251218103831.GW2275908@black.igk.intel.com>
 <51f999d7-2064-47dc-8d9b-e262588bfbdb@gmail.com>
 <20260422090709.GB557136@black.igk.intel.com>
 <4e55e31e-a5e8-4098-8a7f-bb52476b882a@gmail.com>
 <20260422095558.GC557136@black.igk.intel.com>
 <5a36760d-5d1e-4eee-9006-3fed042aa2cd@gmail.com>
 <20260423044211.GD557136@black.igk.intel.com>
 <3d562963-9581-4e0f-b9a0-5f0fe28d2495@kernel.org>
 <c55b55ea-a8d5-481e-916f-eb92aeb2e06d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c55b55ea-a8d5-481e-916f-eb92aeb2e06d@kernel.org>
X-Rspamd-Queue-Id: 81B564727F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,protonmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35562-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_PROHIBIT(0.00)[0.0.1.99:email];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.21:email,intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.24:email]

On Mon, Apr 27, 2026 at 01:46:03PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 23-Apr-26 07:15, Mario Limonciello wrote:
> > On 4/22/26 23:42, Mika Westerberg wrote:
> >> Hi,
> >>
> >> On Wed, Apr 22, 2026 at 02:08:29PM +0200, Marco Scardovi wrote:
> >>>>> Assuming all the variants suffer the same problem would it be ok to use a
> >>>>> wildcard for it?
> >>>> Yeah, we could expand it to all "ROG Strix G16" I think:
> >>>>
> >>>> diff --git a/drivers/gpio/gpiolib-acpi-quirks.c b/drivers/gpio/gpiolib-acpi-quirks.c
> >>>> index a0116f004975..e3a6111854e8 100644
> >>>> --- a/drivers/gpio/gpiolib-acpi-quirks.c
> >>>> +++ b/drivers/gpio/gpiolib-acpi-quirks.c
> >>>> @@ -392,6 +392,23 @@ static const struct dmi_system_id gpiolib_acpi_quirks[] __initconst = {
> >>>>                .ignore_wake = "VEN_0488:00@355",
> >>>>            },
> >>>>        },
> >>>> +    {
> >>>> +        /*
> >>>> +         * The ASUS ROG Strix G16 (2025) ACPI GPIO configuration
> >>>> +         * causes acpi_gpio_handle_deferred_request_irqs() to
> >>>> +         * stall for ~36 seconds during boot so ignore the two
> >>>> +         * interrupts involved.
> >>>> +         *
> >>>> +         * Found in BIOS G614PP.307.
> >>>> +         */
> >>>> +        .matches = {
> >>>> +            DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> >>>> +            DMI_MATCH(DMI_PRODUCT_NAME, "ROG Strix G16"),
> >>>> +        },
> >>>> +        .driver_data = &(struct acpi_gpiolib_dmi_quirk) {
> >>>> +            .ignore_interrupt = "AMDI0030:00@21,AMDI0030:00@24",
> >>>> +        },
> >>>> +    },
> >>>>        {} /* Terminating entry */
> >>>>    };
> >>> As for now it seems working. I've reverted it on my kernel as I prefer
> >>> remain as much as possible close to the CachyOS' one but hopefully it will
> >>> be implemented on 7.1, if someone propose the patch and it is accepted. It
> >>> would be amazing to see Asus more interested on Linux and more strict with
> >>> their BIOS but in the end I understand it's like asking for the moon.
> >>
> >> Okay thanks for checking. I guess this is what we have to live with for now
> >> until someone finds a better way of dealing with these.
> >>
> >> @Francesco, would you like to submit a new version of the patch similar to
> >> above or you want me to do that?
> > 
> > Hans suggested that we might want to look at ripping out this edge triggered events at boot earlier in the thread.
> > 
> > https://lore.kernel.org/platform-driver-x86/20260423044211.GD557136@black.igk.intel.com/T/#mdca882e6606d3a894ec7499d3b742d040933dbdb
> > 
> > Hans - as you pointed out that the Surface lid state is the only real issue left and you happen to have one do you think you could work up some patches?
> 
> Right, so I read further in the thread that Armin has a maybe better suggestion,
> after that has been merged I can check a bunch of the current devices with
> .no_edge_events_on_boot which I still have and see if those quirks can be
> dropped now.
> 
> But the above quirk for the ASUS ROG Strix G16 (2025) does not use
> .no_edge_events_on_boot which just disables the initial run of
> the ACPI event handler at boot. Instead it uses:
> 
>             .ignore_interrupt = "AMDI0030:00@21,AMDI0030:00@24",
> 
> which *completely* disables the ACPI event handlers for the mentioned pins.

Oh, I've completely lost track of all the quirks that were added after I
did anything with the ACPI GPIO stuff :(. Sorry about missing this. I will
stay silent from now on ;-)

