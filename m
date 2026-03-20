Return-Path: <linux-gpio+bounces-33885-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGsDBKSnvGl61wIAu9opvQ
	(envelope-from <linux-gpio+bounces-33885-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 02:49:24 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B95B02D4DE5
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 02:49:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 78998303B4C3
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 01:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD8DA2C11CB;
	Fri, 20 Mar 2026 01:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gpGGNUPe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53597283FC5
	for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2026 01:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773971355; cv=none; b=IfAK4xbiymopk+v7YYp/uln7ocL0f10vXCuRB0uu+OQhPfxTXEXgElLa+V00wEKvgeLbp6BrCjOsmhmsQ5Y+87fYotwqkuXjMsXtpmEcX8LytC0fk23sybeTk1uGHDJLfx+B+JvNaUmaQHZlmmUAfwwNvYL4Vl9sXG8BRp+zTiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773971355; c=relaxed/simple;
	bh=OQbvRykKoNa43YZcIMYkN82VceNVnbkpf9iVoiXE4Q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=raYK3BDozGTUWUBa/zlFTk1lCMva2TOP3gL25aRoGvkZcYv6+k/hab9+eLzhnhMpu1iV5mJd/mRwTGQYGrD3SeDQwnAFSZQoF3ARZ+5ChRU73A5ZdpxP8ORE/CmZ4dh5RyP6O5LqT6WbRPB8MStNfNDTgoAARChXfFLzri9KNRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gpGGNUPe; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2b6b0500e06so1517704eec.1
        for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 18:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773971347; x=1774576147; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vDLk7kc0xKTEA1c0yQsz8nqJieDB48TiTejBd9azOR8=;
        b=gpGGNUPefuS29PiYD9VFmqt+ecDPzbdX5Cvt2ITJZLKL9RgNu+gQtUS2oNkWcew8zn
         e4MKuPQPD1ftGTQD+gVB7hauGCzQFn8LI8vupdZEN56xATVRpTC5j3SjA1YNLkn6hLKO
         dedo4ZVdr/e5q2zl86/qwkSdAPXL1tfb/XqFABmUdQEBQWqUhp4iuobITEVxUIYOQOEi
         6hJK+RmCbI+i6hyIYKU13lHH9yUCHq7xxo7HG/gBsFWAPBwI88NqZ/SCkBGBeCPwqMQt
         48+CqTBkdp/dALIRMBPizSdgjYLB8kCKJ8yCBi84jp3KHG1Xgm5A2sUQ63o6nmrh8b9G
         BRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773971347; x=1774576147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vDLk7kc0xKTEA1c0yQsz8nqJieDB48TiTejBd9azOR8=;
        b=knpsgCQFyVyWnJfcjk3d2I7lvVjclcpos5vu5KR2bC4YRYwD5xr0rCfakAgeb0gh8A
         +KpMZF8PtA9rJEzXmxgg67V7l7X0JWBrqbE3FwXAnA0ooIkH1U4xskic9zW5rOzuHYsG
         4G2heEBBscJAq0gQgvWoaUxVQEX2BwTo5DUI1KT7p4jUwEdM2H3UgggZ3GKFrhaAk1uT
         XyW8xFxRR5KcTkeVf+JlBvOlQBoxwgdoY9A4REfYsAPiWKb113HexUQ1P5VmrLUFxiT1
         hUey+nCiHGKxkIMEDZczshpi1VxNYoT+gLtE1xMZWCR6IAnneW/6mPGWsr+Oa4jeKqHZ
         NSRg==
X-Forwarded-Encrypted: i=1; AJvYcCWOTXOur08DppWvxY1iIjwKIA0VhE9GwVvVC8ZLf2L9sDAiA5SKXKrQJLro4PW9bKrwpQpCsm/1WE0L@vger.kernel.org
X-Gm-Message-State: AOJu0YwWk5p2jPQd9mnCJWMhrANlCAPfmOXYhy55OUwX5wjeWvJ50Rf6
	7Sa0fF/3k4bC1GytqZZrMQz2HjJAloHucg0UK4UJnlfwE01o4w9i3kCe
X-Gm-Gg: ATEYQzwBeI6w35s9tgY+yZoyq0atxFmxvtz8A2GAtyto0Qb1jSS6+9NTIR6Suj2pXLd
	vSg7lcgjUph9zNLmYwqFRnnGoWvPmEvsjLbVlk5sJ/Z+3gGwH252DWnyS0viT3hF6FtO+AcVFM0
	ntjwdqN0NCcDYbJ7NvM3qDfHuzXwLKmbxK+7FqH69aFKQo7hxnFJtNQuoJR4epanH1ZuOQfn+Kg
	vFh84e+7nPMhURDDYejQFbxUNWAA58Dk40YLqn8xRQdJAvEmeqGHknEWiKAvLBF1kBCcg43dSf4
	M/cKAMYAfL9q/o0o8UZ+MgHSwY6tdXZwoui8OjaF3qOsgD8dUQvUju3zQ6YqU8gEFgQKd0jHfu+
	c1+ZzCgiwit3X1l/+4P735UtavP8QKtfZmVlpjHBtfYGEKWNMRA4p2nRRtTUzolHSWKtlOKrlxa
	I5YRcNOt7Tr1tcwK7qUE6C+1IKInmU9gB+RPA3ls9cM6FIKU3lRL1ugHB8ma6z5dl2
X-Received: by 2002:a05:7300:d704:b0:2c0:ca48:3112 with SMTP id 5a478bee46e88-2c109625c4amr667665eec.10.1773971346674;
        Thu, 19 Mar 2026 18:49:06 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:8c36:d8b0:8e30:aab7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b17b8f2sm2037356eec.9.2026.03.19.18.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 18:49:05 -0700 (PDT)
Date: Thu, 19 Mar 2026 18:49:02 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 0/4] platform/x86: x86-android-tablets: use real firmware
 node references with intel drivers
