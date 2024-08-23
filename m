Return-Path: <linux-gpio+bounces-9086-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A4895D2FE
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 18:18:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAFFF28990B
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 16:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2962118BC26;
	Fri, 23 Aug 2024 16:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DWFSueRH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44ED618BB86
	for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2024 16:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724429788; cv=none; b=kGrrABQ/lnoFMuuK2JTzgawjYLBbX+0Rb1+xoUfjz1+YNJM9nqaxIfkyJmUOD53HhwoLCHxBeWCEEp3vPCRkIoeU7AD+M1uqdmPVlBqoSuU+Y62tecz7osKxsWICTruYx0C0o0yCJb91i7tE9Tw7tLyvOhDyYWQDvvBEOF26On4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724429788; c=relaxed/simple;
	bh=MGClmCeEP0HXyMUOWkT+lYMrNWdOMftY0DP5vSj6WPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YHaIl3o6jk4iIW1O08eStdWCGnLaStUeXWg2ZEO/IMpbVY6S/CZTizuhnpNYaLp6fFl36yCiq72Wv4b9RKF7XYoJJOkot0J8YmpBOvDlzMa5FZ9bPadLNY6//JcLerJz4pa/WyJjJ+8KBOucTpQgI9W8iCyueolvpNUOOBQyI1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DWFSueRH; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5334c4cc17fso2922974e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2024 09:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724429785; x=1725034585; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MGClmCeEP0HXyMUOWkT+lYMrNWdOMftY0DP5vSj6WPQ=;
        b=DWFSueRHieD45F+n8Tt4s29Sv+yd4pMcKMxpt40WAE3Ay2iH3veKfLK04f3pJgpIaK
         hhgo6SDq9xf5lk8GV72KE/VFiT5AbJNG1d193yE8WGRm5nbJYO3JY/TYACDGp/xG2Vos
         tAcf1G54ib3yywJI3Ka6IoOsS1HMHXXph6bfxHLp+l/W5rD5Z8XxzDRt251Sk1uush5I
         JJFdD+SgIhkg85tU61CiqXReLX19b8GfkDXZF0cuWM02wni4DCQes2Vevqgju8tBgftQ
         k28av1CDpqnab7BpaaoY6wlNp/tm6Xeln+FLegra3qDEweWIf0mFkQs4CGdBvR7HWn7f
         n2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724429785; x=1725034585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MGClmCeEP0HXyMUOWkT+lYMrNWdOMftY0DP5vSj6WPQ=;
        b=fUcn+du6GBEykYvX0PAeEdpq7scBfp3Ec22u2OFkkBsf0kTQL2DVgLaPMsqP58rE7m
         0SRab/+Us37NPeg1DDXst77djBZmcvBZMTleW/gx2O46d9bcwUBKleCwC6q+xz5V6fYs
         keWJPPyHKmDSod4HVSsHhBRocfYnBTt5rO4DdudB2dIsyk+i/Ss0k0Zbo1QEaUSG8gsl
         9eYR763B348WCelDsG5SLgvTebO0zw62hh5G0aZdxWK3aFm+W+N1IG6vfgfLUu1857R4
         TZGdhyERhwaDEYLYs06rgA48ozl9Pb4Wor99mLqb+7e5fXQyoebW4Je/9DdBK7qRoO65
         6pcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtgGuEsicNGQI4Opdygptl+06BBp4RLg590Z+GhZakRN/6VTZZR5U5ajsyz7bRgpN7J6WtMojflOwy@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcb8j2QpnX0/TIz9MyHZjFxeFklCn9v68UiThbAyj4VcnmyCfM
	Pl9JKi2+lCe1l9q6a/oNE/l9bBwn2iixyvHO2Or4GEWMcIjLnWecpfiM28BJOJrY4ZLdOC8SLJ6
	d05gK31s6hPDeFmmxHzICGCncF+tTTOc34Cg+Uw==
X-Google-Smtp-Source: AGHT+IHspvXB/tGbmLkBqEhQCgkC7XBBDbpWT6LUntEQlW1UijvLDCKQ5afYQnptsKLM6cReVB2QWCm8j1h3WRMii5k=
X-Received: by 2002:a05:6512:33ce:b0:52c:e1cd:39b7 with SMTP id
 2adb3069b0e04-53438755465mr2335456e87.5.1724429784893; Fri, 23 Aug 2024
 09:16:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240808162750.244092-1-festevam@gmail.com>
In-Reply-To: <20240808162750.244092-1-festevam@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Aug 2024 18:16:13 +0200
Message-ID: <CACRpkdaaM_JHH-E7t=TX-3M-Jx3VDYdKnsMvxH7fwDqBCAwm7A@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: imx: Switch to LATE_SYSTEM_SLEEP_PM_OPS()
To: Fabio Estevam <festevam@gmail.com>
Cc: aisheng.dong@nxp.com, ping.bai@nxp.com, linux-gpio@vger.kernel.org, 
	peng.fan@nxp.com, imx@lists.linux.dev, Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 8, 2024 at 6:28=E2=80=AFPM Fabio Estevam <festevam@gmail.com> w=
rote:

> From: Fabio Estevam <festevam@denx.de>
>
> Replace SET_LATE_SYSTEM_SLEEP_PM_OPS() with its modern
> LATE_SYSTEM_SLEEP_PM_OPS() alternative.
>
> The combined usage of pm_sleep_ptr() and LATE_SYSTEM_SLEEP_PM_OPS() allow=
s
> the compiler to evaluate if the runtime suspend/resume() functions
> are used at build time or are simply dead code.
>
> This allows removing the __maybe_unused notation from the runtime
> suspend/resume() functions.
>
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Patch applied!

Yours,
Linus Walleij

