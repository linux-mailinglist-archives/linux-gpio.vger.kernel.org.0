Return-Path: <linux-gpio+bounces-31966-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDEcJw12mGnhIwMAu9opvQ
	(envelope-from <linux-gpio+bounces-31966-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 15:56:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 130221688F4
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 15:56:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C9D913015A7A
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 14:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3156288515;
	Fri, 20 Feb 2026 14:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SO5xDJkT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9592529ACC5
	for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 14:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771599370; cv=none; b=pFInF0hKF8KueXHWqAuIAOOtm1ZflYqQMzwvy7YLbxCO79vKDN4ngXTAmuGSFW8NCYN6SVcYr5Czqu9/LozcMZ1jpqEr7QXska7KtxEFO7z9HS9SKn50d5rk5wsd+ugvNmsNLqPEG3kl+ShXkpZzRIMh/3l8Tt9ahAbsmd0iis0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771599370; c=relaxed/simple;
	bh=3e17pHKOIv6QB1I/FzTHBEhyYwYjky2fzA0ro/6NesA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ti87MqnwnncvQoUNMF3HaOZN7pdOOGbdmrLjHuPXG0NK84kaNY8qQ+oq4Dn71Wi7C0VvG6iEFPQIJGwe1vZtxr0bk1DBqQmOKE92mg+4+bIdD6zkCHdc+yTEewNFHqEdggwnhrIMdpfKCeEP0vD2q2BMKReQ7V/4lt3SlhuVML0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SO5xDJkT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52838C116D0
	for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 14:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771599370;
	bh=3e17pHKOIv6QB1I/FzTHBEhyYwYjky2fzA0ro/6NesA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SO5xDJkTPrwTeClllwR3U71TIWjg+DoVLhAlkA/qkwXdTzBYcfBHJFvlsSvYwp1pa
	 KJtYoj3WmGJS5/5Vlcy84c4dBI6C6Hy/lIbSPndW6FmnO+JyRkg92IEpsuEA/44mC8
	 TH5awDm1gPRVsQ0L+r47jccXF0ylGSNsH8SYFAZxcQyDf5sVUQZyinfO8F9iELB9D0
	 in4mln7mt4Og1LKDvQRBfP80Uvc0wnOAMhoNnRys659JNoLFHpVh+UqxiafJLpsdmN
	 b2FQb/l44BDWvL4iUdlVBtwhvUbZDt3unUz/MRKsmiZxzLhlP4BLIDS46vfDpFuIOh
	 +dDuqkjECAyqg==
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-45f18e8f2f5so1350892b6e.3
        for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 06:56:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVpCrilFJ+QB5F/zId478Ve2Qfzhh+rYX4F/JbRQyQamaF678Uh3L++6EZTIugn4r9ucln6Iw4boZoc@vger.kernel.org
X-Gm-Message-State: AOJu0YztjxUTLu3mfUoJFqGSHJECFFg9askBkwYKSqeEZgAOU9OeijKz
	ya+j4V7xi+bfAU5gJGQ+yNrdLgfCX+5QEE/otTLQHScXVrSkeLOarnOzRRxNvpej8r53nn2m/5k
	xGKo+v7SAXiqbPDR9nNT2ZhA/yrinxyE=
X-Received: by 2002:a05:6808:308d:b0:44f:78fb:7b11 with SMTP id
 5614622812f47-46446305360mr83992b6e.39.1771599369349; Fri, 20 Feb 2026
 06:56:09 -0800 (PST)
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
 <CAJZ5v0gM08=Zq-VMHX-RT78L=HDacbayM7=SoQ2di-Hsc2SB0w@mail.gmail.com> <CAMRc=MeP7_pWef0hrY1+hmjxzQCpMhCZFni1zZcpocPUtyonog@mail.gmail.com>
In-Reply-To: <CAMRc=MeP7_pWef0hrY1+hmjxzQCpMhCZFni1zZcpocPUtyonog@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 20 Feb 2026 15:55:57 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0geSuQA5DRy_NZysbtPR-khC2h51ha7GP5j6HBqYLrPfA@mail.gmail.com>
X-Gm-Features: AaiRm53DkrfVNTKaiJfo_6PN4Jzve2gQb3cqRtBwONEr9LIMTbIvWvmjrx54vhY
Message-ID: <CAJZ5v0geSuQA5DRy_NZysbtPR-khC2h51ha7GP5j6HBqYLrPfA@mail.gmail.com>
Subject: Re: [PATCH 1/2] driver core: provide device_match_fwnode_ext()
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,gmail.com,lists.linux.dev,vger.kernel.org,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-31966-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,intel.com:email]
X-Rspamd-Queue-Id: 130221688F4
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 3:35=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Fri, Feb 20, 2026 at 1:08=E2=80=AFPM Rafael J. Wysocki <rafael@kernel.=
org> wrote:
> >
> > On Fri, Feb 20, 2026 at 12:25=E2=80=AFPM Bartosz Golaszewski <brgl@kern=
el.org> wrote:
> > >
> > > On Fri, 20 Feb 2026 08:36:58 +0100, Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> said:
> > > > On Thu, Feb 19, 2026 at 04:21:59PM -0500, Bartosz Golaszewski wrote=
:
> > > >> On Thu, 19 Feb 2026 20:58:32 +0100, Andy Shevchenko
> > > >> <andriy.shevchenko@linux.intel.com> said:
> > > >> > On Thu, Feb 19, 2026 at 05:31:22PM +0100, Bartosz Golaszewski wr=
ote:
> > > >> >> Provide an extended variant of device_match_fwnode() that also =
tries to
> > > >> >> match the device's secondary fwnode.
> > > >
> > > > ...
> > > >
> > > >> >> +int device_match_fwnode_ext(struct device *dev, const void *fw=
node)
> > > >> >> +{
> > > >> >> + struct fwnode_handle *dev_node =3D dev_fwnode(dev);
> > > >> >
> > > >> >> + if (!fwnode)
> > > >> >
> > > >> > IS_ERR_OR_NULL()
> > > >> > If supplied @fwnode is secondary, it might be an error pointer.
> > > >>
> > > >> I mirrored existing device_match_fwnode(), should it be fixed too?
> > > >
> > > > The answer is "I don't know". Strictly speaking this should be done=
 everywhere
> > > > in the generic code when we can't guarantee that fwnode that comes =
to the
> > > > function is pure NULL or valid one.
> > > >
> > > >> >> +         return 0;
> > > >> >
> > > >> >> + if (dev_node =3D=3D fwnode)
> > > >> >> +         return 1;
> > > >> >> +
> > > >> >> + return fwnode_is_primary(dev_node) && dev_node->secondary =3D=
=3D fwnode;
> > > >> >> +}
> > > >> >
> > > >> > I think we can refactor this.
> > > >> >
> > > >> >    struct fwnode_handle *node;
> > > >> >
> > > >> > // I would name it like this, because in 3 cases in drivers/base=
/property.c
> > > >> > // 2 with node and 1 with dev_node when the same API is called.
> > > >>
> > > >> Haystack's node is "node" and the needle is "fwnode"? Seems confus=
ing to me.
> > > >
> > > > But we need some consistency. drivers/base/property.c is inconsiste=
nt to begin
> > > > with and here the code chose the least used one for unknown reasons=
 to me.
