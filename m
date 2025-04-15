Return-Path: <linux-gpio+bounces-18897-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0A9A8AAED
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 00:10:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C85AB7A6D41
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 22:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E562749CF;
	Tue, 15 Apr 2025 22:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kHuF3zzn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED63B2522B4
	for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 22:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744755000; cv=none; b=L4Bh4TAVkXikT+dxyhtRIT7f9zZMLPW/r6MZtQDWwZCj2moOSpJi7vnLgxrAMOFCIUvVuZ0KuWAurl72lo1WMwfdA/n/j1u7C1+c7kcyrJFvuBo5ULBRvHDXNldW1zQX53sntKQor1sB2UgFOAOAYK8m7BuQzd/x2roZgYnr740=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744755000; c=relaxed/simple;
	bh=BMZDbfJYgBYYsrYfrjT1g3jBLaGULzwTXCbAyy2bq4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JUb/1nX/CQd+geL2w8CJX4zyVLJHgZ7DSyS68dkbKPQOK7B/LXHeeYUjJTYafTGFll2sCsQW41v3v56Qx190u0x1YvvehlEte+UiLMLJqjUZzZEkgq9MhPbJRgN5hTufwuRkwx5nscRAAYzRAtLBRwca0GsCDbRcOdRGQ4dLJJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kHuF3zzn; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30bfd4d4c63so55310881fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 15:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744754994; x=1745359794; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BMZDbfJYgBYYsrYfrjT1g3jBLaGULzwTXCbAyy2bq4w=;
        b=kHuF3zznt0wAgtDxx5rBMS6i9u+WxyY2mZY5WSg9Mcte2bHhpNuIOgH3osVmLNrXOx
         UFmgiZ8L39OVHPh9F9617j4luOSZ13mvIVUILSAepJ4ZilR+fQNt6BnM94/jFabz/122
         W/fW66NXrRUVs2T0J0Fg/4+w3lTFZDYAZU0Y4CivaNNIDaHOhR3YStXfw3zF2rq+6sRD
         J9NU81zWbhirXu9i9vCdJ/vU4BbJ1akUweooUxo64K5Av+p/QJmnGKScW9/R+llSnN7K
         u7+JJY3tVh21Ni8ncEnNonvSS8yLnIGmS9wJaoJymYsliHTCNjHLqm4VMX9k07l9aibq
         9Buw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744754994; x=1745359794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BMZDbfJYgBYYsrYfrjT1g3jBLaGULzwTXCbAyy2bq4w=;
        b=YKl5+ihrwapdEu51yeA7EhUfSMMWAUxX+7lVIYTjcqqe5NjuOdouTEe+2Lp1dQ1MN8
         Wj5QBsJEt6Rw7QmtWFv2IzYUzV9sT+vpVpZ9mKkFLqx/3p/vLgp59Sl2eqG6iBbw9dTe
         5eq/NM0prg/7+d9X5AITdoPRLQ5mmk2llZ3G6Rxjq8UEEBHsgzFD5F4MnLzV1RVtIP5A
         AYE85PLkOoFK7wtUvsJCg3jpoOGhrkPGmtIlUkansRoInTucGlrsL5MU34HlJtNae9gi
         fhXia6+N9jNkvBMt3HDKUZGf2DLgzyVtEw8z8WcjtOt3NmrjKgmrwDNvLWl04btMQjQP
         8uFw==
X-Forwarded-Encrypted: i=1; AJvYcCXadQo0l2Xs7PQ4hYUpFiY99aleEQU3LFWQZnloOEQ4Zz3dcsTXgVXHyaJ2BSrgyX7vNAWuj5N3gvNS@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz7RPGfBCMHNTvEaOnnsQYjI+DeylW1kBlWk5y0Ow2mXQJ4X5O
	vSgGKNOo7Qg/Uf2B8vExaf1pSj8gDAYNwqjaXNF2DKkaiGfw7vyuRN54RKue4Gg30ngYohqNVcX
	bCNHW6XQZ9TRcjKW+E2Jxa8RVzkE1buBtcq6skg==
X-Gm-Gg: ASbGncstCnBTRr+WDPparg49lea4NVYEbTxLpP3V6fZHrMyLor9TQ5q78TqqGAcVUOR
	vH+QGEAwst9Gp3A0HwSfk/nqdm41QPKC8G23cf8cAXkaWzXbVjPRBCHVSVnai6hk91myJt9zgCn
	FtxIeEb9/ZpOWCN32k1Y1EDuw0NGdEKd7B
X-Google-Smtp-Source: AGHT+IGCYPQ+b5FRodJ8wxuEHegzDnmUa6Evm4QmQdnqKruHFaVQ55qUyUsMYu12ZNgCb46mTc3ah90RckpXK0EBciM=
X-Received: by 2002:a05:651c:1989:b0:30d:629c:4333 with SMTP id
 38308e7fff4ca-3107c36cd96mr1776621fa.34.1744754993762; Tue, 15 Apr 2025
 15:09:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409080030.62254-1-wojciech.slenska@gmail.com>
In-Reply-To: <20250409080030.62254-1-wojciech.slenska@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 00:09:42 +0200
X-Gm-Features: ATxdqUHZ5uDLzgQCP5maQ9X1ZgCSKxId_N-06QIwPSuLwaXV3MxBAYqEvsqUNCU
Message-ID: <CACRpkdaY440anO7WX-em3b80RD_ZrRGcgTa8me+ys6sd=v0m1g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: pinctrl-qcm2290: Add egpio support
To: Wojciech Slenska <wojciech.slenska@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 10:00=E2=80=AFAM Wojciech Slenska
<wojciech.slenska@gmail.com> wrote:

> qcm2290 supports the egpio feature on GPIOs ranging from 98 to 126.
> This change is necessary to allow these GPIOs to be driven by TLMM.
>
> Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>

Patch applied.

Yours,
Linus Walleij

