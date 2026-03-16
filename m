Return-Path: <linux-gpio+bounces-33505-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNMjKmrTt2n0VgEAu9opvQ
	(envelope-from <linux-gpio+bounces-33505-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:54:50 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 46997297785
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:54:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C2AC93033D7A
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 09:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4918438F23E;
	Mon, 16 Mar 2026 09:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sl49HhCy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADF338D014
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773654475; cv=none; b=MjJlRw+L6PFNcFxElhSBlCceSC8MrnLQ7gsHolwT2uUZjl2wlpSIA/jle8aECXUlbs5hmvHFI3fnhEgjt0jWQAgG+V3br+TnYQq/PjR8VKLeqz4uuG66Vu97KlTsgWF40KhjoWq41tCFfYdDfO8FjsESeE3K+xn7WW0/JKyd3Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773654475; c=relaxed/simple;
	bh=hTO0b//9J6hdEaeoiKx8R3uzY2KOnB6ZXa4y+7/QD3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EtAYzHj3Ucu595I+MxIGZ/X5GNGq/TfjnIkmBdpDUrlidJKKD+huIP5jTh9a8bcVwd9kDK/d1bbTCTZEJk34Csnz6mOc2HKc1tXKWqJKIqS7ZDRiXl5HAwwHOBmNJnkeO/xuyFUAeDeN2KGx1pWhqW7nvsBUu+9RTlOBGtjGZ6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sl49HhCy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C519EC4AF0B
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773654474;
	bh=hTO0b//9J6hdEaeoiKx8R3uzY2KOnB6ZXa4y+7/QD3c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Sl49HhCyKH8k+Hb4iD7CrePHlPwLaDaES5ObsgMvB+ELzbCQJPzuST17v0WXVwRX1
	 z8WdiSRBWqhMq/EObwy1p6W/nj04J+kJ1FKdfYcbM60pU0fQdSqikaU/4ZSrs23r5u
	 Wvow+E4UBYSzA3G2Ggz2n2/NK01BD6G3gKMEoNX72/mSBNwxtLdyLcx5jk/k/ofJU4
	 LOS3VfIAY6gVAt7dFaRyoVLWepdrIuIMcaJi98cbnGQRRh3+yUrBpm1e5Vv8RPDvin
	 u+7sGqdkYIGopcxt6jWStoJiw+/O221CFRZDxji5MxxByUD2lp1ouZjRIh3Mp9E9C0
	 BSuTi8vDIOwBg==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59dea72099eso4531680e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 02:47:54 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz+kRVnMz6yM8LK2Xl325NyqNpv/R2Oj+ELctGr50lOcExy8O15
	7BlaIUFZ5/xbCkhLM8k50PgHfrQv94JbuU9kowKP4+hNmY1quZqOVmVjBLvNyu1c+/h49xIV4m0
	e5Fhp2r+X36vrB7jWbHcGqBETgXOwoA/MjFzQtIfCPw==
X-Received: by 2002:a05:6512:61a8:b0:5a1:2512:859b with SMTP id
 2adb3069b0e04-5a162b27dc8mr4321963e87.44.1773654473396; Mon, 16 Mar 2026
 02:47:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-tasting-friend-eae39148fb96@spud> <20260311-vigorous-steadfast-04afdcc9e524@spud>
In-Reply-To: <20260311-vigorous-steadfast-04afdcc9e524@spud>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 16 Mar 2026 10:47:41 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mf_bXZ2RnJxYm=tvwd6VTyEq6G54L=Byb38bM2sq3o=dA@mail.gmail.com>
X-Gm-Features: AaiRm53OceAgbmYwA2bIdbrB6kT_rOSWVOngjGWPSWu0Bz7x8aUaBEt-bwQGpaM
Message-ID: <CAMRc=Mf_bXZ2RnJxYm=tvwd6VTyEq6G54L=Byb38bM2sq3o=dA@mail.gmail.com>
Subject: Re: [PATCH v12 3/4] soc: microchip: add mpfs gpio interrupt mux driver
To: Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Herve Codina <herve.codina@bootlin.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33505-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,microchip.com:email,qualcomm.com:email]
X-Rspamd-Queue-Id: 46997297785
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 4:18=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
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
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

