Return-Path: <linux-gpio+bounces-24061-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BB6B1D2E9
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Aug 2025 09:03:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 640DD18897E2
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Aug 2025 07:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ABA9227B83;
	Thu,  7 Aug 2025 07:02:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795A34AEE2;
	Thu,  7 Aug 2025 07:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754550175; cv=none; b=fYp4E88bpS/YUhVeTewiUAis/GQmrRLa3NmrCPUm+3SBh/KOk8aHR2qLG157REY/ISKuLrnjicCVbhAeW5HCHNQSC3ZkzAj2aZW95nu3OVYeCNCENiFm3OXq31Ys5+8m/+X8rvcyTbIjCL2IQmAArx9Niq4BslRnzzPAIfkSn/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754550175; c=relaxed/simple;
	bh=F+hK/CsBwE8MYzNsydsevUSk1fgRZdsXiHJeR8Li9JE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d4fuw3hV3kNYwcfwBNh36D85Cl97wz9a9nA//URUXQd+pGqNbcETFPqQ/jjvEVwPnaoBXLREnMDRGuE3WyzhjyWO3RHk6Bv45ZVbO2Es4K7usWJTrUikYoEgn+RtvJkZhQQJX0Y/PW2atFxit9RRKmivj1Mv/5gKqMCTk+Kras0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-539754975f9so226091e0c.3;
        Thu, 07 Aug 2025 00:02:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754550172; x=1755154972;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pps1uO3Cqt1Hhi+a9qkKsjJvcs/hyCU58ry0ep8YO+U=;
        b=b9/C5kPYSoGKTnStt5cDleWEw/7hTk+v0ehDGf9/egUDvOh9iBf+O1qof0YxVxdAfe
         eOKP0+vKAh3gqpvb0xZBfRAh44Hv30HMQNA6Yg8pFRLQL3RsMki7RDEMqRnid1BsOHmh
         lXF0ODfTPsN0dw35gC78pylTSX9TfPLqFcH63rjV38J2iOjjfX+nQuspXkPMvCvpwpFM
         JPcuY7tQuQwcREDsE+r9N/U8l4fWA7rdHCESbaBvPxmzOHV5ekOARCOIQSBesXOhQ4KW
         IVLFW3HBwXVeGKzK8BrVzNydCE6cLUEUKffxDjw2TlTnzGwWOSWFudgLlj7Odu63Mo0q
         c1Zw==
X-Forwarded-Encrypted: i=1; AJvYcCVYsuEnIUxCeEx3UnuDwt0Q78EYOMTUIIKKyhYb+9sQZ1fU3a/MK3KYBtyu55dhScAgv4LyFI5r90PQDd6x@vger.kernel.org, AJvYcCWxHZATREo6w+crbotvmf+sWujIPOpbHEIWs4aSwlJc8DpEO9UqhuSnoVqm8PS+vLdm1PjQHLzYZ2VDfmIPi7rZY08=@vger.kernel.org, AJvYcCXAoRIZfNu73v8ZMyvV6865hhJNlE7Pw+RyR4DM1q+4hCoU6vaWjwKwyGm/bqL3dWxH9IQhh1KOsJH3@vger.kernel.org
X-Gm-Message-State: AOJu0YxQa5ixP6KCXIl1yYrR12hh+SEZ/PFdgAeGXxLGj8NRXYDXJpM3
	ahftstZCuu2ThvIcUwvI+33jjISC/AAZvrBYhIi6kEegf8Yt3Wxx7EgJeoQ7l+RFm7E=
