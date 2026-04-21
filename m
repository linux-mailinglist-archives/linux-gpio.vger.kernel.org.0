Return-Path: <linux-gpio+bounces-35291-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHSFM2Y152mg5QEAu9opvQ
	(envelope-from <linux-gpio+bounces-35291-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 10:29:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD1543827E
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 10:29:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E5B1830372E2
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 08:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89156399345;
	Tue, 21 Apr 2026 08:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Vc5EB06N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-43101.protonmail.ch (mail-43101.protonmail.ch [185.70.43.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06AE399359;
	Tue, 21 Apr 2026 08:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776760084; cv=none; b=Le8/vEH+XpU80XJ9CNvmqiMTf3lvNHjzspShhzzhDNCUQTNMTKQotnvEx86es/rT84FplxJbp0ixNRrFQ2GtcYN/d+qTJ+gk1ul8lp4JoFmytPvcQs/Pno5tPWDjuzLwMAt1aNitngcPcKVlWp4ReOKubPZ0qXpl7Z200+JSDNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776760084; c=relaxed/simple;
	bh=1o9drzTpI4sD46E2ga91/nI9s8dNg8Zo5z1H7UvmCBg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nh2mIeRMhOAgoayXbd5DRuDgkk/1tJAE2QE88t/y0Z6QtHJ4Xk9RnEW0PwNugugKqN9EddkENjgbncy0kCloTNygWcTSGuO8CP4PF6Okc5O0ve9G+tIoSLzShdx9Iet95sm2WGsuQoLPJB78t78hWiiibbs2gWf67h5zTwVqK7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Vc5EB06N; arc=none smtp.client-ip=185.70.43.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776760079; x=1777019279;
	bh=1o9drzTpI4sD46E2ga91/nI9s8dNg8Zo5z1H7UvmCBg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Vc5EB06NGvzj66PUvuNk2+wTn0BwelspnEa6l2gS6oxO8JbP0w8Li3jINjAtR52I4
	 xZf1pglzNEvpC/EM1/adGClBfSEGyrRQhEH/GQwY0TSbDd4sF4ENLTyHygDKvQt9c6
	 DzJHEqTeDQIA5y3o50Gn2ojUhjNc+O6hc8SacvPUxPW7rCRyQNmdaD/pBSWKJ1IIvr
	 qVJHEs15z26eNo4RcP79tSArjd0R0fuNHoDi6akiumJEx0Q9Jp8Rpp1OkCnzcEhhfM
	 Yj5W539UMZCjTYBftLQUyFrlLNAgNmcnmf+X4k+9OCHoRuFXLrBeKk1G5XiTK33SHb
	 JVPpszdOBzfrA==
Date: Tue, 21 Apr 2026 08:27:53 +0000
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/2] pinctrl: qcom: eliza: Split up some QUP pin groups
Message-ID: <VyNAymHjX9z7Z3-WdJzlVWVOuXy-ywltEW38xX7u8Gh6zxjAprBP5V31qLaPmbaSMzfCCVUbB5f8nh06q1r6qDfVxIYsKoiMNF7h3lbJ1rs=@pm.me>
In-Reply-To: <iksogquo33tsza2dlw2dkkb3siei4zubhtedjubpnvtmuqnwda@enqxfehgojjz>
References: <20260420-fix-eliza-pinctrl-v2-0-b68329fd6701@pm.me> <iksogquo33tsza2dlw2dkkb3siei4zubhtedjubpnvtmuqnwda@enqxfehgojjz>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: f6301ff9a8e327ac6472e93178f492655c57a559
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35291-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[pm.me:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,pm.me:email,pm.me:dkim,pm.me:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: 4AD1543827E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tuesday, April 21st, 2026 at 1:55 AM, Abel Vesa <abel.vesa@oss.qualcomm.=
com> wrote:

> On 26-04-20 14:27:46, Alexander Koskovich wrote:
> > Multiple QUPs have lanes that can be routed to one of two GPIOs and
> > collapsing them prevents devicetrees from requesting specific routing.
> >
> > For example, a board that wires an I2C SCL line to one of two GPIOs
> > cannot request that specific pin with the groups collapsed.
> >
> > This series splits them up so devicetrees can request the configuration
> > they need.
> >
> > Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
>=20
> Nack. That's the downstream way. In upstream we group them.

If I leave them grouped, and don't override function for i2c6 scl to
qup1_se6_l1_mira, probe fails for the amplifiers on my board.

Is there a way to select mira with having them grouped?

>=20
> If you want to play with the WIP bring-up, here is the tree we use:
>=20
> https://github.com/qualcomm-linux/kernel-topics/tree/early/hwe/eliza
>=20
> Qup nodes are already in there.
>=20

Thanks,
Alex

