Return-Path: <linux-gpio+bounces-22094-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30325AE6FC8
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 21:37:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9C2C18900A1
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 19:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C38252EA737;
	Tue, 24 Jun 2025 19:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D0xgjMWO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B187E2E92D0
	for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 19:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750793824; cv=none; b=Es5N98mCb7WweQ39KNKCk56JplP+j+PX3B+bCGtIB/RNRi6D9Zv9BYfX3rnUDJbN+2P6w16TAOeTTH5/jdtiRFklOZVLha7trJaeP92CDmbG0WnWp8JumrwGq7GEz5kQqlUmst/ZUL3P1p1XUggZuwvcEfxHrOaFGOafm4tmYcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750793824; c=relaxed/simple;
	bh=JZqxzc3n4hGVaiBbeSBreJZxmERoCl0/CXAHzC0ay4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ncOHlRKx4RqJ2JEHlKWPi8ECIbK0qctn+MbF1qXq9hdqbfS+uoYEtPATCSJPcB1VbZVw2/ddv8l4FkORKttyuzkwQCjCqLhOXNjSNuqLoxIkrFGA4FWM5jb68OHtNNrOE9QS5yqF5R08CRWKOSHevBT9yko9WS7Veyo5DUDoqF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D0xgjMWO; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-553b3316160so4482969e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 12:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750793821; x=1751398621; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xWx4ZbqmjuoN+GAAAjyTNAW/3x01CyhLbr2HZXGfdww=;
        b=D0xgjMWOyF3KHvczmtjAV3Q/PiM35tiT+5D8J6tO7JPh05UGPOywZMG+fMt7vRhYuz
         7HcBz1tUlIrYq9uRP0Zmd9e46VdOSIBjgSpFO34DhgDBOXa9nSMtNtr4ypfzA2HBPP0f
         9vcqIj3nThANA6Yo1us8puJgZ24UqGwTSjMU2/kXkdf3cHupoDcUWXD1fLYzau32TooL
         yc/1yfams5wPvtzARw8RjLi11HtgZxQdCrfvDO12lksbSxV5j6A0qg7Gws1SR+pDexCc
         tuQeJfHDts/Pa143m0mkQ+Q+xgy2ea3hUyy44tGbRw3iuv6W8EInnOqQ6RjjiYF5/1/D
         nCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750793821; x=1751398621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xWx4ZbqmjuoN+GAAAjyTNAW/3x01CyhLbr2HZXGfdww=;
        b=jBnp1E8PM7tf+wqCp57gkMLzMw8Qk8yTriMkXpge1ZI6040/0utqm6COPwG+5eCZvR
         Jx31djAy0mhEuV4fR/99ysxNpdiLtPJNeT1VRR8GrDzQwCfEAYoMQMT48UpCi5GOnNH5
         WejOlRGLqhylNf+lCjkmVsjUfW5h/jE3K9J/t3JkXqaxAEBl2UuNZ9P3dB7jcanYj8eP
         uDkWl9vBjdw5Ru1YpUn5CYtz2B7YuRB5Vh53+jWG6Zydh09LIGLfWnbWO2XQdyyhPhqX
         9KWMQKJt/LNjGdL//qipqtS30IvHUVpLKeZTQZia2gUT9Djay9T2TH0M9A2l1ovDVnoU
         xLTA==
X-Forwarded-Encrypted: i=1; AJvYcCXhSII6jEoXl/CSOtfl+rZG+SyMI06/9fMkB30ti5oSEwzQSsSl6e8JqPIBQQAq4sV/iF7Qe1Bl05dn@vger.kernel.org
X-Gm-Message-State: AOJu0YxEN6eHoc0ZFkBULXneTCrIvBI/LkuT48r2gA9tMz6BJeO0fHza
	t2lyzelqnqK+revP0o2YN1U1EcK7QYIaUgFp+XBqnr7P7VvIcLO91YUjzWIvPmB5L6C4g5vDYTt
	uSALYRJmAdENt8sUVKPksWY8zHPCajyinOZYHfRxbIGin46WW1HfRwNE=
X-Gm-Gg: ASbGncurJzUz1KgPa5zgJuBeCucIU4CWH5Lq10hVocquuC3I6exdrzurhqUaDT97wys
	MPMjvvA8rD1rnnZVzSAidQZsBF4MA70wgzIxajtvbJLYpU8tfmFv2P3mLh77e7ogyV6mCnkRdmD
	IizydXg9AfgBSCzfhErjKBRaZp0bRYsDkbcYaNiOLMSBinyzuICzLHqA==
X-Google-Smtp-Source: AGHT+IGTAkz9C4D85zB1kQRLKN+kg1CzqDWzK8T7Zq3cCjKU/bU0Pgyf3W2KemMQkOy8Ax3B2qtJIPcdQTQB2/vKgbg=
X-Received: by 2002:a05:6512:114e:b0:553:2dce:3aac with SMTP id
 2adb3069b0e04-554fdcd71acmr54580e87.16.1750793820825; Tue, 24 Jun 2025
 12:37:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624-k230-return-check-v1-0-6b4fc5ba0c41@whut.edu.cn>
In-Reply-To: <20250624-k230-return-check-v1-0-6b4fc5ba0c41@whut.edu.cn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:36:49 +0200
X-Gm-Features: AX0GCFtQ1H1_4Ze356zkPlmDngrt4CualoQkn-4hS5it00YgmSIZZpN3pwFkejw
Message-ID: <CACRpkda0w6GthVHe+iMGBG-5QKrF-3yP_8o6M4_xeJWsU=8h_A@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: canaan: k230: Fix DT parsing and
 registration order
To: Ze Huang <huangze@whut.edu.cn>
Cc: Ze Huang <18771902331@163.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yao Zi <ziyao@disroot.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 6:11=E2=80=AFPM Ze Huang <huangze@whut.edu.cn> wrot=
e:

> This patch set fixes two issues in the Canaan K230 pinctrl driver:
>
> 1. Adds a NULL check for the "pinmux" property in the device tree parser =
to
>    prevent potential NULL pointer dereference, and fixes a typo in the
>    match table comment.
>
> 2. Moves the DT parsing step before pinctrl registration to ensure that
>    pin resources are fully initialized before being used.
>
> Signed-off-by: Ze Huang <huangze@whut.edu.cn>

Patches applied!

Yours,
Linus Walleij

