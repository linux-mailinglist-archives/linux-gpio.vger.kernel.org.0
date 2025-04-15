Return-Path: <linux-gpio+bounces-18824-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 17722A896AF
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 10:32:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83206440AF6
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 08:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F23D28F510;
	Tue, 15 Apr 2025 08:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xcKoYDLx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BBD28E60B
	for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 08:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744705775; cv=none; b=QIJuHFszVahM5V1MHpif1Om+NTMiv1A2r83hiZg9d4pUgffiJOggZqyqDJIgP1V8Z3bA4MQiUQ6w6L+XEAlm4oji5GQHc3Hn+txyF9j6yy33pkg5deux8ps18T+juIkUr5OkBP9XcAAGh+7DeXZ+FgVPPXLrnF3BdUk7hIenQV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744705775; c=relaxed/simple;
	bh=JqF91dZIOXlVj0NeUvRp3kehfD9MyoxzqTqimBqYe6Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CLFuRlT6xQSMxq30EyZooJCmWZ48PuIoPlxnU5Ujy2Na7VsXdFchyXKM7KjjmlH2KCAwyQYv1sIq1b4f4v5W6342QRSmVPYIpWiN0ogi7T7IT/Hv4Ibhc8LX3oPzPWqOI/5e/r8CDbxM2Iy0NTWZUsTsTcxXj4LoL/lYxr7qauY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xcKoYDLx; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3105ef2a071so25539031fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 01:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744705771; x=1745310571; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JqF91dZIOXlVj0NeUvRp3kehfD9MyoxzqTqimBqYe6Q=;
        b=xcKoYDLxvj3EDKKIoYmqrloJhQUGDIAD4FnRAl+jCsC/9yTvpdYylTMjy2u9pjTZDm
         iJHzKKKpiGezLUik1oYSkGqKlUfuwu+XIynzXRZPFjzPcixRITHxg7KTovOiKmMCqCrp
         7zj4vV6YGkzGG4keXPSmeTlg3DT/DuOclA8fNQKL9ZtW9SvBe0kX3KJAgZlPO5uZ4lpS
         1hdylfNtjy0/LSkfjZUJjbeOdUVDCVoQpS5MwiwNCry5THCEesNNWYq4wCfGL3slEHBz
         3512Mnav27ajcuCqt5TmQo2nQRnMgUFj5c2I/Frf0NooRvo5rmfZLw1mEhUDqecTy2n+
         mWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744705771; x=1745310571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JqF91dZIOXlVj0NeUvRp3kehfD9MyoxzqTqimBqYe6Q=;
        b=HAf+fjNn/GXred/Hfjm2J7tWEVVA78cmMZFJCXP8YMhOAJ2iGcpohLHRbjAIFJla29
         7UdGadpo8mMskcQXXpsez6UJTNohkjRYsHaOi8y2yHgqwQ01Or7z+1LVi9yWyRiaaPpf
         p6uC5hTBYnSGHRK1vKXsxwfCBDVc/i5sPwwRLFxhbtVKzKU4vOjLoZvySk2d3MlP2gOO
         R0Bh6+HIAKWOUucRsH/DAssPlHd/qbDJ0nxSD5KhhyeeVQD8vCHWyvIS7gMdMNNQsJkc
         7ApK6EPb02FwMQtPtsqI7uu+lS2kHJocOIfGrEzOVh16Z/kF1CRUP0LOYMgsu/T5JT3/
         sbpA==
X-Forwarded-Encrypted: i=1; AJvYcCWm2hYR5BRATfghujOqJ0ed1VdOEugC1DwfRTpcZOQnvIQt4ZBBOoZWj/Nk8ebYJkFmkja5ybJLxukQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzlE43nxBS7T2afrXY1SOxKtX17wco4xn+OfgMYy4rjOWrSFh7p
	vkrSsCFZnPkQAKcpY0a3OSsv2e/lrgJBis484m93JNmeCH5v8TruG9sDEw5HdQ2n7gViKIpE2Tx
	LYL6TsNus5eRFlWvjjsIyc+l/VGYvkrvi4JiNwA==
X-Gm-Gg: ASbGncvqIyoZOtFAdK42hBXNOLar41lgXKJoq16KMs450w0KA+0X94rqh8L7BDDCf9Y
	DrIYyLZmhY3qs7hdihqtzUEO49K+3E+7pRqlB/GLbO9cnUyXV+Be9ZQFXjGVTsEPlOO7mHNaQOG
	horXPRIid/mFpXGUDfsekCYA==
X-Google-Smtp-Source: AGHT+IFjWv4YN2TLRK+8gIXeTMozvedsriPJva3Us+iyvNvjh4tmGiLADPX3P4ddGuJK/i6+QCaKD34pqB7ZlhiSFww=
X-Received: by 2002:a2e:bd08:0:b0:308:e54d:6195 with SMTP id
 38308e7fff4ca-31049a021d6mr45079331fa.24.1744705771136; Tue, 15 Apr 2025
 01:29:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-bcma-v1-1-fa403ad76966@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-bcma-v1-1-fa403ad76966@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:29:20 +0200
X-Gm-Features: ATxdqUE9g7RM0HJPsiRtWp5uefAcSNQmT280xjEtFgRSUBBli2MK8hnSPFDk1to
Message-ID: <CACRpkdbu01ivd7AX5vn6App2UXbCFMPCMK5FBoJJvHjV52Q5YQ@mail.gmail.com>
Subject: Re: [PATCH] bcma: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 9:10=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

