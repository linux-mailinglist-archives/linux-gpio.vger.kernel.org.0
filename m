Return-Path: <linux-gpio+bounces-24059-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 807D5B1D2DA
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Aug 2025 09:01:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4653B1654C7
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Aug 2025 07:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B239B227BA4;
	Thu,  7 Aug 2025 07:01:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F63622577E;
	Thu,  7 Aug 2025 07:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754550079; cv=none; b=E0gtTmX7S9gEoM/JmXq5JsNUmtzdiuSPDt3P5qERUPz8hBF7QDSd2cE15nF0hrp164oas/5+QeJ6Baws01vOcU+dn4dY0hxW4Sm2ByVjGhnJ0mV+XEecuERsWw5a65IcuGIUiUZnDAe+QtGsRmFNKuZ9zGUn4lU9sQRx2uxjCNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754550079; c=relaxed/simple;
	bh=SjxN2evX37YM7OvJQ9bheaqvBfJBGQjbQ1/ppd5gBWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XSxKCLQhqWfJ4lHwMD9rodV9KRFEkRSJjJnyqOJ3J7G59NhcbZzDLuQRdZBFxp+QE3ug3KamCsFYHfR7TfLDSANJkeTiBjrSPNORpNhmO4vyqQeKZhnGEVa77f/It5ELhqIf0to25UsjVHDaKCqFu8DuiY+/RanN9mN+YJI1Y2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-88dbc90853cso185675241.2;
        Thu, 07 Aug 2025 00:01:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754550072; x=1755154872;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BnyTR0nkf0Tccc8/njW3Dtowh1tPI1W3Sd/j82o91l4=;
        b=qaSaNX8hEtUjcEcfRzFC5A6bYzsa/UPLuhSkI1Bc7ljDBug7pOL6ahhqJQaKkkjWKD
         zfLUrhN0Cpvp1HUSHz4Pd6LrCT7UTjvJwdPoLY5EGdhG+CVYIAYJV730FiL0r6FONU2a
         8aDDSH7in73IULZ+cTduEhySqmgvdkEg0dHdmNA+rziDciXwylAPiMP5i46unzzztNjf
         57p5UqZ5VXzVMASyBREzKGTlkKoHDxtQ+LZnT2yZrB2wqXbm/QywfQE2R759B5jK7Yki
         HFJdNsaxfk+oGwfs7NMvshjkr+X6dY0KxIu/gKz6r2nfsyZETmCSCQCQb5WLZZRRQYCj
         PWhw==
X-Forwarded-Encrypted: i=1; AJvYcCUPJwVCnEVUnRXi86NmJWQbHYdFpDYI/AnL+IVaiY8v6Lwmm4RwfAvQPzjSYcHCEyJNaCAlP1JHB5iU7aCp@vger.kernel.org, AJvYcCUneOWH1OqgYYWe8na5Bpxu6MVbwircZMUgYWvTTTUunhCMD597M+KFlyP4jEYwmtyEO+biKv5GnFJF@vger.kernel.org, AJvYcCXnUy2Ns9WJQkZUJfl1EvdMbYE1vBwclIClk1JJZSVt68Looj/fdR+jW7hBHzPWgdbzUFQIW4Xd4IeHQrTVtv7Pmos=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz379RjuT7jwLLHEodrb5XXZU4rKtUqWnfaNViAF0iavPYRlTUs
	TAsziTpUhLd7AzXdP3NZQp9j9Pinx23in8k0lgP6bIbNLbvCG1XyOBzhM7uomRkj3jU=
X-Gm-Gg: ASbGncvWOoef6Y4tuG9MuntWy6fiWUSMNKq1qbjrrkGDUByHxnUxWXxXhJkfgbqcOZp
	406j5Mc1mkyTes1G+T22njszgc3fu49P5tpg5vO2R0791UNS4LhLHDqkg4CmzI5+N6swt8oSS8/
	VslJ1jdKK6Sq2JzWfllbzkDpN7M2ei6Ja1xLuwZmgQ3ypxJy4l2ofbE8XoU7HJW13SkjCg6weKd
	cljg3sdmNMwZBxTsWptjUOp5MgFBAHbwF8hEXeT4uWiSTyej5khCa5dl8lqzMGuLFxZxVoJ0Q6H
	/kkQlo2x/yVHCzfQxB9jNi/mBNIkqyJc69dklOc/Re93kaYUiAs286ZAs+1IrFyssd0+fsPL59r
	K+OwtepqEo/OzJj5EwivyYL/wdNTv7adeEdKXYIg81Mw7unQzGu5sjx9g4kOR
X-Google-Smtp-Source: AGHT+IGMcLOT+rHjEpkH817J6Qst+Y8J+NV08wNUSRyvTinTZ6FZcc7oPoEtH0ugdFyrowC95GcaIA==
X-Received: by 2002:a05:6102:4423:b0:4fc:f5a:490a with SMTP id ada2fe7eead31-50374a2a2aamr2918118137.20.1754550072398;
        Thu, 07 Aug 2025 00:01:12 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4fc0d42ba5esm3883826137.15.2025.08.07.00.01.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 00:01:12 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-88bacb82a6dso129973241.3;
        Thu, 07 Aug 2025 00:01:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUAHTlrGDrImrb1uQmx+p5NyNagg7b9e8w1stmpNx070q8QCflNa7uXPrkmqG4oV76759S1BQycSqrG@vger.kernel.org, AJvYcCVNV53NSUL99GlCFi6V7afP5FTo0VQQS+peX3MQB+Tmpk0lOz1zIl5itKkSOgslFkCVRqOVXIjGJJ2oGh6TXSYJIlg=@vger.kernel.org, AJvYcCX5yoFHQ/7zzhz32ag/oVKEpC6xR/bGUKHKv6/Gk1vi5ge92aUSzon0iHxa6uudiiPC5RheQp1u0lfqYs5t@vger.kernel.org
X-Received: by 2002:a05:6102:2926:b0:4e5:9cf0:4eb6 with SMTP id
 ada2fe7eead31-503722a3e57mr2742696137.5.1754550071694; Thu, 07 Aug 2025
 00:01:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250806195555.1372317-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250806195555.1372317-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250806195555.1372317-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 Aug 2025 09:01:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW-A0-a3Kvc+4o4yr+bGMd_4zV=4RMQhvzujM0q8_e8pA@mail.gmail.com>
X-Gm-Features: Ac12FXy3V3LpsC0HrNM0hhMYL7PGUKcppqSgA_32ii9dd939ZuPrMqgtlGe1YRg
Message-ID: <CAMuHMdW-A0-a3Kvc+4o4yr+bGMd_4zV=4RMQhvzujM0q8_e8pA@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] pinctrl: renesas: rzg2l: Remove OEN ops for RZ/G3E
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 Aug 2025 at 21:56, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The RZ/G3E pin controller does not advertise PIN_CFG_OEN capability, so
> there is no valid mapping for output-enable bits on this SoC. Remove the
> oen_read and oen_write callbacks from the RZ/G3E driver data to defer
> OEN support until PIN_CFG_OEN support is added.
>
> This is a preparatory change for future unification of OEN handling across
> the driver.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2->v3:
> - Added Reviewed-by tag from Geert.

Thanks, will queue in renesas-pinctrl for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

