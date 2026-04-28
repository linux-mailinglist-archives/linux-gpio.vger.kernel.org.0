Return-Path: <linux-gpio+bounces-35700-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHawC8S88Gk9YAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35700-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 15:57:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9536D486637
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 15:57:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4784A32342C0
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 13:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D145B3F65E4;
	Tue, 28 Apr 2026 13:16:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E98A3EE1CE
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 13:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777382182; cv=none; b=CbjTD25A8lm+hB+XUBFBpSERnGgX5o43BXmMBmxr6HyapN8sIZLcCXXJPf0raI4w5qPxH/2All4YGoP0bx8nrt69rVy/rBWxGXPjZNt2paAnHDBI6iSKPe1LT7FWNs6zktWQPbb3hLRL0Mc+hBIDWIXIA7TJYYXJQEMuR6OV8eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777382182; c=relaxed/simple;
	bh=monmkM7gb21wo+8zqTXXwraI3buKDt+F0QM6dED3Cro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bF+kM0q8uVB2BZAUp5ZhkFb7fEZ5895asRU3/gv0Q6kqu7vdanGrsnEltkNQxAsToZ6nBKFYkcXi3yr8cp+5/4xKrDm5u1p1ewh/OziV/QKRhl/yS2dy/syMDUN4mEtHGWjfb7RVYO2cPBrOI5Nmg4wP/hmMyushzyQgwMCs6KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ba545100a13so1321904066b.2
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 06:16:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777382180; x=1777986980;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZKb4w8sEYs/FkHjZOB3gkPShePsdAuMuIqa1z3/FMfo=;
        b=J2us6VZ8NbgUd1hLt8VD58algMabUaSWkUVcVx3pWKLNjBVhXgXUwxOTB44MUpSEK7
         W6LWYVOMx746xOWCrAjkcVVRa/IUjdowwLh7nYE5RQfCs6GUg1Xj2pHv93+6oqGxypvG
         IQWKxcLGXMnjea+7o92SGaEERKALN85MLmLT2qCrmQPHPETksXeI3wP1dqxhAqs7C6jZ
         MCiRZlqjcTUGXl+oklGnJJ/N8r1GxtavrtHu1WPocw60nX/n+Zxvivn1dTQHyUTB6OOI
         RfPoJPpdVYoK4+3wIeD5UG5lXPQwc/Tl+zEgKicOsJnqpMB37P3N35KkWm7fonJW4p+H
         VAMg==
X-Forwarded-Encrypted: i=1; AFNElJ8jB5qRt7dvx87Getp+uyw0v4IQ16DrreM7XTVzUi/xiTv9nM0LiZShYnzOrUMFTFCHu19FjhE9J0h/@vger.kernel.org
X-Gm-Message-State: AOJu0YyEBYrff1IFaTzPWykykPEkJlHaMq0OBBdEj/5C53lHpF7Ef+UC
	neyOAQZy0V/7R9PpxsZEtRNiDxZkAuWEMSO892j5Y5HJ2ORMJqZvTTfXC1G9ll1xOZc=
X-Gm-Gg: AeBDietDN7xEPnfPiHDU36RtdfEE1AfQV4w888/Ly5a0AbVVBRRnYkDJNKJO460Hant
	ufYEwvNWMRPefhYywBNLKwjqRKD//p00/XoQ/1zEFE86YXAZ2aoXWWFLpRgAJFWgEq673/IfXUH
	id59xX2nmdWtl6PxW0zVedS3RJwjIN2yTYCCMeK9nsCX0Fql+6Y0fQxVwozmVXHlR/0QeMZ5dFg
	wXPAyZCRL9rt0m9SZyvUGLPtQvmYFjcyyVJiJP4hjl8zDHZcNeEbkJuTmEVyvAdrr7o+pxvSUzM
	BpMmqh/M4fc6tTMSrWUpxt3F2p8wFJYVP5z1pGflV8P6NRygfEODC/aBYWNEcPB9aDA7rHkWTFr
	Klj6js75GEDkJpKZutkj/CkuYlmF0JxmtaSk+iqsp8tcehQA0FdXRG9LpVpmyErbBKrVZ0SV3qG
	WGAFrTb3gwD3iAZ6VtbWEPHlHWmpxi7gY0eR6VIgV/w+TZNb0vAy6YNdd6Azku2iTIHhAwIuUy0
	2v+0Gct9g==
