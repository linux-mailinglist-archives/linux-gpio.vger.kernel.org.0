Return-Path: <linux-gpio+bounces-39518-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aeoFAYGhS2pvXQEAu9opvQ
	(envelope-from <linux-gpio+bounces-39518-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 14:37:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC0E7109D9
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 14:37:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=j38RakwE;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39518-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39518-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 84F3D305E56B
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 12:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03FB242F718;
	Mon,  6 Jul 2026 12:32:34 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6A142F71B
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 12:32:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341153; cv=none; b=ulLpIc28fBFOo+55X113I0RP1v7d/zzhrRb+S/AatCf7jQrV9HIlfiJccTvkWRJjnmA57Z6mOws0BGdf+hH+KgzjD7Ob29R3yH1hjHtw7kl08NMMmeGIduWmXN2/VOh1yw9th2R7v8fI/O2RdIpGbWwc5kvcNC6gm/FY46llPB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341153; c=relaxed/simple;
	bh=9w7tRzk7PU0ug0Dv4zZfspHRHMFIbLhwN04rhG/BBxs=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rB08Ru3RlfhBqeVgfHmaUIJvmYwI4riA0PeufixH2jvn1DmCyhg6nQK9vYC1AXdrbXBwHnUbX4sU0kMWTz0HlxoOqkxBev9tE3xnOP7Nxf17CjUi5PLjTUvy7kyCJQq1M+YeECxO6HR/XW++/WOIDjw0tXNxSx7h4Tx+XPx6OtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j38RakwE; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A46CC1F00A3A
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 12:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783341151;
	bh=uIXPhbuLiSA0I+TaS1RlSct61HCtgPulsM6QHEhVD3E=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=j38RakwE9+mhi/OTlzPd83kr8s8qaoxHOA57XWLa8acIv0VRVcM9nY4EFL2ETOGJU
	 RIujxCtWCmIKXHV6LHpqadlX9iLFIzbw2KeRCgi4WFPElAVnhEkn/U3kM1aLOzHDiL
	 vMYtNkbjqtAlVv1gwmTdgZXJnQVcy9At2CndrelkVR0ufaFJPse8EEOhn0SC6ut7o+
	 9FtbhVxgJ+AEnkP8sAcqpq5/skiZZUfXPNcRe8r3CEd6qQAxweGihTQtAXr1Z44QBc
	 zRkW2fNqWsS3Ue6QJd3tJxt8PV67OUKfhinBuzdGCKgpwLqPfQ/Vvi6bwBOujMiCDV
	 CNM+uEkeSZsVg==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39b03d41976so24472021fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 05:32:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq3rJZv4ZR3jVA1KD3frUxh0hF5Bk+N/BiJV8ifmztWq+Fqdn5SdUgdASOPKvdZ+OQG9WpKkPJnHEPg@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2U78xOVH9vmlbzZQrIVmD8PZocRgtAA+iLEsnguNsmi40QdSz
	VeNVxedaG+UGHiYVh/m0pVSP48hz/1TJ5TU3Uwi881LRVdts4xI/idPYMkvGVOVEFlF7e2aKcd+
	xciKTD4cgqniIPoktJhsjB8OeHrWbIwVEVWeqavTbyQ==
X-Received: by 2002:a05:651c:549:b0:39b:5a79:ebdf with SMTP id
 38308e7fff4ca-39c5ffcf5a0mr1203241fa.20.1783341150370; Mon, 06 Jul 2026
 05:32:30 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jul 2026 08:32:28 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jul 2026 08:32:28 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <akKWGNpGmHjWYdfX@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629-swnode-fw-devlink-v1-0-b90058b41839@oss.qualcomm.com>
 <20260629-swnode-fw-devlink-v1-5-b90058b41839@oss.qualcomm.com> <akKWGNpGmHjWYdfX@ashevche-desk.local>
Date: Mon, 6 Jul 2026 08:32:28 -0400
X-Gmail-Original-Message-ID: <CAMRc=Md1K_ZfO7pUANNhCkwEpmF6nX-Wo=AeuiO57hjKLtWDWg@mail.gmail.com>
X-Gm-Features: AVVi8Ce48DElPbC3oMv4vPDSxH-Ukr5qoWCuUMufjQm0Yxr66KoTNX6potICnGA
Message-ID: <CAMRc=Md1K_ZfO7pUANNhCkwEpmF6nX-Wo=AeuiO57hjKLtWDWg@mail.gmail.com>
Subject: Re: [PATCH 5/5] gpio: kunit: add test cases verifying swnode devlink support
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39518-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:brendan.higgins@linux.dev,m:david@davidgow.net,m:raemoar63@gmail.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:brgl@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:kunit-dev@googlegroups.com,m:linux-acpi@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.dev,davidgow.net,gmail.com,linux.intel.com,kernel.org,linuxfoundation.org,vger.kernel.org,googlegroups.com,lists.linux.dev,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6CC0E7109D9

On Mon, 29 Jun 2026 17:58:16 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> On Mon, Jun 29, 2026 at 12:52:10PM +0200, Bartosz Golaszewski wrote:
>> The software node fw_devlink support already has its own kunit suite, but
>> that verifies the fwnode links in isolation. Add GPIO tests that prove
>> the ordering works in a real-life use-case: a GPIO consumer that
>> references its provider via a software node.
>>
>> The first suite registers the provider's software node, adds the consumer
>> device first and checks that fw_devlink defers its probe until the
>> provider has been added and bound. The second covers the fallback:
>> with the provider's software node not yet registered no supplier link is
>> created, so the consumer probes, devm_gpiod_get() returns -EPROBE_DEFER
>> and the consumer only binds once the provider shows up.
>>
>> While at it: the existing gpio_unbind_with_consumers() test keeps the
>> consumer bound while the provider goes away and then operates the orphaned
>> descriptor. With software nodes now being covered by fw_devlink that would
>> instead force-unbind the consumer along with the provider, so opt it out
>> by setting FWNODE_FLAG_LINKS_ADDED.
>
> ...
>
> + cleanup.h // guard()()
> + err.h // IS_ERR()
>
>>  #include <linux/platform_device.h>
>>  #include <linux/property.h>
>
> + types.h // bool
>
>> +#include <kunit/fwnode.h>
>>  #include <kunit/platform_device.h>
>>  #include <kunit/test.h>
>
> ...
>
>> +	properties[1] = (struct property_entry){ };
>
> Just zero the whole array at the definition time.
>
> ...
>
>> +	pdevinfo = (struct platform_device_info){
>
> It's better to have a space after ).
>

TBH most compound literals in the kernel seem to not add the space.

>> +		.name = GPIO_PROBE_ORDER_TEST_CONSUMER,
>> +		.id = PLATFORM_DEVID_NONE,
>> +		.data = &gpio_probe_order_pdata_template,
>> +		.size_data = sizeof(gpio_probe_order_pdata_template),
>> +		.properties = properties,
>> +	};
>
> ...
>
>> +	pdevinfo = (struct platform_device_info){
>
> Ditto.
>
>> +		.name = GPIO_TEST_PROVIDER,
>> +		.id = PLATFORM_DEVID_NONE,
>> +		.swnode = &gpio_test_provider_swnode,
>> +	};
>
> ...
>
>> +struct gpio_probe_defer_pdata {
>> +	int probe_count;
>
> Why is this signed?
>
>> +	int gpio_err;
>> +};
>
> ...
>
>> +static int gpio_probe_defer_consumer_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct gpio_probe_defer_pdata *pdata = dev_get_platdata(dev);
>> +	struct gpio_desc *desc;
>
>> +	pdata->probe_count++;
>
> Even in case of error?
>

We're counting how many times we *enter* probe, so yes, I think it's right.

Bart

