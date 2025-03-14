Return-Path: <linux-gpio+bounces-17615-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE979A60F8C
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 12:05:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA4C318957AE
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 11:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73FBC1FAC25;
	Fri, 14 Mar 2025 11:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Alc408NF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1171DFD8B
	for <linux-gpio@vger.kernel.org>; Fri, 14 Mar 2025 11:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741950312; cv=none; b=r6OW4XAiQclGVlEpn6y1BqzLCkTVG4MPiWE2e1bCpj1VrqVZL3x/ZeW1tQAoRt24E2xafUlSGNM2hUEPBCDXU4fAkwqpWTuNATas6p4BN7RcdVraiV7NubGFj0Ta7eaqepXRv9F2B8+bIAKFFzitUpCyzPSwhCMiwZrSMk0N4ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741950312; c=relaxed/simple;
	bh=mSti1lSdkZu5pzlNVnJFPEzIQmYvJ2JTwDXM6hAfHUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mS/ZoPfCh61V+uPT3DSVbxSVo8MkqqqUD8NjvLm3bQg/BcMOHy/v7zC0ZLj6Qr4Q5IXAH5nRIBK5swsvsPFlf+UrZ3CTK+6B0UGw/QEjRZPCduL998bdJ/ht2Oiq7puFeDEYgLjxvRCdmS2rrQAjugdykGygG0Feg35LrF6cR+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Alc408NF; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5499d2134e8so2354562e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 14 Mar 2025 04:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741950309; x=1742555109; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLwu4BItx7GSozI0hELmEc6ksU5EqrfITEr4tkmZScU=;
        b=Alc408NFuXrlMzvZCbDAayfA98kdAg18P0E69FKzsxBVjjinS54OiueI9EYdMTsd/0
         q1kKiFEwBZOcL5EWbhfTLS9711J9ISkrqtZIDSA9TWWz7894q95PDiiZ0sn2V2YwPPZl
         uWhtMpgAnvX7T8z34HqDOkaYXIeb6tSGUn6bzsH6c5Ky8FyUKjTw7D9p7s5OvaWKEJFW
         9DWwlzuzC2IlRazjmXYzjmrXw7YM7gq4x3LTIm1AVaJOdUrEYhJbDAFgL6qM8p4vNmvf
         HYX9r/Bt4/0TKbpc76NE0UNYuXO7ncIx5yEkHeDJqOnraA7qD4PoVHsj8N/H4O98x9bR
         NGNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741950309; x=1742555109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nLwu4BItx7GSozI0hELmEc6ksU5EqrfITEr4tkmZScU=;
        b=uC/uysAMOBRoOzaiM6Z/tepYZ9osU99A2zTiREw4lwQHd3W/Tl3evj9QAk5tF8dwz3
         9WvXq69sh1UbQjtYPPp/E3TCtoWCEJvmfnLZS67eURd9lx+7ml19hI14HiQnGpuTKNLf
         A5F5PcaVc7wFjKzjmGRuhNBEZD0wVc10Aj7j9IM0FozWOk6hXNmNistYCPKzAaWLkjAd
         MIsvViMfW6t5vUC7VtRhH5aSPMcAq+yOBnKE283ubAWh/f5YEe9ZiQVZeS+8p/o8K4D4
         VOoSdfgKoIeP70dh3f1Y8EvONCUU/kWvMe0RZMCv52a8S82G7TEyaVJzZr0XZYL1mMYx
         tGCA==
X-Forwarded-Encrypted: i=1; AJvYcCXBm8o8xaVG/yafvl8oFIxOYhk5GwDTCX2NBfjw7W0N+maTlAB+Lpx+36G/iMkUf4XDQb7eU3Iq+5/b@vger.kernel.org
X-Gm-Message-State: AOJu0YwUlG208dtacfhwjywUrT/m5WeGa7l8zU8zMDeZL8QtTsxXYIRw
	ClcNeKt9XpbRbGmS6lLN0KiNKNyzJaBA4eaptll/+ggjxmOjxXzJizm9G3bj5lIcxwQ43kWEraD
	7vjj/zxXVRNQ4M2zOJB3Xu1uP5WMOJmpQiZY3+NtVFakgV3rV
X-Gm-Gg: ASbGncuRPlbqYqDdFnSUMJ5x8ljXkIEa+r6kIIHcDcQVKB2XuW0GDi5FO3SVB1MMm+N
	zLIwtpE294qUNCZaqMX6s3qBi6LC863Gk64qNYo61gp8s1LR+K6nbHBy2MyOK1VIpADpstWkvb/
	+qaaq33VvqYO4qwJSRKz9w4m4=
