Return-Path: <linux-gpio+bounces-7165-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AE18FCBDB
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 14:08:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4ED051C238EB
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 12:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 073FC1AD9F0;
	Wed,  5 Jun 2024 11:53:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323021AD9D9;
	Wed,  5 Jun 2024 11:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717588386; cv=none; b=tm0D9mBtd/buAfhy0utojSJ6RWAXfCm417fMSGVWVkwJgdtgrvVFiP4ZQEjTMfCZ9t+LIu17DcT/BLzRCVzB+wAPgY7vivMSa7Q2hkC60ERliLC2i51yVNidLgNIJuCuJqxxjqXaS5sHcvrz+030C1xH6n2ca1IcsZLoUu5oHX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717588386; c=relaxed/simple;
	bh=mOTddhvoIT8wiG4yUHyU53/TGeJ/YCSolJbafPJ+9hc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q0pFnAe0DieRGpOeC1skadAKt/W5yaTCscnSiQJcpJr+XieIhFhnTl2ffd/9WQjOZ56fZ11CdTAEkPG4qmxTeZmZAx/tyCTlUNwzDf2duTKhn765fUsYtcbzq/+44TCTxoOgIO4Ueph7/oCz13XvHL7dsjc4d+Uoba1i0snVIFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-62a0c011d53so66615147b3.0;
        Wed, 05 Jun 2024 04:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717588383; x=1718193183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JvsArExPEXHFssWhjY92c/ZACw/tmf496Y0sek86XvQ=;
        b=J6X6O9PLgcVmou5i43j+oU0TpCd0JsH9kciW5EicuLmeFnV7IMieCZW5yiA5lurhbg
         1zwkOp0OZST1n8WRHTuojyzd2HLrMh01+LwgeC35TgDna/r8uj5h6QAl37hlHK5FnacC
         m0N/BxWgIENHg/77mTpBjE/aLeq4U37mZVWsjFx0mvhwYUrRs+j+gz3uA3WmzhQ0qdwi
         BCnCqkaiXeLroaMKx5cbd/+o1FYGmdpRknwq+zZhn0ipf/CM7m7gKmssC+r0h+8MtRF7
         Njb8y0+PSGRZIks36Z/H9dvhNydPvgCheSKI9GcuaiMQNYKOd3IK2JMhGdvLhroazY9A
         T/Vw==
X-Forwarded-Encrypted: i=1; AJvYcCVXmZGEzVtJ0pVooAfxV1yLk0H0eW4Ypx2bHOzuYVH3hzIYjzloDLPFuKTU7GRGn8Lg66h8RY7zYbbzfe1Af1gtaX2sCqC/fHg/OOumW+wgsKVg05AWDmY5Xc7v5IW3EtIt3MLq5hPq2Ipom4o7RFFrXmj1PSnjroJ21o0UlHEeLG7wJvuj00E+cJTl2npvp4MaqVN22Mkvxqpxi8q8eNeGTFQnTbgRuw==
X-Gm-Message-State: AOJu0Yzm3TlN9X07slgeJRX52DkzgcF6z2U4jbCaztxkgi5DeAyyq63h
	BKxcTXndTg2/JNFk7MhhNpJhE0wkyB4zFgQAn+BKdZtRndGgb59Um0wOTTwA
X-Google-Smtp-Source: AGHT+IHNI9uwSohrVqRAJve/+ajVyEz/IrZGm+1MpwFZu7/JDpaYwUeEJEdALHh0+09W0W8e8W0uyw==
X-Received: by 2002:a25:3c42:0:b0:df7:8dca:1ef4 with SMTP id 3f1490d57ef6-dfacac3a472mr2231445276.21.1717588383408;
        Wed, 05 Jun 2024 04:53:03 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-dfa72956a8asm2546650276.18.2024.06.05.04.53.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 04:53:03 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dfab4779d95so2569777276.0;
        Wed, 05 Jun 2024 04:53:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXHlkvl7NAOXssnhWBdrXd0sizsZVey4PLAFJHL/w9ETXuzkHZgUj3cOqfYL+sUapKn/1gB+M/pSzMjesD2tEYHq7aDQZZMWE8KCU22s9uAaoOwB1lBwXqjjJVhL0jU/C2A9RbgZq7jRwOqEO2fD2LVi6ZTkg90WTLAN37DSx3GA9l79ziy5/K445gZEMgZ2STrCVGmOjjaTF8+2dyWf2xdjIxkMbampw==
X-Received: by 2002:a25:aa31:0:b0:df7:8b9f:8188 with SMTP id
 3f1490d57ef6-dfacac5f750mr2508080276.37.1717588382994; Wed, 05 Jun 2024
 04:53:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240530173857.164073-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240530173857.164073-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Jun 2024 13:52:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX-rrGNQgTnPjG+NSiGD_NmAxeNqgzKCB8p4W6s12VMKA@mail.gmail.com>
Message-ID: <CAMuHMdX-rrGNQgTnPjG+NSiGD_NmAxeNqgzKCB8p4W6s12VMKA@mail.gmail.com>
Subject: Re: [PATCH v3 07/15] pinctrl: renesas: pinctrl-rzg2l: Add function
 pointer for locking/unlocking the PFC register
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Paul Barker <paul.barker.ct@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Thu, May 30, 2024 at 7:42=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> On the RZ/G2L SoC, the PFCWE bit controls writing to PFC registers.
> However, on the RZ/V2H(P) SoC, the PFCWE (REGWE_A on RZ/V2H) bit controls
> writing to both PFC and PMC registers. Additionally, BIT(7) B0WI is
> undocumented for the PWPR register on RZ/V2H(P) SoC. To accommodate these
> differences across SoC variants, introduce the pwpr_pfc_lock_unlock()
> function pointer.
>
> Note, in rzg2l_pinctrl_set_pfc_mode() the pwpr_pfc_lock_unlock(.., false)
> is now called before PMC read/write and pwpr_pfc_lock_unlock(.., true) is
> now called after PMC read/write this is to keep changes minimal for
> RZ/V2H(P) SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3
> - Introduced single function pointer to (un)lock
> - Updated commit message

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