X-Gm-Gg: ASbGncskaNkrl6OPY0Ee5LX1HcaOds7aGrOVmvWRHE7Zi/po/2KIgK59u/XOOGihM0i
	DVag5SvpYEUWfPNXpVi7p28h7E3+NhgLVQVC9+uJpZ+aYg6EJgDvh0XnLaXdPurHolnOJXNs0RY
	Y3Q98wKtE3J3DVwoZKgoVZYdB7UOjypZw1CVQClb1gCyiujE5FIY48s5+OImHr8pgq1a2mL+ltm
	iXZhWP3YpOze3tDit/C3MzeuEb3C0cRvU5MWQ1Ur5z0TSZ4u85D4thiM3FaNbFOcbDcpOMFn6Kz
	YWUU+VkP8PGJf3Lood5J3TjVHUB8mOygu4UMp/R6jGQI97DaP5nUrJ4cVkDicRnW6qMuEiJxfb+
	WNAOAMWQYEZV7vK+RMGJ0EbzcObwKIC5qer72MtIMTVeZI8VHBdjeemZmZlpP
X-Google-Smtp-Source: AGHT+IF1eJrN130qwy+rtAiHzEsuEi8nJfLJpmglAYYMBaDnOw2X1d92HSFH6v9rI9pclPrJ46158A==
X-Received: by 2002:a05:6122:3c8d:b0:52f:47de:3700 with SMTP id 71dfb90a1353d-539a03fd50amr2834409e0c.5.1754550172301;
        Thu, 07 Aug 2025 00:02:52 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-539b0289540sm257408e0c.18.2025.08.07.00.02.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 00:02:52 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4fbfbda957fso236450137.2;
        Thu, 07 Aug 2025 00:02:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUXDzBsS0kFQ8TNG0G7Vm+a9BH39IcXyX3g79Y5S0G3WtzG9Ec0SgZn6foMBijO/JvBax9zqzlku6OuCzLIKKe9MYQ=@vger.kernel.org, AJvYcCWRwr+yV0Q9QVNfRmHqU/IukQznpGv7Q5CMk/4PxHqh6FZfESGODFV80h8Pi21lN+yJHRLmBqMesEVndkst@vger.kernel.org, AJvYcCX1HyeGAk4VsN5xox63QehWwZPzABl3wLGjnOwGIikgnbEwMdAHCf2xBGUC6rD0LoGh2367KXFjwJnU@vger.kernel.org
X-Received: by 2002:a05:6102:510e:b0:4e2:ecd8:a27 with SMTP id
 ada2fe7eead31-503722a411emr2554414137.4.1754550171636; Thu, 07 Aug 2025
 00:02:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250806195555.1372317-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250806195555.1372317-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250806195555.1372317-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 Aug 2025 09:02:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV2P-UvZBOBh2CSpj5QCe3GXzdpQMXBhazA+NuB3j4VRg@mail.gmail.com>
X-Gm-Features: Ac12FXynKZpQCNwGow0EhYowF_NXVOdWV_LRqcM-AyswTMbCtS1DyvFrvMVaDwU
Message-ID: <CAMuHMdV2P-UvZBOBh2CSpj5QCe3GXzdpQMXBhazA+NuB3j4VRg@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] pinctrl: renesas: rzg2l: Add PFC_OEN support for
 RZ/G3E SoC
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
> Add support for configuring the PFC_OEN register on the RZ/G3E SoC to
> enable output-enable control for specific pins. On this SoC, certain
> pins such as TXC_TXCLK need to support switching between input and
> output modes depending on the PHY interface mode (e.g., MII vs RGMII).
> This functionality maps to the 'output-enable' property in the device
> tree and requires explicit control via the PFC_OEN register.
>
> This change updates the r9a09g047_variable_pin_cfg array to mark PB1, PE1,
> PL0, PL1, PL2, and PL4 with the PIN_CFG_OEN flag to indicate output-enable
> support. A new helper, rzg3e_pin_to_oen_bit(), is introduced to map these
> pin names to their respective OEN bit positions, and the corresponding
> callbacks are wired into the RZ/G3E SoC configuration using the generic
> rzg2l_read_oen() and rzg2l_write_oen() accessors. Additionally, the GPIO
> configuration for the PB, PE, and PL ports is updated to use the variable
> port pack macro, enabling per-pin configuration necessary for OEN handling.
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

