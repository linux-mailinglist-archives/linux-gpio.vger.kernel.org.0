Return-Path: <linux-gpio+bounces-35240-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KzKEEvU5WmmoQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35240-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 09:22:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB822427B02
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 09:22:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 60E0F301726B
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 07:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4546B383C99;
	Mon, 20 Apr 2026 07:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IMey3crY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E4E2FD7D3;
	Mon, 20 Apr 2026 07:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776669738; cv=none; b=i/+DI5VRI3Krd7Neoxh9NQVhqAe7coZiWqIfEw0J97BU674xsrYJtlJDyuMZ9qtObf1tCXlrA0UkaOyg+4pNf5wW5b6wtOrFszaghVQNxfFZBLxwHMhEWuMvDfc7sVALNG4PfxmJzMzNVLit2JLB0u1zuORJUIGmmBldzx8Ts2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776669738; c=relaxed/simple;
	bh=OfvTvpLPvCOhEfrZP20Fdwx6Oml0HCemcKq7lCtxkyE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=CtGcEA20VRHAtCreG3inKFfe8ttb/FAuHDL6pxnOAUD46h2Shk8GSVrksL2yV3QDzj3lon0mixPk5btKcShzaI1THTyGhoseaywMPfMbjiL2pcNDSOUwfBSYL7LfhKFrWU2/8rZrBaAvIc8ijLjs1b+buyPJunHQoWIvm7ErfWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IMey3crY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 805D0C19425;
	Mon, 20 Apr 2026 07:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776669737;
	bh=OfvTvpLPvCOhEfrZP20Fdwx6Oml0HCemcKq7lCtxkyE=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=IMey3crYn7faai6rgUGWKlY+8hRpsd9v7aeDXyOpQyfZoHGJbsfz6R50DB40aPfGA
	 scmZDevIY5KrT+Xtm5F1Q5W7GkcKH3TlcudlihDzXyEZfC4uJ+ID9uoHTpOITXJddl
	 kPx9P7oi2FNemZrjdUBG2macvC/BHf5ra7cx++oyuddBTo2iO556nLVT08mYazZN8b
	 kq8Y2FBt/k3RZKnO/cCH2ywt+sead2cswjBkqqCIbMaGQuWEMezh9nYE6zLs2AS0ig
	 MkwDgIBIrtcF0tjJEpppzUi+REL0BbYUsRRA2xXYQ+DadjTO2xLi/VT7fa+E54lIGL
	 OczJRz0NsD0+Q==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=90b98803b27b5277d55f5c028db99ddc444d61087c0fc38a687673f1b0fc;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 20 Apr 2026 09:22:13 +0200
Message-Id: <DHXSUW3NJU22.1RUYUHQZSZ53S@kernel.org>
Subject: Re: [PATCH v2 3/4] gpio: realtek: Add driver for Realtek DHC
 RTD1625 SoC
Cc: "Bartosz Golaszewski" <brgl@kernel.org>, "linux-gpio@vger.kernel.org"
 <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-realtek-soc@lists.infradead.org"
 <linux-realtek-soc@lists.infradead.org>,
 =?utf-8?b?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
 =?utf-8?b?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>,
 =?utf-8?b?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "afaerber@suse.com" <afaerber@suse.com>,
 =?utf-8?b?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Linus Walleij" <linusw@kernel.org>,
 =?utf-8?b?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
X-Mailer: aerc 0.20.0
References: <20260408025243.1155482-1-eleanor.lin@realtek.com>
 <20260408025243.1155482-4-eleanor.lin@realtek.com>
 <CAMRc=MfUh_OuxS4SC6QzSOg_PMNc9i9crGYgBASrbVUgHDHSCw@mail.gmail.com>
 <52bf9ce2b7754af8af69b0afee0d07b2@realtek.com>
 <CAD++jLkpS-T9yK=ctSwpLvXkj7s7ivmwu1KKwzy4KS40LVYeyA@mail.gmail.com>
