Return-Path: <linux-gpio+bounces-10694-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA9298D479
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 15:20:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4058E1C217FB
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 13:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ABDA1D0491;
	Wed,  2 Oct 2024 13:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jr4NZMBV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8A01D042E
	for <linux-gpio@vger.kernel.org>; Wed,  2 Oct 2024 13:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727875240; cv=none; b=t8n3REDm5pBHUP9fRtzZ6pfS59o/RC4DFLWQdK8hMfXsLUliQoZph/FWP8Lhz3MB/unyhc7mpXtfuSQx2PdqJVsR6uDTTZYolKVKU9Ch4mp4b+JYYF0kJdPy+2ss2w2AGe3o0nSbbPlU8yRPx0K1TNjJuk5XGxYwA5H51v/m/Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727875240; c=relaxed/simple;
	bh=LKLmKgBeEsOhEbbI+yF44RBUXhPJBUhhrepWasj3bJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mm5AF0CIm+V8t+wO5mkc1DcoFUPicBvIiJ9ctVGSiWdbZiqUPCXkMYKqlweEm95CXfZSiuk5gni2SSxqE2cxbc0H5iXbgnSl+NroVtGTH8hDy0IsPEBPLro5WZOrSeeCubiFqi1Cdo4t5HyyS9jXB2RAyxnUJ0WnQvC/yKYi2tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jr4NZMBV; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e260b747fdcso4548436276.3
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2024 06:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727875238; x=1728480038; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKLmKgBeEsOhEbbI+yF44RBUXhPJBUhhrepWasj3bJE=;
        b=Jr4NZMBVpCDWV2rS5IklhlTikCLURNYQr2nJQiqzWMYD0k2wNK58eeKjDH9vya9+IU
         f80wV+Vr9udWLU3QSYEsKae10C5EOOQ1IOiKBTjjNofJ50fUWtH1Tesv6kbl5s/I1Kjv
         UTrLPd9thdbXWZdvcYeYvYW49Q3kL8uoE/yRuSnGBgJHgZAJc7YkbSuLlf0UdhpGhQs+
         JtzTiIypjYqir/tHVs5uSxMqJzLxcQGUqGmsF0hAR1XeX0JDxlOxLlcmhDK7kgID9KJO
         km+VAx73bELF5m6Btc9fWJ32gLiL4dYvj+cpd1sOiuntNjl4L/rpF3zZNqDdtf5dArqF
         XFgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727875238; x=1728480038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LKLmKgBeEsOhEbbI+yF44RBUXhPJBUhhrepWasj3bJE=;
        b=ld/G7i2ewkangz4cQXpGk4GEwDnxMJeLP43CFxV4DURdymcrsm6algQrIz7UnCGaM3
         +vFpvruC3/eAXAL4M209xc5qAiFyi2QPLcE6bxHz9TKHxTMmTZ4ut7m+GqcOa9TvF8oM
         QRmSBeXaeqC82zDh2eqiyWhwV1Op37I8neUmJiT6Qq1UyT2u0zxcgCoP3wh0QqO5/Vd5
         5AujKtNjFheZZT0OKUcDjN2oCSi5eji7pktn92RC7XzlnQCElJx3vb3w+3pHWLdddg4F
         aXZgFdsXP5nCXLsA5+NxjEoE/OO6fiH/+of4+Yd3NDfqQvOxtGHdIr0813eG16VQbL/v
         mrPQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9TFfOamm0YJf2DmKxoAI9iiUlaE+jzb4iFfphVmdmk2TclsuMeySDByZULSttSkd3pFxz6AFO9mcP@vger.kernel.org
X-Gm-Message-State: AOJu0YwADR2ZStW9l0U+5wrOLiE5BWV1xIKc/jgju0UcbpAV0jvIJYHM
	FiZc7JE8rQ1lMoAOJN1fNnOdJWfLpkMBbwVJOJFpsem0Gsf7uVAsiX5DziRBDl9jQuefCeQcGfb
	/DN98q74VUoTdCqFFk3AfGU9SccbkraQ7Zz8V3SH/oSps7zBCNg8=
X-Google-Smtp-Source: AGHT+IFYH3REGo48+Y/fX4gu188AKxY9QApKlczmFVXC9j8AP4zqDdguIRuAvaEXvNk65bYYP0wTWILjBGoh4oX3wwE=
X-Received: by 2002:a05:6902:908:b0:e11:7250:4f9e with SMTP id
 3f1490d57ef6-e263843c9cemr2816091276.54.1727875235922; Wed, 02 Oct 2024
 06:20:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240930144804.75068-1-brgl@bgdev.pl> <20240930144804.75068-3-brgl@bgdev.pl>
In-Reply-To: <20240930144804.75068-3-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 2 Oct 2024 15:20:17 +0200
Message-ID: <CACRpkdYt6iA7d0gthm2zc4JZONQ1sg_Y0-7M6=rthXzo1s+MyA@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: xilinx: use generic device properties
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 4:48=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> OF-specific routines should not be used unless necessary. Generic device
> properties are preferred so switch to using them in the driver code.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

