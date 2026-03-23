Return-Path: <linux-gpio+bounces-34020-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yqENHqMmwWm+RAQAu9opvQ
	(envelope-from <linux-gpio+bounces-34020-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 12:40:19 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 201D72F1568
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 12:40:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A2DE33019CBA
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 11:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74358397E70;
	Mon, 23 Mar 2026 11:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mqr96Lol"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2A7396587
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 11:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774266014; cv=none; b=NR6rdQo4nRLuwYhUNegO34NS2uKojuATPDnKsf21X6xR1cNyuElmKEKjX01ZW/keHHIKjM6x9OLxoIqHA024KOttYDzwB8Q853rMek9CnFTeDi0/D1+JPzivUqVlLd/BO7u3r85iB9u1PmG/cSeqWDTX9mY1aeMDrzBrnhxONKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774266014; c=relaxed/simple;
	bh=xBPbm2psL2E1gEqh2Far/32tTK00tXUWPBenA/iZQWA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AMKS2J1SJEtVw4H9ZSfhMHGOG1l5D+FtkW/soVHiSicYidSYMgzgCJ7RHg5gLHbIrl7a0p7Te53PzkP1Lz/ENdylLM0SbNY53pUnqzdnD64srbdCoqG2mlop3lHckU6sKy+J9dnmaJMGK6FzQMI9O1dweSMa2NM39TqMbou3zqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mqr96Lol; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE23CC2BC9E
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 11:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774266014;
	bh=xBPbm2psL2E1gEqh2Far/32tTK00tXUWPBenA/iZQWA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=mqr96LolKdqiKOCLHzaUKK0CFgbDJ0UryPgFgCvIIh6tkvzgZ0yrzNVLAwS8f3uVV
	 7CnlHhNUBtJYkN2ExeMh0qGogEXotRNa0b9EQ3E+T6qrxecTG/xAJ9fJuwIPjcIl8M
	 2EUCMAfggOgASMkpDzNRTIKaP/QuRfGRNMPnmBwL6H1dYdAMVUNKueD4UAFpPbu1w/
	 EhaqjVSSuhzhgX41JeQpCeIdDZ73MtRnBUyg+quRBRJeap1CuNZCzTXxWRucGvWQc6
	 0WiB7DnYEmeCNKZmr/khI1g5c7Ol04qxTT1U0ekZQqj4IKFb1bgfUILFbLgsYqTRgC
	 nT9Y2SFMMpOSQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a0ff30b240so4180887e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 04:40:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX9pAmpgLhRmGtTHpvHg1Fc47+puQ3Vlix0OjMFm8MlXMb9H08Ghl/bdc3sie+/V5oyCwz1cw0BxDQj@vger.kernel.org
X-Gm-Message-State: AOJu0Yys7BrDs8GasFlhHif0yWSKLlsb98Y1/QftRI54XRMoaxQpdtcg
	pgw0v8u6s5+ZLIhpajCLbR47Wo1Zm6wYDZWZO8GOx+qx04b1HIhq3/kusokN4O94YVV8Rq3VJTV
	PFBAnB3jZDkSmyXaSWxw+Wi9aGBfvlu9uvgxIz3jwOQ==
X-Received: by 2002:a05:6512:308c:b0:5a2:78f8:60aa with SMTP id
 2adb3069b0e04-5a285b5aab5mr4842573e87.37.1774266012393; Mon, 23 Mar 2026
 04:40:12 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 23 Mar 2026 04:40:11 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 23 Mar 2026 04:40:11 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <ab47QXIYCo3vNI8J@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319-baytrail-real-swnode-v1-0-75f2264ae49f@oss.qualcomm.com>
 <abyje0mhIOtDZbxO@google.com> <CAMRc=McPQq6QxJ48zk7kxA+kwc=Em8dsFfyECJXg0asY-+pRiw@mail.gmail.com>
 <ab47QXIYCo3vNI8J@google.com>
Date: Mon, 23 Mar 2026 04:40:11 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdmuOS-5mHGYtsr3jz654rA9moH4Po_rAFdaPBq-5KCZA@mail.gmail.com>
X-Gm-Features: AaiRm50xYuGbGJMWR-La7zfZgOhQynHddWFdS_RuSs-HPX9Rf22AdalqjZ092cY
Message-ID: <CAMRc=MdmuOS-5mHGYtsr3jz654rA9moH4Po_rAFdaPBq-5KCZA@mail.gmail.com>
Subject: Re: [PATCH 0/4] platform/x86: x86-android-tablets: use real firmware
 node references with intel drivers
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34020-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org,vger.kernel.org,lists.linux.dev,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 201D72F1568
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 21 Mar 2026 08:01:30 +0100, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> On Fri, Mar 20, 2026 at 01:33:06PM -0700, Bartosz Golaszewski wrote:
>> On Fri, 20 Mar 2026 02:49:02 +0100, Dmitry Torokhov
>> <dmitry.torokhov@gmail.com> said:
>> > Hi Bartosz,
>> >
>> > On Thu, Mar 19, 2026 at 05:10:53PM +0100, Bartosz Golaszewski wrote:
>> >>
>> >> This series proposes a solution in the form of automatic secondary
>> >> software node assignment (I'm open to better naming ideas). We extend
>> >> the swnode API with functions allowing to set up a behind-the-scenes bus
>> >> notifier for a group of named software nodes. It will wait for bus
>> >> events and when a device is added, it will check its name against the
>> >> software node's name and - on match - assign the software node as the
>> >> secondary firmware node of the device's *real* firmware node.
>> >
>> > The more I think about the current approaches with strict identity
>> > matching the less I like them, and the reason is that strict identity
>> > matching establishes rigid links between consumers and producers of
>> > GPIOS/swnodes, and puts us into link order hell. For example, I believe
>> > if andoird tablets drivers were in drivers/android vs
>> > drivers/platform/... the current scheme would break since the nodes
>> > would not be registered and GPIO lookups would fail with -ENOENT vs
>> > -EPROBE_DEFER.
>> >
>>
>> Why would they not get registered? They get attached when the target devices
>> are added in modules this module depends on. They are exported symbols so the
>> prerequisite modules will get loaded before and the module's init function
>> will have run by the time the software nodes are referred to by the fwnode
>> interface at which point they will have been registered with the swnode
>> framework.
>
> I mentioned link order, which implies no modules are involved. When code
> is built into the kernel initialization follows link order, which is
> typically alphabetical. To ensure the order you require you either need
> to move targets inside makefiles or change some drivers from
> module_init() to <some other>_initcall(). This is known as "link order
> hell" that was very common before deferred probing was introduced.
>

Maybe we should return -EPROBE_DEFER in GPIO swnode lookup when
fwnode_property_get_reference_args() returns -ENOENT because if there's a
software node that's not yet been registered as a firmware node, it's not much
different from there being a firmware node not bound to a device yet - which
is grounds for probe deferral.

>>
>> > Given that this series somewhat re-introduces the name matching, I
>> > wonder if we can not do something like the following (the rough draft):
>> >
>>
>> I'm open to better ideas and possibly multiple matching mechanisms but this
>> just fit in this particular case. I'm not overly attached to name matching. We
>> may as well use whatever properties ACPI provides to identify the devices and
>> assign them their swnodes.
>
> What ACPI has to do with this? Oftentimes we are dealing with non x86
> systems.
>

What I meant is: name matching is only one method of assigning software nodes
to devices. Here I went with waiting for devices but with DT we may as well
look up a node by compatible depending on the driver. For ACPI we may probably
use some mechanism that matches the devices to the software node in a more
specific way. That's just hypothetical, I don't know if there even is one.

IOW: device-name-to-software-node name matching is only one of possible methods.

>>
>> > diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
>> > index 51320837f3a9..b0e8923a092c 100644
>> > --- a/drivers/base/swnode.c
>> > +++ b/drivers/base/swnode.c
>> > @@ -509,6 +509,7 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
>> >  	struct swnode *swnode = to_swnode(fwnode);
>> >  	const struct software_node_ref_args *ref_array;
>> >  	const struct software_node_ref_args *ref;
>> > +	const struct software_node *ref_swnode;
>> >  	const struct property_entry *prop;
>> >  	struct fwnode_handle *refnode;
>> >  	u32 nargs_prop_val;
>> > @@ -550,7 +551,10 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
>> >  		refnode = software_node_fwnode(ref->swnode);
>> >  	else if (ref->fwnode)
>> >  		refnode = ref->fwnode;
>> > -	else
>> > +	else if (ref->swnode_name) {
>> > +		ref_swnode = software_node_find_by_name(NULL, ref->swnode_name);
>> > +		refnode = ref_swnode ? software_node_fwnode(ref_swnode) : NULL;
>> > +	} else
>> >  		return -EINVAL;
>> >
>> >  	if (!refnode)
>> > diff --git a/include/linux/property.h b/include/linux/property.h
>> > index e30ef23a9af3..44e96ee47272 100644
>> > --- a/include/linux/property.h
>> > +++ b/include/linux/property.h
>> > @@ -363,6 +363,7 @@ struct software_node;
>> >  struct software_node_ref_args {
>> >  	const struct software_node *swnode;
>> >  	struct fwnode_handle *fwnode;
>> > +	const char *swnode_name;
>> >  	unsigned int nargs;
>> >  	u64 args[NR_FWNODE_REFERENCE_ARGS];
>> >  };
>> > @@ -373,6 +374,9 @@ struct software_node_ref_args {
>> >  			   const struct software_node *: _ref_,	\
>> >  			   struct software_node *: _ref_,	\
>> >  			   default: NULL),			\
>> > +	.swnode_name = _Generic(_ref_,				\
>> > +				const char *: _ref_,		\
>> > +				default: NULL),			\
>> >  	.fwnode = _Generic(_ref_,				\
>> >  			   struct fwnode_handle *: _ref_,	\
>> >  			   default: NULL),			\
>> >
>> > This will allow consumers specify top-level software node name instead
>> > of software node structure, and it will get resolved to concrete
>> > firmware node. GPIOLIB can continue matching on node identity.
>> >
>> > WDYT?
>> >
>>
>> I think it's bad design and even bigger abuse of the software node concept.
>> What you're proposing is effectively allowing to use struct software_node as
>> a misleading string wrapper. You wouldn't use it to pass any properties to
>> the device you're pointing to - because how if there's no link between them -
>> you would just store an arbitrary string in a structure that serves
>> a completely different purpose.
>
> I think you completely misunderstood the proposal. We are not using

Ok, I didn't fully get that part, I was OoO on Friday and should have probably
not rushed a late evening answer. :)

> software node as a string wrapper, we give an opportunity to use
> software node name to resolve to the real software node at the time we
> try to resolve the reference. The software node is still expected to be
> bound to the target device (unlike the original approach that has a
> dangling software node which name expected to match gpiochip label).
>
> I think this actually a very good approach: it severs the tight coupling
> while still maintains the spirit of firmware nodes being attached to
> devices. The only difference we are using object's name and not its
> address as starting point. Similarly how you use name derived from
> device name to locate and assign secondary node in this patch series.
>

I still don't like it. It forces us to use names for the remote software nodes,
which are after all C structures that we could identify by addresses alone.
Even this series could be reworked to drop the names from the GPIO software
nodes.

software_node_find_by_name() only goes through the list of registered software
nodes so we'd still end up returning -ENOENT for nodes which have not been
registered yet and wouldn't be able to tell this situation apart from a case
where there's no such software node at all.

The consumer driver still needs to know the remote device by an arbitrary
string.

I think you're exaggarating the possible problems with link order. I believe
that issue could be fixed by returning EPROBE_DEFER when a software node is
not yet known by an fwnode handle but we know it is there so it's just a matter
of it getting registered.

That being said, I would like to hear from driver core maintainers in general
and from software node maintainers in particular.

>>
>> Which is BTW exactly what was done in GPIO and - while there's no denying that
>> I signed-off on these patches - it goes to show just how misleading this design
>> is - I was aware of this development and queued the patches but only really
>> understood what was going on when it was too late and this pattern was
>> copy-pasted all over the kernel.
>>
>> Software nodes are just an implementation of firmware nodes and as such should
>> follow the same principles. If a software node describes a device, it should be
>> attached to it
>
> Yes, and the patch above solves this.
>

I would say it just pushes the string matching deeper.

>> so that references can be resolved by checking the address of
>> the underlying firmware node handle and not by string matching. I will die on
>> that hill. :)
>
> I would like to understand why. I outlined the problems with this
> approach (too tight coupling, needing to export nodes, include
> additional headers, and deal with the link order issues, along with
> potential changes to the system initialization/probe order). What are
> the drawbacks of name matching as long as we do not create
> dangling/shadow nodes?
>
> You are saying that you want resolve strictly by address, but have you
> looked at how OF references are resolved? Hint: phandle is not a raw
> address. It's actually a 32 bit integer! Look at ACPI. It also does not
> simply have a pointer to another ACPI node there, the data structure is
> much more complex.
>

That's dictated by the binary format of devicetree where:

	prop = <&foo>;

Is translated to:

	foo {
		phandle = <0x123>;
	};

	prop = <0x123>;

And I suppose this could be translated into addresses of respective struct
device_node objects already at the tree unflattening stage - just like is
done for parent-child relationships.

However, this is very much hidden from users and someone who deals with DT
sources always sees a proper reference to a node (by path, label or otherwise).

Here we're talking about referring to firmware nodes by name which does happen
but is typically reserved for some special cases and well-known nodes.

Bartosz

