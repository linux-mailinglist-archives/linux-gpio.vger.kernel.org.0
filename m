Return-Path: <linux-gpio+bounces-39932-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2Ro+H+bIU2oQfAMAu9opvQ
	(envelope-from <linux-gpio+bounces-39932-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jul 2026 19:03:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC7174572E
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jul 2026 19:03:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=jf3Nb94H;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39932-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39932-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14A8B302A50D
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jul 2026 16:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98B503655D4;
	Sun, 12 Jul 2026 16:59:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517471A239A;
	Sun, 12 Jul 2026 16:59:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783875551; cv=none; b=ElcNqiuAHm+iNRM5xxsn46J/mIgtECp/bMaHdC/ff8+GkuCdPyxNtEquNuyUxl3va7+1v7Rz620r3dydJqJzihSnXFwL2t7XaopO9NndUaxyupxBe1jgQL/KKZ/LmFV8shqAbgzXfepubMAjkhG15rbiVHrgmjLRjK5RkUR3AwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783875551; c=relaxed/simple;
	bh=mSp7DKzuJHsvVxwokX8VtjfogrcPbIQ5e7AR3Y3BA7E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ZhCg6gYZ94Myk1353wtaoLBKleFou4YjyrmBxEW4Llxim1Y5jDzKAeorPThWWnmUU3qmM0I0dhStTKer1G3XiU9LLxlg4gr/8mUVtX257O6Ob5ocSe/LCFKjIJDbLz+K6w+kZYFd+Zx4ez0CNtEmSi6VPTpY8bfwg2vbw6kIs7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jf3Nb94H; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CE911F000E9;
	Sun, 12 Jul 2026 16:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783875549;
	bh=e1dmvE3Tlm+yvRV2mRiPOlbKn5bOWrgkA2i+qs4+eRI=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=jf3Nb94HJ4+X2dF/jEl7zUQEbDNo6GB9Tq03LorRZdwonP0lHMsBmz3Fv6fCRsLCV
	 IDeCKkR6U0e7lufP/J2n4TC8Mqx+Wm8uN+PyESWtp5vhrevY03vekUe5ycBqJeI7n0
	 waLcZlBx0eTHEafLCAI1lDs2aFxujINJhszYa+rOE5gRmPwREiSCymY3xYbGcWSEVU
	 KJ70Isq7mj0rqrnyI/2FxiZ9pRbSvUhhz+pRGn0MVbEitS+O7PekvZGFR03ywwkgZk
	 kybT94jnuKTVL1MXyJPj+6xV4H4QKn6Uv8w2rBiJW/6FH/GawOB0+r2hqUh65yADft
	 P/Cza+VB4TBuA==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 12 Jul 2026 18:59:04 +0200
Message-Id: <DJWR3RYAWYAI.LQC41HSN2I94@kernel.org>
Subject: Re: [PATCH v3 0/5] software node: provide support for fw_devlink
Cc: "Brendan Higgins" <brendan.higgins@linux.dev>, "David Gow"
 <david@davidgow.net>, "Rae Moar" <raemoar63@gmail.com>, "Andy Shevchenko"
 <andriy.shevchenko@linux.intel.com>, "Daniel Scally" <djrscally@gmail.com>,
 "Heikki Krogerus" <heikki.krogerus@linux.intel.com>, "Sakari Ailus"
 <sakari.ailus@linux.intel.com>, "Bartosz Golaszewski" <brgl@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Linus Walleij" <linusw@kernel.org>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <kunit-dev@googlegroups.com>,
 <linux-acpi@vger.kernel.org>, <driver-core@lists.linux.dev>,
 <linux-gpio@vger.kernel.org>
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260710-swnode-fw-devlink-v3-0-993f31874e40@oss.qualcomm.com>
In-Reply-To: <20260710-swnode-fw-devlink-v3-0-993f31874e40@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39932-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[dakr@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:brendan.higgins@linux.dev,m:david@davidgow.net,m:raemoar63@gmail.com,m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:brgl@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:kunit-dev@googlegroups.com,m:linux-acpi@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[linux.dev,davidgow.net,gmail.com,linux.intel.com,kernel.org,linuxfoundation.org,vger.kernel.org,googlegroups.com,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1FC7174572E

On Fri Jul 10, 2026 at 3:51 PM CEST, Bartosz Golaszewski wrote:
> Bartosz Golaszewski (5):
>       kunit: provide a set of fwnode-oriented helpers
>       software node: add fw_devlink support
>       software node: add kunit tests for fw_devlink support
>       MAINTAINERS: add myself as reviewer of software node support
>       gpio: kunit: add test cases verifying swnode devlink support

Overall looks good, but I think the two issues pointed out by Sashiko are v=
alid.
In addition, I also found a memory leak in the gpiolib kunit test:

	unreferenced object 0xffff88810296b2c0 (size 32):
	  comm "kunit_try_catch", pid 1096, jiffies 4294694235
	  hex dump (first 32 bytes):
	    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	    66 6f 6f 00 00 00 00 00 00 00 00 00 00 00 00 00  foo.............
	  backtrace (crc a62f59c2):
	    __kmalloc_noprof+0x216/0x510
	    desc_set_label+0x46/0xc0
	    gpiod_request_commit+0xd5/0x140
	    gpiod_request+0x49/0x170
	    gpiod_find_and_request+0x2be/0x520
	    gpiod_get_index+0x56/0x70
	    devm_gpiod_get+0x1b/0x90
	    0xffffffffc0401ff8
	    platform_probe+0x58/0x90
	    really_probe+0x1bc/0x490
	    __driver_probe_device+0xa2/0x140
	    driver_probe_device+0x1e/0x110
	    __device_attach_driver+0xc2/0x140
	    bus_for_each_drv+0x117/0x170
	    __device_attach+0xd5/0x1c0
	    device_initial_probe+0x34/0x50

I came up with the following diff to resolve those issues.

diff --git a/drivers/base/test/swnode-devlink-test.c b/drivers/base/test/sw=
node-devlink-test.c
index 6f59f13214fc..143b9c4047a0 100644
--- a/drivers/base/test/swnode-devlink-test.c
+++ b/drivers/base/test/swnode-devlink-test.c
@@ -17,6 +17,10 @@
 #include <kunit/platform_device.h>
 #include <kunit/test.h>

+KUNIT_DEFINE_ACTION_WRAPPER(device_remove_software_node_wrapper,
+                           device_remove_software_node,
+                           struct device *);
+
 static int swnode_count_suppliers(struct fwnode_handle *fwnode)
 {
        struct fwnode_link *link;
@@ -294,6 +298,9 @@ static void swnode_devlink_test_probe_order(struct kuni=
t *test)

        ret =3D device_add_software_node(&supplier->dev, &supplier_swnode);
        KUNIT_ASSERT_EQ(test, ret, 0);
+       ret =3D kunit_add_action_or_reset(test, device_remove_software_node=
_wrapper,
+                                       &supplier->dev);
+       KUNIT_ASSERT_EQ(test, ret, 0);
        ret =3D device_create_managed_software_node(&consumer->dev,
                                                  consumer_props, NULL);
        KUNIT_ASSERT_EQ(test, ret, 0);
@@ -313,8 +320,6 @@ static void swnode_devlink_test_probe_order(struct kuni=
t *test)

        /* Tear down the consumer (and its device link) before the supplier=
. */
        kunit_platform_device_unregister(test, consumer);
-
-       device_remove_software_node(&supplier->dev);
 }

 static struct kunit_case swnode_test_cases[] =3D {
diff --git a/drivers/gpio/gpiolib-kunit.c b/drivers/gpio/gpiolib-kunit.c
index ad961cf97aee..7798f8a8e602 100644
--- a/drivers/gpio/gpiolib-kunit.c
+++ b/drivers/gpio/gpiolib-kunit.c
@@ -449,6 +449,9 @@ static void gpio_swnode_probe_defer_on_unregistered(str=
uct kunit *test)

        pdata =3D dev_get_platdata(&cons->dev);
        KUNIT_ASSERT_EQ(test, pdata->gpio_err, 0);
+
+       /* Tear down the consumer before the provider to free the GPIO. */
+       kunit_platform_device_unregister(test, cons);
 }

 static int gpio_swnode_probe_order_test_init(struct kunit *test)
@@ -614,9 +617,17 @@ static struct kunit_case gpio_unbind_with_consumers_te=
sts[] =3D {
        { }
 };

+static int gpio_unbind_test_init(struct kunit *test)
+{
+       device_link_wait_removal();
+
+       return 0;
+}
+
 static struct kunit_suite gpio_unbind_with_consumers_test_suite =3D {
        .name =3D "gpio-unbind-with-consumers",
        .test_cases =3D gpio_unbind_with_consumers_tests,
+       .init =3D gpio_unbind_test_init,
 };

 kunit_test_suites(

