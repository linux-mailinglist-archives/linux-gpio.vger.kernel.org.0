Return-Path: <linux-gpio+bounces-24166-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A05B20960
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 14:53:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0768342247D
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 12:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C932F2D374F;
	Mon, 11 Aug 2025 12:53:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93D72D321A;
	Mon, 11 Aug 2025 12:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754916825; cv=none; b=cr/a3czBg9dwXT8f+axyv4/+zq1jTsVWH2c6MVEofeZc8hEpL5oztlklF44RAgu5apFr6IsSqc2FhjXYkXgO5WiWf5bO496jlUGOVNDnQr205NkkQKJnNYxMBMq1r51DBM9smt4O7TK6CMimRUOn0YM6Ijn4de7SJHS9wglcZJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754916825; c=relaxed/simple;
	bh=6gJCnzt50sC9lbYEQQcu8vR317q723kXajZDpuhcZZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=na7DELozJD4WY/MUlHC0q2cH8Qbs3wGnABc5z4G7OitZmf2dK7WvH6DV5bApPTmtvDpnU7xI99/dHJ4CkQPoDXAGMZFrKQ2L5B6ohodnR7E2Tl84cE/akawXxeuUED1x83/6MUScZ26BPO+/eRGwMxRdwLQmyJnvhRKYZFIltEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5393aa55adbso1178021e0c.0;
        Mon, 11 Aug 2025 05:53:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754916822; x=1755521622;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bVfa9+o8d/e4LJg7jUuXVKejNlgLMqMD7ZabWaonjTI=;
        b=rftQSqis8nGeQmVm+YxBif7Urzfd5z+WWp1YY/9tJMfHBeR0SwikH7MTMF8UJsJr4/
         UxHCUYClSN1lvCs6HQr1fzsx8GfHDP/A+2DxRkEU78vZVBkJb1cR7ltVy49wRnyyBNQX
         N0oGST0SlZPQDWVDIlzg4W9h0zUbe55BWdyxJ2sTzi2gOEgz0yl5GViFKrUcKIHNrMcW
         s4mJ/PDjdyRLSPaMVSajU65orY8efxyKD0N2qp9RfTYH3qqVymmX0qvklrc0k8LtZCc6
         bPJeSKQ+yF13tlpMuw8fpIiHNHt/1cziYmqwk+g4uxxWTMSKoTwyHDYELUd9LiOy4djx
         /5cQ==
X-Forwarded-Encrypted: i=1; AJvYcCUM1dXRu5A+2/09RbHgoepoTGqOW5eSTDTkqcTRdzaZ11saOxqEIfxsagq6j5xT02FyCs66cmdyDC+Q0R31ys0c+94=@vger.kernel.org, AJvYcCVMtWobfrmYJHv1/RXw/6R2nJN+cFGWciU5XWwrppbSYxZmO7/0sSeAAnl1scOFlJhNcwfrfFMcs4LwAqRV@vger.kernel.org, AJvYcCWzD9xosiA5aPoj/ca0asoOFKTXt9Hbez6eSy8zamKOnQNbtxyHdxVEtDRZT7YQjgz8GifeXDOBnWxOQw==@vger.kernel.org, AJvYcCXYHkx7v0mIOVrE3z8JvyIm7/wEDH1WkttGQtDTk8qLIuifx7wR5jW6IDSIAcb7KDBlSa5wXfhbcViE@vger.kernel.org
X-Gm-Message-State: AOJu0YwbiHfMWndEYJqCnU24VD7P5lqfAxM3Wn9U6/bGpu92RJiavHob
	kV1oEWxo3sArUimCdHkkeVa6BcMTkAxDJKezbyn1Qp7YIrauq3+J4xW1dX4wpjWA
