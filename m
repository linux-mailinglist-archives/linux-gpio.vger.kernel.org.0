Return-Path: <linux-gpio+bounces-39153-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b1coK9iWQmr5+AkAu9opvQ
	(envelope-from <linux-gpio+bounces-39153-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 18:01:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E546DD103
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 18:01:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=d7uv2OAu;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39153-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39153-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 50838303F4AE
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 15:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12EC944CF3E;
	Mon, 29 Jun 2026 15:49:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7A043C07D;
	Mon, 29 Jun 2026 15:49:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782748154; cv=none; b=RTm6o9wokvPeE3rDQDYXQEKeoh9CX7fYiRl72CKBOEcWEXtzF/l57zxAtzGMhz3zkozt4wpwULPM79IO71goTGAcV4km8Utybt4iJ7wizCkKpPFM+SPQsxZS/KxmCqwmb1eKK4FGnjk1PKGY6+g69MWen0psV8BpZJwriYnlNe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782748154; c=relaxed/simple;
	bh=Ag/eJAqyGGN2jk5s2m6mqJmP8X5lDT8ty8B5rzYFAzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p44q5eyIcsqR8aZRAHZmvm5q9lJXnSf+pYhKp8Tp6FrpxxrWrshLpijFW1WK9p8gtabP3Xyb1DskWgmk0jH/8+I/V1/h5MoQ+ORrS+Ja6Dr1nIsftIMazvUuWpGfnFGFryS2UqPYrG5SoPlm/A+CbqWeDs8cZI/9dO1s8N1oGp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d7uv2OAu; arc=none smtp.client-ip=198.175.65.12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782748154; x=1814284154;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ag/eJAqyGGN2jk5s2m6mqJmP8X5lDT8ty8B5rzYFAzk=;
  b=d7uv2OAu/LeiGU5p0gqNl3IXGjEOrvbE0mSjNSnLkKzK1eqTc72oERxB
   kn4idgf+MqIsKi4QEsFc7LoKhq5vX08HcrP2SDUUgtIMk2AxHkM1w3cne
   oQ4P1R5BqbKfJwmHcFtUZqX1ED7pIwWC5VXMgDcMPkDiD6UH+R2fMjYKF
   Uea5M0Fe08Nc3YnBvICEeYcFzu+zkxMEPEYVuiGV02B6dKWerNs0HeC08
   v+loXKxuH8tiKWfWZIbiUgsFa6xuFN70fWNNEtnJ12nw2o6rh6uU+aeRZ
   7QpY5YSqfwjLCMej7eNlcYDvHVeOUrkOeeWVdbpOxmo9Eg1t1Rn/guvCK
   w==;
X-CSE-ConnectionGUID: q+4NgxrITQKIGNM1DLQGNQ==
X-CSE-MsgGUID: 3x1S+t/rQimB8er04oY43Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="94934703"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="94934703"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 08:49:13 -0700
X-CSE-ConnectionGUID: O3ZfXutsRSmdIJ7hbEEtqg==
X-CSE-MsgGUID: wti4M/4/SgWgrQDz+5m2yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="249364328"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 08:49:09 -0700
Date: Mon, 29 Jun 2026 18:49:06 +0300
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
Subject: Re: [PATCH 3/5] software node: add kunit tests for fw_devlink support
Message-ID: <akKT8q5TjkMkZkmB@ashevche-desk.local>
References: <20260629-swnode-fw-devlink-v1-0-b90058b41839@oss.qualcomm.com>
 <20260629-swnode-fw-devlink-v1-3-b90058b41839@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-swnode-fw-devlink-v1-3-b90058b41839@oss.qualcomm.com>
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
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39153-lists,linux-gpio=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:brendan.higgins@linux.dev,m:david@davidgow.net,m:raemoar63@gmail.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:brgl@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:kunit-dev@googlegroups.com,m:linux-acpi@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.dev,davidgow.net,gmail.com,linux.intel.com,kernel.org,linuxfoundation.org,vger.kernel.org,googlegroups.com,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[linux-gpio@vger.kernel.org:query timed out];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,intel.com:dkim,ashevche-desk.local:mid,vger.kernel.org:from_smtp,linux.intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 96E546DD103

On Mon, Jun 29, 2026 at 12:52:08PM +0200, Bartosz Golaszewski wrote:
> Add a kunit test suite for fw_devlink support for software nodes.
> 
> Most cases call add_links() directly and inspect the resulting fwnode
> supplier/consumer lists: a single reference, multiple references, a
> reference to an unregistered node, a "remote-endpoint" reference and a
> reference array. The last case is end-to-end - it registers real consumer
> and supplier platform devices together with their drivers, adds the
> consumer first and checks that fw_devlink defers its probe until the
> supplier has been bound.

...

> ---
>  drivers/base/test/Kconfig               |   5 +
>  drivers/base/test/Makefile              |   3 +
>  drivers/base/test/swnode-devlink-test.c | 336 ++++++++++++++++++++++++++++++++

+ MAINTAINERS.

...


>  CFLAGS_property-entry-test.o += $(DISABLE_STRUCTLEAK_PLUGIN)
> +
> +obj-$(CONFIG_DRIVER_SWNODE_KUNIT_TEST) += swnode-devlink-test.o
> +CFLAGS_swnode-devlink-test.o += $(DISABLE_STRUCTLEAK_PLUGIN)

Is it the case for this?

...

> +#include <linux/device.h>
> +#include <linux/fwnode.h>

+ list.h

> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/types.h>
> +#include <linux/wait.h>

...

> +static int swnode_count_suppliers(struct fwnode_handle *fwnode)
> +{
> +	struct fwnode_link *link;
> +	int ret = 0;

Why signed? Also it's not 'ret' semantically it's 'count'.

> +	/*
> +	 * The suppliers and consumers lists should typically only be accessed
> +	 * with the fwnode_link_lock taken but it's private to the driver core.
> +	 *
> +	 * These are tests and at this point nobody should be modifying them so
> +	 * let's just access the list.
> +	 */
> +	list_for_each_entry(link, &fwnode->suppliers, c_hook)
> +		ret++;
> +
> +	return ret;
> +}

...

> +/* A single reference creates exactly one supplier link, on both list ends. */
> +static void swnode_devlink_test_single_ref(struct kunit *test)
> +{
> +	static const struct software_node supp_swnode = {
> +		.name = "swnode-devlink-test-supplier"

Keep trailing comma.

> +	};

> +

Redundant blank line.

> +	struct fwnode_handle *cons_fwnode, *supp_fwnode;
> +	int ret;
> +
> +	const struct property_entry props[] = {
> +		PROPERTY_ENTRY_REF("supplier", &supp_swnode),
> +		{ }
> +	};
> +
> +	supp_fwnode = kunit_software_node_register(test, &supp_swnode);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, supp_fwnode);
> +
> +	cons_fwnode = kunit_fwnode_create_software_node(test, props, NULL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cons_fwnode);
> +
> +	ret = fwnode_call_int_op(cons_fwnode, add_links);
> +	KUNIT_EXPECT_EQ(test, ret, 0);
> +
> +	KUNIT_EXPECT_EQ(test, swnode_count_suppliers(cons_fwnode), 1);
> +	KUNIT_EXPECT_TRUE(test, swnode_has_link(cons_fwnode, supp_fwnode));
> +}

