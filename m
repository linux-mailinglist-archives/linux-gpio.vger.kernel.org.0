Return-Path: <linux-gpio+bounces-39883-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id e6sLCN32UWq0KwMAu9opvQ
	(envelope-from <linux-gpio+bounces-39883-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 09:55:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB065740D09
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 09:55:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=davidgow.net (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39883-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39883-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 457393013B87
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 07:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A52F37FF42;
	Sat, 11 Jul 2026 07:55:06 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DE237BE93;
	Sat, 11 Jul 2026 07:55:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783756506; cv=none; b=AsCwAVXBGbO+8I34Opty9W1P+zEU7JFnYS7ihbGG8KGOJZP02eX01ygbFs/YQjlaijuA+wop8EF+Em/o9+1A3aGHAVxFqu/flefj66PN1xia2fNs6WJQl5qL3Y07rsnxDIH1JDxqTTde+WlEMb1LoCKe1EmvzaHAGhoghRg8++4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783756506; c=relaxed/simple;
	bh=73dl4oaQT4KIkBOydXGjuAcZD0lIq6s5to74ZMYSHRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cxm2tT5rARd5DIbLh6rlMqwtLtuUEogxyNtjFjxskDWUJYWTTk3WCVWbWn0zY6Ot/XuWqiYG1vN696I7A+UT38vV2L34HV8cEeVIWvDwNt2oI58JHcn1tI/faSWvMnPpl4lPL2hsADyGbnfUitly25drRb4ZSL8xc1Sp7O1LkgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; arc=none smtp.client-ip=203.29.242.92
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 132AE1EA723; Sat, 11 Jul 2026 15:54:54 +0800 (AWST)
X-Spam-Level: 
Received: from [IPV6:2001:8003:8810:ea00::41b] (unknown [IPv6:2001:8003:8810:ea00::41b])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id C62F91EA713;
	Sat, 11 Jul 2026 15:54:46 +0800 (AWST)
Message-ID: <7f5e3f36-3e6e-4fb1-8480-6bfcac5835fd@davidgow.net>
Date: Sat, 11 Jul 2026 15:54:46 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] software node: add kunit tests for fw_devlink
 support
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Linus Walleij <linusw@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-acpi@vger.kernel.org,
 driver-core@lists.linux.dev, linux-gpio@vger.kernel.org
References: <20260710-swnode-fw-devlink-v3-0-993f31874e40@oss.qualcomm.com>
 <20260710-swnode-fw-devlink-v3-3-993f31874e40@oss.qualcomm.com>
Content-Language: en-US
From: David Gow <david@davidgow.net>
In-Reply-To: <20260710-swnode-fw-devlink-v3-3-993f31874e40@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[davidgow.net : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39883-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,gmail.com,linux.intel.com,kernel.org,linuxfoundation.org];
	FORGED_SENDER(0.00)[david@davidgow.net,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:brendan.higgins@linux.dev,m:raemoar63@gmail.com,m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:brgl@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:kunit-dev@googlegroups.com,m:linux-acpi@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[david@davidgow.net,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,intel.com:email,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EB065740D09



Le 10/07/2026 à 21:51, Bartosz Golaszewski a écrit :
> Add a kunit test suite for fw_devlink support for software nodes.
> 
> Most cases call add_links() directly and inspect the resulting fwnode
> supplier/consumer lists: a single reference, multiple references, a
> reference to an unregistered node, a "remote-endpoint" reference and a
> reference array. The last case is end-to-end - it registers real consumer
> and supplier platform devices together with their drivers, adds the
> consumer first and checks that fw_devlink defers its probe until the
> supplier has been bound.
> 
> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Work fine here, thanks!

Tested-by: David Gow <david@davidgow.net>

Cheers,
-- David

>   MAINTAINERS                             |   1 +
>   drivers/base/test/Kconfig               |   5 +
>   drivers/base/test/Makefile              |   2 +
>   drivers/base/test/swnode-devlink-test.c | 339 ++++++++++++++++++++++++++++++++
>   4 files changed, 347 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4a8b0fd665ce2447c3e89784b142d998f7384b95..d7741614c941ceed9e46e9caea72bad77cfb7618 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25105,6 +25105,7 @@ L:	linux-acpi@vger.kernel.org
>   S:	Maintained
>   F:	drivers/base/property.c
>   F:	drivers/base/swnode.c
> +F:	drivers/base/test/swnode-devlink-test.c
>   F:	include/linux/fwnode.h
>   F:	include/linux/property.h
>   
> diff --git a/drivers/base/test/Kconfig b/drivers/base/test/Kconfig
> index 2756870615ccab67ec26d8671c1e4dba69342134..1ecf0791241a1b2eee7e1e787772217724abacb9 100644
> --- a/drivers/base/test/Kconfig
> +++ b/drivers/base/test/Kconfig
> @@ -18,3 +18,8 @@ config DRIVER_PE_KUNIT_TEST
>   	tristate "KUnit Tests for property entry API" if !KUNIT_ALL_TESTS
>   	depends on KUNIT
>   	default KUNIT_ALL_TESTS
> +
> +config DRIVER_SWNODE_KUNIT_TEST
> +	tristate "KUnit Tests for software node fw_devlink links" if !KUNIT_ALL_TESTS
> +	depends on KUNIT
> +	default KUNIT_ALL_TESTS
> diff --git a/drivers/base/test/Makefile b/drivers/base/test/Makefile
> index e321dfc7e92266d2073d442f652cadb6e911dba5..9ced7bbd569fc49ba2719aa0cab57c7d8245dde1 100644
> --- a/drivers/base/test/Makefile
> +++ b/drivers/base/test/Makefile
> @@ -6,3 +6,5 @@ obj-$(CONFIG_DM_KUNIT_TEST)	+= platform-device-test.o
>   
>   obj-$(CONFIG_DRIVER_PE_KUNIT_TEST) += property-entry-test.o
>   CFLAGS_property-entry-test.o += $(DISABLE_STRUCTLEAK_PLUGIN)
> +
> +obj-$(CONFIG_DRIVER_SWNODE_KUNIT_TEST) += swnode-devlink-test.o
> diff --git a/drivers/base/test/swnode-devlink-test.c b/drivers/base/test/swnode-devlink-test.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..6f59f13214fcf39cebe02244bd0029470d3d104a
> --- /dev/null
> +++ b/drivers/base/test/swnode-devlink-test.c
> @@ -0,0 +1,339 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) Qualcomm Technologies, Inc. and/or its subsidiaries
> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/device.h>
> +#include <linux/fwnode.h>
> +#include <linux/list.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/time.h>
> +#include <linux/types.h>
> +#include <linux/wait.h>
> +
> +#include <kunit/fwnode.h>
> +#include <kunit/platform_device.h>
> +#include <kunit/test.h>
> +
> +static int swnode_count_suppliers(struct fwnode_handle *fwnode)
> +{
> +	struct fwnode_link *link;
> +	unsigned int count = 0;
> +
> +	/*
> +	 * The suppliers and consumers lists should typically only be accessed
> +	 * with the fwnode_link_lock taken but it's private to the driver core.
> +	 *
> +	 * These are tests and at this point nobody should be modifying them so
> +	 * let's just access the list.
> +	 */
> +	list_for_each_entry(link, &fwnode->suppliers, c_hook)
> +		count++;
> +
> +	return count;
> +}
> +
> +/* True if a supplier link con->sup exists, checked from both list ends. */
> +static bool swnode_has_link(struct fwnode_handle *consumer,
> +			    struct fwnode_handle *supplier)
> +{
> +	bool from_con = false, from_sup = false;
> +	struct fwnode_link *link;
> +

Given there's a comment above in swnode_count_suppliers about these 
lists needing (normally) to be behind fwnode_link_lock, is it worth 
duplicating it for these loops here?

> +	list_for_each_entry(link, &consumer->suppliers, c_hook) {
> +		if (link->supplier == supplier && link->consumer == consumer)
> +			from_con = true;
> +	}
> +
> +	list_for_each_entry(link, &supplier->consumers, s_hook) {
> +		if (link->supplier == supplier && link->consumer == consumer)
> +			from_sup = true;
> +	}
> +
> +	return from_con && from_sup;
> +}
> +
> +/* A single reference creates exactly one supplier link, on both list ends. */
> +static void swnode_devlink_test_single_ref(struct kunit *test)
> +{
> +	static const struct software_node supp_swnode = {
> +		.name = "swnode-devlink-test-supplier",
> +	};
> +
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
> +
> +/* Multiple distinct references create multiple supplier links. */
> +static void swnode_devlink_test_multiple_refs(struct kunit *test)
> +{
> +	static const struct software_node supp1_swnode = {
> +		.name = "swnode-devlink-test-supplier-1",
> +	};
> +	static const struct software_node supp2_swnode = {
> +		.name = "swnode-devlink-test-supplier-2",
> +	};
> +	static const struct software_node *supp_nodes[] = {
> +		&supp1_swnode, &supp2_swnode, NULL
> +	};
> +
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
> +
> +/* A reference to an unregistered node creates no link (graceful skip). */
> +static void swnode_devlink_test_unregistered_ref(struct kunit *test)
> +{
> +	static const struct software_node supp_swnode = {
> +		.name = "swnode-devlink-test-supplier",
> +	};
> +
> +	const struct property_entry props[] = {
> +		PROPERTY_ENTRY_REF("supplier", &supp_swnode),
> +		{ }
> +	};
> +
> +	struct fwnode_handle *fwnode;
> +	int ret;
> +
> +	fwnode = kunit_fwnode_create_software_node(test, props, NULL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fwnode);
> +
> +	ret = fwnode_call_int_op(fwnode, add_links);
> +	KUNIT_EXPECT_EQ(test, ret, 0);
> +	KUNIT_EXPECT_EQ(test, swnode_count_suppliers(fwnode), 0);
> +}
> +
> +/* Graph "remote-endpoint" references are excluded. */
> +static void swnode_devlink_test_remote_endpoint_excluded(struct kunit *test)
> +{
> +	static const struct software_node ep_swnode = {
> +		.name = "swnode-devlink-test-end-point"
> +	};
> +
> +	const struct property_entry props[] = {
> +		PROPERTY_ENTRY_REF("remote-endpoint", &ep_swnode),
> +		{ }
> +	};
> +
> +	struct fwnode_handle *cons_fwnode, *supp_fwnode;
> +	int ret;
> +
> +	supp_fwnode = kunit_software_node_register(test, &ep_swnode);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, supp_fwnode);
> +
> +	cons_fwnode = kunit_fwnode_create_software_node(test, props, NULL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cons_fwnode);
> +
> +	ret = fwnode_call_int_op(cons_fwnode, add_links);
> +	KUNIT_EXPECT_EQ(test, ret, 0);
> +	KUNIT_EXPECT_EQ(test, swnode_count_suppliers(cons_fwnode), 0);
> +}
> +
> +/* A reference array creates one link per registered element. */
> +static void swnode_devlink_test_ref_array(struct kunit *test)
> +{
> +	static const struct software_node supp1_swnode = {
> +		.name = "swnode-devlink-test-supplier-1",
> +	};
> +	static const struct software_node supp2_swnode = {
> +		.name = "swnode-devlink-test-supplier-2",
> +	};
> +	static const struct software_node *supp_nodes[] = {
> +		&supp1_swnode, &supp2_swnode, NULL
> +	};
> +	static const struct software_node_ref_args refs[] = {
> +		SOFTWARE_NODE_REFERENCE(&supp1_swnode),
> +		SOFTWARE_NODE_REFERENCE(&supp2_swnode, 4, 2),
> +	};
> +
> +	const struct property_entry props[] = {
> +		PROPERTY_ENTRY_REF_ARRAY("suppliers", refs),
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
> +
> +/*
> + * End-to-end test: fw_devlink must defer a consumer's probe until its
> + * supplier has probed.
> + *
> + * The reference created by software_node_add_links() is only useful if the
> + * driver core promotes it to a real device_link and uses it to order probing.
> + * This test drives actual probing through the platform bus and asserts the
> + * supplier binds before the consumer.
> + */
> +
> +#define SWNODE_DEVLINK_TEST_SUPPLIER	"swnode-link-supplier"
> +#define SWNODE_DEVLINK_TEST_CONSUMER	"swnode-link-consumer"
> +#define SWNODE_DEVLINK_TEST_TIMEOUT_MS	(2 * MSEC_PER_SEC)
> +
> +struct swnode_test_probe_order {
> +	/* Names in the order their drivers' .probe ran. */
> +	const char *probed[2];
> +	unsigned int count;
> +	wait_queue_head_t wq;
> +};
> +
> +static int swnode_test_record_probe(struct platform_device *pdev)
> +{
> +	struct swnode_test_probe_order *order = platform_get_drvdata(pdev);
> +
> +	if (order && order->count < ARRAY_SIZE(order->probed)) {
> +		order->probed[order->count++] = dev_name(&pdev->dev);
> +		wake_up_interruptible(&order->wq);
> +	}
> +
> +	return 0;
> +}
> +
> +static struct platform_driver swnode_test_supplier_driver = {
> +	.probe = swnode_test_record_probe,
> +	.driver = {
> +		.name = SWNODE_DEVLINK_TEST_SUPPLIER,
> +	},
> +};
> +
> +static struct platform_driver swnode_test_consumer_driver = {
> +	.probe = swnode_test_record_probe,
> +	.driver = {
> +		.name = SWNODE_DEVLINK_TEST_CONSUMER,
> +	},
> +};
> +
> +static void swnode_devlink_test_probe_order(struct kunit *test)
> +{
> +	static const struct software_node supplier_swnode = {
> +		.name = "swnode-devlink-test-supplier",
> +	};
> +
> +	const struct property_entry consumer_props[] = {
> +		PROPERTY_ENTRY_REF("supplier-ref", &supplier_swnode),
> +		{ }
> +	};
> +
> +	struct platform_device *supplier, *consumer;
> +	struct swnode_test_probe_order *order;
> +	struct fwnode_handle *fwnode;
> +	int ret;
> +
> +	order = kunit_kzalloc(test, sizeof(*order), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, order);
> +	init_waitqueue_head(&order->wq);
> +
> +	fwnode = kunit_software_node_register(test, &supplier_swnode);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fwnode);
> +
> +	ret = kunit_platform_driver_register(test, &swnode_test_supplier_driver);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +	ret = kunit_platform_driver_register(test, &swnode_test_consumer_driver);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	supplier = kunit_platform_device_alloc(test, SWNODE_DEVLINK_TEST_SUPPLIER,
> +					       PLATFORM_DEVID_NONE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, supplier);
> +	consumer = kunit_platform_device_alloc(test, SWNODE_DEVLINK_TEST_CONSUMER,
> +					       PLATFORM_DEVID_NONE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, consumer);
> +
> +	platform_set_drvdata(supplier, order);
> +	platform_set_drvdata(consumer, order);
> +
> +	ret = device_add_software_node(&supplier->dev, &supplier_swnode);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +	ret = device_create_managed_software_node(&consumer->dev,
> +						  consumer_props, NULL);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	ret = kunit_platform_device_add(test, consumer);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +	ret = kunit_platform_device_add(test, supplier);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	ret = wait_event_interruptible_timeout(order->wq,
> +					       order->count == 2,
> +					       msecs_to_jiffies(SWNODE_DEVLINK_TEST_TIMEOUT_MS));
> +	KUNIT_ASSERT_GT(test, ret, 0);
> +
> +	KUNIT_EXPECT_STREQ(test, order->probed[0], SWNODE_DEVLINK_TEST_SUPPLIER);
> +	KUNIT_EXPECT_STREQ(test, order->probed[1], SWNODE_DEVLINK_TEST_CONSUMER);
> +
> +	/* Tear down the consumer (and its device link) before the supplier. */
> +	kunit_platform_device_unregister(test, consumer);
> +
> +	device_remove_software_node(&supplier->dev);
> +}
> +
> +static struct kunit_case swnode_test_cases[] = {
> +	KUNIT_CASE(swnode_devlink_test_single_ref),
> +	KUNIT_CASE(swnode_devlink_test_multiple_refs),
> +	KUNIT_CASE(swnode_devlink_test_unregistered_ref),
> +	KUNIT_CASE(swnode_devlink_test_remote_endpoint_excluded),
> +	KUNIT_CASE(swnode_devlink_test_ref_array),
> +	KUNIT_CASE(swnode_devlink_test_probe_order),
> +	{ }
> +};
> +
> +static struct kunit_suite swnode_test_suite = {
> +	.name = "software-node-links",
> +	.test_cases = swnode_test_cases,
> +};
> +
> +kunit_test_suite(swnode_test_suite);
> +
> +MODULE_DESCRIPTION("Test module for software node fw_devlink support");
> +MODULE_AUTHOR("Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>");
> +MODULE_LICENSE("GPL");
> 


