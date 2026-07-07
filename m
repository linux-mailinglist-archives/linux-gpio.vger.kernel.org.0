Return-Path: <linux-gpio+bounces-39559-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dU5KD2CuTGoqoAEAu9opvQ
	(envelope-from <linux-gpio+bounces-39559-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 09:44:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 300247189BD
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 09:44:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=KVG+WXqv;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39559-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39559-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 529513022EB3
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 07:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2F663F166E;
	Tue,  7 Jul 2026 07:25:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36D33CC330
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 07:25:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783409150; cv=none; b=tMnSzTzu4i0hbL41t7TK6ojxnKgNerrFV1LW12V06VsrGJB3YcFl3OKOUwJGJQ34OTHhzmfA19v64aQuEk7LygbR3ESk8OrM8inVN5rK/hUsxRmNUOmmDv65st5F52UOL4ZrNc3o44h6N8XUitvUmRMm1KW7GmG7++Yqu636wVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783409150; c=relaxed/simple;
	bh=ueAyYCOfMV4Ufdfx9AVyTK2lGxrTrZnsndPc9ULF9iA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XqGuLN0bFJIHZPRpeT2vPaW13UJQkyoqs2QYU2gw+9jFye6A2BbaEMdlygqRUcaBderhsyvly54ogT7FCe4aUM8CCmBEtjmVnT7XSvbal9qT4+7EfS897m0sTstnhwKa4ULuJY1Y7OboNz48Zvf1tB3+pW2sJwfUV3oFPDLm3f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KVG+WXqv; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E17E1F00ADE
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 07:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783409143;
	bh=AnulwQxL/OQLIVkhwLjzK1QzJkTrEXXoW+88TePiaq0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=KVG+WXqvcbO7hG7Q1AstC/2M56pHAnPnTD7Ve5taqbqOI+cKMaAn5axppsoKSdqUx
	 9n4w2P48rGxOPsB2HdaB3m0QQzE9QLb9Jgo7e9dQW+QB3cR4baddKyJQj45elGnP+P
	 TRqdzFO50HALyt+CFYZ/C6K3X3GIc5hVs/pOTgXawH4a0uCVlSy0fVUNiPfbEpxPUy
	 2U5G7kZXZ+anDdGlaXc0gYoWfSLkxeyCOIYlAH/U5Lh3i44JllUrRXsSzesGZziKGf
	 DqZ8nvRykwAtIXYq5l3lLAr2kTg25mubLLVQhT9IcS/MXenCdAruVTiyJ2xrkDOTl4
	 QUB/MHwpn6rKg==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39b22d0e488so40301101fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2026 00:25:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro9BqVu5G42xt5pTc6KPFcnrl9Ks4+Cyv8B+d2UnefXMKccDhs2OLvjyGXsuDTDGj34c2InN+/YlwWT@vger.kernel.org
X-Gm-Message-State: AOJu0Yx88jQpSshYSAwxYHzvkzEaQl+E4xdSnRR1Emh12EzahT7D1c0b
	63FvXtl3tgXxn/I34tjoo6v2eMh0JMZQ6MMb4Bx6Mgl1WcwCB/LTh0TS4v6xZgHxLV60FoVLrVI
	Ys+rMFFSAzZVvmqLomn+G1J+mpHWHR/kfg3nuqYsCrg==
X-Received: by 2002:a2e:be06:0:b0:39c:650d:2f63 with SMTP id
 38308e7fff4ca-39c650d3187mr5799031fa.1.1783409142106; Tue, 07 Jul 2026
 00:25:42 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Jul 2026 00:25:39 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Jul 2026 00:25:39 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <akwLg6XiA6eJblH2@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629-swnode-fw-devlink-v1-0-b90058b41839@oss.qualcomm.com>
 <20260629-swnode-fw-devlink-v1-5-b90058b41839@oss.qualcomm.com>
 <akKWGNpGmHjWYdfX@ashevche-desk.local> <CAMRc=Md1K_ZfO7pUANNhCkwEpmF6nX-Wo=AeuiO57hjKLtWDWg@mail.gmail.com>
 <akwLg6XiA6eJblH2@ashevche-desk.local>
Date: Tue, 7 Jul 2026 00:25:39 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfQV8nsqjH1xkZ-rriNMdpdvXjGghkfBrkfxUdu7QCF2w@mail.gmail.com>
X-Gm-Features: AVVi8Cd4zSiR6iCjegfG7uEMuMQeaCzvQIzA0WpvDnFiM-et0cbjWnQALsxKsUg
Message-ID: <CAMRc=MfQV8nsqjH1xkZ-rriNMdpdvXjGghkfBrkfxUdu7QCF2w@mail.gmail.com>
Subject: Re: [PATCH 5/5] gpio: kunit: add test cases verifying swnode devlink support
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39559-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:brendan.higgins@linux.dev,m:david@davidgow.net,m:raemoar63@gmail.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:kunit-dev@googlegroups.com,m:linux-acpi@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:brgl@kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.dev,davidgow.net,gmail.com,linux.intel.com,linuxfoundation.org,kernel.org,vger.kernel.org,googlegroups.com,lists.linux.dev,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,intel.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 300247189BD

On Mon, 6 Jul 2026 22:09:39 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> On Mon, Jul 06, 2026 at 08:32:28AM -0400, Bartosz Golaszewski wrote:
>> On Mon, 29 Jun 2026 17:58:16 +0200, Andy Shevchenko
>> <andriy.shevchenko@linux.intel.com> said:
>> > On Mon, Jun 29, 2026 at 12:52:10PM +0200, Bartosz Golaszewski wrote:
>
> ...
>
>> >> +static int gpio_probe_defer_consumer_probe(struct platform_device *pdev)
>> >> +{
>> >> +	struct device *dev = &pdev->dev;
>> >> +	struct gpio_probe_defer_pdata *pdata = dev_get_platdata(dev);
>> >> +	struct gpio_desc *desc;
>> >
>> >> +	pdata->probe_count++;
>> >
>> > Even in case of error?
>>
>> We're counting how many times we *enter* probe, so yes, I think it's right.
>
> Perhaps a (short) comment on top of this line?
>
> 	/* Count probes independently on being successful or unsuccessful */
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
>

I mean: sure, I can, but it already says probe_count, not probe_ok_count. IMO
it's overkill but I don't want to bikeshed over a comment.

Bart

