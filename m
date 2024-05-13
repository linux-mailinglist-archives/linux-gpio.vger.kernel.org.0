Return-Path: <linux-gpio+bounces-6344-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D238C4867
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2024 22:47:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C33BF1F22468
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2024 20:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14B8F80BF3;
	Mon, 13 May 2024 20:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G7txJ1tW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BC33A1A2
	for <linux-gpio@vger.kernel.org>; Mon, 13 May 2024 20:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715633264; cv=none; b=HblkpGXSaAOXgodJ0Rp3G/G2RQ50aDYXShE5ozeKwisMLU0+F8CX16hMhE/mTyJtcecsupoxdrb/CNTVS2ERq6bNvYsPV51o1qG+e/WanTkA76xnSVTt2LjjhWqSOWzokCdYMLK6amr3mwDkJS5qOVdLOoY94Cr34ibeOuJJ45Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715633264; c=relaxed/simple;
	bh=GZm3fkcMwLz/ZnV8chMXzznqP9rPpkmjWataUnyNo8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fsiDgd8nKWaAKvys55LWmuuPxDps/PR0CFYEqUVZD4g4f4DBrC+ivSC2ugtiHs230aVmdi/FN4O3gLuvpstbZsXBsKt+0AP0GSzZpkECq3iMSLZLN5eZ4YPNOYUnOp7gkTfrZvjtpLjaM66xdEU6RdkRtZhi2iTYnnvhXWcZ5g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G7txJ1tW; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-61be613d903so54820567b3.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 May 2024 13:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715633262; x=1716238062; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZm3fkcMwLz/ZnV8chMXzznqP9rPpkmjWataUnyNo8k=;
        b=G7txJ1tWK82lbl81YLst5ln/oc7FFwLBuw+T5cyzFzcaVeH/HkTTyuhAzIQZA/Q6Bn
         CyVAQdSVSjwIbdRDWFFUTrOO2zJLh86gsaWTWKGkSsriNKm+/Yf+emYNz6slvRhy3d9U
         b1Q7Fz7zNuKDZe2Z060X/pIWpgsr8iHrLtthH0o9PtQDUKULyMLD1INqOP9VXSDhJNX0
         qNTyEk4/ILzWgF4ZW8CuO4DkqkoBjJSofOMul5FFLzhiq6q7M4lFlCQAUpyKo27Y1Wnn
         uxybMr37gypglsrh3H6qQwzG3xGTWDMFsK/zWPRPP0nSGQjYi+46xwzyOMiZM+byZzd4
         FemA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715633262; x=1716238062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GZm3fkcMwLz/ZnV8chMXzznqP9rPpkmjWataUnyNo8k=;
        b=o44JWkM9AHOvSOeFud4DH/vGreC7d9kWr/r1MSMGZ3RkvpjJOixDf0GFYOBm2ljv5J
         heIH7mLlVqaX3fTqBIflCJ2CwbsmMFZXpRXiR1Q3nAQr5+PrMN/buVezF1XN3A6ORo8/
         rC+tPVeo7VYq3Ir1TNyDKJX9RXt0366v0Flgg3DL0MDnvwoi4SSmT6L0wXkUlBI6wF1S
         DoWv0CG9UeujmM3HtlHqTt4ZyK3PR+qmJv12IgmDvGoDPBO6S0lrBPTScHLDT430LJGj
         iHE/uCp1wrH0i/SJkaFS7+7pM4Nkv0Kv+F8WcVhY7HGFVk2DrRB2OtLHGErjllusXfjw
         Yfgg==
X-Forwarded-Encrypted: i=1; AJvYcCXC7DQDrKH0YZMc13v1azWYgVJHLxJJZhRiBWPeTSesHTww2NThaoJFu02Go+kOOhgS2M6VLu8SZ7dVWK0MH1rQAHTdaJgBKRe1eQ==
X-Gm-Message-State: AOJu0YxikGm/hpODxRybO5zRr9PWC0KmjcOEoFEQrFf+DG9wK9wU2QZ5
	9smkTherWl/3t6aKg9CSegWoCwuZeYZlJqq6hVtR5NA6r8pG3b/uvwgeY1L2Oqb8DA5QJ/W5b/3
	rgpD+i2Iu5BEfvUWIy3nRVp2/BW5WfLLw8GxvOA==
X-Google-Smtp-Source: AGHT+IHiJK4UXMbjpkNNhNJofaQ8/QLH8T7GL3z9FkLVTsr59KRPwSUrWDBHmTJkSuIIAQLr58jw0z0C6ZaJpE71X0I=
X-Received: by 2002:a05:690c:386:b0:618:8900:8105 with SMTP id
 00721157ae682-622afd20f8emr131053067b3.0.1715633260299; Mon, 13 May 2024
 13:47:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240510160534.2424281-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240510160534.2424281-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 May 2024 22:47:29 +0200
Message-ID: <CACRpkdb4g0UP5E_3sNPeOSJfVqSq5n_0NgmM=idKiz3G5j0yaQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Show more info for interrupt only lines
 in debugfs
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2024 at 6:05=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Show more info for interrupt only lines in debugfs. It's useful
> to monitor the lines that have been never requested as GPIOs,
> but IRQs.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Excellent patch.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

