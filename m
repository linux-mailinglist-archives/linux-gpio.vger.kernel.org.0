Return-Path: <linux-gpio+bounces-31953-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IXVI6hEmGm0EgMAu9opvQ
	(envelope-from <linux-gpio+bounces-31953-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 12:25:28 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBA1167458
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 12:25:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B24C3014135
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 11:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A124832FA21;
	Fri, 20 Feb 2026 11:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LkeeBYiu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CF132FA1B
	for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 11:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771586724; cv=none; b=MquKBAwFlsgc5fT5l8tyt/XWhcZmERZSv0jcOmZsSqh9Zx3+bWQN07dNDecsvBWFJTu8wXzAooWVVkhzseS4kNyhZI2UAmusO44UFB9fCFGERB+X8uAWFlP1m0ud9gD3uY0VPMg6IyFE+DR9mDmEZ9Su898pToZ4iV+nYtEB+9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771586724; c=relaxed/simple;
	bh=4P/TRAN5MDaixaf2DvkgmvjrHjWjcKvwhHA6kUABaps=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tuhZ6G/4ygaLjUIuCbSlndq/i+22p5lCf+7V80oSOGo+RHyyYtEyWlIHPYlyNdYL2p7GoFIyjudragN9/RdRHA3q84EJn1x52hL5HiQPy+/DfISmJ3APgNzQmQ+9pgMSdw3YA9b2ETPVSPVWiiwG8k8IgoCeK2EJypwxgfosIFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LkeeBYiu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B00FC2BC87
	for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 11:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771586724;
	bh=4P/TRAN5MDaixaf2DvkgmvjrHjWjcKvwhHA6kUABaps=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=LkeeBYiu9iltdwdJ0Nrc4gxm1jm3F5jvJ/H7xuOR2yTKr5P7/6uymZqPCk+qNi+ZS
	 BQisZ3NQ7aEMVm+nZV0G5q3GuhF2vKk6NwUwyEe4IEMFVEIjL9z7iJTzLzfsrh4x7N
	 WnO3D17CgncgSegQszljX6xgA90vl0dB9bbQi9AaaCzbB/Mn7L5lUBeMrwpLTMG34I
	 iVsJiTExL7rVLQ7+PmlloSEG8ayELA5YkV5e1Ov5ZLKZpF0YMXuzBXPUk4bsjnL3rs
	 JcADiyyFU+FQPZ1PV+ld2bfA3Or0iEAu/U/rsQq66sqNL5d7m/44e7h61Kt8vYjNYp
	 y97ftwokNDUPw==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-385e7cafef9so16359531fa.0
        for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 03:25:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUvdhb5fy745W8od4ckTC0Ir+s0e8NYZP04ELE6hH7LkQk3ZtXNPl/qWZYcMhf23fkx2naoUzT6iQEa@vger.kernel.org
X-Gm-Message-State: AOJu0Yy80J7S9yHWYy8duHeq5dTsNNE/7RTe2Z3UjeSyAEDhqz3UXKwc
	LYD+rWpx53Uih2m5eAngofiWzn7AyG3A/PQxQ3sjxXqt1MDsnXDOzRnWnivXf7djfbxKCO1Oyer
	Z25Tf3TKwK+mcpPXrV+rAXrIJ5dnt2guNlc5lZVwYqA==
X-Received: by 2002:a05:651c:c85:b0:387:176e:68ee with SMTP id
 38308e7fff4ca-388c87ecaf9mr4438831fa.23.1771586722636; Fri, 20 Feb 2026
 03:25:22 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 Feb 2026 03:25:21 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 Feb 2026 03:25:21 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <aZgPGndb-6FTlnyR@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219-device-match-secondary-fwnode-v1-0-a64e8d4754bc@oss.qualcomm.com>
 <20260219-device-match-secondary-fwnode-v1-1-a64e8d4754bc@oss.qualcomm.com>
 <aZdraIXlkAHwP-Pm@smile.fi.intel.com> <CAMRc=MdYcbO74sbjvKeg5k_E7EHfovFHHasDx2erWfcO39zBNA@mail.gmail.com>
 <aZgPGndb-6FTlnyR@smile.fi.intel.com>
Date: Fri, 20 Feb 2026 03:25:21 -0800
X-Gmail-Original-Message-ID: <CAMRc=McUnsnVOVvxDwTKmchrvyh-_HCwEyJLnseE29d00Eicbw@mail.gmail.com>
X-Gm-Features: AaiRm521hUm1mI7r_EGjXS5X6MyOKBAL_6UxMBUsx3OCLLPPDg4m-QndCmzirGY
Message-ID: <CAMRc=McUnsnVOVvxDwTKmchrvyh-_HCwEyJLnseE29d00Eicbw@mail.gmail.com>
Subject: Re: [PATCH 1/2] driver core: provide device_match_fwnode_ext()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,gmail.com,lists.linux.dev,vger.kernel.org,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-31953-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0DBA1167458
X-Rspamd-Action: no action

On Fri, 20 Feb 2026 08:36:58 +0100, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> On Thu, Feb 19, 2026 at 04:21:59PM -0500, Bartosz Golaszewski wrote:
>> On Thu, 19 Feb 2026 20:58:32 +0100, Andy Shevchenko
>> <andriy.shevchenko@linux.intel.com> said:
>> > On Thu, Feb 19, 2026 at 05:31:22PM +0100, Bartosz Golaszewski wrote:
>> >> Provide an extended variant of device_match_fwnode() that also tries to
>> >> match the device's secondary fwnode.
>
> ...
>
>> >> +int device_match_fwnode_ext(struct device *dev, const void *fwnode)
>> >> +{
>> >> +	struct fwnode_handle *dev_node = dev_fwnode(dev);
>> >
>> >> +	if (!fwnode)
>> >
>> > IS_ERR_OR_NULL()
>> > If supplied @fwnode is secondary, it might be an error pointer.
>>
>> I mirrored existing device_match_fwnode(), should it be fixed too?
>
> The answer is "I don't know". Strictly speaking this should be done everywhere
> in the generic code when we can't guarantee that fwnode that comes to the
> function is pure NULL or valid one.
>
>> >> +		return 0;
>> >
>> >> +	if (dev_node == fwnode)
>> >> +		return 1;
>> >> +
>> >> +	return fwnode_is_primary(dev_node) && dev_node->secondary == fwnode;
>> >> +}
>> >
>> > I think we can refactor this.
>> >
>> > 	struct fwnode_handle *node;
>> >
>> > // I would name it like this, because in 3 cases in drivers/base/property.c
>> > // 2 with node and 1 with dev_node when the same API is called.
>>
>> Haystack's node is "node" and the needle is "fwnode"? Seems confusing to me.
>
> But we need some consistency. drivers/base/property.c is inconsistent to begin
> with and here the code chose the least used one for unknown reasons to me.
>
> I'm fine with "node" that is inside the function.
>
>> > 	if (IS_ERR(fwnode))
>> > 		return 0;
>> >
>> > 	if (device_match_fwnode(dev, fwnode)) // NULL check is inside
>> > 		return 1;
>>
>> Yeah, and it too can be supplied a secondary fwnode. Let's say we resolve
>> a reference to a secondary software node and try to lookup a GPIO through it,
>> we'll end up with an IS_ERR() fwnode with existing code, right?
>
> I'm not sure I understood the use case you are trying to describe here.
>
> The very first check guarantees that fwnode is either NULL or valid one.
> When it's a valid one, the comparison with error pointer will be false.
> What did I miss?
>

I mean: device_match_fwnode() has a NULL check but not an IS_ERR() check and
can be passed a secondary fwnode as argument and that can be -ENODEV. It will
probably not fail terribly but is still incorrect.

I was speaking about the existing implementation, not addressing your comments.

>> > 	node = dev_fwnode(dev);
>> >
>> > 	return fwnode_is_primary(node) && node->secondary == fwnode; // NULL check is inside
>> >
>> >
>> >> +	if (!fwnode)
>> >> +		return 0;
>> >
>> >> +	if (dev_node == fwnode)
>> >> +		return 1;
>> >> +
>> >> +	return fwnode_is_primary(dev_node) && dev_node->secondary == fwnode;
>> >> +}
>
> ...
>
>> >> +int device_match_fwnode_ext(struct device *dev, const void *fwnode);
>> >
>> > Perhaps ext --> or_secondary ?
>>
>> I thought about it but it would make it sound like it only matches the
>> secondary to me. Maybe device_match_all_fwnodes()? Would be future-proof if
>> we end up doing the linked list approach.
>
> Danilo proposed _full, but in my opinion it's not better than _ext unless you
> know very deep how fwnode structure is designed. Same with _all. It's confusing.
>
> fwnode_or_secondary (the key part is "or") sounds more precise. But if you come
> up with something else that makes less ambiguity I will be glad.
>

device_match_fwnode_or_secondary() sounds good to me but shouldn't we try to
limit the propagation of the "secondary" token in namespaces if our goal is to
get rid of the whole "secondary fwnode" concept?

Bart