Message-ID: <abyje0mhIOtDZbxO@google.com>
References: <20260319-baytrail-real-swnode-v1-0-75f2264ae49f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319-baytrail-real-swnode-v1-0-75f2264ae49f@oss.qualcomm.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-33885-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.960];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B95B02D4DE5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bartosz,

On Thu, Mar 19, 2026 at 05:10:53PM +0100, Bartosz Golaszewski wrote:
> Problem statement: GPIO software node lookup should rely exclusively on
> matching the addresses of the referenced firmware nodes. I tried to
> enforce it with commit e5d527be7e69 ("gpio: swnode: don't use the
> swnode's name as the key for GPIO lookup") but it broke existing
> users who abuse the software node mechanism by creating "dummy" software
> nodes named after the device they want to get GPIOs from but never
> attaching them to the actual GPIO devices. They rely on the current
> behavior of GPIOLIB where it will match the label of the GPIO controller
> against the name of the software node and does not require a true link.
> 
> x86-android-tablets driver is one of the abusers in that it creates
> dummy software nodes for baytrail and cherryview GPIO controllers but
> they don't really reference these devices. Before we can reapply
> e5d527be7e69 and support matching by fwnode address exclusively, we need
> to convert all the users to using actual fwnode references.
> 
> It's possible for drivers to reference real firmware nodes from software
> nodes via PROPERTY_ENTRY_REF() in general or PROPERTY_ENTRY_GPIO()
> specifically but for platform devices binding to real firmware nodes (DT
> or ACPI) it's cumbersome as they would need to dynamically look for the
> right nodes and create references dynamically with no way of using
> static const software nodes.
> 
> This series proposes a solution in the form of automatic secondary
> software node assignment (I'm open to better naming ideas). We extend
> the swnode API with functions allowing to set up a behind-the-scenes bus
> notifier for a group of named software nodes. It will wait for bus
> events and when a device is added, it will check its name against the
> software node's name and - on match - assign the software node as the
> secondary firmware node of the device's *real* firmware node.

The more I think about the current approaches with strict identity
matching the less I like them, and the reason is that strict identity
matching establishes rigid links between consumers and producers of
GPIOS/swnodes, and puts us into link order hell. For example, I believe
if andoird tablets drivers were in drivers/android vs
drivers/platform/... the current scheme would break since the nodes
would not be registered and GPIO lookups would fail with -ENOENT vs
-EPROBE_DEFER.

Given that this series somewhat re-introduces the name matching, I
wonder if we can not do something like the following (the rough draft):

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 51320837f3a9..b0e8923a092c 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -509,6 +509,7 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
 	struct swnode *swnode = to_swnode(fwnode);
 	const struct software_node_ref_args *ref_array;
 	const struct software_node_ref_args *ref;
+	const struct software_node *ref_swnode;
 	const struct property_entry *prop;
 	struct fwnode_handle *refnode;
 	u32 nargs_prop_val;
@@ -550,7 +551,10 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
 		refnode = software_node_fwnode(ref->swnode);
 	else if (ref->fwnode)
 		refnode = ref->fwnode;
-	else
+	else if (ref->swnode_name) {
+		ref_swnode = software_node_find_by_name(NULL, ref->swnode_name);
+		refnode = ref_swnode ? software_node_fwnode(ref_swnode) : NULL;
+	} else
 		return -EINVAL;
 
 	if (!refnode)
diff --git a/include/linux/property.h b/include/linux/property.h
index e30ef23a9af3..44e96ee47272 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -363,6 +363,7 @@ struct software_node;
 struct software_node_ref_args {
 	const struct software_node *swnode;
 	struct fwnode_handle *fwnode;
+	const char *swnode_name;
 	unsigned int nargs;
 	u64 args[NR_FWNODE_REFERENCE_ARGS];
 };
@@ -373,6 +374,9 @@ struct software_node_ref_args {
 			   const struct software_node *: _ref_,	\
 			   struct software_node *: _ref_,	\
 			   default: NULL),			\
+	.swnode_name = _Generic(_ref_,				\
+				const char *: _ref_,		\
+				default: NULL),			\
 	.fwnode = _Generic(_ref_,				\
 			   struct fwnode_handle *: _ref_,	\
 			   default: NULL),			\

This will allow consumers specify top-level software node name instead
of software node structure, and it will get resolved to concrete
firmware node. GPIOLIB can continue matching on node identity.

WDYT?

Also, you need to update the existing documentation in order to be able
to call the existing documented practice an "abuse" ;)

Thanks.

-- 
Dmitry

