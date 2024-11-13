Return-Path: <linux-gpio+bounces-12966-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAAB9C7359
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 15:18:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A81A4B2C126
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 13:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E1C0202625;
	Wed, 13 Nov 2024 13:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="imgopd3p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2D72022E1
	for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2024 13:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731505600; cv=none; b=JAJ0mL2PQx7GI1dfhOEnRdWGkTCQsM3UVjtB5R4trIoxNY/zCCKUUtZffJLwWvxlqN41iGkQVeJneJblWZNli25jDKOsDALn02oinCIFjskU9eYF5PiCBuXENhQmH+Tb7z2SbXYNPLF/lghZPFtooPHaBVj5Uj26YZXVqsIOkYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731505600; c=relaxed/simple;
	bh=EdLD+Q8pDtxewY4WF3zggOuWnFq3zsa0mjLSXKPIkec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WnLFDU6hjpctbAHs9q8pU1QclDrQDZvXHhGjP5N7KLoGaQmPq30ALatS0fhYGlLlTsriWomSPY/4cISZG/DC9eFoPBVzI5XESPoSbm4OvcSQxJJYeH63ywMD+GX3Tt8XPktSM7w9zho4DjFDvXhYKQhDxPsXND3lLu1yACgTm4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=imgopd3p; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb5be4381dso61204381fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2024 05:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731505597; x=1732110397; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EdLD+Q8pDtxewY4WF3zggOuWnFq3zsa0mjLSXKPIkec=;
        b=imgopd3pnBZLYjb72bdPfPpUU+NdDrw4BC5AhWQw5pfagVjMIp8UENu0HmEFL5RbIb
         /pAeZH8bUcai2ufP4rTmBGHSjf2uB7p8BYk9vXvbbaRdRiV+STSFKBnw9tANQ4Z+gWJH
         zjNYYs4TsU+hUmjl5GXeq67lW9Y6RaJmLIribn6mmCNZU9jCdKodan3rAnpNZvcarceA
         uKvJoOMlzPDspcmrGdFEMwrmU1iC18LgmZJVYC+y4Trvv+MF7CuEcvxFh4bCIoD8kRTc
         /ESWvzuwOpBvfRofNKXP85CIX452SKBwDOoQEVF7bEann2d12x5RyRjma1FJw3pzvY8I
         gaRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731505597; x=1732110397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EdLD+Q8pDtxewY4WF3zggOuWnFq3zsa0mjLSXKPIkec=;
        b=qmNol7DsjuJHT3ifqovWAbx3wplFM9qIawlL0boGtT76Qk3MSjvYNLvvcOzaA4vZNd
         J9HyNsXLGktSmNkNLySZS2T/KQIAxhnzqriL+XZLZ5a4kCQFaSs6MELen9ZC4aqVKq7w
         6X/71ZN4SP8kGicZMY6TEkGInYIEekQphwP5j5pC95kAl/R+MIyFWT90kHtdlw9Q31L+
         DITOBa8+0tw0kZnv5WDbLQXQAUQOgI3YH5UPWdh9NAIHL2pZbmpypvouiRAS5vdSKaSu
         7Ei7azSrAM8NcK8rJEJKf+tv//AA1RLLAM/QO1+0YmJO/IjBipKA7fMiK1NDE5yyDw2X
         M3Rg==
X-Forwarded-Encrypted: i=1; AJvYcCVwh5FpVdlsDqEl/QHKsfumFjf9jy/vRIvCl0xTznKdrXQE4iCoylOIBdXPbRUtXOFXMqRCuVWEfLWK@vger.kernel.org
X-Gm-Message-State: AOJu0YyzsdVFBRpdzMse9Gf7Ro1uD93etxJJaknbIR+IEqyIMiofFR/L
	RnNfgc8yplD1R21yX1AaWTu9UClCvwbl6N7+kz5dr0x8E8ZWD4jAX0/k+h7ODRBucom9IQNMg2p
	80mXuL80g6KHaIDoB3oOhCt6Dgh8LlDzwka5/Pw==
X-Google-Smtp-Source: AGHT+IH78gKDxiLNiG3PdvB2QCBIQEbIx/9ikXcexsuPISd7pctKrNBtAfwjli1J6tIfmE7VP/Ox9gNfWjgsaotqPb4=
X-Received: by 2002:a05:651c:543:b0:2fb:2b5d:215d with SMTP id
 38308e7fff4ca-2ff201284e2mr97745341fa.7.1731505597462; Wed, 13 Nov 2024
 05:46:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241112002843.2804490-1-quic_molvera@quicinc.com>
In-Reply-To: <20241112002843.2804490-1-quic_molvera@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 13 Nov 2024 14:46:25 +0100
Message-ID: <CACRpkdZ8b5k9NHq1ZiNaofUg8_jKHEHvxD=T1GRy86Mb0rS2zw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] pinctrl: qcom: Introduce pinctrl for SM8750
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Trilok Soni <quic_tsoni@quicinc.com>, 
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2024 at 1:29=E2=80=AFAM Melody Olvera <quic_molvera@quicinc=
.com> wrote:

> Add pinctrl block for the SM8750 SoC.
>
> The Qualcomm Technologies, Inc. SM8750 SoC is the latest in the line of
> consumer mobile device SoCs. See more at:
> https://www.qualcomm.com/content/dam/qcomm-martech/dm-assets/images/compa=
ny/news-media/media-center/press-kits/snapdragon-summit-2024/day-1/document=
s/Snapdragon8EliteProductBrief.pdf

Patches applied for v6.13!

Yours,
Linus Walleij

