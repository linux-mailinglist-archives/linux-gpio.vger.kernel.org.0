Return-Path: <linux-gpio+bounces-7610-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B509124DB
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2024 14:15:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34EC7B25AF7
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2024 12:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A470014E2E9;
	Fri, 21 Jun 2024 12:15:21 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5839EEC4;
	Fri, 21 Jun 2024 12:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718972121; cv=none; b=UwQzap6J2qZMIk+vbV+NF3qrPgac8VWZEkyV1M5cyuvYei6XLzIpQUCfABweKgXIT2H/NWIDDSvjlrK76fV3Quu31vMzOG81DDqVg+MNa9Wxk/eXcGlYbMiMzYy28E7VpNtV2eWOYQrvVQEzJO6LR3kDqbcGYXrwvP35VswfsLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718972121; c=relaxed/simple;
	bh=HoVl+s/0uhbwF06QYRgp0cmsGbM6e2lQnYXAXcu2TS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OGwMS+pwNsblaE6eA60y31FVwlgbB+F1L8AK/4G45K3ygjM4LQlhtsVdWZcNE8YJMGOJvDwuCxQ59jx4KjaLSeNIYD/+qTw7tbTTTZ2AigzHwj4Pzs/hYjPCXnKKtkR5jJFIg2Age8XhOCsujoyhQDykNaWpgcbnuNUGrpjHSkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-632843cff4fso18652197b3.3;
        Fri, 21 Jun 2024 05:15:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718972118; x=1719576918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/VLm+/3RGyNu/np3rDAPr08/Aiyof+ayMRldgobak0k=;
        b=wDMulo8klr7c8hfWtD1CiZf7w1I/sYNQEI/0NBwCcqcr85HTmqIJ1EhrhO9uQVB2U4
         CPfOluBhiQH7AtCNCH7KvIievoCf5Ks5G4GB4B9u33A0m0HRXsQtdwVV+MCxWw5TuEpn
         kprnZk9QbbSl197+dOZBeZjfDFXBCpDXNfsIIY1COkQNZ18r8iZAEl2/sXpkG149Au8M
         v243yuKnjbsBVQcOCYMF1n8TwnYGzVKM3OrNwwoeyNi5jTuz4yHFyFV2qqFiYFYHkkqu
         JoSpahb1+nG39+59+OMZxO3bAdsMEQOjwAOMdnDfszTcwOVIB1eSh4g+doSyaVQrpkI3
         tgoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeCdruTE6L23GwgmDV1AWRzV8emrKRyReji178pj9TYfblSJME0ZaXir32AgxnE+7fS1874x2lg1xiw6R1q7RRD1cqNdtKN9mjKeUmojfYgqBnRTRd7kOBYJUNPjf3an5m+BCOUr9h3geXm5tbU450YNLq3iXKpcRi1D3fE0lpxvLFX+hw4jxB9lAz
X-Gm-Message-State: AOJu0Yy2roIy1X6/Bdj499u4q9cskxZVPcYHUY2huUMchn4EwAFWAzMF
	w5H6swFyLRi6K5bZLolwy3fIopaXXWm1VdwRyXKj4yO97iBcuv82dGuyvY3A
X-Google-Smtp-Source: AGHT+IHdTuOsaAF9tx5tLvnJu0CcO+LpzCyhrwGUeTrd/KC+ByIo0ZKqA3ck6qbeWAYwJFJ7Hqdjaw==
X-Received: by 2002:a0d:e2cf:0:b0:61a:e2e4:454d with SMTP id 00721157ae682-63a8fed2d11mr86891387b3.45.1718972118070;
        Fri, 21 Jun 2024 05:15:18 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-63f154d5df7sm2953357b3.107.2024.06.21.05.15.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 05:15:17 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-62a2424ecb8so22344677b3.1;
        Fri, 21 Jun 2024 05:15:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUW+g3gWP+O1JvckpssgIb/oumRKD3vHNyqH81Q61E3pw8QA0iFnpQhlmIDO4HU2mfN7VzO1P78evlbMF8xk/OzDPVQYylgn4UEL6zVfKUMLqtDwQmZMr35Zt2NUQBLI6W+/X1jQJKjWloDX2PmnVC/g9sPNkGnhjnrN5Q8+qlmrMix4C0YKY1NiexZ
X-Received: by 2002:a81:431f:0:b0:61a:ed1e:ecd with SMTP id
 00721157ae682-63fee13c447mr9173527b3.50.1718972116988; Fri, 21 Jun 2024
 05:15:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240618174831.415583-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240618174831.415583-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240618174831.415583-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Jun 2024 14:15:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUR0wuBKx-ugMUyeyOCiCW5pbyes3MFu1Yfd5936ve-0g@mail.gmail.com>
Message-ID: <CAMuHMdUR0wuBKx-ugMUyeyOCiCW5pbyes3MFu1Yfd5936ve-0g@mail.gmail.com>
Subject: Re: [PATCH 3/4] pinctrl: renesas: rzg2l: Move RZG2L_SINGLE_PIN
 definition to top of the file
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2024 at 7:48=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Define `RZG2L_SINGLE_PIN` at the top of the file to clarify its use for
> dedicated pins for improved readability.
>
> While at it update the comment for `RZG2L_SINGLE_PIN_PACK` macro and plac=
e
> it just above the macro for clarity.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.11.

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

