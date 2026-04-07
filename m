Return-Path: <linux-gpio+bounces-34809-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCadDsP/1GnOzQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34809-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:59:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE3D3AEC35
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:59:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C419E300D360
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 12:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D1693B635A;
	Tue,  7 Apr 2026 12:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="zjko2HmF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC8F3B52F1
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 12:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775566782; cv=none; b=nwZqaFbVTUG15Iu5dznRE8A2Ua0aGDTtyZX/r4tM+PBIESfo3vtdBmPLojcoJXkg9q4GM5O7bKE7p9UZIKGeYMYPNp/Gq6Tqdg8lqWM7KtHhFGt95BtIAsWpdrIOLj7+E6oqBZaPt68fZFiCePw5nN8y8/F7lh865VY7VorFWM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775566782; c=relaxed/simple;
	bh=bOa02NyvW+eDw/e01zbZDNtwtQjDUSw9mOJereqrVDA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Qve0LYGRiD5jc43yFviZRZFtkAY7TJAFPIMtrgyPsCWiFmJEzej9TgeUgdeQhI+AmN08Urf2IXZgKWaI4VoMV7T2DeTea28H6ffO7MA8IegI4ap9IxPMRmW8+awuwI5tVOA5bXpIck1QpbU1V05FPP8mSTiVxYcp5Zxgwk5CrjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=zjko2HmF; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b9c6680aaf8so562859866b.3
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 05:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775566778; x=1776171578; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bOa02NyvW+eDw/e01zbZDNtwtQjDUSw9mOJereqrVDA=;
        b=zjko2HmF091nOPJZMuByuRjTk9MnN5hFRkAoQW7Mix/Tk59Lu54EtB6CTi4SXCmdzE
         +7IEH3oiNSiG3vBrFlq44GTn3PxDtBZW4h/zP9RhfbtMIg6X2yN2aqHcJ/cuAUXDQbNT
         wLOAUOxSsImIYVWbqvP/Cx5laHwP55NYCLEvbwFBAKHMsqy8gEnvEvA3IvgnpUyeRUbh
         4QK9cw5OEARSpcXS6lv4675+QtFQl1FgmgLvtU4UWex3q/q/n+SWjXHnYH10XmPCzdaJ
         g2i+mYZ9wRAGitjRbjdC6w08paoiGJoaNYOpBCq+DzVXoyRzL0CblRUbiC0P9yCx7Oer
         QyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775566778; x=1776171578;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bOa02NyvW+eDw/e01zbZDNtwtQjDUSw9mOJereqrVDA=;
        b=Okk2KLKoE8rymgU60X7UbUWCT9ZzTeYsmZc10YBH+xhtVymuPESE5YEmBJH1gAZNKB
         M3MS/DVTkrMv83OR0Y+pOCnJICrMcj60S357SlvyXt233HL00enNTD8SyGuMJZuDMzof
         mrjVU+xju/I2qog/SN8uHKL8dEgUanQzAtT2sVNsCUQdQ0MoXdHK2nWr+E4zDkZeYgWA
         l7ugdrC4cWqV3iexRfxgFdMCbmneGWvKsRTPBLgfztoe32YskGog8xHcc8IM4papDYMU
         a9KD+Wx83ue3y5SMc4GOWw+PAs7ImdIRL5ARxiXncZX59pfLWfhw+wxGtY7scFPXU3gy
         h0OA==
X-Gm-Message-State: AOJu0Ywvl3YYgp5KVz1yY+1jxlE7wQuufUGiOqH40V85DdkWC1VTCqof
	v280m8EJXDaKP35R5zx4dcDBUuT346XshrGZIO3Au7ZTjy1kZ0jFGDhl81ZmHoO5tDs=
