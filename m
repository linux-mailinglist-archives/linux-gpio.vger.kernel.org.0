Return-Path: <linux-gpio+bounces-18662-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E11CA840A4
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 12:29:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FADE3B5A5B
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 10:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 786A228136C;
	Thu, 10 Apr 2025 10:23:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8CE281351;
	Thu, 10 Apr 2025 10:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744280637; cv=none; b=ss3CBHt/8uAT6EnECJac1ASis2MSnSUXlhnJdKvdu/lGZW2+Ejjmk3so1ZuKqQenaRgAinDoY7EtlzYubGYzHQitl9qmJg44VgRxqc8pukMOf2UNqbZHntThofAFFzmdPnD98JVXE0BucxJY49Fke4kvdIfgzzbGN+FL3sWaemA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744280637; c=relaxed/simple;
	bh=lH8sNp8HpBJeRN7YlG0k90bwTE4mkEU6hE3Rl7ug34Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qKm/jS0i10LLyEg4V3e3R1hDsMuf1q8EUUu8Olg3+SVT67sNYsut9bmJlr/8T7Bz71IInWbE9W9MTYkI2t27I9UEzXyfij3uk06oxC1p52rBFY5G4tlonuBgWMRSQ/c4W7br+hBJh9SdVWPdHvz90QWZDwRzYcUfiQUOFogM4Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-86dc3482b3dso1723606241.0;
        Thu, 10 Apr 2025 03:23:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744280632; x=1744885432;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=du50G3lIjNxLx6W3pkF9CbKUDTzcKCdeCv4Naa5/YUs=;
        b=L2PCkRfuor4x+GVHlN0w1mObi9q2wTwtjfHMn5lM4mU4FZ73uWFzQbIpD95QVuWcgf
         Pu3lmvX7FpAdTrWebvH54S92LmeoLk7T3i1NoVT/OahkdCK2gOAb82gfGNrTSZQs6reN
         RFBwsYOpc/vCOiMxk+WQlFxYk+rcUKFT238+d9Ts3S1qm8OCu4zvlyNtLy/tXJo5Cbqo
         zcycqXEY3I6LhJ/ufU1SG103PaYFL2vdUoh0eOwuf+HQuCULHfS7tRmHsZSXJ5S4ZTZU
         wR8++DGo4IeHZZzITXNiRlz7zBZw+94eEwJoMNdEo6PEKzLYtIEBLXOOwF4pmFOjPstZ
         Wl2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU8ucHSV8BOqldm3hX/a7E/cr2slOJu4Dc260g0f0Vr+2YQMs1FN8KYPsNglhrjZf6nqqZFJd6kz8UYxpzu@vger.kernel.org, AJvYcCVP9rYzeBdhdxA2Og2O7TzIg82N64nPM9H9GN6VfP861EKdbfdxfvltXuJkDcvQsOyvHhbmU+4E1nPG@vger.kernel.org, AJvYcCWLRLLkMzc1gYomipsbSbe0w/FBE2O646p7AvgdrW7tPR4bIan2VSbQzV1HoFlb4TBWtkqHg+KkQb0P@vger.kernel.org, AJvYcCWPf2lRUPKq+OBN4LdZVTlvesp3lM0HoJHu/RSFVgr0elMWEuoNG3nKpQIAVaJn2A09rKqo4kbYGNLw/KnB@vger.kernel.org, AJvYcCWVYLKwyfhh9dIAv3YRJAgK1aZhZNU6667sLjtgsW4THQUsyfoLqEaqQi5yjx9wQUAwG9ufw8pLRVwX@vger.kernel.org, AJvYcCWxMRZaff0OHry2uxmvJwp6fyR0sYfNhu6SReQg2jbpT7E7WAYixhT2ViDH2HNn7dA9b3rBGDTQV2VI9EfZ10+N3V8=@vger.kernel.org, AJvYcCX7bx+iAZMssGRJdwkr2pw8jrfcTKPDPqN0YBPzsCAYtfmuxjy66lKPf2/k/hKeKzA3333fc4+TQwfpAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoUJyImApm+49KfSWLKMxs23biSVvWuOlzBm+OIsDmzNEucjoS
	eSStcRTf3IulZmzhzIgxV/28+DFSGBsXffZEphr3Pebh6pI4oKSxKrQh2IP2oac=
