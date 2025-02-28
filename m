Return-Path: <linux-gpio+bounces-16778-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96003A493D0
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 09:43:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 256257A5B0B
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 08:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81F2C253343;
	Fri, 28 Feb 2025 08:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oSdMfQuN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BC58F6B
	for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 08:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740732186; cv=none; b=Z9hKh3rFYHrFEN+ioHC1nlpvPQ8ZmYp9QsUDlNTAkldPCZlL+fBhYsq3nNY4evWOTo6YZeSZ4Rh5qvmanZynnB0i+eBKrKTwNWFQy0Wj/5QPszSA3ZNktWuyCqu7YtmZ0pURVDThuhKuNtqqNe19QTHwtijbqBI5xKRERhmo1Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740732186; c=relaxed/simple;
	bh=kx5ixhvdP6EmZ7yF5ftbKYrRukemNttfsGC0jekV/Og=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p0c2gKEZK0Hz5Y0v0bGAjbYDwyJ0VagyM3i7rqG5QGz6StTmoJyB83HZ+vmucgVmaUjRRMYVMYEWawDhQyb6mifiuyUbbxjakincrlRNPPosUZ6nMrNtw4YFIUN8fZv0dwn7GHzTPaGOaLT99Hclw2a3smm1LC7vmqoft7biJSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oSdMfQuN; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30a3092a9ebso19981961fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 00:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740732181; x=1741336981; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kx5ixhvdP6EmZ7yF5ftbKYrRukemNttfsGC0jekV/Og=;
        b=oSdMfQuNDVth3wWTaRks3YxgepFFHPDjNkiaa3KJatMYwcWQAR4kShm7/1kihKx3Uc
         IYddF7UJXGd8MQ6IK6ZquCshGaxMQfF8t9WC/txbXPp8hLkt4L77st87XQKUjLuuQRkZ
         i5s0aQV9uXLhEyWMhTe7r48iwEEmMD/It67fscjfMFqTQm0kvzwoBOZk9xrBF55MFdAP
         s5nEJpWgXdSRNY+aNt2ssFeDFavjWsU5G637ujmJkjT9li1hqqQB22nL8cUYTmvpGLeu
         p3wiNScWHxT92sredgOHkX2alyUwJ5Hm4YdMxExD2CCqbABPAo6qnq5vUByuVovDB+Ev
         AVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740732181; x=1741336981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kx5ixhvdP6EmZ7yF5ftbKYrRukemNttfsGC0jekV/Og=;
        b=Nr4RdaN6TWB5Qle5JKwAo8PemlqV0HgXtB7tjoAmMQjpXK/zM4Qdt4n+GB9Aykpt85
         /5Q7UH+N9BVI8nmLWkwG2ycP9jVaMYEdfe5tk+DUi5jV9meepsI+S28xlcWkb/doSDnr
         pXuZ6gVbggzVbSpJRSI3f7ig1eChmkX2sqFQt0f1G4k0jTBEJga/x9GEO3eGXFpayDZQ
         3tqsms4Mx0C6gaMzHjp2xPTZKiH3H0xkA/jYpB5qwD/3R0RNZP63JEqFgRAUdss3UyDH
         ambi6YkWEeyiwtewlDRce3UVzeYI2h36XjdC2dWs9TRTvFf/8s4qNacqszV3f2MdYnuM
         u2Jw==
X-Forwarded-Encrypted: i=1; AJvYcCVwVewd41Q8CGoL/yzI8lNkDjJeCr01F7fytpTczWqeGbTf2Wb3qC4fccrc5BXfrHETmHrk6UJOpMam@vger.kernel.org
X-Gm-Message-State: AOJu0YwlXMBfjVD65ASL5vnos7yUxoX/lLnuh2qO728QZfI3wp25JRBx
	yC2jBN2KKyOtYtXoh4cga4ie14MBVfmWVk8cG44PVFgnyFhg2+ofFs5kbHK82HHgHri6ORYx3Zz
	UgSdJAg5Krx/9Y3ufBweY2QK98HDYGbYMynGvVA==
X-Gm-Gg: ASbGnctHLaUiSlsUq7U5z7XZ1Ed16/WklqjUioCoZd6NhxqVCCoNwKkl3hHCzpWQH+C
	KQqzyCYURllXpT4H1J0htxNJHA/lhq6KnvmOZbUOFQNOEjg+kY1w2XhcdgTIoaQh9Pks8hrjPCb
	TqKpjlCE0=
X-Google-Smtp-Source: AGHT+IFnojnEU0ZTQwdhFM8EZ+VzCTRW5WfJ+IRPsOQXruxW3ArvgVeYghHEs1cbMHob7yzBli3HbDb90ZQPHvgxO/A=
X-Received: by 2002:a05:6512:4021:b0:545:f9c:a825 with SMTP id
 2adb3069b0e04-5494c312576mr703967e87.2.1740732181275; Fri, 28 Feb 2025
 00:43:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250227-tlmm-test-v1-1-d18877b4a5db@oss.qualcomm.com>
In-Reply-To: <20250227-tlmm-test-v1-1-d18877b4a5db@oss.qualcomm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Feb 2025 09:42:50 +0100
X-Gm-Features: AQ5f1Jq7kGENpEdbNLcHzj870r4DoaeXZChk9tcwrlm_rnPAZaKo-WGL4SgZr-A
Message-ID: <CACRpkdZP4u+LwhfRYnjhD6bkoBAG7AHX3SnF=5R8fc72BDradg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Add test case for TLMM interrupt handling
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 9:33=E2=80=AFPM Bjorn Andersson
<bjorn.andersson@oss.qualcomm.com> wrote:

> While looking at the X1E PDC GPIO interrupts it became clear that we're
> lacking a convenient and accessible way to validate if the TLMM
> interrupt code performing as expected.
>
> This introduces a kunit-based "hack" that relies on pin bias/pull
> configuration to tickle the interrupt logic in non-connected pins to
> allow us to evaluate that an expected number of interrupts are
> delivered.
>
> The bias/pull configuration is done with mmio accesses directly from the
> test code, to avoid having to programmatically acquire and drive the
> pinconf interface for the test pin. This limits the scalability of the
> code to targets with a particular register layout, but serves our needs
> for now.
>
> The pin to be used for testing is specified by the tester using the
> "tlmm-test.gpio" module parameter.
>
> Worth mentioning is that some of the test cases currently fails for
> GPIOs that is not backed by PDC (i.e. "non-wakeup" GPIOs), as lingering
> latched interrupt state is being delivered at IRQ request time.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

That looks like a super dangerous footgun to shoot oneself in the
foot with.

But the usecase is 100% valid and I see why you need this.

Patch applied!

Yours,
Linus Walleij

