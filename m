Return-Path: <linux-gpio+bounces-18640-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE2EA83E1F
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 11:15:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F313446116
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 09:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 782A420E715;
	Thu, 10 Apr 2025 09:09:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCB920E33A;
	Thu, 10 Apr 2025 09:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744276198; cv=none; b=UO8GgaMp8EM6z/0O9M+MGWb5JsEbM3bCJoZpUdXDyFIP/Ud9kK0v1ampmKTuCqKgCrn1aiBGoBNaXakYh4xg5MExJUB1t56bOZdP7qGcTPThY4u7BbbTW0IHpA0Q6X/2RnRMYvBR/YZq/D2l4p3mY/fbqbVGKjl9y5mzcrW5Ttg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744276198; c=relaxed/simple;
	bh=QzdvsrmdC8ZVPxZM6HHYJn2xGTypliiPzhu2tEsqJGw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qsT0yVv2B07CXKh8ceOhPH805/CGtOCIQ32p2oOfs2JkDn/iNwO8+U4kY01zFVmKe7Ck9DzAyDJOVvHiy/OtpIvOCPmoQbNM2tLoQBObCqfupaBqUFIO7EBsevBUot7EozQ48in15ugk1ZovNwLeNXLG5VPNJdR5n60qv7gmmXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-525b44b7720so293312e0c.0;
        Thu, 10 Apr 2025 02:09:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744276194; x=1744880994;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e+4Ism3nybkdIu4M5oGMw9weAjI5XWety4odcvOD83Q=;
        b=P1+B3ogAIrRcPz8zK4BalTc6SI06pIcCCiVx81B9PLxFRAKXayVoIhTZ3cZ6QxQY/s
         xixb65e4oS8wzevv4fW6SxX9V7Lux0K2VZ9prlX7Y3vpD/fGhmH1Eorx9D1Y3Q+vJKsH
         lhnHoqTO/brxA+EQX2PwEeFinFzAHCXa9IuAvFz+8+Jso/SNnZpTRSYjhEss9F18VqKn
         nDYD59u7BTPx5z1V8FNv71LEsPUechMCesZLADQoMNyRWiPnP1ECpzQraM+tCXNj2kCp
         MzYs1woNEkhHa53gxYjD1Rw5Zg4kS8oQg9DwLxF/moUvJzy+bL4ira20RJETTsyIP2JB
         QyQw==
X-Forwarded-Encrypted: i=1; AJvYcCV2aTAgUxF1CR3QCNBcInyWltR+9bj6MLQZketC6Kv81RJ5A3YxXw3nCl39tn7xlSjEh2hqsu1JxGaY@vger.kernel.org, AJvYcCV63ea61wTfzgygzKpTMqLmkltqLDu1859b8zaXeagnXs/fQYHfmcler/81ejiGEaE5AWGZKQ8wAZ27ENsOtn4CPfI=@vger.kernel.org, AJvYcCVZfoZGnY6mQHl2xjuZtHwO5VSOa2qiGLty/zz6lgYVgTFrB1nggT6GLcjpKAsmR4aT65RnU52bz6F5E17L@vger.kernel.org, AJvYcCVkvzTqRhP2VMQCQBMLrXZvEohJ0wc9n8uqpQ8OxlpwXSXOTJrXhNU/e+G6fFi3p8XKmkhWDRAz8wTQ@vger.kernel.org, AJvYcCVlQhEtfbQ/+oVMAY4jnwx3h07WeiY+ZEfgqRKtCDl7vqA7poGqeHNfiR1p3sszuBXNufTXE85q0Tf5qg==@vger.kernel.org, AJvYcCW5cldt6t1oGqx/Gi+DndCS4MTX1pi3KA1rCfv8RHTKxz8sRoly9l+a1zn7OH+/zVO6japRsVorNTMwxjX+@vger.kernel.org
X-Gm-Message-State: AOJu0YzxSPgLalAYnrzOVfPXG2p3jrsFsN5l0y7zOrvNGmcLYrnQ3s1W
	ixGy2ZgFd7dXPmkC/z66g2dwGUS5J2jL3Q8ECNZ4mJPI9XGnx92TWyY+uJNA