X-Gm-Gg: ASbGncvIHo8/jifl2J4NZMNCLFxNcrih+XzohdjZQvvQSRjFxeQFw5ocfR/UpGX0BCq
	saZaebU3iiWie/bEP492dHA0scYKbqGTJ6w8bbOqjUGwczrEhgxN1MgoeIaFRQdG4glP8sZJTxB
	lIYciKPUaBCvUYCfUeurE/Z20NX0BBukueaCMn/H5t6LLKQR0KgoGSP2e6iEGahcIl+fEZYYJqf
	ycUxlS411f9mmZXvftFGa2j9QxB4vH9DFBncVErvhD6CrrNe6+x10ejHXx4wfvoU/3F0Qwb2S9U
	+3KqY3G15HK2hDCzvOAbHdRc9QwWz8rlun/TuoFdFH+w/t8EzsO6O8lWnOXaq76dSDlCay3G92w
	sY0dJYDQ=
X-Google-Smtp-Source: AGHT+IFlmPNBgH/fbxo94LAfY524vLnHQycXUDhBB6glwqW9iCYstTqjhHghkEq5EG0qo/OULlE5TA==
X-Received: by 2002:a05:6102:4601:b0:4c5:2e31:8818 with SMTP id ada2fe7eead31-4c9d3eac9c3mr843625137.4.1744280632375;
        Thu, 10 Apr 2025 03:23:52 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-875572b6989sm592393241.32.2025.04.10.03.23.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 03:23:52 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5240a432462so640467e0c.1;
        Thu, 10 Apr 2025 03:23:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUCMRmmihY7bYe2KXEN2DtLBZb7K7se1c27EVrf4xVe4ApumzbcT41jMt0qdC8YCN5Hv4e7S+X7w9XmHQ==@vger.kernel.org, AJvYcCURpxtUYbL1DoV8qoJqJ1fJFi/tuOmeaNm6yG1+1Kkf0mb24+lmOvdoAipIojs8cxXFfgJS2GhO3irhqayh@vger.kernel.org, AJvYcCUrUKGqO0DeGPEeAusGggfuyZiUFcMJGHAi4g3RmKrVmzJa4AU00goOuzgHJE/KsDGqF+MG0lzKq73C@vger.kernel.org, AJvYcCV4eIiTk5SB16M7Yb04TdA2Ee/qvK9qCabYcKODskBuqbVpaw1Z88MlizWVYZVnFESQL8haxLd36G6Gqy/Y@vger.kernel.org, AJvYcCW8HCsbA9wTI7e6nab++yuY+6Sj9iQv+pRv87Z1L4lrpzJruNysK6bEVeVr+75M6KjCnIGTLcEfTleD@vger.kernel.org, AJvYcCXeRqPLA6OjvNmZXrByUF0hIfCffE+ulrBXoCPaoMd8dVxRY6rEx51cQmzbJXm3KS1MSg9RS54D9WPG7GlEZ2wf9OM=@vger.kernel.org, AJvYcCXfbos4qdgzSf5hxXRNQpEnPKjDTPKOqzeMKQIWhDmnl8wglOeASndPys7pDvwHWrb9A52ZDSRG9gBC@vger.kernel.org
X-Received: by 2002:a05:6122:2202:b0:524:2fe0:3898 with SMTP id
 71dfb90a1353d-527b5ecab7cmr1028303e0c.5.1744280631864; Thu, 10 Apr 2025
 03:23:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250326143945.82142-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250326143945.82142-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Apr 2025 12:23:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWG5gPs0u-E+Q0ipigU-qXwNLt3jGE3bLP0AiYU4Po-Yg@mail.gmail.com>
X-Gm-Features: ATxdqUHYP0k90KOlJEk8_KKWCI_v7YKprTDnlrpYy60dvQGy6IKe5uQi4lW1XhI
Message-ID: <CAMuHMdWG5gPs0u-E+Q0ipigU-qXwNLt3jGE3bLP0AiYU4Po-Yg@mail.gmail.com>
Subject: Re: [PATCH 07/15] dt-bindings: mmc: renesas,sdhi: Document RZ/V2N support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Mar 2025 at 15:40, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add SDHI bindings for the Renesas RZ/V2N (a.k.a R9A09G056) SoC. Use
> `renesas,sdhi-r9a09g057` as a fallback since the SD/MMC block on
> RZ/V2N is identical to the one on RZ/V2H(P), allowing reuse of the
> existing driver without modifications.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

JFTR
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

