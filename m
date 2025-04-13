Return-Path: <linux-gpio+bounces-18752-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CF5A870ED
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Apr 2025 09:44:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C900A189CD32
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Apr 2025 07:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CACF1662E7;
	Sun, 13 Apr 2025 07:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M8EcKChW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BA363CB
	for <linux-gpio@vger.kernel.org>; Sun, 13 Apr 2025 07:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744530287; cv=none; b=NbLoOqQV7LJECaTOITpbKGWr8Of0mu8EG87pD8cXP95rMOVG3XrUeDC1jBHxmkGE2xiIrkcg0a5GDiCnkXxsK3QpBGCeBVZrpKMI7Js5veB3BFPrOHHe9jaX1sRLBMbgYyml/AeZqNSbR5M2HRr7sTfKxE/u6QHFqPxoTl4H6aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744530287; c=relaxed/simple;
	bh=6PgAG3a6aJYKMvrW8AKuzg5k+f0sv19sOJ6k+7WMtVc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dc23JLVta+t0hysDQmuPqcFf/B7GiLtRlNEf8LlSejovNT/2bmr/vj0NVNWgUJT9LwHRFqyI7eCvwtQbwlnl2OAKSx7Y3RND7qSIuQHwHjhw+2QDLzVH8HOhCOPTRsxrq8W2teMZdh0j1LNxHOt/PWXFDclhNuBCPtItkfIU9VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M8EcKChW; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6fead317874so28405837b3.0
        for <linux-gpio@vger.kernel.org>; Sun, 13 Apr 2025 00:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744530285; x=1745135085; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6PgAG3a6aJYKMvrW8AKuzg5k+f0sv19sOJ6k+7WMtVc=;
        b=M8EcKChWNTJprjY3ewDJrDZFXbpWFF5H0gGQYWPpKUL243thnJiTgcjOy/npJgt5QB
         r1SgiXmKGoL/R1YWYNYJSNUIQz+4QmWTgkxPlmVv5yjA05yFoylekV/pGAl7Gq/eKs/6
         aZTDILQejxHoymQDcHhA3IayrD9KH+kVu7G8GV3opMW3gkM3D0v/xYN5jGAPJd/cnEXl
         hLr0FNcvX4ACRwLPjh5b7HnXb4TO2se/iiZ29kGw9K3HxZHC6rN5EZ1SVUBnI9B3lXFE
         S99ElkDhY9yX5vZg32vpCMScUhnUJ8m/dVNzfPDuRAGATZxi7pedUycWVrQzjy+xjGeZ
         Yb6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744530285; x=1745135085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6PgAG3a6aJYKMvrW8AKuzg5k+f0sv19sOJ6k+7WMtVc=;
        b=iM2JwtC2JNF+dPtfc/9F5Ue+lineHgmhwmVrwr1UwRwe5ldfVjSdilvgKO5Nm3ZJbJ
         MHjA3HFfIBbW9oXQlP+4i82KkCzmWc9j84+lfAPJaYrF6vJrw6InJAyv05UwSfe8peR9
         xl6dC0azuSefQ5eyncVNvIyiGHneajq5aQ2S+catBz/zvFQV8xXxIvIUspcMfBXLTnGr
         FqBpiRswNg1Ea+SzLKSuifWzQba5De6G4SWNrEu/BekLZr9jo8HmRpsEdQYeAQk3zF5l
         KwDRHhYdiCZjcop+4mR+YZN05XwwIH+5i3RWtFjMuMszrCD0LwXOT8Jr9jM82jqEye7H
         ssJw==
X-Forwarded-Encrypted: i=1; AJvYcCVgYaNgGh8k55Xjqj/+xHhHIvRZoxBwMMbsoc4qFqOndOk0BZKvThO5mf7P6ZPn/4dQPcDNc3I1R/k2@vger.kernel.org
X-Gm-Message-State: AOJu0YzrXwwnTgIZA1BRm4B4Scu6ejibmlgNcj2PqPLhVNSVIxwQeCX9
	311S6HuxZNHOo4Qkckjc7h3oFdbyfTonL0urCCZMRkh0gms7xVDv7EEvCT83TWLJszhHAMlDJO1
	EGYLJQU7yxOSypykXzlOuqjf+uj/tfi5mgxp+A6OVQM48bUkd
X-Gm-Gg: ASbGncssWBUA3gvgGU2JsiFtpF84aeBuuFKWw+fDqb0shmbkLxujTekSwDby63SnnvQ
	fUCcQ0NLObpqKcAcQjEomSeJtj9tZXnYdcVq0VdiYrmCuadCrb2popQx09Fgb4sOjpoyngcxrzz
	5dOP56hJXaPrn5yoIPpDmq6Z8KWk3+xahs
X-Google-Smtp-Source: AGHT+IGnz9t1bpI6ER7ZFzI5vSm/FhKtXl++YREat3fVWg6oOd6RaVuGuUfbNcQOUCtjxGSO5ORRRfip1HP9h8qn3R4=
X-Received: by 2002:a05:690c:4d06:b0:6f9:ac35:4483 with SMTP id
 00721157ae682-70559a76bc0mr139648767b3.25.1744530284725; Sun, 13 Apr 2025
 00:44:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412193153.49138-1-chenyuan0y@gmail.com>
In-Reply-To: <20250412193153.49138-1-chenyuan0y@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 13 Apr 2025 09:44:27 +0200
X-Gm-Features: ATxdqUFpVa63-e840A-rdLE61fA7hjoSmDEuD2aPKLnud3g4T1J-jN0eIIKeXSg
Message-ID: <CACRpkdaai3M0LXx6RO6-E5QFnXtH7s90Qi+HsudSW6W6tk9vUA@mail.gmail.com>
Subject: Re: [PATCH] gpio: nomadik: Add check for clk_enable()
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: brgl@bgdev.pl, theo.lebrun@bootlin.com, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 12, 2025 at 9:31=E2=80=AFPM Chenyuan Yang <chenyuan0y@gmail.com=
> wrote:

> Add check for the return value of clk_enable() to catch
> the potential error.
>
> This is similar to the commit 8332e6670997
> ("spi: zynq-qspi: Add check for clk_enable()").
>
> Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> Fixes: 966942ae4936 ("gpio: nomadik: extract GPIO platform driver from dr=
ivers/pinctrl/nomadik/")

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

