Return-Path: <linux-gpio+bounces-34625-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCGDOY1sz2nAwAYAu9opvQ
	(envelope-from <linux-gpio+bounces-34625-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 09:30:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 807FC391C07
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 09:30:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42D6330417AB
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Apr 2026 07:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45B8C378D92;
	Fri,  3 Apr 2026 07:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ufuE3aPG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B68377009
	for <linux-gpio@vger.kernel.org>; Fri,  3 Apr 2026 07:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775201392; cv=none; b=mHImeTXF6JIU1lrqo44RK1JMRR6Wg7Qp4nMWNPi3Ps272zYDruTod4CVHtGDfFMjTR68E51tAnXRJcQjhPXYR7GW1g7c/Oe7ovro8Rrxst7xxyybE7mcsyVxYhaCb2bDjKFvMasB73UnPzoiDyTOsydVGetyQ/oCxYa5zc5NOtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775201392; c=relaxed/simple;
	bh=o+bZHsTAqtziXuBsNd+plTbXRxbHoO6NC5HHzgU3PU4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iuMlUu3RUXSOD4fOy4pz2KAaLDsbEyEkHqxxM1Ip0aZ5J5Z9MeEPtne6hbfn5bTcpBi7/YVZq/Han4SJrRJFfHnx1KL7xaGRNq/WMUUAiB5B9agpjsW+YtnzTseiA5cd81W/sn7WFmP3i7VD2AlrwZChB59GcaPcCRtFIHTriC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ufuE3aPG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D026CC2BCF4
	for <linux-gpio@vger.kernel.org>; Fri,  3 Apr 2026 07:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775201391;
	bh=o+bZHsTAqtziXuBsNd+plTbXRxbHoO6NC5HHzgU3PU4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ufuE3aPGGnvRozgJelrUuR+95zug3LqzWGJlK/3JEpBBP2rD21IpOrQCkkZ/TwHgv
	 eDGPCaR7uV+RUHq63WzzHRu1al+HFhHwyPpIGo1fuDvxpKsDNvey9fq2fJRJR6gmG4
	 J3yGQkpZPuhN91xooONIt7qurzA3dHDlm/zYFEWWzeYyuVDN1jOrJX7Gi6XrSzQbOy
	 LtDnjlMTWhRo5O0utkp+eVHf0R54xF5OIfGqDcIYJoSYgGUTAlwzKvbAnjvIOyWik2
	 zdfKPrSHOoBNyiUjq7YkwOBI/1SqN8Aunqt5wKSRxed7Vng3frebRps4X8bJ2vQbPD
	 j0REPppOrJiMg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a12cd0bd79so1965395e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 03 Apr 2026 00:29:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4zppxTESXZGir6Rh785j2VLjqYNAU8r+EufcRspjkOb1tkPzrLDwdvXW7Nl2PRqQIDC7e+hpGYKEA@vger.kernel.org
X-Gm-Message-State: AOJu0YyhjGB+6/+QTXI9fX0P2mBq/gWDJxmVfQWnqXnJxqHtBCAMPOzq
	DOtMkE7P2ZtNUrjibuFO6qF2IfkxHQ1InZ/0QcxUFgrE1knvrSEpnI4mHYPh1g+GueYXGARK8DR
	5re2QRsqO5mVWMCApkctfH/zQ8gPt+f5xS/XkhXl9Yg==
X-Received: by 2002:a05:6512:b82:b0:5a2:c409:8ed3 with SMTP id
 2adb3069b0e04-5a3377823bcmr620861e87.40.1775201390408; Fri, 03 Apr 2026
 00:29:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402-baytrail-real-swnode-v2-0-6f5054a4cc07@oss.qualcomm.com>
 <20260402-baytrail-real-swnode-v2-1-6f5054a4cc07@oss.qualcomm.com>
 <ac5wprh9vfTU5pGa@ashevche-desk.local> <ac7UqTsPC8yUooAR@google.com>
In-Reply-To: <ac7UqTsPC8yUooAR@google.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 3 Apr 2026 09:29:38 +0200
X-Gmail-Original-Message-ID: <CAMRc=Mcq-T=4fnGTWXzEBjfiPaZLGw4HVAuOm48v-5Uf++K5xg@mail.gmail.com>
X-Gm-Features: AQROBzCzQrtkyxRFQGk9CJN4liBRk5TYi19gtZVgUqX_Bqb_Om8xmXeCvKqn5jE
Message-ID: <CAMRc=Mcq-T=4fnGTWXzEBjfiPaZLGw4HVAuOm48v-5Uf++K5xg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] software node: return -ENXIO when referenced
 swnode is not registered yet
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34625-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linux.intel.com,oss.qualcomm.com,gmail.com,linuxfoundation.org,kernel.org,vger.kernel.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 807FC391C07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 2, 2026 at 10:43=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Thu, Apr 02, 2026 at 04:35:34PM +0300, Andy Shevchenko wrote:
> > On Thu, Apr 02, 2026 at 02:54:26PM +0200, Bartosz Golaszewski wrote:
> > > It's possible that at the time of resolving a reference to a remote
> > > software node, the node we know exists is not yet registered as a ful=
l
> > > firmware node. We currently return -ENOENT in this case but the same
> > > error code is also returned in some other cases, like the reference
> > > property with given name not existing in the property list of the loc=
al
> > > software node.
> > >
> > > It makes sense to let users know that we're dealing with an unregiste=
red
> > > software node so that they can defer probe - the situation is somewha=
t
> > > similar to there existing a firmware node to which no device is bound
> > > yet - which is valid grounds for probe deferral. To that end: use -EN=
XIO
> > > which stands for "No such device or address".
> >
> > This error code is also too generic to my taste. What about alternative=
(s)?
> > EADDRNOTAVAIL
> > ENOTCONN
> >
> > (The brief grep shows that the second one might suit slightly better th=
an the
> >  first one by existing use cases.)
>
> We are in the core of the driver core. Why not simply use -EPROBE_DEFER
> to which all users will resolve this error to and call it a day?
>

Because -EPROBE_DEFER only makes sense in probe() context, while
fwnode_get_reference_args() may be called in many other situations. I
think ENOTCONN as "not connected" makes sense, though the string
representation says: "Transport endpoint is not connected" which
doesn't spell out quite the same thing.

Bart