X-Gm-Gg: AeBDiesdteOdc4S8FHriam4a4nLSiYB1wcm/ohV3WdszCMN6KhYQpe9RTYoNLin3Um/
	F+Nq6/s23ebLqtLo42I60oxegQlVT55XTaTtKczlpOTw1i0wDKjPAKNYK5MkY7hsQN36mM88IDf
	O4atFLGbOkbZ20P71IqxpU3pWiQgjJtgeFwuZ40PBk9X454iRcZ2i+X+NcGz6C5Fu5rp3VGimOT
	EQuzLd03a7tVRPb1pR8cpaF+wqhXAYQq1Wjc1+l7H+Yimy5Lw7CSeW2iAjRo3+XX76MN9Kr8qdX
	43NH7LaCgVGcXzYqRL/rKQe+CoPsCcEibe4q31RluZAjLCDRUA6pei6XuftKarERCFiXiZLGTCC
	+nv5Z0G70bTw872FdJIJXObsoDOcQmablGD98zzB6jm9zEYT5RaH017LXyWxtEnwYJEIqxfsJGk
	Z111KVixcRpc7otTOxRaCa5Q/S9rR8GOyEa2GQvWPBvkyLorYtIEwo4Io9h6tO0vLNV2oewLuA
X-Received: by 2002:a17:907:960f:b0:b9b:38d4:2cea with SMTP id a640c23a62f3a-b9c676c8812mr795767766b.23.1775566777932;
        Tue, 07 Apr 2026 05:59:37 -0700 (PDT)
Received: from [10.87.54.48] (mob-176-247-39-197.net.vodafone.it. [176.247.39.197])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c97219dsm548568966b.5.2026.04.07.05.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 05:59:37 -0700 (PDT)
Message-ID: <80c917d828932a225e0a1a9fffb77d55d27241cb.camel@baylibre.com>
Subject: Re: [PATCH] pinctrl: mcp23s08: Disable all pin interrupts during
 probe
From: Francesco Lavra <flavra@baylibre.com>
To: Mike Looijmans <mike.looijmans@topic.nl>, Linus Walleij
 <linusw@kernel.org>,  Maksim Kiselev <bigunclemax@gmail.com>, Sander
 Vanheule <sander@svanheule.net>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Dmitry Mastykin <mastichi@gmail.com>, 
 Evgenii Shatokhin <e.shatokhin@yadro.com>, Arturas Moskvinas
 <arturas.moskvinas@gmail.com>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <u.kleine-koenig@pengutronix.de>, Andreas Kaessens <akaessens@gmail.com>, 
 Radim Pavlik <radim.pavlik@tbs-biometrics.com>, Thomas Preston
 <thomas.preston@codethink.co.uk>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 07 Apr 2026 14:59:36 +0200
In-Reply-To: <e6909c2b-d41a-47ce-8f82-2bee3801fa50@topic.nl>
References: <20260330161914.1071118-1-flavra@baylibre.com>
	 <CAD++jLkdoD=0RjpAMLWTMRtUX1+3tB6exOu5=nC3ERBYdrUiUw@mail.gmail.com>
	 <e6909c2b-d41a-47ce-8f82-2bee3801fa50@topic.nl>
