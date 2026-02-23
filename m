Return-Path: <linux-gpio+bounces-32078-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIo7NyGxnGmYJwQAu9opvQ
	(envelope-from <linux-gpio+bounces-32078-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 20:57:21 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8288717C999
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 20:57:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 017653047422
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 19:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40B2F37475A;
	Mon, 23 Feb 2026 19:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EmKo4gzK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C65369972
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 19:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771876542; cv=none; b=okGqGf/05WcMCOHWXoxALjx5ZbupglNMmPpV4K/B+vOOLfjGvO89XGkPtFHEcnCxTwlKNk6wU11ToWoKUxmp1BoDO3N45S0DghboCOSirv3OxX+rK4SSWaLvgAAsvBn8PLj42dhmRoCCkOIHoR6OaWuFWJF5Zc1BCjns7BGt3Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771876542; c=relaxed/simple;
	bh=/Jd+wOYxcK2UTlTiAjXBDqWssRwx85tP4MQMzey1/No=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=krJkO7s+CxVoL3Eb94eZetEo2KrgwMCvsKTwWgn7r9/Jj4NuM0asmh6+9pOLCpmkau/3g9MB9SywnDBWvu80aAcrfw5Es5oMwanwWvDYLzeItlTEFLwJktjDHhod2uxtTyKE6nY2t601dblr2Tbbw4R5sYr31gKdnA9jAYRsI+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EmKo4gzK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBCFBC2BCB0
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 19:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771876541;
	bh=/Jd+wOYxcK2UTlTiAjXBDqWssRwx85tP4MQMzey1/No=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EmKo4gzKBAokjFUfSK0mpsE4JCUurFjjxYyty+zlN3hRXLo1fY2FZtmWTmDIt17JV
	 KCpKPSdNiMvV1cLuiqbhg8+fWvV/si3iXoRxY3qF+TzLTJJGT080PBSMJ5z0bp9kCD
	 XlqpdjnYbt4cJUvuGrfGikZW3Q1vCoajnuhmny6dcjGNpBf70GDPo7PVgbXge8qT7H
	 bLHVcZn9soJ4MRXchSmJW8+8JERG4bYfsQ26q80hFKF78k0PHNw+5j4fHo+J6FI5yX
	 xFrhQf1RegEcPcoV4I3ZJut8tjzf+clOWYMkmd2okZEq3MWeLs3fp+4+wFuGackYD+
	 GV7b38/LSchrQ==
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-679d05729feso464747eaf.1
        for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 11:55:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX7l/YRUkweJBrB+WviWWFrN5TYHBZMV9PBI96SFQLDbPh0/M+FVNySGRspTJZPNe1WXF4zaH78VVEH@vger.kernel.org
X-Gm-Message-State: AOJu0YwLCNYA3n68tw16L3NTomvpT8Zfa4Fhon8SuzpXdUkoRJW9wG1p
	0dc9TvS3vEOE69m2VtwkMOYxSc6YRk8No3X+615xtbfLKIVCs1F/F03nBX2AjKoW/otFa+u1JW/
	uchSO9HSkE38egFYJohduIBXBfGt/3lY=
X-Received: by 2002:a05:6820:468e:b0:668:d715:108d with SMTP id
 006d021491bc7-679c44d0ddemr4033527eaf.46.1771876540739; Mon, 23 Feb 2026
 11:55:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-device-match-secondary-fwnode-v2-0-966c00c9eeeb@oss.qualcomm.com>
 <20260223-device-match-secondary-fwnode-v2-2-966c00c9eeeb@oss.qualcomm.com> <DGMLL6SYIK5C.DJ8U368VN9CG@kernel.org>
In-Reply-To: <DGMLL6SYIK5C.DJ8U368VN9CG@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 23 Feb 2026 20:55:28 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jr_i9k3d+np8c+ANhewMhT-TL9exLzZKUJOVarBGnHfw@mail.gmail.com>
X-Gm-Features: AaiRm50g3Wp2gOHjm-qH52cHJt86pz7I_bTv5QKxNQUg4zkSmUxZsXtqZd4GY-k
Message-ID: <CAJZ5v0jr_i9k3d+np8c+ANhewMhT-TL9exLzZKUJOVarBGnHfw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpiolib: match secondary fwnode too in gpio_device_find_by_fwnode()
To: Danilo Krummrich <dakr@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Len Brown <lenb@kernel.org>, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32078-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linuxfoundation.org,gmail.com,linux.intel.com,lists.linux.dev,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8288717C999
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 8:45=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Mon Feb 23, 2026 at 4:40 PM CET, Bartosz Golaszewski wrote:
> >  static int gpio_chip_match_by_fwnode(struct gpio_chip *gc, const void =
*fwnode)
> >  {
> > -     return device_match_fwnode(&gc->gpiodev->dev, fwnode);
> > +     struct device *dev =3D &gc->gpiodev->dev;
> > +     struct fwnode_handle *node =3D dev_fwnode(dev);
> > +
> > +     if (IS_ERR(fwnode))
> > +             return 0;
> > +
> > +     if (device_match_fwnode(dev, fwnode))
> > +             return 1;
> > +
> > +     return fwnode_is_primary(node) && node->secondary =3D=3D fwnode;
> >  }
>
> Rafael, I understand [1] as you agree with my point, but object to introd=
uce
> device_match_fwnode_ext() (or whatever name we would pick eventually :)
> regardless because only the GPIO code would need it as by now.

This is a preference, not a strong objection, but yes.

> IIUC, I wonder if exposing fwnode_is_primary() instead is a good trade.

Well, there is the secondary pointer in struct fwnode_handle, so it is
kind of exported anyway and it could be documented as "a secondary
fwnode_handle supplying additional properties or an error pointer", so
exposing this static inline doesn't change much IMV.

What's your specific concern about exposing it?

> [1] https://lore.kernel.org/driver-core/CAJZ5v0jUCtKTW-g-C0pKu0DQqOkyfSz=
=3DupXwbtYeV_=3DrMBUMyg@mail.gmail.com/

