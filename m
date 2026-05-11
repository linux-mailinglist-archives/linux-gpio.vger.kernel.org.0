Return-Path: <linux-gpio+bounces-36505-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMzxI9KDAWo6cAEAu9opvQ
	(envelope-from <linux-gpio+bounces-36505-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 09:22:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1755A5090F7
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 09:22:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BD6B1301C109
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 07:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D163644C6;
	Mon, 11 May 2026 07:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HQBe2zGw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2C2334C1D;
	Mon, 11 May 2026 07:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778483895; cv=none; b=fn23znIewxS6pS9oJQg/TvLfggz7Vw9DrPCpqnaYp92DJjhvlpGCkH1SVMe44h5i0cZsZwDvyiroqmgcHkz+SKsItfqvNMNooGjEkUQDAJz05g946YsHqoPMfApOpJ4CnGFn+QNvlhQjK77QhCTT1ejgkYTOi4xmv9+1zUO5mK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778483895; c=relaxed/simple;
	bh=rtGCADOG7837QUyBiZxM/vhVbdHW2lPIva333Noxoqk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=DZpevOYun0TX5iCH8A0CcobaQUuVpbzj0cDoJxzZ77wCNbq+9VbGR4CW25x96VsgcX8SCY7gS9icSqfJ7WN9PS4NVTgjnQeOYnqRQVYiwBfhVZtzZBnvUbAH22/4P1hFG39Qh1P6Wjs99CPmXj9ZijHIv5lc9JQ2HGiD/xA58LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HQBe2zGw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02B6CC2BCB0;
	Mon, 11 May 2026 07:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778483895;
	bh=rtGCADOG7837QUyBiZxM/vhVbdHW2lPIva333Noxoqk=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=HQBe2zGwbaIoC60DM05AePKciX7+YOJpRYQGac1UH2bdo5HvTtkqLxKUQg9T3dP9q
	 sVF2BD4SlI6TgDGDaj/0POyDqlePicZ5mlT2xzQW1kObPYvHN5ztx4igRi1s1mdKf9
	 +gnv+bWqw4g6CfKkGuNNf6OB25d/B7gJDyjZo5X9fq3jx7oMlKJxgxsHcd+KBLKIsy
	 ZHIOKqh4AP9CEwUlzC9tDeancn/IASo5pa0x4ZlCbFWUFlNJQK0TGQcbeibRNo0Llz
	 YSeG/CNvNTcwsyfV9DQdvYyI5oVnJ8r/ZacSRm+PuXViRh5GSFZEjdws3QWjEnLG6k
	 W2ZLPV1Ts//gQ==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=bd9496e9570e053b0f23983d3841d9521a5c0c240114edcf680e49fe370f;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 11 May 2026 09:18:11 +0200
Message-Id: <DIFNX8HLL7X3.JGSENU7W32X4@kernel.org>
Subject: Re: [PATCH v2 1/2] gpio: regmap: Support sparsed fixed direction
Cc: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Alex
 Elder" <elder@riscstar.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Linus Walleij" <linusw@kernel.org>, "Bartosz Golaszewski"
 <brgl@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260508-regmap-gpio-sparse-fixed-dir-v2-0-deee84df3027@kernel.org> <20260508-regmap-gpio-sparse-fixed-dir-v2-1-deee84df3027@kernel.org>
In-Reply-To: <20260508-regmap-gpio-sparse-fixed-dir-v2-1-deee84df3027@kernel.org>
X-Rspamd-Queue-Id: 1755A5090F7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36505-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mwalle@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

--bd9496e9570e053b0f23983d3841d9521a5c0c240114edcf680e49fe370f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Fri May 8, 2026 at 2:51 PM CEST, Linus Walleij wrote:
> On some regmapped GPIOs apparently only a sparser selection
> of the lines (not all) are actually fixed direction.
>
> Support this situation by adding an optional bitmap indicating
> which GPIOs are actually fixed direction and which are not.

Thanks, this patch looks good. But could we invert the logic and use
fixed_direction_mask as that feels more natural to me?

And for legacy reasons, so we don't have to change the drivers:

if (!fixed_direction_mask && fixed_direction_output)
	fixed_direction_mask =3D ~1

Or we just go ahead and change the two drivers. Up to you.

-michael

--bd9496e9570e053b0f23983d3841d9521a5c0c240114edcf680e49fe370f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCagGCsxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/i+pQF9FnOFc84m6sCrqnSN1o9S0xUIMyp6llV0
rC9+SNhkguaRR0sThGbFUSAnAu4GShFgAX9yUlH+uAQYNLrYOJ7rtbCDQQaW0Hqt
N7Z4aqYSp5nMGHGD6q3Ya1x6BXG7lYilE5g=
=9tZn
-----END PGP SIGNATURE-----

--bd9496e9570e053b0f23983d3841d9521a5c0c240114edcf680e49fe370f--

