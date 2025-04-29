Return-Path: <linux-gpio+bounces-19443-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F04AA05BE
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 10:28:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 610C916613C
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 08:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20A25284694;
	Tue, 29 Apr 2025 08:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fk24WV+J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011E127C862
	for <linux-gpio@vger.kernel.org>; Tue, 29 Apr 2025 08:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745915296; cv=none; b=e4Yhmt8UUr1WeoXoHEGMHmHRkQ8c5wc/ACBhcsBJptTNoTsRAgxA3+D7zzjNACIAoScLhmW3f2f78mi3OVvexwLDFoAlX/tFxlQ5yH78GxG6ee8uVSHY/C0oq7MueqdPqy9HPhXqoXUTAboDk1wYDJk3EPZ1h80zGAqda8mD3eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745915296; c=relaxed/simple;
	bh=MU91rq6x6AMWRP8hSHtEK8HMpJbScePsSH9FDG38Qdo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uc4ayQB+IpGjzVEGeF8P64en/rExudd+7+esYhUlD6DR5NLSay8FTOPBu1Lj6WYcxlftZWLcgf1VQJFnF2yMFuLKLBEq3Nos0AsDK095rSLJN/YAIMNiAPQnxN8OewbxfCN1iADefYx35+KC9dzoSh9SnrZqlRoCd+g7XWDOTwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fk24WV+J; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30bfc79ad97so73440071fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 29 Apr 2025 01:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745915293; x=1746520093; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MU91rq6x6AMWRP8hSHtEK8HMpJbScePsSH9FDG38Qdo=;
        b=fk24WV+J6KW10tWbbqU2BsRFu5BGpNaxjtT2QXApK39EK5FBDTijtCTmVG7hB/qgqY
         BX3g3bZc8DMJyrZjnE17T/gKusSSV39cIs/GDhS0rDmtL26hEihhQymCrC3VmwZUGHuI
         eww7HHTRPf7d6VFB599wkPndRZBUr+3zWjRcv5oRSITZqt5oe0GrxgoDmULu3tP6mbVY
         hh/UQjNR1FNmAT3hUltrjI/ONXuMqE6/Opyy59bYMbV5hs1FiI0t1D0yjrqeKEoCeQSK
         c1Fl1EoQ5ET00+enQycOTs0TCCVLCGo2cPJfGkqeZcL8o7Mmyp6hQ5rfPFxW8EUMhveG
         p+MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745915293; x=1746520093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MU91rq6x6AMWRP8hSHtEK8HMpJbScePsSH9FDG38Qdo=;
        b=IiMsQl9U/XtiGlXKoswwHAA/zxAcEJwruLKyQ+0+O8Vyt73ebjq+ghaNG6mrHxpP/y
         G9QVKpfhwE7BIJzlzB1v13ESFGWc6TAdfnlyYH/s+9GQwz02mSeuD385pFKZPmzN6MPb
         B1n2loIpparYacjGAcp4uCEAAgS9OP6ZOKHkTngAT5WRqH0Qih+ZJVXpKXaQZ14TEHFL
         IoO73Cpf93Fs/mj4Qu2s9BXE8zUk0fmFIuZttQqJneLpUJFFWGv2rGuS1bhx+VVdjYsl
         kOJmqF8vhoit1747oYdusMjScdtUNKiofhE8nCYrBX033he/ydX1Pu4Cu02E5G/uO5xi
         OW5A==
X-Forwarded-Encrypted: i=1; AJvYcCXwabnnaFLjS1MwAbRV6D4b1nU+KFU991hBD+jrKg21/ZeP6DiVs0G88dOG5oSEZ4Tca23hmfLHKDa3@vger.kernel.org
X-Gm-Message-State: AOJu0Yya0ij2slaXjYkvFuwxQpP+VztBU7yx+QG5/aK0Y3wd2ohffTs9
	g9kxxthZ1I5BATJ7Y1cMBNqo89IV2A5UvMU7aqzvLAV4woczkNkCeX5qAWknGUYADprKCwOxb4K
	pmMUoO1jnlMGISTh8UaRzwG1wWh/zC6qjM0dtmA==
X-Gm-Gg: ASbGncv4zAtk5pY3tL8oepFXCwQvJ87w8R1qePXfXOW1Urd9LztAYDsAoRaAF6As0L/
	pJIlqdVWW6Vr99OGRmWkXWCEpwl33TPepu8aH+lMoyGHIyuIc5pX0U2cKJJVSnbcz8x/usIzPrm
	7OKX9BQfm+LvqiI6IUaLmWkQ==
X-Google-Smtp-Source: AGHT+IH5LFe76433BEhCOsz93hsXmpw541f+gjc8j0FntokriJNT3ta3i7KCJ9pJ4v6e9KkWJAHiRLsRkg2/T2I0yMs=
X-Received: by 2002:a2e:a915:0:b0:30b:fc3a:5c49 with SMTP id
 38308e7fff4ca-31d45e2fefdmr6111831fa.9.1745915293027; Tue, 29 Apr 2025
 01:28:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-pinctrl_sm8750-v2-1-87d45dd3bd82@oss.qualcomm.com>
In-Reply-To: <20250429-pinctrl_sm8750-v2-1-87d45dd3bd82@oss.qualcomm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Apr 2025 10:28:01 +0200
X-Gm-Features: ATxdqUFs24UJ9rCBZu0rld2DCgQQfVXx4UwFsW9Kaw9n5MBKTnSUAjPVfLDjQgc
Message-ID: <CACRpkdbyZjfU3dh+3Cn+hDr6Pisf9iOQYuN=mAjrE=+OE0fs8A@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: Fix PINGROUP definition for sm8750
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Melody Olvera <melody.olvera@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 6:02=E2=80=AFAM Maulik Shah
<maulik.shah@oss.qualcomm.com> wrote:

> On newer SoCs intr_target_bit position is at 8 instead of 5. Fix it.
>
> Also add missing intr_wakeup_present_bit and intr_wakeup_enable_bit which
> enables forwarding of GPIO interrupts to parent PDC interrupt controller.
>
> Fixes: afe9803e3b82 ("pinctrl: qcom: Add sm8750 pinctrl driver")
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Melody Olvera <melody.olvera@oss.qualcomm.com>

Patch applied for fixes.

Yours,
Linus Walleij

