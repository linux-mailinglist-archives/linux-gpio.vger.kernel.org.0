Return-Path: <linux-gpio+bounces-34058-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGPjEqi4wWm/UwQAu9opvQ
	(envelope-from <linux-gpio+bounces-34058-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 23:03:20 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA192FE071
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 23:03:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 249743033881
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 22:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98D3E38229A;
	Mon, 23 Mar 2026 22:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D2Zd751Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B54A328610
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 22:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774303320; cv=none; b=D7bk/A1Lu3v2Ekd6mAARKxv+sqEbyk2kbK23vaP3R7np9Hs7zPcjnJoSVGUZ6SqgQawUwDtK1ZUh/f567feoR4AZQ9vELX9wqzKEKAYl/Xf4XTcP7Yk3TfP/BZlM1bBP4qSBfdZpxxi7mgCUFlHCu+I1wIu4zeBJk9MFjHAfa4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774303320; c=relaxed/simple;
	bh=DxITZ6RZN3mTPfcQetbVwCvueHrYNNqrL6pVDOX6J1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c/glHls7QmVfJT6cBlCxhDAqx7rpuHV86u9fQrDMuWde/1xfYn4aVYZYkqHF5DdE/Z7HjAwCTEaBplf2ndoSfqDKUv5Hy9sI5V273GOwMExqbAorQ/pRmN0o7HUD77/gC/X85UJG4WBpENKCDVO0Ea6D2Peww/QadIUIeYh9uDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D2Zd751Y; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2c1092cc08cso1325262eec.1
        for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 15:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774303317; x=1774908117; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SApLYsjj21LLEE9cSsE8+zYtkogrVJbdt7o8K1bL5zo=;
        b=D2Zd751YyxnwlvGB7ZMrkk1o1wxHNBmXg1lgIm/p3bDtTw/XuzyQD1z+z78RgswoIp
         WFlJsDXG3u/cGCuxUU77sSPKhaz0tNZ7geDNYKdpjydA09IoDD1YPHN6M5jJPZsToAtP
         7SFBbZRyE3nnSKZicw0XtFyMZ3DJC7Gy+CA7O4+Z4H3+zlGeCNT2szrbohMz+ERybSiU
         rh99XLK/cS1naQa6PDxyZvNgtqQWjHvAT63X6iBOFxhxsLszdt+oK9V5CsANfXniKFCQ
         SVp4DRCxZ52INvdPyf2uxop2ISo7DsRCQ51ihZ0EQz4rrmZKl1aHhtd/xyb0WplRt9bJ
         vz0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774303317; x=1774908117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SApLYsjj21LLEE9cSsE8+zYtkogrVJbdt7o8K1bL5zo=;
        b=r0CZ2oCZ9b0UFHk8+MxycFnMVcMSmU4sGboPaQpva5PsfPn9lnJJz7cnRh04W3c/QJ
         va2Pa3+wSfFbRzmkIv0npFCHprkAuAIxuj7+XQhXHqO5XtysjPTW59T+8EJJ/i/XbV3c
         GqskrzXq+dorUyH0HHpIG8aVvTWORP9DRqGazAfH9YJPg8qtVCaLdryTaOFDpUd85aIc
         IDBusZgT1Oysmodk0ksfY0i8e0OFMyhI9pybeFWFKKcL9nQs3TKk3juIN/wt6A7jqgwD
         ID9PrFeoJYQAZM60ObS3JoTmbweaLqmTnbsxKDi3Ni8ybhB8hX7Y16lOG9945vP6RY5k
         d+8g==
X-Forwarded-Encrypted: i=1; AJvYcCW2tepTOA/5RlERhGx5C66LLM7Pv4nW75Ug7bmbzBD6sVkzDOCDOZuK/CXXtDKGEPlhP1UB8HUS+oD9@vger.kernel.org
X-Gm-Message-State: AOJu0Yz11pDRUgaeQ9gQN/9BSU9p9VOKZ0H43SQYBAxVJ8ZvrtIjbhbe
	5mgnNK8NTFaOrqTJWrvC+Mwc8GuVa6cQtg67uIwfe49BvGlgw51UV5Ng
X-Gm-Gg: ATEYQzzdQM0de/xB6xofDyQ/w2kVLCN9EuOH3R+AAMpan7edPWjAuwOW+TnKmUOt5FD
	IcMEH1abVuUgQ9hgvjv4UlaZq134UM76zlVYOJT7MUUDHZ/LC2TkoTewv/hyK1XJ1zxlfakFz+g
	Z2Nlf3JUrvpOww7Ll02YNVSZYmAoNkPvSGrLYazN6tfaNpoJBxuog0oVob+1GftxASODUsl0y51
	XeBfyNJNdEyl0JQZ4ws3mk68WfYhJT6psWhk/ITSwBYoUElm+cWSuDeKgKOLUscVOYWK2LsOF8Y
	pT2h3iq5LZQXyX1WJE8ds80l1PyNSe9hAXuqejioaSCGBh9mAw8gSIoinf/q9HEDugprF6dgUux
	JjgM/eR+0104GFSfFBbgaXpI8BsAqx8E/GjRPu/9fhE8frcUG6EB2vr0YvgR6tTM/k11726S+05
	JcAVNXZtsTJJbtKV8YvbqrWLKW+MxxCKKxDqRByZ0gJE7FdFUWvRtuLc+YPCxttMVo
X-Received: by 2002:a05:693c:3005:b0:2b8:64ad:ad4d with SMTP id 5a478bee46e88-2c1097c1a0dmr6526721eec.26.1774303317366;
        Mon, 23 Mar 2026 15:01:57 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a296:1211:5ab0:bc95])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b35116bsm15940178eec.30.2026.03.23.15.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:01:56 -0700 (PDT)
