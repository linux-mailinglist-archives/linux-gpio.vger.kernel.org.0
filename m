Return-Path: <linux-gpio+bounces-18652-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEC9A83F54
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 11:49:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24A708C1887
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 09:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 617692686AB;
	Thu, 10 Apr 2025 09:45:28 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E236214A91;
	Thu, 10 Apr 2025 09:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744278328; cv=none; b=TzqeDa75BnSwnjI9D4G+sOTdlnp3Pynl3G9y4vr/Pt7DrOTJr3ws9gXafJdCdoQS5IWKbhr1gPpgRZfH/Vijz/9Idydqr3RSUPGOilktLpafmPDg817NIgvgf0YWyURH3dWZ6sB1X/J7mHOs9S1hyLsH3mhCaHM+z9sNiT1jvMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744278328; c=relaxed/simple;
	bh=e5daXCLRVh6mf+AAlTCD0T2AR1+6dAICJsUqcnLpWgs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZHvYg8PJKWnOFcOZkNRc4ABNkx/OYgn0aUR5JhyazpwhDQrNFn7Zjf+LopEhzl6SaSV9h3Gx5+7RGkatlLCc1KVmLE6Zj748QqZw8uJ3MggAhiY5t8iu0E8tIr8oV9Gv7mZu2oIDcsSHTFIGmu0dYDHLAlDFZCSli/JZkop4YN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-523eb86b31aso329643e0c.0;
        Thu, 10 Apr 2025 02:45:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744278324; x=1744883124;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wF3flOwwpTsOVsGjDVbuxPI3IVs9tE7hL82LS5qidH8=;
        b=KAwkTOPfd2bCdSB9B6jLxrUFaILaZEjaDgIN472N1kDa85fY9qnFaMv5CZnKQBwrCi
         m5cZI4cJrcKGT/lzrtytR34oClYxXJjKgLgwOT1l29PWVPMCjo+ci82DGMOlIIiTj3w/
         JwYZIYovRgIiCC/hqE9/E+1+k3yyjxGvwBryGNpGoD7zmAVa86QhhgdLtV/40IyGrKCw
         5vVstJqqolmX57os2OjUD06ATwmKPxSXrnPDcnLHhLBNhyHYyk3T+Aw5uPG4dA6ctVl5
         hQpJHGqY9QBCa9LOsPI54agNxd674UQU6p6mDKsgHwqncPoLjN1jNCD1dE9ANEerd5ap
         lbUw==
X-Forwarded-Encrypted: i=1; AJvYcCUc6GCMa6S23W8Mx5v2KIq8mvLKtHcqxcwVitQ4CnyrXouZJzE4QDSTnSp7e9eg2RRv/Ey4PARu9jpQABHB2yGAb4M=@vger.kernel.org, AJvYcCW5m27dcgSgNO/gWbl5tghMK+AJp4xUkjNGGCehCOB03tTPa21ePlgAH1OkxbqN//ZIUEme1WXsWYGDAw==@vger.kernel.org, AJvYcCWF7nYBcZ0YXX8ROvX/xfamOHPk2tZR7mzMYeSOQ+ycB6OzaiqjGQHcUZqtLoxzpZVZprWZ5x0c9/7Q@vger.kernel.org, AJvYcCWIbyWSiGI+UpDwoxt48RIWh/bVcSIj+bWHxj3ceBODQc4t2Ba0h3aN2iJhOwqSYBfJ/XInlX0qEcD3hsoF@vger.kernel.org, AJvYcCWrZLXflrBifkwPsUnYtdYKP0YTheN+EGxJRZxjwZDvD+bzYedKv+d11AVpZ7FtiNwsz/3a8KUIDZQk3UbS@vger.kernel.org, AJvYcCXypAlAvkxq47MWmGvQDHcylWAuYA0ktM7PTlhnJM8noAvkT0tRekaogtQSCvWlngvT9erLkUWzf/rU@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo20JeGSiPqEjUry+r8MsSAI+/0QXCoAv90lN7wiVV4ezkkJZj
	8mXDy0ZGxFHaVQ86LGaOv23Vzj0b2UC8QfJZ9jXIaGPrIRFnt+4joYwLIGs5
