Return-Path: <linux-gpio+bounces-39513-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5ol+LCiTS2otVwEAu9opvQ
	(envelope-from <linux-gpio+bounces-39513-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 13:36:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C35070FEAC
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 13:36:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=SAIGelZk;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39513-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39513-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4B316301DD3E
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 11:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23FE641D4CD;
	Mon,  6 Jul 2026 11:34:33 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44DA3F44E3
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 11:34:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783337672; cv=none; b=rrKMtvG/xnu8BApMYGlAntpv7BXoAdZ7L0JKwal2ZKEW9bvUTfbOJjEzZmo7KVhlxIYipJafRMZWcpdnMUODC1rSDUYdgLS0aZE4rBzMf8AxjxuC+wCfnOdIAOfMnpn24Nx9/aNCIZT1kM4PVmXGT/S6WcTU8JEeYcHlblwQ54Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783337672; c=relaxed/simple;
	bh=UOJg7X5Kb453/mw98+TRBVGvv5iWr484+EGGlvJ4MNc=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DjB7ix44dhUFMOTbPSTQxTd4RCZYFTzQvGHUtOph6J/vC6g/zl38T1csbrY5lASnz2qPE0Z/xARgGryWjM8TOlrDKQkMYbUtYrqaq4sGRvem1YfX781xgpmKwntyciOJ/AWhfFzNYr7GFAax6oVZMaaa/n4glMGv7QyXgYJkj9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SAIGelZk; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 888591F00ADE
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 11:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783337671;
	bh=qsW4IrGJ+UPHKBevn7EWJ5gsHP0AADr39xCgUbyKWA8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=SAIGelZk5qF1uRsoQRBUlLh7badkL1DRQTB5RSjJOCagX+Cs2MQMVJzoQeJJzwcQV
	 q3JhEG97+N0CnNSutCXRvEp2sp9Awc3nqxPyqHBowDsNcwLSLzmWAJ47wU/2gpdV03
	 KIBYx8rnA7uiaw5TPdBicN39pEq6rKfLybfAG7FWhQGmGDh+4uYLuUqmA3xo6sW/yn
	 739kDsR4lNgVWW1HG+mAkPWco7PAQ19K99eIYcQTpRsGzXeWOX4d15v0YnNJ6pSuR9
	 hvAl1n5jGkbihXJkCOvok8HvBVbFC6XmUOH1HwLDgkQRIqIi6LGXLk46vQfRxlWtLN
	 vS7es0ZxvxvrQ==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39b293079d1so24399501fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 04:34:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RocY3PQ5XRWdakATqOOKgXV0w+D+GgFzBeExrHnBQL7jBGzXD8qQxtK7rOk1cH0/ucL9rOjZU90uzkv@vger.kernel.org
X-Gm-Message-State: AOJu0YyG57EoACG2+d13xi+EYF0DRwyFRVjS3Y8wGhn1+9HEpA7deLab
	svsz1VgEzCLWwe5yXegPeuDgZhjYm3hp8jB9Jso63fotL7VUwsZBfSlgn4FmDGO0EvSeM7Qn1vH
	SVcgRa++WlkMJsMdfKnhsthpfQPNS6vkBYvAZbMpO4g==
X-Received: by 2002:a05:651c:3612:b0:39a:cfe9:d799 with SMTP id
 38308e7fff4ca-39c5ffedd6bmr711851fa.31.1783337670091; Mon, 06 Jul 2026
 04:34:30 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jul 2026 04:34:29 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jul 2026 04:34:29 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <akKSYKH2vyXMVcox@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629-swnode-fw-devlink-v1-0-b90058b41839@oss.qualcomm.com>
 <20260629-swnode-fw-devlink-v1-2-b90058b41839@oss.qualcomm.com> <akKSYKH2vyXMVcox@ashevche-desk.local>
Date: Mon, 6 Jul 2026 04:34:29 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfAUfvOhTnra2uDN1Orwv=CEvfNN01Kq7vCRr2qj1gOQg@mail.gmail.com>
X-Gm-Features: AVVi8Cc4Tk4unpYE9OTnV07qT4rN_cHjwvPUTLU5l8rg-mjrIw2LE6ZzWSl1nsI
Message-ID: <CAMRc=MfAUfvOhTnra2uDN1Orwv=CEvfNN01Kq7vCRr2qj1gOQg@mail.gmail.com>
Subject: Re: [PATCH 2/5] software node: add fw_devlink support
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
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39513-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:brendan.higgins@linux.dev,m:david@davidgow.net,m:raemoar63@gmail.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:brgl@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:kunit-dev@googlegroups.com,m:linux-acpi@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:herve.codina@bootlin.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.dev,davidgow.net,gmail.com,linux.intel.com,kernel.org,linuxfoundation.org,vger.kernel.org,googlegroups.com,lists.linux.dev,oss.qualcomm.com,bootlin.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4C35070FEAC

On Mon, 29 Jun 2026 17:42:24 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> +Cc: Herve, to just ask the situation with one series that adds nice helper.
>
> On Mon, Jun 29, 2026 at 12:52:07PM +0200, Bartosz Golaszewski wrote:
>> Software nodes can be used to describe supplier-consumer relationships
>> between devices they represent using reference property entries. Unlike
>> for OF-nodes, driver core cannot yet use these references to create a
>> probe order that avoids needless probe deferrals on missing providers.
>>
>> Implement software_node_add_links() modelled on of_fwnode_add_links().
>> For every DEV_PROP_REF property we resolve each referenced supplier and
>> create an fwnode link from the node to it. The driver core later promotes
>> these to device links and defers the consumer until the suppliers are
>> ready.
>>
>> There's no allowlist like the one DT needs - devicetree phandles appear
>> in plenty of non-supplier contexts, but a software node only carries a
>> reference property when its author explicitly points at another node, so
>> we treat every reference as an intentional supplier dependency and link
>> all of them. Graph "remote-endpoint" references are skipped for now: they
>> go 2-ways between endpoint nodes and would create graph cycles without
>> the port-parent lifting DT does via get_con_dev(). References to
>> suppliers that aren't registered yet and self-references are ignored.
>>
>> fw_devlink resolves the supplier device through fwnode->dev but the core
>> only records the owning device on the primary fwnode. When the software
>> node is a device's secondary fwnode, mirror the device pointer onto it in
>> software_node_notify() so the consumer can actually find the supplier
>> instead of deferring forever.
>>
>> While at it: purge the fwnode links in software_node_release() now that
>> software nodes can own them.
>
> ...
>
>> +static int software_node_add_links(struct fwnode_handle *fwnode)
>> +{
>> +	const struct software_node_ref_args *ref, *ref_array;
>> +	struct swnode *swnode = to_swnode(fwnode);
>> +	const struct property_entry *prop;
>> +	struct fwnode_handle *refnode;
>> +	unsigned int count, i;
>
> 'i' is local to the loop.
>
>> +	if (!swnode || !swnode->node->properties)
>> +		return 0;
>> +
>> +	/*
>> +	 * Unlike Device Tree, where phandles appear in many non-supplier
>> +	 * contexts and a curated allowlist is required, a software node only
>> +	 * carries a DEV_PROP_REF property when the author explicitly describes
>> +	 * a reference to another node. Every such reference is therefore an
>> +	 * intentional supplier dependency, so we create fwnode links for all
>> +	 * of them.
>> +	 */
>> +	for (prop = swnode->node->properties; prop->name; prop++) {
>> +		if (prop->type != DEV_PROP_REF || prop->is_inline)
>> +			continue;
>> +
>> +		/*
>> +		 * TODO: Graph "remote-endpoint" references go both ways
>> +		 * between endpoint child nodes and would create endpoint
>> +		 * cycles. Let's leave it out for now until we have potential
>> +		 * users.
>> +		 */
>> +		if (!strcmp(prop->name, "remote-endpoint"))
>> +			continue;
>> +
>> +		ref_array = prop->pointer;
>> +		count = prop->length / sizeof(*ref_array);
>
> Seems we are going to have more of a such, perhaps make a helper for counting
> (which will do that division beneath).
>

Let's cross that bridge when we get there? I don't want to burden the series
with more changes than necessary.

>> +		for (i = 0; i < count; i++) {
>
> 		for (unsigned int i = 0; i < count; i++) {
>
>> +
>
> Redundant blank line?

I think it's fine for readability.

I fixed the rest in v2.

Bart

