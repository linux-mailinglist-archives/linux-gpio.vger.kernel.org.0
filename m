Return-Path: <linux-gpio+bounces-15761-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA664A31020
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 16:48:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 756313AA246
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 15:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 207D8253B40;
	Tue, 11 Feb 2025 15:48:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322271C5D40;
	Tue, 11 Feb 2025 15:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739288926; cv=none; b=o1eQZv6ITow8IHDVWIUGu61rCe9lDTetX50UavTooi8nw93Oo5MyBcoyhSROBJnPQTKLo+jjzAnXJqxLNUUTVzTWTFjX6k/ZjpMw5vsK0DfPTDdBV7xLd7ZWKg9hPbRFnh1q6r7qiRwonWz/+YPWbJVdf3E9cjHBqLAE6cC/uME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739288926; c=relaxed/simple;
	bh=/aF/rqtzU2Jnz0v2tKa8+Wn02XYCmXDxt34zx65zn78=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=edIeyaQASa5IZrH2TwhdPbwOZTWG4bP9aRCHBUSGXJQ/4wLChYoLiF8sLt1kzhKMiLsl7S7j8DpjPV9vsrYWN/hCSQw15YYgyOcJJF0V9XyZUA0AOf0+2ccMuC1qFLkiLZGy++LmZGlgzW6UipDTWRk6mRJ6Rpd5GDPoPk3vXTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-8622c3be2f4so1344593241.1;
        Tue, 11 Feb 2025 07:48:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739288922; x=1739893722;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dFgNZgQPq5ypCObRC544dtvCqvHAh+EVgE8j6iOHSiI=;
        b=H8F9xDEcVjJC2DeZ66SUs6O8/TiqMfjhMB3x8CyxsZCR6kfyyNTXP/bOWdyV/YmARK
         LOZS4svmL/J6khpmJJe9sk3mujXVqvGFZTRgmb6n7+bYnMKxNoWEwtKDkFkK730gjQlB
         YhnpsqV3JQ4tONpKEvK52mZeLE3iyfRNJWfFvQsN20U1v3Kdo5B9axToiafrMscn3rgO
         MajiyTwrYDdf6aDSfNEIfMtVAEBlTO4F7wOCfvr6AVsB6NiOo6eoio2GPf5xRdjqynqb
         mjhPqhlF6svqwIUbnhaGjxdL2zm7ML014Sa7UVDZ9JX8A61qizaV9Ukfd1M9WLmy+wDf
         XbwA==
X-Forwarded-Encrypted: i=1; AJvYcCUJJGNqASFfp2qgUGmwCdiUybAAAocQP3MXQnaZVxerB8srL+LnCgfjG6UGcT4KzqHd0CTnsympaU5UhBM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYjYOjGNlxm62+X+lbVzc7TJVB8xA4FBQwq7sn0Cvh61cKkxZ7
	V0X+PiJplBbm9WYZm03wKFxe+sifOcK80LyPd077D785P+kJNkQPIeV+If7DVQE=
X-Gm-Gg: ASbGncvtvDDtn3WZ9i5Aa9GhozDerTNYt4NhU1glb6TRHiYl9opMH7Of/mChtcjIyIJ
	3caIbSJz8UX8T4eimUFlqscu2NLq8tWGl+/V3XvjS2ViYX0JkrzqmwOk1VQzjHb6QMroonODzub
	+5qEw9sGxiQMRz0jmfKCfM+jutCQ8bloRCf1KWyWKyiad5xky9tjvgdL0V7g/A5b2QcWdyXG33J
	UO2B7DLlPWQX8B4LJwYb95u8FQIkI4FRf0tdjadYEVzWseuzPORByUq50sKDZvHE2TWlraRFuiv
	9hOgFho5MtVuxeDqA1OMwGYANM7t7/Ifhz9HF2XUm3KJ8fQknLU+8A==
X-Google-Smtp-Source: AGHT+IElup7qwEe0SCDldS0VCYnHYTDZBnuv2yIlOaS/cRk8D1jShvydqVl0fCAkbpIwHZ9m3UIrdA==
X-Received: by 2002:a05:6122:459e:b0:518:791a:3462 with SMTP id 71dfb90a1353d-52057221381mr2866308e0c.9.1739288921850;
        Tue, 11 Feb 2025 07:48:41 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51f2290d18dsm1666176e0c.34.2025.02.11.07.48.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 07:48:41 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4ba722d3916so1327618137.2;
        Tue, 11 Feb 2025 07:48:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWiyZe5as1ktGtcQVbmS66664/F2YzOmB40mveXBZ/IgboeBSHgaw+HXfk+bffKf8jHXtTIkiwEpIPyU7g=@vger.kernel.org
X-Received: by 2002:a05:6102:15a9:b0:4bb:bf49:9088 with SMTP id
 ada2fe7eead31-4bbe0522487mr3145922137.16.1739288921268; Tue, 11 Feb 2025
 07:48:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203031213.399914-1-koichiro.den@canonical.com> <20250203031213.399914-2-koichiro.den@canonical.com>
In-Reply-To: <20250203031213.399914-2-koichiro.den@canonical.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Feb 2025 16:48:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVdJcu0Vj9myYSan2vVEatF-dRJ_XEA34kfgaWaK8uTRg@mail.gmail.com>
X-Gm-Features: AWEUYZkoC6kw9m0D0ZgQGB0mQpfFZsXOwzg5Uce68qZaCGGM5ArDlgKlFlTu1To
Message-ID: <CAMuHMdVdJcu0Vj9myYSan2vVEatF-dRJ_XEA34kfgaWaK8uTRg@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] gpio: aggregator: reorder functions to prepare
 for configfs introduction
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, brgl@bgdev.pl, linus.walleij@linaro.org, 
	maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 3 Feb 2025 at 04:12, Koichiro Den <koichiro.den@canonical.com> wrote:
> Reorder functions in drivers/gpio/gpio-aggregator.c to prepare for the
> configfs-based interface additions in subsequent commits. Arrange the
> code so that the configfs implementations will appear above the existing
> sysfs-specific code, since the latter will partly depend on the configfs
> interface implementations when it starts to expose the settings to
> configfs.
>
> The order in drivers/gpio/gpio-aggregator.c will be as follows:
>
> * Basic gpio_aggregator/gpio_aggregator_line representations
> * Common utility functions
> * GPIO Forwarder implementations
> * Configfs interface implementations
> * Sysfs interface implementations
> * Platform device implementations
> * Module init/exit implementations
>
> This separate commit ensures a clean diff for the subsequent commits.
>
> No functional change.
>
> Signed-off-by: Koichiro Den <koichiro.den@canonical.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

