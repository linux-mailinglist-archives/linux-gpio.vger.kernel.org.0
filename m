Return-Path: <linux-gpio+bounces-39560-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AO1cISmtTGrunwEAu9opvQ
	(envelope-from <linux-gpio+bounces-39560-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 09:39:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 286F27188EC
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 09:39:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=cETGzNHt;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39560-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39560-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AAA513081B77
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 07:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15B9239EF0B;
	Tue,  7 Jul 2026 07:27:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8C63F86F2
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 07:27:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783409231; cv=none; b=J50zIJh8T4ehRVril3EFuGlocXY+G3RzR706Av/eyb3BgxP+COzTeSjcPU9l0PMq+ef/B4J6kmUiy0zySrWbKD12afAe127yVnBiyKIgE7OIApQXWXMAVmsPqu+fQNC46nmixeV5dWNdpAWVxTLcVosLytowiIzA0VOZpStjdwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783409231; c=relaxed/simple;
	bh=bW4Lcl+ROSBNPUrB8CNA2HrOrOhdvNO7Bz253DXWnn4=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jgAUA/XKO3+iE5FTXZPi+yF71N4/H9Xqjrt+E+SUugQzYF3kWxHbTIX0Lf3hA+oAX8g8/8kVgKFZ7aHZxrD2hAxOqR8TV/ZH4xIJ+5n/PgwL9UR0A7+g95iINRmMVt6smOFWsGnHeU7HhH8RUcHf599sML4l34yzodd3mkQ+GWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cETGzNHt; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B47C1F00ACF
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 07:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783409224;
	bh=ZrZGOwP5B01XzisV/2lSakcRQu+bfQOZKRCHG+hKN8M=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=cETGzNHthxtLXPaqaAF548RD9GSQTCvlXyuY+TRanmCcB/GUqkZqjv0e4gGXJetsM
	 u0RnwRIICdUz+KWrglcwQrOA8vMeBP2zA4X+4B5u5ykXhPzgusn6FXBWYlFjqakHSh
	 ce0XKPZdHnXvpBYj6dJI0z8LaAy+5Gs5KyRSkmeP2sNNeu1qpa9BWjgZZB88kj4caK
	 qLhODutEBjPR51JpQkX1Mj4bb3t4wLUphv/UjUZZnueBLSawz6BodI7LBbKvIf3koW
	 Wj/fE3dAFrL5JKaT7keQcLEwB28GqVidWmFMm21hQoJjpH3uOERqjKqxXxL3oZs/3e
	 iGOiCRT5z04QQ==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39b2d38b200so4215581fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2026 00:27:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrn0CBoZDD9WE5phN6N5oeJ+OiYjpIB0B/bdaSG/J5ZRaR9KCsvW7dJzYVqYQ9I7amdA4dJS1Ki0gfN@vger.kernel.org
X-Gm-Message-State: AOJu0YzWZh/zY08b0tTmkwlzyUXFP2O9GbILQKTG9FLUmyvKT12DN1kN
	Dswh0k2wX5mzI6jWAWJka2mETZxVprCZ2P4IvfUBLMQIbZg4KaOSCtzpUzp15vKSwWgEpmfA0ec
	wt/URv245pAmH3YEC5tXs77GcMX50NchLD5F5xTx8RQ==
X-Received: by 2002:a05:651c:1a0a:b0:396:ade7:4153 with SMTP id
 38308e7fff4ca-39c697222ebmr4269631fa.0.1783409222850; Tue, 07 Jul 2026
 00:27:02 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Jul 2026 00:27:01 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Jul 2026 00:27:00 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <akwKlx2uTtHXI7zT@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629-swnode-fw-devlink-v1-0-b90058b41839@oss.qualcomm.com>
 <20260629-swnode-fw-devlink-v1-3-b90058b41839@oss.qualcomm.com>
 <akKT8q5TjkMkZkmB@ashevche-desk.local> <CAMRc=Me4oJG47C2LOzRvagbEtAWKqbzmQ_R2VG4rt6zd1-QE5Q@mail.gmail.com>
 <akwKlx2uTtHXI7zT@ashevche-desk.local>
Date: Tue, 7 Jul 2026 00:27:00 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdNfnaz0e2P32d_jWdsvtW1-zNF9ddUx092K3TUgzB7Jw@mail.gmail.com>
X-Gm-Features: AVVi8Cem5ut2dgsOwY3Bh_PHkM564EYcgUEVcmUCNMvQrUrYuAW0mstnDj5h-8k
Message-ID: <CAMRc=MdNfnaz0e2P32d_jWdsvtW1-zNF9ddUx092K3TUgzB7Jw@mail.gmail.com>
Subject: Re: [PATCH 3/5] software node: add kunit tests for fw_devlink support
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-39560-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:brendan.higgins@linux.dev,m:david@davidgow.net,m:raemoar63@gmail.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:kunit-dev@googlegroups.com,m:linux-acpi@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:brgl@kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.dev,davidgow.net,gmail.com,linux.intel.com,linuxfoundation.org,kernel.org,vger.kernel.org,googlegroups.com,lists.linux.dev,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
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
X-Rspamd-Queue-Id: 286F27188EC

On Mon, 6 Jul 2026 22:05:43 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> On Mon, Jul 06, 2026 at 07:42:36AM -0400, Bartosz Golaszewski wrote:
>> On Mon, 29 Jun 2026 17:49:06 +0200, Andy Shevchenko
>> <andriy.shevchenko@linux.intel.com> said:
>> > On Mon, Jun 29, 2026 at 12:52:08PM +0200, Bartosz Golaszewski wrote:
>
> ...
>
>> >> +	static const struct software_node supp_swnode = {
>> >> +		.name = "swnode-devlink-test-supplier"
>> >
>> > Keep trailing comma.
>> >
>> >> +	};
>> >
>> >> +
>> >
>> > Redundant blank line.
>> >
>>
>> I actually leave a blank line between static, const and regular local variable
>> blocks for readability.
>
> As far as I know this is against the style.
>

I don't think the docs mention this particular situation - correct me if I'm
wrong. Since I wrote it, I'll likely maintain this file and my personal
preference is to keep the newlines. I hope it's fine.

Bart

