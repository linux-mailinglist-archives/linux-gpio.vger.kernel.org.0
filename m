Return-Path: <linux-gpio+bounces-6552-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 384718CBDD6
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 11:28:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E744628280A
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 09:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52EEC811FE;
	Wed, 22 May 2024 09:28:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E88680628;
	Wed, 22 May 2024 09:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716370092; cv=none; b=ukm99g9AhoH0O2N26/51YF1R0nLOhv4MnEo9/pzpIcUU3f2mn3TMirHfz4dDlhiCbQE5e/j72j8a/qLjXa5L5A7RNHLLJ7C+bPQ/JUTDGh9GeTKkANDkdXks4IUQpIDM+fGZ13d+PdoUb3r2TqCvAzvzNPSaXSnKTDyBYpVL/b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716370092; c=relaxed/simple;
	bh=1FO/sgLl6FDv5gfjdaHH8VjZE5pw6mczMQNGvmUXG44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G8ZjOWUG37teZDzwAPnS2HpjUm8k3noQ+sLZKmTO8gTiYaaV1wC2GgkqO8YQ5eKPXCg/YqVLQLyUiunaQkv6ac7yB1wmjz1//eiV/REALgV0MfIMr3OkYYuNrQ6OCh+Jq5XfL16ukz6VK6lx/1w1XQDzWxeaDVb4By9/WqK7gLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-de607ab52f4so4677116276.2;
        Wed, 22 May 2024 02:28:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716370089; x=1716974889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HY0tgCg39/NnBEpMS6GQXLZcisZtDxsqIOp1WN1FAW0=;
        b=RG9yvR8DdBHD27DszdYZMP53pUQoUdlYV5rZ2F8fC+f/WOCA9haB0AOSdlBulNQt0/
         VMMKQecdOTuS1ZZXMPiDRNQcPqbgJruQdBO9zDcEtvIc93l3mPnCdepc+3ipuLdNI1CV
         g4alkXVhSYiBfShO5dcNwd1Iej1H+CHGFqv2bv3Vh/qbXLrM/YkWe90sqSbP2xG02oAc
         beMS/htF0TLcb9uqNdRVrEPGZZ5CcB6lq4gSsHTxkPDKcAtfadZMjLs/wWH0HAvZo4rf
         tBzHkU9IaF9nXmJs4/pJxsy1UouYUnE6cSSd4Z1nuOG1mQz96KwrscUTpeVLbgPMmTZI
         5jJg==
X-Forwarded-Encrypted: i=1; AJvYcCV0KgPltlnxJgRYycjZ9o+thJy2k0EZpeYAAZQEt3e9SDwm2Poy49K6D/zo4qJn2QmtENu/zn39fdOxC4dNgQBAcTvuTxWxZZ7FPfeqZ0msPmYaPr3SV96fQeSGnNGz+KadvFRezNTTNDHpEUoIxv0RTNbMuVNG0m8qtKEiBDlYzDcERNGoG2LJCIkm5unPmARJxPHv9OviEVZrY8J8FNjJB2qDELGY1cc/2gs=
X-Gm-Message-State: AOJu0Yx5/qLLAoiRuYQYDCt2OD9qHpU5XCKWedSfB47PnLX0vXpCMbt4
	H3GlQAlBW7BKzH0NCr6BzEfcNfU0uErGu7Oje4Tanx65Q0n5z2X1df19c45t
X-Google-Smtp-Source: AGHT+IF8nVVTZJI3hiakbOkeAIZ1KK0TQPe1mmNUE2XYnNGuSMEsveooOrMRCuJlw3caYZCj4o0z/g==
X-Received: by 2002:a25:ae56:0:b0:df4:dd95:cc87 with SMTP id 3f1490d57ef6-df4e3ddd045mr1023363276.10.1716370089026;
        Wed, 22 May 2024 02:28:09 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-debd3b90a1dsm5912372276.24.2024.05.22.02.28.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 02:28:08 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-622f5a0badcso51487407b3.2;
        Wed, 22 May 2024 02:28:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV+I4UNQmQxgwYvqXBDK6MnlZWdu4pFEL7CzQqjaVAzvN0uumrSj88GaYKX/3nRkyiXdWBN5VPzV3o+3HVCkB0CGNGfbmdwryw/dcvYFp1r2qf2WBBTLKQ/V+3Mz27ujTVnopiP7uoSfNXt6eEtm/KEHZ7J8cVgSfWk1SJSj6rK5i6IFiTcW6CpTeLhlXUie9qNBqg3R9CXJXuznpeb21ocy3KI+yMNVDNxuPo=
X-Received: by 2002:a81:490e:0:b0:61a:b54d:5925 with SMTP id
 00721157ae682-627e4865888mr14394627b3.38.1716370087335; Wed, 22 May 2024
 02:28:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240522055421.2842689-1-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240522055421.2842689-1-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 May 2024 11:27:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVN3O2O4VYmyXKAsUp=19-1=J8BU2NJ3PLaCYdgV98VyQ@mail.gmail.com>
Message-ID: <CAMuHMdVN3O2O4VYmyXKAsUp=19-1=J8BU2NJ3PLaCYdgV98VyQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: renesas: rzg2l: Use spin_{lock,unlock}_irq{save,restore}
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: linus.walleij@linaro.org, didi.debian@cknow.org, efault@gmx.de, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rt-users@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2024 at 7:54=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> On PREEMPT_RT kernels the spinlock_t maps to an rtmutex. Using
> raw_spin_lock_irqsave()/raw_spin_unlock_irqrestore() on
> &pctrl->lock.rlock breaks the PREEMPT_RT builds. To fix this use
> spin_lock_irqsave()/spin_unlock_irqrestore() on &pctrl->lock.
>
> Fixes: 02cd2d3be1c3 ("pinctrl: renesas: rzg2l: Configure the interrupt ty=
pe on resume")
> Reported-by: Diederik de Haas <didi.debian@cknow.org>
> Closes: https://lore.kernel.org/all/131999629.KQPSlr0Zke@bagend
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v2:
> - use proper commit id in "Fixes" section
> - s/use/Use in patch title

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-fixes for v6.10.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

