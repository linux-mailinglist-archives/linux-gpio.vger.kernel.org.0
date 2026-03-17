Return-Path: <linux-gpio+bounces-33588-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEB2Isn9uGl/mwEAu9opvQ
	(envelope-from <linux-gpio+bounces-33588-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 08:07:53 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3706B2A4983
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 08:07:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E0B03012245
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 07:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E00F53876AF;
	Tue, 17 Mar 2026 07:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kECZo+jQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAFB346FAB;
	Tue, 17 Mar 2026 07:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773731256; cv=none; b=eHEE+dCp3DfgEEdT12LcySNtU9Q2yGD9I8Up9yYAKs7qEYw4cesEg/L0+H1Hbq1NkQaT1AygsZEvyUgX2RcN2HDEDEgRPwot6BOsODnCGNBGuSkVnOoPQhEbQ1GRHndnR/2ge57TJShKMDxkTWhD2MpUrttmkOc2/zP4ybqwwxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773731256; c=relaxed/simple;
	bh=D9EpaUqvtcLalg9vu0z9KVXubLh0G2Y4S2QGVe1FmXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ooEZe9v1UFSReRCnzriyTehMVpnv4y73qCIn+M7mO0ohWQdYV/sgcPN7tDg7A4hYpbHYlfEsnZknZXk6Hy78INBAewQJB6WZu8bD+E145xtEz9S6wV3YkaBJ1UJZrQsFAwSDL7Szgm8kC+nFZdOENdS9F42krVn7A8v2uHrCyeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kECZo+jQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E10B9C19424;
	Tue, 17 Mar 2026 07:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773731256;
	bh=D9EpaUqvtcLalg9vu0z9KVXubLh0G2Y4S2QGVe1FmXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kECZo+jQZtr/cvbmxQXZPIZ1bKB73tIOLL2u5vTYPfngdAK4xGdveXIDla97NNL1D
	 42cTL02hYvtj/0FovFN7yRBkwKx6mnX/YBYRzHqceCC0FiMz5dfDHIsdka3osr+WxU
	 4Cc+IwBJo3BkK+FD7qNscvaRPlACRAQG/crYa1R8pvJe5RWqJjpM1vO4NAhG7IdrXk
	 7KbzTSXljgN3bYKlSbp47EAepF+v/X/W+lGZg79X1OXKupZIgDyY5l4TGi8YsRI84Y
	 JgQRHIIFEjj13GVE284n1VgvwCChC3g8JEIM5m7Oh6j0f9TwEzPg6ezwYzSXAV0duz
	 4NuQg/drPOEdw==
Date: Tue, 17 Mar 2026 12:37:25 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org, quic_vbadigan@quicinc.com, 
	sherry.sun@nxp.com, driver-core@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v8 3/3] PCI: Add support for PCIe WAKE# interrupt
Message-ID: <t2yjuw4ca4tskzocv65m4jjmp2wfjkpymduhbv76actfybzklv@h5qavg2uzhjc>
References: <20260313-wakeirq_support-v8-0-48a0a702518a@oss.qualcomm.com>
 <20260313-wakeirq_support-v8-3-48a0a702518a@oss.qualcomm.com>
 <53uy2vdzc25frf5rpwbybaor5n6jesapl2x7xusnn5zfaqnfy7@udq7ln2a42n5>
 <be9980f3-f036-4260-980f-5d996bc034cb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <be9980f3-f036-4260-980f-5d996bc034cb@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33588-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3706B2A4983
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 05:46:58PM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 3/13/2026 7:28 PM, Manivannan Sadhasivam wrote:
> > On Fri, Mar 13, 2026 at 12:38:42PM +0530, Krishna Chaitanya Chundru wrote:
> > > According to the PCI Express specification (PCIe r7.0, Section 5.3.3.2),
> > > two link wakeup mechanisms are defined: Beacon and WAKE#. Beacon is a
> > > hardware-only mechanism and is invisible to software (PCIe r7.0,
> > > Section 4.2.7.8.1). This change adds support for the WAKE# mechanism in
> > > the PCI core.
> > > 
> > > According to the PCIe specification, multiple WAKE# signals can exist in
> > > a system or each component in the hierarchy could share a single WAKE#
> > > signal. In configurations involving a PCIe switch, each downstream port
> > > (DSP) of the switch may be connected to a separate WAKE# line, allowing
> > > each endpoint to signal WAKE# independently. From figure 5.4 in sec
> > > 5.3.3.2, WAKE# can also be terminated at the switch itself. To support
> > > this, the WAKE# should be described in the device tree node of the
> > > endpoint/bridge. If all endpoints share a single WAKE# line, then each
> > > endpoint node should describe the same WAKE# signal or a single WAKE# in
> > > the Root Port node.
> > > 
> > > In pci_device_add(), PCI framework will search for the WAKE# in device
> > > node, If not found, it searches in its upstream port only if upstream port
> > > is Root Port. Once found, register for the wake IRQ in shared mode, as the
> > > WAKE# may be shared among multiple endpoints.
> > > 
> > > dev_pm_set_dedicated_shared_wake_irq() associates a wakeup IRQ with a
> > > device and requests it, but the PM core keeps the IRQ disabled by default.
> > > The IRQ is enabled only when the device is permitted to wake the system,
> > > i.e. during system suspend and after runtime suspend, and only when device
> > > wakeup is enabled.
> > > 
> > > When the wake IRQ fires, the wakeirq handler invokes pm_runtime_resume() to
> > > bring the device back to an active power state, such as transitioning from
> > > D3cold to D0. Once the device is active and the link is usable, the
> > > endpoint may generate a PME, which is then handled by the PCI core through
> > > PME polling or the PCIe PME service driver to complete the wakeup of the
> > > endpoint.
> > > 
> > > WAKE# is added in dts schema and merged based on below links.
> > > 
> > > Link: https://lore.kernel.org/all/20250515090517.3506772-1-krishna.chundru@oss.qualcomm.com/
> > > Link: https://github.com/devicetree-org/dt-schema/pull/170
> > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > No. Linus never gave this tag for *this* patch.
> Linus gave this on v5 [1], might be a overlook.
> 
> [1] Re: [PATCH v5 2/2] PCI: Add support for PCIe WAKE# interrupt - Linus
> Walleij <https://lore.kernel.org/all/CACRpkdY9HsnG=xo=swnMcVha+unmvmxR6e6Ynsj09srM_tPmWA@mail.gmail.com/>
> 

Oh yes. I didn't check it properly. Please ignore my comment.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

