Return-Path: <linux-gpio+bounces-39965-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NWHTKLe8VGppqQMAu9opvQ
	(envelope-from <linux-gpio+bounces-39965-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 12:23:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0FA749BF9
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 12:23:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=aMDcQjjz;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39965-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39965-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6201E307028A
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 10:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 994E03E7BC7;
	Mon, 13 Jul 2026 10:20:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7FF3E6DF4
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 10:20:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783938023; cv=none; b=JXITnsnjiJ0LTzhwoYqzxTL8qgD70bbSGg2e8ArHQLajUZU2gjKgj6GYPN90/ShajAQ9BsaiaVJK7EgevAGG9YuZoYrQf659eeYBW0Zrpnr28rt/JT66KmaIU3lnyJ48uhrR/7h4eFKblDAjx6O8SZcjK4Wo37oLtGy8yNLoUuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783938023; c=relaxed/simple;
	bh=kcn99Xy/3DudcybC0jtllxbvzn7qC6YvN7bxjIIy5So=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JmVI/KboB34rbl0KwFpe/IlJ5/j4iO7//7W2OKStsN0Q7BbKBIQw/U2fjGhzqompNLdL4MILgn58HXP44B73CIwZMPyCNuFwH2GWbhFcjTjDbguRYwkNz/gatjFenLJtkLUIhgkruL+VZQvB69HYfttm4GXTLAG68nbI1FP/QEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aMDcQjjz; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13DF31F0155B
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 10:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783938022;
	bh=E2Il11/mxE78nQhBlWi8jSDcSjyK2Ic0zf6JqsJx93g=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=aMDcQjjzxgyz6L1l1vKncvg0VU97aYa5TYl7MEJh2Wejjzx5XKjG8B76IFoQIL3fF
	 Jt1o7SG9tpt4lAYpHppI1K0hy7zcGM7xTMWgwRxW0qaW+eWzBAL/w0xSnYccy8dQQW
	 WYtqJe4eJaHNvgEpW1wfdNBQMmJwwzOd91cEjO7vXmq8xYhFRfcO1Lqwzs+LC5WH4M
	 43q1j3TxCZnbJUBas5EodkGh7jCrRh3+g3BRyK1yDZa1FwLDeoOo0IMDsPenWHP9dv
	 R8fYcXDif6La+dl4qmWlqf1aDxRlZx0V9wlxzfFvylaBj3nKIp+JvPrUTGmL4hpEIa
	 SkvwP9+IRLkdg==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39c7ef2b1e2so23984681fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 03:20:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoftWlFjAE+lSN1Y4/greQ4UROuzNxlPt/1ubnlhaZr37QA4CIGU5CgcZoDqUHp07330KhgJnYJw43R@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj/o70IGEQ6IIGQQmiqUPtFuhAA6vGsIFnrsw+CsS+jlJJOA4j
	uVQz+jIp5A6FLN6R4HVKszFw/oOiR39/g9CeOTUrQl84CdqhlNMat4CIEptQGhPsFOT/LBSgxkj
	aEg8fWKxAHyxlPsj8ScB/KREF8Bj95FNyEkHJvi8a5w==
X-Received: by 2002:a2e:b8c3:0:b0:39c:6d3a:2dc6 with SMTP id
 38308e7fff4ca-39caa806714mr17361151fa.15.1783938020444; Mon, 13 Jul 2026
 03:20:20 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Jul 2026 03:20:18 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Jul 2026 03:20:18 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAMRc=MeW_pjczz-5L+p2tqPw4TfgVPmB7t_hXdtb9cX0BDSHuA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710-swnode-fw-devlink-v3-0-993f31874e40@oss.qualcomm.com>
 <DJWR3RYAWYAI.LQC41HSN2I94@kernel.org> <CAMRc=MeW_pjczz-5L+p2tqPw4TfgVPmB7t_hXdtb9cX0BDSHuA@mail.gmail.com>
Date: Mon, 13 Jul 2026 03:20:18 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mc7f7BDp5o-36ik6yHZSMQg3f2MNEpjurJ2x--BKga0Hw@mail.gmail.com>
X-Gm-Features: AVVi8CclRsLtPY2fK5pxv1kXXcH67GXVTmR40NKDXmnFg0VoXAkCK1k3ECh2mL4
Message-ID: <CAMRc=Mc7f7BDp5o-36ik6yHZSMQg3f2MNEpjurJ2x--BKga0Hw@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] software node: provide support for fw_devlink
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39965-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:dakr@kernel.org,m:brendan.higgins@linux.dev,m:david@davidgow.net,m:raemoar63@gmail.com,m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:kunit-dev@googlegroups.com,m:linux-acpi@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linux.dev,davidgow.net,gmail.com,linux.intel.com,linuxfoundation.org,vger.kernel.org,googlegroups.com,lists.linux.dev,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C0FA749BF9

On Mon, 13 Jul 2026 11:45:17 +0200, Bartosz Golaszewski <brgl@kernel.org> said:
> On Sun, 12 Jul 2026 18:59:04 +0200, Danilo Krummrich <dakr@kernel.org> said:
>> On Fri Jul 10, 2026 at 3:51 PM CEST, Bartosz Golaszewski wrote:
>>
>>  static struct kunit_case swnode_test_cases[] = {
>> diff --git a/drivers/gpio/gpiolib-kunit.c b/drivers/gpio/gpiolib-kunit.c
>> index ad961cf97aee..7798f8a8e602 100644
>> --- a/drivers/gpio/gpiolib-kunit.c
>> +++ b/drivers/gpio/gpiolib-kunit.c
>> @@ -449,6 +449,9 @@ static void gpio_swnode_probe_defer_on_unregistered(struct kunit *test)
>>
>>         pdata = dev_get_platdata(&cons->dev);
>>         KUNIT_ASSERT_EQ(test, pdata->gpio_err, 0);
>> +
>> +       /* Tear down the consumer before the provider to free the GPIO. */
>> +       kunit_platform_device_unregister(test, cons);
>>  }
>>
>>  static int gpio_swnode_probe_order_test_init(struct kunit *test)
>> @@ -614,9 +617,17 @@ static struct kunit_case gpio_unbind_with_consumers_tests[] = {
>>         { }
>>  };
>>
>> +static int gpio_unbind_test_init(struct kunit *test)
>> +{
>> +       device_link_wait_removal();
>
> Interestingly I noticed this in the GPIO test cases but not here...
>
> I also think that we should call device_link_wait_removal() *before* and
> *after* these cases to not affect other test suites - as pointed out by
> sashiko too.
>

Huh, that won't work because suite->exit() runs *before* kunit_cleanup(). Isn't
it wrong? We do suite->init(), then schedule actions inside the test, it would
make sense to then first call the release callbacks for resources and only
after that call suite->exit()?

Anyway, that's material for another series.

Bart

