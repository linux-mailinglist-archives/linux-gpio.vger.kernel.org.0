Return-Path: <linux-gpio+bounces-7168-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1858FCE99
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 15:12:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5FABFB26380
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 13:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4D0198A2D;
	Wed,  5 Jun 2024 12:16:42 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E240F198A17;
	Wed,  5 Jun 2024 12:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717589802; cv=none; b=gN3w/zvnCO1zkHyLsz6Y1fpAlH2alqZ7ba0b0GUXWHXiHF65Btua3RkYTvQv1fJ8fjrHCgv+Xcn4pAiHn16bU2IZSRV0l1EyaMEzSS1IULCFu6IRAHIktLGoQWbMLb/yxzZEK6qkbC1dGrVV8srMKAT1jsXwbvXRXV8b7n8QCVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717589802; c=relaxed/simple;
	bh=U0agN75JgNl8mVGLegBvB584SvOkbcwV93Nhzk4E5Dg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E3eYHm62aIeonAOyvDLpbD8Pz5cDyyjAkLd3Ih3lXFA/D6Uduc4fJ392SGCocwRsf4W9f1K4LkSj3r4uz/9dNbQTPOUihsy1WxNdE1VL5pxJjCmiV66cRh80yt9WkE/DqJ98Tr+J+CRPGroNLmxo7ANy351QoiCIuHb+xkn3qaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-62a0c011d53so66901217b3.0;
        Wed, 05 Jun 2024 05:16:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717589798; x=1718194598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jNnNjMa9gaKBRLMlZIPM5UJYAylX5W6oIYoAGFp4mPs=;
        b=crM0lnxXMXBjgrvsvPnXtyxHOp4xeZEf6A6bNGUPQdZxoESlyww3Df7UsZpTsX+d1n
         EnMeeuQDwUJDAedKiAdhVGIITl1qYRNSxalkIpkJwKIc1WKTvuHmXLR9mTHkfvr7KDjz
         V6pBDI6lVCvfpw6rv9x1mltKFI0Uq5o3uaLFJwBbmTzyK2Xh+R7wqZJui4ejfulPM5HC
         x1LUGLHHit5kVez1of7zsjEeoh188wbm4nkJoc2xhjR7dshm2bxMXD79Ru2cyxfIRInK
         muemaTgIm0GO//Z3QitunS1R41XiW4BU7Jk4dWrod6CSglGjSk/sfcL90qSdTPgE05mh
         yGfA==
X-Forwarded-Encrypted: i=1; AJvYcCWa0hFVFj2/69GHwFmEg4AKq+t1qK0qjUba7leKuERWD9RJ6SVvgMCDsW+GZnoLynsj6xJn1Wwkgb/V5HK59O+Gj72Z07duDHinaK8YlfjJwfjUlz3PWClszrJ6RhSy9jsJHXPlMNV7Wb2lAJW5t7MGaiJhMCc6mEEiz0RPyFk/T+U/JxSetfN7u5jVqoWBAH7xVc4SVPj+vGmBmYIp1Pb/HncAUYjWEw==
X-Gm-Message-State: AOJu0Yz/iOOfNgMRNUVDabNN0+knrk3hqwtPpFFNSnAshWy6KQjIuaxa
	P+5RTwDV+PGMQl1d/SIMOScrcNhdi2o/wOMqLLQN4GSM1myN3nFZJNhRk63L
X-Google-Smtp-Source: AGHT+IHaSYkWjKvfeTsbhCk1pjzu703gDEeGPVkBxA/iHR3so5alPvKoBfehE+Crm4EnTUzo7iD7vQ==
X-Received: by 2002:a81:ce0a:0:b0:61e:a3b:e473 with SMTP id 00721157ae682-62cbb4aa7c1mr27266217b3.7.1717589798016;
        Wed, 05 Jun 2024 05:16:38 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62c765b7ec1sm22065247b3.10.2024.06.05.05.16.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 05:16:37 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-df771b6cc9cso6730887276.3;
        Wed, 05 Jun 2024 05:16:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWYO9BjJDumGzqV7FF4MUMIgAWRLYSJrvkJlH2xjNs2HVHjVjkDFeU37hPMVHcjU24TT1M4RpmsYUV/DUtcwo/a67UEgAvcHnHzZpzO2D7IONEezWZqaViEV7mhepiVUloVMYS/rrvZdYQIJIgTC6pYPivPn2a0eWcCnwYjYLe34DYSvdl0BBnOxGykfbtMQXQqX+0JzFFYI3r+xedO5wlKPNEvFhSK+g==
X-Received: by 2002:a25:d683:0:b0:df7:83fc:639 with SMTP id
 3f1490d57ef6-dfacac56c3dmr2669884276.27.1717589797462; Wed, 05 Jun 2024
 05:16:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240530173857.164073-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240530173857.164073-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Jun 2024 14:16:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUT4pfj7K1LorLc_g3vS4+3VV++TdympCxFmKg0dPoXbw@mail.gmail.com>
Message-ID: <CAMuHMdUT4pfj7K1LorLc_g3vS4+3VV++TdympCxFmKg0dPoXbw@mail.gmail.com>
Subject: Re: [PATCH v3 09/15] pinctrl: renesas: pinctrl-rzg2l: Add function
 pointers for reading/writing OEN register
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

On Thu, May 30, 2024 at 7:42=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> This patch introduces function pointers, oen_read() and oen_write(), in t=
he
> struct rzg2l_pinctrl_data to facilitate reading and writing to the PFC_OE=
N
> register. On the RZ/V2H(P) SoC, unlocking the PWPR.REGWE_B bit before
> writing to the PFC_OEN register is necessary, and the PFC_OEN register ha=
s
> more bits compared to the RZ/G2L family. To handle these differences
> between RZ/G2L and RZ/V2H(P) and to reuse the existing code for RZ/V2H(P)=
,
> these function pointers are introduced.
>
> Additionally, this patch populates these function pointers with appropria=
te
> data for existing SoCs.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3
> - Renamed read_oen->oen_read
> - Renamed write_oen->oen_write
> - Updated commit message

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

