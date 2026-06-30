Return-Path: <linux-gpio+bounces-39189-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4eF9F1WpQ2rteQoAu9opvQ
	(envelope-from <linux-gpio+bounces-39189-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 13:32:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3FE6E3A26
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 13:32:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="Pp/Vx9o7";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39189-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39189-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8758430D4EE7
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 11:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFAF53EF0AC;
	Tue, 30 Jun 2026 11:17:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B130F3FFFB9
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 11:17:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782818278; cv=none; b=KraQADDBg8799k54X6U54b3PpYGLPcmA086IypdgiCuepGIOpuhSPLxK9jjnMhDBi1zGbOGRzL+PjXKqvrLj6hLzr9pUsEzXuxCsnEugt3aHfhjnURjTmYVf57LWQqpAKVP+0ocMSq9ybPQKt8zlSpx/kNDe+uvOeeK2DN5m6u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782818278; c=relaxed/simple;
	bh=yxWYFypKe8y01eo76tZUt9hvhCGD0P07VdmXzqAFk9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gr23NLZoGLeaUS2l3EW8n4e2bqZOAHstkW+7r4oQ18Y2nGK9BJjz4dAbX82clDZ9hIoE2uNK1qASr6+Q/R98x+YmEk4doa5yIlAGP+7wjT9M7Uw34zNYxYwIsncYQ9Hco1mEIyXmzxWTx6hWEafFDMQmCv4SmE+m+FM2ntSyQX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pp/Vx9o7; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D0631F00ADB
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 11:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782818277;
	bh=yxWYFypKe8y01eo76tZUt9hvhCGD0P07VdmXzqAFk9k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Pp/Vx9o7LARmVE3umUis2ryH3Qz50yuFOrvN1AuKqxQxVgl/uCM21huHARJce6fxb
	 vD+t07Qv00g6zt7be1w5gZz3ffqiNv1HQW7ipXiqStxNDOwenJwP7Gp5xDKaRSV4C7
	 ja2LSY31tZelA5olPHOj2jrJm5tluwq51U7wS3l83bjh7WXp9MGLiLFPKmKCTLo4As
	 /GlJnrlbMbJi3ziU0JrNCqZQ1DO2drar+VnBvf9MvpGud5XCoQ5DtltoC+KVv0AzAM
	 7fwoPnbmYaMZ+xi+HWaDeOpDpHwweSSBwn4n/1fKr8+Atl28omzYNCZIfOk/bTvw2t
	 7KKysrXAoyD+Q==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aebd77cbb4so633029e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 04:17:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RplTVHzMcNXILFSCUxWIev9541ndRWsLXSUVDoAFC/CMYgK20n+BiPPUy283NCeQFa1OzRdsC6HtZjo@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu8gUnOtb8W2kbt1qMQQOPJxDZ8o8GOUXTZzzpzRZSmz1tCS3Y
	YR0eSCWobWC5IfLyNeD6o+vGSxIPpHNOec1npFIKetSVt9BUagEiCCJK1upmXXzvLC23RICvaFu
	KCtzPX4cHB2eGpsLlKLdsRv9sQkNDY9g=
X-Received: by 2002:a05:6512:12c8:b0:5ae:b7ce:9ca5 with SMTP id
 2adb3069b0e04-5aebdb9f97bmr823000e87.18.1782818276164; Tue, 30 Jun 2026
 04:17:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530145800.1029920-1-y.oudjana@protonmail.com>
 <20260530145800.1029920-7-y.oudjana@protonmail.com> <CAD++jLkA3v0RD1skaanqqG2eN8JLivUQPrYdK+hbX1YhQBgKqw@mail.gmail.com>
 <PjcK3j_TxnXwwBQ8ATPAPOO6LJl5b0Laa_6eSBTVfEfqsxIcaeDEVS4q4UkvGQA7CLQbuGxopLF6p3eIh1JAIDTkPFIgwp-hVP-fex_WEqU=@protonmail.com>
In-Reply-To: <PjcK3j_TxnXwwBQ8ATPAPOO6LJl5b0Laa_6eSBTVfEfqsxIcaeDEVS4q4UkvGQA7CLQbuGxopLF6p3eIh1JAIDTkPFIgwp-hVP-fex_WEqU=@protonmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 30 Jun 2026 12:17:43 +0100
X-Gmail-Original-Message-ID: <CAD++jLmwYVGbfJk5WpN1kBJJ1r74Ja4JOfNB6iNdvDCAvB51NA@mail.gmail.com>
X-Gm-Features: AVVi8CdsW-ifP9tBu011_-zch5iumUPieAs3JkBwAhQtx4Bpw01RxsGY5oIOGnw
Message-ID: <CAD++jLmwYVGbfJk5WpN1kBJJ1r74Ja4JOfNB6iNdvDCAvB51NA@mail.gmail.com>
Subject: Re: [PATCH v8 6/6] pinctrl: mediatek: Add MT6735 pinctrl driver
To: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Yassine Oudjana <yassine.oudjana@gmail.com>, Sean Wang <sean.wang@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Andy Teng <andy.teng@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39189-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:y.oudjana@protonmail.com,m:yassine.oudjana@gmail.com,m:sean.wang@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:andy.teng@mediatek.com,m:linux-mediatek@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:yassineoudjana@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[protonmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,collabora.com,mediatek.com,lists.infradead.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,protonmail.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF3FE6E3A26

On Sat, Jun 13, 2026 at 11:20=E2=80=AFAM Yassine Oudjana
<y.oudjana@protonmail.com> wrote:
> On Monday, June 8th, 2026 at 9:41 PM, Linus Walleij <linusw@kernel.org> w=
rote:

> > > From: Yassine Oudjana <y.oudjana@protonmail.com>
> > >
> > > Add a driver for the MediaTek MT6735 SoC pin controller. This driver
> > > also supports the pin controller on MT6735M, which lacks 6 physical
> > > pins (198-203) used for MSDC2 on MT6735.
> > >
> > > Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> >
> > Sashiko has good comments on this driver, look into them!
>
> Didn't receive any comments and I don't see anything on the mailing list
> archives either. Am I missing something?

https://lore.kernel.org/linux-devicetree/20260530155503.9A6C41F00893@smtp.k=
ernel.org/

Yours,
Linus Walleij

