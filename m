Return-Path: <linux-gpio+bounces-26454-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 699B2B916C5
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 15:36:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EF492A3034
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 13:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B83F30DEAF;
	Mon, 22 Sep 2025 13:36:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEABD2F0687
	for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 13:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758548165; cv=none; b=C9dEtgcInY2g+R9379sc1rHppUgmh2PZloXNHYqu0d1u8fn763dDVnJXVMyfoo6vgtJndYiQcRUqOTOX0WEoLMjwjTYJzGkWTs8WD6aI4E9c1fj9TzMT5Pn/kct8XudIfag9g9EccDS0Hy3z9ykH74S01+CJ7q3b7gsyoPW/UOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758548165; c=relaxed/simple;
	bh=o3fokZId+Y6ExSrmVp4U54jGApx0aJHWTHEveHEApIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hEooqY0kG9/Q5GCcliNlK4eaouLyjUp0Y3Fi1AlPZMx5dhByMFZGwZbWkEYPuFUm2w4UfbOCRBtNy05Qgzf5BCfLST1g2LKlS0qDFa8O7539knyUSpfioDVDlrQGui4a5NAEVrknDHkZhcxdeTEo/QIN7mdS0iBMmhCQfrTAyr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-54aa0792200so1120872e0c.3
        for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 06:36:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758548163; x=1759152963;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Ot5mKBkVwUNvkCox+i1Ysazafolib0GaP8R7L+vKCs=;
        b=c8N6WT6cnEG2T2U5aw9qK/VNSmlLoBSAkxkxKWYYlIrU9QxtoKzI01wq0S7mcJ5Q49
         TCKbd4bU9bOp3ra5Zm9SjZxBY/QhnCOkhKr/Cnm6K1dLVk86h2KagzDoch6o/NscID8G
         RlIU5Xj6qiNi7XqgZaPcu5pEZEF/1i/rEOc4cbQU+2UqV1oadVNiPoWH0ZN4rxq6vaRo
         2gJos2f9DcSLDtb8YGK6+nJXHed1LYmdl/4KBv9qd0E6eD50u1JFwWQbEyxCarFUnUit
         QLbUrc7GQYuPtqwT6GWJJo6wutqeMjPjVNMkwsyf8ATN5ORZLF3ktV3XXwkXDCnIn8PO
         NSVA==
X-Forwarded-Encrypted: i=1; AJvYcCW1uXd2mcPBOpbfm/fheEwz6eoxtZrnZFDMQGIMjGIP7cd2RmWgqUjruBt7l5lnGCCyXG0c9xpm0Bxk@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlp6q74WGm9V0k6W3DbwrSKNJ6qpOpYxAmCVSQjbdh/5MXs3Kb
	nNJQzcvs9A7v8LE5gv8/q4umoidzyyoOGims6rc6OdOscDcyFtupWYVLj6cIW9Pe
X-Gm-Gg: ASbGncsDV82yDU+nI/PZOONcOd5X4su8QfyqpUE2beKYJD4Cm0sFb462sZ6tUOsB2lY
	JCy5ZmOyUKKMmrhhUoOTeE05dBjia19v5tn2+Aye+p2Jo55a4KyVYca7waMQcgqI4/rHQtkxdUP
	agP+5Md4ueZ119GbwvKb3LIqxpLyKDXtYWs+FyE7yicSglCm9ZhCT4Dv9Jt0Yx58YSuGk1c2GUa
	BxdtUAZq58a/XuugSNpQt99B1IQYy75N22Lbia8/RgkSQSoIYOwHoL7VZO5AtZ8j9i3/4h3Pj0u
	LpK+5ZwwzkmguImeOiNzA2Rd76owWPlfCykWCTSbS0aSy3Xx2yi8mqBgAxBNLBWNOxCwXg90IC7
	9gL9MzVoR7iUBOt6yIehfN6OWWledaHU87QdADbiKo57iGnJIFZvC0FtEtCkd0P2KyFR++pc=
X-Google-Smtp-Source: AGHT+IF1dOdasVvf2qjxr99U32rKjEa1lgqCliBqSd9J4tdu+jxaKpHfOWGah4VY9Fsj74h6Xz9U6g==
X-Received: by 2002:a05:6122:30ab:b0:539:44bc:7904 with SMTP id 71dfb90a1353d-54a837847b3mr3844418e0c.5.1758548162458;
        Mon, 22 Sep 2025 06:36:02 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54aa15cb86dsm928218e0c.8.2025.09.22.06.36.01
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 06:36:01 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-580144a31b0so2014774137.0
        for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 06:36:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXiZLTeVIHvJCLnC59CpxAr6d6aCsfJHOF+iYdyNi14inpIdjv2JFbJTYn07mi8/mlLc6t7eC8i+eeG@vger.kernel.org
X-Received: by 2002:a05:6102:4426:b0:533:44d4:d624 with SMTP id
 ada2fe7eead31-588ddf8299fmr4350434137.8.1758548161616; Mon, 22 Sep 2025
 06:36:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909104247.3309-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250909104247.3309-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Sep 2025 15:35:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVmQrOg5-fJ+NOmLyp3TCSRuoEtwNKSy4kw_zKuoTD-oA@mail.gmail.com>
X-Gm-Features: AS18NWDZCs0_Ui5sZv5S_MT6lcUUhGR9J4Vn0VBerunEKZYm2pd-7PEJiuRZBa8
Message-ID: <CAMuHMdVmQrOg5-fJ+NOmLyp3TCSRuoEtwNKSy4kw_zKuoTD-oA@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: renesas: rzg2l: Drop the unnecessary pin configurations
To: Biju <biju.das.au@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Sept 2025 at 12:42, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> There is no need to reconfigure the pin if the pin's configuration values
> are same as the reset values. E.g.: PS0 pin configuration for NMI function
> is PMC = 1 and PFC = 0 and is same as that of reset values. Currently the
> code is first setting it to GPIO HI-Z state and then again reconfiguring
> to NMI function leading to spurious IRQ. Drop the unnecessary pin
> configurations from the driver.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Dropped extra space before the == operator.
>  * Moved spinlock acquire before reading pfc value.
>  * Make sure it is configured for function in PMC register for
>    skipping GPIO switch.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

