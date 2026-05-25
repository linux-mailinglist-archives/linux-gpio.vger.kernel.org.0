Return-Path: <linux-gpio+bounces-37433-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDMrKYELFGr6JAcAu9opvQ
	(envelope-from <linux-gpio+bounces-37433-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 10:42:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E61D45C7EF2
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 10:42:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0039830053DE
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 08:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C5483E317C;
	Mon, 25 May 2026 08:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f9uOlN0O"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4493E1CF5
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 08:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779698558; cv=none; b=H+C8jyHWCBC/5d/I81IlWIigcU7GLQ13nkI7NltYd/9LURzgyPbpewsyztedH2x77w6AIi+v1FgERCDFhMIiPHOhzsverjViT4oiDpQPsdnF5KwGPmK+2rWNuUXP4lYleBiJPovLiMb8gjPIu5eonz0VNVUWADAkWE162IqVL8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779698558; c=relaxed/simple;
	bh=FpesEd+gPFeRyRo3Ocp8xCwanIuGJanzm1V9RC06btI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bi1p4lVQq1azNSY8j3uGkjkEqdip1RE1vtkFdfOHtJKyPYI2As57hsyDwJ3HMch8QXY1ONC3KcEw1wFIPtqw2omBvvPK1kOe+MsqUkPwRz2+nWLp77ftCftY3iLi1hK4pCDfVoSwUDbkn9feLrDimXZJPb3a3pHjJMglryqxrqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f9uOlN0O; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB0171F000E9
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 08:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779698556;
	bh=DLnvZXPujH5FuIGkvWiTeENDYF2DeatIiailBx/q3BI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=f9uOlN0OevKmGopmnGa1BlYP8LvviLatz3PeQuLi6haiDveb3A0W4IV2iIBwdHyxm
	 t/uCFkjt2WFNtNEKgjkgSqXo96yT0GXFiaoDcaxu/d3CuoQbDbxKSdb8pi2Hm61w08
	 IYatzEI40KP7qfECW2MTKsAUwAEj3ROJUt7PtJsFNrzgYK+//DZa58SOkKz96oOvpP
	 2+UUG2PfZAj7YwPP7nIheSRo3ihRneorAARWia0jdDKj98prU/D86tHxZ56/iFqyZf
	 wEwaurmfFI+RruvRvlkRESKtPmLj6LufNNN+AZ89tX6D+NetXCgfCL02vhpxYc7ztx
	 le1SgRCdNFljA==
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7e61b59e03eso1389460a34.2
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 01:42:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9KyIB6DWzqofH5oqnA5szHGPmzVm0SmTuFe3UONUyL467THtes7sUFYT/AN2rqCQREJbC3Y44Prumf@vger.kernel.org
X-Gm-Message-State: AOJu0YxRQB5jkrYC8RRRwzm5FiRg70Gc+QB7c/4akLuXPdrDoQ7fDxTK
	fVngf/H2UMsIWK+1x7DwRYt/KkQvvGSjoS6dPGuaPCMhYQlBapXNxXxwjRevDeNbRCMqWHEdpQE
	7NxRybzfSIFqHx0hr4ayeolJWU4NnYos=
X-Received: by 2002:a05:6830:610d:b0:7dc:c7aa:22bd with SMTP id
 46e09a7af769-7e5fece944fmr7283789a34.6.1779698556147; Mon, 25 May 2026
 01:42:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513-gpio-shared-dynamic-voting-v1-1-8e1c49961b7d@oss.qualcomm.com>
 <CAD++jL=jL=YLOTy2JP8WfXZw-7K8Tf3KoJQz0+e353JCYxBx8Q@mail.gmail.com> <CAMRc=MdfhTkZRH_sx0S-v0UuAPfj8RT4HAZS4zD-5HF3r_U_Sg@mail.gmail.com>
In-Reply-To: <CAMRc=MdfhTkZRH_sx0S-v0UuAPfj8RT4HAZS4zD-5HF3r_U_Sg@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 25 May 2026 10:42:21 +0200
X-Gmail-Original-Message-ID: <CAD++jLm+VqnFzUj2GNizC5H+Z5yj5SOC+r5bYqTEBXEKLWZ=ng@mail.gmail.com>
X-Gm-Features: AVHnY4IU8c_T64feOBExG_X7AzgUeNv6HkIcVjC1bSnP4OmZ4v0E6xyChM7JwVg
Message-ID: <CAD++jLm+VqnFzUj2GNizC5H+Z5yj5SOC+r5bYqTEBXEKLWZ=ng@mail.gmail.com>
Subject: Re: [PATCH] gpio: shared: make the voting mechanism adaptable
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Marek Vasut <marex@nabladev.com>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Srinivas Kandagatla <srini@kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37433-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: E61D45C7EF2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 10:56=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
> On Tue, May 19, 2026 at 10:34=E2=80=AFAM Linus Walleij <linusw@kernel.org=
> wrote:

> > BTW was this "voting" system inspired by the hardware "vote" thing
> > that Qualcomm is using for power management? That's the only place
> > I've seen it before.
>
> Really only the name, it's not much different from what we already
> have in clocks or regulators IMO.

My thinking is:

- refcount =3D any request enables, all consumers must disable before
  resource goes offline

- vote =3D some kind of majority or first-come-first-served decision and
  consumers could be denied the resource

If the semantics are the same I will be confused... this seems to
be a first-come-first-served scheme so I comprehend it.

Yours,
Linus Walleij

