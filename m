Return-Path: <linux-gpio+bounces-11343-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B3399E02E
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 10:02:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC0681F244CB
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 08:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DBAD1BF804;
	Tue, 15 Oct 2024 08:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w14caT0+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5F01B4F0A
	for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2024 08:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728979361; cv=none; b=UCCq+2wh1Qos+3KwFJPh2maVb2XxS1YJsUoJ2wY/hP2l+PUcoGrSx3T6ltnl2Nw52J0UJq2zPyndyxQL6grEJKOOH0YPbcV95/4w5ApTjF2d7pyo7oseLGdY39p/FA820gMxJzsTdH4TJOEWm7ULnXddUABL6d8wi/A1Y/lCt9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728979361; c=relaxed/simple;
	bh=V+3OSKnUJCVg/AQN0P9xEpaXk148am/m2+drimavwXE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FHZth4zpDuqZY8klQ/nXzrXUCLOa05Te4pSAG9iuGbKIug0McGRqQ4nDgwwNS7Gs9+p6YxMTBLmzkk6kEgFGLM/WUHFs8WPKcvTPPGOhOQP6+XJkKzUB5BHlO4JNaEj0GjYBrMWg1Zvuj2hzPxZI3Q6c9Jm4SPM2TmrJV3yHLb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w14caT0+; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fb5111747cso17787431fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2024 01:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728979358; x=1729584158; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+3OSKnUJCVg/AQN0P9xEpaXk148am/m2+drimavwXE=;
        b=w14caT0+kWY9C38p544xrs47HRTiYsv58dJu/yOQSrJBWwPYwOkA+FIX2WujzOL4rQ
         Hz1nCVc5mSR7fb0PosdqOXES5+Un3JcdfYe7zigQYeJ+DUhRezE+tHF6IMBwmy5V0yf/
         RtotKg2ctvh5uhs1U5JZIT2FaX8sZPkbUfm32H9sCuzjf+t9Nzy61bkktXZz2jkO3fDo
         MvAI75PQPUm/fwuVHAfJj0QNJ4y3Yu7A65PspW4LY/RZthjq/93GlAJVNn1Y3USzjPyH
         upkm16s/q+WhQb9HqQVwiTNHuv21wPCegnovBj+uSIAXGNX/trI0Xs3v77KCv0sGOOXI
         Zk4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728979358; x=1729584158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V+3OSKnUJCVg/AQN0P9xEpaXk148am/m2+drimavwXE=;
        b=oje3iFBkIbTePbo1VqoFR/xALxn+sfLRoSfEYRubvdl3IOIt2bcbVkZ21GqdTHs36d
         iSy7ouuTre8M9FHyXvKJLhMAXDZSCc4+7PnknFSA+prPilasnhRHUJ/8hiBaGOOWsSa5
         5VEZ6EgbZJzAzHql5Ce0nJuhwo8F9DQGq4twBtvpz136R92BW6JHKPDcC3CAkCpDu8ig
         +I1h3Ey2sbF8yAmVG8hv27ULN87y4sAfljCPPHc857obFLnYVkW96sqLXwxp1OagMi3H
         9gtja4w/ochJhtKt11J1VhKj+GxU9QJCa4CharJAF5PfaQ0H8onoVqLE5Tqscz8T2ypx
         Ymfw==
X-Forwarded-Encrypted: i=1; AJvYcCULvQlTJH29vVKppk26P4GShgiJ+cHHJyQsPdcia9crVoDSG+u4fbn7gQqYKyJTXXMkqF0qGLRWNd7y@vger.kernel.org
X-Gm-Message-State: AOJu0YzeVfToMlyMFW+BwSM/lxmk5/mdBZXt+c2H9PiB8V8cEcdD5+nN
	tjI2E3r1s5gogBuecIFG84X1ymS8Qzgelv/N89qsr5l+W1wA7+iMgLP4leXoduUOqjUazk7SeCg
	D5zhPorP2+FivzhxYdzEKVz1Y7kVUofnfiwSrbg==
X-Google-Smtp-Source: AGHT+IFdR9MmbQEK7str0XO9bMiJQLB/liwpyi9jxJ7ysFgwGiEhrEgJZ76Tmtf9Ey/FI7vW044c0ZNzL2yJUeyYHZI=
X-Received: by 2002:a2e:511a:0:b0:2fb:4982:daea with SMTP id
 38308e7fff4ca-2fb4982dd19mr22310321fa.32.1728979357571; Tue, 15 Oct 2024
 01:02:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014110707.101320-1-brgl@bgdev.pl>
In-Reply-To: <20241014110707.101320-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Oct 2024 10:02:26 +0200
Message-ID: <CACRpkdY7QUPvvf1PLrThctUSJfTDPV-OKw8TqXhpLjFvGopbhg@mail.gmail.com>
Subject: Re: [PATCH] gpio: fold the Kconfig prompt into the option type for
 GPIO CDEV
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 1:07=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The 'if !EXPERT' bit will work fine if it follows the 'bool "foobar"'

Nit: if EXPERT

No negation.

> declaration. No need to have separate entries for it.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

