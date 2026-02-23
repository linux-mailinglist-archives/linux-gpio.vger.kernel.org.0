Return-Path: <linux-gpio+bounces-32050-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4ArcBkx8nGm6IQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32050-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 17:11:56 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9E8179720
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 17:11:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 317A630C91C6
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 16:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D23B30F94B;
	Mon, 23 Feb 2026 16:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nGe54xrw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2ABA304BDA
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 16:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771862435; cv=none; b=bS9Jyep19Z+V4fiEe5EMbLPFAqVJPIKLdC782XOXSDAYlBJ1j60L3yJb948JH4K5u1vxq24bdKPzYc9qzYy//N1xXNGZNcb2/0gJsu+89t/+ImEHewB4UaFoGps9qiuL9c5YJxYj8DrzLGB5Qqou9bTrSRdcYJZI47UIJB+qoxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771862435; c=relaxed/simple;
	bh=EstmXOsompBSlyg7uWOQ8eWvFFkyH0qpqEJz+d2SKUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VnyMXnqKF8XGSlSdW/8JcxNShQ7/PbizHS09OfSC8TQM4Nm7JXQ0NwuFyoO936+SmLKmBc7G4sZUHYPjT2l06E54eNUHq7vUQSZbPPap1obom/yYxDDNvaQrVL3HpYsakMyJEzsG+dUAMqYl/b99d7JRhHmPoLOyGYGxah06mX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nGe54xrw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEB05C19423
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 16:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771862434;
	bh=EstmXOsompBSlyg7uWOQ8eWvFFkyH0qpqEJz+d2SKUU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nGe54xrw35oEsbsLputQfSHXX7wKHjNsbJAOL6IzBD4mF066MA6zEOV8kyjcVrijA
	 ma0jETT4xEKUaMvqBC0A1fG1USw0MT5Id9oaJi9kTuJoeFycqxEfqvPXUhmGVUF8Mx
	 UkB+hONE8Jf6ljY2SX5nZQpARy+ve55xJZ9bLS2Kx5mCDWSzhmilfg6X5gkKdAByeW
	 xLNYaEwFRbqNnioypbvVhEJHJzzXWYorAg6sAxLiMa42Msx0SpTWGUA7ado/FnyVhn
	 EM48QAdfEG/LUg7eREwPK9v5Si+4WpDIbKwCcCL7uRaIx8QSBu3atDiAFRRlYQZkJx
	 HRoC633IgcxwQ==
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-40fb2789476so4605339fac.1
        for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 08:00:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXLT0w1oRDfy99P5+ZuhVderBtb2Yc/0I/J1hBuSITk9dfRPEMmp2nQdBAjLxr+KQXFBdNZlNjckTfe@vger.kernel.org
X-Gm-Message-State: AOJu0YwuJPnal47juJrXkOt1JS5DYq/0vStyeb1jb1N+TG/Sz4Vzc1es
	a3Y07b7aFkpf6Hp/4XeLqZmqi1vHH2bBpPUVydocNR7iMftno2Tk+NNMeTtg66rKR8bzlgCN8iR
	Jj75y/ORFUetQ0q0J4lrii7m41TiAbRI=
X-Received: by 2002:a05:6870:824c:b0:40e:f203:eb4d with SMTP id
 586e51a60fabf-4154539eb81mr7760671fac.2.1771862433404; Mon, 23 Feb 2026
 08:00:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-device-match-secondary-fwnode-v2-0-966c00c9eeeb@oss.qualcomm.com>
 <CAMRc=MeD6rMQ2dU2mjS36=i3eXSs2HVG+qgAL3rsuvpQL0nCsQ@mail.gmail.com>
In-Reply-To: <CAMRc=MeD6rMQ2dU2mjS36=i3eXSs2HVG+qgAL3rsuvpQL0nCsQ@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 23 Feb 2026 17:00:22 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0j+DuaDcZ7N2gh1mbrYvgNSBDtmhmSEsw8Y=yFvW16iow@mail.gmail.com>
X-Gm-Features: AaiRm51Sk5zSDw10OTJvpIzbnWzryvjP6Hmt7k5VN_hzFAPM7iZFp8x-QaBqi10
Message-ID: <CAJZ5v0j+DuaDcZ7N2gh1mbrYvgNSBDtmhmSEsw8Y=yFvW16iow@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] driver core: provide and use device_match_fwnode_ext()
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Len Brown <lenb@kernel.org>, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,gmail.com,linux.intel.com,lists.linux.dev,vger.kernel.org,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32050-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 8B9E8179720
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 4:46=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Mon, Feb 23, 2026 at 4:41=E2=80=AFPM Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com> wrote:
> >
> > In GPIOLIB, during fwnode lookup, after having resolved the consumer's
> > reference to a specific fwnode, we only match it against the primary
> > node of the controllers. Let's extend that to also the secondary node b=
y
> > exposing fwnode_is_primary() to drivers and reworking
> > gpio_chip_match_by_fwnode().
> >
> > Link: https://lore.kernel.org/all/aZUIFiOYt6GOlDQx@google.com/
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
> > ---
>
> Forgot to pick up Linus' R-b:
>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
>
> Rafael: is it fine if I take it through the GPIO tree?

Sure, no problem.

