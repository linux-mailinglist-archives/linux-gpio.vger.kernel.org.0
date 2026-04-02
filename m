Return-Path: <linux-gpio+bounces-34590-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iD5UF0luzmnxngYAu9opvQ
	(envelope-from <linux-gpio+bounces-34590-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 15:25:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EF86A389A88
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 15:25:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E8E1B30306D4
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2026 13:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DCCA308F07;
	Thu,  2 Apr 2026 13:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TEJx1aux"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D872ED17B;
	Thu,  2 Apr 2026 13:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775136238; cv=none; b=Uuky24kqxDJUEK45xaPCQGerzovVuGxDSK5Vrcx7obNdMHFso9gzildUIjkaA22MKTIZVQFc1IMykoNm2NM/8UyD/xbpYYehMf67nT6CLY9GGLyB9srLrxAkIKYLu9C9LRojyA2dDfTLShJgmwLl4/Q5UncCfSa0R8/VqxN7n3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775136238; c=relaxed/simple;
	bh=edjl+8j9o62SXBHpmkircuLpVvzEO7MK2bsQthUrnIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rcbAT3pZp1RqP++VZu0/Saye4JtzRIK2rLg0iw7Vy90y7tAiBg/rWTABAlVtt+CV6txfpcb7C0RBdc0sk/2j4oOBy76qCkOsSQTML7H/BhOCk2HJlBnW037BhUTRgy+iwAh9g6ZPFE0qbdeic70GQKwGcAL6HB3cvM71fDAWo3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TEJx1aux; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775136237; x=1806672237;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=edjl+8j9o62SXBHpmkircuLpVvzEO7MK2bsQthUrnIA=;
  b=TEJx1aux2F5U9IYPitrApdhwM59WNC5AEV/9Ex3V0HgAS4K2462+gz1O
   8wPlULW2flPNEjNzJNDqAB+PXp/louT06QmhIGv2sbaYeoMuN4FBH2rIt
   SJMc4JMFo3JOygfoHNn/f1qAlbcxCtWSy1NbpNRDrUtSOx/SJ3dZHXsCN
   Zbm42q3uaZVT3lC0cxxQbpKOHq1+7GciRj5/DqOsrJX0r9EA2XdCcYj3a
   Lrbzfm1qar/4ItbCnvkUufCLl+2qfc/LqOQmhdaeTvNJX16nH8+RWNcND
   opCW8QuM2UdxDeQL6Zz8SZA5WB9RslI3Zm+joAv03epseNLkGootergnZ
   g==;
X-CSE-ConnectionGUID: ptbgPT/WQCmGbpW8yM3SpQ==
X-CSE-MsgGUID: vP292jZNR4iBmv4jnemyVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="93776951"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="93776951"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:23:56 -0700
X-CSE-ConnectionGUID: 8wTr4JB5QyarixZf+Zqgtw==
X-CSE-MsgGUID: Q9CfvC6/S/av/mHQCN7Qvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="222616208"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.31])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:23:51 -0700
Date: Thu, 2 Apr 2026 16:23:49 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	brgl@kernel.org
Subject: Re: [PATCH v2 0/4] platform/x86: x86-android-tablets: use real
 firmware node references with intel drivers
Message-ID: <ac5t5XozmzN9oq96@ashevche-desk.local>
References: <20260402-baytrail-real-swnode-v2-0-6f5054a4cc07@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402-baytrail-real-swnode-v2-0-6f5054a4cc07@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,linuxfoundation.org,kernel.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-34590-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ashevche-desk.local:mid,intel.com:dkim]
X-Rspamd-Queue-Id: EF86A389A88
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 02:54:25PM +0200, Bartosz Golaszewski wrote:
> First let me repeat the problem statement:
> 
> ==
> 
> GPIO software node lookup should rely exclusively on matching the
> addresses of the referenced firmware nodes. I tried to enforce it with
> commit e5d527be7e69 ("gpio: swnode: don't use the swnode's name as the
> key for GPIO lookup") but it broke existing users who abuse the software
> node mechanism by creating "dummy" software nodes named after the device
> they want to get GPIOs from but never attaching them to the actual GPIO
> devices. They rely on the current behavior of GPIOLIB where it will match
> the label of the GPIO controller against the name of the software node
> and does not require a true link.
> 
> x86-android-tablets driver is one of the abusers in that it creates
> dummy software nodes for baytrail and cherryview GPIO controllers but
> they don't really reference these devices. Before we can reapply
> e5d527be7e69 and support matching by fwnode address exclusively, we need
> to convert all the users to using actual fwnode references.
> 
> ==
> 
> Now for the new approach:
> 
> Now with the recent patches I sent or plan to send out, it turns out
> that almost all existing users of software node lookup can easily have
> the software node's representing the GPIO controllers attached to their
> target devices as their primary firmware node. The remaining complex
> cases are: pcengines-apuv2 and geode-common but in the first case we
> have control over the creation of the GPIO device - we can assign it a
> firmware node - and in the second case, we deal with an MFD driver so
> can export the cell's software node in a header.
> 
> The only remaining use-case where we need to reference a GPIO controller
> described in ACPI from a software node is the x86-android-tablets
> driver. In this case, I think it no longer makes sense to propose a new
> generic interface. Instead, I'd like to propose to keep it as a
> driver-specific quirk.
> 
> This series proposes the following changes:
> 1. Switch to returning -ENXIO if we try to resolve a reference to
> a software node that's not registered as a firmware node yet to
> differentiate it from other situations in which we return -ENOENT.
> 2. In GPIO core: return -EPROBE_DEFER from swnode lookup if
> fwnode_get_reference_args() returns -ENXIO as an unregistered software
> node is not much different from the situation where there's a firmware
> node not backed by a device yet.
> 3. Export the acpi_bus_type symbol. It's already available in the
> acpi_bus.h header but it's not available to loadable modules.

Nowadays we don't do that but export the dev_is_acpi() or something similar if
it's not yet available and to_acpi_dev(). (Names are derived from the existing
pattern, they might be need to be adjusted, dunno.) See how PNP does that.
Note, I haven't read the patches yet, just a quick comment.

> 4. Finally: implement support for dynamic assignment of secondary
> firmware nodes in the x86-android-tablets driver. More details on how
> it's approached are in the relevant commit message.
> 
> Merging strategy: I'd like to propose queing patches 1-3 independently
> through their respective trees: driver core, GPIO and ACPI. The final
> patch would make its way upstream after v7.1-rc1. I would probably
> extend it to convert the driver to using more devres interfaces too at
> this point.

-- 
With Best Regards,
Andy Shevchenko



