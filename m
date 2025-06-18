Return-Path: <linux-gpio+bounces-21752-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3003ADEAFA
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 13:57:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 156CB189EB21
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 11:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A336288C38;
	Wed, 18 Jun 2025 11:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c2inLkLS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3B02F533F
	for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 11:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750247871; cv=none; b=YAa12XtXrRsUTgXy7QjCLw/N4f2tsVWI6wA1rpU/zP8TiIKZl2oTaFY/Dx6HtALjk/o+p5LK5ILbsyS49Fl5wmZIJaxUmMnr+yb8GIwSYxPrudnoeEJonsKoMhD0Rcn11FcZpa2nuU1D0IVu0csPYOyzoVkBeXHQWtvI5Z6Rhtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750247871; c=relaxed/simple;
	bh=vXnEOwfbKTy01z7cobE4+Hk1SMKWVRbeCD9p5sV/Oz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WQCsUJQ0FpZJzp5fIDgW+2bZjoPKQivfh+kftrCrs8b8V41QfOORPDTryAUp726of6wyHPoPXtBw1DfmScOLaDc2zoYIMdjBr4dH1ijmGGf3E+x5QJ8dDPW1ry9RMFtPsqEOh035CYXN21vz+QUTtk1gcUGZkMEcKAZ5UKHSW3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c2inLkLS; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-32b3c292bb4so55444331fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 04:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750247868; x=1750852668; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vXnEOwfbKTy01z7cobE4+Hk1SMKWVRbeCD9p5sV/Oz0=;
        b=c2inLkLS7uGMLLdc1vIjANQFCN+KjvLGE0lzx15n5a/kdBh6e6fgOgAs6X82G8szrE
         ERff8kCPgF9bM67uZrv+RLnANOldReYE5+mQfj7YShoMIKwvkpu462a0TiGOIuF6f8e3
         fp06/R+ytLUpdJ5qmOI46Urdi08IHS6zpFSpVwOHO/D1pjmICqT8EdbIEXRc2Jz4zoue
         yDnLfAEMLWp/I6K57JSdJzcIeQO4R1YAPNRyKcumwkhGSEukZzB3Ysa4TY4AzEz+p/3t
         pHIxftSoZb95mqOo8xfgwhl28AYTftoblB7l9+8oorIetLY9mkKuKz2HNGf0mBQLaYM+
         Pz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750247868; x=1750852668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vXnEOwfbKTy01z7cobE4+Hk1SMKWVRbeCD9p5sV/Oz0=;
        b=gVb5dFMfZ5XxcoglyQLRQIvdyTLCu71eE3C7yt7dAlzNsga3hfAXCqNaTzBPfPwjvB
         eihn6Ak0N1D+6PkSs5k+8S7fa5KPa8N7CCJFJQ7dGlpSBfO83hmdeirVvjjFTt0TBd1m
         Hl76CMQXZPVZY/M0mFvKgdnRKSMnnBQBUOUbqN9IYKQ0CjN35DdrqFRtYYTcBtSNhxTY
         WgR3nEE0Ecenv5saB6cM4+IL2Xomc5XgWt4CcmaJF1csgKxek8u82OyF/j568Oe4byq/
         deB9zlhwwB2r1+qwu71pz3mn/gewr2HdEOttHnGHtv3IecaHg92TPo90Ml/NfbllsOsM
         Exbw==
X-Forwarded-Encrypted: i=1; AJvYcCWN8x/05FXbEaTtQKMOhvIjH29cOEINSCPPesnOEz5n6e7pHWOR5++eVUuPU8C0U8X4qFq3g/RmtQCF@vger.kernel.org
X-Gm-Message-State: AOJu0YxTJkfllFYfS+cPfRA/vW285uoWqfihYCOoQSDKtDXUxYpYQMu2
	GsaSX84m5Uh74sMphWHJcitlCJb9om5jDp/POn1rXTOc8rDi41TGSzMeKvJhwYyeDacimNhmCV1
	TUBQpzCtNEFTOffLQ2uOKbZiYSJR6gQBp/YeB2CbLkw==
X-Gm-Gg: ASbGncthNw+KdpO4eU+mbPGnP4l+VNaxBo9la+SmgKHDVD84W56QgmQFbnj5ZJd9iMg
	K/EqwOIyqPr+mhlFQcy91+36QPLRWXaUVKjAk9JaOO2JAwxpiSCycvoviNyA3FMxOjL3bpyjAUE
	5709Q2HaDoHCEEpYnaGjRaBQpHaITfnsQAlDCxcTgDbjs=
X-Google-Smtp-Source: AGHT+IH7vnMyWvDeuT22AfjJ72jh8AlElSg/X6zhBdg5qjqst8eEHaOrlL3lefZJep/KKAH4d2AwxAgcyFjM7bagkmM=
X-Received: by 2002:a05:651c:b20:b0:32a:847c:a1c0 with SMTP id
 38308e7fff4ca-32b4a0c5893mr49570841fa.6.1750247868176; Wed, 18 Jun 2025
 04:57:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612091448.41546-1-brgl@bgdev.pl>
In-Reply-To: <20250612091448.41546-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 13:57:36 +0200
X-Gm-Features: AX0GCFtRDJgqMbmd8SADniLZIBDm0lbd_j7zrP-SEcNHH7wJbISn24C8wb9wJDI
Message-ID: <CACRpkdb9OkfBS49zjo38L_0zouz2SJmfJK3EaH+YZMPqXacODw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: msm: mark certain pins as invalid for interrupts
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 11:14=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> On some platforms, the UFS-reset pin has no interrupt logic in TLMM but
> is nevertheless registered as a GPIO in the kernel. This enables the
> user-space to trigger a BUG() in the pinctrl-msm driver by running, for
> example: `gpiomon -c 0 113` on RB2.
>
> The exact culprit is requesting pins whose intr_detection_width setting
> is not 1 or 2 for interrupts. This hits a BUG() in
> msm_gpio_irq_set_type(). Potentially crashing the kernel due to an
> invalid request from user-space is not optimal, so let's go through the
> pins and mark those that would fail the check as invalid for the irq chip
> as we should not even register them as available irqs.
>
> This function can be extended if we determine that there are more
> corner-cases like this.
>
> Fixes: f365be092572 ("pinctrl: Add Qualcomm TLMM driver")
> Cc: stable@vger.kernel.org
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patch applied for fixes!

Yours,
Linus Walleij

