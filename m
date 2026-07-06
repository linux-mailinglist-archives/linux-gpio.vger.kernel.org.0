Return-Path: <linux-gpio+bounces-39514-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7iA0MrOUS2qzVwEAu9opvQ
	(envelope-from <linux-gpio+bounces-39514-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 13:42:43 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 374BC70FFFD
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 13:42:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=goLXkLzL;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39514-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39514-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A62D2300F5E8
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 11:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 993C041F7C8;
	Mon,  6 Jul 2026 11:42:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F1141DED6
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 11:42:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783338161; cv=none; b=Xsl3Na2n3JnQ2s9WJRbmvaeXHldAxZAAY6dge0qE1FvHtOHgl/3fdwZHHNOyTvoZJs/l1iyKjjlwIQvfqvkR9MmtgO5hz1lPubJW6sxnKu3Fn0r6OwX11eVsL14CbxWh/cGaxlA4CsEiSKmt/eBLyeY4EfCKFGyFI5JTWC3tjHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783338161; c=relaxed/simple;
	bh=/NFvR6wfBtbE/e2zmh3j4EF1HB4MMchD8i3wmLsvD+g=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OtNfhSJ1ryhKWpeT7yo3oQVBBFY8U803kDObBiW1wUmgiQNoMkyHZiF/wjxIO/HI/SolK3rY63rE5JUijvMpoeLI4maS6yFGDRKu8+K7DPR377ObYEQSYySwSFuIv+MW9tRxzRpvfgc2Inye3tvMn2hVwi9ZmMk1W8Yk8QihZ5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=goLXkLzL; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F3341F01559
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 11:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783338160;
	bh=2WHMyn0VUWWYlG5J6larR9VZfgkh4kTyac4Ldi9U/aQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=goLXkLzL/8kZfh4ry6XD2G2y91J3vdVG9bTzONAbnd1FSMNEBIeMJx0nMmiTrOVs2
	 AhMwwf0K4uy6C9Wbbo8LCsfdj6j6RYmFts9ee0VG5leRSF8UKoHc91aLgYuowIsRK5
	 sCOZrqMaTCtnwcnT/hGcuhYc0S/u6gGIaxAeDj+vzH1oKbtQUUWaCabX90XPaP44qz
	 ife+SEuDUsML3+vnu7w93KYD7Y7PJr5tnqGvtexQfAjkZN2LpIOzMGRvaajlf7P6u+
	 AQ1W4ggJYKq2DpAxTXg5K4kar7hGr27pnT/hg/lGf4n3VnkiKXi5IBRlvG/9XzxuNS
	 5QWYyoc9qx1Uw==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39b349ae174so25046271fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 04:42:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoL9NARuw/mB0qgMPEVRbJxdLs4kmOwwUkJfVOiGptKGdneYSQMQjKcrRrctRS06Bn92ActfdarVEz9@vger.kernel.org
X-Gm-Message-State: AOJu0Yylr07FF0jLWURWkHVfMpap6JKP+HvRdr219XsBWwXE3EVqXgza
	dH79758tqkR8S5ON6GulQ9Jlj9UgmKL1omRJV7daaY4CZ21EEZGinfOiG0594K3SnHuL64wdwAZ
	omsUziKmxaFbmbordwUrwOXp0QcBfgb9tMtIozdugCA==
X-Received: by 2002:a05:651c:f14:b0:39b:4402:3c82 with SMTP id
 38308e7fff4ca-39c6004e724mr633711fa.37.1783338158704; Mon, 06 Jul 2026
 04:42:38 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jul 2026 07:42:36 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jul 2026 07:42:36 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <akKT8q5TjkMkZkmB@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629-swnode-fw-devlink-v1-0-b90058b41839@oss.qualcomm.com>
 <20260629-swnode-fw-devlink-v1-3-b90058b41839@oss.qualcomm.com> <akKT8q5TjkMkZkmB@ashevche-desk.local>
Date: Mon, 6 Jul 2026 07:42:36 -0400
X-Gmail-Original-Message-ID: <CAMRc=Me4oJG47C2LOzRvagbEtAWKqbzmQ_R2VG4rt6zd1-QE5Q@mail.gmail.com>
X-Gm-Features: AVVi8CcgKXfNSlhhfMGRqXXq180I-tblQnpihdsKJ_ip6-61GNWt0Dm5fNgFkuI
Message-ID: <CAMRc=Me4oJG47C2LOzRvagbEtAWKqbzmQ_R2VG4rt6zd1-QE5Q@mail.gmail.com>
Subject: Re: [PATCH 3/5] software node: add kunit tests for fw_devlink support
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39514-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:brendan.higgins@linux.dev,m:david@davidgow.net,m:raemoar63@gmail.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:brgl@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:kunit-dev@googlegroups.com,m:linux-acpi@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.dev,davidgow.net,gmail.com,linux.intel.com,kernel.org,linuxfoundation.org,vger.kernel.org,googlegroups.com,lists.linux.dev,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,intel.com:email];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 374BC70FFFD

On Mon, 29 Jun 2026 17:49:06 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> On Mon, Jun 29, 2026 at 12:52:08PM +0200, Bartosz Golaszewski wrote:
>> Add a kunit test suite for fw_devlink support for software nodes.
>>
>> Most cases call add_links() directly and inspect the resulting fwnode
>> supplier/consumer lists: a single reference, multiple references, a
>> reference to an unregistered node, a "remote-endpoint" reference and a
>> reference array. The last case is end-to-end - it registers real consumer
>> and supplier platform devices together with their drivers, adds the
>> consumer first and checks that fw_devlink defers its probe until the
>> supplier has been bound.
>
> ...
>
>> ---
>>  drivers/base/test/Kconfig               |   5 +
>>  drivers/base/test/Makefile              |   3 +
>>  drivers/base/test/swnode-devlink-test.c | 336 ++++++++++++++++++++++++++++++++
>
> + MAINTAINERS.
>
> ...
>
>
>> +/* A single reference creates exactly one supplier link, on both list ends. */
>> +static void swnode_devlink_test_single_ref(struct kunit *test)
>> +{
>> +	static const struct software_node supp_swnode = {
>> +		.name = "swnode-devlink-test-supplier"
>
> Keep trailing comma.
>
>> +	};
>
>> +
>
> Redundant blank line.
>

I actually leave a blank line between static, const and regular local variable
blocks for readability.

Bart