X-Gm-Gg: ASbGncvmWBMq3dxEKkKYktrH4BprrzMz/A0Y2/XQFiGerr9QiQSG1jHqjPsXHQJfBAc
	NQH4Yt5/xVdzLmygnmHiwT2ROzp8ctXwgI+o6Wr36x/06I78VrIC1i1SUbv7trdDVxV+BIlts4L
	QiFNPzgAU8u+Z+U/pyGpFlWKcwkmyNBymQ8QmVY9b17cPVxbv0+fM4zv/1VHYJobr3qQY5SVaJB
	jMbpFJqGHV3DM7IyUbQm67//ZDwpBMcBycD/Zj3qvWtx8fs3OrsyQh83mtlSGlkzC01gsLWmwjI
	U/pf0ska4JFpv/477Fom/6IRwtxjoD0G18cLdbxC0fAb8Q9txfuICWesnUZ4FPfXLnLK/wHaDFW
	UErs=
X-Google-Smtp-Source: AGHT+IGsfdRQ3bq+sRFOynBDnPdM91dL8JeTsQA/kWhHtmhgpaGKW/qjgRWYbdh135PW/LjPZ9qekw==
X-Received: by 2002:a05:6122:168d:b0:526:483:95fd with SMTP id 71dfb90a1353d-527b50f5076mr1148110e0c.10.1744276194384;
        Thu, 10 Apr 2025 02:09:54 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87555547509sm593614241.0.2025.04.10.02.09.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 02:09:54 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-86fab198f8eso228644241.1;
        Thu, 10 Apr 2025 02:09:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUVgEqBIE4nv3y50CP2Cc0iew1WC4KDYl6TS/EHEtUgc/IpFzDvyoqx1jS3VxQcb/7836LpaqKGAO8r@vger.kernel.org, AJvYcCUrCVA/Ha5BuwYvdY278ALDhpj1VbfEAmGRN4gD5wzDslHsEbQEn26ZQ7APbILZDzZ2YIxmjkwxedeMUw==@vger.kernel.org, AJvYcCUzxCfd+KrGJx/ztVzrCCVLgDIhTZ6xARQd1flV5L8Nvf1EMTvBZttJAp1JC191haRZVKIROMRIe6ccrWus@vger.kernel.org, AJvYcCWDOEhPe2cJYGFPGaXXIeVeOrX6yvCXMv/YnAbn8RjMhZrxdiJpU48dyJz/Frf+Hx3NlFlNFkIHBDmAhfH9@vger.kernel.org, AJvYcCWMJ2sJPC/dOfgU3824eEk9qunqzV6f1ukvT/KQVf2842UBzU/J/4MsHbVZA2CtiYxR2eyf135pnW11dcBtB6oVqWo=@vger.kernel.org, AJvYcCXUd2X308/4BZjHJybqWvYmH9dyW/4uMwlRXW/aOtfzx2X05pmWi/RwcWul5nLOESMxyeJbJuHUL/L7@vger.kernel.org
X-Received: by 2002:a05:6102:6cd:b0:4c1:9780:3830 with SMTP id
 ada2fe7eead31-4c9d362cf82mr1086322137.23.1744276193774; Thu, 10 Apr 2025
 02:09:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407191628.323613-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250407191628.323613-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250407191628.323613-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Apr 2025 11:09:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW5TVByqNKgZ6UpEUEzT6Gj3UK_g9c9sE6JqMcZy++uPA@mail.gmail.com>
X-Gm-Features: ATxdqUFwmEObbAhJi8W14BlD1YfbKbKlORWkmE5uLsdB29hvqZQyn7Wk-5suNRo
Message-ID: <CAMuHMdW5TVByqNKgZ6UpEUEzT6Gj3UK_g9c9sE6JqMcZy++uPA@mail.gmail.com>
Subject: Re: [PATCH v2 03/12] dt-bindings: soc: renesas: Document SYS for
 RZ/V2N SoC
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
> Add the RZ/V2N (R9A09G056) variant to the existing RZ/V2H(P) System
> Controller (SYS) binding, as both IPs are very similar.
>
> However, they have different SoC IDs, and the RZ/V2N does not have
> PCIE1 configuration registers, unlike the RZ/V2H(P) SYS IP. To handle
> these differences, introduce a new compatible string
> `renesas,r9a09g056-sys`.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

