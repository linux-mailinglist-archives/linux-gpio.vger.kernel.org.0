Return-Path: <linux-gpio+bounces-32058-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDMUBZuSnGnRJQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32058-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 18:47:07 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C4817B06A
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 18:47:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 28D17305019C
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 17:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80F9E33890B;
	Mon, 23 Feb 2026 17:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RKKrW4M2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402843385AE
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 17:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771868813; cv=none; b=UhIOwhiqnK4lYkJvlXeEU2vDuL9acdjAMUohkQOGGt+2e8b0p++0l6pGSl9/HdZxATy8Et21UmsPHIM/qJsLag78a1FLzSrGmeoFRPGHtTUOSZBVfGhBSr/EfMmb9h+LzveTQmSVfQrkmlpD1cFCbIsyBakolw3pLcggG+DzgBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771868813; c=relaxed/simple;
	bh=Xs/2dCF6dfNmiAQ9dUHgxwVqt3IYoGpB9IhENpi8NeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yxk8tuncJxcvr7NU9E+F3FsPSmDtu5be+VhapU+JvkcTPZDI5SRWHYHKOOxu77p8hd7BxwNITDlo5Ur0b8El5zaaKmQrnUa0BNjuzxVgOueHZmKpHudLgXXlOvlD14AVnSVa0HX46qhFI+tlh9/3YIJkW/RKVhYTc4vk5AaTK1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RKKrW4M2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF8A4C116C6
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 17:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771868812;
	bh=Xs/2dCF6dfNmiAQ9dUHgxwVqt3IYoGpB9IhENpi8NeY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RKKrW4M2R+Jx+FKvfEfzEqFYW+Nh/4nzMBSTjDmkCbeCSn+LfNKCYYKEaU+v3kw9v
	 YT8Z5auH+X9ljhVtgvCELZCTnleXDhURHhIQDpfLS7Im8iTcAGA51vw5nImrbjhgb2
	 xBFROVShC2ziJCMRmSS1MK1uFKtWAoak07YWknk4jV0qNiqF7Y6I5byiLrJOI4KlSU
	 h8ZlrqqSkPjnD/Ue5dJLBlDw+BZ/hU6F0UhnJKWg+2Zbf/j46ZXBX9h3ZE6kxK4D3S
	 BgWHmSM+5LtsL036TupsLXpaorCbHwMQ3PI5oubNEPDFMdkx86tw2O5HZXgRdDd24M
	 hL+FppHTicsJA==
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7d4bd4db87aso2981669a34.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 09:46:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVqvjkCnf42eF+rmbRwDuIG9Y61xGfx2IlCYTS52C3JoyfjqAa/al4UNaZVToGZR5JK/9xUkG+Mqn6C@vger.kernel.org
X-Gm-Message-State: AOJu0YzcvzUHrGZdYhP9dAJTghf+K9s9peEFaj0xEWeigOWa85bRsylz
	ROEcnU/RnT2Mgjmw9MYVdiAnw3bMZcd9lxgIlrWc/PXTwGiuE8dUE3SB4ZeNgC0Lz73ai82dxrV
	PHyd+ojH1UqwfmhPYIHlLyiNTizM26+8=
X-Received: by 2002:a05:6830:81ec:b0:7c7:69d9:d8d3 with SMTP id
 46e09a7af769-7d52be3dd2dmr6849786a34.12.1771868811975; Mon, 23 Feb 2026
 09:46:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-device-match-secondary-fwnode-v2-0-966c00c9eeeb@oss.qualcomm.com>
 <20260223-device-match-secondary-fwnode-v2-2-966c00c9eeeb@oss.qualcomm.com> <aZyNErXB_acR3yYq@kekkonen.localdomain>
In-Reply-To: <aZyNErXB_acR3yYq@kekkonen.localdomain>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 23 Feb 2026 18:46:38 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0ibXKiUNf5Fvj=q=f9JbHT=w3j3h=33ri_awzEHm_dBng@mail.gmail.com>
X-Gm-Features: AaiRm52BHYNejRlIW4MdwAWerx8BNv8zmwaIDweVIu1LcRtEBbkHGLfTRmgAa2A
Message-ID: <CAJZ5v0ibXKiUNf5Fvj=q=f9JbHT=w3j3h=33ri_awzEHm_dBng@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpiolib: match secondary fwnode too in gpio_device_find_by_fwnode()
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Len Brown <lenb@kernel.org>, 
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32058-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linuxfoundation.org,kernel.org,gmail.com,linux.intel.com,lists.linux.dev,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: 83C4817B06A
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 6:23=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Bartosz,
>
> Thanks for the patch.
>
> On Mon, Feb 23, 2026 at 04:40:53PM +0100, Bartosz Golaszewski wrote:
> > In GPIOLIB, during fwnode lookup, after having resolved the consumer's
> > reference to a specific fwnode, we only match it against the primary
> > node of the controllers. Let's extend that to also the secondary node b=
y
> > reworking gpio_chip_match_by_fwnode()
> >
> > Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
> > ---
> >  drivers/gpio/gpiolib.c | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index c52200eaaaff82b12f22dd1ee8459bdd8ec10d81..7fe1d9ab1281d6c5022b9bd=
d8909fef2cb74122e 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/errno.h>
> >  #include <linux/file.h>
> >  #include <linux/fs.h>
> > +#include <linux/fwnode.h>
> >  #include <linux/idr.h>
> >  #include <linux/interrupt.h>
> >  #include <linux/irq.h>
> > @@ -1395,7 +1396,16 @@ EXPORT_SYMBOL_GPL(gpio_device_find_by_label);
> >
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
>
> Could device_match_fwnode() match secondary fwnode as well?

In the previous discussion on this, Andy was against doing that due to
the concern that it might introduce subtle bugs, which I agree with.