> > > >
> > > > I'm fine with "node" that is inside the function.
> > > >
> > > >> >    if (IS_ERR(fwnode))
> > > >> >            return 0;
> > > >> >
> > > >> >    if (device_match_fwnode(dev, fwnode)) // NULL check is inside
> > > >> >            return 1;
> > > >>
> > > >> Yeah, and it too can be supplied a secondary fwnode. Let's say we =
resolve
> > > >> a reference to a secondary software node and try to lookup a GPIO =
through it,
> > > >> we'll end up with an IS_ERR() fwnode with existing code, right?
> > > >
> > > > I'm not sure I understood the use case you are trying to describe h=
ere.
> > > >
> > > > The very first check guarantees that fwnode is either NULL or valid=
 one.
> > > > When it's a valid one, the comparison with error pointer will be fa=
lse.
> > > > What did I miss?
> > > >
> > >
> > > I mean: device_match_fwnode() has a NULL check but not an IS_ERR() ch=
eck and
> > > can be passed a secondary fwnode as argument and that can be -ENODEV.=
 It will
> > > probably not fail terribly but is still incorrect.
> > >
> > > I was speaking about the existing implementation, not addressing your=
 comments.
> > >
> > > >> >    node =3D dev_fwnode(dev);
> > > >> >
> > > >> >    return fwnode_is_primary(node) && node->secondary =3D=3D fwno=
de; // NULL check is inside
> > > >> >
> > > >> >
> > > >> >> + if (!fwnode)
> > > >> >> +         return 0;
> > > >> >
> > > >> >> + if (dev_node =3D=3D fwnode)
> > > >> >> +         return 1;
> > > >> >> +
> > > >> >> + return fwnode_is_primary(dev_node) && dev_node->secondary =3D=
=3D fwnode;
> > > >> >> +}
> > > >
> > > > ...
> > > >
> > > >> >> +int device_match_fwnode_ext(struct device *dev, const void *fw=
node);
> > > >> >
> > > >> > Perhaps ext --> or_secondary ?
> > > >>
> > > >> I thought about it but it would make it sound like it only matches=
 the
