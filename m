Return-Path: <linux-gpio+bounces-31972-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOWMCguGmGnKJQMAu9opvQ
	(envelope-from <linux-gpio+bounces-31972-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 17:04:27 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7234A1692A0
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 17:04:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8861305D1E4
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 16:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B57702D8795;
	Fri, 20 Feb 2026 16:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JTwvk4VU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6532DB788
	for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 16:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771603447; cv=none; b=XbLXjSdSUbYYM6UFu/bnRcye6nLRTtFy54hjQ8BeFj7TvfXi1b5XLkaMYeCk09Jqr9gkP5gKwctrKFBUB2ktYPyILNjTUt7jkVExtid8pdAL8L7t8W+lCn3oal+0DbELm/hYCFUrTS4IZpnX+alHgBGXj6ixgLXR0x4A1NoU2Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771603447; c=relaxed/simple;
	bh=4F02YnvtICrMrwFDclWviGSXMGPnMCceTk3TFpKvGAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VpQ/+LaVO8Vpm0Cm5mlMRdOAQuh/6MYxWQA8XRFKvhUWJmXWKDRsx6QHanA+OiucY3VoC/sIrUEd6akmaqNqgKVg5uKdl7oPrOpRjbaZAJsi+R5IqiQMmyd6dR5Gf6J5spyTH28e+rESMfSj8UP9CnJusCQCec12e/5y/xhfTgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JTwvk4VU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E3C7C2BC86
	for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 16:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771603447;
	bh=4F02YnvtICrMrwFDclWviGSXMGPnMCceTk3TFpKvGAs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JTwvk4VU7Q6h3bnnhBBjV6PUSlOboUdatz1d27PJMWLB1jYRR24Qtg0Y8fuBU/9TX
	 A4yAXF9XRR8pzJJ/lnTQO479Y0F06TIzhWxQZlS+wKd5kc+oY+d0JrjMG49maLiRjp
	 ga05zu0UFaXjnbhA5Fkvk5lICXiutxzKe5ddBeaVzwZe2bGgnPc9odhh+YHhErJdF8
	 1EbBSaNzRcmNI+4qqNFCXOpHzEhf0NGmkp/GSHh38Dw3oQlV7pxCxv8MTldElAD026
	 djBz38kgb7f5+197PXrMjbjWao2Feh9GFDiT6yKwntSA8RrjhjI0EcLGBRFHdJK6+J
	 6rRzl8nGDCTeA==
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6769719821dso848841eaf.2
        for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 08:04:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUlrQ1RQrwNd3KjOsO0liuAf9Rn9ZBWOCaed4XzzmP5qqpZRh/A5jD/pIV7Wy/5nq4CtMSkKLD5+EIW@vger.kernel.org
X-Gm-Message-State: AOJu0YwjMMqp2chuql8xqytQTJjKVP26tUDgf6Ffd+TxMh58W4+CboI8
	4K5gbyBqP70jf7G/PzZT/Qw7DuvY2TW8C5IrOUE63GBP+ZF78gpeiTiCx+SK4JsIa/T/om29HMt
	eU2NY3wmyGq3sP1/Oxkv0ApD24EEUap4=
X-Received: by 2002:a4a:e909:0:b0:679:a5d2:569b with SMTP id
 006d021491bc7-679c44d0ba8mr164086eaf.40.1771603446019; Fri, 20 Feb 2026
 08:04:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219-device-match-secondary-fwnode-v1-0-a64e8d4754bc@oss.qualcomm.com>
 <20260219-device-match-secondary-fwnode-v1-1-a64e8d4754bc@oss.qualcomm.com>
 <aZdraIXlkAHwP-Pm@smile.fi.intel.com> <CAMRc=MdYcbO74sbjvKeg5k_E7EHfovFHHasDx2erWfcO39zBNA@mail.gmail.com>
 <aZgPGndb-6FTlnyR@smile.fi.intel.com> <CAMRc=McUnsnVOVvxDwTKmchrvyh-_HCwEyJLnseE29d00Eicbw@mail.gmail.com>
 <CAJZ5v0gM08=Zq-VMHX-RT78L=HDacbayM7=SoQ2di-Hsc2SB0w@mail.gmail.com> <DGJWKFUBSS0W.2AECDX36IMNAO@kernel.org>
In-Reply-To: <DGJWKFUBSS0W.2AECDX36IMNAO@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 20 Feb 2026 17:03:54 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jUCtKTW-g-C0pKu0DQqOkyfSz=upXwbtYeV_=rMBUMyg@mail.gmail.com>
X-Gm-Features: AaiRm53KyGi-QrsT3TXyWkcQFM0vMLFi4vSViUqESeh-fqTUfs0OjB0bf2HJ-Qo
Message-ID: <CAJZ5v0jUCtKTW-g-C0pKu0DQqOkyfSz=upXwbtYeV_=rMBUMyg@mail.gmail.com>
Subject: Re: [PATCH 1/2] driver core: provide device_match_fwnode_ext()
To: Danilo Krummrich <dakr@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linusw@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,gmail.com,lists.linux.dev,vger.kernel.org,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-31972-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 7234A1692A0
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 4:43=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Fri Feb 20, 2026 at 1:08 PM CET, Rafael J. Wysocki wrote:
> > Secondary fwnodes were not intended for device matching in the first
> > place.  The idea was to use them as a secondary supply of device
> > properties that may be missing from the primary node (think of an ACPI
> > device object accompanied by a software node supplying properties that
> > cannot be derived from the former).  They could be added by a driver
> > after matching the primary node for the benefit of a generic
> > framework.
> >
> > IMV, the example with children inheriting the fwnode from their parent
> > where the user wants to add a different secondary node to each child
> > doesn't really match the picture described above.  At least it was not
> > anticipated.  The idea was to allow the parent's fwnode to be extended
> > and then (possibly) inherited.
> >
> > That's why the secondary fwnode pointer is there under the primary one.
> >
> > So all of this goes beyond the original anticipated use of secondary
> > fwnodes and it seems to be calling for a list of equivalent (not
> > primary and secondary) fwnodes in struct device, but then of course
> > there's the question about duplicate properties and whether or not the
> > fwnode used for driver binding should be preferred (I don't see why
> > not).
> >
> > Until all of this is resolved, I wouldn't even add a generic helper
> > for matching secondary nodes.  I'd just put this code directly into
> > gpio_chip_match_by_fwnode() along with a big fat comment explaining
> > why exactly secondary nodes need to be taken into account there.
>
> I'm aware that secondary software nodes were originally intended to suppl=
y
> missing properties only.
>
> However, I wonder whether the capability to match against them isn't actu=
ally a
> natural, unavoidable consequence of how software nodes can be used to bri=
dge
> (broken) connections between providers and consumers.
>
> Or said differently, once PROPERTY_ENTRY_GPIO() - or more generically
> PROPERTY_ENTRY_REF() - was introduced, it exposed secondary nodes within =
the
> device graph, which subsystems have to consider.
>
> IIUC, this is also the reason why gpiod_fwnode_lookup() [1] (which is eve=
ntually
> called from gpiod_get()) has to consider secondary nodes.

Well, in practice, is there any subsystem other than gpio that has to
consider them?

> So, if I'm not mistaken with the above, it seems fair to provide such a h=
elper.

In the absence of any, the helper doesn't seem necessary.

> [1] https://elixir.bootlin.com/linux/v6.19-rc5/source/drivers/gpio/gpioli=
b.c#L4675

