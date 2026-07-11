Return-Path: <linux-gpio+bounces-39884-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1XtLGZYAUmrdLAMAu9opvQ
	(envelope-from <linux-gpio+bounces-39884-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 10:36:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4F2740EB2
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 10:36:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=jLJgJtcQ;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39884-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39884-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 433933012E85
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 08:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDAE037BE85;
	Sat, 11 Jul 2026 08:36:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B75B1F0E29;
	Sat, 11 Jul 2026 08:36:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783758990; cv=none; b=mrAB7Q2NX8lBYnGzkqdNVhP9AyOR7hgZFqWW1bsJ4dWSfTIvQDd1uREClUoPDFryypFbDtMzcOyJJ59yI1+HRcS4E/ROVypCoU6Xeg+1BUNR9sHL4pHjTqCTeSzDMV5olGOPX0YTaJq9WcKGLjgLDIsEWr4Gck/DVQqiqwafugM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783758990; c=relaxed/simple;
	bh=ERp1QIJ3KEM1nNGDIwEWioJcD0DgL4jZVTqpkSpFmLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s3yBTN4WMEoPG9r/X4rfMmlPMci/CrwEFPKs49MIHQ+huicMJsWFHZB9fYRZK/zeB8cx8oeWtD3JMF9GF/JgHXWYmG1Pl1F6Tb3Hg7DasFNY8L5cAPA0x7Qek+BaDGfafzljnniYA08n+5npzeSXJ7/YgdlX2v1aB2N/AYL5fQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jLJgJtcQ; arc=none smtp.client-ip=192.198.163.8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783758988; x=1815294988;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ERp1QIJ3KEM1nNGDIwEWioJcD0DgL4jZVTqpkSpFmLQ=;
  b=jLJgJtcQgr2W18esSFMufv4+xpDCxSQMT9Qprz0yMQd6iOKsLgZODPQg
   s0WLHSy/JMJxv0AN1AeThZn1hAri6QNHakVwhRGe/2n27s/csEaK7fjIo
   7iAXN1iwZvSeO18agCYdROMZpqF5SjWm4VSMpWeKU2weWHB6ZljLr48Za
   2DnIqA8+qxr75PM7b5b1sg+XpbnW7yMvY6qYism2YbheZzkfjnyhkjgZb
   A/KWzbtvkzbHPsj6mqf/qOWbTU0utDO8OMjRTc/8TALhbfkVT99P9NiSb
   PrBnk+CNBRwj1/7QNqL7bfr2It2xZR1BDSPg1arbT8HZ7rODx5naFW3VG
   Q==;
X-CSE-ConnectionGUID: FZo/Qu69R96RSDUbaJX7lg==
X-CSE-MsgGUID: eLCFS2JsQLKPC4At+Cdapg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="101997548"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="101997548"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 01:36:27 -0700
X-CSE-ConnectionGUID: 9vBWdhD+SqOP7/7A7vPBww==
X-CSE-MsgGUID: 9mo3CRWPRbeFaszQSphnBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="251111669"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.254])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 01:36:23 -0700
Date: Sat, 11 Jul 2026 11:36:20 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com, linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 2/5] software node: add fw_devlink support
Message-ID: <alIAhDuSJDsvGIMV@ashevche-desk.local>
References: <20260710-swnode-fw-devlink-v3-0-993f31874e40@oss.qualcomm.com>
 <20260710-swnode-fw-devlink-v3-2-993f31874e40@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710-swnode-fw-devlink-v3-2-993f31874e40@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39884-lists,linux-gpio=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:brendan.higgins@linux.dev,m:david@davidgow.net,m:raemoar63@gmail.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:brgl@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:kunit-dev@googlegroups.com,m:linux-acpi@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.dev,davidgow.net,gmail.com,linux.intel.com,kernel.org,linuxfoundation.org,vger.kernel.org,googlegroups.com,lists.linux.dev];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ashevche-desk.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DF4F2740EB2

On Fri, Jul 10, 2026 at 03:51:21PM +0200, Bartosz Golaszewski wrote:
> Software nodes can be used to describe supplier-consumer relationships
> between devices they represent using reference property entries. Unlike
> for OF-nodes, driver core cannot yet use these references to create a
> probe order that avoids needless probe deferrals on missing providers.
> 
> Implement software_node_add_links() modelled on of_fwnode_add_links().
> For every DEV_PROP_REF property we resolve each referenced supplier and
> create an fwnode link from the node to it. The driver core later promotes
> these to device links and defers the consumer until the suppliers are
> ready.
> 
> There's no allowlist like the one DT needs - devicetree phandles appear
> in plenty of non-supplier contexts, but a software node only carries a
> reference property when its author explicitly points at another node, so
> we treat every reference as an intentional supplier dependency and link
> all of them. Graph "remote-endpoint" references are skipped for now: they
> go 2-ways between endpoint nodes and would create graph cycles without
> the port-parent lifting DT does via get_con_dev(). References to
> suppliers that aren't registered yet and self-references are ignored.
> 
> fw_devlink resolves the supplier device through fwnode->dev but the core
> only records the owning device on the primary fwnode. When the software
> node is a device's secondary fwnode, mirror the device pointer onto it in
> software_node_notify() so the consumer can actually find the supplier
> instead of deferring forever.
> 
> While at it: purge the fwnode links in software_node_release() now that
> software nodes can own them.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



