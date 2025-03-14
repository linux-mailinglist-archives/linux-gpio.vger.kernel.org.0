Return-Path: <linux-gpio+bounces-17617-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B9AA60F9C
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 12:09:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91FF63AD905
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 11:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 844AF1FCFE7;
	Fri, 14 Mar 2025 11:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m6hG0Loi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993871F0E33
	for <linux-gpio@vger.kernel.org>; Fri, 14 Mar 2025 11:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741950553; cv=none; b=BxEcTuODO7CORdhEto/00rjuDx0oov0FDJCR+xvFKTNFSl1movRbPFcP2H6HuXPaMz2vlccYr8V0qRLT7vm73yRf+5xrhezWqIQsgEjbCEAtrQRRguYkVz/eFcbTwyus6KgBcS1SWwheGHxexUNRyKfYWcK1NXyYVae+pSda4Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741950553; c=relaxed/simple;
	bh=MAwD1GtRtdpg0DZzKIDlnqc2cR1boIHlvN2IYDSCjM8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fx/rmd9sC0yxhC55VdkSUV2sxaPT82eAzaYykcQmymIhqUTi0IM3531GSjgE4U0LRZSjkApDdz+ntS5+92qNGc7P5NLrAv00pA67O3SPV+GRFGwW3le5YduJG4YG8hGOVgag8j0Vm5WQV50rdESSRRjjtO+22PNteMWp3NT9JWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m6hG0Loi; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54991d85f99so3168246e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 14 Mar 2025 04:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741950550; x=1742555350; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAwD1GtRtdpg0DZzKIDlnqc2cR1boIHlvN2IYDSCjM8=;
        b=m6hG0LoilCMzzgojzMDVf6zenpvMylGBfpavXWHCQdef7eY55MPvFJCssroITc8Ye7
         6GgIY4Br+E8GfbKyh4ciZ2dicFsLugUrgCZeyeGpxzZh+F8tGEF6u3QZqikjjllJChyU
         +PcnxoPTEfPJMUXCAIbK8okZIwqbdw8j93cgqRs5POWZPZu4C0L5SXWN/jRzYlanUuUk
         V++xXzwn9LzjDxFHd1zxrSYMSqQEh11CViOorklVWHALYIY5FoY4n6C2fb6OITfdQShZ
         jI2UKloN5gRZUJQoE2TfxKe2SPSUnIsCnTLIfHT4q8/Cx0IYPlJDG8ndLx66FPrya9yJ
         xfWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741950550; x=1742555350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MAwD1GtRtdpg0DZzKIDlnqc2cR1boIHlvN2IYDSCjM8=;
        b=ExHPNmzmsSvie98hwBF7yMUJ/IgQhQy7w6F8+GmCXvU6weTAHWXVG6knxMnc8zb+B9
         kFKfI4C8ZcxVZPcxPS39J46S1mXadW14DRnddJ4aI3G1MuA5XBuvlZnVEJj5k1drTDva
         ubSNroXaEF2l6lGIL/pyS0ToTCI7QIqky2giyMB4TyrL1c2n7B/b3ayOwaqXyAa54Ngc
         LNO9nHbQpSaBUiq0qAfIeAgdQaEIjs4I5yvNtSsb4lc/2FxEDREvOmlJz5/D17qRMUIz
         8ZYj4SXuKeV4fE8TfGGMqvvqRW9SbmoEe/xc4cWli//XZE3NGHA2R93WHDL1eMxlpDnU
         aSEA==
X-Forwarded-Encrypted: i=1; AJvYcCXa9EOftKmR6vuHGJRGoBr3IkB/FPZu4T7NLfzqcJeRs3jjDSGogmj8a5PnnhBnZsOn0Y20MWEbZOn5@vger.kernel.org
X-Gm-Message-State: AOJu0YxD/WtvOaZ9nYz4VvL9qstTDtVsswzTqJNifuMxeCEEGDysphUI
	cxgEbA/Zqpl+PhgPIBI84IiGhkee+Nd35+jjmHMlLDHKtEubtB7qWJPTcP5U5zvU7xi7LYcAFzz
	Q/ELYa4sJRQIsGrzGK1MYIUbIWWB2Nl7xn6qzOw==
X-Gm-Gg: ASbGncv2Ua4EEP0zgp9MsKRjATtybZJ3d8umBPmFRZ1D00sOQWi4dceJPq6VZIj6J6z
	UITwDxeMiO+18ClHyUXMb3l1xi2+mEz6XbUW1c+sl3YJZzKCrWxKjLZSRJ2q+dLay26ryIjXDWG
	fdDFvtsUHs3nVUoN7y2I+Se/A=
X-Google-Smtp-Source: AGHT+IExhx3X663308XXZlwm1c0/8LT2zEZAKvTgV6X9Pe3GenUDahAFj22+6QCmZWTu+4UGyOhFdfoHzjo57MlIqmE=
X-Received: by 2002:a05:6512:238b:b0:549:88b8:ccad with SMTP id
 2adb3069b0e04-549c3f97e1amr693966e87.20.1741950549684; Fri, 14 Mar 2025
 04:09:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250312072509.3247885-1-quic_wasimn@quicinc.com>
In-Reply-To: <20250312072509.3247885-1-quic_wasimn@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Mar 2025 12:08:58 +0100
X-Gm-Features: AQ5f1JqeFCXuNVd4MM_MrfjWEL2E41hAn6iGIfmUHWTfM1E_vGppRUa3h1NuRX8
Message-ID: <CACRpkdZ6r47jhGVVoLn8XzfuMKMrkg8nCcp6hMwzUnTUSTZEwg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] pinctrl: qcom: Enable egpio function for sa8775p
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 12, 2025 at 8:25=E2=80=AFAM Wasim Nazir <quic_wasimn@quicinc.co=
m> wrote:

> Add egpio function for GPIOs ranging from 126 to 148.

Patches applied!

Yours,
Linus Walleij