X-Gm-Gg: ASbGncsFcLCveitWdj+LTiB1WnAPG5gfvGBuPZR12YjB3sas/asJm6GRi8JrZqwjRQ7
	XtLCtHqNrs88yCn7mNiBGFeyEp5Bk7UkwHaKoYfLADtrJn3CdrEoWq1IKgG3L6gufyJUrfguQ+o
	aEjsS1vJAU1nj9wMIOGZigPrrPR7xeL6miCwrir2YnTXs6kUj2KITfdtPjoXPNG0Y7d5hy+zk30
	EoP8ODle0FJAE0v9mQFAF134gGkV5u9hJqX/R+wCW1NVJYLaNvft4f1DkVMCROgclJK8jH9Kw8f
	yDQBm8NrBsFK7h3AAQ2hl48c6FsnnzNzySd//hPKjObw/07VSOmJcb8ZFZez1kG+SZci0zH7X3Y
	lfPOnZevBKLdX8wG4AVXfJeRBm7IjB/QXjtM0YNuznu+lWUinu7dF1QNfPE1d/40MOEk+2H8=
X-Google-Smtp-Source: AGHT+IEr1k7+KKjX105FnKjGUBeevHdDH/r3AFJfvkAFFwL2qsv/y5mTqNh6hhmviaTWGBkHhA6NCw==
X-Received: by 2002:a05:6122:1d42:b0:539:3bb5:e4c8 with SMTP id 71dfb90a1353d-53a52ede0f5mr3980644e0c.12.1754916822482;
        Mon, 11 Aug 2025 05:53:42 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-539b0189327sm2672193e0c.7.2025.08.11.05.53.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 05:53:42 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4fc9db52e02so1275244137.2;
        Mon, 11 Aug 2025 05:53:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU+PfL2TJwz4Fwe4dZ1dJ6DA4FXwZiorZ4OwDcLT25ApR0ZmPe6/cabpuVGmTNaBGMYthuDuSvdh9w6sQ==@vger.kernel.org, AJvYcCX8iE9gptcLPMx9GvRRDfBcOpy4gIgh9TFWv5bPnNnA0q8tV7fpx1yevuWk/7TB3athndqtsXn7YUdc@vger.kernel.org, AJvYcCXHJFsAqOyj7hBICgovJLU2N9YIBrmjKcEZY8hUy8SH9HpHzl2rl0p9h5poZttI59lUuiXDNtWZbEdmZbLjLw8bsVQ=@vger.kernel.org, AJvYcCXbjJ3/cWTSTTJ8YNE9hmYzWmht1iF0tCh26Hg49QNQgmXCZvaQn6mupQVK0a9D875tejty3tW75bFnFWuw@vger.kernel.org
X-Received: by 2002:a05:6102:3749:b0:4e7:bf31:2f68 with SMTP id
 ada2fe7eead31-5060f6aaa6emr4030322137.25.1754916821916; Mon, 11 Aug 2025
 05:53:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250808133017.2053637-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250808133017.2053637-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250808133017.2053637-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Aug 2025 14:53:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWYbArM1Lg0+CHeko8VnbACVUCgi5UQRphZtfXP-D1uJQ@mail.gmail.com>
X-Gm-Features: Ac12FXwi356IvBKmdB9NeHN4sVhZlK73PoL7uK5k44KdN7L2UOrqrdNRPIuLIo8
Message-ID: <CAMuHMdWYbArM1Lg0+CHeko8VnbACVUCgi5UQRphZtfXP-D1uJQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] pinctrl: renesas: rzt2h: Add support for RZ/N2H SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 8 Aug 2025 at 15:30, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The RZ/N2H (R9A09G087) SoC from Renesas shares a similar pin controller
> architecture with the RZ/T2H (R9A09G077) SoC, differing primarily in the
> number of supported pins-576 on RZ/N2H versus 729 on RZ/T2H.
>
> Add the necessary pin configuration data and compatible string to enable
> support for the RZ/N2H SoC in the RZ/T2H pinctrl driver.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v4->v5:
> - Dropped updating Kconfig help string as that was done in patch 2/3
> - Used 0xXX for consistent formatting in r9a09g087_gpio_configs
> - Added reviewed-by tag from Geert

Thanks, will queue in renesas-pinctrl for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

