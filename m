Return-Path: <linux-gpio+bounces-30291-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB21ED051BD
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 18:41:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 975EC30299EB
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 17:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF3A22E62A6;
	Thu,  8 Jan 2026 17:37:29 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF1E2DB795
	for <linux-gpio@vger.kernel.org>; Thu,  8 Jan 2026 17:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767893849; cv=none; b=YqZBiq5GQQ7IUwoVL5BZaCHqXfIfEcoGlfwr+FCxyz+4ar/wwXyruZnb0MVa8exLze1ndim1+/eHCodycviE8osYBP1M5cKr4E1FmepG/CIy0hgD5AYNbPT4WwWUtAtJa7ptbrLAlSOLESSZTmcI4IIY+PbpuAGNbgoRA6mZHoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767893849; c=relaxed/simple;
	bh=kxt8Z/eOzDR8QTdq82tH3tFzi/nv7joHVar+2fJEnGw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TcX49II1RficaM/B1f6XqUt/9cUjA9WtE6Zkd/ZxPo9nswHZ9uLxTWIeNVLunAHlbDXuBaNYaSgIx4xgupsLbrmheHDVytKcPR+GBpfZV+MTc/KTFQdxFUxN+ICbAR6v5fwQbuGfoZDs/SjLaJizDjpMqNnHMDjag9GM+9qx0Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5ebe501b49dso2409163137.1
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 09:37:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767893847; x=1768498647;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iuLxhRuKEoA1AJQlWe0gFW11le5QfNFd2Qs+Txydjh0=;
        b=MFbOlyCniDXyXjVC+Wg2W6zo62oBfyUevdCB7TXBI6nbib+D4Rz+ERnd/pIbkU2upS
         LJA8S2sIZ/moi/rHQ6qpNK65lKS1VlYjnjpzwBtDJjph3DpQDPEXGWPQzVDCkXpjM9un
         NJgIAPAIpq/k3NP4MkmepHxuO3akFKda74hooU3zGLMqr2vA5F7Y6sZQ9C+71/ILhgCX
         0bTvWdMhqJdMSYUtkmrWOrV13wmBa1PPqr6KfyVvKflOaiIPiFQj7I/m4qVfY0qAMUlD
         CZt9iu52o1Lf7z9GvNLJQxpLpndBm9k7Fd6LMHwyHjOBX6dNH6i4bB5Je5jES6NUMjgP
         WxaA==
X-Forwarded-Encrypted: i=1; AJvYcCWTsv8UUUtcmsbKbY+D3eARLSHnOP4VsVuyUKQh69g6/Zk82vKWELZ0atj83WswCV2jfSo508ShIRgI@vger.kernel.org
X-Gm-Message-State: AOJu0YzKEaEg5cvEJR0Bsqx2YKnEQ9FoP9HpJ50DRigxCLPAheDpXfgG
	ez/NmvSu0RD7m0mX1cAeWSHJA2RC98zrdnB2CbSIiY55c+Z1eGv9aWkRzixfzXYT
X-Gm-Gg: AY/fxX5rOy1bh8GqnP9RTpXrvCIHqmhJDHKWVvTbxMo9SagKdPCvvcWVM5OVpHUuffn
	7vihj/xv8AXPYvnroezGesVyuWRgfoklTCd+QYC6S9WuLcrFq0OWUX+x8UFXkNAePLEqfqrw/cP
	wqbidaYdhYwKRGZe8nQegw65xf4U4VrF+fQP4IYLOoiGyrADWISnAjTp9pyL7qHX/FXrOwewU4r
	3fEXvmsZV9OR7WsEiNC7edVzTX6cjg2PIhruVticAv6RT6JJ4pLKyEyiyAPTgNBtPnrnvTVfJEb
	pGpty01gHjtlvp8H5RbquZSwfoGzQQqjif2rap80Y3uXnihlld+Y0EYhhW+bwyKEtvs+uH+JWK+
	no1Y2oMgSZyqpmWoiHaQ6Lg3kyJ0Z4pG1p8X9YjmJeVpctDQT6Ug+i89n2ZY+iBWOlWLMrFlTVm
	FEShIXgjpadIOC1owo54pFm68ajZVN5hTGWPPXGBrxu8q/1zgBlmv1
X-Google-Smtp-Source: AGHT+IFiJOQ6DyLse4xTU3QdHqAd7VSXHYVj+8ervragwKuY9tlvc+pqX9zUlB9zpewlisegMofhLw==
X-Received: by 2002:a05:6102:cc8:b0:5db:e32d:a3f4 with SMTP id ada2fe7eead31-5ecb5cb9399mr3070185137.2.1767893847350;
        Thu, 08 Jan 2026 09:37:27 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec772af325sm7007388137.10.2026.01.08.09.37.26
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 09:37:26 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-55fe7eb1ad1so2626079e0c.1
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 09:37:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUGSTJWv/RIJRkBTO4kfDZc2dFEBPXrsWsWNsNG7ZzDhA59aANegIFircX24tL3JM6uiGPL/nv/JkBV@vger.kernel.org
X-Received: by 2002:a05:6122:8c8a:b0:559:7077:9a8f with SMTP id
 71dfb90a1353d-56347d6c262mr2090206e0c.5.1767893846038; Thu, 08 Jan 2026
 09:37:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251205150234.2958140-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251205150234.2958140-6-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251205150234.2958140-6-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 18:37:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXPjK_+skP+3Z+Z3azGbbjX9QdtyMDzFY1dyMMG1iwvTw@mail.gmail.com>
X-Gm-Features: AQt7F2rvp8fYlEdhIV5AAN3wwbhpTmRyBGJFshTlAJaOf6DVMaGa6UOwj8MFm7A
Message-ID: <CAMuHMdXPjK_+skP+3Z+Z3azGbbjX9QdtyMDzFY1dyMMG1iwvTw@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] arm64: dts: renesas: r9a09g077: add GPIO IRQ support
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Dec 2025 at 16:03, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/T2H (R9A09G077) SoC includes pins which can be routed via
> the ICU to generate interrupts.
>
> Add support for using the pin controller as an interrupt chip.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