X-Gm-Gg: ASbGncuMmsgHV+heQigFNB/FiyqdJXsam4AUnVdlxA3mdlQjKtPFDGlGRFHUIxIpECJ
	9JagIEPO1170aGzxVT+UvqfEtSnG6pHvVMDEOtWXFqdCY0vXQHxlqQKMLjIz/Yhahc1euOlrrx0
	DxusgGBcKURCCZBs8ybYbqDcTid9vAx3i+JdNoSxwVNuahcQ+7xh7l0ZHrCiDItiFwL0ZfnRs7A
	j2Fw5sDn/NHL2empeCZj85eVOCdQxMxLAqcsc9GQr1kIOiOskGI41Pp0BbWgheqOiCmI1uaVRBN
	V/uUky0uYs/P0HdTM2EWthEhMD8YMReUVehKXjum6MS0R3IlOMMHZnin38wi+dJ8K9swN4NUM//
	Dc7M=
X-Google-Smtp-Source: AGHT+IELT+nIcNIHpRd0VURQSfms7/9rnXrvQSKKP8WDZhL+Ping8e5aExYUvTBzzunkWbrk3CQGQg==
X-Received: by 2002:a05:6122:da1:b0:526:1ddc:6354 with SMTP id 71dfb90a1353d-527b4e40effmr1192778e0c.0.1744278323832;
        Thu, 10 Apr 2025 02:45:23 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-527abd4eab6sm581548e0c.5.2025.04.10.02.45.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 02:45:23 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-86715793b1fso236154241.0;
        Thu, 10 Apr 2025 02:45:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV25S5XGwEIkYArn5jTiUl+FS3metWcubaYSgJu46Q2ilojnBO9LP24dv3H4Gbwjn4V9+r/NjYfjlhHhtr8UfEeoLM=@vger.kernel.org, AJvYcCVFDMfY1Gb5LuAdX+BtYBCW/yBkanJgwp0SmX3cIvli3+/5qAKoOVCi0hbNEKxG8ROZJx2CU9tC7845eX61@vger.kernel.org, AJvYcCWPdbxMZwfURuq78FVvO/AxLNzRbixDog9U1roepYIz0Bxw8i1MlC790PPfQN4qUdCcM02RaYiOX1kl@vger.kernel.org, AJvYcCWpPss8C2eMGSzTivS0UMOpcT1Kr0yphMutvLItq3UJ3qY9QT1UiRsrRdz+XxjI9sH1AgiPrcYmkcELsIMV@vger.kernel.org, AJvYcCWsQJ6ocrO6SxP9wgvpDJ7FTOZBcc9cDZeCehaR2J0GtlgTjjASIZH2iTwFW6b9oNr1d1TNtgoC/C93@vger.kernel.org, AJvYcCXtftODtSMjIaA66kIJIsjJKRliW4RqYUw2hi31rSk0/c3dIaBw5t4e42u6vua8lqkTqhNcM/0G8IkrtQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3309:b0:4ba:971a:41fd with SMTP id
 ada2fe7eead31-4c9d35c5deamr1124974137.19.1744278323244; Thu, 10 Apr 2025
 02:45:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407191628.323613-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250407191628.323613-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250407191628.323613-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Apr 2025 11:45:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVMmuUsz7SFKXwgN18tEg1DFa6mYTkN7aLD8zu64Lb11Q@mail.gmail.com>
X-Gm-Features: ATxdqUFqo0ZMceN1rxkhX4aDFIuAr-nMIpzKU-j05xv-Wz1pn3oTcGBOENSelMY
Message-ID: <CAMuHMdVMmuUsz7SFKXwgN18tEg1DFa6mYTkN7aLD8zu64Lb11Q@mail.gmail.com>
Subject: Re: [PATCH v2 06/12] dt-bindings: clock: renesas: Document RZ/V2N SoC CPG
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Apr 2025 at 21:16, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document the device tree bindings for the Renesas RZ/V2N (R9A09G056)
> SoC Clock Pulse Generator (CPG).
>
> Update `renesas,rzv2h-cpg.yaml` to include the compatible string for
> RZ/V2N SoC and adjust the title and description accordingly.
>
> Additionally, introduce `renesas,r9a09g056-cpg.h` to define core clock
> constants for the RZ/V2N SoC. Note the existing RZ/V2H(P) family-specific
> clock driver will be reused for this SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in a branch shared by renesas-clk for v6.16 and
renesas-devel for v6.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