> > > >> secondary to me. Maybe device_match_all_fwnodes()? Would be future=
-proof if
> > > >> we end up doing the linked list approach.
> > > >
> > > > Danilo proposed _full, but in my opinion it's not better than _ext =
unless you
> > > > know very deep how fwnode structure is designed. Same with _all. It=
's confusing.
> > > >
> > > > fwnode_or_secondary (the key part is "or") sounds more precise. But=
 if you come
> > > > up with something else that makes less ambiguity I will be glad.
> > > >
> > >
> > > device_match_fwnode_or_secondary() sounds good to me but shouldn't we=
 try to
> > > limit the propagation of the "secondary" token in namespaces if our g=
oal is to
> > > get rid of the whole "secondary fwnode" concept?
> >
> > I'm a bit late to this, but here's some background.
> >
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
>
> That's evolution in practice for you. :) It turned out software nodes
> are a good alternative for platform data in board files or MFD
> sub-devices and can serve as the primary firmware node of a device.
> That's alright - we have a common fwnode interface and it works fine.
>
> > So all of this goes beyond the original anticipated use of secondary
> > fwnodes and it seems to be calling for a list of equivalent (not
> > primary and secondary) fwnodes in struct device, but then of course
> > there's the question about duplicate properties and whether or not the
> > fwnode used for driver binding should be preferred (I don't see why
> > not).
> >
>
> I think that was Andy's initial proposal: treat the DT or ACPI node as
> the primary "main" node and any software node as an additional source
> of properties. In the absence of "real" nodes, I propose to treat the
> first software node as the primary.

IMV what really matters is which fwnode is used for picking up the
driver because that's the one that holds the device identification
matching the driver in the first place, so whatever properties come
along with that identification should take precedence over properties
supplied by the other fwnodes.  Typically, that would be either a DT
or an ACPI (device) node, but it need not be any of those in
principle.  It need not be the first one either.

> > Until all of this is resolved, I wouldn't even add a generic helper
> > for matching secondary nodes.  I'd just put this code directly into
> > gpio_chip_match_by_fwnode() along with a big fat comment explaining
> > why exactly secondary nodes need to be taken into account there.
> >
>
> IMO that's a recipe for keeping it local forever but I don't mind it.

If there is a move toward replacing the fwnode pointer in struct
device with a list of fwnodes, that code will need to be updated
anyway and that would be the time to use a helper IMO.  Otherwise, it
may as well stay local.

> I think I proposed to add the helper because Andy suggested doing it
> in driver core.

I see.

