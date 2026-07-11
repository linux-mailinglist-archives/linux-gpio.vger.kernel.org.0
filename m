Return-Path: <linux-gpio+bounces-39882-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wBHAKtr2UWqxKwMAu9opvQ
	(envelope-from <linux-gpio+bounces-39882-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 09:55:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6F9740CFE
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 09:55:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=davidgow.net (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39882-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39882-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9E191300A662
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 07:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D29B4381EBC;
	Sat, 11 Jul 2026 07:55:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368F03749E9;
	Sat, 11 Jul 2026 07:54:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783756500; cv=none; b=pN7mn0Wm4SbQOAI7VPmyhF99QcBFMkVLS37/zmARjnwelb0SZSZUnBO33603pgzywIidXN6fHS3wBoLf9FBDBjYVucshKl9nyrQWUg2E7SUz4w9hqfAGnayHlbp0lrvObG8TKWqWfYk4LnVtpPJKmGNFxdLg1VdaeRwhg9jWGFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783756500; c=relaxed/simple;
	bh=HBnICb9o8Bnf0GYqEYrW27rcf8MP1F6H61vX58FDRik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XYkhifD1rV88RG3dueIkK3GS4CtG9ZnsInmmvyh49tSR/MxpZhyUx84/4jfY2Au/2dMtDcoJVjdxnqOMTOe+Wgmq9VG2p1i+0gxFIb5Pv7AdRfROtdQLRJ499Gso1mxniHu2Gw2pN0rHFINvmJ6KqWBqxQD3dZKR6pW88XHhOFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; arc=none smtp.client-ip=203.29.242.92
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id D33C91EA729; Sat, 11 Jul 2026 15:54:55 +0800 (AWST)
X-Spam-Level: 
Received: from [IPV6:2001:8003:8810:ea00::41b] (unknown [IPv6:2001:8003:8810:ea00::41b])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 190871EA717;
	Sat, 11 Jul 2026 15:54:49 +0800 (AWST)
Message-ID: <2c9a2b8e-55ae-4f22-ae41-04aa404e0a93@davidgow.net>
Date: Sat, 11 Jul 2026 15:54:49 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] gpio: kunit: add test cases verifying swnode
 devlink support
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
 <20260710-swnode-fw-devlink-v3-5-993f31874e40@oss.qualcomm.com>
Content-Language: en-US
From: David Gow <david@davidgow.net>
In-Reply-To: <20260710-swnode-fw-devlink-v3-5-993f31874e40@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[davidgow.net : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39882-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8E6F9740CFE

Le 10/07/2026 à 21:51, Bartosz Golaszewski a écrit :
> The software node fw_devlink support already has its own kunit suite, but
> that verifies the fwnode links in isolation. Add GPIO tests that prove
> the ordering works in a real-life use-case: a GPIO consumer that
> references its provider via a software node.
> 
> The first suite registers the provider's software node, adds the consumer
> device first and checks that fw_devlink defers its probe until the
> provider has been added and bound. The second covers the fallback:
> with the provider's software node not yet registered no supplier link is
> created, so the consumer probes, devm_gpiod_get() returns -EPROBE_DEFER
> and the consumer only binds once the provider shows up.
> 
> While at it: the existing gpio_unbind_with_consumers() test keeps the
> consumer bound while the provider goes away and then operates the orphaned
> descriptor. With software nodes now being covered by fw_devlink that would
> instead force-unbind the consumer along with the provider, so opt it out
> by setting FWNODE_FLAG_LINKS_ADDED.
> 
> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Working well under my test harness. Thanks!

Tested-by: David Gow <david@davidgow.net>

Cheers,
-- David

>   drivers/gpio/gpiolib-kunit.c | 286 +++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 279 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-kunit.c b/drivers/gpio/gpiolib-kunit.c
> index 380b68f879e55433668353bb88067d561142a5bc..ad961cf97aee7b1b6e3fb64c9f5d52be25486253 100644
> --- a/drivers/gpio/gpiolib-kunit.c
> +++ b/drivers/gpio/gpiolib-kunit.c
> @@ -3,6 +3,8 @@
>    * Copyright (C) Qualcomm Technologies, Inc. and/or its subsidiaries
>    */
>   
> +#include <linux/cleanup.h>
> +#include <linux/err.h>
>   #include <linux/fwnode.h>
>   #include <linux/gpio/consumer.h>
>   #include <linux/gpio/driver.h>
> @@ -11,12 +13,16 @@
>   #include <linux/notifier.h>
>   #include <linux/platform_device.h>
>   #include <linux/property.h>
> +#include <linux/types.h>
>   
> +#include <kunit/fwnode.h>
>   #include <kunit/platform_device.h>
>   #include <kunit/test.h>
>   
>   #define GPIO_TEST_PROVIDER		"gpio-test-provider"
>   #define GPIO_SWNODE_TEST_CONSUMER	"gpio-swnode-test-consumer"
> +#define GPIO_PROBE_ORDER_TEST_CONSUMER	"gpio-probe-order-test-consumer"
> +#define GPIO_PROBE_DEFER_TEST_CONSUMER	"gpio-probe-defer-test-consumer"
>   #define GPIO_UNBIND_TEST_CONSUMER	"gpio-unbind-test-consumer"
>   
>   static int gpio_test_provider_get_direction(struct gpio_chip *gc, unsigned int offset)
> @@ -213,6 +219,262 @@ static struct kunit_suite gpio_swnode_lookup_test_suite = {
>   	.test_cases = gpio_swnode_lookup_tests,
>   };
>   
> +static void gpio_swnode_unregister_swnode(void *data)
> +{
> +	software_node_unregister(data);
> +}
> +
> +struct gpio_probe_order_pdata {
> +	unsigned int probe_count;
> +	bool gpio_ok;
> +};
> +
> +static const struct gpio_probe_order_pdata gpio_probe_order_pdata_template = {
> +	.probe_count = 0,
> +	.gpio_ok = false,
> +};
> +
> +static int gpio_probe_order_consumer_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct gpio_probe_order_pdata *pdata = dev_get_platdata(dev);
> +	struct gpio_desc *desc;
> +
> +	pdata->probe_count++;
> +
> +	desc = devm_gpiod_get(dev, "foo", GPIOD_OUT_HIGH);
> +	if (IS_ERR(desc))
> +		return PTR_ERR(desc);
> +
> +	pdata->gpio_ok = true;
> +
> +	return 0;
> +}
> +
> +static struct platform_driver gpio_probe_order_consumer_driver = {
> +	.probe = gpio_probe_order_consumer_probe,
> +	.driver = {
> +		.name = GPIO_PROBE_ORDER_TEST_CONSUMER,
> +	},
> +};
> +
> +/*
> + * Verify that fw_devlink orders the probe of a GPIO consumer after its
> + * provider. The consumer references the provider through a software node and
> + * is registered first. fw_devlink must defer it before its driver's probe()
> + * is ever entered, so the consumer probes exactly once - only after the
> + * provider is added and bound.
> + */
> +static void gpio_swnode_probe_order(struct kunit *test)
> +{
> +	struct property_entry properties[2] = { };
> +	struct gpio_probe_order_pdata *pdata;
> +	struct platform_device_info pdevinfo;
> +	struct platform_device *prvd, *cons;
> +	bool bound = false;
> +	int ret;
> +
> +	ret = kunit_platform_driver_register(test, &gpio_test_provider_driver);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	ret = kunit_platform_driver_register(test, &gpio_probe_order_consumer_driver);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	ret = software_node_register(&gpio_test_provider_swnode);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	ret = kunit_add_action_or_reset(test, gpio_swnode_unregister_swnode,
> +					(void *)&gpio_test_provider_swnode);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	properties[0] = PROPERTY_ENTRY_GPIO("foo-gpios",
> +					    &gpio_test_provider_swnode,
> +					    0, GPIO_ACTIVE_HIGH);
> +
> +	pdevinfo = (struct platform_device_info){
> +		.name = GPIO_PROBE_ORDER_TEST_CONSUMER,
> +		.id = PLATFORM_DEVID_NONE,
> +		.data = &gpio_probe_order_pdata_template,
> +		.size_data = sizeof(gpio_probe_order_pdata_template),
> +		.properties = properties,
> +	};
> +
> +	cons = kunit_platform_device_register_full(test, &pdevinfo);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cons);
> +
> +	wait_for_device_probe();
> +	scoped_guard(device, &cons->dev)
> +		bound = device_is_bound(&cons->dev);
> +
> +	KUNIT_ASSERT_FALSE(test, bound);
> +
> +	pdata = dev_get_platdata(&cons->dev);
> +	KUNIT_ASSERT_EQ(test, pdata->probe_count, 0);
> +	KUNIT_ASSERT_FALSE(test, pdata->gpio_ok);
> +
> +	pdevinfo = (struct platform_device_info){
> +		.name = GPIO_TEST_PROVIDER,
> +		.id = PLATFORM_DEVID_NONE,
> +		.swnode = &gpio_test_provider_swnode,
> +	};
> +
> +	prvd = kunit_platform_device_register_full(test, &pdevinfo);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, prvd);
> +
> +	wait_for_device_probe();
> +
> +	scoped_guard(device, &prvd->dev)
> +		bound = device_is_bound(&prvd->dev);
> +	KUNIT_ASSERT_TRUE(test, bound);
> +
> +	scoped_guard(device, &cons->dev)
> +		bound = device_is_bound(&cons->dev);
> +	KUNIT_ASSERT_TRUE(test, bound);
> +
> +	pdata = dev_get_platdata(&cons->dev);
> +	KUNIT_ASSERT_EQ(test, pdata->probe_count, 1);
> +	KUNIT_ASSERT_TRUE(test, pdata->gpio_ok);
> +}
> +
> +struct gpio_probe_defer_pdata {
> +	unsigned int probe_count;
> +	int gpio_err;
> +};
> +
> +static const struct gpio_probe_defer_pdata gpio_probe_defer_pdata_template = {
> +	.probe_count = 0,
> +	.gpio_err = 0,
> +};
> +
> +static int gpio_probe_defer_consumer_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct gpio_probe_defer_pdata *pdata = dev_get_platdata(dev);
> +	struct gpio_desc *desc;
> +
> +	pdata->probe_count++;
> +
> +	desc = devm_gpiod_get(dev, "foo", GPIOD_OUT_HIGH);
> +	if (IS_ERR(desc)) {
> +		pdata->gpio_err = PTR_ERR(desc);
> +		return pdata->gpio_err;
> +	}
> +
> +	pdata->gpio_err = 0;
> +
> +	return 0;
> +}
> +
> +static struct platform_driver gpio_probe_defer_consumer_driver = {
> +	.probe = gpio_probe_defer_consumer_probe,
> +	.driver = {
> +		.name = GPIO_PROBE_DEFER_TEST_CONSUMER,
> +	},
> +};
> +
> +/*
> + * Verify that a GPIO consumer referencing a provider whose software node is
> + * not registered yet, defers its probe instead of failing.
> + *
> + * The provider software node is deliberately left unregistered when the
> + * consumer is added. fw_devlink cannot resolve the reference, so it creates no
> + * supplier link and does not order the consumer - the consumer's probe() runs
> + * and reaches devm_gpiod_get(). The swnode GPIO lookup returns -ENOTCONN for a
> + * reference to an unregistered node, which gpiolib maps to -EPROBE_DEFER. Once
> + * the provider software node and device appear, the deferred consumer probes
> + * again and binds.
> + */
> +static void gpio_swnode_probe_defer_on_unregistered(struct kunit *test)
> +{
> +	struct property_entry properties[2] = { };
> +	struct gpio_probe_defer_pdata *pdata;
> +	struct platform_device_info pdevinfo;
> +	struct platform_device *prvd, *cons;
> +	struct fwnode_handle *fwnode;
> +	bool bound = false;
> +	int ret;
> +
> +	ret = kunit_platform_driver_register(test, &gpio_test_provider_driver);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	ret = kunit_platform_driver_register(test, &gpio_probe_defer_consumer_driver);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	properties[0] = PROPERTY_ENTRY_GPIO("foo-gpios",
> +					    &gpio_test_provider_swnode,
> +					    0, GPIO_ACTIVE_HIGH);
> +
> +	pdevinfo = (struct platform_device_info){
> +		.name = GPIO_PROBE_DEFER_TEST_CONSUMER,
> +		.id = PLATFORM_DEVID_NONE,
> +		.data = &gpio_probe_defer_pdata_template,
> +		.size_data = sizeof(gpio_probe_defer_pdata_template),
> +		.properties = properties,
> +	};
> +
> +	cons = kunit_platform_device_register_full(test, &pdevinfo);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cons);
> +
> +	wait_for_device_probe();
> +	scoped_guard(device, &cons->dev)
> +		bound = device_is_bound(&cons->dev);
> +
> +	KUNIT_ASSERT_FALSE(test, bound);
> +
> +	pdata = dev_get_platdata(&cons->dev);
> +	KUNIT_ASSERT_GT(test, pdata->probe_count, 0);
> +	KUNIT_ASSERT_EQ(test, pdata->gpio_err, -EPROBE_DEFER);
> +
> +	fwnode = kunit_software_node_register(test, &gpio_test_provider_swnode);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fwnode);
> +
> +	pdevinfo = (struct platform_device_info){
> +		.name = GPIO_TEST_PROVIDER,
> +		.id = PLATFORM_DEVID_NONE,
> +		.swnode = &gpio_test_provider_swnode,
> +	};
> +
> +	prvd = kunit_platform_device_register_full(test, &pdevinfo);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, prvd);
> +
> +	wait_for_device_probe();
> +
> +	scoped_guard(device, &prvd->dev)
> +		bound = device_is_bound(&prvd->dev);
> +	KUNIT_ASSERT_TRUE(test, bound);
> +
> +	scoped_guard(device, &cons->dev)
> +		bound = device_is_bound(&cons->dev);
> +	KUNIT_ASSERT_TRUE(test, bound);
> +
> +	pdata = dev_get_platdata(&cons->dev);
> +	KUNIT_ASSERT_EQ(test, pdata->gpio_err, 0);
> +}
> +
> +static int gpio_swnode_probe_order_test_init(struct kunit *test)
> +{
> +	/*
> +	 * A prior test may have left a managed device link teardown queued on
> +	 * the device_link_mq. Flush it so that software_node_register()
> +	 * doesn't spuriously see the node as registered and fail with -EEXIST.
> +	 */
> +	device_link_wait_removal();
> +
> +	return 0;
> +}
> +
> +static struct kunit_case gpio_swnode_probe_order_tests[] = {
> +	KUNIT_CASE(gpio_swnode_probe_order),
> +	KUNIT_CASE(gpio_swnode_probe_defer_on_unregistered),
> +	{ }
> +};
> +
> +static struct kunit_suite gpio_swnode_probe_order_test_suite = {
> +	.name = "gpio-swnode-probe-order",
> +	.test_cases = gpio_swnode_probe_order_tests,
> +	.init = gpio_swnode_probe_order_test_init,
> +};
> +
>   static BLOCKING_NOTIFIER_HEAD(gpio_unbind_notifier);
>   
>   struct gpio_unbind_consumer_drvdata {
> @@ -310,15 +572,24 @@ static void gpio_unbind_with_consumers(struct kunit *test)
>   					    0, GPIO_ACTIVE_HIGH);
>   	properties[1] = (struct property_entry){ };
>   
> -	pdevinfo = (struct platform_device_info){
> -		.name = GPIO_UNBIND_TEST_CONSUMER,
> -		.id = PLATFORM_DEVID_NONE,
> -		.properties = properties,
> -	};
> -
> -	cons = kunit_platform_device_register_full(test, &pdevinfo);
> +	/*
> +	 * This test deliberately keeps the consumer bound while the provider
> +	 * is unregistered. fw_devlink would force-unbind the consumer before
> +	 * the provider so use the FWNODE_FLAG_LINKS_ADDED flag to opt out of
> +	 * it as a workaround.
> +	 */
> +	cons = kunit_platform_device_alloc(test, GPIO_UNBIND_TEST_CONSUMER,
> +					   PLATFORM_DEVID_NONE);
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cons);
>   
> +	ret = device_create_managed_software_node(&cons->dev, properties, NULL);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	fwnode_set_flag(dev_fwnode(&cons->dev), FWNODE_FLAG_LINKS_ADDED);
> +
> +	ret = kunit_platform_device_add(test, cons);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
>   	wait_for_device_probe();
>   	scoped_guard(device, &cons->dev)
>   		bound = device_is_bound(&cons->dev);
> @@ -350,6 +621,7 @@ static struct kunit_suite gpio_unbind_with_consumers_test_suite = {
>   
>   kunit_test_suites(
>   	&gpio_swnode_lookup_test_suite,
> +	&gpio_swnode_probe_order_test_suite,
>   	&gpio_unbind_with_consumers_test_suite,
>   );
>   
> 


