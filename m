Return-Path: <linux-gpio+bounces-38401-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id h0taKPIuLWrZdgQAu9opvQ
	(envelope-from <linux-gpio+bounces-38401-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 12:20:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE0867E59C
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 12:20:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=protonmail.com header.s=protonmail3 header.b=h4Idtran;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38401-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38401-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=protonmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 13F00302167C
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 10:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 497343B42C0;
	Sat, 13 Jun 2026 10:20:32 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D494533F360;
	Sat, 13 Jun 2026 10:20:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781346032; cv=none; b=rCchKc4Q9xZhR0N5SijOhM9z8hqBqFpq34CKnO8bwTgPPy+2O94GyLzWQZroPBTCYQxzb7Fcyt9so5qYD7/azlZxJbpHmO70w17ViSdPsQLM8TwxxVBYLZtjFWWDhYW4BNkJS5Mzc5VW+oqHA+Va4g1Nj3wSy+1GhrmBYnJtj4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781346032; c=relaxed/simple;
	bh=ko5UWYVVjvjr748SyWZ1mgjUtAFia/tKl7hCGMvdA/w=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bPNHZpyQ5D9ycTj121BgLkZkwqIbF3dSVJqNkxaWqNP7cGhkL5aaFYDAxlsFUird7oMc3vr8ugwML3982lXNmfgfdZWI/YwGr+wO4qHLYKC/dpKL+1dwK4fJ9qhnUALKj+d3Yg01oQNnI/gjY1QP0KKKQDaAzcb+te3uFbeUVAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=h4Idtran; arc=none smtp.client-ip=57.129.93.249
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1781346014; x=1781605214;
	bh=Q74DfFMJGIf43h3oG0AaLzcz+fNjnLU10vcumudtGPU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=h4IdtranjLetTUOBYNFCtKZrpcVlKvaVpaSOmd/8APazXezroN577JvQezid6+eIn
	 k9PZutTzzHO0TxhLBx3/vRK9YVgUlxLFlN+Sa9OO9LT6birHINfK4jzf/AXvB+nrAo
	 t7Y1jaJHDk29YH+iyMkyshEx7MaCkRJdDrtkhmBr4/4qZ7OvbrBjDnQvePODJJJnjQ
	 shebYd/6/akaMoggm1FE2Dqnrb8yK0ztISMxX97RQIMVvoCZPjiYPDQU0AdwZHndQr
	 uudKj2FHIcqrwKFc+aBiuzbQ9vuOg440f27fcU7hAH9AcMqxDolfzchfyzpycyJ1oP
	 m/Hs8Cch8/SyQ==
Date: Sat, 13 Jun 2026 10:20:10 +0000
To: Linus Walleij <linusw@kernel.org>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Yassine Oudjana <yassine.oudjana@gmail.com>, Sean Wang <sean.wang@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Teng <andy.teng@mediatek.com>, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 6/6] pinctrl: mediatek: Add MT6735 pinctrl driver
Message-ID: <PjcK3j_TxnXwwBQ8ATPAPOO6LJl5b0Laa_6eSBTVfEfqsxIcaeDEVS4q4UkvGQA7CLQbuGxopLF6p3eIh1JAIDTkPFIgwp-hVP-fex_WEqU=@protonmail.com>
In-Reply-To: <CAD++jLkA3v0RD1skaanqqG2eN8JLivUQPrYdK+hbX1YhQBgKqw@mail.gmail.com>
References: <20260530145800.1029920-1-y.oudjana@protonmail.com> <20260530145800.1029920-7-y.oudjana@protonmail.com> <CAD++jLkA3v0RD1skaanqqG2eN8JLivUQPrYdK+hbX1YhQBgKqw@mail.gmail.com>
Feedback-ID: 6882736:user:proton
X-Pm-Message-ID: 23bbe0e76ed880a27521d811693ae6c5ed41470b
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[protonmail.com,quarantine];
	R_DKIM_ALLOW(-0.20)[protonmail.com:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-38401-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[y.oudjana@protonmail.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[protonmail.com];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:yassine.oudjana@gmail.com,m:sean.wang@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:andy.teng@mediatek.com,m:linux-mediatek@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:yassineoudjana@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[protonmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[y.oudjana@protonmail.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,collabora.com,mediatek.com,lists.infradead.org,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,protonmail.com:dkim,protonmail.com:email,protonmail.com:mid,protonmail.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1FE0867E59C

On Monday, June 8th, 2026 at 9:41 PM, Linus Walleij <linusw@kernel.org> wro=
te:

> Hi Yassine,
>=20
> thanks for your patch!
>=20
> On Sat, May 30, 2026 at 4:58=E2=80=AFPM Yassine Oudjana
> <yassine.oudjana@gmail.com> wrote:
>=20
> > From: Yassine Oudjana <y.oudjana@protonmail.com>
> >
> > Add a driver for the MediaTek MT6735 SoC pin controller. This driver
> > also supports the pin controller on MT6735M, which lacks 6 physical
> > pins (198-203) used for MSDC2 on MT6735.
> >
> > Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>=20
> Sashiko has good comments on this driver, look into them!

Didn't receive any comments and I don't see anything on the mailing list
archives either. Am I missing something?

>=20
> > +config PINCTRL_MT6735
> > +       bool "MediaTek MT6735(M) pin control"
> > +       depends on OF
> > +       default ARM64 && ARCH_MEDIATEK
> > +       select PINCTRL_MTK_PARIS
>=20
> There are in-flight patches to make MTK drivers tristate for
> the Android GKI. Do you want to use tristate for this driver too?

Sure, doesn't matter much to me since I'm always compiling it as built-in.


