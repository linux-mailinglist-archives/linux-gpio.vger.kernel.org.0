Return-Path: <linux-gpio+bounces-11546-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4CD9A233D
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 15:13:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AC6B284B2C
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 13:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D2A1DE3C1;
	Thu, 17 Oct 2024 13:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yw8SpAMq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23F11DE3D2
	for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2024 13:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729170741; cv=none; b=TjmL7f4tXFcyS/EA5xp27zOAu637rFJdcAIle0rFzYQERX2+tR9pl6BTsDFjh/6Z7gppd7LcVYblz/qgp6kkRc326gUO8wZFGXmoi3vfziU4GXpesRKhPh1vSXxMv7wAoFu7K4nirPzw3Ii+8GiTWX0gpj7MVsyR3UWUQ8mwI1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729170741; c=relaxed/simple;
	bh=ZeiQpCcngaL1betvyW/NNSOcBr2oq3trOx+Qs0Oth5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vBLga+LI4TvDFcDyejQUeJWIW/H/qV5IM9Xn45JWuUTOk+6RV+czSR4z4bN+FK+fwKrBU8xvM6iSghF/ggQOpsASNoyo0URQMyH2FxobdgSv9UF9Qy9795pMm6XsdPY4tPFoozyXKERb2b7sBNllMNDW6+uDu85pFaYSli7+GFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yw8SpAMq; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb5a9c7420so9402901fa.3
        for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2024 06:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729170736; x=1729775536; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZeiQpCcngaL1betvyW/NNSOcBr2oq3trOx+Qs0Oth5M=;
        b=yw8SpAMqVDDaZb2Jwp9aA3mHQfSy6mppJH/wAYDpETXDQqQmCjzvH+R87cyE+otZ2m
         ey4ndiLQsIE5Iwvr9NzcONfvc8jSb+IBFMcXtbAvOtq0QZUeMxn53c2vyRRl98qK9goA
         WV+ed5fuZ6oMdg0j3pG/ux6LpwoMTqGvcnzUmSdkwHFVN0CK4MyzPQ822KwKEayDhQaP
         eBfXRaBLFVh+pZPdD/mVq1TXB5f236ZBqQx0FrqMlICaeVdRv4cA9htKPCnaU06CfWq4
         4jFS9Irbcb5RtR0G76aWK5fG5nLuhSZOKExEZZKkQhOzCQN5HJyXkHJP3LOnMW4BKY7o
         qw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729170736; x=1729775536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZeiQpCcngaL1betvyW/NNSOcBr2oq3trOx+Qs0Oth5M=;
        b=l+yU0noS+CE8RIvmgwIlwtKm7ZT7Ff7XU+u5dVBYacHveCivHyWbn5B3etKS7NLD0t
         9chvpFLs0yLivQmqKa+4qqvVwDsNJel9lZpvS8eYA90Sg7na0QClXR4NQ/cK9BrfAQ8T
         goZqRAShKzZHDxT/fwtmDk50dKmRQj0PWd7GwBMx7zqBegCpF1WN25Z9bftfWgUiS5WQ
         B0gXPuAqaHGRbzBBSdgrw8fpNG/xQFHHYJ3bqecTo3/bthoscGwY7K1p5JsgP+LvOE2E
         ycs8aPDXFqU/WeiSr4eZYKvzZaO3DSjuRRWdMhTItr/bpM3WCAhf1U1tjAFAgBQkAlwE
         sKGw==
X-Gm-Message-State: AOJu0Yy2y39jOV7vCzLCc+BlA/zb0AGgZMIoHy32MvQFmfZi/CZyg1LE
	osNlt7p0a8tM4M3gAXpSa0eRHA80WvXKowTVohm2idpTcBvJP/PlKRSWUyFZvN7O/J+/jJM21ZO
	bAYQse7Fpr3N814NkQHtsTdxXScrH89bv34izPQ==
X-Google-Smtp-Source: AGHT+IEmoK3+zsEQP5cnCvB1cvwReFT17GUZuuzVpudQYX/VHEXnY/qyojlJX6LS47hk7TDkZq906phdXNPWUGXmUW0=
X-Received: by 2002:a2e:6101:0:b0:2fa:e4ae:3364 with SMTP id
 38308e7fff4ca-2fb3f1af9c0mr83282611fa.16.1729170735998; Thu, 17 Oct 2024
 06:12:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241017123044.75531-1-brgl@bgdev.pl>
In-Reply-To: <20241017123044.75531-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Oct 2024 15:12:05 +0200
Message-ID: <CACRpkdYJVtCwVJ8H2AxY1keVFZMvGnPjBCOvqnfhSCUx3Qb+tA@mail.gmail.com>
Subject: Re: [PATCH] gpio: ftgpio010: shrink code
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2024 at 2:30=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Use devm_clk_get_enabled() to drop the goto label from probe() and the
> entire remove() callback. Drop platform_set_drvdata() as it's no longer
> needed. Drop log noise on success.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

