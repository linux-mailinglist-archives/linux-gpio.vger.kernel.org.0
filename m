Return-Path: <linux-gpio+bounces-18078-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E0CA744CC
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Mar 2025 08:50:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A4501893DD9
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Mar 2025 07:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DECCB212F83;
	Fri, 28 Mar 2025 07:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PtmUakYA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0C4211A0D
	for <linux-gpio@vger.kernel.org>; Fri, 28 Mar 2025 07:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743148208; cv=none; b=BN77qy4YhWaR8QSbs9FpLY3dTIxkKn7PqWY1S9jGae3np3cWKSzgsON6ZApsH2VkpT6B1xGOaS5C9isdids1hWTUd1uG1QEBwuUGXR42WVI+nAiQfWIfdPHROimhgZFGI8lsXojoq5tde30VA+PLr5OeebIoqiZvNRs6NyGT358=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743148208; c=relaxed/simple;
	bh=ZXbXxoTpkZ9XQjuSpddhUTrOU+MP7VY35ts0qEXgmq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HsunkxiCRw2Hh4nm8zs1CMba1CK7TxlVk2q6xmLPtVnBqm8LWxihq7FBu1bBhjj3lVQKyyscntJg/E7RZ11s5fDza4dFFuRuo5AMoCxCLr8MkUySiZ57y6LNX6ThiKK6OSNK8csLlMPoRd+gwsEXRlSIJuzTZJoqTQrgYr9hOYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PtmUakYA; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-307c13298eeso21256261fa.0
        for <linux-gpio@vger.kernel.org>; Fri, 28 Mar 2025 00:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743148205; x=1743753005; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZXbXxoTpkZ9XQjuSpddhUTrOU+MP7VY35ts0qEXgmq4=;
        b=PtmUakYArS0KPCpfzf5YC9gcaIxQYberTRweQwhCZ1dEBu/d1NI+bH7lhnL8p9jPpK
         ezz53NtMAJ0HYiNLvecJ/Y8oBbNaK1bCWXChmhQhTwRi4jhAXEcFqdYKUJe3gUT+Xo4D
         eUn3QAMpzDLtwIVL71w6U420GfGzZjFLLo0/fLKxbskf+M1EJUvmpazXKJe8KORea8dy
         FYQVkVIDlgIU6KZx4l5dr3O7iS96VQFcWcqreri5OPleuRYwZxHO5smA2B4t9ROHAkRy
         gQTxWQS53/vuQ9eKoXJfYjtfimxei6v8KpPJywUHVhm49TKxZu+eNll12WB5vhyM94Cs
         rjBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743148205; x=1743753005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZXbXxoTpkZ9XQjuSpddhUTrOU+MP7VY35ts0qEXgmq4=;
        b=opFKn7YfdT7AUryxKz8++xJqhNlDg2kv68OX8VbPvHtk7mKgqzycyHKQP0V8g8P9/x
         yFwvIcJGkfcgQ2F0FufdLToHkAaM6pnSRdPaU4rzlXRzXKz8knTvscsQnLY7PqjQLw7/
         BS8pe5vwD1OHx6NoEP+E9Y9cZJifxqgvbFVA4fJc0+sbNZw7lmYZh25B91JrOsm/9t8U
         hVUfLA/vEZwm6pjc07eUtOj2cwI5wXoE0bzjPxp0cSkx545t6MyuPIAGB00c76YXgUl1
         q7DPOZxVqZZXwG48fiwpoELMkSqU0yu0+QaZahngEikdjr1XO4TNQMlIF4xU2HztyLfX
         eXCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYr8xz8SqzpNJZ0GL5kH+wzUInPTfNBH1KSeng2cbTIcnZx3t0LQo0QjJ1jbDtyOZcc5mT4snqpIAp@vger.kernel.org
X-Gm-Message-State: AOJu0YzuTXoAX99V1riSOFp+/YUcRB4IYOyiA0ntYIXXyjAUTFe+YXMk
	9DTyOECwawy3ZUNRxGlX9azwwWtynSdanSrC6N4pWGU8reD9zSeZ1DUdx20qN6rUIiq+i6ad2ot
	E8GyyKzdFpBP3dls7cx+fa1E6NPn/CVFqBTTjRw==
X-Gm-Gg: ASbGncvhLdqUk7+/KicB69RCyZn8gLMlgENX2E8HKFBaHLXx6ZzzyXe/R3Dz5d4MPKV
	vLQ2zT8ayrAlSlbq4S99LgCLYBb+56ZIRmp/Gkp/JAVIv02rvdQvzXmeEAiHorJlvwUBd+muKwI
	KuUSKmem4C5nC/mR8zMxsZW+k=
X-Google-Smtp-Source: AGHT+IHnFW4Gf7w0WUxCzWgZrqEcIzapkxQXNY8Xq6/ejIm3eX3Z4HHEGCQZkHosMPCG+e1OmbhNxMtF+vYCyFmrwM8=
X-Received: by 2002:a2e:9e4f:0:b0:30c:433a:2886 with SMTP id
 38308e7fff4ca-30dd3fd73c4mr5854391fa.8.1743148204932; Fri, 28 Mar 2025
 00:50:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327004945.563765-1-peng.fan@oss.nxp.com> <20250327004945.563765-2-peng.fan@oss.nxp.com>
In-Reply-To: <20250327004945.563765-2-peng.fan@oss.nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Mar 2025 08:49:53 +0100
X-Gm-Features: AQ5f1JpLnpUy1enl9HLnS4Wp1zTe11w0UEroaaZ478cBUi3nUM67Bkq1pYEN9vw
Message-ID: <CACRpkdaR_muqL9W=-=vHeuA10R7yPqe4+ib3qb6daqZh1PUU9A@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] regulator: s5m8767: Convert to GPIO descriptors
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: brgl@bgdev.pl, krzk@kernel.org, lgirdwood@gmail.com, broonie@kernel.org, 
	andriy.shevchenko@intel.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 1:51=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> Update the driver to fetch buck_gpio and buck_ds as GPIO descriptors.
> Then drop the usage of 'of_gpio.h' which should be deprecated.
> Based on commit 84618d5e31cf ("regulator: max8997:
> Convert to GPIO descriptors") as a reference to make the changes.
>
> With the quirk fix for s5m8767 in of_gpio_try_fixup_polarity,
> the polarity will be active-high, even if exynos5250 spring DTS
> wrongly use active-low polarity. So using GPIO descriptors,
> it should work as before.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

