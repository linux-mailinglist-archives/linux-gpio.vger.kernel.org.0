Return-Path: <linux-gpio+bounces-27508-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0340DBFFCCD
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 10:10:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A90F1A023CF
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 08:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A07A92EAB70;
	Thu, 23 Oct 2025 08:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jLVNH/t/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6ECA14A9B
	for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 08:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761206961; cv=none; b=DiLT5Rkrz83Qff6cYCebMw+lQNkraByF1QTuYs4X4xyJqnNJ7e5T1oH1RmAECmTmB6fRhz6iLi2rzgDt74sSUJISB689993+QCzrsp+Ov5s5SggH+aILjbhFMVkeuJOeUQFL+0aztEBlqCwbPOoFQ5J4XrLHmDZ0fOJ4oaBxSyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761206961; c=relaxed/simple;
	bh=cIE2BOANhjWnyErhrHcjB1l2LG54rueKr0VnvQSaSKE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cIyi57uY5nL2Psxa92JIk3/ACOzitjrA9g14DVR8X4jbnPOe+Eqj5MYMbb2KFaLxFyGztLmMiIRTz4oplLBBJcU2YGc436D17/2HwojNj1qlzLbN2/c96HwG7NslZBGLHDmjuKQm+NOGmdgd8MwEdrqYAT53v6GXgCRZzSk+Cws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jLVNH/t/; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59093250aabso497079e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 01:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761206958; x=1761811758; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cIE2BOANhjWnyErhrHcjB1l2LG54rueKr0VnvQSaSKE=;
        b=jLVNH/t/R9H2AqlrjN3HzfoK+u7UvkEnjYg77gyNqZvxzzzIocWEX2VyALW3fT60PR
         aDCqnaz0lLEUinR2AW8XOzjRzTjXG2jB9fBXuHcEuIYGcTAs6zmTOe2QU+ncla12w/4o
         /Y3vqnBcIhgoD4BdTALMlpshNNVNfcKAz/Kge6Wx2rMOE9dMxLwovATqTZZm+AywY9Ac
         cILnR9wxyThrwBGk8OqpSx8WFVxfQIgA5GYysG8ExEYO4ka9fHT09RwmvXwXF0cXab0I
         L1jBklAmt/RfulacxFn2KSB/vITGc1x1EhgInsL8Fbwp2WGbcNlCHUUoWercB4JYslH3
         zoIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761206958; x=1761811758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cIE2BOANhjWnyErhrHcjB1l2LG54rueKr0VnvQSaSKE=;
        b=RuHS3JUgIoIZkOVwvLPlU51KZD5ZKI/VM321mWAurEfBcaAAhR8Y6s+cvR+m33/hSB
         fqX3r7gf4f5fXhNjtrFNBdYCGOdV1Hjuvi9pOl2bOo8IuVW1ahh2ni7y1nD/fVhtL8Du
         3am9pjhSz7ymelYw2N1tU66NXdFypDdAdpmCD68dmDPWmmR9KTAwqBJLzQmijsT5dZnM
         O21geGB8sOzYfviSPi3OAbdaK9WhhXGIe9kRmTEqf1xY0LHrfVHeA1roqT68/e1xWKGl
         HLZ8n7Lrt3A6Vn8EauDaDEmAmu1h1HQ4+Ajt7sv/IoSoOgJxN0426i6fFSs0dWRlVa17
         fbAw==
X-Forwarded-Encrypted: i=1; AJvYcCViB6/2BtbAOvaEUcANdkZu3AIl6qrSt+3QAqLrH5OsG7LbyTtLYIQ3bT1EjOJssrfkGmoAogqAQk6w@vger.kernel.org
X-Gm-Message-State: AOJu0YzxFekZvdXbZKClzj+h1EvDj7YHSMaEn6cYfiulgI75x3F3SiNO
	UAHBq9ukyqCF8F0XKAPJCBdfTn8xc+2pmZXrmJrT1DKgSevCEzANPU1iPymFJiigN297i0NYXBX
	avIj/B272bezEI2s3xxbcEF0TSFSa+VdZCCflqL5wwQ==
X-Gm-Gg: ASbGncv43nLFpg7K7ulj0l9e2MXrTWnQOxgFBJYFWLqpQB9LAGNrDFmeK5VOT4Rpsec
	SzLgdsb5x8J8z+Rn6MMdSSNfovEZWFAY64f5zWNaUjpwA5NYEhxaE7VbYMXAVkN9oZ6GDy6FtQa
	nGwVc5+UixOv335hALooB19tHADmzNpBsKKU5R7LYbwCG4EmxuElv6+VuXs7M4CSPbRQ7W6nCXV
	X/C3Bdoekkoh/bZu9y3MFRiagSUM3jDmT/1nwwG5Oeg0b+DGZxwt3OmUAA9gZvdbXKZZORXEGTM
	mt4s/wcJEPLiIn0=
X-Google-Smtp-Source: AGHT+IHpAQcjZODUzaEioAlfVYH5oA4wVJnUW+xVtFHsGPd3DzxXsAdk8vcOeE04cb8h1uH4ffB/8m/kLJJgPqsE+8g=
X-Received: by 2002:a05:6512:230b:b0:592:f5f9:f59f with SMTP id
 2adb3069b0e04-592f5f9f6dfmr471491e87.31.1761206957859; Thu, 23 Oct 2025
 01:09:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023070231.1305-1-vulab@iscas.ac.cn>
In-Reply-To: <20251023070231.1305-1-vulab@iscas.ac.cn>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 23 Oct 2025 10:09:05 +0200
X-Gm-Features: AS18NWC5lCwUKbY2uEDzUsLAwFUB4d72Xri_gTz0_fKwL5iefNSV0C8DrUMFteE
Message-ID: <CAMRc=MekWJPnhwLn9z4=yqC4Pjyf2xd7teKCLTUEmnBCDLeROA@mail.gmail.com>
Subject: Re: [PATCH] gpio: ljca: Fix duplicated IRQ mapping
To: Haotian Zhang <vulab@iscas.ac.cn>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Lixu Zhang <lixu.zhang@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 9:02=E2=80=AFAM Haotian Zhang <vulab@iscas.ac.cn> w=
rote:
>
> The generic_handle_domain_irq() function resolves the hardware IRQ
> internally. The driver performed a duplicative mapping by calling
> irq_find_mapping() first, which could lead to an RCU stall.
>
> Delete the redundant irq_find_mapping() call and pass the hardware IRQ
> directly to generic_handle_domain_irq().
>
> Fixes: c5a4b6fd31e8 ("gpio: Add support for Intel LJCA USB GPIO driver")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---

Andy: this looks correct to me and you already sent your PR with
fixes, should I take it directly into my fixes tree for v6.18-rc3?

Bart

