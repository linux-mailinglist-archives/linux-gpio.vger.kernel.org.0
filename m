Return-Path: <linux-gpio+bounces-32073-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMzdIVqhnGnqJgQAu9opvQ
	(envelope-from <linux-gpio+bounces-32073-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 19:50:02 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C74B17BD3F
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 19:50:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 600F53016ACF
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 18:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32395369233;
	Mon, 23 Feb 2026 18:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I6h5r4jV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8556366DD5
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 18:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771872598; cv=none; b=m/QPzLsfs3Ua8D2IuxNvJ+osacU9oErZE4U+GRjKorAuXLUI18xbzjlj9Mdmc+CfZ0iw1gpowIa3u8+r1yLDCCpZFWdLzo/VLuvr1piUsooz+PSngygoV3shVKyFXnjRRDXFY0ayldTPuTHX/DabdcqDl7DBnewGncaFiYA+pKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771872598; c=relaxed/simple;
	bh=7DaqiEUgibTsJqalZ4wGFzvtp5Xgz3X9JGL6Y760bBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uMgBxNx9TkfDt96OIAaugNQ3F9lm6GX31MYlabjvKxjS9wFompj5TlkV0RG8UOZxu1KcOoHDGEA5g74mqE/STZx6JdnXte3Z5sOQzvP7UZii2H/Gdl/rTxUbdxbMm2jz+Sh13zD7uP7EDeZ6s+ph7hm4SMNtnUAt7SepETQtMWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I6h5r4jV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96E02C116C6
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 18:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771872597;
	bh=7DaqiEUgibTsJqalZ4wGFzvtp5Xgz3X9JGL6Y760bBQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=I6h5r4jVv+b7cNEKyGOi0FtRe84O62nV9C+toE4O6is5hbWoK1vP5I60qXDFvo81q
	 qlXsU8Z2DrWAB2AzuRkCoCpM7R0j+8FJmu97byHtdqHf7WXxvVi2VivtiArflh2rC1
	 62lBs6U4CPWlQhdwmqSCB9gdgnpc9yjkSm+xwsd/YHcsVRMIDTwSQVK06LloI5EIm6
	 68NDAJnvhDE9bVgyJaT0Je7TjTF4MjzIAwgT+OR78koVrJbYXPQbzBhm14OytKsNVZ
	 vCjjg8zOTbjyU4j8uAXaJ51Cv9BJyJG+zv4vhE01xIfrl8/7uieM4P1oUDBTKw+Zzg
	 0tdcdqNZfb6MQ==
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7d4c3896e32so1728953a34.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 10:49:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWE7H3g3SYDeNI5OS/q4oOkUwfIPep3xN3nNVGZ9sxHFvUzzepbcWpHb3wu2UUXEj6TYRqOl58+KujP@vger.kernel.org
X-Gm-Message-State: AOJu0YyLc5k0rhlm1RxNxaBIJw3YJBgwrpu5+Uj5JLeOu5FRNpqS3AQW
	A/USUTNNsRVlgTPOYyiWeULSNIskOy4I2dphUNwI1DEhCWrV/EDH2UP/9ro7JGU77cSDRnS2A0t
	sf0Pi13GnNxCIOwiK7TY7TMKF2p0RY+o=
X-Received: by 2002:a05:6820:150a:b0:676:6570:209c with SMTP id
 006d021491bc7-679c466f67dmr6020732eaf.10.1771872596714; Mon, 23 Feb 2026
 10:49:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-device-match-secondary-fwnode-v2-0-966c00c9eeeb@oss.qualcomm.com>
 <20260223-device-match-secondary-fwnode-v2-1-966c00c9eeeb@oss.qualcomm.com>
 <aZyUY3ZsmrwHw4X_@smile.fi.intel.com> <CAMRc=MfpzgOPf4pkHd_tNQ4wBNMhfUBOh=ptajhhZwDpFUPGBQ@mail.gmail.com>
In-Reply-To: <CAMRc=MfpzgOPf4pkHd_tNQ4wBNMhfUBOh=ptajhhZwDpFUPGBQ@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 23 Feb 2026 19:49:45 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0g_BfgFV1xyGfZWTi1OQwmH3pgChfsp9ry0-UAX-+QFxQ@mail.gmail.com>
X-Gm-Features: AaiRm502Num48PMPO1JQfMnvo3vl_Oxj_rvuhaTNwdJvlG8-GDC8O80mapS98QY
Message-ID: <CAJZ5v0g_BfgFV1xyGfZWTi1OQwmH3pgChfsp9ry0-UAX-+QFxQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] driver core: make fwnode_is_primary() public
To: Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Daniel Scally <djrscally@gmail.com>, 
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32073-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linuxfoundation.org,kernel.org,gmail.com,linux.intel.com,lists.linux.dev,vger.kernel.org];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 2C74B17BD3F
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 7:29=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Mon, Feb 23, 2026 at 6:54=E2=80=AFPM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Mon, Feb 23, 2026 at 04:40:52PM +0100, Bartosz Golaszewski wrote:
> > > Export fwnode_is_primary() in fwnode.h for use in driver code.
> >
> > ...
> >
> > > --- a/include/linux/fwnode.h
> > > +++ b/include/linux/fwnode.h
> > > @@ -230,4 +230,9 @@ void fwnode_links_purge(struct fwnode_handle *fwn=
ode);
> > >  void fw_devlink_purge_absent_suppliers(struct fwnode_handle *fwnode)=
;
> > >  bool fw_devlink_is_strict(void);
> > >
> > > +static inline bool fwnode_is_primary(struct fwnode_handle *fwnode)
> > > +{
> > > +     return fwnode && !IS_ERR(fwnode->secondary);
> > > +}
> >
> > This is inconsistent. Please, split out fwnode stuff from device.h to
> > device/fwnode.h and share it there.
> >
> > This reminds me to look what I have locally in development...
> >
> >
> > (With your patch it will be in device.h and fwnode.h and in the latter
> >  it's even not properly grouped with other non-fwdevlink related stuff.=
)
>
> Please rephrase the entire email because I have no idea what you mean. :(

I thought Andy wanted fwnode_is_primary() to go into fwnode.h, but
that's where it is already going.  Confused. :-/

