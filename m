Return-Path: <linux-gpio+bounces-32384-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLNoJ+9jpWn0/QUAu9opvQ
	(envelope-from <linux-gpio+bounces-32384-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 11:18:23 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F58B1D64BF
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 11:18:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ACBD03030EC4
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2026 10:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54CF7395D92;
	Mon,  2 Mar 2026 10:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lNrmHv2R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FA438F653
	for <linux-gpio@vger.kernel.org>; Mon,  2 Mar 2026 10:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772446359; cv=none; b=tng04VMvbo1xFOU6ukaktjHsckF0bMj7kKkaFxyz1eUqH9qf+qPXV95Sw5nGGCDIzrEYxnXdlmHUu5d8jKq6UMAEKFyW2/qNHN4IsOsR4Z04VaHvwoutUi4q2UqWKSI1/ZQ0ks3EEiwi5elSQYUKI6qfbsQDV8AyZoTlV/UDex4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772446359; c=relaxed/simple;
	bh=dmKKCEMChf9iozh5/BFVZZx9ALF9hCLR/Z/vU9qXNm8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SqxQ160XcBxTWaVgdW3yr8pUzM3qMmcB5yCUAjMc3RARnWiEIrjzhjSW4g/q1J0EtVB6mwFFyxqZyBxH3pO31XicCT+l+acIaTTDXXQE30KahDgUMwIQ9I1KHAqy3quds4a8BbJHNc+Z7/5KqxQauY6Q3Ek9FZFFQIYfEEbNAPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lNrmHv2R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE5F0C2BCB6
	for <linux-gpio@vger.kernel.org>; Mon,  2 Mar 2026 10:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772446358;
	bh=dmKKCEMChf9iozh5/BFVZZx9ALF9hCLR/Z/vU9qXNm8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lNrmHv2R3N5gLRM45Ge37DwjBvl8fEeCAwiLFtsgFARHWInrtuSzjeI1k8R8bR4se
	 jEQybZnkIfE+ljHL10eZPvLwVpH/pRrgDP54Jrzvjwd8pppqu8KDrhTJKgDphlKV13
	 hThAk/25e3y9U81XEjVO9qMIpIUEs09pg3Zs7zBPNEx7FWyay4Pcgw3akrQBisZzUR
	 ZdnuIpxonzXdr36o2YT7dumrt/DKri0homViNn8ATmhpSkXFn8aVHwi4qmkSk+WMBS
	 icnHnEm33h8Jjf0IrW9JvbiflGZAi3PdCL0+2Zdr429FsXF3ONjciYL7a5fLh7kmvu
	 vkrE1tlBjMPMg==
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-64ad9fabd08so3479804d50.2
        for <linux-gpio@vger.kernel.org>; Mon, 02 Mar 2026 02:12:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWnMoCjUQ764RBef0OlhJuO0dcuJ9bbMqWz/HYCqr2RZkfk8lyeSVtSoksMz2ujBIFYrwEKgC8z0vcy@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjsb+yRdzXQXW0bufVtpJZGxc7vd/1nJFu1Bti/HRC9k3r+LIm
	lFZzhGZbwUpmn6pLoe7rjbg56H94WpTOLrgcaFbab0OgGVKuk9zK1EDNFQMUc2JXxvPhCX3Um6j
	0YoxQNI8WI/oMoF948EMu0RS2KUehofk=
X-Received: by 2002:a05:690e:175c:b0:64c:97ad:17dc with SMTP id
 956f58d0204a3-64cc22c28damr6768085d50.66.1772446358117; Mon, 02 Mar 2026
 02:12:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225-pinctrl-mux-v2-0-1436a25fa454@nxp.com>
 <20260225-pinctrl-mux-v2-3-1436a25fa454@nxp.com> <CAD++jLkhH566rqkkQfWnOiAokxB8mLXw=eqrVN_pgs+dd8TkxQ@mail.gmail.com>
 <aaG5DpyET-vri-Vj@lizhi-Precision-Tower-5810>
In-Reply-To: <aaG5DpyET-vri-Vj@lizhi-Precision-Tower-5810>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 2 Mar 2026 11:12:27 +0100
X-Gmail-Original-Message-ID: <CAD++jLnVXgvKjF-8QdZONTBX6WK2q=XidZix0LSsyS2Sjq9tBA@mail.gmail.com>
X-Gm-Features: AaiRm53iWIXpU3ZbOeuRosqaBYYTRiks42ceJwmNYd1HTxwTkyNjI2SuJYHEfX4
Message-ID: <CAD++jLnVXgvKjF-8QdZONTBX6WK2q=XidZix0LSsyS2Sjq9tBA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] pinctrl: add optional .release_mux() callback
To: Frank Li <Frank.li@nxp.com>
Cc: Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Haibo Chen <haibo.chen@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32384-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com];
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
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 5F58B1D64BF
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 4:32=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
> On Fri, Feb 27, 2026 at 10:07:05AM +0100, Linus Walleij wrote:
> > On Thu, Feb 26, 2026 at 12:55=E2=80=AFAM Frank Li <Frank.Li@nxp.com> wr=
ote:
> >
> > > Add an optional .release_mux() callback to the pinmux_ops.
> > >
> > > Some devices require releasing resources that were previously acquire=
d in
> > > .set_mux(). Providing a dedicated .release_mux() callback allows driv=
ers to
> > > properly clean up hardware state or associated resources when a mux
> > > function is no longer active.
> > >
> > > The callback is optional and does not affect existing drivers.
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> >
> > Can you explain why you need this custom code for this?
> >
> > Nominally pin control defines and puts the hardware into a
> > number of states such as:
> > "default"
> > "idle"
> > "sleep"
> > "init"
> >
> > Usually (at least for silicon) what .release_mux() would to
> > is semantically equivalent to a transition into the "init" or
> > "sleep" state. And if these are not descriptive enough you can
> > even define a "released" state.
> >
> > Is it not possible to reach the set-up of the hardware that you
> > are desiring by just defining such a relaxed state?
>
> I am not familiar with pinctrl code. I just need a place to call a callba=
ck
> which do opposite work at .set_mux() function.
>
> I see pair function pinmux_enable_setting() call .set_mux() and
>  pinmux_disable_setting() just missing do oppsite work of .set_mux();
>
> I may think too simple. I just do insmod/rmmod test. Any suggestion where
> is good place to put it?
>
> Does it call pair pinmux_enable(disable)_setting when switch state?

The pinmux states are more like a state machine, you transition
between different states.

I think in this case you may want your driver or the device driver
core to transition to the "init" state to release the mux, see
my other reply.

Yours,
Linus Walleij

