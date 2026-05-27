Return-Path: <linux-gpio+bounces-37576-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHyOAE/hFmpIvAcAu9opvQ
	(envelope-from <linux-gpio+bounces-37576-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 14:19:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5AF5E40F3
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 14:19:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5AFB7300826D
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 12:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 405A7369985;
	Wed, 27 May 2026 12:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SwwCvXS4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157BB26158C
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 12:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779884286; cv=none; b=tJ/9b5tNFcLg8DcicGr5huvibnds+687MYl56OpmGdUkC1NEv4jOCPl1wNKfx9bD6/zBI/GMHYAa7fa1Bl5bfP1YrzrY8S9luCzUmwZ0eO4swq4P2erykrAxbz0+24h6rub/FGNOk6HQSdjohA+0Jp/mhZm6zv/5cOCsLzZlrWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779884286; c=relaxed/simple;
	bh=v0UV+UoiQ0o1JqhjRmQwXCX/FhB7NdaVFJa0JmT2ZO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AwagAKEya7GQeNbrfMaYJYQIMB4XaDPHZXzvEnZWXzOgX1BAptZsDECHww4MMcMLuGIX05/RfTSp2ZYv7GE5kZJ+v871VR4VyRle+TvN8xN9Lo5lwPdK2WcWgJOYpiJ0iuymdsGYsH8/BQZBC832DfVIfm/K/4kYQYp1FcW3EkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SwwCvXS4; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A62B21F00A3D
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 12:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779884284;
	bh=v0UV+UoiQ0o1JqhjRmQwXCX/FhB7NdaVFJa0JmT2ZO8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SwwCvXS4QScB+BDLZZdsUxD+eygE8kIj1OX7jbwPUwjvSDxFvspG2Mh9CmAu/WdPb
	 2tEoWhRI+nYz73tZJoXhQV8fuH+iMyD2q9vhwhykdCScxX8K2GUC+vdorEn/afKe44
	 1JzBoBxmRSeinU48k6+nxudKGsHN7ClR+iH9snR7SVXs4q/eRUrMcZnUZI5TlcbLm4
	 voatQV4xfGvi1Ny4dGvfYMJ//PY7kBFQYXGToBVV1kzMKubDDvjVRtCfIfagEbiy0C
	 pTzd0zhGqf1qM27QMarVVcdfwgKYdU92L3Tn79LdyBWYdUhO9vcVN3NXGoI8ZhRTm6
	 S1LtHi+/v55OQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a877510541so12660468e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 05:18:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9qINSV2n18rFCyhJZlVX0PstfPBMQHmoizbiY1oTabSlqpM5yjiT7K/wPpNLh03aXsVp33ELVULmKJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzqKTNP4sReo+fopK343SwCeMxTxfVP5ByojXjGwz6y4ClXRkm3
	2nP+qn950WirfisiH5ue5/wl5vTXDNkw5tYZKPx3Nfo5jsXqdcY/WcvAuMvQPg80TuX53UWk2T7
	0rHofUGLlQXlDqCA/c5LxPHtibD9+2ec=
X-Received: by 2002:a05:6512:1286:b0:5a8:e5b2:c81f with SMTP id
 2adb3069b0e04-5aa323bc3a2mr7731477e87.27.1779884283417; Wed, 27 May 2026
 05:18:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511031749.32643-1-a0987203069@gmail.com> <20260511031749.32643-2-a0987203069@gmail.com>
In-Reply-To: <20260511031749.32643-2-a0987203069@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 27 May 2026 14:17:50 +0200
X-Gmail-Original-Message-ID: <CAD++jLkob7uLjSvZ+sMJo-Ry7hqE+4oivNErUtccrHZ279ORnw@mail.gmail.com>
X-Gm-Features: AVHnY4L2ohXmrKtTGIZ9dDWTgI6k7yLz_jdtjFDJEj-XWm489h4BZKcPHEY-P9g
Message-ID: <CAD++jLkob7uLjSvZ+sMJo-Ry7hqE+4oivNErUtccrHZ279ORnw@mail.gmail.com>
Subject: Re: [PATCH 1/1] pinctrl: nuvoton: ma35d1: fix MFP register offset and
 pin table
To: Joey Lu <a0987203069@gmail.com>
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37576-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: DC5AF5E40F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 11, 2026 at 5:18=E2=80=AFAM Joey Lu <a0987203069@gmail.com> wro=
te:

> Each GPIO bank has two 32-bit MFP registers: MFPL covering pins 0-7
> at the bank base offset, and MFPH covering pins 8-15 at base offset+4.
> ma35_pinctrl_parse_groups() computed the register address without
> accounting for this split, so any pin with an index >=3D 8 within its
> bank was written to the wrong register.
>
> Also fix the pin descriptor table in pinctrl-ma35d1.c: switch from
> sequential to 16-per-bank pin numbering, add missing PC8-PC11 pins
> and their mux options, and remove the duplicate PN10-PN15 entries.
>
> Fixes: f805e356313b ("pinctrl: nuvoton: Add ma35d1 pinctrl and GPIO drive=
r")
> Signed-off-by: Joey Lu <a0987203069@gmail.com>

No reaction from reviewers so patch applied!

Yours,
Linus Walleij