X-Received: by 2002:a17:907:e117:b0:b9f:9e7a:bcd2 with SMTP id a640c23a62f3a-bb80404d9d2mr130404366b.38.1777382179634;
        Tue, 28 Apr 2026 06:16:19 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80853ebfbsm102703566b.3.2026.04.28.06.16.16
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 06:16:18 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ba8472c1613so1636611266b.0
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 06:16:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9fnbGWzu92/DDkj0vDjC+pSDtaNArP9WUgkhGhq84sm2lUJhe8SEYLV8uMuAhTtPWJcDhGGJpk1b9B@vger.kernel.org
X-Received: by 2002:a17:907:98e:b0:b9c:1a5:acb4 with SMTP id
 a640c23a62f3a-bb804537566mr167279766b.45.1777382176315; Tue, 28 Apr 2026
 06:16:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317101627.174491-1-biju.das.jz@bp.renesas.com> <20260317101627.174491-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260317101627.174491-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Apr 2026 15:16:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdULLMbsGf+1Jp0aRFmT=CFD3fY0LvgjHyqVS7-Q-OMBGA@mail.gmail.com>
X-Gm-Features: AVHnY4JbgjbQ08KrMbRoT9ZVPhT2gDYodCeLz6_HhhBZr500c6s0xEMp8-01NFU
Message-ID: <CAMuHMdULLMbsGf+1Jp0aRFmT=CFD3fY0LvgjHyqVS7-Q-OMBGA@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] dt-bindings: pinctrl: renesas: Document RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 9536D486637
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	URIBL_MULTI_FAIL(0.00)[tor.lore.kernel.org:server fail,renesas.com:server fail,linux-m68k.org:server fail,mail.gmail.com:server fail,microchip.com:server fail];
	TAGGED_FROM(0.00)[bounces-35700-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,bp.renesas.com,vger.kernel.org,microchip.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.812];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux-m68k.org:email,renesas.com:email,mail.gmail.com:mid,microchip.com:email]

Hi Biju,

On Tue, 17 Mar 2026 at 11:16, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add documentation for the pin controller found on the Renesas RZ/G3L
> (R9A08G046) SoC. The RZ/G3L PFC is similar to the RZ/G3S SoC but has
> more pins.
>
> Also add header file similar to RZ/G3E and RZ/V2H as it has alpha
> numeric ports.
>
> Document renesas,clonech property for controlling clone channel
> control register located on SYSC IP block on RZ/G3L SoC.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h
> @@ -0,0 +1,39 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * This header provides constants for Renesas RZ/G3L family pinctrl bindings.
> + *
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + *
> + */
> +
> +#ifndef __DT_BINDINGS_PINCTRL_RENESAS_R9A08G046_PINCTRL_H__
> +#define __DT_BINDINGS_PINCTRL_RENESAS_R9A08G046_PINCTRL_H__
> +
> +#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
> +
> +/* RZG3L_Px = Offset address of PFC_P_mn  - 0x22 */
> +#define RZG3L_P2       2
> +#define RZG3L_P3       3
> +#define RZG3L_P4       4

GPIO P4x do not seem to exist, so drop this line?

> +#define RZG3L_P5       5
> +#define RZG3L_P6       6
> +#define RZG3L_P7       7
> +#define RZG3L_P8       8
> +#define RZG3L_PA       10
> +#define RZG3L_PB       11
> +#define RZG3L_PC       12
> +#define RZG3L_PD       13
> +#define RZG3L_PE       14
> +#define RZG3L_PF       15
> +#define RZG3L_PG       16
> +#define RZG3L_PH       17
> +#define RZG3L_PJ       19
> +#define RZG3L_PK       20
> +#define RZG3L_PL       21
> +#define RZG3L_PM       22
> +#define RZG3L_PS       28
> +
> +#define RZG3L_PORT_PINMUX(b, p, f)     RZG2L_PORT_PINMUX(RZG3L_P##b, p, f)
> +#define RZG3L_GPIO(port, pin)          RZG2L_GPIO(RZG3L_P##port, pin)
> +
> +#endif /* __DT_BINDINGS_PINCTRL_RENESAS_R9A08G046_PINCTRL_H__ */

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

