Return-Path: <linux-gpio+bounces-34748-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDGcFhmr1GmKwQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34748-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 08:58:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD493AA8BC
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 08:58:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 08C3E3018C00
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 06:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BEB55733E;
	Tue,  7 Apr 2026 06:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="icMWt58S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C351738F23B
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 06:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775545101; cv=none; b=SX+79dGutkhN3/rh3CSdzDnKVj7XXC7ErGq0z6EbmeWapZptwS5CDmxquEBNMZk4VcZa2JZXMYQ226qUYQEeVyRK/2uVUzDSYZpSjPTS8y/ZZAB52dvUmoybY4abmQrNNxOrRiZ2uJ75b6wEr3b65wSYDpaq7X9toJvgyAzZ4lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775545101; c=relaxed/simple;
	bh=nAplqN9DsCKUCLbLr018ZXuC8zDE4LPJYT6SHttLTiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AcK1Bwji26KHn3CGVXV6cIUWniUvDKbb7or0jSKG4ZYEGovV4ghRzKhKuxx7Y30OmNtI3p+CpdCp6KlrruBtrZtRfo8ZzcvWmj36aQXRHNhfJdgYW1kAluT/9jtnUvlT0ptGjgI/+662KyYV9OlUdXjgNIkLW/ZyNPEfJemUPf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=icMWt58S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87DC1C4AF0B
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 06:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775545101;
	bh=nAplqN9DsCKUCLbLr018ZXuC8zDE4LPJYT6SHttLTiE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=icMWt58S2rpDSAsRF02bZQ5BnvpPEm/6OtzVK7pcrld47UPghto0piAzrzDZD7C3y
	 /WGdnwQKNoMKCyVmFiAJ1Bl3IjdsS2xwhicv29g2YUfMhnM3kTZPr+KROhFl1ygLaA
	 T3PNyXrjwmYyEGR8opHXE+DmWB8mzgWMNOjxYBDCeYRBFN4SHgnDNdWiIRzknnY8/w
	 sr8uDtyqLpx1g3geI+apkzCXXOej2LEy291Lc4SBzx06ewFIcpO6lnS6wUkxJCwJj+
	 9nC2vzXm71ujS1BY1IuqQXVA9YR94Y+R0XnlyRgB/aUddMRKWXHsc2zRGVehP7htY/
	 cHnXihnnNrVgw==
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6500eae6d2fso4550637d50.1
        for <linux-gpio@vger.kernel.org>; Mon, 06 Apr 2026 23:58:21 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy3Slq97mAoy7pUVCciimVJDaZpkvUcGJnwkOstl9XBoguGsfoS
	TR/UyYmflbbqFUywlQzUMS5+v/zH2dxP17YgW8tnrn6FtmDFVZGfrKjmcTAh0sMu6JA6i8ZpWXD
	a248KlX8IKnatZi4aK7vmEdKiyjUPbvc=
X-Received: by 2002:a53:bc85:0:b0:650:12eb:16ce with SMTP id
 956f58d0204a3-65048852dc8mr10480031d50.52.1775545100788; Mon, 06 Apr 2026
 23:58:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330161914.1071118-1-flavra@baylibre.com>
In-Reply-To: <20260330161914.1071118-1-flavra@baylibre.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 7 Apr 2026 08:58:09 +0200
X-Gmail-Original-Message-ID: <CAD++jLkdoD=0RjpAMLWTMRtUX1+3tB6exOu5=nC3ERBYdrUiUw@mail.gmail.com>
X-Gm-Features: AQROBzCISKGSttWAEVqS4kj1VFQ4ZxlAKUaQ80wQu2gNFTor5rxvXwbj5_-gG7U
Message-ID: <CAD++jLkdoD=0RjpAMLWTMRtUX1+3tB6exOu5=nC3ERBYdrUiUw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mcp23s08: Disable all pin interrupts during probe
To: Francesco Lavra <flavra@baylibre.com>, Maksim Kiselev <bigunclemax@gmail.com>, 
	Sander Vanheule <sander@svanheule.net>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mike Looijmans <mike.looijmans@topic.nl>, Dmitry Mastykin <mastichi@gmail.com>, 
	Evgenii Shatokhin <e.shatokhin@yadro.com>, Arturas Moskvinas <arturas.moskvinas@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Andreas Kaessens <akaessens@gmail.com>, Radim Pavlik <radim.pavlik@tbs-biometrics.com>, 
	Thomas Preston <thomas.preston@codethink.co.uk>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-34748-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[baylibre.com,gmail.com,svanheule.net,linux.intel.com,topic.nl,yadro.com,pengutronix.de,tbs-biometrics.com,codethink.co.uk];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CAD493AA8BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 6:19=E2=80=AFPM Francesco Lavra <flavra@baylibre.co=
