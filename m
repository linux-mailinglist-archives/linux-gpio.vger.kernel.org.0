Return-Path: <linux-gpio+bounces-32899-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKxTEDHir2nkdAIAu9opvQ
	(envelope-from <linux-gpio+bounces-32899-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 10:19:45 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDAD24834D
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 10:19:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E0A96306F4E8
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 09:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B08C43CEF0;
	Tue, 10 Mar 2026 09:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mail.tikatika.nl header.i=@mail.tikatika.nl header.b="OMn7v8iV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from tika.stderr.nl (tika.stderr.nl [94.142.244.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3817D430B91;
	Tue, 10 Mar 2026 09:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.142.244.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773134026; cv=none; b=PecEcl26CqFL/3VxOo4CnPbMTSVhh7+Z1bOUXBQePf3GRSMxnvJV0s27NGjPLzCpwqZUeSS97LIW/QWOPie3QLF2I1ek032u24iMFUmVpAA3wboi35BfoakwmuLdLis8a1F+wO+ZinijuhtXEHbG1bikwFukIVdCPZI8DznFFuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773134026; c=relaxed/simple;
	bh=T9WyAxKmO5pPioTgsqAsXvrRXztgVdsrr43QdrguFAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kil+pgw/iiefO/OqMZenOJQUuBKqLI4v9zKC+m+9DSavYkLjI9N275dEbj6jgVlkZn7XRTajEyzjrO70m4S7KDN6UZqf7Y2CL6El8ciUEr9/hWyeruApb4s/bs5CW6MvwpvPKuw2sSsK71hMVES1I7w4Ekwj1+ntcxYYOs6yH3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stdin.nl; spf=pass smtp.mailfrom=stdin.nl; dkim=pass (1024-bit key) header.d=mail.tikatika.nl header.i=@mail.tikatika.nl header.b=OMn7v8iV; arc=none smtp.client-ip=94.142.244.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stdin.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stdin.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mail.tikatika.nl; s=201709.tika; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AGhloFiVA5y4ksv4lyq7SHgtFdfiIPNTQVDzo7Hu0zo=; b=OMn7v8iVARVKGyTAYQCJEBQ7DS
	TQs95aUL5RqrYohuhlChhwTw1117kxjmPJ+dr8DpR4ObA9OUncGXw2Jih+yghlxVIcDder2/uWBvG
	wugrxKPy9Iq5qMwcXkNMlb8ZaUWkCGWAuxIk3l8RDhCGZk4eO+46zaJZzihP+D1OHzrg=;
X-Preliminary-Spam-Score: -3.4 (---)
Received: from [10.42.0.16] (helo=login.tika.stderr.nl)
	by tika.stderr.nl with smtp (Exim 4.96)
	(envelope-from <matthijs@stdin.nl>)
	id 1vzt9a-0002M4-0p;
	Tue, 10 Mar 2026 10:13:29 +0100
Received: (nullmailer pid 2675192 invoked by uid 2001);
	Tue, 10 Mar 2026 09:13:24 -0000
Date: Tue, 10 Mar 2026 10:13:24 +0100
From: Matthijs Kooijman <matthijs@stdin.nl>
To: Linus Walleij <linusw@kernel.org>
Cc: Jonas Karlman <jonas@kwiboo.se>, Heiko Stuebner <heiko@sntech.de>, Bartosz Golaszewski <brgl@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH RESEND 1/2] arm64: dts: rockchip: rk3308: Add gpio-ranges
 properties
Message-ID: <aa_gs9RgvXkcZCa3@login.tika.stderr.nl>
Mail-Followup-To: Matthijs Kooijman <matthijs@stdin.nl>,
	Linus Walleij <linusw@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Heiko Stuebner <heiko@sntech.de>,
	Bartosz Golaszewski <brgl@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>
References: <20260302202121.197288-1-matthijs@stdin.nl>
 <20260302202121.197288-3-matthijs@stdin.nl>
 <e439f2f7-0b25-41a5-951a-d8d3bc9f2bf2@kwiboo.se>
 <aa_cCCc7FqdSv8eX@login.tika.stderr.nl>
 <CAD++jLmFt6N=v4RsxWqWKcsOonxbyoe7F__j+xNr4c8LWdgR7g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DBSJE9mJunT+HFbc"
