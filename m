Return-Path: <linux-gpio+bounces-19512-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7076AAA5395
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Apr 2025 20:19:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A58A97ABBF1
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Apr 2025 18:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BD74267AFD;
	Wed, 30 Apr 2025 18:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lghmvSC0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320D32638A1;
	Wed, 30 Apr 2025 18:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746037056; cv=none; b=XCMe0u7pgp/GIvjUzJxx5dTc5AobO8ccG0+FNPOYxWMCm2+O7TpuOwL44a/nxkWa6AVQAp7mmJsEtfggoEU1su3Cx08e0CwOFUlibq05b2nbMaU+WVTxEYzHAirxiN9qfNSongk0SDkvkwRbEUhyd6uQmfQLvwVUztFo/QsrKbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746037056; c=relaxed/simple;
	bh=U/9r/RlDUE17osi9EipJ0WzJSOJjlZesxIFPje0LHOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jg0c1nHjtfejQheR9wNFMl8UiVQFiLId3hQ9l4r6cppDJccnxrBAvSWQL0jAtRfrMmYyaf8SjI/m2C9+VCtCzkO++yKU+CiP1Cvq74Dn6vseiF9SqLMo54mttSxJLT02x193r/zt+NWKunwYHchn2dWTY52xU9I2+9MvFha0bBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lghmvSC0; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ace333d5f7bso17662366b.3;
        Wed, 30 Apr 2025 11:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746037053; x=1746641853; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/9r/RlDUE17osi9EipJ0WzJSOJjlZesxIFPje0LHOA=;
        b=lghmvSC0wUSxPy12iHEMnkEiJ7LG8p38e2Idel0omhQNPmyFcIGPx21FlDjspImmth
         N6+VqlCCFe5UF3hBABaWjmTzLjytuTm5GxFPBM0jBNAG9+PsuXDlnEJxiibC9DnhufiY
         oAweiygZKlMGIo0TFVhwhan3sbh3NfAmvgcbhRuE2+Tq97ywQy7ysnRHLOtaXOKgJ8ZU
         c2tX9BDewZlEKw5ifD5f0Mhi6N7xswONmLYiAgawHvxDXyAonL9pDcDSgzuYXBaIj+VL
         Y+IJxeUUzfpepHxcsYBo/N3zkPwwpEjEdTw0wMs19xeTXxsGxengUhKE6bQFX8ux4Lot
         HvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746037053; x=1746641853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/9r/RlDUE17osi9EipJ0WzJSOJjlZesxIFPje0LHOA=;
        b=gGguWk2VaICOpinilewaGl6kYPN8U0zmB5II6TiINf3+Wwy+tTl9Mog9DsgKYx+CWA
         FNz/YWgQnRbMG2ojd0FAdrEedwiGKIMHlk4U0T5oUNyGKKdqcSz2ZiCNU+1m2aAyCkzZ
         SVzQxxaiM//Xy+/WMdLKNCJIT3QoOaIQO6EeLAhmsxZTJfOdMG2lD2Ai2mnU45HenYST
         RL9KOwIvRB30Ct0GY9d5Z/l+E05vQ8wLpqJU8cnacl7VpYW5Ysw5ce+tf+S5nNem/ND9
         GJdS6LeCn2OfKWm8Hlo0OZq8IUZISuKGUx7sp8wmn1rxgPoyUWEjdHUENrJsjijKtpFv
         NVew==
X-Forwarded-Encrypted: i=1; AJvYcCV1axPaOg21YwxFo3nyfXeQgnEtavGjlOlHznOoOJcIBAGRyGERaTaRoZiWM7yjIbWaO5gtUK0nd6vYgygC@vger.kernel.org, AJvYcCVkQ2BVGjMNDK7LtZCkpoU67VDTL+fjwtQepjNz5zVVNg8CXmoCLzfrr3JDZ/E3q3B3JmKFO2mNnZIh@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx4SBlBuSweFDm4cqWuR0e0fi8yvaGXJKgD2XY2WIJITxeLAcq
	iRgJ/KPCeridmWtQjk4xbfhTKz9M8LZnwpNI78X2VORvCUZZe/HzPZJgzth0/e9UXhs0GX/WeUx
	wGZblJsXrsTQOy4vukYI9JN5NcPZoOVKRyCA=
X-Gm-Gg: ASbGnctUooKdOSu4sAU5qSfVjEjfzRzeXfUO6NoMC06SrJmpVSedn1Z5KUFAtBzFrIr
	sJuRbveKNmioYkNdgGwcRLnq77jLCYXK+oD4jzTfv48CwPrYWo6Ns/3lY+WJiDWyI5Rp8iFVK6R
	6DA09puKdNw1F1SqBoMelEUw==
X-Google-Smtp-Source: AGHT+IHo7vrjzoHJavBMnKjeuMAIEZNioUuX2F9fOYFlukm++RPIL7DlnzSNXWqD9CisW72t0j+V7ncSPEXQrlmkbuQ=
X-Received: by 2002:a17:907:96a2:b0:ac7:e366:1eab with SMTP id
 a640c23a62f3a-acef45a8f8fmr34709266b.48.1746037053266; Wed, 30 Apr 2025
 11:17:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430153239.7137-1-ariel@simulevski.at> <CAHp75VdzqoxKwVhSqHVcnjCyBT1+y+020iTADc0isX-kqDJY8w@mail.gmail.com>
In-Reply-To: <CAHp75VdzqoxKwVhSqHVcnjCyBT1+y+020iTADc0isX-kqDJY8w@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 30 Apr 2025 21:16:57 +0300
X-Gm-Features: ATxdqUFMwmB3y28A-hm95F8boEEb_jY5iJhskLEEBjLgwXpZVanJzJZ34Jvxles
Message-ID: <CAHp75Vcc0jX_AXh25sicRJCF1o7au8oOeCkN4GoTUTHyXYQv5g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: tigerlake: Document supported platforms in
 Kconfig help
To: Ariel Simulevski <ariel@simulevski.at>
Cc: andy@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Guido Trentalancia <guido2022@trentalancia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 9:14=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Apr 30, 2025 at 6:32=E2=80=AFPM Ariel Simulevski <ariel@simulevsk=
i.at> wrote:
>
> Technically this is a v2 of the previous patch, but it has been
> changed a lot, so for _this_ time it's okay to have it still v1. Also
> note when v2 or any new version of patch is required the changelog
> must be provided (after the cutter '---' line below).

On top of that, you forgot to include (all) maintainers of the
respective code. I recommend using my "smart" script [1] for sending
patches to the Linux kernel subsystems.

...

> With that, waiting for v2.


[1]: https://github.com/andy-shev/home-bin-tools/blob/master/ge2maintainer.=
sh

--=20
With Best Regards,
Andy Shevchenko

