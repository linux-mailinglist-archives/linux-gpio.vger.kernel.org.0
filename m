Return-Path: <linux-gpio+bounces-35556-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KP3DEfxJ72lO/wAAu9opvQ
	(envelope-from <linux-gpio+bounces-35556-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 13:35:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C8280471D2C
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 13:35:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5FECE3013A75
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 11:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF53F3B19AC;
	Mon, 27 Apr 2026 11:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tSvWRqAj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F6130DEA6
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 11:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777289449; cv=none; b=CDiVAa6T3yxAkZJXCvpfVEL3hnSPDtWoo6q6qduedKEPEdzroS6QAMbT8xkUHBKXC2QsfEM8A9QVH9QD1lBrk/uTkIB1s55p7q6WeTnvKNTY95mBvKwszIfwDp78vHKOwfMFpCPez1KcnrKRIKrNHPxQunnUzViIK4uCPMzKdNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777289449; c=relaxed/simple;
	bh=uuhq7sA60Gqf+d9o89HegPUXAaIeJCCjhTAYQjVkdZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fOaP95iA6A+8VTbaTEnh8IdFhwLGUixGoDccMQ41aNlEM3JB7UVKCz/NFn40exhzQt25//uRRuZYwGe1jYig+hEj4wfQ5dYpXZ2EaYXsHrebXWn3FtWtUuQK/d7x4/k8woIdqXnn2oadseiK8I3vfJfYAsekmijx0NWFPv4xxSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tSvWRqAj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75DFFC2BCFB
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 11:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777289449;
	bh=uuhq7sA60Gqf+d9o89HegPUXAaIeJCCjhTAYQjVkdZw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tSvWRqAjQZPnE18tS/WSED4tXggK1kOvZF2lng31Vexe4UnmzFi/U/s5xZVxWMc0L
	 M2PKVyk3iwd02FqluEWz+50hjpy6fL64GWROhU7zNqTwSRP9fdxHiBd4doWfvq7e3P
	 8ERgmh4JvUYQ9P2GKx6t/D74EDZ2fdnEWoxZLGCBTMHQ+y/9F/5lxok3CJn7DElNQH
	 30LGawrLnyQHTjC+emfAAyLM5MWXgJNPiKrGJoeoRlNHu1b6nbtCoPGaPqBMFuoGXl
	 BBYt79Ea1YhGM2NXSDJSranc3rlxJ5d0gJzevFkGmMoHif+q6i0o8YiYELxYFZYcFO
	 6O9r8OwtZnPtQ==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38e68e4389cso105313001fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 04:30:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/0b0nCNsZpZIc6Be9Y/31poMKLrulZeLS2UbQwycsTSlnTZkV2iSOw7yfQMBx1EKFr57NSjMC0Wz9D@vger.kernel.org
X-Gm-Message-State: AOJu0Ywci0CPII1SDBRnaOZ607i7WowzKLYamt0bJoOs7Sx+EW7yEQP1
	FCBly+uPMqqog7iGnXOldkEY9I3Jj9LSaKYa3BCSJSuo/K+L9QUdTsxtkX/DhJ0v7qdoACcTVzU
	YPgAbW64ps6KOvNnZLnHMiP4gbvgeTOwzL0GjPWpijA==
X-Received: by 2002:a05:651c:41d7:b0:38c:6b42:3d77 with SMTP id
 38308e7fff4ca-38ec780c22bmr131866391fa.2.1777289447975; Mon, 27 Apr 2026
 04:30:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402-baytrail-real-swnode-v2-0-6f5054a4cc07@oss.qualcomm.com>
 <20260402-baytrail-real-swnode-v2-4-6f5054a4cc07@oss.qualcomm.com> <CAJZ5v0iwfZPcFtM7Jv29bXFmh3zN0OaG9UfNY5iC5RpzRzp07w@mail.gmail.com>
In-Reply-To: <CAJZ5v0iwfZPcFtM7Jv29bXFmh3zN0OaG9UfNY5iC5RpzRzp07w@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 27 Apr 2026 13:30:35 +0200
X-Gmail-Original-Message-ID: <CAMRc=MdU7RPefrq48+UwNZRZyY15xaVJxGPtgTkb=kormDid+w@mail.gmail.com>
X-Gm-Features: AVHnY4JlotpDuyz8EzI3eJfkgs-1h8ebDHBxv3BtsLxXORU4YbE7QcSHGar9q8k
Message-ID: <CAMRc=MdU7RPefrq48+UwNZRZyY15xaVJxGPtgTkb=kormDid+w@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] platform/x86: x86-android-tablets: enable fwnode
 matching of GPIO chips
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: C8280471D2C
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-35556-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.intel.com,gmail.com,linuxfoundation.org,kernel.org,vger.kernel.org,lists.linux.dev];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Sat, Apr 4, 2026 at 8:25=E2=80=AFPM Rafael J. Wysocki <rafael@kernel.org=
> wrote:
>
> > +
> > +static void auto_secondary_unregister_notifier(void *data)
> > +{
> > +       struct notifier_block *nb =3D data;
> > +
> > +       bus_unregister_notifier(&acpi_bus_type, nb);
> > +}
>
> Instead of exporting acpi_bus_type in the previous patch and defining
> this function here, can you define
>
> void acpi_bus_unregister_notifier(void *data)
> {
>        struct notifier_block *nb =3D data;
>
>        bus_unregister_notifier(&acpi_bus_type, nb);
> }
>
> in the previous patch and use it here?
>

Not really because we still need to call bus_find_device_by_name(). I
think it's better to just export this one symbol than to add three new
ones.

Bart

