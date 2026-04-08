Return-Path: <linux-gpio+bounces-34902-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMbhOpis1mmZHAgAu9opvQ
	(envelope-from <linux-gpio+bounces-34902-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 21:29:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D743C3123
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 21:29:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD642307339D
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Apr 2026 19:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2F7E385513;
	Wed,  8 Apr 2026 19:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s/M1AyMB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329C23B19B0
	for <linux-gpio@vger.kernel.org>; Wed,  8 Apr 2026 19:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775675243; cv=pass; b=R4Dvc6jB+uWhkq4NUSMK0ER2QuKV7DvubQIj3zKkveetXQCNPs9OJ22uyE4+30tc9SONAAj0BTLjMv/iJe9465iTWCnWP8rqyE9HtT1YctS8CD24fY4mc2h09ocf9W2fJgR42Chq97CZJ1beewnEJjjfFaM1ivw4QcvlNfARGIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775675243; c=relaxed/simple;
	bh=B3GzhcznlTgp3S6SnojCWf3qgJxcSS+uWQsFtA09RSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z038LBF2icnTF6DW0cJ1khXPlTMAExXbYhSvCVxap9XorLgAc7hmhNTYH16EFF0HJZmYILBWDgbVRJN7RRwouN1orSNxmdEgX+cQTl/sRV/QfiFqoMjqnXADMhd8feUPsoow6Wu08b49Fwk7esa2ruc0YdTrQwTUpNZ9BuW04SU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s/M1AyMB; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b9825ba7e8dso6863266b.3
        for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2026 12:07:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775675240; cv=none;
        d=google.com; s=arc-20240605;
        b=ARuyzvO6r/bXTFZOQRaksXiRu478Zay+LmY4LvOmRH43iH+90oNNon2UkeNNWmZ2Al
         XiIyt5+Bf/SwuqqVFwny6CO/d2PupQi1DS+8zL3H1GhiS9i7JsNqPjLHGaJlI3BppSRa
         IYoUh/+F0DBhvmASqh5ZW50PjMkTTtmfac+Y/x9m7S/gKedSCwlmi8lp3+eLtCLk2sR0
         uTETDez4PNcfeIT5iQ7P4tgqfQy9FEGy4KLCNgTcutG/DP59i0VQ48G3NqcsmMZX8Jym
         oFJOxYEiL41YEDKIQ8eJe8/AG9dl2DVQH3mZ1FjExjlCMxrDxqQcxrsKXdPUXNRKSvji
         K2PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5MgGWh9XKK+ZjwM7NdPVqoY4t2PvZ9URXYNukPgpet0=;
        fh=GqaKHvKma4k2iRBUp0mFamuw27R6MuSZl1VAjGVP3oI=;
        b=TfTvFql92KIZjMdYJOrEYbjy/AUJcmd4RmhIeBsjFljSyOpwtO/U6HsERp9Hd8Be+E
         nwv2o7bLqg3j5KA/jZDWCIabnDsOvFwfCay6CmQZ2AgEewokyYqGFCY7maJjigwYMIox
         w+MbkswdJAOksa2UGDevyy6D6AU8+LF1Oq8MtcwwQSlymjUSbuhpqV2/OYII9FEujvBe
         hVpqBsTJdvt+vXVex00VcE0IO/J7gPOX7EeXEU7eM6hl70xFUd9zv+u7/KwYbad5hCNA
         kX5ylMCb5F6bfFiJBv8Q1LJaze1YVWUFTHZI46c2RlfEU6W+7IzxrbNXTUMmjIF97s0l
         oOnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775675240; x=1776280040; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5MgGWh9XKK+ZjwM7NdPVqoY4t2PvZ9URXYNukPgpet0=;
        b=s/M1AyMBB5e2sxLEfQIqfiZIyfUaXqOjICexrX0SKdAUsvVWMeuvYOoAhzBdTzf2bw
         xBJ63mSU5ZXelSXY+KJxR9nnf09ANhhECwVl9ChjBoM8tYLkC7UW0TZ5SxvIf09jYDsr
         G5aYsY18cigRVLX9clbT2C2AT2iw4bH9EISpbjHwK7QxwmTe7QUswV6kWMsM5f/Gq9TE
         VXOHPvVyOEaNYfNUguYhaeo+EmsbcgiIDzRqURQj3f20Wuj2wCgvLlgvvBrV+vIJL5rA
         I8iLoCEBntJkLYaTsHYM+YQd7KV8zIU9ETXghzvZ1jXz3pORohC320VpzOvuWXdpHUbI
         TRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775675240; x=1776280040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5MgGWh9XKK+ZjwM7NdPVqoY4t2PvZ9URXYNukPgpet0=;
        b=bbS0nfRP03TfI635bdImHL3P1TfFitfzkTbqnXC44Tv3yPqefCrf0pLMZ8NqP8FSNR
         nfRNyN7Ca2gvubz7I5/lWZWbuulPrD5ppoPSSG2RWR6CzdYHEr/gmiFB7HHXirgYo4Nd
         UmY9GKsGLQD6o8rSBDjlfS/enMfYb5U3ZQAp+rvcUssZQx8Itai/CPxNLO0fOqxHXFHD
         qnCwaKWNnMyY6C/n1EitgP5Xax0d1XQbXvSe2DLWCSkAeI8CEotm6/6sXD5v7P6mqCAF
         YYD2l6dfHAyRNcTn6+JzF9CsWLTlMDnUA9y+Anwh+j0Tl8czZkg1TQ8Owm8h3K2CgrhW
         z1BQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiP4tyQkBhvT4bXWNenc8XKzcRHhydt3Vool2l9Ip+X0poMfnMBzRMDbu8JpFYKC2aLZx6yH2FMFsG@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4chUgnnAwvwhRDvzzf44LwWa9QeYF/64z6Le9n9sgyJsCIsIT
	zs2/4Fqy85i8pMApCKhBW/7i6ZrHTFDyxVenMOwA0Iam3xnGAODcUEiz/BSwqThz0ZEoqxGxoiK
	xeLOgz5uwnAnt+WQf8tkeoDXVAmbs2yE=
X-Gm-Gg: AeBDietbuon8y03yAeSGl0hTWr/+Dy1GIoD77cksXX/kH0ky3aa6w5dxISMKNGduGx8
	TPk2+pt11u+JtgPTgxSLlxz0X0dE/zPp1ErgLCT0twfozPnvraMYqRxR0kPpyeglK0k455HVtyv
	BkyPCGNqQiUt5WNFMx16H6nMF0WBydmyJulI2esftEckpk0w0uLKkp1nUZU5ASQfXuVFJ7Bw8zG
	s9nT94O63vK0Ik1KFKhBaoPkl04/3fPKUtr7JvtMUZ1WCBTZvf7kOQ7+jxZyE6zgZ0l0nO98Uk3
	TkvlpYBbK3q3yMhjv4Jw5Oshm0bIR1qbrEx5Z7xy7daVsy2YsSHelFgajZv/7FbcHBAEbWPBZ62
	PVWZ1yWg=
X-Received: by 2002:a17:906:fe04:b0:b9c:7ba2:4168 with SMTP id
 a640c23a62f3a-b9c7ba2434dmr1035145666b.22.1775675240023; Wed, 08 Apr 2026
 12:07:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260407-swnode-unreg-retcode-v4-0-1b2f0725eb9c@oss.qualcomm.com>
 <20260407-swnode-unreg-retcode-v4-1-1b2f0725eb9c@oss.qualcomm.com>
 <CAMRc=MdWSigDmTGSCe-ggAC+rKcCLimKgKU_kAGh5N66jyXGtg@mail.gmail.com>
 <DHNVOVO67YMW.1Q763BB153CGF@kernel.org> <CAMRc=MchUSdWo=BXrYN-qS3YFer2R3J02HyJxKJje-a1QvWdfg@mail.gmail.com>
 <DHO01A7B9M0Y.1QVVS8600WRJ5@kernel.org>
In-Reply-To: <DHO01A7B9M0Y.1QVVS8600WRJ5@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 8 Apr 2026 22:06:43 +0300
X-Gm-Features: AQROBzDJGzBec5JWWeiqiBKbeAoL0ZpHkqC5pUPiuXH6__r4G5qXrWhTK62d4tI
Message-ID: <CAHp75Ve67JDc=79Ynp29wHPFA0s7Tv_cDcyrB=0U8Q+ydAifmw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] software node: return -ENOTCONN when referenced
 swnode is not registered yet