In-Reply-To: <CAD++jLkpS-T9yK=ctSwpLvXkj7s7ivmwu1KKwzy4KS40LVYeyA@mail.gmail.com>
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35240-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mwalle@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[realtek.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AB822427B02
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--90b98803b27b5277d55f5c028db99ddc444d61087c0fc38a687673f1b0fc
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Sun Apr 19, 2026 at 11:19 PM CEST, Linus Walleij wrote:
> Hi Yu-Chun,
>
> On Fri, Apr 10, 2026 at 11:39=E2=80=AFAM Yu-Chun Lin [=E6=9E=97=E7=A5=90=
=E5=90=9B]
> <eleanor.lin@realtek.com> wrote:
>
>> We did look into gpio-mmio and gpio-regmap, but they are not quite suita=
ble for
>> our platform due to the specific hardware design:
>>
>> 1. Per-GPIO Dedicated Registers: Unlike typical GPIO controllers that pa=
ck 32 pins
>> into a single 32-bit register (1 bit per pin), our hardware uses a dedic=
ated 32-bit
>> register for each individual GPIO. This single register controls the
>> input/output state, direction, and interrupt trigger type for that speci=
fic pin.
>
> Isn't that attainable by:
>
> - setting .ngpio_per_reg to 1 in struct gpio_regmap_config

Which is just used by the gpio_regmap_simple_xlate() anyway. So it
doesn't really matter. But yeah, 1 would be the correct value here,
assuming that the registers are consecutive.

> - extend .reg_mask_xlate callback with an enum for each operation
>   (need to change all users of the .reg_mask_xlate callback but
>   who cares, they are not many):
>
> e.g.
>
> enum gpio_regmap_operation {
>     GPIO_REGMAP_GET_OP,
>     GPIO_REGMAP_SET_OP,
>     GPIO_REGMAP_SET_WITH_CLEAR_OP,
>     GPIO_REGMAP_GET_DIR_OP,
>     GPIO_REGMAP_SET_DIR_OP,
> };
>
>  int (*reg_mask_xlate)(struct gpio_regmap *gpio,
>                               enum_gpio_regmap_operation op,
>                               unsigned int base,
>                               unsigned int offset, unsigned int *reg,
>                               unsigned int *mask);
>
> This way .reg_mask_xlate() can hit different bits in the returned
> *mask depending on operation and it will be find to pack all of
> the bits into one 32bit register.
>
> Added Michael Walle to the the thread, he will know if this is a
> good idea.

Nice idea, though the information is then redundant in the usual
case, i.e. drivers which need to translate specific registers
will do a "switch (base)" at the moment. These should be converted
to "switch (op)" just to keep all the drivers aligned and prevent
new drivers from using the old method. You'd need to touch them
anyway.

I was briefly thinking about making it somewhat possible to embed
the op into the base, if it would otherwise be all the same. That
way, you could gpio-regmap as is. A special case like
GPIO_REGMAP_ADDR_ZERO, that could be used by these kind of drivers,
but that is probably too hacky.

I'm fine with either way.

>> 2. Write-Enable (WREN) Mask Mechanism: Our hardware requires a specific =
Write-Enable
>> mask to be written simultaneously when updating the register values.
>
> Which is to just set bit 31.
>
> With the above scheme your .reg_mask_xlate callback can just set bit 31
> no matter what operating you're doing. Piece of cake.

Keep in mind, that this will make reading and writing somewhat
different. reading assumes there is only one bit set in mask,
because of the "!!(val & mask)" op, which is hardcoded. I'm not
against using the write like that though.

-michael

>> 3. Hardware Debounce: We also need to support hardware debounce settings=
 per pin,
>> which requires custom configuration via set_config mapped to these speci=
fic per-pin
>> registers.
>
> Just add a version of an optional .set_config() call to gpio-regmap.c
> to handle this using .reg_mask_xlate() per above and add a new
> GPIO_REGMAP_CONFIG_OP to the above enum, problem solved.
>
> If it seems too hard I can write patch 1 & 2 adding this infrastructure
> but I bet you can easily see what can be done with gpio-regmap.c
> here provided Michael W approves the idea.
>
> Yours,
> Linus Walleij


--90b98803b27b5277d55f5c028db99ddc444d61087c0fc38a687673f1b0fc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaeXUJhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gYPAGA38kF6k0QPnHqbuf0F8snMjubpa3TOjs3
G9onuKDYzjTIsUAnEIkP2OGyzFeQDyiSAX9GSJK/SNrLRYFKwB25HIvNQffrfllE
mYvy1Hm1NFWYVTeAs8zKhOWZ1siJfgpLSHg=
=VBJf
-----END PGP SIGNATURE-----

--90b98803b27b5277d55f5c028db99ddc444d61087c0fc38a687673f1b0fc--

