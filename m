Return-Path: <linux-gpio+bounces-35670-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMg0KTN98GkaUAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35670-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 11:26:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D10D4815CC
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 11:26:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 00B0D3276A5F
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 09:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 436563148D9;
	Tue, 28 Apr 2026 09:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XA4n621B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F912D47E9
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 09:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777367974; cv=none; b=Eoe5Ai9EWCT8YUQR1FOn+C+aisk50l0o8pcRKBKRV/3BMU/dX9FPnInMZJQyscOFCePyPp4BCMnJaiLgSKKfVfqg/tu+1ys5PSKItBZHk/Lu4ctqFxOIWLuwxoFXrOjNk3Qaokf4GI0taiDt5UzoQMj5/Z3071ga9wPnIcSzL+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777367974; c=relaxed/simple;
	bh=ZMSJhyCOtIvkpDAY1UyV0WQQ/akVYaE/bewN9HqkYjI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fW8U2L9HbZhpgfw0ucerW3tyNjz30E1eCf1cRDZVaccXU9rho3fmD+yKTahcdBx57p5eLRNghcKo+Ro4qyMFuecXP814z9vSz/nVf0b/rctSGFg+8L48eiaf4DVylU7VZ25garoN2rKXw62dXbv/UKWv0+I1XocDBt1GlHU1ngo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XA4n621B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B80AEC2BCF5
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 09:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777367973;
	bh=ZMSJhyCOtIvkpDAY1UyV0WQQ/akVYaE/bewN9HqkYjI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XA4n621B4oxs87UXHlV5GM7gBt/2vn5/LdyCWHwfVBQZEGshe8CNZXj318dxb4fCB
	 0xOi9b6b7XQdIQA/4XxbV7XNhFOvqmxglUSjQLsvERJWt1KIGGD9O7sJduiXdQyMND
	 893pVGekl2a2PDWCxWqlQkUmJw1G06qw8Iu2fOmDZ6xwSpKE7Moc4n7691x3LTYgVG
	 R3ddxwnIEIoPpvoyAQTqnxS/cvuW/+plVKWZTrX57sW4HBLb8ZtfpNZcDa8qDQyDff
	 ZVbEOIJiHOrnBDwUM2AnxDV4EW2sE2Xs8GIDZzWL209dypeNWazYlIu+HzTmRcJpml
	 GskwFfsGb6d+g==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38e91b06006so92286751fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 02:19:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9LbLxV3/yiU4VG1AIE8+VXF3XNTPoowwz3Y+eLrclp6EjFwnwFm8APDvYrIRqG6ys4RHnl93cDo7nj@vger.kernel.org
X-Gm-Message-State: AOJu0YwQmHa0C3QtrVehv9HTaOpuH/Wfwbwk5eRQBgh3IeYx0zkry713
	KLbj5x6luxJGY8ZlHEdAIWl8/jEz2z4ItjzICVvB+h0ERBc3FOrje4p357zsIC9FSC8GyV6U5TY
	zbvV8B/iL4pmN40XfkqICOW3DnCFMqUbttrsrYcioJw==
X-Received: by 2002:a05:651c:513:b0:38e:58c7:cd0 with SMTP id
 38308e7fff4ca-39240ccfba3mr7100321fa.10.1777367972313; Tue, 28 Apr 2026
 02:19:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-baytrail-real-swnode-v3-0-0003e4c1708c@oss.qualcomm.com>
 <20260427-baytrail-real-swnode-v3-2-0003e4c1708c@oss.qualcomm.com> <f100e787-f45a-4d72-9664-a75b1181763e@kernel.org>
In-Reply-To: <f100e787-f45a-4d72-9664-a75b1181763e@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 28 Apr 2026 11:19:20 +0200
X-Gmail-Original-Message-ID: <CAMRc=MfVMLz3jZvxdgaD8ZUdcX6pgYO=WGCfH-dDmpU_WsfDLA@mail.gmail.com>
X-Gm-Features: AVHnY4L6HCdejwKae1mL2EFJhpoS5hPoP_ZtDkqrEE7U7UUevyusXQnkvGNf5lM
Message-ID: <CAMRc=MfVMLz3jZvxdgaD8ZUdcX6pgYO=WGCfH-dDmpU_WsfDLA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] platform/x86: x86-android-tablets: enable fwnode
 matching of GPIO chips
To: Hans de Goede <hansg@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 0D10D4815CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35670-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.intel.com,gmail.com,linuxfoundation.org,kernel.org,vger.kernel.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]

On Tue, Apr 28, 2026 at 11:16=E2=80=AFAM Hans de Goede <hansg@kernel.org> w=
rote:
>
> Hi Bartosz,
>
> On 27-Apr-26 14:19, Bartosz Golaszewski wrote:
> > In order to allow GPIOLIB to match cherryview and baytrail GPIO
> > controllers by their firmware nodes instead of their names, we need to
> > attach the - currently "dangling" - existing software nodes to their
> > target devices dynamically.
> >
> > We deal with devices described in ACPI so set up a bus notifier waiting
> > for the ADD events. We know the name of the device we're waiting for so
> > match against it and - on match - assign the appropriate software node
> > as the secondary firmware node of the underlying ACPI node. In case the
> > event was emitted earlier than this driver's probe: also make sure the
> > device was not added before.
> >
> > Scheduling fine-grained devres actions allows for proper teardown and
> > unsetting of the secondary firmware nodes.
>
> Thank you for your work on this.
>
> The x86-android-tablets.ko kernel module uses platform_create_bundle()
> so its probe() cannot return -EPROBE_DEFER. IOW it expects all the GPIO
> pins which it needs to already be there when it loads (which so far in
> practice holds, since these x86 GPIO controllers are always builtin
> for various reasons).
>
> This means that there is no need all the notifier stuff. Only adding
> an acpi_bus_find_device_by_name() helper as suggested by Rafael and
> then finding the GPIO controllers and attaching the swnodes is
> necessary.
>
> And if the acpi_bus_find_device_by_name() fails it is ok to fail
> the probe() just like it currently fails when gpiod_get() returns
> -EPROBE_DEFER (or fails for other reasons).
>
> This should nicely simplify this patch.
>

Thanks Hans, I was not aware of this. Given that this is the only
driver needing this quirk, it will indeed make things much simpler.
I'll have a v4 by the end of this week.

Bart

