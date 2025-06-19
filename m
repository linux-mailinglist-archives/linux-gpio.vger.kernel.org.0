Return-Path: <linux-gpio+bounces-21874-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 75072AE061E
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 14:43:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C952E18876CE
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 12:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A635E23DEAD;
	Thu, 19 Jun 2025 12:43:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC06921D5B6;
	Thu, 19 Jun 2025 12:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750337002; cv=none; b=TMuMHVgeuHBpvmKG3Rydv4yBxFdk1i58j7zzJ5c+2O6gW/T5mGUC2NY46BDPQELAGin0gCyjI9JbLZnzX0kYgQ6gO0umD2dAminanyjBtp0MZgk9zdoxkhFbgQq+JRHBDA+sMgtjz7SSYtz5GoFpTmkAQde3Jzs5W/5gsCgJHHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750337002; c=relaxed/simple;
	bh=i5xNppSodsmdVPFwaZ13y2PIK3nblO9lytn3QFB2m8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ega9BuBOzEj+IOLm6+Ffgzak0bp25HGOyNQa437QLavjmt3aWnSRtwedjf9h63WadrFGKJ/HTuBR2/H6jStL6Erg0oc1PY2Tp/lAkWpRxbZ3tLiYy38T6UgXc2cXRzS6ExQ7/zzURaf07V6bW8GAUPNcR8AaFVHu2n+Z+5e7gqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-531a1d5519aso166925e0c.3;
        Thu, 19 Jun 2025 05:43:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750336999; x=1750941799;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O+DuyXROWoJ9u0O/DA8t3pPTSyPnG1InwNOy6TbOe8I=;
        b=S+JpWeIz0eL8qecXpn4DOwMvwr9FRazVV+i8TTW+53qdx1PvsOVdWAWKf4b9GtASoW
         AGLtYffG6Wq0lrP3ppo71r2wnCUkzi++73QMyMfWX3Wvf4AOgWR9JVziENFe2d6KMGZV
         CqrR0+8LOoHyAftb38w7C4YQN18Lqx5v7hdpCJsGIwvQqLG/JWWRXbMJaxPJPKwHSyM6
         A7t5T0hoaNGLYcEeNLvVLVzTVyn1CFf0I+FSh4ZouFK0FOJO3HU3gl+6IEzOmq+FTr+k
         mI0cnhVSBcjSmNNMgaUlTTrk9jrFjgVaGUPVc+6ZL/vvCvpYq6sixUE0CsoXmmaZ5Qkn
         FBlQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1XF9r3phEa0fbInTCR8Zl7LrDPY3n6ZiLseo20uZaaQ4bKDR58/4RtNsHmf8PnThuuGHpeUu5CejhfdiHFqy4hxE=@vger.kernel.org, AJvYcCXT+SdcvihPoavrAyaKSl6IQAEy4MbBe8nbo/7YdNiAx252HWIB6xfnbENbmBwE5GHkVPyOEpPmr8t0@vger.kernel.org, AJvYcCXyLvAXSZZcKxHYylWX71WBlEBtyI4gotwNvPJUUTOyZpeROxMwBeizPNbJXolQZENkGXeDacYbvQXk9U8K@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8to+RIcKMCjU4bdxvDyDBfBoBtx96rYM5TI/NvgrROMVnIMRk
	R0vwU0U7U06djoW4WgjL7g262rV+2F160XzSWGmwg09LvtAK7owOoJ8KNdH4qgvE
X-Gm-Gg: ASbGnctS4QVUys6AQoOU5JNd+NSDEdFPhWmCusEdD3h7/N1MTN+k9F7nxHQm9hfnAu6
	mfbQ6i+ZWWRD3mEXdOxHLT3etl4ubI3J/5B5hSg+c/TLYboFfNQqiUVPLKzrW6QWuCf4JwJDQyz
	YsdPccUepsIak1UffekEAsQEvS9h5mK2W4wRztcEWybn/f+1eEoRjjWgEFfWVa/qXz4MI31blKX
	zCS1LBZFBaNTExOhdzFYiRgDDrtaqUTPU70Ym+RBWRrt190ECSKTswBzcFh3YZHhwh6ZZlkG2m6
	jVPsHz9DrKGT+ih1eB5XRW+036gGate09z8nXoZCDafoLOWzb0+AbX9cFYg1e6YLGxusGMkFK5U
	3i3fIwIHlTk16OFtkPftlXB5p
X-Google-Smtp-Source: AGHT+IE0cZGgaSyJBq2lIPOEwH2gm9mJpE+o85dnr3zeRQSv3OuUAiqhchQ8F0xDTm0PiGuxKFivSA==
X-Received: by 2002:a05:6122:179a:b0:531:2afc:463a with SMTP id 71dfb90a1353d-531495d3769mr15923104e0c.7.1750336998606;
        Thu, 19 Jun 2025 05:43:18 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5313dff7432sm2411674e0c.29.2025.06.19.05.43.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 05:43:18 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-86f9c719d63so169382241.1;
        Thu, 19 Jun 2025 05:43:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV1QCzGk6BO+mAdLNcQvAu0FzXVnJ6Yv+q9GWNPEZqG5i2PrRW0wASs1FPj0jDl0yNcfl6qIHvIv/uoPCZa@vger.kernel.org, AJvYcCW87jtqgAyIVRpw/QNuWHEkmO7EFp/cPtUeMdGr31uUdhI2KA4JsSx7+nkC6eNZtGX8sUl94OF2howf55up0hsQ6nU=@vger.kernel.org, AJvYcCWVyPhbLjW5bEr9CHvc7wCfldeqMSInimx2gq2d7URL6cdkTWYYAVH/iAw/IvGIP1yrEOtNgP+w/eGw@vger.kernel.org
X-Received: by 2002:a05:6102:c8f:b0:4e5:59ce:4717 with SMTP id
 ada2fe7eead31-4e7f614b8femr15383631137.9.1750336997708; Thu, 19 Jun 2025
 05:43:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616132750.216368-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250616132750.216368-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Jun 2025 14:43:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXkVRv92V9mwZRPipVcZg+Zc3=zfQ7AbVXbLyodb-=-rw@mail.gmail.com>
X-Gm-Features: Ac12FXyQGieJJ9_eJtJL-AeIbCVCBJ-Am_e9aIpjxehSnhZv8GYyWS_xQ0sHnc0
Message-ID: <CAMuHMdXkVRv92V9mwZRPipVcZg+Zc3=zfQ7AbVXbLyodb-=-rw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Validate pins before setting mux function
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Jun 2025 at 15:27, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Ensure only valid pins are configured by validating pin mappings before
> setting the mux function.
>
> Rename rzg2l_validate_gpio_pin() to rzg2l_validate_pin() to reflect its
> broader purpose validating both GPIO pins and muxed pins. This helps
> avoid invalid configurations.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

