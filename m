Return-Path: <linux-gpio+bounces-38002-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rlAhKM9uImqiXAEAu9opvQ
	(envelope-from <linux-gpio+bounces-38002-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Jun 2026 08:38:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15442645917
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Jun 2026 08:38:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=A8S9ZnVm;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38002-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38002-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CF371301EC70
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jun 2026 06:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83025407CE0;
	Fri,  5 Jun 2026 06:37:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6D7134CF;
	Fri,  5 Jun 2026 06:37:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780641468; cv=none; b=bBRUcbdeMFWiZEY1oE1b1J2bIel++PcWhIm4i915nBAZe4mOq8xefk1hdH29VQoMz9NGqR+hwmkYGkFIr5BFJT1QxfpiAU+IxG76IOVLOhj9G4U/etkgs7zYNSLo63WlkmUdGJ3eNv/BIrBmx0+bhpw11M1O10y/SJX2bZLJTfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780641468; c=relaxed/simple;
	bh=2W2Z0yEsfvPID3nJ676bCZmV1HGOlnk9mb1VgflAgHM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a+9GqostZBGP5cGkW2lrZR96QpkQ7R8gV5Ojp1YYAHacsuBTH9hJ9UJNQIJQHFH0BDhLS3v2mlnHRSavijwGkh1sxufDno3v0rz6+qEJZtclOGZpSJZVamn6OM06fI8e9kfm83DLZfjuhEVwAAF2r+OXa72G6bdQ0Li8Jofgf2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=A8S9ZnVm; arc=none smtp.client-ip=185.171.202.116
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 680DDC5846E;
	Fri,  5 Jun 2026 06:37:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A96FA5FED1;
	Fri,  5 Jun 2026 06:37:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BF958106A1F0D;
	Fri,  5 Jun 2026 08:37:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780641461; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3IyHXE5kz/n0P8iPF96woiuOqliDOrQHxVfM4rBmin0=;
	b=A8S9ZnVmLHc2TeOD20ueswPQ2h9AH/Lrz65bcGqIXbWyNwoKK7UujEAsSt2UTcLUGo8PNU
	tMOy5+eoUJjOIgVsSo6uyjRAZRe0aSPu/mt9TSP/HuMLyvduncihLhub3KzDorbHAujJYb
	v8sdJGvdGucSBpMksUVdyjYe0TqG/IiyEQvzNurEKHor+U+yZue40FJ4FvMoEW3azUZvX7
	J14BjNow2/zRXmDln4ZOCxtaDhArmh5vJsFi3OaIAh3lg3jx7Qjy7hYIRiLikFr1JqiqdO
	vsYdhkhnBClMTF+v8u36hnu2bfhyFyZ0pvdOUq0MEg4wsY8rseJvmjgtv88rnw==
Date: Fri, 5 Jun 2026 08:37:31 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>, Saravana
 Kannan <saravanak@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Richard Fitzgerald
 <rf@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, Linus
 Walleij <linusw@kernel.org>, Len Brown <lenb@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Davidlohr Bueso <dave@stgolabs.net>,
 Jonathan Cameron <jic23@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>, Vishal Verma
 <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, Dan Williams
 <djbw@kernel.org>, Lizhi Hou <lizhi.hou@amd.com>, Herve Codina
 <herve.codina@bootlin.com>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com, linux-gpio@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org, Allan Nielsen
 <allan.nielsen@microchip.com>, Horatiu Vultur
 <horatiu.vultur@microchip.com>, Daniel Machon
 <daniel.machon@microchip.com>, Steen Hegelund
 <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v7 0/8] lan966x pci device: Add support for SFPs, PCI
 part
Message-ID: <20260605083731.1921f388@bootlin.com>
In-Reply-To: <20260511155930.34604-1-herve.codina@bootlin.com>
References: <20260511155930.34604-1-herve.codina@bootlin.com>
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
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38002-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:robh@kernel.org,m:saravanak@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:bhelgaas@google.com,m:ckeepax@opensource.cirrus.com,m:rf@opensource.cirrus.com,m:david.rhodes@cirrus.com,m:linusw@kernel.org,m:lenb@kernel.org,m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:dave@stgolabs.net,m:jic23@kernel.org,m:dave.jiang@intel.com,m:alison.schofield@intel.com,m:vishal.l.verma@intel.com,m:ira.weiny@intel.com,m:djbw@kernel.org,m:lizhi.hou@amd.com,m:herve.codina@bootlin.com,m:driver-core@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-sound@vger.kernel.org,m:patches@opensource.cirrus.com,m:linux-gpio@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:linux-cxl@vger.kernel.org,m:allan.nielsen@microchip.com,m:horatiu.vultur@microchip.com,m:daniel.machon@microchip.com,m:steen.hegelund@microchip.com,m:luca.ceresoli@
 bootlin.com,m:thomas.petazzoni@bootlin.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[herve.codina@bootlin.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[39];
	FREEMAIL_TO(0.00)[lunn.ch,kernel.org,linuxfoundation.org,google.com,opensource.cirrus.com,cirrus.com,linux.intel.com,gmail.com,stgolabs.net,intel.com,amd.com,bootlin.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herve.codina@bootlin.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:mid,bootlin.com:dkim,bootlin.com:from_mime,bootlin.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 15442645917

Hi Bjorn, all,

On Mon, 11 May 2026 17:59:20 +0200
Herve Codina <herve.codina@bootlin.com> wrote:

> Hi,
> 
> Previously, I sent a big picture series adding support for SFP ports
> available on the LAN966x PCI device [0].
> 
> In this series patches touch several parts and sub-system in the kernel.
> Reviews have be done and it makes sense to split the series and send
> parts separately.
> 
> This current series is the extraction of patches related to issues in
> the PCI subsystem. It has to be seen as a continuation of the big
> picture series but related to this specific core part.
> 
> Patches 1 to 6 introduce and use fw_devlink_set_device() in already
> existing code. No functional change but the introduction of the
> fw_devlink_set_device() wrapper.
> 
> Patches 7 and 8 fix fw_devlink issues specific to PCI and the
> device-tree nodes created during enumeration.
> 
> [0] https://lore.kernel.org/all/20260325143555.451852-1-herve.codina@bootlin.com/
> 
> Best regards,
> Hervé
> 

I haven't received any feedback on this series other than the
"Reviewed-by: Andy Shevchenko" tags.

IHMO, the series is ready to be applied. Do you have any comments ?

Best regards,
Hervé