Content-Disposition: inline
In-Reply-To: <CAD++jLmFt6N=v4RsxWqWKcsOonxbyoe7F__j+xNr4c8LWdgR7g@mail.gmail.com>
X-PGP-Fingerprint: E7D0 C6A7 5BEE 6D84 D638  F60A 3798 AF15 A156 5658
X-PGP-Key: http://www.stderr.nl/static/files/gpg_pubkey.asc
X-Rspamd-Queue-Id: 4EDAD24834D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.56 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_DKIM_REJECT(1.00)[mail.tikatika.nl:s=201709.tika];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32899-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[stdin.nl];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[mail.tikatika.nl:-];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthijs@stdin.nl,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.979];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action


--DBSJE9mJunT+HFbc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Linus,

> We do not like it when people depend on the global GPIO numbering.

Yeah, I know. That's also why this patch is useful: It stops relying on
global numbering for auto-defining gpio-ranges and instead defines them
explicitly (for this particular DT at least).

Looking at the code (rockchip_gpiolib_register()), I do think it could
be rewritten to use dynamic GPIO numbering (since the same code
currently sets gc->base based on the bank->pin_base, and then defines
gpio-ranges based on gc->base, but I think it could just use
bank->pin_base directly and *not* set gc->base at all to use dynamic
numbering). However, actually making such invasive changes is out of
scope (and time budget) for me :-)

> > but I see in the code that
> > GPIO drivers decide themselves (by setting gc->base statically or maybe
> > based on DT).
>
> They *can* but they really shouldn't. This mechanism exists for
> legacy reasons.

I did read this comment today:

	/* dynamic allocation of GPIOs, e.g. on a hotplugged device */
	static int gpiochip_find_base_unlocked(u16 ngpio)

Which suggested to me that static allocation was still the recommended
default and dynamic allocation primarily used for cases where static
allocation cannot work (like hotplug). But your messages suggests that
static allocation is discouraged more actively than that.

Gr.

Matthijs

--DBSJE9mJunT+HFbc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMyF3AetYrDfGJ9el6ZMxy91tJYwFAmmv4K8ACgkQ6ZMxy91t
JYxWkA/+JfuPHiaRRkRMBdeQNolTsI68Y3tfdseWxZhI9cMyH6BVVBEf4OBhFD/x
G803DkjdkO0APcto+seYIIGIjKIgGzD1vQMqwbWYINz8vB2EkdI43kGMG5X4IxLH
BQr1wHW2orjvx7sNEAs/3WBNDtKeQueECQRs7+4sxfA8f5gSLD84uRhu4hjvH6py
7qksNhVkqzwuIBu5dYTkj0QUL6fb7ht3iloAsnr0SjbUx1WRI8XubffRRXxxyl5W
EFbm3x5dYMviqF2ix1H7IfHqeqwZxuZtHmwpj2+PXvfGCJ0EFbhKs2JSm74yD6cQ
38/sc7ox3IHLYnL+aVHcYOh2TT4O0hfR7kaOd/ej6c20FwZFCYzCV6+Ya9gC8jws
Yp2pdb/6e/JEf+9Wi57BTzDMRt7/iyVqoMcZT1oXX56kbgzPcCGH1Ct2hatNAQLb
DNZc4LFool3YozKK1bofkdEpM0Gsn8b4AW8nmXCNUzfq8vh0Di7SoBm963HINGnk
ML3kC38i5tbPoFhDdKjUe+uTtv48PN/9BMzWl5xJQ/B2ijBG76cI/wA/JMhiEdUt
AL9V2cTcqPWJ9B93BRr1BrM05PrBB+mzGMpkj+vvgj3DvH7Cfym3GwHk0kRH6Bjq
jIm8H8X2OBNYYTUXHsOkzQbpRpANDuqCXq4EvbXYTUBxMkHAp9A=
=72fd
-----END PGP SIGNATURE-----

--DBSJE9mJunT+HFbc--