m> wrote:

> A chip being probed may have the interrupt-on-change feature enabled on
> some of its pins, for example after a reboot. This can cause the chip to
> generate interrupts for pins that don't have a registered nested handler,
> which leads to a kernel crash such as below:
>
> [    7.928897] Unable to handle kernel read from unreadable memory at vir=
tual address 00000000000000ac
> [    7.932314] Mem abort info:
> [    7.935081]   ESR =3D 0x0000000096000004
> [    7.938808]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> [    7.944094]   SET =3D 0, FnV =3D 0
> [    7.947127]   EA =3D 0, S1PTW =3D 0
> [    7.950247]   FSC =3D 0x04: level 0 translation fault
> [    7.955101] Data abort info:
> [    7.957961]   ISV =3D 0, ISS =3D 0x00000004, ISS2 =3D 0x00000000
> [    7.963421]   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
> [    7.968447]   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
> [    7.973734] user pgtable: 4k pages, 48-bit VAs, pgdp=3D00000000089b700=
0
> [    7.980148] [00000000000000ac] pgd=3D0000000000000000, p4d=3D000000000=
0000000
> [    7.986913] Internal error: Oops: 0000000096000004 [#1]  SMP
> [    7.992545] Modules linked in:
> [    8.073678] CPU: 0 UID: 0 PID: 81 Comm: irq/18-4-0025 Not tainted 7.0.=
0-rc6-gd2b5a1f931c8-dirty #199
> [    8.073689] Hardware name: Khadas VIM3 (DT)
> [    8.073692] pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)
> [    8.094639] pc : _raw_spin_lock_irq+0x40/0x80
> [    8.098970] lr : handle_nested_irq+0x2c/0x168
> [    8.098979] sp : ffff800082b2bd20
> [    8.106599] x29: ffff800082b2bd20 x28: ffff800080107920 x27: ffff80008=
0104d88
> [    8.106611] x26: ffff000003298080 x25: 0000000000000001 x24: 000000000=
000ff00
> [    8.113707] x23: 0000000000000001 x22: 0000000000000000 x21: 000000000=
000000e
> [    8.120850] x20: 0000000000000000 x19: 00000000000000ac x18: 000000000=
0000000
> [    8.135046] x17: 0000000000000000 x16: 0000000000000000 x15: 000000000=
0000000
> [    8.135062] x14: ffff800081567ea8 x13: ffffffffffffffff x12: 000000000=
0000000
> [    8.135070] x11: 00000000000000c0 x10: 0000000000000b60 x9 : ffff80008=
0109e0c
> [    8.135078] x8 : 1fffe0000069dbc1 x7 : 0000000000000001 x6 : ffff00000=
34ede00
> [    8.135086] x5 : 0000000000000000 x4 : ffff0000034ede08 x3 : 000000000=
0000001
> [    8.163460] x2 : 0000000000000000 x1 : 0000000000000001 x0 : 000000000=
00000ac
> [    8.170560] Call trace:
> [    8.180094]  _raw_spin_lock_irq+0x40/0x80 (P)
> [    8.184443]  mcp23s08_irq+0x248/0x358
> [    8.184462]  irq_thread_fn+0x34/0xb8
> [    8.184470]  irq_thread+0x1a4/0x310
> [    8.195093]  kthread+0x13c/0x150
> [    8.198309]  ret_from_fork+0x10/0x20
> [    8.201850] Code: d65f03c0 d2800002 52800023 f9800011 (885ffc01)
> [    8.207931] ---[ end trace 0000000000000000 ]---
>
> This issue has always been present, but has been latent until commit
> "f9f4fda15e72" ("pinctrl: mcp23s08: init reg_defaults from HW at probe an=
d
> switch cache type"), which correctly removed reg_defaults from the regmap
> and as a side effect changed the behavior of the interrupt handler so tha=
t
> the real value of the MCP_GPINTEN register is now being read from the chi=
p
> instead of using a bogus 0 default value; a non-zero value for this
> register can trigger the invocation of a nested handler which may not exi=
st
> (yet).
> Fix this issue by disabling all pin interrupts during initialization.
>
> Fixes: "f9f4fda15e72" ("pinctrl: mcp23s08: init reg_defaults from HW at p=
robe and switch cache type")
> Signed-off-by: Francesco Lavra <flavra@baylibre.com>

Patch applied for fixes since it's pretty urgent, and it also looks
right to me.

However added some people using this to the CC so they
get a chance to react before it goes upstream.

Yours,
Linus Walleij

