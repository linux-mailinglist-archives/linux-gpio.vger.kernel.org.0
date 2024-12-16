Return-Path: <linux-gpio+bounces-13916-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DDB9F32E6
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2024 15:20:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FC3B18895A0
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2024 14:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D8AF204584;
	Mon, 16 Dec 2024 14:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m17/HW5I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369B920628F
	for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2024 14:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734358534; cv=none; b=PeHADbGlyuiBVUjSykgEkUFzOG1pE8p+Vdw1mgnGHShFucVst/u5rmLBEK18RtNHfL/33xF2yrplc/ak2Mvp8AigUdLkHXPUKXmLRnFIggfTaLhht5mwRXa2BGXTr2cpYLw175zPaLSTVoIy3Wvr8wWmeI4d2pJ7x+qKNxlmggU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734358534; c=relaxed/simple;
	bh=sTO6XsUM1EpoRAEqG+118QEinm0VU7febgtSY5QZvgg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=msPtNkZHziylaYe/ozy2NaX6aPQKRHSRumtJu2fl+x4B13aXVkZ11cS48A/MDTH9o9Z/atQ50q0H00bq501u3fjzZmsqq2XbR/HV/53WIjbP/4NynAPbm/Ym4yiQvgkkqKTvno6tql24Ku01B62NICMNObGdFZDmi2BH89tvFrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m17/HW5I; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53e28cf55cdso3726675e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2024 06:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734358530; x=1734963330; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sTO6XsUM1EpoRAEqG+118QEinm0VU7febgtSY5QZvgg=;
        b=m17/HW5IwrPEQZeBbryXELBTFih7Ga9IOKlDsoYGbyOiSwXbXVaqWz5exJYTrni2Xk
         umEvcaqQ1s66AnQFQdaLb0Qodv2+BGtJr6nnXwPl9T9RudE3PqfuKCvCSSEfr/WVezyB
         CCNYa7+OPtwYuKXg3Bbi+cUFghVUdPgTGACrOoTHow8JmRc2kM5D+mYE2pKpEPMhWrRy
         Y+7plP6et/zmWy8340E1pd6N8uPh7L6EZYTeG6sJOPBqqQ9VdChEmXw1pLxI9AEVtGcl
         P0a/MplRVZqPjXgm701/6wR7U4tD4zbpc4ecrs6gi9rj+yYU6b1fpyEGyuISAJ8/tq7x
         suDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734358530; x=1734963330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sTO6XsUM1EpoRAEqG+118QEinm0VU7febgtSY5QZvgg=;
        b=u2htABC6c7zVEeQTQOjIT60R07v/U4tcw2qOvolEaTOcNwdlbrEblnFBRktb90Z0ui
         1NAS4kWm6mvwoSG8TmHi3y9qqP/LAyimM/969UTmEEPBX9ebJboCBTznmo5LKnEw0GmI
         hM8aLxaELTkPdSHi6POLnAgiYOlLFZ2kKZjjJSwoBdYZnhbmZM2lVgRfUhhuYzXv/jNA
         LYHxniMoSF5ggUY/Chc1h3mDAgCEAoIQSzLs2T1mOcM328WdZ62T34UoKeWnV3aws5vo
         AnRW5jXhuJ7IiRZSqYDkpsw/7hIT0m7wHN0/8gkWDaLJpsmr8VZM6rBV9Ea+KnkZzTzh
         JC6w==
X-Forwarded-Encrypted: i=1; AJvYcCX+n+Dwwn7E1vZiyBsshIZj60GKiOa9wjrh21gRNAirsvTQmUJo4egF2DU7Wd0NmSVlYElJ97BnoxoX@vger.kernel.org
X-Gm-Message-State: AOJu0YwjpGx4bzRe1j9GbMoAOcF1k/Gzpt8pXATkvwGhVzOlQjpvjFX9
	8gPfd7OjQEggqM5NFkSzwUghtU/om630P0IoNSgx5FoRduH0k+CQnWxGcohj277kQV+6/9mzxV1
	lnUHqTTciaAWaBzENyzZkca3NbNMG60Rk5qasow==
X-Gm-Gg: ASbGncvcMQCjpQU38TTm87S+gbumSi7oz8DrzCh8+lS88LagLDIGSuJ+kKj8vL7jC3l
	gidRuw3+hDKY6Tiv1PB4fFCGymur2zFfHP6XF
X-Google-Smtp-Source: AGHT+IFSDin9hEAGn8eapDBqSokmqU+717wu2Ivl65JkmX77qI/TxAECHXYsu5Why+LBdm1Fd6dvz/dzpSuP0U1zgxo=
X-Received: by 2002:a05:6512:39d4:b0:540:2549:b6ca with SMTP id
 2adb3069b0e04-54099b71afamr3494300e87.55.1734358530311; Mon, 16 Dec 2024
 06:15:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241215-msm8917-v9-0-bacaa26f3eef@mainlining.org> <20241215-msm8917-v9-2-bacaa26f3eef@mainlining.org>
In-Reply-To: <20241215-msm8917-v9-2-bacaa26f3eef@mainlining.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 16 Dec 2024 15:15:19 +0100
Message-ID: <CACRpkdbNKqOmsO=Bownp9HNs=tZfiR5rO95G50oJTo_jnusoAQ@mail.gmail.com>
Subject: Re: [PATCH v9 2/8] dt-bindings: pinctrl: qcom: Add MSM8917 pinctrl
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org, iommu@lists.linux.dev, 
	Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 15, 2024 at 12:15=E2=80=AFPM Barnab=C3=A1s Cz=C3=A9m=C3=A1n
<barnabas.czeman@mainlining.org> wrote:

> Add device tree bindings documentation for Qualcomm MSM8917
> pinctrl driver.
>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
.org>

Patch applied to the pinctrl tree.

Yours,
Linus Walleij

