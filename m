Return-Path: <linux-gpio+bounces-31910-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGuLKgV/l2kOzQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31910-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 22:22:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7E4162BB2
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 22:22:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E522300E394
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 21:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF310328B61;
	Thu, 19 Feb 2026 21:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FN6iv1b6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BE9328B5F
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 21:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771536123; cv=none; b=Nb9ze1FmF0kUk0G49dKIKGvIc9PyPegH+5x+hVzQx1MEm2114syRQFn2dkGE9XFP1GYCuPSUSXZ7NOqyzzyvUabzVRb088AuGE33wAJ9wubOsFIm+pE45dCK6LhwxxPExFPmjYIE9/EA6VRBKv8WJ9nQj6g51cUUKs48FDgb+N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771536123; c=relaxed/simple;
	bh=29FXEzIPLE7Y2+cHqtKIt7uOGYFcSef77684coTzLsA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OXvWK9feU6g/iyAsoaDWiXgLEnD3Bdk0/jpotvOcmqJglSDdREkQs6Zp+ItPYQ2+a1qx3pMNqNrz3/XyT7yU4+5RIVGjlpAe+Ue7WOP2jiDj49l/iHjHECWHo+ffkc1C99kTcaAG2q3EzNwyMKXHESkXDo3AVG1Qbuvxsy+pKrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FN6iv1b6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36AABC4AF0B
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 21:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771536123;
	bh=29FXEzIPLE7Y2+cHqtKIt7uOGYFcSef77684coTzLsA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=FN6iv1b6WnbAaLwUWlRgd50ecENEbTQyvTHTvtp/aAvdexqDuGMgd9DpEBtkYL3mJ
	 mPFPgpMKP8lOHhZLNhpvLz2pWAIA8jjQfCRvX8Xy6cBshwq+O8qYaAy+TsgfYT24Wd
	 1bfbGufNOCwNhoVRL44W5SRzQajkE7CDJwKrXoH/39LgOxO/n3KgVpg9j8breT64mR
	 H/zLSb0fuhO7r0UmEiMEiehSlBC964sMhiYDihGZbd7PKsl4hffrC2g9EBhAeuLHRI
	 T1BMMEqHvtRai6NytyTNJXgruZwAFhz1T6ajuiReguNrn2ivTB3elAI8lK14SmjdHj
	 OovQa+kLbLqBA==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59e699310a8so2380530e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 13:22:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXo9DO22houbBoRkyKUrO9m2SuVN+XNpzZf9qxCKZgqnIsCOCzEjJa+GwJU/k9PziNV/4wEowziE0kn@vger.kernel.org
X-Gm-Message-State: AOJu0YzTz37kzjhqRpoceW3zJAFcaTDk+H+kwededbU3AA39wQXww74t
	GIyOvKR/DX1TvPO/sNiFAOB/Gk8vj80o91dQvq0PI7NVubIe3+wpCBJXKU5x1DzvrMZNUmgDEtc
	atNB4dbNJvdHc5eUz0+TiqXS7K00otK8IPC2t2AG1wA==
X-Received: by 2002:a05:6512:3408:b0:59e:62ea:239c with SMTP id
 2adb3069b0e04-59f8b42434dmr1045775e87.8.1771536121672; Thu, 19 Feb 2026
 13:22:01 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Feb 2026 16:21:59 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Feb 2026 16:21:59 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <aZdraIXlkAHwP-Pm@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219-device-match-secondary-fwnode-v1-0-a64e8d4754bc@oss.qualcomm.com>
 <20260219-device-match-secondary-fwnode-v1-1-a64e8d4754bc@oss.qualcomm.com> <aZdraIXlkAHwP-Pm@smile.fi.intel.com>
Date: Thu, 19 Feb 2026 16:21:59 -0500
X-Gmail-Original-Message-ID: <CAMRc=MdYcbO74sbjvKeg5k_E7EHfovFHHasDx2erWfcO39zBNA@mail.gmail.com>
X-Gm-Features: AaiRm52cK_ftXXCgRi00YtIULjvyEJ-dYpKZI0V8ey_vFJa637HB028sAaTjxpE
Message-ID: <CAMRc=MdYcbO74sbjvKeg5k_E7EHfovFHHasDx2erWfcO39zBNA@mail.gmail.com>
Subject: Re: [PATCH 1/2] driver core: provide device_match_fwnode_ext()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,gmail.com,lists.linux.dev,vger.kernel.org,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-31910-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 0C7E4162BB2
X-Rspamd-Action: no action

On Thu, 19 Feb 2026 20:58:32 +0100, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> On Thu, Feb 19, 2026 at 05:31:22PM +0100, Bartosz Golaszewski wrote:
>> Provide an extended variant of device_match_fwnode() that also tries to
>> match the device's secondary fwnode.
>
> ...
>
>> +int device_match_fwnode_ext(struct device *dev, const void *fwnode)
>> +{
>> +	struct fwnode_handle *dev_node = dev_fwnode(dev);
>
>> +	if (!fwnode)
>
> IS_ERR_OR_NULL()
> If supplied @fwnode is secondary, it might be an error pointer.
>

I mirrored existing device_match_fwnode(), should it be fixed too?

>> +		return 0;
>
>> +	if (dev_node == fwnode)
>> +		return 1;
>> +
>> +	return fwnode_is_primary(dev_node) && dev_node->secondary == fwnode;
>> +}
>
> I think we can refactor this.
>
> 	struct fwnode_handle *node;
>
> // I would name it like this, because in 3 cases in drivers/base/property.c
> // 2 with node and 1 with dev_node when the same API is called.
>

Haystack's node is "node" and the needle is "fwnode"? Seems confusing to me.

> 	if (IS_ERR(fwnode))
> 		return 0;
>
> 	if (device_match_fwnode(dev, fwnode)) // NULL check is inside
> 		return 1;
>

Yeah, and it too can be supplied a secondary fwnode. Let's say we resolve
a reference to a secondary software node and try to lookup a GPIO through it,
we'll end up with an IS_ERR() fwnode with existing code, right?

> 	node = dev_fwnode(dev);
>
> 	return fwnode_is_primary(node) && node->secondary == fwnode; // NULL check is inside
>
>
>> +	if (!fwnode)
>> +		return 0;
>
>> +	if (dev_node == fwnode)
>> +		return 1;
>> +
>> +	return fwnode_is_primary(dev_node) && dev_node->secondary == fwnode;
>> +}
>
>
> ...
>
>> +int device_match_fwnode_ext(struct device *dev, const void *fwnode);
>
> Perhaps ext --> or_secondary ?
>

I thought about it but it would make it sound like it only matches the
secondary to me. Maybe device_match_all_fwnodes()? Would be future-proof if
we end up doing the linked list approach.

> --
> With Best Regards,
> Andy Shevchenko
>
>
>

Bart

