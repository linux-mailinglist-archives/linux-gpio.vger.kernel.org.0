Return-Path: <linux-gpio+bounces-31878-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAJHD39Al2lXwAIAu9opvQ
	(envelope-from <linux-gpio+bounces-31878-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 17:55:27 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D800160D76
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 17:55:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D423301CFBA
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 16:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A68934D3B6;
	Thu, 19 Feb 2026 16:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j/rZWvyM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC7D34CFAE;
	Thu, 19 Feb 2026 16:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771520124; cv=none; b=CrKsc3DKqsxL2WxpCfwJ62JIYLzGyn0zjQoJ1tBUNZMtkwAwjbKYcJIx6G6q+qgaggts1bqxIRmCFw11suz9Ml0AAjGfFof4Ud7Le1Sz0XLpzCgomv/cVcVSuUaJ8gXZMeiIgasSjzuL7WItpLSjaLdtAjcISUwT/VPO4hxVL+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771520124; c=relaxed/simple;
	bh=nCtqophTjfa1hWtJ1k7uYtsKUjYcajQO7cBV7Vqp3rE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=pHHHiasL4GkHuPHwsduEYVgcqgBYqRkG27M9T3BmFSJwywOFF+/IXc0CtgWqNe36FV+rF9M+iXVWU6fmEOpF9JJABnXG7hUgA6ZCkJTQtsP1d5x8hzr20Xw+s+I+QvO8ValEc31Q9dk5f4B9GnwOf6WqOMvkJE0s7MULnAjFUms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j/rZWvyM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2941C4CEF7;
	Thu, 19 Feb 2026 16:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771520123;
	bh=nCtqophTjfa1hWtJ1k7uYtsKUjYcajQO7cBV7Vqp3rE=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=j/rZWvyM7Bp2ZrOJaimvqZP8UjXnPWRPrp8ZfbOoo46IMBkXQZo0XIt+VjNB8O496
	 JNS3860YyCzQ9Ps8XrP/zOMfjfdIblY187bSlmMgzucXpS9rVh5yPxoJcTgnzHcX0q
	 HIoHpzSJVEHo6icmPl1lF28Q6hvZFyKG6gsQ7yu+c/FfcTzsim+KjYZsaTeQEh/vCg
	 fuS4NnK/42WJK+hzsZNZhM67oxyXhmrf4DTXLaV/d1p3Cgnr4hFtI3tNfiAj1kdbKM
	 Jsl0PH2/KIgosnba+cx+YN8YNusiw47CHKByxFWOAT6cltvz/gzJpVLqVkEFiYV0q4
	 GRexFAMdGS1UA==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 17:55:20 +0100
Message-Id: <DGJ3H078RVW8.28AJL6FR3OKOO@kernel.org>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Bartosz Golaszewski"
 <bartosz.golaszewski@oss.qualcomm.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Linus Walleij" <linusw@kernel.org>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, "Andy Shevchenko"
 <andriy.shevchenko@linux.intel.com>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
To: "Bartosz Golaszewski" <brgl@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 1/2] driver core: provide device_match_fwnode_ext()
References: <20260219-device-match-secondary-fwnode-v1-0-a64e8d4754bc@oss.qualcomm.com> <20260219-device-match-secondary-fwnode-v1-1-a64e8d4754bc@oss.qualcomm.com> <2026021900-trekker-twenty-9daa@gregkh> <CAMRc=MekX-pXJEs7W9vn8-exAXyfNN3JMwrVNDPXg0b77X1NNw@mail.gmail.com>
In-Reply-To: <CAMRc=MekX-pXJEs7W9vn8-exAXyfNN3JMwrVNDPXg0b77X1NNw@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31878-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,oss.qualcomm.com,kernel.org,gmail.com,linux.intel.com,lists.linux.dev,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,linuxfoundation.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8D800160D76
X-Rspamd-Action: no action

On Thu Feb 19, 2026 at 5:39 PM CET, Bartosz Golaszewski wrote:
> On Thu, Feb 19, 2026 at 5:36=E2=80=AFPM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
>>
>> On Thu, Feb 19, 2026 at 05:31:22PM +0100, Bartosz Golaszewski wrote:
>> > Provide an extended variant of device_match_fwnode() that also tries t=
o
>> > match the device's secondary fwnode.
>> >
>> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.c=
om>
>> > ---
>> >  drivers/base/core.c        | 14 ++++++++++++++
>> >  include/linux/device/bus.h |  1 +
>> >  2 files changed, 15 insertions(+)
>> >
>> > diff --git a/drivers/base/core.c b/drivers/base/core.c
>> > index f599a1384eec90c104601422b04dc2b4c19d4382..bbf1337978fafc35eb94bd=
a85e0bb7f6879879c0 100644
>> > --- a/drivers/base/core.c
>> > +++ b/drivers/base/core.c
>> > @@ -5326,6 +5326,20 @@ int device_match_fwnode(struct device *dev, con=
st void *fwnode)
>> >  }
>> >  EXPORT_SYMBOL_GPL(device_match_fwnode);
>> >
>> > +int device_match_fwnode_ext(struct device *dev, const void *fwnode)
>>
>> No kernel doc to explain what this function does?
>>
>> :(
>>
>
> It's not like any of the other variants from this file were documented
> but ok, I can add it in v2. Still, I'd like to hear if this even makes
> sense.

I'd argue that the other ones are very obvious, as they just encapsulate a
single operation rather than any logic, whereas this one does have some log=
ic.

Also, is there a reason why we need both device_match_fwnode() *and*
device_match_fwnode_ext()?

