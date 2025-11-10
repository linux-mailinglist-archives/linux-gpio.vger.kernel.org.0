Return-Path: <linux-gpio+bounces-28326-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 034B9C4957B
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 21:59:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC7C6188A872
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 20:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E39E72F5A22;
	Mon, 10 Nov 2025 20:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NRxCRWZr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEB32F5A2B
	for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 20:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762808266; cv=none; b=fOaAmy4jAMWR2Izs11tt5m9rATWmQ80G7rLb9ISgOJxo4MNtbkexkby8rlH8nhzWaVotU4GDIr1XQRitpdjtfTGWdnC6iE/NKKfTdZUeuIGF1CRJi8ylkQHfXSMIsqYpgF2lXo1mrXv6b+jIAxopcoQVLPgMd+/Eoikz0tQpyhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762808266; c=relaxed/simple;
	bh=EMkFach/QW4lYNE6AmvM9HnCCahChKAdwsSK9+U2fRc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c1NmWYIpOLiaCTvup+IVzY4SaVBZcnPeGdCum9lqM9wCUGxK8xvRqVEvsQ6Fass+mJysY/eulmJzMvclDMEswNLqYc+URKTZyU/wsff8G6ZE4Nsy26OoY2rVfdD75J4gWoxemFITQLBKdLQ1VQywjWuHxbOF2SOMHsPQrrBozCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NRxCRWZr; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-37a2dced861so1519621fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 12:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762808263; x=1763413063; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mh/JsKiFmpvDenrO2RV6pyacRnngWdajIKt4QMpWgfw=;
        b=NRxCRWZrHXnwtg6qXEtxxQ+QMCxgBV9+plu1durTIcxBiM7+2UXavjPov9hOqOv5mu
         4dVdgTTvswiNadLbAKzX1oJEBfaRz8Ug/SKcCUkbPrQQj9foRQB0z3JHhESku0vxfw+c
         tzC3N/oCcoGD+mq9Z0MwI2/lYUbtoPKWsmretsoyPDUFGqDXa+c0Gwkl6POiEPnflJ7c
         85/rweXlKlreJ//KppqbmBNvZoSAi6peMnSFaCxryGFQPQTJ8PXHyey/qAYvuNCt5GvB
         CefYiSRfPdBmZw0NiYFgBF7zwJQpWc0/CWHnMxzcMDQCmJpBQIWhquvlu25DVS653mNY
         7rQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762808263; x=1763413063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mh/JsKiFmpvDenrO2RV6pyacRnngWdajIKt4QMpWgfw=;
        b=NVoEcGXkplv1q+J3hOYG964IlPfuW1U4IZ7sDKe0ujlx3gcEq9Q1Xzy3OEz3e4ROkG
         zqscwKTuhDGCIhN6+mxws80uRquEgYcCsNl3CfYakC9qF/kRIkGjp7G7g5oXDRdMR0yh
         tJH+ra+lzK5R173QP8Gx3h4cseSFDrom3rQ/xESSRFmOrSSqt07jNqxddtssUfJMuVAy
         VmLnFkJoPuoFiwHCmny0QC7pMpDmFimGpGIJtUqK574pmUDroxFXvcagtZpJMY28Iw58
         4p7FpJaTZBNPCcX3nS0X3oGK3CO9nocZFpUxI+BjdHCZI2Vunu6My6h94P2b9UGh7LfB
         Kliw==
X-Forwarded-Encrypted: i=1; AJvYcCV1cE40g2FQ9IXYnSXcw+jkr5EiryZqnIOQn0E4ZRckRYc6KAC8HY7XRVhHf44YQdowFTxaXDNXO+Xt@vger.kernel.org
X-Gm-Message-State: AOJu0YzUrNHyMJjkNOKJrqqvPx3RfiGiJiH6pzb6T/s+2/ZISgIp3YSl
	k8hds2/CW7CiAo4yzPcTEeDahWZqiOkSycuXTFbMOOH7+JqVycfryvLFJbN1fMt226brmLlGzlP
	5e3Pdq7eNW1UkzRx/2i4WDuiGBWhwIqwv0IKW5YZq6A==
X-Gm-Gg: ASbGncuXXr3y237m3o4DeV5gK0Ehx/jgCdCmYx0yBY7atrMi2hGGtkUoBhD9cvZTC7U
	yRjcShBF+Dy3RVsiYh8bgagvvR9GDmjVYZKBhTmejB4vOss59lTPP5d73SIUt/pSuwU1tlrjoYl
	o5sTlTBqf4W2J73/PN+Q6Zgq5e5MpnPpqvejXaNTlLdVsFp4fGVkLnHYN5LZ15tmChd9+SR5pOY
	7Ng1cUVjhedYyoCb82Tp4yKYWhzSS5czXyIJzrLzXFz99vqm/BPTXfvmhxrUknMLcks69Y=
X-Google-Smtp-Source: AGHT+IFHiFVtHs99mXmuYb2B2m+2rnv0hdsnrgmUGdiZxDbZObBH5hPXt0Fy2L1RfDUF3gekviGcSla2Cs8MXuCvEww=
X-Received: by 2002:a05:6512:31d1:b0:594:5d87:af7f with SMTP id
 2adb3069b0e04-5947459355bmr191945e87.4.1762808263115; Mon, 10 Nov 2025
 12:57:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110202748.10090-2-krzk@kernel.org>
In-Reply-To: <20251110202748.10090-2-krzk@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 10 Nov 2025 21:57:28 +0100
X-Gm-Features: AWmQ_bmB5CQero0WghGpIbdSZsMKfEtwVkS8ALsJg7LOxphzKT9kTeNJBD-rCAM
Message-ID: <CACRpkdYvPS=WDLuUiEovtSsY=3JDqjb+8kKDZK2=FTj4n+qs-g@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: samsung: drivers for v6.19
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 9:27=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:

> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df567=
87:
>
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tag=
s/samsung-pinctrl-6.19
>
> for you to fetch changes up to 3cfc60e09bdc95483875f0b63cfdc23aea67135b:
>
>   pinctrl: samsung: Add ARTPEC-9 SoC specific configuration (2025-10-13 0=
3:02:21 +0200)

Pulled in, nice to see some conclusion of the ARTPEC work.
Thanks for handling the Exynos pin control!

Yours,
Linus Walleij

