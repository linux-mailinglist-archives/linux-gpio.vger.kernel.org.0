Return-Path: <linux-gpio+bounces-39369-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ofS8GRRTRmpHQwsAu9opvQ
	(envelope-from <linux-gpio+bounces-39369-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Jul 2026 14:01:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA086F735B
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Jul 2026 14:01:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=gRKPHQdn;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39369-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39369-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 52AE130D2774
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jul 2026 11:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FCFB3FADE2;
	Thu,  2 Jul 2026 11:24:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889393CB2EF;
	Thu,  2 Jul 2026 11:24:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782991453; cv=none; b=DU1oFSOTsf3FuII3vuit6Ps6kMkc0wdbvln9AXtXYsb2W1YgwGBPS191qfd0ve6BTt8OJaEe6EHJdWtDYtwJJQGcC5qJwrIiSL1J6yHduEL2ibus/hCwwDWU8m2vDboKwDpfWdeZc+FZHTh6WzpXIA/flCdMZYDvJzbtNKNLDRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782991453; c=relaxed/simple;
	bh=qkoV9s2y6x4yNdhq0hTzUvepfbsJFBQynC64lFxnuaw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RM6ybe1GF3NeZkBE7sV/SYhnZCPE/gSdoTuKsoVCZTPi6wn/CpSkhJaGyMjO37/98DB0V5fCZMrUnFySS1fC4LR2GxcVveFZMFC+avIPJDi+M0ZW4KcfQHmfWH+SP/etmpDFWwy3X3gnKUXAWRkv1QaEWd3suX0faxIvKaJmDCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gRKPHQdn; arc=none smtp.client-ip=185.246.84.56
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0F44C1A0DDF;
	Thu,  2 Jul 2026 11:24:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C2EE85FF03;
	Thu,  2 Jul 2026 11:24:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EEBBF104C9625;
	Thu,  2 Jul 2026 13:23:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782991441; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UhZPL9qBPAYg4jDprXnZJkURUAU98LtK2IDx/RRjPVY=;
	b=gRKPHQdndkfSqFS49JzsIHQw2aOVyEHrPo49N6M5vahEK4abVvfiNdgAcQZ85BqTYrDYa7
	bgLIWbFxIEkSIFB0swC6iE9XJv8Ex/UNCwCUK2VH602vIVMKlgsgkVCB0kMkLUyVlXGAwh
	WrlKxRi9YwfmHOoRW6XGCBIo2DbY76dKZcM2qU5WCc/tgL8G73urX+4WNs4mRzBaqFyTms
	wzbg1YIUbmzkq/tLQjIDWEDm3GV8tSD7knUa16eYfGis9bnzsGsQnl51p65DzPCBQGMT2K
	5finRL11wVel1S/u3qrLN6S4dAT3WZZiydzHKCLvRx/mUD38ag2hi2cYxOCn9w==
Date: Thu, 2 Jul 2026 13:23:48 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Richard Cheng <icheng@nvidia.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>, Saravana
 Kannan <saravanak@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald
 <rf@opensource.cirrus.com>, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Linus Walleij <linusw@kernel.org>, Len Brown <lenb@kernel.org>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally
 <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Davidlohr Bueso
 <dave@stgolabs.net>, Jonathan Cameron <jic23@kernel.org>, Dave Jiang
 <dave.jiang@intel.com>, Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Dan Williams <djbw@kernel.org>,
 Ira Weiny <iweiny@kernel.org>, Li Ming <ming.li@zohomail.com>, Lizhi Hou
 <lizhi.hou@amd.com>, driver-core@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-cxl@vger.kernel.org, Allan Nielsen <allan.nielsen@microchip.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>, Daniel Machon
 <daniel.machon@microchip.com>, Steen Hegelund
 <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, stable@vger.kernel.org
Subject: Re: [PATCH v8 7/8] PCI: of: Set fwnode device of newly created PCI
 device nodes
Message-ID: <20260702132348.034264b6@bootlin.com>
In-Reply-To: <akXg4G4ksietvkwE@MWDK4CY14F>
References: <20260630102804.413563-1-herve.codina@bootlin.com>
	<20260630102804.413563-8-herve.codina@bootlin.com>
	<akXg4G4ksietvkwE@MWDK4CY14F>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,kernel.org,linuxfoundation.org,google.com,cirrus.com,opensource.cirrus.com,linux.intel.com,gmail.com,stgolabs.net,intel.com,zohomail.com,amd.com,lists.linux.dev,vger.kernel.org,microchip.com,bootlin.com];
	TAGGED_FROM(0.00)[bounces-39369-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[vger.kernel.org:query timed out];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[41];
	FORGED_RECIPIENTS(0.00)[m:icheng@nvidia.com,m:andrew@lunn.ch,m:robh@kernel.org,m:saravanak@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:bhelgaas@google.com,m:david.rhodes@cirrus.com,m:rf@opensource.cirrus.com,m:ckeepax@opensource.cirrus.com,m:linusw@kernel.org,m:lenb@kernel.org,m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:dave@stgolabs.net,m:jic23@kernel.org,m:dave.jiang@intel.com,m:alison.schofield@intel.com,m:vishal.l.verma@intel.com,m:djbw@kernel.org,m:iweiny@kernel.org,m:ming.li@zohomail.com,m:lizhi.hou@amd.com,m:driver-core@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-sound@vger.kernel.org,m:patches@opensource.cirrus.com,m:linux-gpio@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:linux-cxl@vger.kernel.org,m:allan.nielsen@microchip.com,m:horatiu.vultur@microchip.com,m:daniel.machon@microchip.com,m:steen.hegelund@microchip.com,m:
 luca.ceresoli@bootlin.com,m:thomas.petazzoni@bootlin.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[herve.codina@bootlin.com,linux-gpio@vger.kernel.org];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RSPAMD_EMAILBL_FAIL(0.00)[herve.codina@bootlin.com:query timed out,linux-gpio@vger.kernel.org:query timed out];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herve.codina@bootlin.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,bootlin.com:dkim,bootlin.com:mid,bootlin.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9FA086F735B

Hi Richard,

On Thu, 2 Jul 2026 12:02:35 +0800
Richard Cheng <icheng@nvidia.com> wrote:

> > @@ -709,6 +709,13 @@ void of_pci_make_dev_node(struct pci_dev *pdev)
> >  	if (ret)
> >  		goto out_free_node;
> >  
> > +	/*
> > +	 * Set the fwnode device in order to have fw_devlink creating links
> > +	 * pointing to this PCI device instead of walking up to the PCI host
> > +	 * bridge.
> > +	 */
> > +	fw_devlink_set_device(&np->fwnode, &pdev->dev);
> > +
> >  	ret = of_changeset_apply(cset);
> >  	if (ret)
> >  		goto out_free_node;
> > -- 
> > 2.54.0
> > 
> >  
> 
> Hi Herve,
> 
> I wonder if this part has some issue, it sets np->fwnode.dev = &pdev->dev,
> but I don't see am matching clear on removal path, I doubt the back-pointer
> can outlive the pci_dev.
> 
> device_del() do the check
> """
> if (dev->fwnode && dev->fwnode->dev == dev)
>     fw_devlink_set_device(dev->fwnode, NULL);
> """
> 
> On removal, pci_stop_dev() calls of_pci_remove_node() before pci_destroy_dev()
> calls device_del(), and of_pci_remove_node() -> device_remove_of_node() has already NULLed pdev->dev.fwnode by then, so the "dev->fwnode" guard is false, and
> of_pci_remove_node() itself never clears np->fwnode.dev
> 
> If something holds an extra ref on np past removal, e.g. a DT overlay applied via configfs that pins np through its gragment targets,
> np survives, the pci_dev is freed, and np->fwnode.dev dnalges into freed memory.
> Then fw_devlink walker that resolve it via get_dev_from_fwnode() -> get_device() would hit a use-after-free .
> 
> I think of_pci_remove_node() should cleaer the back-pointer it set,
> before dropping the node's ref, e.g.
> 
> """
> np = pci_device_to_OF_node(pdev);
> if (!np || !of_node_check_flag(np, OF_DYNAMIC))
>     return;
> 
> fw_devlink_set_device(&np->fwnode, NULL);
> device_remove_of_node(&pdev->dev);
> of_changeset_revert(np->data);
> """
> 
> Does that make sense to you ?
> 

Thanks for pointed out this issue.

I am not sure that the scenario you proposed using configfs which can lead
to the use-after-free is relevant but anyway this use-after-free is possible.

The fwnode->dev is set by of_pci_make_dev_node() and so it is consistent 
to unset it (set to NULL) in of_pci_remove_node().

I will update this patch to add the fw_devlink_set_device(&np->fwnode, NULL);
call in the next iteration.

Also I will had a new patch in the next iteration to perform same operation
for PCI root bridge. Same kind of code path, and so same issue but with
of_pci_make_host_bridge_node() and of_pci_remove_host_bridge_node().

Best regards,
Hervé

