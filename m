Return-Path: <linux-gpio+bounces-32728-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2F3sHkVCrGnEoAEAu9opvQ
	(envelope-from <linux-gpio+bounces-32728-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 16:20:37 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D329E22C5D2
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 16:20:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 687D83012C41
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Mar 2026 15:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B416F3A4526;
	Sat,  7 Mar 2026 15:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="soxIpDOk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768DB3E47B;
	Sat,  7 Mar 2026 15:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772896833; cv=none; b=bme1bu3q4OgxdgSm8FLUnd5aI1A3vqxitdmKx1Nv6ban/96Q/Yr1Vo6EbpTLhZQuMnJWZDjtHD7iArFrn+o0wxjIfog6RTb6VW8f/PukpE4CPUmF7IlZlyZCoWJf+kxaTsDFPgd5eTMKY5Pm59OXwSQC4qtk5UDHylWxKdXZMfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772896833; c=relaxed/simple;
	bh=/fgbxZZex2Gb6npThQnHI6xLOWIQ4ppsK1R84CUgPAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l4Jr6X5eYeQDSV2ZULZOh6JSlvmbINdt4YWSPnMLm2U8B4BpCClFev8iKo6Ae6LEzhKPtYNdwCxX5xfiDvM1uriTw7ldsruGik82KBEWRjTtG/SSj3UROX53HTi355H+Z2CnY0oIRUNWjhC2eiW3zbE11f/DWliJkkLRo82xg8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=soxIpDOk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEB40C19422;
	Sat,  7 Mar 2026 15:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772896833;
	bh=/fgbxZZex2Gb6npThQnHI6xLOWIQ4ppsK1R84CUgPAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=soxIpDOksKbESCJdJFuLSgfz45rhuLwdpu14rEsnlee7DXFGK+txM3Bh72up7M04O
	 7HAebHb7JtLpGmFqYPczDecSwLdDzlFi9LpVbQ5Sk9MkdLTM8hyDycSFXPIHPBoogx
	 X04+8tvaiVtj0yYVoF2eZzRUb1i2lCZ221T/HXJNGBCVXpf4b+I0SN6K2MLESDLCV6
	 FSOXab+PEdEWJQ9lpv7e01HOsKRGs1jgJINWV9LAKUv7aRmvSOmhwjr93a6Tpw5egz
	 IsTNuhaXbiCw0VfqT6FatuBAD4J+Qr1TprLWQUKcv9HY09eTLb9bHOAL+k/weNo0zy
	 9NcRRGdbURucQ==
Date: Sat, 7 Mar 2026 16:20:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Zichar Zhang <zichar.zhang@cixtech.com>, brgl@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, peter.chen@cixtech.com, 
	fugang.duan@cixtech.com, jank@cadence.com, cix-kernel-upstream@cixtech.com, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: gpio: cdns: add clock-names property
Message-ID: <20260307-original-fantastic-potoo-c2c5a0@quoll>
References: <20260306093238.2715269-1-zichar.zhang@cixtech.com>
 <CAD++jLkueX=qU3OY3z=ANA9pd_irWjdf_Czc6RSctzr0MBftQQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAD++jLkueX=qU3OY3z=ANA9pd_irWjdf_Czc6RSctzr0MBftQQ@mail.gmail.com>
X-Rspamd-Queue-Id: D329E22C5D2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32728-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.975];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,cixtech.com:email]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 11:10:35AM +0100, Linus Walleij wrote:
> Hi Zichar,
>=20
> On Fri, Mar 6, 2026 at 10:32=E2=80=AFAM Zichar Zhang <zichar.zhang@cixtec=
h.com> wrote:
>=20
> > +  clock-names:
> > +    description:
> > +      Optional name for the GPIO controller input clock.
> > +    minItems: 1
> > +    maxItems: 1
>=20
> I think clock-names: true should suffice, but the binding maintainers

There is no need for clock names in the first place. It's pointless here.

Best regards,
Krzysztof


