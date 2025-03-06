Return-Path: <linux-gpio+bounces-17150-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E941AA54E54
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 15:54:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B527165AE0
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 14:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7A8518B47D;
	Thu,  6 Mar 2025 14:54:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E75502BE;
	Thu,  6 Mar 2025 14:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741272859; cv=none; b=GijjF9mDyJBCqtic5bTUVxnb1+s7itmQ71TL22z1PY4qxU5I6bXXPrqU9ileV0KNFqvbMMgGNuUEIcwvdSzhXPx5thhYqM8RsqW3kCAHhH3wiscs5OKdWsMRyZcGEQ4N4yr0C8UQF4Gtlc/fQjOfPlezaR9ZQI0MSW8Ek6w57UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741272859; c=relaxed/simple;
	bh=3b05lQoPmfwdxN/nn39tzUnKU7Nb1LFlRiPMuFHjMaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GIW6FVNc8Fj2JMOiFIv4o1ms2eW3bV+9yMjy9kge3LnWveQM4/3UYoRpyquMN8DsjnvHpWv+W42sn+vuV+vDCBUiajAPYGQOimHquA/Lzek1SRq4F8KBM0VdIs8PTB4gUPZPm8f5Ukp00TOexM40wQb33qSYLUZCqAu9glRS2d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-523dc3649edso185304e0c.0;
        Thu, 06 Mar 2025 06:54:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741272855; x=1741877655;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BQszd6Rcuah2ZLoMRf35X23n2wyRO4Wt+Ll9IkLTxlA=;
        b=nWjIrO80uh4sK7nUfjrQOpRb2px4PbWSJk5aVEUGzOfs85AniyRz1koylC3vgGoVw4
         SyNS7Cw5F8Py+LN58xTg2A8SvPMjrNs7ORLrXhLpWNNYBeffjAI/m6YIPY799CoR/PGt
         4mTmGv6HMQgAsA8oAyJUru+cWNUVfBZJa/hxH2FraNWOu/PNiLXjPEBK80rYj1ZiZBOM
         Bhopl7nT0eODyYRSKGESCIxPKLSWKx7RmwtDOCGEY+6TaQ6svh6Tl75X+VAU81EUjjfs
         fH1UB5TNQ8QOYTkFLVwTocBlc2DHupkPH0m7C/qdtnuEHfMWXXdMmv7aLtZgWjpdyxI1
         gEVg==
X-Forwarded-Encrypted: i=1; AJvYcCVEo8jb2EQPGDD/Sl7EBw2Pp1kQjlfYG6IrAw3P3vd7Z9ANtiNWbfusHBEozQT9FwiW1Uiys2aX3wvm@vger.kernel.org, AJvYcCWAKT9iTJcSXqfdwlSOpO1iN22jkWC/I6PuXYyBhmkv5NpFQEVbx4i5OqPjqQZ6YC5nPld5PbtMuB6LV8ASLh3MIHg=@vger.kernel.org, AJvYcCXbPg87bdLELUkERtSKzIpdwsta2OISCJw2tkIpVKEr8dxqju8CDHSiDDIt+BVMIR1ABdCJ/y3B5N89r3C6@vger.kernel.org
X-Gm-Message-State: AOJu0YwMHd57pynWCCOQnaS794tJ2/3d4WzTaLcZvtqfOlNdtJ3Zmjja
	xvst2pQmsHUCmis57LBfceUCTc8iE50oaNnL7HgWrq9IhBaDbgUpSjz25nT8D8o=
X-Gm-Gg: ASbGnct4IjikYLoyJMON0sQAgLOVws+rGedbKBG3TnZFmy/C9rgdASNdrNZvuPGvx9W
	fuv9lLXlXWxbvUK2+CzbLiU1SerCE3x3Cba/QyHqyF9Hb+GxXfzhUH7hrf+zEO4iSkXxWoqWePr
	CxAJAjsF3T2qjsBX4F9nxjQWQHGxL4a0D+3NC7ML/iEuYKINoLuHJ6vBvHKECsj/RJWUynpZqcY
	O4dC6a/3xsi1dmR0D3Iixl2wVgHnNTG20wuuMO1KEfA/f87aSEglfRoD9E9Hm3tiUXlvEk+akNF
	LuVgJWnaOtgTc5WK/GRhmjAeFT0rrCvh3dLNnpr6JSnjGI5XP5uX8uU+4fLnYM/RfVDp1Gr8/6t
	Y3riezmw=
X-Google-Smtp-Source: AGHT+IH5Pt3jT4r99CLjSdWNCzRS3IE8UUvwYf6xLQrng7gN1DfIwz6DPRBZCZPi6jMC7PuPAnhqBg==
X-Received: by 2002:a05:6122:3a10:b0:523:8230:70db with SMTP id 71dfb90a1353d-523c62ef265mr4288522e0c.10.1741272855243;
        Thu, 06 Mar 2025 06:54:15 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-523d8cb6204sm191360e0c.39.2025.03.06.06.54.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 06:54:14 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-86d3907524cso169768241.0;
        Thu, 06 Mar 2025 06:54:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVlKLEFzYZf/7IByBtDuanbjzvQ+YnnbLpG0ND6RlULLFcZehz4O6PZmuefGrzGp45lV67yEThVobXuo6IVD/Kz2ak=@vger.kernel.org, AJvYcCWju6aYynD+XL/jaW9XlHwERNaUbGqrDewcNn0FNbXKvCU6k8+xaJqmXRl/hTklN7fLKozrkX7dprPr@vger.kernel.org, AJvYcCXnzrcM3QUGn/DCy/XmLLxs+n9owyO1GLe+487yEhxk02tb9gm4VYmPDyS8LW+xYEpuSKOoxZF1xAGTb48I@vger.kernel.org
X-Received: by 2002:a05:6102:4409:b0:4c1:9e13:8283 with SMTP id
 ada2fe7eead31-4c2e2a5890amr5334076137.25.1741272854631; Thu, 06 Mar 2025
 06:54:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305163753.34913-1-fabrizio.castro.jz@renesas.com> <20250305163753.34913-4-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20250305163753.34913-4-fabrizio.castro.jz@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Mar 2025 15:54:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUq7+j8AZDiXzjU4pcw2RLp9dV_+Tw90SWqeXsVv+vauw@mail.gmail.com>
X-Gm-Features: AQ5f1JryqcQ6dOrp6yyeJ4w_Y5UIsOTRUgkgptmLPhsjZZW92onlEA82BkBAw7E
Message-ID: <CAMuHMdUq7+j8AZDiXzjU4pcw2RLp9dV_+Tw90SWqeXsVv+vauw@mail.gmail.com>
Subject: Re: [PATCH 3/4] pinctrl: renesas: rzv2m: Fix missing of_node_put() call
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Mar 2025 at 17:38, Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> of_parse_phandle_with_fixed_args() requires its caller to
> call into of_node_put() on the node pointer from the output
> structure, but such a call is currently missing.
>
> Call into of_node_put() to rectify that.
>
> Fixes: 92a9b8252576 ("pinctrl: renesas: Add RZ/V2M pin and gpio controller driver")
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

