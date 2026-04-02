Return-Path: <linux-gpio+bounces-34598-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Cl3LOeXzmkBowYAu9opvQ
	(envelope-from <linux-gpio+bounces-34598-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 18:23:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FFC38BCA9
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 18:23:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D82C30E8963
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2026 16:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6824B3EF0D1;
	Thu,  2 Apr 2026 16:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dGIco+41"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AEF3EE1E2
	for <linux-gpio@vger.kernel.org>; Thu,  2 Apr 2026 16:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775146432; cv=none; b=mKVc7hlFuiZDS0u7IkDYcqLpU1Ifzr/DMvoll8uWnNh2NmzwDeD7de/RZTPWkjf9NStwi3j3aZANWg6w1OYKBYIMb8wIiv2zPZmZAhMsFQY+NH5XnIbEZ0PdLkFwTt8+0VohsS9zzWIkllb7wvZcWbejTSPG315BMBoqWGHzk5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775146432; c=relaxed/simple;
	bh=bpaXyBJBrSPrLBRgiqnTKWHLNSU7a6K1w3cRWPI1mpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ESriRXtivKhIDODqxEn/bz/r75OcOKuWBxqpSqZME2NITT/86phw4OYWwmklKKNFVv/HX2V3yk89Iu9UfXIHemrOSk04XRm3e4yelXD0DUMqTmVUHR2oiLpkZiKYvHnRy05HHlB6zWXDjn/45e5Q5j41CDyUoGuH+S8rDr5MAHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dGIco+41; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0D99C19423
	for <linux-gpio@vger.kernel.org>; Thu,  2 Apr 2026 16:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775146431;
	bh=bpaXyBJBrSPrLBRgiqnTKWHLNSU7a6K1w3cRWPI1mpY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dGIco+41JQlUDDBpxGVO8r3l8xsVxmeFyWBiLQAcSbxWR6u9A/dwvNR1icSZT8O0k
	 9BCnn5OqYR6vI3tLqkKf0N9LegwvWz1A7dN+0cWFRjIcmctxsfP0bawL/xRcZBMR9Z
	 2vhZr4OpEc8HLiZZkjoeCNTSfBMMO+R2NCn3l2hy0qyFmaT8+xqJmShIEdUesUzL3w
	 d5IKYjUzYZOrWsQ3s6PqF4rlV/l3yOSQR7v8/1il/kphvyrrZxq9GmYchB/1a+2q8K
	 S7C06gtmCWokRfWDBDDJJKk/I70gKSyz7GxkNBF010dCI1L2hGPPzhGDEDd7rKGmN7
	 r74/LsvRz9kiw==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59e5aa4ca41so1271339e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 02 Apr 2026 09:13:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUCIySx2qfEYuhajqLLsWjsFa85DZPhgO5zI0TQvyaOpWAwByWKr1EDBxa3/UdgeJ4B8PCHkptCtyAG@vger.kernel.org
X-Gm-Message-State: AOJu0YyZLwwjFDaSDbcJcBJjWGeK5AN4sr9NZxKjJmOjFjhGRQytMoZg
	WvKVCDxaaMuAoUCbv3FZFdOsbxUfgWpZo6Ef0wQCEunvGpXZvbwZK7hgD7BTQ7mPDbqGvAiChoD
	ddcgDqVep/kCWzDwD0YG7uoPyARNAkh9JKpinuLc3wg==
X-Received: by 2002:a05:6512:2245:b0:5a2:aa9e:514a with SMTP id
 2adb3069b0e04-5a2c765207dmr1397100e87.17.1775146430480; Thu, 02 Apr 2026
 09:13:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402-baytrail-real-swnode-v2-0-6f5054a4cc07@oss.qualcomm.com>
 <ac5t5XozmzN9oq96@ashevche-desk.local> <CAMRc=McR+S9LCHmDjAS6Wn=SrNvq5Ojr-w1qeLsGNJ+L39pbrw@mail.gmail.com>
 <ac5zhZAyiwbUwzWo@ashevche-desk.local> <CAMRc=McJFNp15jnrehGLHsmFRfBpRQoppmdB_51whzJUQ-5ZLw@mail.gmail.com>
 <ac6TwAL3fQrlpef2@ashevche-desk.local>
In-Reply-To: <ac6TwAL3fQrlpef2@ashevche-desk.local>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 2 Apr 2026 18:13:38 +0200
X-Gmail-Original-Message-ID: <CAMRc=MdPfOB+xbHxP5rRfLmQ7Ue++Kb8iWaMU5hMZ6OvFqa01w@mail.gmail.com>
X-Gm-Features: AQROBzDN--nJ03boWyopMUzSWNi-MrmE5jIFWCIeUFh6oEYVAABzLEK7KpFiZoA
Message-ID: <CAMRc=MdPfOB+xbHxP5rRfLmQ7Ue++Kb8iWaMU5hMZ6OvFqa01w@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,gmail.com,linux.intel.com,linuxfoundation.org,kernel.org,vger.kernel.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34598-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_TWELVE(0.00)[20];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 12FFC38BCA9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 2, 2026 at 6:05=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Apr 02, 2026 at 05:03:10PM +0200, Bartosz Golaszewski wrote:
> > On Thu, Apr 2, 2026 at 3:47=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Apr 02, 2026 at 03:35:24PM +0200, Bartosz Golaszewski wrote:
> > > > On Thu, Apr 2, 2026 at 3:23=E2=80=AFPM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
>
> ...
>
> > > > > > 3. Export the acpi_bus_type symbol. It's already available in t=
he
> > > > > > acpi_bus.h header but it's not available to loadable modules.
> > > > >
> > > > > Nowadays we don't do that but export the dev_is_acpi() or somethi=
ng similar if
> > > > > it's not yet available and to_acpi_dev(). (Names are derived from=
 the existing
> > > > > pattern, they might be need to be adjusted, dunno.) See how PNP d=
oes that.
> > > > > Note, I haven't read the patches yet, just a quick comment.
> > > >
> > > > Maybe I should have said why I do it. It's to register a notifier c=
all
> > > > on ACPI bus events. Is there a better way to do this?
> > >
> > > AFAIU there shouldn't be pure ACPI devices, they are companions to th=
e real
> > > ones. Can we simply attach to the normal device notifier and check if=
 the
> > > companion is what we are looking for? Also since it's specific to tha=
t driver
> > > and you know what the platforms you are looking for, why can't we hoo=
k
> > > something into drivers/acpi/x86/lpss.c?
> >
> > The ACPI companions seem to only ever be added once and never removed
> > - unlike platform devices. This is why I prefer to check the ACPI bus.
> >
> > As for lpss.c - what do you sugest exactly because at first glance I'm
> > not quite sure what's there to hook up?
>
> Can't we create / submit the software node of the given device (GPIO)
> when it's get created (as platform device)? That driver uses a notificati=
on
> when ACPI bus is scanned, that's what may trigger the software node creat=
ion
> and the other end will eventually see it.
>

Yeah that would be awesome but you still need to export these software
nodes to the x86-android-tablets driver. I think it's better to keep
them in the driver as it's the only user and it's unlikely there'll be
more similar cases.

Bart

