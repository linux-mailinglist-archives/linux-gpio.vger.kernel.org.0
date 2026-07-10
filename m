Return-Path: <linux-gpio+bounces-39857-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OSvvKWNTUWpwCQMAu9opvQ
	(envelope-from <linux-gpio+bounces-39857-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 22:17:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3560F73E0C2
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 22:17:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=hqJ8lWyf;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39857-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39857-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4759C3013D4F
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 20:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88239378D9A;
	Fri, 10 Jul 2026 20:17:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5486234A76F
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 20:17:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783714633; cv=none; b=gQX7svX7gjzfudE2WK8nXKNtapeLCGt1AETIwIy90HGu8t+08qYtjdm99xX42GdRg2Ft+UaZvtEKDlBd+Arr7TrBdzbaDUkz9NvrlNgnHrYf06YjT3OwopBSYDevx4cKFwI2XmRiaElKUe6arQulG4OyJnkDelEJK99Ih1TnPnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783714633; c=relaxed/simple;
	bh=tQPbVbfxwect0GU4Sdbz+MR0Fwi568qtnWkuB9xn3nI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CNxASSHfGI//8X+XYsoYmd6RQ8eK3ut/xtrx46ppfS+DQxmU+8ASfHVlswDHu0wQ3OxNvNY5MtQYoF7bFhT4wHTEFhhRwZRzznHc4IoODnGblTiByW/E1ArSrfUxdZcv+DOovFVgMjVZL1u/roK46ryKTBT9uarUXgP6UGil1Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hqJ8lWyf; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED3071F00A3D
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 20:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783714632;
	bh=kVxn3DZhdGrpJ7FFDLro7VI16MvBN6YAJO3dopkK6bE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hqJ8lWyflEMUTaA05MQHqxhXHJbMt/h5NVA4XggKhXokhzA8ZPwyOy57BCSBgu8dW
	 +xndV5LXUS7JG13edZsln3kRg3qMXz4Ca9KR/ZbIoeBMoZuja4MWVDwuVaJRAk9TBz
	 4XUTPiJwY2HJrd2TZ7OWTxNgUivRM42+roYEUuvJv1M4JHbYqryI7efPEHqNctroeH
	 g2CLNP3kOM0Y1P9+qLI6CNk3J0R6Gc6XD8SHnEUQ1e2IYcbHS2OTD+e8SytlsaFVio
	 qz1UqZb3uMnVmI2OPikF+86czrAll6ItDC0x5OkCYTtj7an9nGMgKpO/XZc/lkIBa3
	 NeXjpq4XrHABQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aeb6d00883so1223698e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 13:17:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrcMJTansYI0i7sVFrncNXWXReDfxN2ppISZ7acF33EFDWpbuhkOGKnddJ7jH31Q3rQlTlDzGk9doDM@vger.kernel.org
X-Gm-Message-State: AOJu0YwbCwfX8wrD64sk/ROxRnXiS6FL2SbiA7v6g6rHE556WSWM+L63
	/m1Xs6wCMn7O3Qilnin93m1J+FoKK6uDf2QeLPFoVi9L1JsLhgNtBBTLN8Scd0z5q5CyBi9nTxp
	7AmFzMCCIOvyj0JxgQLQwBUZjyjSQJIw=
X-Received: by 2002:a05:6512:21cb:b0:5b0:190a:5b54 with SMTP id
 2adb3069b0e04-5b023698addmr71572e87.42.1783714630728; Fri, 10 Jul 2026
 13:17:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260705070422.764-1-ceohunk@gmail.com> <87cxwulkl9.fsf@trenco.lwn.net>
In-Reply-To: <87cxwulkl9.fsf@trenco.lwn.net>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 10 Jul 2026 22:16:58 +0200
X-Gmail-Original-Message-ID: <CAD++jLm9oDeMrJU3NAW3333qvVso5P4WxQBgp6-OngOL5_fFiw@mail.gmail.com>
X-Gm-Features: AUfX_mw4ORYsmrA46OyiqMjntDFb94AtBYMCMf7lHIgUwLGcBsKCW3uY8_blLRw
Message-ID: <CAD++jLm9oDeMrJU3NAW3333qvVso5P4WxQBgp6-OngOL5_fFiw@mail.gmail.com>
Subject: Re: [PATCH] docs: driver-api: pin-control: fix spelling of below
To: Jonathan Corbet <corbet@lwn.net>
Cc: Yuhong Cheng <ceohunk@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-39857-lists,linux-gpio=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:ceohunk@gmail.com,m:linux-gpio@vger.kernel.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lwn.net:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3560F73E0C2

On Fri, Jul 10, 2026 at 9:18=E2=80=AFPM Jonathan Corbet <corbet@lwn.net> wr=
ote:

> Yuhong Cheng <ceohunk@gmail.com> writes:
>
> > Fix the spelling of 'bellow' to 'below' in the PM API section.
> >
> > Signed-off-by: Yuhong Cheng <ceohunk@gmail.com>
> > ---
> >  Documentation/driver-api/pin-control.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/driver-api/pin-control.rst b/Documentation/d=
river-api/pin-control.rst
> > index 1f585ecca..80106e44a 100644
> > --- a/Documentation/driver-api/pin-control.rst
> > +++ b/Documentation/driver-api/pin-control.rst
> > @@ -1175,7 +1175,7 @@ Possible standard state names are: "default", "in=
it", "sleep" and "idle".
> >    selected after the driver probe.
> >
> >  - the ``sleep`` and ``idle`` states are for power management and can o=
nly
> > -  be selected with the PM API bellow.
> > +  be selected with the PM API below.
> >
>
> Applied, thanks.

Do you especially want it? I queued some stuff on top after merging it,
so would be great to keep it in the pinctrl tree...

Yours,
Linus Walleij