...

> +/* Multiple distinct references create multiple supplier links. */
> +static void swnode_devlink_test_multiple_refs(struct kunit *test)
> +{
> +	static const struct software_node supp1_swnode = {
> +		.name = "swnode-devlink-test-supplier-1"

Keep comma.

> +	};
> +	static const struct software_node supp2_swnode = {
> +		.name = "swnode-devlink-test-supplier-2"

Ditto.

> +	};
> +	static const struct software_node *supp_nodes[] = {
> +		&supp1_swnode, &supp2_swnode, NULL

Here it's fine.

> +	};

> +

Redundant blank line.

> +	const struct property_entry props[] = {
> +		PROPERTY_ENTRY_REF("foo", &supp1_swnode),
> +		PROPERTY_ENTRY_REF("bar", &supp2_swnode),
> +		{ }
> +	};
> +
> +	struct fwnode_handle *fwnode;
> +	int ret;
> +
> +	ret = kunit_software_node_register_node_group(test, supp_nodes);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	fwnode = kunit_fwnode_create_software_node(test, props, NULL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fwnode);
> +
> +	ret = fwnode_call_int_op(fwnode, add_links);
> +	KUNIT_EXPECT_EQ(test, ret, 0);
> +
> +	KUNIT_EXPECT_EQ(test, swnode_count_suppliers(fwnode), 2);
> +	KUNIT_EXPECT_TRUE(test, swnode_has_link(fwnode, software_node_fwnode(&supp1_swnode)));
> +	KUNIT_EXPECT_TRUE(test, swnode_has_link(fwnode, software_node_fwnode(&supp2_swnode)));
> +}

...

> +static void swnode_devlink_test_unregistered_ref(struct kunit *test)

Same comments as per above.

...

> +static void swnode_devlink_test_remote_endpoint_excluded(struct kunit *test)

Ditto.

...

> +static void swnode_devlink_test_ref_array(struct kunit *test)

Ditto.

...

> +#define SWNODE_DEVLINK_TEST_TIMEOUT_MS	2000

(2 * MSEC_PER_SEC) ?
(will require time.h).

...

> +static int swnode_test_record_probe(struct platform_device *pdev)
> +{
> +	struct swnode_test_probe_order *order = platform_get_drvdata(pdev);
> +
> +	if (order && order->count < ARRAY_SIZE(order->probed)) {

+ array_size.h

> +		order->probed[order->count++] = dev_name(&pdev->dev);
> +		wake_up_interruptible(&order->wq);
> +	}
> +
> +	return 0;
> +}

...

> +static void swnode_devlink_test_probe_order(struct kunit *test)

As per above comments.

...

> +static struct kunit_suite swnode_test_suite = {
> +	.name = "software-node-links",
> +	.test_cases = swnode_test_cases,
> +};

> +

Redundant blank line.

> +kunit_test_suite(swnode_test_suite);

-- 
With Best Regards,
Andy Shevchenko



