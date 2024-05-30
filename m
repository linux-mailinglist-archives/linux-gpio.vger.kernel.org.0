Return-Path: <linux-gpio+bounces-6959-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 585548D4D42
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 15:53:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A8AE1F21921
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 13:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59018186E40;
	Thu, 30 May 2024 13:52:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D019B186E3B;
	Thu, 30 May 2024 13:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717077134; cv=none; b=pDuW37QvOr9AtI6mXCZQJLAR9qnYsJcLUdUOrcLN9HAbaf53Gi8+nM42ZmJqtbwPWd4rkyojBHm6DiJcyDfdfgOVFdD9kdkIaHwqXmuq53zFQvuFzciH3VZdDSzkrH7QxjFZ9WfM/lZbsZFKodoF/ucTND1dD/epjQsTzuZlZxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717077134; c=relaxed/simple;
	bh=GHE1EL6MHnqe/31WsFV6zBz1mm7AL9MVE/m3nlEW6/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cmKa4FpzrqY3S4vLLzlq3UydH6dtsR4G5Dy8HUdQY7x5UnHd1+E9Oq2vfeQFGyPtZfpZ6Spxcy6McAWOkwze24z+P9vDu+nBgvfmRG/xKaXdiEsZ2Vc9VL7wfEJWnqJGqg/8jVTGzU+Blcic8i8KvmdXym280jPAamYjOfdWgTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-62a2424ecb8so9896147b3.1;
        Thu, 30 May 2024 06:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717077131; x=1717681931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GP1KhiC6F/2HojFBJNH7yktUkTnEzhuECM6OWCHaHRw=;
        b=tYm3oM87wGgcecaJG/ecCKIexN6ZBNNdwb0KgM9dOwfW8nBqLs7SzUlTh5Fw9aMydk
         fnRS54AGyqe8K+WeA1nXMYSuezrZ7zQLZkCTbnwOMndmaASxBrwlqUe9pJtKyuYUKRiP
         GRPeFc5Ecdgo11NgqeUFMytFSIJ65vRLrO0r/VVdnZNZlJNVphgHZ8kpD/HAAopQaOsH
         uK0DEZq3DqrTEiCpBIkvlrY3rQjww4fmfSo1ypaTM8bzQfm01Nir4omWRFL5XAf5LZis
         iOX6j5CVSTWLzReliheX2C3q0HtP63hYJhrquQys/xGYLl+uPItAHTr+5QMzCxBUQmT/
         f/ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVO7K9qjGwfiacM+YV7KHl+pXtqIbeULumZiUxvLhWVnWqCRoy7o0I/TlpeNY6WG2FXcqj51/aSTqtJ/T9FEwVIMNJXGAbnhcRTnUf1cGb0cEd8FTG0E74MtEOBnLJ4TevMO24NAcvPKat3aMENaFVwFuY4IAo0nvscymnoGBCZNTRIlU0VwgZa5wL/zNAw1jfMuuTYazi7zs1R5sN34N+D5F06OFXCg==
X-Gm-Message-State: AOJu0YwAzNZDk8toUSU1KMPRBu8qopOSyLJb5b0ItuRjLz4Bb5H/MalI
	NzNg59P+CzCMvPFgRdaOiK/D2mxiAO/lGMzGzacviswmH0I2z60xu9N+RkOi
X-Google-Smtp-Source: AGHT+IEp1qEDlKkpqqMqzMk0gmCZfSZkY6m90lEJqg4qvohnEUi3t82J/L3B15k+ns0r+wvUlIhhGg==
X-Received: by 2002:a81:f003:0:b0:615:225e:ac13 with SMTP id 00721157ae682-62c6bbf99e7mr21406467b3.18.1717077131260;
        Thu, 30 May 2024 06:52:11 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62a0a56f409sm27793837b3.139.2024.05.30.06.52.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 06:52:10 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-df771db8b24so881434276.3;
        Thu, 30 May 2024 06:52:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWsYVxL9SOY4VJkNyA00P6l/xcLPTklwRZKL71Ose5zYv5/tjPhsMgUmJsBhEHcaRBO6E88C/I67pUrQz2iRhDQ5XI7MaDrr4O6cx9QnQU5f5SH3UdiFhnvZLTsPZeYnJyxJxKiEztD0jj9KVQ8ljKc6ofjayi6RQGABC2orzyJSPj4kTQaNJs/3lYvlODxCbQ+M7LgYO5D+Of9NRt4cyuQvV0vgYzP0A==
X-Received: by 2002:a25:cecf:0:b0:df7:887b:abfb with SMTP id
 3f1490d57ef6-dfa5a5dec31mr2492369276.15.1717077130579; Thu, 30 May 2024
 06:52:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240524094603.988-1-paul.barker.ct@bp.renesas.com> <20240524094603.988-10-paul.barker.ct@bp.renesas.com>
In-Reply-To: <20240524094603.988-10-paul.barker.ct@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 May 2024 15:51:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVaOZjr6kUO2TebD6=x5wogE1=xyzFty0Jy8=8fSsU-7A@mail.gmail.com>
Message-ID: <CAMuHMdVaOZjr6kUO2TebD6=x5wogE1=xyzFty0Jy8=8fSsU-7A@mail.gmail.com>
Subject: Re: [PATCH 9/9] arm64: dts: renesas: rzg2ul: Set Ethernet PVDD to 1.8V
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
> On the RZ/G2UL & RZ/Five SMARC SOMs, the RGMII interface between the SoC
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

