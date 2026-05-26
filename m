Return-Path: <linux-gpio+bounces-37502-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NAKGApjFWo9UwcAu9opvQ
	(envelope-from <linux-gpio+bounces-37502-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 11:08:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F07D5D3000
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 11:08:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5F8636C1E3D
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 08:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC4423D3CF5;
	Tue, 26 May 2026 08:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="QzpMcHxC";
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="phuHv7yv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E003CFF5D;
	Tue, 26 May 2026 08:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779785925; cv=none; b=nEuvF5r2Rpdu2XiXJjpvNlnQPiKc0O6TDN24+xZ8Q2mNO1PQCDvbY1PN6Sh0ISjW9Keu8AbAF9oOzOwKzAPkMvEoLkCJCw0LDBCaNloZ2y+LDBC5Nh8u2gkSsJ1QtXWVCBQKMohvb1/3Dd24uWfQFwWmBYcb2jLyYXEUbF7Maho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779785925; c=relaxed/simple;
	bh=VHD4vfjtN2Fi3QTyPNYWlbYvklRH8vOIEXGneA42Ow8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KFiSGGQToPoqhGCy6t9TWa0KCNaqc6VprDhRV+4JLe0AGjh1393jAGnTzIwk4SMFzVklWW7raAKszETY/lmh6CynpCmTcoHWPrH0VhPi+cmdaurlWYkI0QLtfTicxS/rpynqvz7s9E3jC9q9jZflRvu2jxB+csA73Orp6onqMxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=QzpMcHxC; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=phuHv7yv; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1779785914;
	bh=VHD4vfjtN2Fi3QTyPNYWlbYvklRH8vOIEXGneA42Ow8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QzpMcHxC25mxk8ti18daYshcIENr0gdR+7nV0OK6NkKjfPnGdz6cFB5DikLTRv1Cy
	 2MrUDHpX4JCER+/bLvXwZxowq2BKXTAkbJLPtDvja0BODHOWPjhiwgndG8IMdJP1uD
	 pWqp+HJeEITjaRetHPyZh0gMGCM7pM5oaASJKWlsmJYxHoekZXZV5sQ0D/QInZvtB0
	 ejIVgqnY1UoishSPt4Qh7auYNgyt8XOW7bGMx4TvQtDSSWzY9ZywkM/G+DyW5aTGeu
	 mQtQhiOz0zHjtfxocGK5BBqptqBQ682aFttm8FZx0aMVrRgyvgjtQb3EQZOR+l4PJR
	 PXZCuJXq/Ic8l6y/NY5y5aBSwWxRDe+vtV0I1htVBNroQw66HXDgMZ97oDpSm7E8PN
	 LOwrBM8CSzFiJuPPvy6rCGJC2EQPX6Dx2ObJISMp4MXHEcZc73aXYihgbKgjuhqYJ/
	 d/iYWAR2g1aQYCt/TuguQOR5+hTS3LQDW00TktQI5zwScr2F53GXJTCYgEXn5eTfgH
	 qlQQ/rW+ncRy5pjpflojEBboVp7gkI7R9Ed4h+dQwKGDNc0z74rghYvfvegmONvR35
	 76+Cmeu1mCZJvNe9EWa2kzFtjHsmEJzxaHluaZkI/aukdR3P7TtXwuf6PUeSkDv8ZT
	 wvTkT1egpibl8uVzcDqEb5U8=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 4A91F1E9C6C; Tue, 26 May 2026 16:58:34 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1779785912;
	bh=VHD4vfjtN2Fi3QTyPNYWlbYvklRH8vOIEXGneA42Ow8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=phuHv7yvyWZX85DkaGvESROyPjVjo+Vlqf9+buLugZmWrTOr4AFsOmc46RquyH0hc
	 07bdvknyQbki7jeUkKSRXsdtRr0MmesBmxBN4ESfF4wJAh+PtzQ17GTpLvLJgh0Q8x
	 QdcHXR09ArTfsdFH3I/H50+ZbSIVit8l2GnVlcOSmEmWX2NkyGbk2iD2ZnD6rglmGs
	 DbXm1bkRo4jD9HH4TxiCX3BFTQe+l2B7+6J9Ocomq0Ljwi13i86QCrlmyEu/R4Ukg9
	 xM9rgg6Q3NihmBA0ejUD5544EHL1PbMHOK8fphE3gDVL9oHJRkzH7UcETQBlC+hvj5
	 vqhbassRLBjgBauG27cKn5vgnHCBT64cP41HAAzm5ZoF5Dob5vq1w/yY+nykeya0wY
	 8fo4px90rdmGVikrgTnL2jAFbBO4Xbo91bsxR0zRsSJfxufTaBeMMaOYDqYLc4GK6l
	 iTckrLiyZWFNsZNEW6F51GZRbc4akgQyQcjAgN6ZXUy2ZmoDjlGV1DKaQUUqsb7tTD
	 3hK1Dxd/MIhfnrsMWMhLyjblwBJcYAceXQjJ5TTUThneXCNHv5hIhdq65jPQU92ojt
	 MZ2Hma5pBjmi1uPVnYiySDsH5kRWFA65rlCfjlw0Bn5aPq80KGoidyx6TLB9OtGBbS
	 YVU58FXuL1Hl6YVbB+9XMhko=
Received: from [IPV6:2001:8003:8810:ea00:ed87:ca88:5326:e11d] (unknown [IPv6:2001:8003:8810:ea00:ed87:ca88:5326:e11d])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id A76071E9C67;
	Tue, 26 May 2026 16:58:32 +0800 (AWST)
Message-ID: <d580b8fe-2f22-48c2-86ae-5037ef13a9db@davidgow.net>
Date: Tue, 26 May 2026 16:58:30 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] gpio: add kunit test cases for the GPIO subsystem
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260522-gpiolib-kunit-v3-0-b15fe6987430@oss.qualcomm.com>
 <20260522-gpiolib-kunit-v3-3-b15fe6987430@oss.qualcomm.com>
