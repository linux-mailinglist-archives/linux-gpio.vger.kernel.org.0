Return-Path: <linux-gpio+bounces-39535-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HsDxL/fmS2rRcQEAu9opvQ
	(envelope-from <linux-gpio+bounces-39535-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 19:33:43 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB72713E96
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 19:33:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=avs52las;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39535-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39535-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7A02C303C7CB
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 17:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6245B3AE189;
	Mon,  6 Jul 2026 17:25:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB44E39734E;
	Mon,  6 Jul 2026 17:25:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783358705; cv=none; b=DEn9qxz0TVtLoweKfY6p7/vmXqdopTOksf/wwdjOPQfj37/hk9AgBMCFOvLeaIx/rg/sT8Ac/islT89kPXzUAT9pJxHl3bqH7HZYT9r+qXclymw9LN7zvHmzGdq0ij51EHo/8ilF8qty7PWt51xZ3tGYBhGR0HwBSPl1ZWY3DgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783358705; c=relaxed/simple;
	bh=2y5ckWPYQJ8G2pY4u8ihalHWvoXMugXkPGDdogkateY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PFPbaP34X1gid8I4Auf/7YoFbiWskWmuqtmG2WYrPmkLoPfriEgMJQXYcGxL8QFVJPLHQYUxA94uCw/dc6hKbeiJ+UguanbiM1pNAWWOlh9CCAOEqhMEU+qMU+F3bPnrKieEe1XZ3I0Tepr5xvisVLU0l6XUC+oW/DecJdzu5KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=avs52las; arc=none smtp.client-ip=192.198.163.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783358704; x=1814894704;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2y5ckWPYQJ8G2pY4u8ihalHWvoXMugXkPGDdogkateY=;
  b=avs52lasllYV8MBfFnVNO0epufBg2NxTWDAL5HpNQLyVek09sPeF+fCv
   VTjShPS2cMpyJo9nt1x4sDq+CEMerrl3+xDheD1ed59vWfS12HJAcSzaf
   pvCj/5FveLp9qwAGYN4VoX8Ok1V813oT8KoizbJPj7c386bAK2lkwJirW
   W+J5YbcuqnhlDJ7LUiJurfTJFtSpXvVqZX6vnVL17yby0bBjYU0jT7TTa
   5HTiqJimCjRs7m7kotk7BfRESednPLCdLOsSfZD2UFdB4Xv6rxG+jeK1E
   Llcs2oZE7XqSWSIjVsjObmOprtAdMpXtIZKQ5fk2pHkQBXEU6lW/AqXzJ
   g==;
X-CSE-ConnectionGUID: 3ge5sQZAT2O/L3y85c/o+Q==
X-CSE-MsgGUID: TTaj8KzvSJa1Rp4jjN0H9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="95378605"
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; 
   d="scan'208";a="95378605"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 10:25:03 -0700
X-CSE-ConnectionGUID: Lfe9lLBGTUu1ALhIe94NDQ==
X-CSE-MsgGUID: Ovu7lWmMTmic8Fiot1bOlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; 
   d="scan'208";a="258093602"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.48])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 10:24:59 -0700
Date: Mon, 6 Jul 2026 20:24:56 +0300
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
Subject: Re: [PATCH v2 2/5] software node: add fw_devlink support
Message-ID: <akvk6Lv2TdtyV_Rb@ashevche-desk.local>
References: <20260706-swnode-fw-devlink-v2-0-f39b09d50112@oss.qualcomm.com>
 <20260706-swnode-fw-devlink-v2-2-f39b09d50112@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-swnode-fw-devlink-v2-2-f39b09d50112@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39535-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,vger.kernel.org:from_smtp,linux.intel.com:from_mime,fwnode.dev:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3AB72713E96

On Mon, Jul 06, 2026 at 02:54:09PM +0200, Bartosz Golaszewski wrote:
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

...

> +	/*
> +	 * When the software node is the device's secondary firmware node,
> +	 * the core only records the owning device on the primary fwnode
> +	 * (see device_add()). fw_devlink resolves a supplier device through
> +	 * fwnode->dev, so without this a consumer referencing the software
> +	 * node could never find the supplier device and would defer forever.
> +	 * Make fwnode.dev point to its owner in that case.
> +	 */
> +	if (dev_fwnode(dev) != &swnode->fwnode && !swnode->fwnode.dev)

Can we use device_match_fwnode() here?

> +		swnode->fwnode.dev = dev;
> +

...

> +	/*
> +	 * Drop the device pointer mirrored onto a secondary software node in
> +	 * software_node_notify(). For a primary software node the core owns
> +	 * fwnode->dev and clears it in device_del().
> +	 */
> +	if (dev_fwnode(dev) != &swnode->fwnode && swnode->fwnode.dev == dev)
> +		swnode->fwnode.dev = NULL;

Ditto.

Note, it does check passed fwnode pointer against NULL, but looking at
the above &swnode->fwnode must never be NULL, so basically device_match_node()
will be an equivalent replacement.

-- 
With Best Regards,
Andy Shevchenko



