Return-Path: <linux-gpio+bounces-31815-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOCRKXwglmn9agIAu9opvQ
	(envelope-from <linux-gpio+bounces-31815-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 21:26:36 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C643A1596A8
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 21:26:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 46E3A30046B6
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 20:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBB2C31B823;
	Wed, 18 Feb 2026 20:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JgB6Mlyc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB4D2DF6F6
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 20:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771446389; cv=none; b=nzNhWWJkhswOsk30gmI16w2uwdmvrZr8Xj5xHqD4a5Z2qHN7hAhA/kzIx4oeDu5+umAjD7sBj3yBlb/gfpeoQoG6Jg0f0Iz7b76JUUvOb9eUTUrumexL5kH91MmF4HFl+Qk43KORpx2jmwhx7uXXXIFSECwKKH3ZjSBS8nZwD0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771446389; c=relaxed/simple;
	bh=51oOZcbohwcflmtunO3zKzNxglgddncc8ht0HuGQTgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J/oWSHAUlhSGJdzUWPVuEpyOx+wtNSh134076SjyCXv4KzXGiwRAta3krwLNB6GGVZxzNWcr0I+AFtx6zUmZCh+P4UkHAoaQKkryZc/30XI18BVwVUQJCleDVCWrOERW2uUEC7gH6PS8MTsErr1ltplPpiHpXob45LJyGqn5238=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JgB6Mlyc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 917BBC19422
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 20:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771446389;
	bh=51oOZcbohwcflmtunO3zKzNxglgddncc8ht0HuGQTgE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JgB6MlycFOGIiidV1PsMPAShgW/DX20rc+Ypn2EXUsYkeJBE+xJru919BMY94sFyX
	 d6R413QVNsF7Qu5jZgqP4iXpcZFf+Wpf1Cb3RPh+TIol8F4sxykynBqW7olCXjmpWj
	 tmDnP9G1DUfvDqsFqr2kQmPhVLdjFfPH5Sn6sP2t6hao2JA35J9CkBznJMlOkf+c5Q
	 X98Ion3mQRUOTcOUB0AIjmb8TKdhoce7ZxrCwgYoTtwBN+tPMge4v/qHuFT/8WfIqW
	 O00PJg2Jy0l1DU/llefnzVl4TefaMeMeLhXIGp1klsPgi2hC7uyRT6j+ZdK/POyZwg
	 1t1dmH1+oqbJw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59e607a3824so298216e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 12:26:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXZWoz6djzE5xd3LiKVLqM/vobBrl2LbQyQIG98iXfxOYy3v/8L9xoeCbTKlzyyV1WAs6n5mf2Px3bV@vger.kernel.org
X-Gm-Message-State: AOJu0YxkGZSQwAcbyIiDTgwcIWoBOPCZBW6i0t2vAkRw8+k/A4Q2pQh8
	QMkuHsmkkL2wF+Astappqg+YGyK89Sr+nQcJs3qS1cnKThT3O4AYQCQVi6MLHTAVN7ehCjHJawS
	uv5b5X8ipX0ASx8Y2wHP4uZf0aM/vbsXaT0nhKr3s3Q==
X-Received: by 2002:a05:6512:3402:b0:59e:6256:4d9d with SMTP id
 2adb3069b0e04-59f83b8e9b7mr992572e87.5.1771446388221; Wed, 18 Feb 2026
 12:26:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260218-gpio-manager-bind-vs-add-v1-1-0fb22c448de3@oss.qualcomm.com>
 <d63e251e-03cb-4c76-aa96-f8550a43c7d8@baylibre.com>
In-Reply-To: <d63e251e-03cb-4c76-aa96-f8550a43c7d8@baylibre.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 18 Feb 2026 21:26:15 +0100
X-Gmail-Original-Message-ID: <CAMRc=Me6ULf+-nOKLXuj1966mW9uuiM5fq3twhC98TMbGjUs_g@mail.gmail.com>
X-Gm-Features: AaiRm53lLKQxRJDVJXo9hc5ssuVsWX0qQpIz10h53nzGl8wVuJYwZPaogSSPdAA
Message-ID: <CAMRc=Me6ULf+-nOKLXuj1966mW9uuiM5fq3twhC98TMbGjUs_g@mail.gmail.com>
Subject: Re: [PATCH libgpiod] dbus: daemon: watch for "add"/"remove" uevents
 instead of "bind"/"unbind"
To: David Lechner <dlechner@baylibre.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-31815-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: C643A1596A8
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 7:05=E2=80=AFPM David Lechner <dlechner@baylibre.co=
m> wrote:
>
> On 2/18/26 2:50 AM, Bartosz Golaszewski wrote:
> > Linux has a stub driver for GPIO devices (the ones on the GPIO bus, not
> > their parent devices!) but it only actually *binds* to it those devices
> > that don't have a firmware node attached. This means that in some cases=
,
> > a "dynamic" GPIO controller can remain unnoticed by gpio-manager.
> >
> > This behavior is related to fw_devlink handling and - even if we change=
d
> > the kernel to bind all GPIO devices to the stub driver - a fix in
> > gpio-manager is easier to distribute than a kernel fix.
> >
> > Since an *added* GPIO device is considered functional, even without
> > binding to the stub driver, we can rely on the "add"/"remove" uevent
> > pair when detecting when GPIO chips come and go.
>
> Would this also be true if a device was added at runtime using a dynamic
> devicetree overlay, i.e. it would still have to bind to a real driver and
> not the stub?
>

Yes. The device is "added" when we call gpiochip_add_data(). It's a
struct device we allocate inside that function that's called gpiochipX
and whose uevent we're waiting for. The real driver binds to the
parent of that device.

> >
> > Fixes: a5ab76da1e0a ("dbus: add the D-Bus daemon, command-line client a=
nd tests")
> > Reported-by: David Lechner <dlechner@baylibre.com>
> > Closes: https://github.com/brgl/libgpiod/issues/175
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
> > ---
> > Resending with proper prefix.
> > ---
> >  dbus/manager/daemon.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/dbus/manager/daemon.c b/dbus/manager/daemon.c
> > index 4627e8c96b420b8ad9e36bf7b884a702490d53f7..b9c295a55751d7d37d8a930=
33e9e1ad7ec8ac5af 100644
> > --- a/dbus/manager/daemon.c
> > +++ b/dbus/manager/daemon.c
> > @@ -785,9 +785,9 @@ static void gpiodbus_daemon_on_uevent(GUdevClient *=
udev G_GNUC_UNUSED,
> >       g_debug("uevent: %s action on %s device",
> >               action, g_udev_device_get_name(dev));
> >
> > -     if (g_strcmp0(action, "bind") =3D=3D 0)
> > +     if (g_strcmp0(action, "add") =3D=3D 0)
> >               gpiodbus_daemon_export_chip(self, dev);
> > -     else if (g_strcmp0(action, "unbind") =3D=3D 0)
> > +     else if (g_strcmp0(action, "remove") =3D=3D 0)
> >               gpiodbus_daemon_unexport_chip(self, dev);
>
> I supposed doing something like this to use the "bind" event if possible
> would be too fragile (since condition_exists_that_would_prevent_bind coul=
d
> be different depending on kernel version)?
>
>         if (condition_exists_that_would_prevent_bind ?
>             action =3D=3D "add" : action =3D=3D "bind")
>

I'm not sure we can make sure that the condition exists from
user-space. Using "add" and "remove" uevents should be fine. I ran all
my usual tests with no issues. Let me know if it works for you too and
- preferably - leave your T-b.

Thanks
Bartosz

