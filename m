Return-Path: <linux-gpio+bounces-24027-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A89A6B1C658
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 14:49:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E979B18802BC
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 12:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05FFC28D82E;
	Wed,  6 Aug 2025 12:48:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D4C28C010;
	Wed,  6 Aug 2025 12:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754484516; cv=none; b=W7zwvx+4RqlUilZtvAO5LhGB33euTSL3Emb04czxwcvuQElw/BrE3i7ALSiQEzUFjq2+N+wMuxPpvcXTjfRQu1GlIFHEXIOjpJJCZ9MHoI58LbDTV3yU46dU4/jh4dV2n5Potk2eRXBiSb3E+vqk8CF52OINJInfwKuCEs2XUHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754484516; c=relaxed/simple;
	bh=drxNFdDOYXPphAPC+3ioBCfwuh3jAMtrieNzj43a1ec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n3m5Simr3nGEH5F5H9rjwFPULWTh3LvgiifneQceLkTbxjIbo+IFyukQWSr7w9UG816s18BoeMEeKderVlCnzPhDyq2pIdlixLnb+Wq8CXq59iQ3xi5mJjDZgvXZYetQz0OpUcEp9ER92EB3XLKzreVrQDZFCMJA8faej2YjQkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-53987d78f0bso869130e0c.2;
        Wed, 06 Aug 2025 05:48:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754484513; x=1755089313;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0KDmhC409p2GwI8kmmfO4tBlHglhDdOKk7c9JjmO/hc=;
        b=NmhBX7HoNXUxGE7CXfZby4bQDS9yhNvevxxWvt8vq84v2QbbHj6U5GHY9Uv7eyke+T
         9NMOHHEpJSHG/U+baUpPZUGMq41Km8iGGM8+G/V/8qtPJ4FjTet55vBBvSI8TaaoH7/i
         cO1KM9ZAh3ka+Xg8HkVywXsSoYy+30VM7mjEm3PVGfvxGAY+0vfbdljyGp+4oBJOslus
         y8tDKAYZzvnsBrCsIeUWfJ6vrBfjmBkw9WoYyGoSbrfp/ER457u51N61DETqtnCEeh6h
         lZ91cdsx+N7Y/ZhDj6GBtIe3S4/Nc9Zq4mFH7yyBp07u7F4UoaERiuPWDmj8ASiXBB6c
         Rnjw==
X-Forwarded-Encrypted: i=1; AJvYcCUG/827VkxYTpjKuCpOSFsyrhGnUnDxy3ntYm6TUpueQOVBWl0qDJ6o6PHJpI9eTqwhANu4wurkvpKZ1HbVpKdP5UM=@vger.kernel.org, AJvYcCVOXauNYdKKERTRYmyHFk2Hsp9gZFsc3P6PB6jKsOhNhSNWzJThpomNsqkOrLEzoL2Z3aY31naFVZWm9dLW@vger.kernel.org, AJvYcCVbJIvKvx27mIJnRDCxyKqyiotkoIklhp2eQrdoV47RNvGvsy/tJIaFra6kNGVfOtuxtksZWkY0r26D@vger.kernel.org
X-Gm-Message-State: AOJu0YyPixaZYoV+GtrhGfN4OMc2ApMDY4+95Vf5FoU1lnMevwmvZdl6
	HBXYMpOrqR0t3RirqDVzrDy81yX8h5eBGktR+DSHa9TsBHib3dOTIJ3ZoDg6yoEt
X-Gm-Gg: ASbGncsxMLchPpSS0Qfb91q3Pjlpg7+Hx9EDBJV69VQ8LdUImH3vpgQlZ3OfrBnRE5h
	tVOlEOXcGQazTr9+mEqVoFRX8YsJ49eVubzr45KACHpKxebMko7jGJ21ydcY+3m7jxAp/2xhVwv
	3D0X8CQH/XMTI0EHnvQSLxC82cF3elSlEX9bP24cxlpH/sZNQ1atH8yDJeV5aGwmj7+VJN0lukz
	+tz6kDtHhFXZ22/VN5LEf/PBBcyDDJ3r3NlIqRAEYU3WCV/XBFyBQ7yGfklklGcOarVYaADHRLn
	PL4sAyh8JtvVlYaO3xfSsztKMBRpvEnCAFh5bB24ywxy3OZu+8UtdoP8zEQ7St++rFt44Z12Zo2
	6L7M0ErZfVh3uI1fiX6pwh+wXsh/B+coi8YafunCLBE/HFArsrVm6DwLC/BR8
X-Google-Smtp-Source: AGHT+IHKLRvPW6DLid3pBHfQFtKvVf7HCjdkHPj2uMWtDN/EuxdkhNL7F9/YQfZDcx7uSFykl6g7uw==
X-Received: by 2002:a05:6122:2192:b0:539:52d1:1f65 with SMTP id 71dfb90a1353d-539a0494e60mr960999e0c.9.1754484513108;
        Wed, 06 Aug 2025 05:48:33 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53936d1107csm4148033e0c.25.2025.08.06.05.48.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 05:48:32 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4fec0d6fd90so1514366137.3;
        Wed, 06 Aug 2025 05:48:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUazvCd2bCL8kEt8cK8MOH+eYHv89lXsr3Mw48oRviEAp/HtRF2hevHYKyf/BkxTZmcyIC0suzesNqj6hQdK92JRSg=@vger.kernel.org, AJvYcCUiSaIQyAxqPkNAnxuFC2Ml1hSFQUjfb2c7Gk+JDiFxP6nDBB44bCtpKL+eH1Nuibu/dqVznu0M3CmiZB7+@vger.kernel.org, AJvYcCVxy/c/05oj4j2e3/0N+U6fMIaBH8k+NjcL0t3HxDfQHH3mv36hmvJ84GIckMk7A8n/LdC8JRIEO9y7@vger.kernel.org
X-Received: by 2002:a05:6102:5093:b0:4fc:d0e5:23fe with SMTP id
 ada2fe7eead31-50374030b12mr989150137.15.1754484512373; Wed, 06 Aug 2025
 05:48:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709160819.306875-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250709160819.306875-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250709160819.306875-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Aug 2025 14:48:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVxDJysVTqY-0LcF7c5Gu_CY_YD=51aKbgJ5b90qEE2Zw@mail.gmail.com>
X-Gm-Features: Ac12FXwMRALr-5R8GzGFycd1gerPqHJgXQCDfJC1LmwT2qFAxf5yItZ4_qxwBuM
Message-ID: <CAMuHMdVxDJysVTqY-0LcF7c5Gu_CY_YD=51aKbgJ5b90qEE2Zw@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] pinctrl: renesas: rzg2l: Fix invalid unsigned
 return in rzg3s_oen_read()
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	John Madieu <john.madieu.xa@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Jul 2025 at 18:08, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> rzg3s_oen_read() returns a u32 value, but previously propagated a negative
> error code from rzg3s_pin_to_oen_bit(), resulting in an unintended large
> positive value due to unsigned conversion. This caused incorrect
> output-enable reporting for certain pins.
>
> Without this patch, pins P1_0-P1_4 and P7_0-P7_4 are incorrectly reported
> as "output enabled" in the pinconf-pins debugfs file. With this fix, only
> P1_0-P1_1 and P7_0-P7_1 are shown as "output enabled", which matches the
> hardware manual.
>
> Fix this by returning 0 when the OEN bit lookup fails, treating the pin
> as output-disabled by default.
>
> Fixes: a9024a323af2 ("pinctrl: renesas: rzg2l: Clean up and refactor OEN read/write functions")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.18.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