Organization: BayLibre
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34809-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[topic.nl,kernel.org,gmail.com,svanheule.net,linux.intel.com,yadro.com,pengutronix.de,tbs-biometrics.com,codethink.co.uk];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[baylibre-com.20251104.gappssmtp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[flavra@baylibre.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,baylibre.com:email,baylibre.com:mid,baylibre-com.20251104.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: BCE3D3AEC35
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 2026-04-07 at 12:17 +0200, Mike Looijmans wrote:
> On 07-04-2026 08:58, Linus Walleij wrote:
> > On Mon, Mar 30, 2026 at 6:19=E2=80=AFPM Francesco Lavra <flavra@baylibr=
e.com>
> > wrote:
> >=20
> > > A chip being probed may have the interrupt-on-change feature enabled
> > > on
> > > some of its pins, for example after a reboot. This can cause the chip
> > > to
> > > generate interrupts for pins that don't have a registered nested
> > > handler,
> > > which leads to a kernel crash such as below:
> > >=20
> > > [=C2=A0=C2=A0=C2=A0 7.928897] Unable to handle kernel read from unrea=
dable memory at
> > > virtual address 00000000000000ac
> > > [=C2=A0=C2=A0=C2=A0 7.932314] Mem abort info:
> > > [=C2=A0=C2=A0=C2=A0 7.935081]=C2=A0=C2=A0 ESR =3D 0x0000000096000004
> > > [=C2=A0=C2=A0=C2=A0 7.938808]=C2=A0=C2=A0 EC =3D 0x25: DABT (current =
EL), IL =3D 32 bits
> > > [=C2=A0=C2=A0=C2=A0 7.944094]=C2=A0=C2=A0 SET =3D 0, FnV =3D 0
> > > [=C2=A0=C2=A0=C2=A0 7.947127]=C2=A0=C2=A0 EA =3D 0, S1PTW =3D 0
> > > [=C2=A0=C2=A0=C2=A0 7.950247]=C2=A0=C2=A0 FSC =3D 0x04: level 0 trans=
lation fault
> > > [=C2=A0=C2=A0=C2=A0 7.955101] Data abort info:
> > > [=C2=A0=C2=A0=C2=A0 7.957961]=C2=A0=C2=A0 ISV =3D 0, ISS =3D 0x000000=
04, ISS2 =3D 0x00000000
> > > [=C2=A0=C2=A0=C2=A0 7.963421]=C2=A0=C2=A0 CM =3D 0, WnR =3D 0, TnD =
=3D 0, TagAccess =3D 0
> > > [=C2=A0=C2=A0=C2=A0 7.968447]=C2=A0=C2=A0 GCS =3D 0, Overlay =3D 0, D=
irtyBit =3D 0, Xs =3D 0
> > > [=C2=A0=C2=A0=C2=A0 7.973734] user pgtable: 4k pages, 48-bit VAs,
> > > pgdp=3D00000000089b7000
> > > [=C2=A0=C2=A0=C2=A0 7.980148] [00000000000000ac] pgd=3D00000000000000=
00,
> > > p4d=3D0000000000000000
> > > [=C2=A0=C2=A0=C2=A0 7.986913] Internal error: Oops: 0000000096000004 =
[#1]=C2=A0 SMP
> > > [=C2=A0=C2=A0=C2=A0 7.992545] Modules linked in:
> > > [=C2=A0=C2=A0=C2=A0 8.073678] CPU: 0 UID: 0 PID: 81 Comm: irq/18-4-00=
25 Not tainted
> > > 7.0.0-rc6-gd2b5a1f931c8-dirty #199
> > > [=C2=A0=C2=A0=C2=A0 8.073689] Hardware name: Khadas VIM3 (DT)
> > > [=C2=A0=C2=A0=C2=A0 8.073692] pstate: 604000c5 (nZCv daIF +PAN -UAO -=
TCO -DIT -SSBS
> > > BTYPE=3D--)
> > > [=C2=A0=C2=A0=C2=A0 8.094639] pc : _raw_spin_lock_irq+0x40/0x80
> > > [=C2=A0=C2=A0=C2=A0 8.098970] lr : handle_nested_irq+0x2c/0x168
> > > [=C2=A0=C2=A0=C2=A0 8.098979] sp : ffff800082b2bd20
> > > [=C2=A0=C2=A0=C2=A0 8.106599] x29: ffff800082b2bd20 x28: ffff80008010=
7920 x27:
> > > ffff800080104d88
> > > [=C2=A0=C2=A0=C2=A0 8.106611] x26: ffff000003298080 x25: 000000000000=
0001 x24:
> > > 000000000000ff00
> > > [=C2=A0=C2=A0=C2=A0 8.113707] x23: 0000000000000001 x22: 000000000000=
0000 x21:
> > > 000000000000000e
> > > [=C2=A0=C2=A0=C2=A0 8.120850] x20: 0000000000000000 x19: 000000000000=
00ac x18:
> > > 0000000000000000
> > > [=C2=A0=C2=A0=C2=A0 8.135046] x17: 0000000000000000 x16: 000000000000=
0000 x15:
> > > 0000000000000000
> > > [=C2=A0=C2=A0=C2=A0 8.135062] x14: ffff800081567ea8 x13: ffffffffffff=
ffff x12:
> > > 0000000000000000
> > > [=C2=A0=C2=A0=C2=A0 8.135070] x11: 00000000000000c0 x10: 000000000000=
0b60 x9 :
> > > ffff800080109e0c
> > > [=C2=A0=C2=A0=C2=A0 8.135078] x8 : 1fffe0000069dbc1 x7 : 000000000000=
0001 x6 :
> > > ffff0000034ede00
> > > [=C2=A0=C2=A0=C2=A0 8.135086] x5 : 0000000000000000 x4 : ffff0000034e=
de08 x3 :
> > > 0000000000000001
> > > [=C2=A0=C2=A0=C2=A0 8.163460] x2 : 0000000000000000 x1 : 000000000000=
0001 x0 :
> > > 00000000000000ac
> > > [=C2=A0=C2=A0=C2=A0 8.170560] Call trace:
> > > [=C2=A0=C2=A0=C2=A0 8.180094]=C2=A0 _raw_spin_lock_irq+0x40/0x80 (P)
> > > [=C2=A0=C2=A0=C2=A0 8.184443]=C2=A0 mcp23s08_irq+0x248/0x358
> > > [=C2=A0=C2=A0=C2=A0 8.184462]=C2=A0 irq_thread_fn+0x34/0xb8
> > > [=C2=A0=C2=A0=C2=A0 8.184470]=C2=A0 irq_thread+0x1a4/0x310
> > > [=C2=A0=C2=A0=C2=A0 8.195093]=C2=A0 kthread+0x13c/0x150
> > > [=C2=A0=C2=A0=C2=A0 8.198309]=C2=A0 ret_from_fork+0x10/0x20
> > > [=C2=A0=C2=A0=C2=A0 8.201850] Code: d65f03c0 d2800002 52800023 f98000=
11 (885ffc01)
> > > [=C2=A0=C2=A0=C2=A0 8.207931] ---[ end trace 0000000000000000 ]---
> > >=20
> > > This issue has always been present, but has been latent until commit
> > > "f9f4fda15e72" ("pinctrl: mcp23s08: init reg_defaults from HW at
> > > probe and
> > > switch cache type"), which correctly removed reg_defaults from the
> > > regmap
> > > and as a side effect changed the behavior of the interrupt handler so
> > > that
> > > the real value of the MCP_GPINTEN register is now being read from the
> > > chip
> > > instead of using a bogus 0 default value; a non-zero value for this
> > > register can trigger the invocation of a nested handler which may not
> > > exist
> > > (yet).
> > > Fix this issue by disabling all pin interrupts during initialization.
> > >=20
> > > Fixes: "f9f4fda15e72" ("pinctrl: mcp23s08: init reg_defaults from HW
> > > at probe and switch cache type")
> > > Signed-off-by: Francesco Lavra <flavra@baylibre.com>
> > Patch applied for fixes since it's pretty urgent, and it also looks
> > right to me.
> >=20
> > However added some people using this to the CC so they
> > get a chance to react before it goes upstream.
> Looks okay to me too.
>=20
> Maybe it'd be better to unconditionally write "0" to this register? No=
=20
> need to exercise the interrupt logic and pins when no-one is listening...

Not sure I understand, unconditionally writing "0" to this register is
exactly what this patch does.

> I was going to say "if the device doesn't have a reset GPIO", but=20
> looking at the code, the reset GPIO is never asserted by this driver.

Right. In any case, the reset GPIO is optional, so we would still need to
initialize the register manually if there is no reset GPIO.

