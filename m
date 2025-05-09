Return-Path: <linux-gpio+bounces-19825-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB55DAB0DCA
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 10:51:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5DF01BC1106
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 08:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 109A127464C;
	Fri,  9 May 2025 08:50:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1C62686A9;
	Fri,  9 May 2025 08:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746780622; cv=none; b=dRER8WswLd8vS2IGPO1lmorEcX3R+bZlsCQt+ZsVVGgNbRew6QilGqWwqXQe6MR+Y7LYRXbekMjqEqSvkONXpETUm3Izcns77QVe+xw8jPMs/Tq9gPWAqvNjaCjDJPhC0oqtJ9GWPxEnwCn4hNvaWJ9fkJd7IR6iW30lCSoacF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746780622; c=relaxed/simple;
	bh=+Hl+wiIW3C8/bKLyZwa/zwzpkMEibxyk2jh3LXxpmQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C+97r1zaISG2JzhcpcTIW4MfgLF1+r/OgDYrfE6DygobOSxJQ57oEb1Ti4Z4g6WC6gwoO+T2At+WtqluJpg9URvsMHO/aT84AXZgTKdW5WyzkmgreKdyUu1GuutpBUQx/oTnDzLvM59vA613eBIYi8HZQxb/HhyB+2yN0QrgDZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-879467794efso1014759241.3;
        Fri, 09 May 2025 01:50:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746780617; x=1747385417;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oB4st0LWv6xHUMHu/+5dOmCjZcdGbjQTD5yuiCBtDrQ=;
        b=MRFwgZli+9Htw3DpoHnnmxMBPNtYLDErYgYSFxSDb923RYGVeof7jRPJ1til2ZeAjc
         ojyZU4+cSJTpNc42d57ftPUSIthB3+3Zi5mdEYFfWAXJyETVhfCe5+vnE/bQUD8U5EsZ
         7cBDpac8NFNxDiMdKmdRVzbVh2iVwaEwsHSJsNKUBJrM5BYAok7FnGKkY25EYEclw5Yg
         BQondN+iEAMvExwglQyrL1z4PY0dU68M7KWSSP1WYE4utF7/OfeAQWPKX4FOfLsPo0t6
         P7GafbDpKQJYOuyNBCmazahy3glyfjO5TPtZ+DLOtEQdBX2sY+knmwU1BmlpK3eU3LJN
         uMJg==
X-Forwarded-Encrypted: i=1; AJvYcCWUwtXJqQuI5kePV5xxjGAvn/r+Ycmb7bQ7k3V1GDMib+MrqtjiBkPoSo191Q2HKnxES2SgjSNIbjep4ztp@vger.kernel.org, AJvYcCWcVErkj8tL0OIn7EBGwaaeXzs+5X8HGfOKZZJ7Qk4RePm/9VG5Na0CJy7iVs27qklqz/KLb4Al5tGmw3Win5nq@vger.kernel.org, AJvYcCX7BtisnVNeRrF1096R3BrBPACmDyf5u5+n3Km3muYrihWla9YF5zVLcJf2fH5sv2ghl0ocx+z1qa23@vger.kernel.org
X-Gm-Message-State: AOJu0YzQWWx6gGQMPN51ZK7wV04GUDj1A453B0ZOYbWJAwEACU4cy2vx
	tg+okMcVlEWwESs7cIF/jrPKPSjXBHaxNa6FZG2UiV2KjRBgR0vPnhW/iGKt
X-Gm-Gg: ASbGncuBP3U5yFFT5cUziAWosmz5lUF4yN/UkljZV+xbPhT8/5HxBI5eTcO5iIqDOLq
	GHCuHV14bAOU6AQMV0CSRIxpoE2tZGoVrSzq09B7W+rFHNNiEyBITzch6/qY9dWpF4Ku4/2b0rD
	ovXgOuNDKRaZ2jb035PzMmRtyFGeLp8ObQ7ERtjfpRp60T2IbAFBhi7iqH7ARoF9VhYLrtAzFNB
	S+IiUI/m3JZ7F2vCYFqCu6bnVKvuQzEY9f7noIP0iUC/TSAkdoQPeeBFTIz9B0iy3264tk9NBYw
	cflV62KNyZjaHdRgyTj1nrg6yaRE1/Pq6IpMmlMhqVh/JXBM6wqmIvTazo7OW8Xc6aWiqPXMyWg
	+ueA=
X-Google-Smtp-Source: AGHT+IFw92R6O3SRC4mVRC5URXVSE9bQaNnVKFqLTzcMprKc2r7k9zOAU+WcsMy1YYGSnIabqJh7Ew==
X-Received: by 2002:a67:e7cc:0:b0:4dd:b037:d23d with SMTP id ada2fe7eead31-4deed36f9ddmr2294610137.12.1746780616677;
        Fri, 09 May 2025 01:50:16 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4dea85d8974sm767910137.16.2025.05.09.01.50.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 01:50:16 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-879467794efso1014750241.3;
        Fri, 09 May 2025 01:50:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUGFtLEFbvHODXSJ6rQtr7ja9QtSlOlZzrjy+YP94hXkpBwdOVRbpMGJEm7nERNyGEowQE2R0KFUwbHtXuM@vger.kernel.org, AJvYcCUf6PC8imIAiP/ZnvY8kkZKCNmIYgerJ35vZqObxu1cGiWuJSGs5HjbsYR5gEMj1SmG6l5yQQgao/pjzaVOsm8C@vger.kernel.org, AJvYcCUyuW5RT+V+xclz6iDxZxyhSEn6OYcdL93QDsV80r3gbgZFS+52jpsnsdAY4rAlgfrG/Rq0LcDsCPYf@vger.kernel.org
X-Received: by 2002:a05:6102:91a:b0:4c5:4591:ffda with SMTP id
 ada2fe7eead31-4deed3ec749mr1914524137.21.1746780616142; Fri, 09 May 2025
 01:50:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506-aaeon-up-board-pinctrl-support-v5-0-3906529757d2@bootlin.com>
 <20250506-aaeon-up-board-pinctrl-support-v5-6-3906529757d2@bootlin.com>
In-Reply-To: <20250506-aaeon-up-board-pinctrl-support-v5-6-3906529757d2@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 May 2025 10:50:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU4WwpnBfVAUtv4F8T_wxQ4MX4sgr33D3SC6uk6TO+_RQ@mail.gmail.com>
X-Gm-Features: AX0GCFvzBJsI2-ABuM25Q0qnQ52jIKMoCq5p9seZgMmw3k_yetz3lyHQe09y5UQ
Message-ID: <CAMuHMdU4WwpnBfVAUtv4F8T_wxQ4MX4sgr33D3SC6uk6TO+_RQ@mail.gmail.com>
Subject: Re: [PATCH v5 06/12] gpio: aggregator: refactor the forwarder
 registration part
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com, 
	DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 May 2025 at 17:21, Thomas Richard <thomas.richard@bootlin.com> wrote:
> Add a new function gpiochip_fwd_register(), which finalizes the
> initialization of the forwarder and registers the corresponding gpiochip.
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

