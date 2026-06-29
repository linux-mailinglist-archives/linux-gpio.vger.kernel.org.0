Return-Path: <linux-gpio+bounces-39149-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TT4PInuUQmpf+AkAu9opvQ
	(envelope-from <linux-gpio+bounces-39149-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 17:51:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED9C6DCF1F
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 17:51:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=LKLXyRqH;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39149-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39149-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 58F5330958AB
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 15:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE6BD436356;
	Mon, 29 Jun 2026 15:42:33 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2B441169A;
	Mon, 29 Jun 2026 15:42:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782747753; cv=none; b=nh/s3GkIs3g0x7i/NyS+Eoyc9aPMNYE09vxIbF1UXQnlvZFmDcEXrm/S1gXqYk05rDyptnHjiwdtZFF8xZXEJWtQ/dPFhonDwW12dBRBJY6pAXcIj3AN6dyFvpoKoC1t18EndLiiDiOTvC4LZWkLqg++X+N8bPmUlGUMzhwGWCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782747753; c=relaxed/simple;
	bh=ysWvzBMEdR3mUroLwDVNAsSve67+hNkhz+NHSicxT08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bN9R7hy2HnTqLEzCmu+/knO+CQyHZFzB4IMsMWIY0fikaHvBAbK0XoN0G6vZ7nYB2qahdP7s1W8q0Ct9G/Xibj31BzTW780n6uxjbO3TKnIPpeY4L9+FOAYrs3NX4ar5gH+UNPivWYOjlcbgKbIweELvQbNhq4tXLGod2nPSvT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LKLXyRqH; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782747752; x=1814283752;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ysWvzBMEdR3mUroLwDVNAsSve67+hNkhz+NHSicxT08=;
  b=LKLXyRqHqZgbmdSWNgvAmyChc7YWH1zy7KPlACa58mifMhBiMhmEfVnd
   MYLTKis6HNxVCtGuMAXM3JjVd4Q1ZrznodjmzNqaflhZWAUr5YZ1Mbm+C
   1CZKAcrpt6emsaxoZAe79X+9urDmEkmrltlz5Xhb1Jv5QjcjkeXNO3GyR
   VQ+wBicQQk0N5DJCC9Wtmwc3eZDldiR1hrR/ar+zlEI+COSnvLTGAtSke
   0TYolkLtWRMWV+JDr5fVfiyLH3paMvtOxmGiubDKi2pIwtWHk4WSszKYV
   zUEWaPkyRAQvE2hx0OSfCBxE5XG6DxsbSgLlqw1I06M+WGyWBnzSFFcTc
   Q==;
X-CSE-ConnectionGUID: 9XUy9+jFQgmO4OJUNfTX4A==
X-CSE-MsgGUID: 9qXJ4kzVQLyv3vIipvFujw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="85988838"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="85988838"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 08:42:31 -0700
X-CSE-ConnectionGUID: bh/olGCDTnWxrxhKDnJA9A==
X-CSE-MsgGUID: Nm0odYGcTBy5w+oQuhtAug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="252140130"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 08:42:26 -0700
Date: Mon, 29 Jun 2026 18:42:24 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Herve Codina <herve.codina@bootlin.com>
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
Subject: Re: [PATCH 2/5] software node: add fw_devlink support
Message-ID: <akKSYKH2vyXMVcox@ashevche-desk.local>
References: <20260629-swnode-fw-devlink-v1-0-b90058b41839@oss.qualcomm.com>
 <20260629-swnode-fw-devlink-v1-2-b90058b41839@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-swnode-fw-devlink-v1-2-b90058b41839@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39149-lists,linux-gpio=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:herve.codina@bootlin.com,m:brendan.higgins@linux.dev,m:david@davidgow.net,m:raemoar63@gmail.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:brgl@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:kunit-dev@googlegroups.com,m:linux-acpi@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,linux.intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1ED9C6DCF1F

+Cc: Herve, to just ask the situation with one series that adds nice helper.

On Mon, Jun 29, 2026 at 12:52:07PM +0200, Bartosz Golaszewski wrote:
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

> +static int software_node_add_links(struct fwnode_handle *fwnode)
> +{
> +	const struct software_node_ref_args *ref, *ref_array;
> +	struct swnode *swnode = to_swnode(fwnode);
> +	const struct property_entry *prop;
> +	struct fwnode_handle *refnode;
> +	unsigned int count, i;

'i' is local to the loop.

> +	if (!swnode || !swnode->node->properties)
> +		return 0;
> +
> +	/*
> +	 * Unlike Device Tree, where phandles appear in many non-supplier
> +	 * contexts and a curated allowlist is required, a software node only
> +	 * carries a DEV_PROP_REF property when the author explicitly describes
> +	 * a reference to another node. Every such reference is therefore an
> +	 * intentional supplier dependency, so we create fwnode links for all
> +	 * of them.
> +	 */
> +	for (prop = swnode->node->properties; prop->name; prop++) {
> +		if (prop->type != DEV_PROP_REF || prop->is_inline)
> +			continue;
> +
> +		/*
> +		 * TODO: Graph "remote-endpoint" references go both ways
> +		 * between endpoint child nodes and would create endpoint
> +		 * cycles. Let's leave it out for now until we have potential
> +		 * users.
> +		 */
> +		if (!strcmp(prop->name, "remote-endpoint"))
> +			continue;
> +
> +		ref_array = prop->pointer;
> +		count = prop->length / sizeof(*ref_array);

Seems we are going to have more of a such, perhaps make a helper for counting
(which will do that division beneath).

> +		for (i = 0; i < count; i++) {

		for (unsigned int i = 0; i < count; i++) {

> +

Redundant blank line?

> +			if (ref->swnode)
> +				refnode = software_node_fwnode(ref->swnode);
> +			else if (ref->fwnode)
> +				refnode = ref->fwnode;
> +			else
> +				continue;
> +
> +			/* Supplier not registered yet, or self-reference. */
> +			if (!refnode || refnode == &swnode->fwnode)
> +				continue;
> +
> +			fwnode_link_add(&swnode->fwnode, refnode, 0);
> +		}
> +	}
> +
> +	return 0;
> +}

...

> +	/*
> +	 * When the software node is the device's secondary firmware node, the
> +	 * core only records the owning device on the primary fwnode (see
> +	 * device_add()). fw_devlink resolves a supplier device through
> +	 * fwnode->dev, so without this a consumer referencing the software
> +	 * node could never find the supplier device and would defer forever.
> +	 * Make fwnode.dev point to its owner in that case.

The below seems more balanced in terms of line lengths.

	 * When the software node is the device's secondary firmware node,
	 * the core only records the owning device on the primary fwnode
	 * (see device_add()). fw_devlink resolves a supplier device through
	 * fwnode->dev, so without this a consumer referencing the software
	 * node could never find the supplier device and would defer forever.
	 * Make fwnode.dev point to its owner in that case.

> +	 */
> +	if (dev_fwnode(dev) != &swnode->fwnode && !swnode->fwnode.dev)
> +		swnode->fwnode.dev = dev;

Doesn't Herve's patch(es) add some helpers for this?
https://lore.kernel.org/lkml/20260511155930.34604-2-herve.codina@bootlin.com/

Ah, still not applied :-( Perhaps it can be applied as just part that brings
fw_devlink_set_device()?

> +	/*
> +	 * Drop the device pointer mirrored onto a secondary software node in
> +	 * software_node_notify(). For a primary software node the core owns
> +	 * fwnode->dev and clears it in device_del().
> +	 */
> +	if (dev_fwnode(dev) != &swnode->fwnode && swnode->fwnode.dev == dev)
> +		swnode->fwnode.dev = NULL;

-- 
With Best Regards,
Andy Shevchenko