Date: Mon, 23 Mar 2026 15:01:52 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 0/4] platform/x86: x86-android-tablets: use real firmware
 node references with intel drivers
Message-ID: <acG2h3JxgUh6ZnyT@google.com>
References: <20260319-baytrail-real-swnode-v1-0-75f2264ae49f@oss.qualcomm.com>
 <abyje0mhIOtDZbxO@google.com>
 <CAMRc=McPQq6QxJ48zk7kxA+kwc=Em8dsFfyECJXg0asY-+pRiw@mail.gmail.com>
 <ab47QXIYCo3vNI8J@google.com>
 <CAMRc=MdmuOS-5mHGYtsr3jz654rA9moH4Po_rAFdaPBq-5KCZA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdmuOS-5mHGYtsr3jz654rA9moH4Po_rAFdaPBq-5KCZA@mail.gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org,vger.kernel.org,lists.linux.dev,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-34058-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DAA192FE071
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 04:40:11AM -0700, Bartosz Golaszewski wrote:
> On Sat, 21 Mar 2026 08:01:30 +0100, Dmitry Torokhov
> <dmitry.torokhov@gmail.com> said:
> > On Fri, Mar 20, 2026 at 01:33:06PM -0700, Bartosz Golaszewski wrote:
> >> On Fri, 20 Mar 2026 02:49:02 +0100, Dmitry Torokhov
> >> <dmitry.torokhov@gmail.com> said:
> >> > Hi Bartosz,
> >> >
> >> > On Thu, Mar 19, 2026 at 05:10:53PM +0100, Bartosz Golaszewski wrote:
> >> >>
> >> >> This series proposes a solution in the form of automatic secondary
> >> >> software node assignment (I'm open to better naming ideas). We extend
> >> >> the swnode API with functions allowing to set up a behind-the-scenes bus
> >> >> notifier for a group of named software nodes. It will wait for bus
> >> >> events and when a device is added, it will check its name against the
> >> >> software node's name and - on match - assign the software node as the
> >> >> secondary firmware node of the device's *real* firmware node.
> >> >
> >> > The more I think about the current approaches with strict identity
> >> > matching the less I like them, and the reason is that strict identity
> >> > matching establishes rigid links between consumers and producers of
> >> > GPIOS/swnodes, and puts us into link order hell. For example, I believe
> >> > if andoird tablets drivers were in drivers/android vs
> >> > drivers/platform/... the current scheme would break since the nodes
> >> > would not be registered and GPIO lookups would fail with -ENOENT vs
> >> > -EPROBE_DEFER.
> >> >
> >>
> >> Why would they not get registered? They get attached when the target devices
> >> are added in modules this module depends on. They are exported symbols so the
> >> prerequisite modules will get loaded before and the module's init function
> >> will have run by the time the software nodes are referred to by the fwnode
> >> interface at which point they will have been registered with the swnode
> >> framework.
> >
> > I mentioned link order, which implies no modules are involved. When code
> > is built into the kernel initialization follows link order, which is
> > typically alphabetical. To ensure the order you require you either need
> > to move targets inside makefiles or change some drivers from
> > module_init() to <some other>_initcall(). This is known as "link order
> > hell" that was very common before deferred probing was introduced.
> >
> 
> Maybe we should return -EPROBE_DEFER in GPIO swnode lookup when
> fwnode_property_get_reference_args() returns -ENOENT because if there's a
> software node that's not yet been registered as a firmware node, it's not much
> different from there being a firmware node not bound to a device yet - which
> is grounds for probe deferral.

Yes, I think this is a good idea.

> 
> >>
> >> > Given that this series somewhat re-introduces the name matching, I
> >> > wonder if we can not do something like the following (the rough draft):
> >> >
> >>
> >> I'm open to better ideas and possibly multiple matching mechanisms but this
> >> just fit in this particular case. I'm not overly attached to name matching. We
> >> may as well use whatever properties ACPI provides to identify the devices and
> >> assign them their swnodes.
> >
> > What ACPI has to do with this? Oftentimes we are dealing with non x86
> > systems.
> >
> 
> What I meant is: name matching is only one method of assigning software nodes
> to devices. Here I went with waiting for devices but with DT we may as well
> look up a node by compatible depending on the driver. For ACPI we may probably
> use some mechanism that matches the devices to the software node in a more
> specific way. That's just hypothetical, I don't know if there even is one.
> 
> IOW: device-name-to-software-node name matching is only one of possible methods.

I see.

> 
> >>
> >> > diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
> >> > index 51320837f3a9..b0e8923a092c 100644
> >> > --- a/drivers/base/swnode.c
> >> > +++ b/drivers/base/swnode.c
> >> > @@ -509,6 +509,7 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
> >> >  	struct swnode *swnode = to_swnode(fwnode);
> >> >  	const struct software_node_ref_args *ref_array;
> >> >  	const struct software_node_ref_args *ref;
> >> > +	const struct software_node *ref_swnode;
> >> >  	const struct property_entry *prop;
> >> >  	struct fwnode_handle *refnode;
> >> >  	u32 nargs_prop_val;
> >> > @@ -550,7 +551,10 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
> >> >  		refnode = software_node_fwnode(ref->swnode);
> >> >  	else if (ref->fwnode)
> >> >  		refnode = ref->fwnode;
> >> > -	else
> >> > +	else if (ref->swnode_name) {
> >> > +		ref_swnode = software_node_find_by_name(NULL, ref->swnode_name);
> >> > +		refnode = ref_swnode ? software_node_fwnode(ref_swnode) : NULL;
> >> > +	} else
> >> >  		return -EINVAL;
> >> >
> >> >  	if (!refnode)
> >> > diff --git a/include/linux/property.h b/include/linux/property.h
> >> > index e30ef23a9af3..44e96ee47272 100644
> >> > --- a/include/linux/property.h
> >> > +++ b/include/linux/property.h
> >> > @@ -363,6 +363,7 @@ struct software_node;
> >> >  struct software_node_ref_args {
> >> >  	const struct software_node *swnode;
> >> >  	struct fwnode_handle *fwnode;
> >> > +	const char *swnode_name;
> >> >  	unsigned int nargs;
> >> >  	u64 args[NR_FWNODE_REFERENCE_ARGS];
> >> >  };
> >> > @@ -373,6 +374,9 @@ struct software_node_ref_args {
> >> >  			   const struct software_node *: _ref_,	\
> >> >  			   struct software_node *: _ref_,	\
> >> >  			   default: NULL),			\
> >> > +	.swnode_name = _Generic(_ref_,				\
> >> > +				const char *: _ref_,		\
> >> > +				default: NULL),			\
> >> >  	.fwnode = _Generic(_ref_,				\
> >> >  			   struct fwnode_handle *: _ref_,	\
> >> >  			   default: NULL),			\
> >> >
> >> > This will allow consumers specify top-level software node name instead
> >> > of software node structure, and it will get resolved to concrete
> >> > firmware node. GPIOLIB can continue matching on node identity.
> >> >
> >> > WDYT?
> >> >
> >>
> >> I think it's bad design and even bigger abuse of the software node concept.
> >> What you're proposing is effectively allowing to use struct software_node as
> >> a misleading string wrapper. You wouldn't use it to pass any properties to
> >> the device you're pointing to - because how if there's no link between them -
> >> you would just store an arbitrary string in a structure that serves
> >> a completely different purpose.
> >
> > I think you completely misunderstood the proposal. We are not using
> 
> Ok, I didn't fully get that part, I was OoO on Friday and should have probably
> not rushed a late evening answer. :)
> 
> > software node as a string wrapper, we give an opportunity to use
> > software node name to resolve to the real software node at the time we
> > try to resolve the reference. The software node is still expected to be
> > bound to the target device (unlike the original approach that has a
> > dangling software node which name expected to match gpiochip label).
> >
> > I think this actually a very good approach: it severs the tight coupling
> > while still maintains the spirit of firmware nodes being attached to
> > devices. The only difference we are using object's name and not its
> > address as starting point. Similarly how you use name derived from
> > device name to locate and assign secondary node in this patch series.
> >
> 
> I still don't like it. It forces us to use names for the remote software nodes,
> which are after all C structures that we could identify by addresses alone.
> Even this series could be reworked to drop the names from the GPIO software
> nodes.

The whole device property business is string matching, because that is
what device properties are. If we want strict type matching we should
continue using per-driver platform data, it provides type safety. But I
think the preference is to actually use properties for configuring
devices.

> 
> software_node_find_by_name() only goes through the list of registered software
> nodes so we'd still end up returning -ENOENT for nodes which have not been
> registered yet and wouldn't be able to tell this situation apart from a case
> where there's no such software node at all.

Yes, we'd need to convert this to -EPROBE_DEFER similarly to what you
proposed above.

> 
> The consumer driver still needs to know the remote device by an arbitrary
> string.

Yes, but I think this is acceptable because of increased flexibility.

> 
> I think you're exaggarating the possible problems with link order. I believe
> that issue could be fixed by returning EPROBE_DEFER when a software node is
> not yet known by an fwnode handle but we know it is there so it's just a matter
> of it getting registered.

You need to have the module loaded and initialized so that the address
can be resolved. This changes link order and may produce unwanted
changes to the device init order. 

> 
> That being said, I would like to hear from driver core maintainers in general
> and from software node maintainers in particular.

I think I'll send out a forma patch and we can discuss further.

Thanks.

-- 
Dmitry

