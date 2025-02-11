Return-Path: <linux-gpio+bounces-15701-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 009E3A305F0
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 09:37:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75E631888BF7
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 08:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E33EC1F03CE;
	Tue, 11 Feb 2025 08:37:33 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F1F1F03CC;
	Tue, 11 Feb 2025 08:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739263053; cv=none; b=B7W/H5p1fpik0/Kc4CZYfhTHMs9zaKkP2QQNIpJfFyNkeKH4vC8/bar+IutEjg9BwF4+xquv0Lrs/1TTHHbUzdi6hfTkrUJZY02dJ9m4147VeqLZ3cW/8e68qjCeq+Ua2LXeS1ctGiuhdJjWnz9krCKjSOYu8o00P9etXYyQpxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739263053; c=relaxed/simple;
	bh=qdRH1BtNG+oyHqsnJrOlkHT6qsNDAOavEAkg69yD7fY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JbmbcUGCD/uFNfG1WPm+3EnwX+tIgjxS+/bXSHNGFLVSulw8l3IV6eT6eynucM1H2Z7InxMNH9v6QgPqtEfiT0hM+Bsozz/G3nQhHoMhGK98/c3qITcOiAgCk19wESeWUXcKW0tI5AjBoB5YVoYiDsszih+VFwBinULOgk1HBjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5203d852d68so491203e0c.3;
        Tue, 11 Feb 2025 00:37:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739263050; x=1739867850;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y9KxQXy5uyWPLs+CMmlPzBUmnPCJ50c3Ua0JR6mtJHE=;
        b=a2moQX/5u/bROtkdKT4vL0B/o67kHCbL00jVXCGSr0LTAc5GJ2oZ0VKOLplkdAUD4d
         0aTLAt3KYKNEDIr/TEgUqrczdhlIXC7saKZNjYVlIFelDP47+O/9tjXBJDh/9RSnQ8Ni
         qPW07+bc40YuotiYZB+Jup0LCVEyS5gDHao08tXGCuBRppdmP1xIZpkDQb3uaRCrbxcx
         45NitrSW9Gj8m8TejS9MRsvZmIVFgbfXACHQnRrlB0RtRldIm4G4b1tNoG0YHe5ggk3D
         1ULZpetXPOH9VpmmGo82Z4rEvE52zSy80MOp9mQuTBpKNWwYiBKxO4T/uGtC9jv7PmbX
         s0uA==
X-Forwarded-Encrypted: i=1; AJvYcCUAhgDtzA3roEWoefSH2YjoaBzU2V2tgvFjvZHyCJx6N7C15XdbggVVYtJBQjj1O7HKg74CP4WaN5W6RJvZhjMID70=@vger.kernel.org, AJvYcCUlvWKdiw+jhZsQE9sT7OfG45AmvhMd0nfbByZUl1+1K/STb4Zh2msSNPgV1Gk1Ooyb0emaFKpSI5NX@vger.kernel.org, AJvYcCWwRVOxNjH9XjXOh2n/YuVk4LHFRmyFEgDHgk9rkjk0uJpAcs5sK/JlxqNjI1cTCUyuQ+KiswiF1jjV4q7L@vger.kernel.org
X-Gm-Message-State: AOJu0YxjRPVyYuuIXPJ1dgndbWHdLtL6Lks9+VJm+w0RS2Iz9nHWEu6R
	c8+LLfRA/lpPUKcBLGbNoz6XiiVjxREvrvVe3ltNZIlwG9w8n0NwlnhNWCvjHts=
X-Gm-Gg: ASbGncv0VLLHu6Uvq9RI1Mt8D29VLBoRs5g/SDUFZv1lde0qaZQQiNc8Q6EyjfQmGnv
	vsZ4DwNRoGmZiu9zszTm0q41zC75RWsxEHwk2qbR2AOhPWboJy0IALiDxSAbBOCQH+BdwPOSOPG
	MY6jvjvo0lXUZX/cTd5+Fx6rjlT67is6ZCnhq877imEatq1fynlRtKS6xk2m/Vu9s+4Z6a6hr/S
	vwt1uRdOPHGgWH6cUx7Lp8IKgOKUHtkI/zKQPe9GTzjhJ3ELxyRQnkA0zpAuR4GhixBQUW3I0gP
	PU62v+COjyeGqEgtD2X6+5wmt4dVXNlboJ5WxWndUQhwI8YE87hNJw==
X-Google-Smtp-Source: AGHT+IGzAl3/20OdKblWMZHtEeqf13JlzKmoC426xgvmeWngiqWHQVndiDFhoBdRAYg76o7F6R88Lw==
X-Received: by 2002:a05:6122:4695:b0:520:4d95:1319 with SMTP id 71dfb90a1353d-5204d9514f4mr3143195e0c.4.1739263049656;
        Tue, 11 Feb 2025 00:37:29 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866f965e674sm1918586241.9.2025.02.11.00.37.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 00:37:29 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4bbd84003dcso465350137.2;
        Tue, 11 Feb 2025 00:37:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU2+OGdNsDya7QYK4T97iq51koHbvjx6AZiwBBtBVfuZiu/VqrF4I7Lqx6In+6f4mw3Dk4iHpPmCh/4jRhY@vger.kernel.org, AJvYcCVO0C9eApQHHInyhvxtd9B9jVKafIoHdyJtQp3hGiCOGCZOdMkFoGmJHqbo0PQ4jjN4MiE/Ij+D8UhQ@vger.kernel.org, AJvYcCVsLJMYDhKTDJYJBO5laXIVz5wtGKtUWbgyQSp31lepbO26OY+JQM3Xzd51o6+vuiZjWlaV0nem03J8AczL1eIJXhA=@vger.kernel.org
X-Received: by 2002:a05:6102:299b:b0:4ba:95f1:cc83 with SMTP id
 ada2fe7eead31-4ba95f1ccd4mr6510138137.16.1739263049324; Tue, 11 Feb 2025
 00:37:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205100116.2032765-1-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250205100116.2032765-1-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Feb 2025 09:37:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVrtAy2Y0MHrSSY5JsdL=CicA1Jw0j1Rh65Vc7OUz-ayg@mail.gmail.com>
X-Gm-Features: AWEUYZnvP6FUW0j0B-fJEGJIF1UxEF_NgaVnCxPLMQhuEsKIKLvkzoboqq_Fi9w
Message-ID: <CAMuHMdVrtAy2Y0MHrSSY5JsdL=CicA1Jw0j1Rh65Vc7OUz-ayg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Add suspend/resume support for
 pull up/down
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: linus.walleij@linaro.org, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Feb 2025 at 11:01, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The Renesas RZ/G3S supports a power-saving mode where power to most of the
> SoC components is lost, including the PIN controller. Save and restore the
> pull-up/pull-down register contents to ensure the functionality is
> preserved after a suspend/resume cycle.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

