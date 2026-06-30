Return-Path: <linux-gpio+bounces-39223-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3mAKFf3DQ2qQhAoAu9opvQ
	(envelope-from <linux-gpio+bounces-39223-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 15:26:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE8C6E4D3F
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 15:26:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=dmgyYO+r;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39223-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39223-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4AFFC3010903
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 13:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C9AA416CED;
	Tue, 30 Jun 2026 13:26:18 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345CA40911F
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 13:26:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782825978; cv=none; b=Pt2PkxnoKDLZUxg5kCjdBusyTF4S/9/yAYIAqL5BcC9MJkXn3+zf8iQGY8tkEl85Tl/Ife2MlaTmPeR/6aQ5ySmZeWJYNrQVreCds4WQb9OlefHZXihWwXRpgnbFblZqyXTQt4cnYYjURR30Ny8xXzyfX5iCBwdAO2me6WBk710=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782825978; c=relaxed/simple;
	bh=PHCkKadEKt4yRgpoPFyBrfwAuMsh0mdSIVRR430t+2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sPSXW+UAJBW0YZmfzENjLxGunE4qBbTymcGwAa/DBWif+uzD/3Tb3QLxdcyx/sBRn+2ucklmzxuTus0F8DHdLQ2wy16h1Jf/pWIjAqstOmTmW8tAdHtGfZhA86ODfLhYLslfXJdcGnueczTH2EakE05z/1Kt0hdv5j7h7uxPxeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dmgyYO+r; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3ECC1F00ACA
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 13:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782825976;
	bh=pXygJ/RMTPQNrcPVAiG6RR6YqxRwAnw6sxAPhTT6WAQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dmgyYO+r/cqtUF5r6CPFKYWEvoAeyK/FSjcn+dry/Y41At+kX7GtDMuHKEZvta2hP
	 BexWcZI3mbV6524/BbhQPJD2T5IV+I2WBJ0U7PyNYY2m70b8cTetFZ3CcuqHaYR8+6
	 qV0vZvmnFmUs8pQpn3RoaM6q0snZsxjfKOKYyimMcU8VFDBQlJtNt31H0UzfDuDUuC
	 hh+iqyi1nPhfmqyLcQhslNQ65XBXgRL4G7KHo8EtXetzpVyN9OAzGRAwgVEn6h28hj
	 FnzI/7sXqIFIwEAZYdIe41KOl1qVK3A/INI51/ndogFTFvyNqUGX6cNf6MRHYHeXOR
	 /8dd44xkBBM9w==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39b237fb695so4457481fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 06:26:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpX8/A3/NcY28MTli+pxvoTSzHL8+f7976CSzMCglK/hgSxu4ZhoyoPsqAx+RKDdgdXPiKooOzQYISX@vger.kernel.org
X-Gm-Message-State: AOJu0YwqPDvTMSnQKHBxXUV7HqKOr/4oKLMcGlZlOaNwNWyiwxCJZv1V
	CqF3IIAsplusGwbS/74BsLbK6YSa0MDnQ1580mUDnmXXAz233x/5i48EnknTgbQKABN8NWs4AZj
	L01UjX4yF5/BIo/CngcrzRH3xhWIw3j8=
X-Received: by 2002:a05:6512:a354:b0:5ae:b270:505e with SMTP id
 2adb3069b0e04-5aebdb7d428mr680479e87.1.1782825975726; Tue, 30 Jun 2026
 06:26:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617043654.2790253-1-mikhail.kshevetskiy@iopsys.eu> <CAD++jLmY6Ase3hPC00z_kAJe+vJBUyrEHZEAOcWqkiuFnRGCcA@mail.gmail.com>
In-Reply-To: <CAD++jLmY6Ase3hPC00z_kAJe+vJBUyrEHZEAOcWqkiuFnRGCcA@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 30 Jun 2026 14:26:02 +0100
X-Gmail-Original-Message-ID: <CAD++jL=W6oTH6SszTXzESrQfbnb4=MDhGa2MwFZJTxtfZWrL1Q@mail.gmail.com>
X-Gm-Features: AVVi8CdMqlD-NNESA5p_L_MjCXc2S_nvvYlYGQu1Hdjs5hWQXyMGqa8I_zRSf2c
Message-ID: <CAD++jL=W6oTH6SszTXzESrQfbnb4=MDhGa2MwFZJTxtfZWrL1Q@mail.gmail.com>
Subject: Re: [PATCH v4 00/14] pinctrl: airoha: split driver on shared code and
 SoC specific drivers, add supporf of en7523
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	Markus Gothe <markus.gothe@genexis.eu>, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39223-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,genexis.eu,collabora.com,vger.kernel.org,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mikhail.kshevetskiy@iopsys.eu,m:lorenzo@kernel.org,m:ansuelsmth@gmail.com,m:benjamin.larsson@genexis.eu,m:angelogioacchino.delregno@collabora.com,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:markus.gothe@genexis.eu,m:srherobrine20@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,iopsys.eu:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CFE8C6E4D3F

On Tue, Jun 30, 2026 at 1:09=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
> On Wed, Jun 17, 2026 at 5:37=E2=80=AFAM Mikhail Kshevetskiy
> <mikhail.kshevetskiy@iopsys.eu> wrote:
>
> > This patchset
> >  * fixes more airoha pinctrl issues
> >  * split combined driver on common code and several SoC specific driver=
s
> >  * improves an7583 pinctrl support
> >  * adds support of en7523 SoC
>
> No comments for two weeks so patches applied.

I realized there is v5 and v6 which are still being discussed so I backed
these out.

Yours,
Linus Walleij

