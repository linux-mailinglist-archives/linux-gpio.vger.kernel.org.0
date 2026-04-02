Return-Path: <linux-gpio+bounces-34595-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aK7DG3aFzmnfoAYAu9opvQ
	(envelope-from <linux-gpio+bounces-34595-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 17:04:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C65738AFA0
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 17:04:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3B6453023F6E
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2026 15:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E409F3F0748;
	Thu,  2 Apr 2026 15:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TAzaKBk5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74ED207DF7
	for <linux-gpio@vger.kernel.org>; Thu,  2 Apr 2026 15:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775142204; cv=none; b=mU4RDtXjHjGe83QZ5np9RvG1zxnoEGwPRlwOVY1Rpsdf1XIJpcPZbqwvq8KZ8/KNJwhLhYX42DhPc80U88kHepVTHG4A/sCwjhz/6K+Os6V68Xa0I9sSB1aogoS6TsNuUxroo+XJ63Y4yVJDf9JqTNQwPGUY/IoMoOAMg6X25N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775142204; c=relaxed/simple;
	bh=F4zhH6M3sP6/pIp7gAJGXFdabfzYRh9hex7KTF1/hgk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PKrsnmWRdOv+S+0QHDLK2Ef0+sb6P67ejxAntRPckekceFC3T/pzJAu+dEa53FOc0Q87IrW67rJkCMv+26ulTo8wIP0tkypjznWnmgO5c/A0ojXDvvaG6q60i7XDPwH0cXpGl9U7te2+cs23RLososIBjZSSLyyoDtDNSbQyTvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TAzaKBk5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 884B8C2BCC6
	for <linux-gpio@vger.kernel.org>; Thu,  2 Apr 2026 15:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775142204;
	bh=F4zhH6M3sP6/pIp7gAJGXFdabfzYRh9hex7KTF1/hgk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TAzaKBk5bQHEBAnoDbUHErPGXZrqeqWseRisq+qBPxAXpmtjCa/Es6/BTjCHNfocR
	 XE0tH+MhdOYS5aqtuArK6aR4Ho7A/XpMrvpI8i0bz7uUIn6PbsJ3DAigAc1iMCTu0k
	 v0M3NLt3KBRYEgupn6ici5UJ18Zqf9r3QCP5lR9vOUGq1MBGyC3hMf+o/beD+76xKa
	 yFZDW5tbw4inyMJwlcwAYvzaO2RxtTIXXUBWsPVQEyVOlp2Kg5g0yDdemO7O00G5oJ
	 /Xeg6GQoCrTPJvnqZ8dqelftFEBREBcy5ftGuZrnev05C+vlBNcXUMWyM+d4EmmSqE
	 lEy6KOHRLFiWw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a2c9932781so764013e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 02 Apr 2026 08:03:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUZwJ5v/JZ0/bCDrd8LzO0CdtwtCIKDl1MWWjQyOqZxgcaPNBZWqSHzeNtrPOd3jxBs4KceUdmFgZhu@vger.kernel.org
X-Gm-Message-State: AOJu0Yybz+inkqlm2HqnbBzO0ZglX5sNFWln+RstzFppbt8jyZ7Ux1+k
	lgSxulZ50xiBWM3jq0bUQZ8VRrwI+GUQfKrpPXupcYqssPlR7/YNKmTmVsPyDtbfSOlsamuIW1P
	W6HuF8UMwUan0aW4IBlbHgMvDsMmHs9ayS4PbsMfiSQ==
X-Received: by 2002:a05:6512:3d9e:b0:5a2:c66a:d6d1 with SMTP id
 2adb3069b0e04-5a2c8d78c78mr1121944e87.6.1775142202973; Thu, 02 Apr 2026
 08:03:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402-baytrail-real-swnode-v2-0-6f5054a4cc07@oss.qualcomm.com>
 <ac5t5XozmzN9oq96@ashevche-desk.local> <CAMRc=McR+S9LCHmDjAS6Wn=SrNvq5Ojr-w1qeLsGNJ+L39pbrw@mail.gmail.com>
 <ac5zhZAyiwbUwzWo@ashevche-desk.local>
In-Reply-To: <ac5zhZAyiwbUwzWo@ashevche-desk.local>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 2 Apr 2026 17:03:10 +0200
X-Gmail-Original-Message-ID: <CAMRc=McJFNp15jnrehGLHsmFRfBpRQoppmdB_51whzJUQ-5ZLw@mail.gmail.com>
X-Gm-Features: AQROBzC8kXfF8m1woyIDTDDAIkrV3H5UZACDhpRJ_7Yt9ZM71rXQFfvjqh5OmSk
Message-ID: <CAMRc=McJFNp15jnrehGLHsmFRfBpRQoppmdB_51whzJUQ-5ZLw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] platform/x86: x86-android-tablets: use real
 firmware node references with intel drivers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34595-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,gmail.com,linux.intel.com,linuxfoundation.org,kernel.org,vger.kernel.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 7C65738AFA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 2, 2026 at 3:47=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Apr 02, 2026 at 03:35:24PM +0200, Bartosz Golaszewski wrote:
> > On Thu, Apr 2, 2026 at 3:23=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > > 3. Export the acpi_bus_type symbol. It's already available in the
> > > > acpi_bus.h header but it's not available to loadable modules.
> > >
> > > Nowadays we don't do that but export the dev_is_acpi() or something s=
imilar if
> > > it's not yet available and to_acpi_dev(). (Names are derived from the=
 existing
> > > pattern, they might be need to be adjusted, dunno.) See how PNP does =
that.
> > > Note, I haven't read the patches yet, just a quick comment.
> >
> > Maybe I should have said why I do it. It's to register a notifier call
> > on ACPI bus events. Is there a better way to do this?
>
> AFAIU there shouldn't be pure ACPI devices, they are companions to the re=
al
> ones. Can we simply attach to the normal device notifier and check if the
> companion is what we are looking for? Also since it's specific to that dr=
iver
> and you know what the platforms you are looking for, why can't we hook
> something into drivers/acpi/x86/lpss.c?
>

The ACPI companions seem to only ever be added once and never removed
- unlike platform devices. This is why I prefer to check the ACPI bus.

As for lpss.c - what do you sugest exactly because at first glance I'm
not quite sure what's there to hook up?

Bart

