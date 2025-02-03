Return-Path: <linux-gpio+bounces-15284-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1958BA25BD6
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 15:09:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02D3B3AD16B
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 14:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AAE8205E3B;
	Mon,  3 Feb 2025 14:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QLTHaeuH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9CB205E2F
	for <linux-gpio@vger.kernel.org>; Mon,  3 Feb 2025 14:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591500; cv=none; b=AG0PqHLZcyCNDJCQgPU2fCxAvvUpZAcX7+sVl0Y75iEbphlo6kBZNtW6zsiRXEcBEz4tyF3W3em/kcX+QGFJm6JjmDvs3XdHNKPBOpJeXB52oYti7s/k20J41Rf4BeIaeMXz4QUi27M0XOawRNUCRhcO+Ia4WGIPJRvSKV3m/tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591500; c=relaxed/simple;
	bh=h6CWMX42b1q0GMAh+1qfTza+9TeJXgXvTvyYsur+MFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZmyGgUjKw3GAUcJkIl9UvYma2mNf2H1JVFgHKGG9PQgNLfqjMpmffHlpl8SJkGQOXg6U1k+TT1EvIHaY8qU4DmMMOd9Pz/WdSW7n0WWoH0s6031C782I6TEfH9x02gNKOIMbZFhsz/WoqfeR8UZ3PZIN8idVUw6tOKZ6wEGZMAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QLTHaeuH; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e5b107c4346so139326276.2
        for <linux-gpio@vger.kernel.org>; Mon, 03 Feb 2025 06:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738591497; x=1739196297; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Am0X09ccYm4uqIChn1Tko10AiRMYHlGQ0TVf8PEtNTc=;
        b=QLTHaeuHCKGqetCdGn595d9nC534v60plWYdPlxFE5N/EZL7uobirEeycwW5rmZOw5
         rWmYkTmNdXTDDNhApCj2tqh279tJZ7JidLnA/8f00GVTajfyLoO/AvAwMaZQq+Ltev4a
         tBkj6PYLlXKa/GQYo71iYgLt4PGg540PRnQDHfkwqGQh3EHz1dYab6jOv8NbU/wAq4KQ
         8A/HjwgWOviFBlZUE1MhNMd45G7WtF0OL6WMOKh4fvuTdP2+wPzHjqFS/1tZPXEptRdz
         TehY8kJFN3po2yrg56AyPRANKyBMJArEk2QT5itxX1IbFR7nWFpLfeXofXot3wlRjhn2
         WmWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738591497; x=1739196297;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Am0X09ccYm4uqIChn1Tko10AiRMYHlGQ0TVf8PEtNTc=;
        b=Zx17Cwtkw4nkusMyXIo49u3rS5IFdwlOEHwCW+U8rLhhi3yPF6hXWNtSdw2KMqM6JR
         BTJ5hNrCeZZKpy7Z24kMi8tfkdxtLu+u88lmau49/j53qIv2ZMsTnxPV1fzsk3mC8Pu/
         JTYw7Xz4W6afaelz6ylnowhLZ+sNjHjQRemC8N28YA2ekP+woHmqSi8JCMtdL6NKncRj
         NJLX3aA6ufdyIrfe1ided6YExlcDdWHjJoBXea9MfxRlBt1c6VInQDiJBW1AaJHK6D7D
         xiSfqLiRGqCWgMjM5W0+x9TchDP6RYO0j5BJMs6HiUm1oCwH4fdNYU9OsTAEiAKlbmob
         QdSA==
X-Forwarded-Encrypted: i=1; AJvYcCXRLDM+YjOC6z2L2Ym3wfySOjlHyzQHHttmzdVmHFD3sIke8oL5xqVp2CHo/PhjfDHphraUYUBemfvu@vger.kernel.org
X-Gm-Message-State: AOJu0YyAI3+1irxeYrmOA7BLDVu+TDtMQAAamWxVMDXGNa2++oWsKOAa
	V+ipbbSs3UtB4X12a+Iae9Ise4UvLc+283a3IU3Zm52VHyp8f95jKbNeA1SgNbFLMi3ufhtEKZ6
	clJ7zT5BgJJHP1Xe6r6B7JTCHLkJBKl2A9jiQBA==
