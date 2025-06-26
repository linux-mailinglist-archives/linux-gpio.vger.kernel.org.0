Return-Path: <linux-gpio+bounces-22261-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFF4AE9E27
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jun 2025 15:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA7891C28250
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jun 2025 13:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1340B2E5432;
	Thu, 26 Jun 2025 13:05:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311822E5422;
	Thu, 26 Jun 2025 13:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750943103; cv=none; b=p9IC4HuxIhh0lik9Po5EzrYrkFkQNpmiWKoKdCKwobqrECw1DAXMdMJatFaBClroqB1sY1ux8QtvIPhFxJfdFvAosdkUThUMUd0IW9aO4zziSLEqgFtqmIWeEN7pQK+cYBmXz1zff6ydzejtPEP5V2O4h0ZDGaqlGRhbUqbcpqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750943103; c=relaxed/simple;
	bh=Zg6n9+fDJweT6Uz/V3QgsqAq8lS5PEBp9NwmbTssgA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qBTj8XhmcZSRJdyyHVg+G72y+v2I9BRnOmnx3yI1IBBvCGNLx0GG/SPBGF5q+GrnCiiXcFykwicgpgKklHGKoOijRLj6/kwswaSeuwjjCxDMSxCHf29X3CTxZXx85Uahs0y5gNn2ifBD0aQM8+Sa7SkOgugSWycRvy3VNfEkCp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6118c1775dbso274136eaf.1;
        Thu, 26 Jun 2025 06:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750943100; x=1751547900;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nwelGdzzBqrFi3lwFmRNoT/LP3o0akWT3IDqwLELD1k=;
        b=KhMPZmh0CBdCYzwP+fxeGqEMRgjFZOz2Jk2mwYlc9V46pFwqmH2TwxGq+PohPvWbpf
         6iNQJtOPeHPmzrQf/czp231PP4qdgQ47H+UsM/UX90CMTA2NEHYAir+SwlaL+nK6eHSa
         OqXg3bh0SH6efkMVhWDaLFarJNETqVzYjK0RnaIi9HPJVr0P+L2bwRX9CeZMPdZOBVrI
         pBJFB6kOoSJW/UCwO6PvuLj6AHSdqmSQwCkQBieSWHVZp2k8u29Z7FDufdWmZZaUEe7v
         ccPr8yHcnIo8+g3OO0sj9jA3xLHqaGe4+dEhzI8BVn8X83JTKQdi/txg3IKVsr4NbX1c
         Q0Rw==
X-Forwarded-Encrypted: i=1; AJvYcCW7a5YuHKVreQ0TXFtZ5d/8UEwpCU0ptlIcx9zcP+D6R2ssqZNSKjYXL3aWSIrgoDw5nIg5LHwEidKS@vger.kernel.org, AJvYcCWc7ggN7H/Ros6uEGCIpPkC3x0wwggxKeDvKY6xCbQmV0HFxK1GYTaeCWloOt+V6QCwvFhG9yGSU6q29vfaujXIpj0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPZxyNLsRCUJHEQB7YAUce1XT+FMADV+zJNCxocvb3Inj4pzvH
	DRo7ViLdF/37+M2fUnkCaZ7xglZfXo5FcRia/Xr46ApNW+81dGoMfjsCsgq7BhJE
X-Gm-Gg: ASbGncuCAON2EDqUNSyVX1VxpMaId9quL3ZHcCV0zdz+mZ4fEq1bBR0XmeHkyawEGm2
	GB6uG8xxbEK2g0VDWjEOPc46YHIs8zmK4bjM8PyQSZSdx1cv38jiQOiSaJXV2IG4b+8MLcv2ZMF
	i4Tv6HoW6iGv6KbqFvOaLMM5Xtwy5GFqq2SIsAei5c5/OLGihMutqGKRWsuFCiVF68lumo225bx
	cOMbPnqii2iFuOYvH02APWRjJpyvBaKxwYEGIW5GKLyOqdgvjc4PUuVBpL7UZyyRS67+sfQM9lW
	IRLbs0hb5+J4dxsGsELEGc1XNd6m6MZly9o7JXmHBBdPIAUmXs8t9mLGZC7ToEe/if5nO7qVVwg
	rs46MMWwRCTiKCK2cKldJ5b/coCRP
X-Google-Smtp-Source: AGHT+IGGUO/djx5ci9ymgTZlwzvkYRMPKBgz09qc5Iy1jat69qtGf5YQi1gSousJ9ZekxAG5iR6mWw==
X-Received: by 2002:a05:6871:5829:b0:2ea:7101:7dc0 with SMTP id 586e51a60fabf-2efb23f9f8dmr4744469fac.32.1750943100441;
        Thu, 26 Jun 2025 06:05:00 -0700 (PDT)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com. [209.85.167.182])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a90cc31d4sm2592240a34.65.2025.06.26.06.04.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 06:04:59 -0700 (PDT)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-407a6c6a6d4so301789b6e.1;
        Thu, 26 Jun 2025 06:04:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU+cZVu0xG+IY6fOimEZvHAqoU3GBxYsuGOEUnANQRRhm3E8tx85E5fIqwYsdr2+GYHZyS2oAN0Z+XL@vger.kernel.org, AJvYcCX17/CNtEhsIV5D2QY7ftk2vzWKjBP07MSgPG7N3dVlogHO1biwDBX6ceMh5Da3wtxywEbLos9fqdvgCygRBEvn0X0=@vger.kernel.org
X-Received: by 2002:a05:6808:f14:b0:3f6:a9ea:eab3 with SMTP id
 5614622812f47-40b0572bdddmr5486277b6e.5.1750943099433; Thu, 26 Jun 2025
 06:04:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87ecv9ragd.wl-kuninori.morimoto.gx@renesas.com> <875xgk4j9l.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <875xgk4j9l.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Jun 2025 15:04:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWst5fhcUgWbTqzG_DQmuL8tWtUuCpg4BoeqhnCfo_MVw@mail.gmail.com>
X-Gm-Features: Ac12FXxAH1k0xY_ndZNBs6UhvgeFvXcCG7-OjQDOK2TAr9u1UpT2qx3HmqzT9j4
Message-ID: <CAMuHMdWst5fhcUgWbTqzG_DQmuL8tWtUuCpg4BoeqhnCfo_MVw@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: renesas: tidyup Kconfig
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Morimoto-san,

On Wed, 25 Jun 2025 at 05:01, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > Current Renesas pincontrol Kconfig is randomly sorted.
> > And, the menu prompt is also ramdom.
> > This patches tidyup these.
>
> Ah... this is menu alphabetical order, instead of SYMBOL...

Courtesy of your commit d89a08f52b0dd30d ("pinctrl: sh-pfc: Tidy up
driver description title") in v5.10...

> OK, please drop this patches.

Actually I prefer the sorting by Kconfig symbol/part number, and
somewhat regret applying the aforementioned commit.  So if you agree,
I am happy to take this series!

Then we're just left with fixing drivers/pmdomain/renesas/Kconfig
and drivers/soc/renesas/Kconfig ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

