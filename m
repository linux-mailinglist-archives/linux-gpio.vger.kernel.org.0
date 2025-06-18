Return-Path: <linux-gpio+bounces-21760-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17935ADEC5E
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 14:32:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 686CC3B2BBC
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 12:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC0922DFF33;
	Wed, 18 Jun 2025 12:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="udknWNOl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758DA2DFF12
	for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 12:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750249618; cv=none; b=JHUGw0mUo9DONGEkifEUQaIDozolDkYCRoE4CmcFS/epVf/+oHHmAVp4pQqiUMUhJO6TXZjjEwX1ff8qnD1JSiybyzsdZG42DFpH8ZlfWkAXI9YAtbbLpRsuTsbzQvl9IvNnKhaw7YeKPnHmHk1ZNUj0EdKmYHUQae/P7/gIk90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750249618; c=relaxed/simple;
	bh=MeMY6ZvITBPQwHI52jDYCf35TLcxWMfuS+SdIkf7zyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aFZT5ll6Vd4Vg/uA1y6KZI9ANzCAIovFtxjigU5LAxlrLAefL6JrNZHueMup3AL6nbj/Vi6zzVdo5seGkDQme+yb+3eHUav4uDAJkilUAAo42SlERDvUXYn/LTk+X/+nJUGZaHF5kwU9yDdJbtOJ24CIK0q+FpGoDB6EdMTd33U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=udknWNOl; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3105ef2a071so70633911fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 05:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750249614; x=1750854414; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MeMY6ZvITBPQwHI52jDYCf35TLcxWMfuS+SdIkf7zyY=;
        b=udknWNOlq1p+HLe0dsmC4jceUTWZ6MbqLrM2DE+ll+5PtE55I+GjyiNrnmzOkplk6x
         dyHCCUSAq25RV6+dgbHFV5VlsIRFAyHnyfQvfJntB5MCjIewhBy3J9Zuj/SrC+csCSzf
         KK9PIvHrROUJBkRghh7JsFKj6434/Hw6KkQI7ZTzyTtIgul5uTsnlw0WoKWbyRtCijA4
         Ub0sYjgunMwypytL52brArI0HGCNrhijVoN+QU+qgYM5l8xrFHOX46i7H+3I/YAgx0Qe
         pIMQ4446kjKFRDnILNXosSSJBStRIl4LOBcWO8vzuCof4ORQr6IQjH8qVpYxwfmsSeDT
         mhgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750249614; x=1750854414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MeMY6ZvITBPQwHI52jDYCf35TLcxWMfuS+SdIkf7zyY=;
        b=QbZFQFpyMhq0dizlCy54Eb0xwZckp4Pq7S299lUUWkVZx1drX1HOGXyVk4lr25Fasq
         g79CswwY9yJwdBkBhRBZqPF8yb5rZBVdoIDRDPE2aJ32SQQrxOSm+AsrvLmOOfuh8gOp
         8o80p8oaSvCxrGYzkAJ8rc1T67Jf03aDU8Eir+HtWUeC1n6cae95EmDPHqC8cklpjN8+
         BvokSHhpP8rNtpDHUtatUqdr+qToaqgvB5ZIYzouGpeuV8LEca961nMsO4y2W8qDeru7
         OGDWQy2FrjGXVd6/yeukTY58u4KrKyYZJ0RaACaJOJ4yTGQAnGtiC9eFsYnkRZMv45Fg
         BC2A==
X-Forwarded-Encrypted: i=1; AJvYcCV1tPXM71df4RZdc59FaUIMYodkcNiW0a503UZjG1pUOqMFpbIlYTc0TFhuGepTiLSOda78cx8lCuvh@vger.kernel.org
X-Gm-Message-State: AOJu0YwQA+bdTFB0jIm/mMTXLJ+rFcUyuA4bOFvBK2kNWG/4wFKwtybU
	S1e3vy2JnKQPZv55C4ID0+Fr2F3OJ3Y7gUYsin7EI86qpSqdTQD2zCr7bxuLiIrO3hz+r5kUMYO
	RAS1ajSreDpnWEASo3l6IDQfmH/p+7+dG35taeshCyw==
X-Gm-Gg: ASbGncvOWnziY3tB4oLOtQwzZMdhV+na7uYnlbMpbNq52/L9x9KtlxqzQXwvzax/ya4
	9z8aaKKU0x2d9zNrCuiC5/5779AAKf26Tsz2GD9A6fcStATI4xBp4GeA1arhsdyQMKx/qyfmVBT
	XchdLMV6pie2P/NyD77tOy0c5rMUMgBI+PI4Fga4VIWJU=
X-Google-Smtp-Source: AGHT+IGmpRGkPvcBAzQa2VYDunxKmHXXLzf37cM2KPcBdZgVLj8USxefk+Q+eVf5G/Wn/kDbl2XwzYwXpcHTfZnY1T0=
X-Received: by 2002:a05:651c:1101:b0:32b:82bf:cc55 with SMTP id
 38308e7fff4ca-32b82bfdff4mr2950681fa.31.1750249614434; Wed, 18 Jun 2025
 05:26:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616-gpiochip-set-rv-media-v2-0-6825114f18b0@linaro.org>
In-Reply-To: <20250616-gpiochip-set-rv-media-v2-0-6825114f18b0@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 14:26:42 +0200
X-Gm-Features: AX0GCFslsN-cSw-dqPdU5r6A6ilGsRmidmHeaF2HfeRbo7EfHKHVSPh6Y3Xsvmo
Message-ID: <CACRpkdb0y9cBpxjefWpqj=S=0eXKZ_SeeKGKL5ePLNHkk_Wj8w@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] media: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Bluecherry Maintainers <maintainers@bluecherrydvr.com>, Andrey Utkin <andrey_utkin@fastmail.com>, 
	Ismael Luceno <ismael@iodev.co.uk>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Julien Massot <julien.massot@collabora.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 9:18=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts all GPIO chips implemented under drivers/media/.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