X-Google-Smtp-Source: AGHT+IEyxeKdaSkt651+21OQXccVtgFy+5WZ9uKiJGH8I9fe/+huCQCgBkk3lIUQsz0H+FIvtBdc8x1f/cGJIM8GB0c=
X-Received: by 2002:a05:6512:3f1d:b0:549:8e5e:9d8e with SMTP id
 2adb3069b0e04-549c362983cmr681438e87.0.1741950308554; Fri, 14 Mar 2025
 04:05:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250312-pinctrl-msm-type-latch-v1-1-ce87c561d3d7@linaro.org>
In-Reply-To: <20250312-pinctrl-msm-type-latch-v1-1-ce87c561d3d7@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Mar 2025 12:04:57 +0100
X-Gm-Features: AQ5f1Jr_N7K7lEmvAgWDKBNNbb6WNXI3ALMBHl9pGsmXAlMGAySw6CoFSe50v9k
Message-ID: <CACRpkdY-zRy9h9bg-sJRr4Ux9rC8ZnjGxN04OQ_ZaDzN3X-SDA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Clear latched interrupt status when
 changing IRQ type
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	Maulik Shah <quic_mkshah@quicinc.com>, Stephen Boyd <swboyd@chromium.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 12, 2025 at 2:19=E2=80=AFPM Stephan Gerhold
<stephan.gerhold@linaro.org> wrote:

> When submitting the TLMM test driver, Bjorn reported that some of the tes=
t
> cases are failing for GPIOs that not are backed by PDC (i.e. "non-wakeup"
> GPIOs that are handled directly in pinctrl-msm). Basically, lingering
> latched interrupt state is still being delivered at IRQ request time, e.g=
.:
>
>   ok 1 tlmm_test_silent_rising
>   tlmm_test_silent_falling: ASSERTION FAILED at drivers/pinctrl/qcom/tlmm=
-test.c:178
>   Expected atomic_read(&priv->intr_count) =3D=3D 0, but
>       atomic_read(&priv->intr_count) =3D=3D 1 (0x1)
>   not ok 2 tlmm_test_silent_falling
>   tlmm_test_silent_low: ASSERTION FAILED at drivers/pinctrl/qcom/tlmm-tes=
t.c:178
>   Expected atomic_read(&priv->intr_count) =3D=3D 0, but
>       atomic_read(&priv->intr_count) =3D=3D 1 (0x1)
>   not ok 3 tlmm_test_silent_low
>   ok 4 tlmm_test_silent_high
>
> Whether to report interrupts that came in while the IRQ was unclaimed
> doesn't seem to be well-defined in the Linux IRQ API. However, looking
> closer at these specific cases, we're actually reporting events that do n=
ot
> match the interrupt type requested by the driver:
>
>  1. After "ok 1 tlmm_test_silent_rising", the GPIO is in low state and
>     configured for IRQF_TRIGGER_RISING.
>
>  2. (a) In preparation for "tlmm_test_silent_falling", the GPIO is switch=
ed
>         to high state. The rising interrupt gets latched.
>     (b) The GPIO is re-configured for IRQF_TRIGGER_FALLING, but the latch=
ed
>         interrupt isn't cleared.
>     (c) The IRQ handler is called for the latched interrupt, but there
>         wasn't any falling edge.
>
>  3. (a) For "tlmm_test_silent_low", the GPIO remains in high state.
>     (b) The GPIO is re-configured for IRQF_TRIGGER_LOW. This seems to
>         result in a phantom interrupt that gets latched.
>     (c) The IRQ handler is called for the latched interrupt, but the GPIO
>         isn't in low state.
>
>  4. (a) For "tlmm_test_silent_high", the GPIO is switched to low state.
>     (b) This doesn't result in a latched interrupt, because RAW_STATUS_EN
>         was cleared when masking the level-triggered interrupt.
>
> Fix this by clearing the interrupt state whenever making any changes to t=
he
> interrupt configuration. This includes previously disabled interrupts, bu=
t
> also any changes to interrupt polarity or detection type.
>
> With this change, all 16 test cases are now passing for the non-wakeup
> GPIOs in the TLMM.
>
> Cc: stable@vger.kernel.org
> Fixes: cf9d052aa600 ("pinctrl: qcom: Don't clear pending interrupts when =
enabling")
> Reported-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> Closes: https://lore.kernel.org/r/20250227-tlmm-test-v1-1-d18877b4a5db@os=
s.qualcomm.com/
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>

Patch applied!

Yours,
Linus Walleij

