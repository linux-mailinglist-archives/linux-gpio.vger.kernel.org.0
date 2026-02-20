Return-Path: <linux-gpio+bounces-31951-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPghKEZAmGneDwMAu9opvQ
	(envelope-from <linux-gpio+bounces-31951-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 12:06:46 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D2E16724F
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 12:06:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 18F35302418F
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 11:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD738340D9A;
	Fri, 20 Feb 2026 11:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L2KE9RGE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05FE2F3C26
	for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 11:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771585600; cv=none; b=uu6QMcHJSi6Byn2NN/bbD37hWEKFsfKCQdJuaRfETBIGb/dmpICG9kKA+S4tAJ7GrN3EE7qgtvM+/KYjV9RvYak7BnIR2NlUE2LxLYG2IpEXYMlpdD4nXSY1mDc8byyBjouergkSQZnZguBinyICnAbmt92RO9h2xSx1ryyQDd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771585600; c=relaxed/simple;
	bh=L9p6cx9g8tZQKB3owuJCJ3T0go1+9/cbdI7g5/dhe6Y=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uDJ6QTSprJ/+DQ3tRtt8GChdMpxLX8CzgxNiCv3Hep9Awpu/BZ5Mk8t+/F3LvYM9hO9OceIN2vCC4ku+8qmqKs4bKep03m6L0R2KnyrdDB17UFM5MmaIbXChYtLp3kYMNOjCbJ/aGzdT5TuIQPCL7B83vZQo5sZLJHrk+gbuMYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L2KE9RGE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EEBFC4AF09
	for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 11:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771585600;
	bh=L9p6cx9g8tZQKB3owuJCJ3T0go1+9/cbdI7g5/dhe6Y=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=L2KE9RGEUgX/u9b+itnyhVk6FAr5AxXIOMs6klvxlnpYGA9Eu38gl9CypsdChNTAL
	 pmso/2QQZuc+AL5x/W37ONcLPT0H2XSXrJjIWQczoDbjroKGxnxx4iGxyov3C1TZBa
	 0LgNImQ/tYHQ0gSx/+vd17EHugBAy+efXPPkfG3j5177aO35L9eMg9/J5NrtO2jtJO
	 QGlPGEQBbUk18KgLWfhonxLb9FmxwRaRWjIWm1rVL5O99/XR2P+mO+lxJ9dT5CYzIB
	 ReKaOcClFn0zMAVXDTl6WHsuBd3avIKTI6PDelCIE2X3n7P1RdkOMQnouEQebaGfzW
	 ao+ecJgz2/cUw==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3870778358aso17701691fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 03:06:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWR8M/VwvzbAN5WIDxx+PM9S8feuiimVSgrGNy1jQRUSxVruyXzJ6p25E0Vdk5dmfKg6NTFNsbThY1o@vger.kernel.org
X-Gm-Message-State: AOJu0YwWSii4EjPAY1NoFNmG1i1i6UxLWBfFckPfBX+qwQcwDJozK4Nt
	BO7fhqZLC8o3huXiamujALlgPD7nDp3pMUHSrcFO28LinqD80M6LqQCWwu7NODwnuFVhatmWddL
	czbKV0HUT79znSa82/BgQVKaDeOW4MQ7zyiM5Itoytg==
X-Received: by 2002:a05:651c:2112:b0:383:2074:ed34 with SMTP id
 38308e7fff4ca-388c8767197mr4802261fa.2.1771585598758; Fri, 20 Feb 2026
 03:06:38 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 Feb 2026 03:06:37 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 Feb 2026 03:06:37 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <aZeu11bBxxgXNMyd@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219-device-match-secondary-fwnode-v1-0-a64e8d4754bc@oss.qualcomm.com>
 <20260219-device-match-secondary-fwnode-v1-1-a64e8d4754bc@oss.qualcomm.com>
 <2026021900-trekker-twenty-9daa@gregkh> <CAMRc=MekX-pXJEs7W9vn8-exAXyfNN3JMwrVNDPXg0b77X1NNw@mail.gmail.com>
 <aZc_P9PcXdlJHqrK@google.com> <CAMRc=MewpkVkrr-srOzx0iudwOJyrzeBErbF_-BR-oTo5_KyEg@mail.gmail.com>
 <aZeu11bBxxgXNMyd@google.com>
Date: Fri, 20 Feb 2026 03:06:37 -0800
X-Gmail-Original-Message-ID: <CAMRc=McCDEXrADWOCGRQgjFER69RGoudDfV9+iFfmEN7dZ+ArA@mail.gmail.com>
X-Gm-Features: AaiRm520y0FmCtWUhrRhnVsI2pEO_ZRUKsj0wE3NLhXMgp5pu9-XubdPzbqnKUc
Message-ID: <CAMRc=McCDEXrADWOCGRQgjFER69RGoudDfV9+iFfmEN7dZ+ArA@mail.gmail.com>
Subject: Re: [PATCH 1/2] driver core: provide device_match_fwnode_ext()
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31951-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid,0.0.0.1:email];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 10D2E16724F
X-Rspamd-Action: no action

