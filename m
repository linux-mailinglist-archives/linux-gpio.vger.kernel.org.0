Return-Path: <linux-gpio+bounces-6957-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F738D4D3A
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 15:52:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8A261F235A6
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 13:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68DC7176259;
	Thu, 30 May 2024 13:51:34 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EBD186E23;
	Thu, 30 May 2024 13:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717077094; cv=none; b=Kveejus5rd1aZYjBT0Vxbork7gWAYqTxZlOTgqPrAisPb7o6E5piB3a4ojIilyQR4chIiZOQAaYhcC3wgI4QVLr+L+L61dY5RaPO+5deYKxMcLVJME29ZYdyQpFvgUTvUTsqo94ZWLmMNDtr0anWsHef51ePenTSQb6e+z/oHpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717077094; c=relaxed/simple;
	bh=WXRwnyYB7bDSA9Rx69zvpF0BJZUOYwJ0tzSvsjM9vCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rbURecUEY3pAJ+wEahM3GdUVIF5VsrtnAL0xVBoDDMDT0k5uD0+hjk0PZtogxVTZw30XqpAX3yHa58UBdYalIf1Pg9gWs57Q4ahEiz9h+a+icQ1cy86C1RR6PNIO0viSx1Itrcznu3yAWC879H+Xn/sZWcc9XkQLjlISMqtmLao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-62a08b1a81bso6881427b3.3;
        Thu, 30 May 2024 06:51:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717077091; x=1717681891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=74wpAuguCpnWBbRGbhRHB1PlEAvRSrtZrMo9vggtinU=;
        b=pUP1gEpgfpA65vT8nm3hP6rAoJgRapMp8S++ntRqXVwXc/NQH8V1ksSDwQC+z/m71g
         NBd9SsVZMNQzqB9br92tVWvX7kMmwXfSh8rK2WBNparyS0F+lS1L/C6WvXlFiiqPhEz7
         g/r336nFwYOcbph4lMwdU9wsvPtL6eM7HM19Fl+3P0d1ywn4w1CT8B1NHLr+uZ7Jhsch
         pxlJRT3qT9ar8+9FVVnKZ9qzFiLX9S7hAeyys3z7vIiEro5jBW1She/uY1xaefw/zrQW
         ZTAAC4/ygTRxRR3MlUsFSWJWAUMjpDD3yy95jF1LS48KUw0jv+PpbjHcKaEUwvq9edV4
         o8Eg==
X-Forwarded-Encrypted: i=1; AJvYcCUV+x5lJAGiIJ/P5t0I0iV0MK9Fmh2EaLrl6yjkVi1S7+SNGBBC176kYuTO+0Z+im0pkhef01xXsnXcjOk+qc3jFzF4AwDKtc6pCyvIlxWZe2YQmYFYi+GzXRmyMUviHP6uffHDDR2B8Do09fJTJt1boZe8z0PcaVPh3QXRRrbFVKt3BUqPCBjO2CuQxX+pTOqdXXTqjLB7FmCxz5Se3g2XlmLRpy0yuQ==
X-Gm-Message-State: AOJu0YwpRoZoSlyFoF+lyqbYIaO+PmoRR482fHx1RR43tVG6ipsWimp9
	WvD6atq0IEYD4uqLxOF4/1rv1VZdCVhFUmp/tBJ8oDN5n5/ZWQfmcABLPpZw
X-Google-Smtp-Source: AGHT+IExGP+dcLiiFcfq/YaN5DeVrQ0IW53fG1D9ZEU8tF69fo+M7qZGSOclJv05inzxQOJ8jM5oaA==
X-Received: by 2002:a0d:d997:0:b0:61b:330e:3f25 with SMTP id 00721157ae682-62c6bc1492bmr24330317b3.30.1717077090645;
        Thu, 30 May 2024 06:51:30 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62a0a37ef12sm27875517b3.2.2024.05.30.06.51.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 06:51:28 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dfa67a3e702so454765276.1;
        Thu, 30 May 2024 06:51:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXi6LTssxsmQXMv4F0JYmVSRII8ylY45cbqCmzyzWdTKAgq0LEhXupS16TF9mDhNKAIOA8V1GRNNizIxrQYMg8MTmoXwof2akSm+8o1lMBKD/dOKHJ1K1vu71x3UrO+DR46+t/UCysJ5LCi4DQWX9SK9uCCzaB16CLkrLhQDfIC7avo1nSv8UC0DlUwDfQzI2bV0f4cf9TT05wO3lsZxWEjJZ2xzqiCTQ==
X-Received: by 2002:a25:6852:0:b0:df7:8291:d109 with SMTP id
 3f1490d57ef6-dfa5a80f6demr2470600276.59.1717077088152; Thu, 30 May 2024
 06:51:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240524094603.988-1-paul.barker.ct@bp.renesas.com> <20240524094603.988-8-paul.barker.ct@bp.renesas.com>
In-Reply-To: <20240524094603.988-8-paul.barker.ct@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 May 2024 15:51:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUMmBCkZdL1Buzp_AE3j0efAR6Q0MH998tm9Z+kTLQ4zQ@mail.gmail.com>
Message-ID: <CAMuHMdUMmBCkZdL1Buzp_AE3j0efAR6Q0MH998tm9Z+kTLQ4zQ@mail.gmail.com>
Subject: Re: [PATCH 7/9] arm64: dts: renesas: rzg2l: Set Ethernet PVDD to 1.8V
To: Paul Barker <paul.barker.ct@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 24, 2024 at 11:47=E2=80=AFAM Paul Barker
<paul.barker.ct@bp.renesas.com> wrote:
> On the RZ/G2L & RZ/V2L SMARC SOMs, the RGMII interface between the SoC
> and the Ethernet PHY operates at 1.8V.
>
> The power supply for this interface may be correctly configured in
> u-boot, but the kernel should not be relying on this. Now that the
> RZ/G2L pinctrl driver supports configuring the Ethernet power supply
> voltage, we can simply specify the desired voltage in the device tree.
>
> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>

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