To: Danilo Krummrich <dakr@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34902-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,gmail.com,linuxfoundation.org,vger.kernel.org,lists.linux.dev,oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,bootlin.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 97D743C3123
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 8, 2026 at 9:53=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
> On Wed Apr 8, 2026 at 5:52 PM CEST, Bartosz Golaszewski wrote:
> > On Wed, 8 Apr 2026 17:28:46 +0200, Danilo Krummrich <dakr@kernel.org> s=
aid:
> >> On Wed Apr 8, 2026 at 9:19 AM CEST, Bartosz Golaszewski wrote:
> >>> On Tue, Apr 7, 2026 at 3:28=E2=80=AFPM Bartosz Golaszewski
> >>> <bartosz.golaszewski@oss.qualcomm.com> wrote:
> >>>>
> >>>> It's possible that at the time of resolving a reference to a remote
> >>>> software node, the node we know exists is not yet registered as a fu=
ll
> >>>> firmware node. We currently return -ENOENT in this case but the same
> >>>> error code is also returned in some other cases, like the reference
> >>>> property with given name not existing in the property list of the lo=
cal
> >>>> software node.
> >>>>
> >>>> It makes sense to let users know that we're dealing with an unregist=
ered
> >>>> software node so that they can defer probe - the situation is somewh=
at
> >>>> similar to there existing a firmware node to which no device is boun=
d
> >>>> yet - which is valid grounds for probe deferral. To that end: use
> >>>> -ENOTCONN to indicate the software node is "not connected".

