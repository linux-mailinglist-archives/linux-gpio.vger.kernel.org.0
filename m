Return-Path: <linux-gpio+bounces-31957-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPIjCrBOmGmbFwMAu9opvQ
	(envelope-from <linux-gpio+bounces-31957-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 13:08:16 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C881676E4
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 13:08:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15C9B304E83F
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 12:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BB7332FA10;
	Fri, 20 Feb 2026 12:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s8s/A32/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F96D3191CE
	for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 12:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771589293; cv=none; b=EQs+Q9VWv7UruwLbfnPrU3hR3uM+8nDd9ZbezeIecT9uDEPyeyB39BaqiRDAe3u8meugxTl8XV33Fy+38A/457pB7G4d04kjqna4CN1uCsG3Atx6+IqTtYMv2YxG7Otw1/TYL4Vsda546vRuIhSAU6e33vNTHAJ11uTwJqAHEvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771589293; c=relaxed/simple;
	bh=c9oZ5zoDWNcytFgezfRN71k5wvQNOK61n46yG0MPUoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YCiCMDQ9P0gL9ABKJlUhdUyM4gPOBXy+9UB+9yeZpIIF9AUdvitzbR83yEv4t0HUFwyuQyk94OsSH79aZtLmzplAetKmEuJm0NVUJ4t3fqFkR415mnu37bQevsnc9QJLuTRP4IrwKjBN5Zu42QEp1FiJ4g+Pv8zccgbNKE3JbRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s8s/A32/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32E93C2BCB0
	for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 12:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771589293;
	bh=c9oZ5zoDWNcytFgezfRN71k5wvQNOK61n46yG0MPUoM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=s8s/A32/ZDoHuZ5gNGYcXVGkQmaBeEYTx8NObC6/f/TJURPe5dJ6+99LAWGml1QZB
	 wZxoHbEgEELCnImBADU6tEHOdwD771AziG9fneI6TCV5nnbTU4talnCgQ3OoGRxeHO
	 OD0WxQpZpqC7AVGG2QOvAbJyXqSUSwh76TQ8nbXT0Lu40euMwMnULv/4uTXmOSJWL8
	 /nSYm5LkMwZNFSliPaC4xicRUiUel5sQ7OtvQDxv730NYHQ32M+bEZFv2T8HvtnlOi
	 9Q0ivUCaihZCtSTG0pe1ioewBiuUR0OmDc+ExqJLFbvydlFCxW1/GSnu/UVuQ1XLTk
	 wjT55KC590euw==
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7d4cb7e10efso1714317a34.0
        for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 04:08:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXINDFHz+kB8ebhtQdYyn9u8PLJuYUlnhvd30jxYTdlttR21aXg++GhOZ7eeZlEKgWXBpkqGh8CNzZS@vger.kernel.org
X-Gm-Message-State: AOJu0YyxKENxOJZhha+Y6H+uawiAlo+lhdZhvFW/i2Enqnm1zeKxArNB
	2IFZX6JX88P6Eebg7IMWtzqnJN48HZv/uyCxs8OuVGZ9vlxA6lbo3QcnUF2TOwsbDUIsjRYznEv
	Y6q0AqtrhAs1F0CMSjWolUFa6EIQU4EQ=
X-Received: by 2002:a05:6830:6686:b0:7c7:655c:7353 with SMTP id
 46e09a7af769-7d4d0adabe0mr14320252a34.12.1771589292150; Fri, 20 Feb 2026
 04:08:12 -0800 (PST)
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
In-Reply-To: <CAMRc=McUnsnVOVvxDwTKmchrvyh-_HCwEyJLnseE29d00Eicbw@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 20 Feb 2026 13:08:01 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0gM08=Zq-VMHX-RT78L=HDacbayM7=SoQ2di-Hsc2SB0w@mail.gmail.com>
X-Gm-Features: AaiRm51c-iLmB2rMSO5ksBHx2oFIQ0tQjadLI8r7Ve7cI-qSopYC9cSvWOGIuCY
Message-ID: <CAJZ5v0gM08=Zq-VMHX-RT78L=HDacbayM7=SoQ2di-Hsc2SB0w@mail.gmail.com>
Subject: Re: [PATCH 1/2] driver core: provide device_match_fwnode_ext()
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>, 
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.intel.com,linuxfoundation.org,kernel.org,gmail.com,lists.linux.dev,vger.kernel.org,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-31957-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 88C881676E4
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 12:25=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
>
> On Fri, 20 Feb 2026 08:36:58 +0100, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> said:
> > On Thu, Feb 19, 2026 at 04:21:59PM -0500, Bartosz Golaszewski wrote:
> >> On Thu, 19 Feb 2026 20:58:32 +0100, Andy Shevchenko
> >> <andriy.shevchenko@linux.intel.com> said:
> >> > On Thu, Feb 19, 2026 at 05:31:22PM +0100, Bartosz Golaszewski wrote:
> >> >> Provide an extended variant of device_match_fwnode() that also trie=
s to
> >> >> match the device's secondary fwnode.
> >
> > ...
> >
> >> >> +int device_match_fwnode_ext(struct device *dev, const void *fwnode=
)
> >> >> +{
> >> >> + struct fwnode_handle *dev_node =3D dev_fwnode(dev);
> >> >
> >> >> + if (!fwnode)
> >> >
> >> > IS_ERR_OR_NULL()
> >> > If supplied @fwnode is secondary, it might be an error pointer.
> >>
> >> I mirrored existing device_match_fwnode(), should it be fixed too?
> >
> > The answer is "I don't know". Strictly speaking this should be done eve=
rywhere
> > in the generic code when we can't guarantee that fwnode that comes to t=
he
> > function is pure NULL or valid one.
> >
> >> >> +         return 0;
> >> >
> >> >> + if (dev_node =3D=3D fwnode)
> >> >> +         return 1;
> >> >> +
> >> >> + return fwnode_is_primary(dev_node) && dev_node->secondary =3D=3D =
fwnode;
> >> >> +}
> >> >
> >> > I think we can refactor this.
> >> >
> >> >    struct fwnode_handle *node;
> >> >
> >> > // I would name it like this, because in 3 cases in drivers/base/pro=
perty.c
> >> > // 2 with node and 1 with dev_node when the same API is called.
> >>
> >> Haystack's node is "node" and the needle is "fwnode"? Seems confusing =
to me.
> >
> > But we need some consistency. drivers/base/property.c is inconsistent t=
o begin
> > with and here the code chose the least used one for unknown reasons to =
me.
> >
> > I'm fine with "node" that is inside the function.
> >
> >> >    if (IS_ERR(fwnode))
> >> >            return 0;
> >> >
> >> >    if (device_match_fwnode(dev, fwnode)) // NULL check is inside
> >> >            return 1;
> >>
> >> Yeah, and it too can be supplied a secondary fwnode. Let's say we reso=
lve
> >> a reference to a secondary software node and try to lookup a GPIO thro=
ugh it,
> >> we'll end up with an IS_ERR() fwnode with existing code, right?
> >
> > I'm not sure I understood the use case you are trying to describe here.
> >
> > The very first check guarantees that fwnode is either NULL or valid one=
.
> > When it's a valid one, the comparison with error pointer will be false.
> > What did I miss?
> >
>
> I mean: device_match_fwnode() has a NULL check but not an IS_ERR() check =
and
> can be passed a secondary fwnode as argument and that can be -ENODEV. It =
will
> probably not fail terribly but is still incorrect.
>
> I was speaking about the existing implementation, not addressing your com=
ments.
>
> >> >    node =3D dev_fwnode(dev);
> >> >
> >> >    return fwnode_is_primary(node) && node->secondary =3D=3D fwnode; =
// NULL check is inside
> >> >
> >> >
> >> >> + if (!fwnode)
> >> >> +         return 0;
> >> >
> >> >> + if (dev_node =3D=3D fwnode)
> >> >> +         return 1;
> >> >> +
> >> >> + return fwnode_is_primary(dev_node) && dev_node->secondary =3D=3D =
fwnode;
> >> >> +}
> >
> > ...
> >
> >> >> +int device_match_fwnode_ext(struct device *dev, const void *fwnode=
);
> >> >
> >> > Perhaps ext --> or_secondary ?
> >>
> >> I thought about it but it would make it sound like it only matches the
> >> secondary to me. Maybe device_match_all_fwnodes()? Would be future-pro=
of if
> >> we end up doing the linked list approach.
> >
> > Danilo proposed _full, but in my opinion it's not better than _ext unle=
ss you
> > know very deep how fwnode structure is designed. Same with _all. It's c=
onfusing.
> >
> > fwnode_or_secondary (the key part is "or") sounds more precise. But if =
you come
> > up with something else that makes less ambiguity I will be glad.
> >
>
> device_match_fwnode_or_secondary() sounds good to me but shouldn't we try=
 to
> limit the propagation of the "secondary" token in namespaces if our goal =
is to
> get rid of the whole "secondary fwnode" concept?

I'm a bit late to this, but here's some background.

Secondary fwnodes were not intended for device matching in the first
place.  The idea was to use them as a secondary supply of device
properties that may be missing from the primary node (think of an ACPI
device object accompanied by a software node supplying properties that
cannot be derived from the former).  They could be added by a driver
after matching the primary node for the benefit of a generic
framework.

IMV, the example with children inheriting the fwnode from their parent
where the user wants to add a different secondary node to each child
doesn't really match the picture described above.  At least it was not
anticipated.  The idea was to allow the parent's fwnode to be extended
and then (possibly) inherited.

That's why the secondary fwnode pointer is there under the primary one.

So all of this goes beyond the original anticipated use of secondary
fwnodes and it seems to be calling for a list of equivalent (not
primary and secondary) fwnodes in struct device, but then of course
there's the question about duplicate properties and whether or not the
fwnode used for driver binding should be preferred (I don't see why
not).

Until all of this is resolved, I wouldn't even add a generic helper
for matching secondary nodes.  I'd just put this code directly into
gpio_chip_match_by_fwnode() along with a big fat comment explaining
why exactly secondary nodes need to be taken into account there.