On Fri, 20 Feb 2026 01:47:59 +0100, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> On Thu, Feb 19, 2026 at 03:15:53PM -0600, Bartosz Golaszewski wrote:
>> On Thu, 19 Feb 2026 17:54:24 +0100, Dmitry Torokhov
>> <dmitry.torokhov@gmail.com> said:
>> > Hi Bartosz,
>> >
>> > On Thu, Feb 19, 2026 at 05:39:47PM +0100, Bartosz Golaszewski wrote:
>> >> On Thu, Feb 19, 2026 at 5:36=E2=80=AFPM Greg Kroah-Hartman
>> >> <gregkh@linuxfoundation.org> wrote:
>> >> >
>> >> > On Thu, Feb 19, 2026 at 05:31:22PM +0100, Bartosz Golaszewski wrote=
:
>> >> > > Provide an extended variant of device_match_fwnode() that also tr=
ies to
>> >> > > match the device's secondary fwnode.
>> >> > >
>> >> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualc=
omm.com>
>> >> > > ---
>> >> > >  drivers/base/core.c        | 14 ++++++++++++++
>> >> > >  include/linux/device/bus.h |  1 +
>> >> > >  2 files changed, 15 insertions(+)
>> >> > >
>> >> > > diff --git a/drivers/base/core.c b/drivers/base/core.c
>> >> > > index f599a1384eec90c104601422b04dc2b4c19d4382..bbf1337978fafc35e=
b94bda85e0bb7f6879879c0 100644
>> >> > > --- a/drivers/base/core.c
>> >> > > +++ b/drivers/base/core.c
>> >> > > @@ -5326,6 +5326,20 @@ int device_match_fwnode(struct device *dev=
, const void *fwnode)
>> >> > >  }
>> >> > >  EXPORT_SYMBOL_GPL(device_match_fwnode);
>> >> > >
>> >> > > +int device_match_fwnode_ext(struct device *dev, const void *fwno=
de)
>> >> >
>> >> > No kernel doc to explain what this function does?
>> >> >
>> >> > :(
>> >> >
>> >>
>> >> It's not like any of the other variants from this file were documente=
d
>> >> but ok, I can add it in v2. Still, I'd like to hear if this even make=
s
>> >> sense.
>> >
>> > I think it really needs a good explanation given how it goes through
>> > secondaries on one side but not on the other (but maybe it should? Why
>> > one would not want to match secondary?)
>> >
>>
>> I don't think it should. You have one, concrete fwnode and you want to m=
atch
>> it against a struct device: in this variant both its primary and seconda=
ry
>> nodes. I don't think we should do a four-way matching.
>
> I wonder why you consider these 2 distinct fwnodes instead of a single
> object that has multiple components? After all in device we have a
> pointer to fwnode, and not list of fwnodes....
>

Yes, and we've run into problems due to that. I can't find the series in
question but someone had a device which in DT looked like this:

parent {
	compatible =3D "foo,bar";

	child@1 {
		...
	};

	child@1 {
		...
	};
};

And children would inherit the firmware node of the parent but the user wan=
ted
to attach a separate software node to each child and that can't be done rig=
ht
now so ideally we'd move to having a list of firmware nodes in struct devic=
e
and remove the secondary pointer from struct fwnode_handle.

And to that end: I'd like to limit the usage of secondary fwnodes. In this
case we have an fwnode address we get from fwnode_get_reference_args() and
we match it against all fwnodes of a struct device.

Bart