From: David Gow <david@davidgow.net>
Content-Language: fr
In-Reply-To: <20260522-gpiolib-kunit-v3-3-b15fe6987430@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[davidgow.net,none];
	R_DKIM_ALLOW(-0.20)[davidgow.net:s=201606];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[davidgow.net:+];
	TAGGED_FROM(0.00)[bounces-37502-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[david@davidgow.net,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,davidgow.net:email,davidgow.net:mid,davidgow.net:dkim]
X-Rspamd-Queue-Id: 9F07D5D3000
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Le 22/05/2026 à 9:42 PM, Bartosz Golaszewski a écrit :
> Add a module containing kunit test cases for GPIO core. The idea is to
> use it to test functionalities that can't easily be tested from
> user-space with kernel selftests or GPIO character device test suites
> provided by the libgpiod package.
> 
> For now add test cases that verify software node based lookup and ensure
> that a GPIO provider unbinding with active consumers does not cause a
> crash.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

This is a nice looking test, thanks.

Reviewed-by: David Gow <david@davidgow.net>

Happy for this (and the previous two patches) to go in via gpio, but if
you'd rather them go in via the KUnit tree, let me know.

Cheers,
-- David

>  drivers/gpio/Kconfig         |   8 +
>  drivers/gpio/Makefile        |   1 +
>  drivers/gpio/gpiolib-kunit.c | 358 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 367 insertions(+)
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 00fcab5d09a4294ed778cea78af5867a0f6e481b..0306005fb7d65ae85905e967b9065fd74db753db 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -102,6 +102,14 @@ config GPIO_CDEV_V1
>  	  This ABI version is deprecated.
>  	  Please use the latest ABI for new developments.
>  
> +config GPIO_KUNIT
> +	tristate "Build GPIO Kunit test cases"
> +	depends on KUNIT
> +	default KUNIT_ALL_TESTS
> +	help
> +	  Say Y here to build the module containing Kunit test cases verifying
> +	  the functionality of the GPIO subsystem.
> +


FYI: If you want to add CONFIG_GPIOLIB=y to
tools/testing/kunit/configs/all_tests.config, we can enable these tests
when the --alltests flag is passed to kunit.py.

>  config GPIO_GENERIC
>  	depends on HAS_IOMEM # Only for IOMEM drivers
>  	tristate
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 2ea47d9d3dca948e1cdc46965e83b0e1b6de5f70..c66b6dd659b16b80b6bb6b15fac3e3f462dec596 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -13,6 +13,7 @@ obj-$(CONFIG_GPIO_ACPI)		+= gpiolib-acpi.o
>  gpiolib-acpi-y			:= gpiolib-acpi-core.o gpiolib-acpi-quirks.o
>  obj-$(CONFIG_GPIOLIB)		+= gpiolib-swnode.o
>  obj-$(CONFIG_GPIO_SHARED)	+= gpiolib-shared.o
> +obj-$(CONFIG_GPIO_KUNIT)	+= gpiolib-kunit.o
>  
>  # Device drivers. Generally keep list sorted alphabetically
>  obj-$(CONFIG_GPIO_REGMAP)	+= gpio-regmap.o
> diff --git a/drivers/gpio/gpiolib-kunit.c b/drivers/gpio/gpiolib-kunit.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..380b68f879e55433668353bb88067d561142a5bc
> --- /dev/null
> +++ b/drivers/gpio/gpiolib-kunit.c
> @@ -0,0 +1,358 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) Qualcomm Technologies, Inc. and/or its subsidiaries
> + */
> +
> +#include <linux/fwnode.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/gpio/machine.h>
> +#include <linux/gpio/property.h>
> +#include <linux/notifier.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +
> +#include <kunit/platform_device.h>
> +#include <kunit/test.h>
> +
> +#define GPIO_TEST_PROVIDER		"gpio-test-provider"
> +#define GPIO_SWNODE_TEST_CONSUMER	"gpio-swnode-test-consumer"
> +#define GPIO_UNBIND_TEST_CONSUMER	"gpio-unbind-test-consumer"
> +
> +static int gpio_test_provider_get_direction(struct gpio_chip *gc, unsigned int offset)
> +{
> +	return GPIO_LINE_DIRECTION_OUT;
> +}
> +
> +static int gpio_test_provider_set(struct gpio_chip *gc, unsigned int offset, int value)
> +{
> +	return 0;
> +}
> +
> +static int gpio_test_provider_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct gpio_chip *gc;
> +
> +	gc = devm_kzalloc(dev, sizeof(*gc), GFP_KERNEL);
> +	if (!gc)
> +		return -ENOMEM;
> +
> +	gc->base = -1;
> +	gc->ngpio = 4;
> +	gc->label = "gpio-swnode-consumer-test-device";
> +	gc->parent = dev;
> +	gc->owner = THIS_MODULE;
> +
> +	gc->get_direction = gpio_test_provider_get_direction;
> +	gc->set = gpio_test_provider_set;
> +
> +	return devm_gpiochip_add_data(dev, gc, NULL);
> +}
> +
> +static struct platform_driver gpio_test_provider_driver = {
> +	.probe = gpio_test_provider_probe,
> +	.driver = {
> +		.name = GPIO_TEST_PROVIDER,
> +	},
> +};
> +
> +static const struct software_node gpio_test_provider_swnode = {
> +	.name = "gpio-test-provider-primary",
> +};
> +
> +struct gpio_swnode_consumer_pdata {
> +	bool gpio_ok;
> +};
> +
> +static const struct gpio_swnode_consumer_pdata gpio_swnode_pdata_template = {
> +	.gpio_ok = false,
> +};
> +
> +static int gpio_swnode_consumer_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct gpio_swnode_consumer_pdata *pdata = dev_get_platdata(dev);
> +	struct gpio_desc *desc;
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
> +static struct platform_driver gpio_swnode_consumer_driver = {
> +	.probe = gpio_swnode_consumer_probe,
> +	.driver = {
> +		.name = GPIO_SWNODE_TEST_CONSUMER,
> +	},
> +};
> +
> +static void gpio_swnode_lookup_by_primary(struct kunit *test)
> +{
> +	struct gpio_swnode_consumer_pdata *pdata;
> +	struct platform_device_info pdevinfo;
> +	struct property_entry properties[2];
> +	struct platform_device *pdev;
> +	bool bound = false;
> +	int ret;
> +
> +	ret = kunit_platform_driver_register(test, &gpio_test_provider_driver);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	ret = kunit_platform_driver_register(test, &gpio_swnode_consumer_driver);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	pdevinfo = (struct platform_device_info){
> +		.name = GPIO_TEST_PROVIDER,
> +		.id = PLATFORM_DEVID_NONE,
> +		.swnode = &gpio_test_provider_swnode,
> +	};
> +
> +	pdev = kunit_platform_device_register_full(test, &pdevinfo);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
> +
> +	properties[0] = PROPERTY_ENTRY_GPIO("foo-gpios",
> +					    &gpio_test_provider_swnode,
> +					    0, GPIO_ACTIVE_HIGH);
> +	properties[1] = (struct property_entry){ };
> +
> +	pdevinfo = (struct platform_device_info){
> +		.name = GPIO_SWNODE_TEST_CONSUMER,
> +		.id = PLATFORM_DEVID_NONE,
> +		.data = &gpio_swnode_pdata_template,
> +		.size_data = sizeof(gpio_swnode_pdata_template),
> +		.properties = properties,
> +	};
> +
> +	pdev = kunit_platform_device_register_full(test, &pdevinfo);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
> +
> +	wait_for_device_probe();
> +	scoped_guard(device, &pdev->dev)
> +		bound = device_is_bound(&pdev->dev);
> +
> +	KUNIT_ASSERT_TRUE(test, bound);
> +
> +	pdata = dev_get_platdata(&pdev->dev);
> +	KUNIT_ASSERT_TRUE(test, pdata->gpio_ok);
> +}
> +
> +static void gpio_swnode_lookup_by_secondary(struct kunit *test)
> +{
> +	struct gpio_swnode_consumer_pdata *pdata;
> +	struct platform_device_info pdevinfo;
> +	struct property_entry properties[2];
> +	struct fwnode_handle *primary;
> +	struct platform_device *pdev;
> +	bool bound = false;
> +	int ret;
> +
> +	/*
> +	 * Can't live on the stack as it will still get referenced in cleanup
> +	 * path after this function returns.
> +	 */
> +	primary = kunit_kzalloc(test, sizeof(*primary), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, primary);
> +
> +	ret = kunit_platform_driver_register(test, &gpio_test_provider_driver);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	ret = kunit_platform_driver_register(test, &gpio_swnode_consumer_driver);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	fwnode_init(primary, NULL);
> +
> +	pdevinfo = (struct platform_device_info){
> +		.name = GPIO_TEST_PROVIDER,
> +		.id = PLATFORM_DEVID_NONE,
> +		.fwnode = primary,
> +		.swnode = &gpio_test_provider_swnode,
> +	};
> +
> +	pdev = kunit_platform_device_register_full(test, &pdevinfo);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
> +
> +	properties[0] = PROPERTY_ENTRY_GPIO("foo-gpios",
> +					    &gpio_test_provider_swnode,
> +					    0, GPIO_ACTIVE_HIGH);
> +	properties[1] = (struct property_entry){ };
> +
> +	pdevinfo = (struct platform_device_info){
> +		.name = GPIO_SWNODE_TEST_CONSUMER,
> +		.id = PLATFORM_DEVID_NONE,
> +		.data = &gpio_swnode_pdata_template,
> +		.size_data = sizeof(gpio_swnode_pdata_template),
> +		.properties = properties,
> +	};
> +
> +	pdev = kunit_platform_device_register_full(test, &pdevinfo);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
> +
> +	wait_for_device_probe();
> +	scoped_guard(device, &pdev->dev)
> +		bound = device_is_bound(&pdev->dev);
> +
> +	KUNIT_ASSERT_TRUE(test, bound);
> +
> +	pdata = dev_get_platdata(&pdev->dev);
> +	KUNIT_ASSERT_TRUE(test, pdata->gpio_ok);
> +}
> +
> +static struct kunit_case gpio_swnode_lookup_tests[] = {
> +	KUNIT_CASE(gpio_swnode_lookup_by_primary),
> +	KUNIT_CASE(gpio_swnode_lookup_by_secondary),
> +	{ }
> +};
> +
> +static struct kunit_suite gpio_swnode_lookup_test_suite = {
> +	.name = "gpio-swnode-lookup",
> +	.test_cases = gpio_swnode_lookup_tests,
> +};
> +
> +static BLOCKING_NOTIFIER_HEAD(gpio_unbind_notifier);
> +
> +struct gpio_unbind_consumer_drvdata {
> +	struct device *dev;
> +	struct gpio_desc *desc;
> +	struct notifier_block nb;
> +	int set_retval;
> +};
> +
> +static int gpio_unbind_notify(struct notifier_block *nb, unsigned long action,
> +			      void *data)
> +{
> +	struct gpio_unbind_consumer_drvdata *drvdata =
> +		container_of(nb, struct gpio_unbind_consumer_drvdata, nb);
> +	struct device *dev = data;
> +
> +	if (dev != drvdata->dev)
> +		return NOTIFY_DONE;
> +
> +	drvdata->set_retval = gpiod_set_value_cansleep(drvdata->desc, 0);
> +
> +	return NOTIFY_OK;
> +}
> +
> +static void gpio_unbind_unregister_notifier(void *data)
> +{
> +	struct notifier_block *nb = data;
> +
> +	blocking_notifier_chain_unregister(&gpio_unbind_notifier, nb);
> +}
> +
> +static int gpio_unbind_consumer_probe(struct platform_device *pdev)
> +{
> +	struct gpio_unbind_consumer_drvdata *data;
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->dev = dev;
> +
> +	data->desc = devm_gpiod_get(dev, "foo", GPIOD_OUT_HIGH);
> +	if (IS_ERR(data->desc))
> +		return PTR_ERR(data->desc);
> +
> +	data->nb.notifier_call = gpio_unbind_notify;
> +	ret = blocking_notifier_chain_register(&gpio_unbind_notifier, &data->nb);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_add_action_or_reset(dev, gpio_unbind_unregister_notifier, &data->nb);
> +	if (ret)
> +		return ret;
> +
> +	platform_set_drvdata(pdev, data);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver gpio_unbind_consumer_driver = {
> +	.probe = gpio_unbind_consumer_probe,
> +	.driver = {
> +		.name = GPIO_UNBIND_TEST_CONSUMER,
> +	},
> +};
> +
> +static void gpio_unbind_with_consumers(struct kunit *test)
> +{
> +	struct gpio_unbind_consumer_drvdata *cons_data;
> +	struct platform_device_info pdevinfo;
> +	struct property_entry properties[2];
> +	struct platform_device *prvd, *cons;
> +	bool bound = false;
> +	int ret;
> +
> +	ret = kunit_platform_driver_register(test, &gpio_test_provider_driver);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	ret = kunit_platform_driver_register(test, &gpio_unbind_consumer_driver);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
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
> +	properties[0] = PROPERTY_ENTRY_GPIO("foo-gpios",
> +					    &gpio_test_provider_swnode,
> +					    0, GPIO_ACTIVE_HIGH);
> +	properties[1] = (struct property_entry){ };
> +
> +	pdevinfo = (struct platform_device_info){
> +		.name = GPIO_UNBIND_TEST_CONSUMER,
> +		.id = PLATFORM_DEVID_NONE,
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
> +	KUNIT_ASSERT_TRUE(test, bound);
> +
> +	kunit_platform_device_unregister(test, prvd);
> +
> +	ret = blocking_notifier_call_chain(&gpio_unbind_notifier, 0, &cons->dev);
> +	KUNIT_ASSERT_EQ(test, ret, NOTIFY_OK);
> +
> +	scoped_guard(device, &cons->dev) {
> +		cons_data = platform_get_drvdata(cons);
> +		ret = cons_data->set_retval;
> +	}
> +
> +	KUNIT_ASSERT_EQ(test, ret, -ENODEV);
> +}
> +
> +static struct kunit_case gpio_unbind_with_consumers_tests[] = {
> +	KUNIT_CASE(gpio_unbind_with_consumers),
> +	{ }
> +};
> +
> +static struct kunit_suite gpio_unbind_with_consumers_test_suite = {
> +	.name = "gpio-unbind-with-consumers",
> +	.test_cases = gpio_unbind_with_consumers_tests,
> +};
> +
> +kunit_test_suites(
> +	&gpio_swnode_lookup_test_suite,
> +	&gpio_unbind_with_consumers_test_suite,
> +);
> +
> +MODULE_DESCRIPTION("Test module for the GPIO subsystem");
> +MODULE_AUTHOR("Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>");
> +MODULE_LICENSE("GPL");
> 


