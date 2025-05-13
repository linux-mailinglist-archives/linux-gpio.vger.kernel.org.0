Return-Path: <linux-gpio+bounces-20047-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A85BEAB5550
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 14:54:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7FB94A42DB
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 12:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD8CD28D8DA;
	Tue, 13 May 2025 12:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UXb9KiRK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BB528DF54
	for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 12:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747140847; cv=none; b=O5/l8rH3l0RBXlES3MwcizB6Pb63bpkbnFgcFUf+a2X/OIhoC7cjamMfNh0dL4JKrbo4gYE+9Y+g3oo0ZCj975rNmxpx0geCG1TuCTxnLSrypZKgfijpon33nVJ3fkgVxWKIdPaJ3AJrxUSsN2kzAOPQk9mUCRqnCTOyn81IFP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747140847; c=relaxed/simple;
	bh=n5DNtYUI843g0yIiLjFDVuZwRILHtDU6heRbq8kkdJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NR8YGhu4TVoB2fbpbIVdQBEJh8iQhAHdiDoID6nxB4oE1cez0gIhub76AcuETx09GT7q86pjq8xYevsRC6oaSrI+NO7k7HNUcMl6dUKlrxpOTje72BLZ8GQmh1B9GZ7ZJK8WEky/goltpxHk6VmA/WZCKFAjqr9D2NBTwh20Rg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UXb9KiRK; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54298ec925bso8044593e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 05:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747140843; x=1747745643; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n5DNtYUI843g0yIiLjFDVuZwRILHtDU6heRbq8kkdJQ=;
        b=UXb9KiRK1Mtk9YdgOh+42d6H9idbQx84M1YAAZ5IzgtH2EZR8jVbedfnrWmmCwqHHk
         9CDf/1dlixns3zmA7zJpRwgFp+x9kBwnPZC6TmVAVjnBKzGgeMkr+B8JjOoOTxheNJN2
         A0/W7WRk4faW4QTxLTQSaWNoxanijP+LGRJfIej0VwubSkXh30WDHv0a7mNBCD23Vwmt
         FDjJYL7JC/pr/sR1AOSk1ov3bhotZgrA16vU1aSmYvF8rZ31mx3/Y55voj0MzisrgJ8z
         w8F4AMKHIviet5eKkB7jF/DPx3tnxrldK8roph7EXTUX9Yq5sjXcW3+arxw7oFo+zb3O
         hhNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747140843; x=1747745643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n5DNtYUI843g0yIiLjFDVuZwRILHtDU6heRbq8kkdJQ=;
        b=MoD/3m6/XYxeHp1L6GiNZh7jnxFNU+fJsI9Bw0m+0tgInN9wRNu+VZPLR6wFrVVydB
         sg4fehvXASt1Ezre8k5mjtM+zImZw1YhsaX6aTtVK0SXgXT33mBTCaPcV1ZowoSnXQcZ
         Xykq7wfHxilWn2B74aMOvzoA8NgB/bHE7i392EtNtXX32K/RM6XyNxLe7Vr9hOUexTUd
         zmYrwGHRGOz4OiZDgByKq2YghkbNIiYZwWe5B94K+TP2f9Hno0i8Jz4A8wXkFXzkDrZd
         ScVMHrsjI2QpqE3PfCDeMzYZtjRen9TGOAxK4RyET8vb5Qiitz6WLUGT6QmCePCcq/lB
         EoiA==
X-Forwarded-Encrypted: i=1; AJvYcCUR1MUmR6PphRK+74yiYFx2fAWq66FL/j3fvUib6oYxe55uHNd85oQhfpq17D1MeTGb0O8KZLZ8oO1b@vger.kernel.org
X-Gm-Message-State: AOJu0YwlOhUH6rE+ydHCdaBZbT6RFpgfx2PlUGMSe4J7iqKSUlbjTaUt
	FeRKdSVNtvngc7rtboTzw3smCVAKZe7Aof1DxOHSNWMt4dCXGOdoBRas6rjbCzhavOtW3HfK8k3
	kxj5R7tozmgd+RRg41ay29Ahoxzptpf1uYNDyPg==
X-Gm-Gg: ASbGncsWJtuZ5klRBCLpQ6ESeqocIqf9CfjhjUNUwS4yBmZRlTwOjlfC3z6PUiw7hil
	HrTtmMFkgdqQv1bWseewfp7LiW8Gb0p+RiSyTiTM5PvyYiil8ODyIh3t9yIGvuGJuDRfZ5JVr2I
	uRYDBCUj04FUg3rokx8Xhv9kgMFMSd/Z5V
X-Google-Smtp-Source: AGHT+IFZsPaNB7cQG5TO5oVxZDZD/YN8ybgCpE8L4Y5f1+vnu87em/ryPwHwzngIjpOkdu6PynjrJ2CQaef5h80Qtm0=
X-Received: by 2002:a2e:be89:0:b0:30b:fd28:a771 with SMTP id
 38308e7fff4ca-326c43ed095mr69137661fa.0.1747140843144; Tue, 13 May 2025
 05:54:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506-correct_gpio_ranges-v3-0-49a7d292befa@quicinc.com>
In-Reply-To: <20250506-correct_gpio_ranges-v3-0-49a7d292befa@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 14:53:51 +0200
X-Gm-Features: AX0GCFvfxiAiOF97d_g8FaMONqLX8vuoL3GFla71xwbaspfDFQXlOOP7NTUarN0
Message-ID: <CACRpkda57USe-6zkYKsOfKZcfZx-0DBa-dP2OxkoGsy+tLfHxA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Correct the number of GPIOs in gpio-ranges for
 QCS615 and QCS8300
To: Lijuan Gao <quic_lijuang@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jingyi Wang <quic_jingyw@quicinc.com>, kernel@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 8:23=E2=80=AFAM Lijuan Gao <quic_lijuang@quicinc.com=
> wrote:

> The UFS_RESET pin on Qualcomm SoCs are controlled by TLMM and exposed
> through the GPIO framework. It is expected to be wired to the reset pin
> of the primary UFS memory so that the UFS driver can toggle it.
>
> The UFS_RESET pin is exported as GPIOs in addtion to the real GPIOs. The
> QCS615 TLMM pin controller has GPIOs 0-122, so correct the gpio-rangs to
> 124. The QCS8300 TLMM pin controller has GPIOs 0-132, so correct the
> gpio-rangs to 134.
>
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>

Patches applied for v6.16!

Yours,
Linus Walleij

