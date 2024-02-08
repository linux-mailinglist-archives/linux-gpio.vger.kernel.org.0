Return-Path: <linux-gpio+bounces-3110-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C47AC84E09A
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Feb 2024 13:21:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03AA31C260BB
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Feb 2024 12:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74DDB7603A;
	Thu,  8 Feb 2024 12:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nmr8nhgL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A907604C
	for <linux-gpio@vger.kernel.org>; Thu,  8 Feb 2024 12:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707394890; cv=none; b=RC4owGUcBBt1lr3B0nT2blyZje1soKRb/2CbCmbWu1mZwal2IOKcqCWRuGOcG/0PMw21st4hxGM9nGxxU5+oddCaZUl+Y8H/g79H6uBJVp9VvxcxRwo5xFh/3yAE5E5MQPttzK3GQEjZbjUoYBVWFB4E0Kw4RvDdLVEXEy6BNf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707394890; c=relaxed/simple;
	bh=c7XAvXW3JqDQu3a1gMUnXDEqNL5QzKj2+D77O+/2mAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZptWK3si7HnrWYpe8m1ZEYhs8APz2vZcnZsOLMsmo8wrg3EcDkwURZ1em82jzEpV21QsocWZz7VR2wDAwlQnhGih68HgDtMQPJYwLvXodqnTI/dwMAOMR0KJjCvPQWVfSwXOGwZQSxXDanBliuv7R0DkACRTK38h2psjIMtAzj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nmr8nhgL; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-604b23fc6a7so806757b3.0
        for <linux-gpio@vger.kernel.org>; Thu, 08 Feb 2024 04:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707394887; x=1707999687; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7XAvXW3JqDQu3a1gMUnXDEqNL5QzKj2+D77O+/2mAI=;
        b=nmr8nhgLZPJ++N2Jp7Q0EweSK3WAkfvn7DK8N5vw5hOeM/cAIIuS8/C5xfpTrOZkPX
         5pxp3Swlj4UBdLR9M8AEkePwJhNQcKsx7sv0sG+OBEGep5QNu5BJGOhs8QXCXwtS/6qX
         pSYfN3nD14pZZZX8x8IR6WkfKl0FG6THUQmaYeqB1InNUqIO2KnXMimEt+DU+r98iF8i
         k+kRCewlC87n6N/5iTkAfnwlXxfDhe8rhipFvm+joU9cYWhMR9J88KhJKCv2RfTVAlTy
         1NbvsW7p5Wvq//ASOwdC1haSjfkM3HOj7S3XB4N1haDkq4vL4n/7E/1hviTs2HKQ+AI0
         uO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707394887; x=1707999687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c7XAvXW3JqDQu3a1gMUnXDEqNL5QzKj2+D77O+/2mAI=;
        b=ECQhecXFcrazUQAHSsX9/v5kzGjJK+e1opY13DHqEE6YoVPA5jOGzLoxsBq3fje1Ld
         rwLEKKIlTS/ZRF9JYo0Wromhx4yUCvod+e5SvC8wvHF5XQZ5DbiQLA5V45JBkLgTywGh
         f4MKwOCUqO9KvKuSRUxGgxr5YEp82tty6vIW0kZRt8BC41c++xKJEpBLHKuE7boGHDmg
         bIxowY23I5HjKl3EY6E2tIGZ0Y4TnbgCBrvkT8+HE+gLIk42ZZumyLCCWoniu86zSCPa
         FICjAI0Hhf24XlBZGWLq+BmeKe+ZMQDPpCfgvV2QQJ3HHLbPUzuL8vQyIRMuUOqeHgS6
         wNyA==
X-Gm-Message-State: AOJu0YzPc0ZW3aaKmAdsDr1cNzm1xGOpCiql5+NMKTR/7VoeUnLNeV0A
	hNZLBvLguJsCumWjmCo9RBxnKyUDdWpOL+JkiONJR67t4OovH73zyyeOdll3U8XmgYU3RW8OWHj
	C3RRtb2vf6qLXkLE/+vYoijtIguj7fgkC2jCmlg==
X-Google-Smtp-Source: AGHT+IH+rdYwt1V9v42o57rZ+obkKonh/gd6tgsKYiHOCD7690dxOjHGrL+EaoIIsJbBelNWioDPFHCf8ZENSVttMvw=
X-Received: by 2002:a81:e443:0:b0:5ff:9676:3658 with SMTP id
 t3-20020a81e443000000b005ff96763658mr7587421ywl.48.1707394887647; Thu, 08 Feb
 2024 04:21:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240208095920.8035-1-brgl@bgdev.pl> <20240208095920.8035-18-brgl@bgdev.pl>
In-Reply-To: <20240208095920.8035-18-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 Feb 2024 13:21:16 +0100
Message-ID: <CACRpkdZOzekCQ44Mx8ruQsx70Z6ZZtAOxxr6hy0PSQGqB2T=0w@mail.gmail.com>
Subject: Re: [PATCH v3 17/24] gpio: don't dereference gdev->chip in gpiochip_setup_dev()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kent Gibson <warthog618@gmail.com>, Alex Elder <elder@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Wolfram Sang <wsa@the-dreams.de>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 8, 2024 at 10:59=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We don't need to dereference gdev->chip in gpiochip_setup_dev() as at
> the time it's called, the label in the associated struct gpio_device is
> already set.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

