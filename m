Return-Path: <linux-gpio+bounces-31908-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLZfC8p9l2kOzQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31908-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 22:16:58 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB421162B36
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 22:16:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CF5E9300DEE1
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 21:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0E122DC323;
	Thu, 19 Feb 2026 21:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I6ODqXwr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6222230649C
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 21:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771535813; cv=none; b=SCRvy5uR20sGxYp5A+8ruIwY+H5cYQdw3jeePPRbT+JZy6LpekdBlAnl9UJutTyEnFxRuG0tg8gDDpIhUiKX19aZb8DCS2bJOHO72EcCmqeOeQDfjFF0icCANQlJQHte+s5uYxJ/KGePN38viNUw1U62igE2VPNpTzYQkBREfy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771535813; c=relaxed/simple;
	bh=xXKtxPl7J/T5XDMM8o+fqaZxTwTuCPCfDhBupbfJyvM=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VPJZlCiJxL8MaGpWmlb8/TgJ1avJOamQXqmoBLpqbWXcvX6zDPcY2QB3n7m5/X/694DRE8JgO8226GuMKBioa6ONtlXUCKbM/Yomsu5BWsNzeyWNRanrVoIg1pU6EhlxvGPBVO/XYF01549XUAHVHKknTjlvL5F4gK9R+D0vUpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I6ODqXwr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17D77C116D0
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 21:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771535813;
	bh=xXKtxPl7J/T5XDMM8o+fqaZxTwTuCPCfDhBupbfJyvM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=I6ODqXwruZqUl27It6zQPvEBlWKgXCNhM4spoKEIOeYgytqv/rVIf3X+lj3i98Dps
	 tNrISlW26Gi7GAYPYHwHcuJRNHbGHRKP5aadOFJOtRSOuT2WRuwVqxPfsKzpSvJmHI
	 bF+ryeQR+4qOQguqYHwHjsimAtVqP4qbxBxva+XkS3n6xYog0CTq2K5WwIOM4e+9UT
	 9fevUQWcDj+JOYmr/T9vX1j4yl5bEGWzwi6AJI+uH23FsTiYF4HWzn3ztlB2ZJ/C7F
	 yMzSzyj2EEco5kgZ87biVw+eTP2gF7HcD1V2rkais+EHee7LjIeBqMmNLHByR/fklf
	 7XwPZHlminYLA==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59e5f52b13eso1713600e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 13:16:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUUj/pR9C4ACudPKRegfzfzHYxJ0f1HmNis+YBf147GMjH0EhryoKh9VAlFMjU9U+HEHTfPzvh8PhaU@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1HOBzwlrnVbRRkCO0TTQzpSffCPM0j5EqNOblUCvoaM99/qKw
	Oxy6LSa1C8q9cyZ2Gc72V1qU967iV04qVE11qznuyK0aJKKA44OoYzoPWXPCaCG5NQd/xVmUPBv
	DnpFHWWNOkWHrwkP6tn1LovB2s3ERTp1xaUtLKIA+Sw==
X-Received: by 2002:a05:6512:39cb:b0:59f:6a01:c18a with SMTP id
 2adb3069b0e04-59f6d38d6c2mr6999326e87.50.1771535811706; Thu, 19 Feb 2026
 13:16:51 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Feb 2026 15:16:50 -0600
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Feb 2026 15:16:50 -0600
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <DGJ3H078RVW8.28AJL6FR3OKOO@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219-device-match-secondary-fwnode-v1-0-a64e8d4754bc@oss.qualcomm.com>
 <20260219-device-match-secondary-fwnode-v1-1-a64e8d4754bc@oss.qualcomm.com>
 <2026021900-trekker-twenty-9daa@gregkh> <CAMRc=MekX-pXJEs7W9vn8-exAXyfNN3JMwrVNDPXg0b77X1NNw@mail.gmail.com>
 <DGJ3H078RVW8.28AJL6FR3OKOO@kernel.org>
Date: Thu, 19 Feb 2026 15:16:50 -0600
X-Gmail-Original-Message-ID: <CAMRc=MdS+sXi2cZ7dK_WsrHv_kW7FoRY+9hvHFT59Lu2ozHD=g@mail.gmail.com>
X-Gm-Features: AaiRm50acihZYw-lCxvJHxGkf4AZ9c7KzKjueWMzkzApyd2KOkm-0qE0zlSppq4
Message-ID: <CAMRc=MdS+sXi2cZ7dK_WsrHv_kW7FoRY+9hvHFT59Lu2ozHD=g@mail.gmail.com>
Subject: Re: [PATCH 1/2] driver core: provide device_match_fwnode_ext()
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,oss.qualcomm.com,kernel.org,gmail.com,linux.intel.com,lists.linux.dev,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,linuxfoundation.org:email];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-31908-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: BB421162B36
X-Rspamd-Action: no action

On Thu, 19 Feb 2026 17:55:20 +0100, Danilo Krummrich <dakr@kernel.org> said=
:
> On Thu Feb 19, 2026 at 5:39 PM CET, Bartosz Golaszewski wrote:
>> On Thu, Feb 19, 2026 at 5:36=E2=80=AFPM Greg Kroah-Hartman
>> <gregkh@linuxfoundation.org> wrote:
>>>
>>> On Thu, Feb 19, 2026 at 05:31:22PM +0100, Bartosz Golaszewski wrote:
>>> > Provide an extended variant of device_match_fwnode() that also tries =
to
>>> > match the device's secondary fwnode.
>>> >
>>> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.=
com>
>>> > ---
>>> >  drivers/base/core.c        | 14 ++++++++++++++
>>> >  include/linux/device/bus.h |  1 +
>>> >  2 files changed, 15 insertions(+)
>>> >
>>> > diff --git a/drivers/base/core.c b/drivers/base/core.c
>>> > index f599a1384eec90c104601422b04dc2b4c19d4382..bbf1337978fafc35eb94b=
da85e0bb7f6879879c0 100644
>>> > --- a/drivers/base/core.c
>>> > +++ b/drivers/base/core.c
>>> > @@ -5326,6 +5326,20 @@ int device_match_fwnode(struct device *dev, co=
nst void *fwnode)
>>> >  }
>>> >  EXPORT_SYMBOL_GPL(device_match_fwnode);
>>> >
>>> > +int device_match_fwnode_ext(struct device *dev, const void *fwnode)
>>>
>>> No kernel doc to explain what this function does?
>>>
>>> :(
>>>
>>
>> It's not like any of the other variants from this file were documented
>> but ok, I can add it in v2. Still, I'd like to hear if this even makes
>> sense.
>
> I'd argue that the other ones are very obvious, as they just encapsulate =
a
> single operation rather than any logic, whereas this one does have some l=
ogic.
>
> Also, is there a reason why we need both device_match_fwnode() *and*
> device_match_fwnode_ext()?
>

No reason at all other than not wanting to have an impact wider than necess=
ary.
But in most case, this should be transparent for existing users to why not,=
 let
me go through them and see if anything can break.

Bartosz