> >>> With Andy's Ack, do you think you could still queue this for v7.1?
> >>
> >> Yeah, that should work, but I have a question about the patch.
> >>
> >> The comment added to fwnode_property_get_reference_args() says:
> >>
> >>      + *            %-ENOTCONN when the remote firmware node is a soft=
ware node that
> >>      + *                       has not been registered as a firmware n=
ode yet
> >>
> >> This seems like a bit of a layering violation to me, as it makes it ex=
plicit
> >> that this error code indicates a software node, while
> >> fwnode_property_get_reference_args() itself should be agnostic.
> >>
> >> The caller can easily derive more specific semantics with an is_softwa=
re_node()
> >> check as you already do in the GPIO code.
> >>
> >> Can we describe the same condition, but without explicitly naming the =
backend?

> > Yes, sure. It can be something like:
> >
> >       %-ENOTCONN when the remote firmware node exists but has not been
> >                  registered yet.

FWIW, good to me.

> > Does this sound good and doo you want me to resend or can you change it
> > when applying?
>
> I can change it when applying.
>
> One additional question though. I think it should be fine, but are we sur=
e the
> change can't regress other subsystems? It seems some of them (e.g. sfp-bu=
s,
> v4l2, iio) special case -ENOENT.

v4l2 uses the ENOTCONN in the cases similar to this

https://elixir.bootlin.com/linux/v7.0-rc7/source/drivers/media/v4l2-core/v4=
l2-async.c#L744

There are two more, but they seem more about connectors.

--=20
With Best Regards,
Andy Shevchenko

