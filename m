Return-Path: <linux-gpio+bounces-9081-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FE495D264
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 18:05:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FD3F1F229BB
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 16:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1811F189BB2;
	Fri, 23 Aug 2024 16:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TiZeWRtt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289C7184550
	for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2024 16:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724429146; cv=none; b=HeLrsHrFj98+XoZU1HAIRWJUvr+X5/PP28NgX90r9sU/boqS2TgzlXUUCGKcIY5rBkaBG52bur3qJn2o7rqceyt/b/JIizpeDbUSN8aMN4ZvVjNy5+lib9GjT0KX6sVdyVzwvu6r7IEdvq1LtlJ0O1NRQj4zifDciSU9a/Nb1II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724429146; c=relaxed/simple;
	bh=CtH44QKwujAGQE8ahoA+3jbLv2Uur7pXg2mjO4prtB0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hx2/deM55Hn/9NGx0f5uRPS295vljfoZMusCMStBOxWVycz9rlCOqOYm1j9npLyDToCNzeaCn4RNcLDxXgRXbxp+l5bK18cuD9JLQjdqBMwJD/LCgp0YUF/mIOH5gsXs4bGkr7GgA2t4rCDZnlSP45/QXBOtF1bmw2aWDQUU8g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TiZeWRtt; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53349d3071eso2664052e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2024 09:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724429142; x=1725033942; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CtH44QKwujAGQE8ahoA+3jbLv2Uur7pXg2mjO4prtB0=;
        b=TiZeWRttdJs0LL3h0MSJkCb6YQD9HzH7SHkVQRl1QsvOiNF9O2Tu+nZwVMpj/C1X6U
         1xr2caF0o3oOFH5+CRuG3k6j+b7Rv6c0Zqhpy6/6PiVLZATmx/OhlBt17bw1tcZ0QbHQ
         PWzvZOceArjHXnAnh8HmYBpmloExeU/sSw14/Z8bLuZHJh40nhEjDhT42zJcljjTLXu6
         RFM9fe83MM7W5GfiyN8X+AIZXFVgEv7YCu4zKKVC+hVlO5TqxJ/hK1EXArDiQgwChsts
         kE/i6O8oXjyiKGYJX06E7rv8fAMlymS1CpuMMEqu/PBHAlIbMJ3m0UabivmrPSXXJs3I
         M9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724429142; x=1725033942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CtH44QKwujAGQE8ahoA+3jbLv2Uur7pXg2mjO4prtB0=;
        b=iQc8NqusQiR16XTm6Z8KYIvhPEd0yUYhS5BQR8kqvYYx5txEYy7tbHwiN4nRDe2Yqs
         QbztUgXpQVqDf4yvT00w2tcRTd3AWSTHTTV6xSo9Pz2aphmUMRxBgdu6/uJbi+bhax/S
         GdnW3IHdxkAW4sb6ZdscJwjoxYMXT0rcKpLhCUbk/YY+zjB0utax8295AsXmrUm5GZX7
         jcm4NaFcNC8wSNBO6UlmFmCeFuSo8PdGEHmmGTJ1sBUImdKHnbAZzsTCQ2dt+5Fuq5Mk
         hP2vrzN+8dnhrYLakuX/KamtORCfuukHO0BhzhdtwL1n3wWRtGnD0jhtS0WJ36Y86LmY
         hvIg==
X-Forwarded-Encrypted: i=1; AJvYcCXDaJd55CKhokVcAuUb1eUdqFwNUdbDgApAen6wgNyX/wtkGtpu96V3E//biPt0wL8KX6onm8gC7sZ7@vger.kernel.org
X-Gm-Message-State: AOJu0YxxmFMS2tb3tpZYtmLQRysf86+8KbrQAnr5Ej5GGL9n5M2mBe0Z
	WTQQcHWD4smZN4uS22qOotMV9qm2CLyj3oAcDTVG0a7+qJulFHw5qXIeynGM55G2AzP6duLpRvV
	ZS1fhXhG+SbBJQC4e4X1K0SkKxfi/f2Ik4dpGOA==
X-Google-Smtp-Source: AGHT+IFup5zNjSHwkI2S/YAnufS8QBOQVFCx3HRsnuBi4f//6Xe94XR5Vv9t6+VRO3kcnKL+sE8ePevaR0twifCKGDc=
X-Received: by 2002:a05:6512:3c9a:b0:52e:999b:7c01 with SMTP id
 2adb3069b0e04-534387bbf66mr2083635e87.48.1724429141735; Fri, 23 Aug 2024
 09:05:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240808041355.2766009-1-make24@iscas.ac.cn>
In-Reply-To: <20240808041355.2766009-1-make24@iscas.ac.cn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Aug 2024 18:05:30 +0200
Message-ID: <CACRpkdavngGcP43APeXuJzn75nt=_0rzj1E3+nk0E1Qr6BVKJA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: single: fix potential NULL dereference in pcs_get_function()
To: Ma Ke <make24@iscas.ac.cn>
Cc: tony@atomide.com, haojian.zhuang@linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 8, 2024 at 6:14=E2=80=AFAM Ma Ke <make24@iscas.ac.cn> wrote:

> pinmux_generic_get_function() can return NULL and the pointer 'function'
> was dereferenced without checking against NULL. Add checking of pointer
> 'function' in pcs_get_function().
>
> Found by code review.
>
> Cc: stable@vger.kernel.org
> Fixes: 571aec4df5b7 ("pinctrl: single: Use generic pinmux helpers for man=
aging functions")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>

Patch applied.

Yours,
Linus Walleij