X-Gm-Gg: ASbGncvnSpG5z1R7n8Gp6lQF6iI+LMepQj0rUCPxzF8lnlvghD9/q6cEtK/TDziJ7wB
	x37SdXwMK8SRusbw4fcm3j9ammsmKgUN5Z91uamPmVulxIym7D1ITk8okglXJ4Rg8QFxbfgv3Bg
	==
X-Google-Smtp-Source: AGHT+IFwnbzyrxEukfl9ktPOhFtVST3/FONPbZt9n/IsJ/BCI9rREcADlK7HneW2NrgAPdGw7ypRtb7SFs72hQbzEUU=
X-Received: by 2002:a05:6902:2006:b0:e5b:111b:a8d7 with SMTP id
 3f1490d57ef6-e5b111ba9abmr284291276.41.1738591497654; Mon, 03 Feb 2025
 06:04:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129214335.125292-1-linux@treblig.org>
In-Reply-To: <20250129214335.125292-1-linux@treblig.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 3 Feb 2025 15:04:21 +0100
X-Gm-Features: AWEUYZmZikQz2CrmOrzRKi5yrRTvk_iJYC_EFEjQ29bDOeCh_i1eh4bHMrvn-Yc
Message-ID: <CAPDyKFobzCJTaHV6rXwTr-hhzKgN7fAuiUQXjG20pRmBq5wsgg@mail.gmail.com>
Subject: Re: [PATCH] mmc: slot-gpio: Remove unused mmc_gpio_set_cd_isr
To: linux@treblig.org
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, linux-mmc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Jan 2025 at 22:43, <linux@treblig.org> wrote:
>
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
> mmc_gpio_set_cd_isr() last use was removed in 2018 by
> commit 7838a8ddc80b ("mmc: omap_hsmmc: Kill off cover detection")
>
> Remove it.
>
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/core/slot-gpio.c  | 12 ------------
>  include/linux/mmc/slot-gpio.h |  1 -
>  2 files changed, 13 deletions(-)
>
> diff --git a/drivers/mmc/core/slot-gpio.c b/drivers/mmc/core/slot-gpio.c
> index 12247219e1c2..5fd455816393 100644
> --- a/drivers/mmc/core/slot-gpio.c
> +++ b/drivers/mmc/core/slot-gpio.c
> @@ -159,18 +159,6 @@ int mmc_gpio_set_cd_wake(struct mmc_host *host, bool on)
>  }
>  EXPORT_SYMBOL(mmc_gpio_set_cd_wake);
>
> -/* Register an alternate interrupt service routine for
> - * the card-detect GPIO.
> - */
> -void mmc_gpio_set_cd_isr(struct mmc_host *host, irq_handler_t isr)
> -{
> -       struct mmc_gpio *ctx = host->slot.handler_priv;
> -
> -       WARN_ON(ctx->cd_gpio_isr);
> -       ctx->cd_gpio_isr = isr;
> -}
> -EXPORT_SYMBOL(mmc_gpio_set_cd_isr);
> -
>  /**
>   * mmc_gpiod_request_cd - request a gpio descriptor for card-detection
>   * @host: mmc host
> diff --git a/include/linux/mmc/slot-gpio.h b/include/linux/mmc/slot-gpio.h
> index 274a2767ea49..1ed7b0d1e4f9 100644
> --- a/include/linux/mmc/slot-gpio.h
> +++ b/include/linux/mmc/slot-gpio.h
> @@ -22,7 +22,6 @@ int mmc_gpiod_request_cd(struct mmc_host *host, const char *con_id,
>  int mmc_gpiod_request_ro(struct mmc_host *host, const char *con_id,
>                          unsigned int idx, unsigned int debounce);
>  int mmc_gpiod_set_cd_config(struct mmc_host *host, unsigned long config);
> -void mmc_gpio_set_cd_isr(struct mmc_host *host, irq_handler_t isr);
>  int mmc_gpio_set_cd_wake(struct mmc_host *host, bool on);
>  void mmc_gpiod_request_cd_irq(struct mmc_host *host);
>  bool mmc_can_gpio_cd(struct mmc_host *host);
> --
> 2.48.1
>

