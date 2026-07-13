Return-Path: <linux-gpio+bounces-39974-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f4OvIbTQVGrYfAAAu9opvQ
	(envelope-from <linux-gpio+bounces-39974-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 13:49:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FA474A849
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 13:49:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=VWdUAQf9;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39974-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39974-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9EBBB303B7D9
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 11:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5FBD3EC2EA;
	Mon, 13 Jul 2026 11:46:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A793B3EB81B
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 11:46:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783943175; cv=none; b=cCWOlbBqnH9jChujStlvzu8nOmFkGk4Afd6wc5RNt5NzzYRtDYct4io0TVIa+VXqBKKhX0eCWh1UnFIqAFeMyCxfmwHxZGnjmZt3ZSV3piCT+5JLBBNx8dS5/c9/TbqEBCEByzwVBr2bS2wq4gRLz8+MIm3bisU2MT1c9FOkHMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783943175; c=relaxed/simple;
	bh=pUgson4YtjyZJkYXfgKrgDqqtbvolnDsUl0y7l6996A=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DPkbasUptf146UoCGzI8kpT7y3yAVcwGTBpndnBdN00L83/aECeTD3tyaWvE8RT7m6BcHbmB/16pP0mO7aqIthLeF8El1HtdpQN0M8xeDQXMbV2piViUIhF0nTilTDCoDz3aVKBx+aBan7dkuxBrhIBAITjmoJMz0Z9cgBzU9UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VWdUAQf9; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 544B01F0155E
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 11:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783943174;
	bh=pUgson4YtjyZJkYXfgKrgDqqtbvolnDsUl0y7l6996A=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=VWdUAQf9e6z492iLHTwF+zgr6Ghfv/3cx9kFuDR2CjswLfeiSSZKe4dW1HNqeaaU0
	 pwYzbh0doLqMPrygIGXaKjATRIrp/HjlL06eI9vW2wLfYqW8KZTxZbL067vfY1GGL7
	 HQvoyfQah/iXxpQF7uNQPSRcBEqjfeHK0A61mJuMQwUgAJmlMiUp6x68UfRNsxckvP
	 t8sB8BwcCo9qdTMhCdPGAly5kv2+2i/aLE8z+JXpNpzCsSttO3bHCTMYQfTj/chkMB
	 uDskYEPDGHYialWRG31dezVS87X6wDaFRELIraWcw7p4FIRf6Bqe26fC+4ICDHrEgs
	 G7AYfGwVYcqhA==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39c7fd45465so25354991fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 04:46:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro+S4u5IKjYzX+wvRYyxf+PSrel6yIUYsIF554GnYoWyqsPrEQsXyvtqY0s2/eva/TEUo2+taM9hIan@vger.kernel.org
X-Gm-Message-State: AOJu0YzphE0c+w018rf9qzUYFcaEaowWBmrGA6HYKHYXqoqo9dyTUtOQ
	OjkrffPjkg14fUEFMohA4BgzTgYf+Sdm8cQYgyfpa7X3CX83IJBAvCrOlrSkzoxbq/kPiANU8UD
	aK9cRkHL304xxvEhEa4vFcB9bNRc9L6x1m+OR4szvHg==
X-Received: by 2002:a05:6512:3d1a:b0:5ae:b7ce:9ca5 with SMTP id
 2adb3069b0e04-5b023664aedmr2156671e87.18.1783943172928; Mon, 13 Jul 2026
 04:46:12 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Jul 2026 04:46:11 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Jul 2026 04:46:11 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260713-swnode-fw-devlink-v4-0-d4f2dee27ad9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713-swnode-fw-devlink-v4-0-d4f2dee27ad9@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 04:46:11 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfePNuHT8U2_mkH2akEZJJqbEOuXeQvT_NBiSXJsSEZBQ@mail.gmail.com>
X-Gm-Features: AVVi8CfiAl3cJkdaaeyXnzNXa4IO8bwcddx2O2htTa3UP3J0TA6NO-proBdoNRQ
Message-ID: <CAMRc=MfePNuHT8U2_mkH2akEZJJqbEOuXeQvT_NBiSXJsSEZBQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] software node: provide support for fw_devlink
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-gpio@vger.kernel.org, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-39974-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:kunit-dev@googlegroups.com,m:linux-acpi@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:brendan.higgins@linux.dev,m:david@davidgow.net,m:raemoar63@gmail.com,m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:brgl@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,googlegroups.com,lists.linux.dev,linux.dev,davidgow.net,gmail.com,linux.intel.com,kernel.org,linuxfoundation.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid];
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
X-Rspamd-Queue-Id: B5FA474A849

On Mon, 13 Jul 2026 13:14:43 +0200, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> said:
> Currently only devicetree systems have their devices' probe ordered
> against their suppliers automatically by fw_devlink. Software nodes have
> lately been used extensively treewide to describe references to resource
> suppliers: most notably, the GPIO subsystem uses it in many places. Now
> that the conversion of "dangling" GPIO chip software nodes to using real
> links is almost done, it makes sense to ensure no needless probe
> deferrals by implementing the add_links() callback from the fwnode
> interface.
>
> This series extends software node support to use fw_devlink and adds test
> coverage for the new behaviour.
>
> Patch 1 adds new kunit helpers that will be used later on for test
> cases.
>
> Patch 2 implements software_node_add_links() modelled on
> of_fwnode_add_links(): for every reference property it resolves the
> supplier and links to it. There's no allowlist like in DT - a software
> node only carries a reference when its author explicitly wants one, so
> every reference is an intentional supplier dependency. Graph
> "remote-endpoint" references, unregistered supplier software nodes and
> self-references are skipped. It also mirrors the device pointer onto a
> secondary software node so fw_devlink can find the supplier device, and
> purges the fwnode links on release.
>
> Patches 3 and 5 add the tests: a kunit suite for the add_links() op
> itself and GPIO tests for a real-life use-case: a GPIO consumer
> referencing its provider via a software node.
>
> Patch 4 proposes to add myself as a reviewer of software nodes.
>
> Caveats: a supplier software node must be registered before the consumer
> device is added, If the swnode is registered after the consumer was added,
> add_links() has already run and set FWNODE_FLAG_LINKS_ADDED, so the late
> supplier is missed. Graph/remote- endpoint ordering is left out for now as
> well as there are no known users.
>
> Merging strategy: with an Ack from Kunit maintainers, the entire series
> can go through the driver core tree.
>

Just a clarification: patch 5/5 will conflict with current gpio/for-next so
this one would have to go through the GPIO tree. An immutable branch with
commits 1-4 would be great.

Bart

