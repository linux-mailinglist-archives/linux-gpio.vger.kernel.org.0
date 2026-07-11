Return-Path: <linux-gpio+bounces-39878-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /eixDFrRUWr3JAMAu9opvQ
	(envelope-from <linux-gpio+bounces-39878-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 07:15:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C1ADA7405B0
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 07:15:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=fu-berlin.de header.s=fub01 header.b=JDtGbDz7;
	dmarc=pass (policy=none) header.from=fu-berlin.de;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39878-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39878-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0614E301779C
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 05:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFCFE2D29CF;
	Sat, 11 Jul 2026 05:15:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9DD2B9BA;
	Sat, 11 Jul 2026 05:14:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783746900; cv=none; b=Ec1Bli0bZQw1WyDYX+MQwVpH9ZXp4lM+tpQnfbBn8OTGh3kXYAgkQovgesVFqU2pM446asPZI+NkINdu4X8vwCbG0e5o5to7Gtmmn0rY36YPQxmAhlv+ibCyuL3n/LirWyw+CMT43jkdOr4c3SiKJcdQINb139gcEyTSy6Z/jyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783746900; c=relaxed/simple;
	bh=EhVGZ4XrUueG3AOvBA0Tqqe2K6YlFedTxBKIW/6prqY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WHyxLu70aNL8qvoJT46Xl4nWcP8MdeDWWgHIXKM6gmxuLlsjdUx2aH7RKCkGI+yZpxKZz6LGcXvNGx78Ozcdbs5vaOr0BndzL23xi2SWz/sxcXxZMocpubJPQaCiOq9watCdHyfYzmY6xE+yGoEz3cGazWmMKcvnpNqB01wBRDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=JDtGbDz7; arc=none smtp.client-ip=130.133.4.66
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=qZnmUvqzpN2gHADFKM5g69S4CeLVnbNH9BYWBAmZFX4=; t=1783746896;
	x=1784351696; b=JDtGbDz74laZssaCfcwuctmFrNb0+ETawVXz5cyByidS6SGOn2KhyQozFCMNk
	+vmNMo76imRdqjBl5LKaoR27A4/SlJ/SWU1LxpGmRfd0Wl8L0E9Ov//NHvU87iJA8qXXrH7W/mD9h
	l9iBlbPJ3shtnjRA2eM2arB0Ve/K98TOeogV6/Kk0+dyaVYSVFt9ibZr8j2jy7uaZRJBKfJubkKab
	xNNnD0NYAyV1ZZFdi9B/4dwLhsJwyd7QJIBTgr4rXgOIJo8B1uq9wXdgrs4rMVDL8YDpA8LNHws1y
	UOzuO/qvM5SGrOYcYJ8ESqBPy/yEO/0l6fZJRAsOmKM6Wo87FQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.99)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1wiQ37-00000000UQT-3Xlb; Sat, 11 Jul 2026 07:14:49 +0200
Received: from p57ae56b9.dip0.t-ipconnect.de ([87.174.86.185] helo=suse-laptop.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.99)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1wiQ37-00000002du0-2WUp; Sat, 11 Jul 2026 07:14:49 +0200
Message-ID: <f9fc5cb2ae36593db9db8faf7ebcdc224842f9a0.camel@physik.fu-berlin.de>
Subject: Re: [PATCH v2 0/5] rsk7203: switch to using static device property,
 drop legacy gpio API
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Linus Walleij <linusw@kernel.org>, Dmitry Torokhov
	 <dmitry.torokhov@gmail.com>
Cc: Rich Felker <dalias@libc.org>, Yoshinori Sato
 <ysato@users.sourceforge.jp>,  Geert Uytterhoeven
 <geert+renesas@glider.be>, Bartosz Golaszewski <brgl@kernel.org>, Andy
 Shevchenko	 <andriy.shevchenko@linux.intel.com>, Arnd Bergmann
 <arnd@kernel.org>, 	linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
 	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Date: Sat, 11 Jul 2026 07:14:48 +0200
In-Reply-To: <CAD++jL=Wx=mHORGDU_=PgGrOCdTSVes63jgSL2xQX+rCE2uaMw@mail.gmail.com>
References: <20260520-rsk7203-properties-v2-0-465f3308021b@gmail.com>
	 <akyJOW79W0xvI-P9@google.com>
	 <CAD++jL=Wx=mHORGDU_=PgGrOCdTSVes63jgSL2xQX+rCE2uaMw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fu-berlin.de,none];
	R_DKIM_ALLOW(-0.20)[fu-berlin.de:s=fub01];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-39878-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:dalias@libc.org,m:ysato@users.sourceforge.jp,m:geert+renesas@glider.be,m:brgl@kernel.org,m:andriy.shevchenko@linux.intel.com,m:arnd@kernel.org,m:linux-sh@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:dmitrytorokhov@gmail.com,m:geert@glider.be,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[glaubitz@physik.fu-berlin.de,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[glaubitz@physik.fu-berlin.de,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[fu-berlin.de:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[physik.fu-berlin.de:mid,physik.fu-berlin.de:from_mime,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C1ADA7405B0

Hello Linus,

On Fri, 2026-07-10 at 21:05 +0200, Linus Walleij wrote:
> On Tue, Jul 7, 2026 at 7:08=E2=80=AFAM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
>=20
> > Gentle ping on this series... It still applies cleanly and we need this
> > to be able top drop legacy gpio interfaces from gpio-keys (and
> > eventually from the kernel).
>=20
> I lost my patience and queued it to the pinctrl tree on an immutable
> branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/=
log/?h=3Dib-rsk7204
>=20
> Then I merged this for v7.3.

I'm sorry, but I wasn't aware that this was an urgent patch. I'm doing this
as a hobbyist and I'm working on my own pace as I cannot always spend time
working on kernel maintenance.

I'm usually collecting patches from patchwork [1] for review and then merge
them in batches if they're fine.

What I don't understand, why did you choose to use an immutable tree? Is th=
ere
really a need for such an escalation? I find that a bit rude. The v2 patch =
series
was sent first in May, so I didn't think this was already a long time.

Thanks,
Adrian

> [1] https://patchwork.kernel.org/project/linux-sh/list/

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

