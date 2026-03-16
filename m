Return-Path: <linux-gpio+bounces-33479-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOqsDVDNt2kRVQEAu9opvQ
	(envelope-from <linux-gpio+bounces-33479-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:28:48 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA09296FC8
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:28:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2280303CE9C
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 09:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E99B387347;
	Mon, 16 Mar 2026 09:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uCe+Mdtu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21327386C04
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773653247; cv=none; b=oifTp0nmqYlrsKapneMk21TyAcKvJ2wgl7uWhNhVre3vU/R6jxwwrZlcEhEUDVlh0oY9kvl32cS46ACWlz0zgI5MxffaWceQXEkSW+QSqbKU83VclKCjp/wVM1Ro4kQUx2oK+BQFl4ShJDXeJ8RrKqhAnDKxxLX690D9ywBK48M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773653247; c=relaxed/simple;
	bh=2075SDS2E697W/Wwc6aAUT+Nkq77v1+WxTO8AZGoRSo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mkHOQ8evrIZHBSu+R/uIr5InVgy2LTvIrRoamXKYXpBxksZumXW/jZiFGpkVOh5ZHH46E2ODOOa5LohyXVVbB4DDElNaY7bqaHrQq9lThw+Y6PcQ4XiPD2nDWfaTBxmInz002/i6ogfLt/cI6jn0p9J7kpD+ZwRXEPPzHwDDA+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uCe+Mdtu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF26FC2BCB5
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773653246;
	bh=2075SDS2E697W/Wwc6aAUT+Nkq77v1+WxTO8AZGoRSo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uCe+Mdtucr80Oyi6/DEwvBr9vOfKxNAzReJoHwX0FBP19FgU25jeVR516yuPWSWPA
	 N45CbN/BH7ypw+a2fKD1GxsbLdFYAEWX0yhoar/d5teaecMnQ5bBxMrZpP80UwG3gI
	 5hZ/ZeE7DFsQutaXmDReq/l4nAd5IEgl35sFIwofN6cRkhW/2eGM3yWni7uDgCGRpL
	 Hnn30Uh152prnaId6/OppvTfYO+beMS0PggJGqIPpYIr5z2yKcL5HXAWzAcy7+PnPr
	 CO9sKM3Yx/OV2dTuu7f1VY9qkJROorVM9tjJFeo3yZLEST8fSj6FKv9BaIOPCgKGao
	 IIXTMIqBpavzg==
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64acd19e1dfso3948244d50.0
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 02:27:26 -0700 (PDT)
X-Gm-Message-State: AOJu0YwLcG6bfGUmNvWquZLZCW9ErmMVF5JffNTgDXW0lb+PlS2fTGTt
	4eeFGfNTdcSCltbssjJNE1JMvlrhr4LdS4rN/afeHTpU9sLEijR1jtfR60SkB3tZX75pFju+ZSA
	bsi23I0po1zymYZW4tO3fPX3GEz5o5vA=
X-Received: by 2002:a05:690c:6504:b0:799:182:17d1 with SMTP id
 00721157ae682-79a1c200ad0mr117403067b3.45.1773653246121; Mon, 16 Mar 2026
 02:27:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-tasting-friend-eae39148fb96@spud> <20260311-vigorous-steadfast-04afdcc9e524@spud>
In-Reply-To: <20260311-vigorous-steadfast-04afdcc9e524@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Mar 2026 10:27:15 +0100
X-Gmail-Original-Message-ID: <CAD++jLnXBW7FDdGRt3rN5Up6GdRvu-Ywsg8jfepjEf4rBjPQ6A@mail.gmail.com>
X-Gm-Features: AaiRm50FrysZdDLlfNrm-B63ONOL6pT_4lfzAVob6hJh5NZnRj5j07-W2lGMtDY
Message-ID: <CAD++jLnXBW7FDdGRt3rN5Up6GdRvu-Ywsg8jfepjEf4rBjPQ6A@mail.gmail.com>
Subject: Re: [PATCH v12 3/4] soc: microchip: add mpfs gpio interrupt mux driver
To: Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Herve Codina <herve.codina@bootlin.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33479-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:email]
X-Rspamd-Queue-Id: CBA09296FC8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 4:18=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:

> From: Conor Dooley <conor.dooley@microchip.com>
>
> On PolarFire SoC there are more GPIO interrupts than there are interrupt
> lines available on the PLIC, and a runtime configurable mux is used to
> decide which interrupts are assigned direct connections to the PLIC &
> which are relegated to sharing a line.
>
> Add a driver so that Linux can set the mux based on the interrupt
> mapping in the devicetree.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

We need a piece of accessible documentation that clearly defines
the difference between an IRQ mux and a hierarchical IRQ chip.
If only a post on people.kernel.org, just something to help people
to know when to use which approach.

Yours,
Linus Walleij

