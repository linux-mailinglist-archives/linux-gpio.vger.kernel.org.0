Return-Path: <linux-gpio+bounces-25922-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCF2B523E1
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 23:53:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0AEB486044
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 21:53:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D769730F927;
	Wed, 10 Sep 2025 21:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k8YjWIwN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E852A2D1926
	for <linux-gpio@vger.kernel.org>; Wed, 10 Sep 2025 21:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757541227; cv=none; b=OwNV99wV6nh3ldFFyorlC7lVnmFOthpAQCh9UUX/RvvFp5UmUj/AmDzfO1QkonGkasZfeUFkTfQHgTXW49ppLIwYo7NIH9jHshYaU8284P9Or8eCmNQzULNfR4EwZiXOoKozRb353vXbOC1ClVLYCL3p5nSF3BVSYvLtcwrp+Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757541227; c=relaxed/simple;
	bh=q//PQSm+h1ITIo5hhQmSWhiVmrcAM9Xk9nSTnv4AmqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oMpAj+bh+rDMs/YL3YOb1D4SlpnaxCiP1Kw2u+YGULDJft1atJkG8Csr9aSCdJT4g3CND0ZtYalij1UjL0j7m3XhmhVeXdtScbZtzgm9+EcyvkJjsJAjyds9t5DCBmNwvjCHzKY9b/D6jfLDKpyq/qWrVv3Y9C3TU6ATpVnJKKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k8YjWIwN; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55f6bb0a364so9926e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 10 Sep 2025 14:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757541224; x=1758146024; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q//PQSm+h1ITIo5hhQmSWhiVmrcAM9Xk9nSTnv4AmqI=;
        b=k8YjWIwNXt9AhpBsZYI5c1P1Ult0DUK9SpR/tWT25rBCQSdlpnUf//JMDtG4eRwY91
         P5sTeu2g8LjVmdc/avNABQrvxxui+wT5lST7QMDFqd4zbL0P9MJiFQjqQ9WVUaeAyFDw
         V5vtE41Bc4SUHz/2K0EIBL/gFXvuljDbqJhQpptMA8689Qr6WLyRM0p2JGTsYam3zcyT
         BagzspZUBRYpe9pGhtVxlLkXxYp3VO1mPPmPnbG4m0tGcbhEgeH7Eyjx/s6KR0fYeacQ
         qDxibPg5KB47cNSr59UleFSOZaGrIL7rE5JC5WjbrCTHUq4oN9A82geZ9dC/rtKgJfXh
         k67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757541224; x=1758146024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q//PQSm+h1ITIo5hhQmSWhiVmrcAM9Xk9nSTnv4AmqI=;
        b=AjC5Dd/LQUw/o7qjdBXpblw4WJXUVq7Aq8ps4Cyu2oK4FG6deSKJZpDVzv+juTGnu1
         olMT1p16vbvl+qALW2CuqXr+2YoPbCAdb3+K8gt7zlccs06a89rTXLC31nwdIO7/+Sq+
         LPT6b1AkNmjvf16FTtBeobmBCEG6QRY3fg6CsNBxyfsmbNOH3BUxwn7lLcHn3tAyrNc9
         X8ZMzYV9eCERNSwzNQOmNFJdVVQViOqbnn58CNTiWc5LZdDqeWgbm4rhZOMFNx34anlK
         HqrHsP9xyb/jsy9FKPNu4TQJBXX31mSvAed3AF13UFUmhyENVX7ZQ3KWT5mWOmBmwys+
         WTrw==
X-Forwarded-Encrypted: i=1; AJvYcCXAowBmhs18ubVZ2zprunGrKakFIo5s5018/8d5i9pt1kAG2yqKGpNdRersmcMzFttuC1aHPqFdWAv4@vger.kernel.org
X-Gm-Message-State: AOJu0Yw706IxjsZX8ba7KudXuK2DXty3m6j4UUVMvNUeDrpAy7g/7q32
	pRFuDNflMu1YD44hKSDJGam/s62/GfzeAV4Al54meLa8FPIQPuseNvIfxo3qwY8R14Fzm+EoL5V
	blXVe6PDrlqSjLPNi4D50sQJKa9+4pY/wtnTKUQ+1ZQ==
X-Gm-Gg: ASbGncund2RVdZ9SCUxwzB2RftDxLkXIfLkANGGZz7iiWjOzmTSvvr8seCrb7fq5m2F
	XfcX5brUQl1XI8MESYU3ieSO38pwjHrVWOqXBxWahvMTW1Owv+Sa9+35ljXbIjEYONzB4kHZSxl
	hTZ8LWFnxjYAQDGUG3pa03OTa4royVMz1gWIWeTCwiK3/uTmTludAfPTOqlUPGqesWcl7amXD+K
	OXhyTk=
X-Google-Smtp-Source: AGHT+IH3I4tPdCs41TsyB8DNSw/AUL2jC4I7vr2eCoO2ENLBclkXCb0BiXvJWpuRW0sLm6X70ksUUgQXaXO8K7LFJSg=
X-Received: by 2002:a05:6512:ba2:b0:55c:c9f3:6ed9 with SMTP id
 2adb3069b0e04-56261bc58e8mr5471578e87.35.1757541224157; Wed, 10 Sep 2025
 14:53:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909-rename-gpio-flags-v1-1-bda208a40856@linaro.org>
In-Reply-To: <20250909-rename-gpio-flags-v1-1-bda208a40856@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 10 Sep 2025 23:53:33 +0200
X-Gm-Features: Ac12FXxLPdZ38un1m9ptC603ZmrUP6by2OMkj-xvoDoxfyG3HCKzWeGPfFD0A5U
Message-ID: <CACRpkdaFj7okjN+n2+kRAopf17DV1QGV2mbmndVtDoi=GuqAug@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: add a common prefix to GPIO descriptor flags
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 9, 2025 at 2:28=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> While these flags are private within drivers/gpio/, when looking at the
> code, it's not really clear they are GPIO-specific. Since these are GPIO
> descriptor flags, prepend their names with a common "GPIOD" prefix.
>
> While at it: update the flags' docs: make spelling consistent, correct
> outdated information, etc.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

That's a good patch.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

