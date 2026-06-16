Return-Path: <linux-gpio+bounces-38579-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XhReB9gtMWqDdQUAu9opvQ
	(envelope-from <linux-gpio+bounces-38579-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 13:04:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 856BA68E9E7
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 13:04:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=disroot.org header.s=mail header.b=IFxdnqDc;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38579-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38579-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=disroot.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0816531C46DA
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 10:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43E8D43C041;
	Tue, 16 Jun 2026 10:58:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C6F43C057;
	Tue, 16 Jun 2026 10:58:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781607530; cv=none; b=EUlohbwS/TuvnzbTeo5rXsmh/6SvYfMctfgDZhkjTD+YTxswFabB0n3GjJMSjRNFPqv/Mv+OXldxd2e7/MReR1gQ06ZgNNJeup942qOU+lUyoPWY7mmKTyOX2V1KCDqb7V3iRoYtAgkx5dxAgnVk+7+ZQDlUuSdIjLgVodqT8jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781607530; c=relaxed/simple;
	bh=eU9kbAcxQ0cGQSDEN/i/x+otpe2l6cWb/YeRoAGChPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BHQ9GexTLicptEyeaz584yuVdc9TKwFPs1fovAVdRo7Q9i2qXwT4+4At9y5CjzuzBolAUT2auzsTzpDJXIzY5+NOBGMXOzWdOn27drrtLsd3XJdLhlAo6mq/g2fVQijnPQXhh6hK2x6A3Hin9FwI8nyhTBcqYy/laFC3cII+xZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=IFxdnqDc; arc=none smtp.client-ip=178.21.23.139
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 2EFF226EDC;
	Tue, 16 Jun 2026 12:58:45 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NayisU07itRP; Tue, 16 Jun 2026 12:58:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1781607524; bh=eU9kbAcxQ0cGQSDEN/i/x+otpe2l6cWb/YeRoAGChPQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IFxdnqDcPQC/o5Jbk+xFM4kXAuc4h27sbMNFqwDVoiGsqPD/DZm3cGSDV17BUsyDl
	 Gb85yejsU7Eky+S2jsM4Me5CqMflcBgZvTmFG3BI8HSrnOLsAYwomPp0W4p+L7H9oE
	 QKZnoZ1pfkWoCM5c5bvPurlFSg5/OmXZyybPdMGrtT9EXB9FxxITYjzHlWpvA07Mtt
	 0HUi8NIysOozhdoZAylDsFzz+piYln8trQ23gEjjsFoWdMfsm5vyh0h9QR4C3fVwDw
	 ru3uCLr7wuS5uIK5Uy/ie3h0916dHIFIZGlbomIu4f2wj4jNsO2gLUczAZ2hz1S0qI
	 cjGH/zBu6XRtA==
From: Marco Scardovi <scardracs@disroot.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Mika Westerberg <westeri@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>, linux-gpio@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: acpi: Add quirk for ASUS ROG Strix G614 series
Date: Tue, 16 Jun 2026 12:58:31 +0200
Message-ID: <KW1oy3-UQRW73tAAP5-cWQ@disroot.org>
In-Reply-To: <20260616102451.GC2990@black.igk.intel.com>
References:
 <20260616090824.5967-1-scardracs@disroot.org>
 <ajEeLL5u3hf7lvWD@ashevche-desk.local>
 <20260616102451.GC2990@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	CTE_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[disroot.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-38579-lists,linux-gpio=lfdr.de];
	FORGED_SENDER(0.00)[scardracs@disroot.org,linux-gpio@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:mika.westerberg@linux.intel.com,m:westeri@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:mario.limonciello@amd.com,m:linux-gpio@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[scardracs@disroot.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,disroot.org:dkim,disroot.org:mid,disroot.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 856BA68E9E7

On Tue, Jun 16, 2026 at 12:24:51 +0200, Mika Westerberg wrote:
> On Tue, Jun 16, 2026 at 12:58:04PM +0300, Andy Shevchenko wrote:
> > Mika, do you see any problems with disabled (deferred?) interrupt for this 
type
> > of event? I think it might break the suspend-resume (on touchpad event). 
Also
> > do you remember if we ever had touchpad event to be ActiveBoth?
> 
> For starters, why this is ACPI event in the first place? The AML is not
> supposed to use the touchpad.
> 
> Touchpad should be using just regular GpioInt(). Does it still work after
> this patch? If yes then I think this is definitely okay.

Hi Mika, Andy,

Yes, the touchpad continues to work perfectly after this patch (even the
suspend/resume you asked about).

The touchpad itself is initialized and driven by the i2c-hid driver using a 
standard GpioInt() resource defined in the touchpad device's _CRS method. 
The ACPI event handler (pin 21) registered under the GPIO controller's _AEI 
is distinct from this.

The DMI quirk (.no_edge_events_on_boot = true) only prevents the initial 
boot-time trigger of this ACPI event handler when the line is asserted low 
during initialization. It does not prevent the touchpad driver from 
requesting and receiving its interrupts.

Furthermore, unlike using the "gpiolib_acpi.ignore_interrupt=AMDI0030:00@21" 
workaround (which would completely disable the ACPI handler), this patch still 
keeps the ACPI event handler registered. If any edge events occur on this pin 
post-boot (for example, if the BIOS needs to toggle touchpad states or track 
device status), the handler will still run normally, avoiding any potential 
breakage of runtime ACPI functionality.

Sidenote
Personally I'd wait for Mario for further info: after all it's him the
maintainer for AMD side and surely knows more than me.




