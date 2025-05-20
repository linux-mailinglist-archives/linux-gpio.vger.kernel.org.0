Return-Path: <linux-gpio+bounces-20367-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1EBABE63C
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 23:43:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C17658A2903
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 21:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2800F25F782;
	Tue, 20 May 2025 21:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WbI0Y6mV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FCE25EF92
	for <linux-gpio@vger.kernel.org>; Tue, 20 May 2025 21:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747777403; cv=none; b=XfeUqKCixEXY/3x6/u9ZSt1XBsWjv/m67GFHwb1Z0A+p1MzFtuHpyHlOp1/EuWZiTE6fxaZjj3D0hvrFm95tDdBFHPbFzyR6RWHqPTKnSTYEe6CzXMvZ+fRLdsqzgVa0bMuKc61+QSim+yz0zB/QMMToaXaENHN6iEhEx3xPR5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747777403; c=relaxed/simple;
	bh=ZkzIX6B8EKK8PhGVq8MydiP2lp2DU4X5qXSyT/4mJuo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i0aCG5tqht54VNPx9j5QSRcKdod6jWaMP+tUhG1SDezwy/yc1YyABmuR0gD8P++PKuiCCbS3JiPo/xhcUydEWGbCV9wO/E93II028cecTUoC0huZau1QRTeXDGXw0XERvGe+KRH4qLkZVkLuhqv33n76v++E7tK8EI9xORkzRDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WbI0Y6mV; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-551fe46934eso1272466e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 20 May 2025 14:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747777400; x=1748382200; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZkzIX6B8EKK8PhGVq8MydiP2lp2DU4X5qXSyT/4mJuo=;
        b=WbI0Y6mVNq1oydgnPoFVdKTl6U+8hIH+/PHFaVP6/L3EWF4ftYP4KWNrJ5f0Gk33IR
         CDDpGO3ySHVj7FRTjwj4fZhBGkWARhHKr7QKNdOu1M20ZvV9Y/y7qcNByRfJZo1HhsPc
         kc5w1vJklwyoyj2W8t29dOSZWfG4VYr8XvzcIcB/VG8gwMp9Wa5E+tA2kl9qmxvVUrET
         jj2JPox5+0Z32QAnPMmojlEiO7Q60BZ4nE3/UUDqX2cCPHGzvgaYePrGBHfcwLTj4gMM
         95DngqU4eWOo7hl3taHWqCFY5A0tq8Fv8WH2e+174sNC8F2w1IDObrJef1Ig6E0i90U+
         8mhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747777400; x=1748382200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZkzIX6B8EKK8PhGVq8MydiP2lp2DU4X5qXSyT/4mJuo=;
        b=fLEnOiq8L0D9no5RxjTRY0mEcNb1AcxEltAsgg5wVr98CbjrA0yWc9djWxV+ThfEme
         OUg91utz8VWDdI23HxyavNGwQj1MlGBVhXVCQvtLnoyfbRMxuOmU4yZk3LYrsU1VxhFZ
         PNxATzifVMz8QWHuTZxRRbGGO2ih7owhRTCpuEdytJ+7dJl6HA2hdqGkl6mdtyuyMVOr
         q/Y9w40IRLluo3RCAt1MiScoSpmituebaZdITNhG/e4km/rGq23Er6fafsqB3JR4N6c6
         iy0igsJLl+mMjAQHu7MtczIoXsWiBRyYgfOXAtet53e+7N7+WNaSr3H9lX/UWp+3NLRL
         bULg==
X-Forwarded-Encrypted: i=1; AJvYcCVoFv1g3prnksk4pcEdOJWKh5RoQfqY1onQOy1IwFuZuw920cIfNKvbv4/nC96ci/nPh+dK8e50ETeM@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1FBXA9IRtNpaAj45tWOugeCOfcvLMeF6hkd3//UWGXSb0ALVL
	xxEa8zkkpsHI2f3QYLxB879w34wuYZGrYLkKv3As+phCAtYh0dexy+lt3eYk2rm3TBuj8ghi/WI
	O5b/e7q72KHk5et74el0TDE8jmNYx6/XkeTh+Ye+B1g==
X-Gm-Gg: ASbGncsp9gQ3qB8ZDaUpsjIsCDrdR2kn/nlxvIbnZ6is3uRMiA1G/knoPd2qlgYfwAv
	wPzugDInGN3KUxjlj6S4JCn0u7dKY808uQo3W7C3522HZpGCQvhxKn6WHGcePCvPlDIcLX2H0QZ
	jL43LW52yMfg3hHhzwzfacPC+Vnv/ZK/Tg
X-Google-Smtp-Source: AGHT+IF8sxYQYwPs1M87QK3eMhV+cFNvlhWyc3i+7XrWnhigNXZ8VV0IgUxf6qNyKDjghUzFOKBHeIzo7cNE1x0xtVg=
X-Received: by 2002:a05:6512:1383:b0:551:e99c:de65 with SMTP id
 2adb3069b0e04-551e99cdf40mr4151687e87.15.1747777400193; Tue, 20 May 2025
 14:43:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513-pinctrl-msm-fix-v2-0-249999af0fc1@oss.qualcomm.com>
In-Reply-To: <20250513-pinctrl-msm-fix-v2-0-249999af0fc1@oss.qualcomm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 20 May 2025 23:43:09 +0200
X-Gm-Features: AX0GCFtiXGv3w0rhSo7VfJ8xdUZJIxrZrQmBXgjBoZzWgZEfr2JdrMnuBSFAqXQ
Message-ID: <CACRpkdYbzxsDJm=h+vzCcj=LpY9EHfu67otV-Hfv5r5owJhxQw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] pinctrl: qcom: several fixes for the pinctrl-msm code
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Josh Cartwright <joshc@codeaurora.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Doug Anderson <dianders@chromium.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 8:39=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:

> Fix/rework several issues in the pinctrl-msm common code. The most
> important fix is the one for the gpio-hog handling.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Patches applied for current.

Getting them to Torvalds as soon as we see linux-next is fine.

Yours,
Linus Walleij

