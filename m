Return-Path: <linux-gpio+bounces-34036-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YC8ECA5mwWlQSwQAu9opvQ
	(envelope-from <linux-gpio+bounces-34036-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 17:10:54 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93ACB2F7AC8
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 17:10:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7444E314407C
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 15:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 219A73C13F1;
	Mon, 23 Mar 2026 15:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r0YiaRoJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87963BA235
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 15:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774279732; cv=none; b=hgTna+k9VIra1FzCzPsHS7guK2BCVHUuJ+XkMFxfF/3J0a2t5+IgFhj63u5oiJC6mslrjf2xiR2RVic1r8lKqdqwFHRbj+6A8VQKuBBwpPniHG1aolRIrFXXVth9oBmU8XXWXDZlbSNG1AGb6d09Kui/XbqjS6ArhnZTtZC/+Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774279732; c=relaxed/simple;
	bh=IWDr2AzFuesiBMOrzgJX4wQPp9NGolKM7dspV01aC9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tB2KcqIz1/KYT/i4WrwkrAGlMYgiBy0FDWHNzi8UT+zHXRL/BOzswrDkG7wWCnPF0/W/yD7yWGC0rj46xKPOFW1d4vopqh34RwZwOOWQw3GxQ6wo0GWD1K2kj6wrwkHhK9rtdJyMCyL9TCsjEwxaZP7GAdwr1iZhpS+qtqTYqAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r0YiaRoJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B077C4AF12
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 15:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774279732;
	bh=IWDr2AzFuesiBMOrzgJX4wQPp9NGolKM7dspV01aC9o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=r0YiaRoJDmhsl6QGmGO+bFxgDg1169wOWknkL4GHVkEkkksMIw+X9REekKzaSwH0s
	 e9T0Ei34l+exXpdCJIv/6Ngs5xyqwi1oe91Fe8QpqeloIzH5aD60vTttJFa2UvQ0yu
	 vMmUp0+ujQtf4Phb9r6J0yFNbYOL0OllGoXbcs8+OoafmjHUayIJUsJys8wY5RHTVP
	 itQUkGGPs4Jtmtx1OKC7hxk3rg+vw9tsem472ctY4t3ymnEdVhTHXXyCXAWm6eaHvM
	 t5Ja/ags4IS3FLfuqQWky+8loUH8NtuUW9x+/PNYXnEJOiW44bqgX8kLjAkTpn9fBh
	 JYuTcRfzv2+fg==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38704f70ea3so35840361fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 08:28:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVVJraEY5FqoteJ+q+InsrgCkIpdfLvMVG6z3S+LdOWlhHF32DqT5xgGaU5LZlXmlTD3cHSlH1JsCRy@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5dEiF4UJARqYDpEbcJ9bA0fX22gbR7SQzwJNs+dcm3Tkh3pQE
	Pc676HAfO2NJ9SiOAbh69qrzbZ2zutGOaI7fvMxgNFG35OB39O5cF7bCGOQDVKbC9LhTEueROPS
	+CZj9Aimh2g1wBYkX+rQMVX+cp2nNENnpDNs4S9hdSg==
X-Received: by 2002:a2e:be11:0:b0:38a:5584:cea2 with SMTP id
 38308e7fff4ca-38bf95f27admr41174131fa.3.1774279731307; Mon, 23 Mar 2026
 08:28:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319-baytrail-real-swnode-v1-0-75f2264ae49f@oss.qualcomm.com>
 <20260319-baytrail-real-swnode-v1-2-75f2264ae49f@oss.qualcomm.com> <ab0jmUZGOKSjOa8C@ashevche-desk.local>
In-Reply-To: <ab0jmUZGOKSjOa8C@ashevche-desk.local>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 23 Mar 2026 16:28:39 +0100
X-Gmail-Original-Message-ID: <CAMRc=MdWxgGftNQgs8d-0xqsfgJSSncfBf+7cmWSSypu2rQrmg@mail.gmail.com>
X-Gm-Features: AaiRm51ic1Qtd8VygdgEg9ggHSh2YPnzIUzs547kDo9m-IYHEE0JkRQaceYSUno
Message-ID: <CAMRc=MdWxgGftNQgs8d-0xqsfgJSSncfBf+7cmWSSypu2rQrmg@mail.gmail.com>
Subject: Re: [PATCH 2/4] pinctrl: intel: expose software nodes for baytrail
 GPIO devices
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34036-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,gmail.com,linux.intel.com,linuxfoundation.org,kernel.org,vger.kernel.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 93ACB2F7AC8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 11:39=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Mar 19, 2026 at 05:10:55PM +0100, Bartosz Golaszewski wrote:
> > Use the new automatic secondary fwnode API to ensure that when the
> > baytrail pinctrl device is added to the platform bus, the static
> > software node provided for drivers not able to use ACPI will get
> > automatically assigned as the secondary fwnode of the primary ACPI node=
.
> >
> > Create a new header under linux/pinctrl/ containing intel-specific
> > symbols and declare the new variables there.
>
> As I read the code, this doesn't need to be part of drivers/pinctrl/intel=
/.
> I.o.w. I am unable to see why we need to penetrate the certain pinctrl
> driver for this.
>

If old board files were an analogy, the kind of information software
nodes carry would live neither in the provider module nor in the
consumer driver. It would be defined in a third place - the board
file. Do we need something like this or should this logic be invoked
from the x86 platform driver that uses these GPIOs but accesses them
via the swnode lookup?

> ...
>
> >  static int __init byt_gpio_init(void)
> >  {
> > -     return platform_driver_register(&byt_gpio_driver);
> > +     int ret;
> > +
> > +     ret =3D software_node_register_auto_secondary(&byt_auto_secondary=
);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D platform_driver_register(&byt_gpio_driver);
> > +     if (ret)
> > +             software_node_unregister_auto_secondary(&byt_auto_seconda=
ry);
> > +
> > +     return ret;
> >  }
>
> This hack can be done in similar way on how we do ACPI LPSS for those
> platforms, i.e. in drivers/acpi/x86/lpss.c. No?
>

Hey, this is not a hack! I'm coming up with a generic solution here. :)

It already is similar in that it uses a notifier. For v2 howevere, I
want to propose a mechanism for having multiple ways of matching real
fwnodes with software nodes.

Bart

