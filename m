Return-Path: <linux-gpio+bounces-24535-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE4BB2BEA5
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 12:15:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 567F97AC721
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 10:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAEE37E9;
	Tue, 19 Aug 2025 10:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e6vMpkKo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CF44690
	for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 10:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755598496; cv=none; b=qFw1bxomRDmcS4Y7Fa5gR6PuOD04QOf5GMRE+YOrJtNEnWfDiUlvspurV6SVxAZhOSC8/yLDdY3Ck/vV0A/drpfaYVDdVvTK0ef1yaYUXithV5kp1KzdGFH0FCnY1aa2iRYv7Qj2hTNeCme1ZKjllUaQmSS8YTRiDzq2IN1wjWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755598496; c=relaxed/simple;
	bh=xs95ecbsHBS98kdZmQYC1sEgD29qwsaCQXTwkKAmBZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k5N+FLWHazD0ivZ3bg/weungjPiT1H39jlsbVW/wOmtX0AhQCjH9Knqu4HB64JUrP//YVyQKYWge8va8N4N06rUedY+o/zvEWDzR3GchheCvU5DDLDMtBUBMbuKy2RopdBk3xemBdE0Sq99NdTO1TppxJZ9dsyXz/fsU2dqEszk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e6vMpkKo; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-333f91526bcso37113111fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 03:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755598493; x=1756203293; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xs95ecbsHBS98kdZmQYC1sEgD29qwsaCQXTwkKAmBZ0=;
        b=e6vMpkKoNoVB00do+Kh/e1XkOGESIfpZsHBBRBqpNWr5NCa73X0HlB004zfYBBVFcB
         HytRO2aVmRhgEhAAS9vn5Z461VW0kDdPjt0emQc54tZTb87CQorgGA6oTCYt+HLZntyt
         oZuXPAx2a6i/tmUmdmKehXRwHdZiKB8OwyrK4Pm9tA7kgDTHiKRJnuXP1HDIK2fhC1/+
         AoZLWgmBCn5pfpCxsdkCqQHq5MXsubAraXhlmo6/Q3Cr10s8Hks/nY4FpHWbaVxGAOJi
         hDBywKZGL2BPHUk3t7kJfwee2cDLnL/gYXabUTRk8QnKzbbTdgRo432fo5gbCSapiBH+
         uCkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755598493; x=1756203293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xs95ecbsHBS98kdZmQYC1sEgD29qwsaCQXTwkKAmBZ0=;
        b=wqqciLATM0ilsELs4aNvBzLD1dVcgqmTKW8udyr8F106lHKjZERLbZQouBZa507Clv
         OAjHC6XVtUb9d7AF2oGzc8biVK47zlc9H4bjBWy8igl9+gpgolFZezCXKHMEicDQjT+D
         q4370XjSqv744SKWYw93GQT5d0d1WhtDzFh1OTGfeaWYHqUdKj5TeCI1fGsro3ivNtCv
         44HfGKCjSWAbeMZ8rPboBlNwf9IivwP+ZGC/G/znw9kfdyygns9OoVgEXZX8ZGeaFZUk
         5u1JXX8FxWanurmpmSpy22wrGy1yEcERIBcmb7pkygLHyzl88zb69jB+IPh9P1FOBAW2
         q0og==
X-Gm-Message-State: AOJu0YydX1apcGhvyZEOBK2xOxVIUTPVG54rAmr/AED3+UMOqn22evoN
	IXnKag+ULxdxzYQIh/sMqYVfq75XZDqIiawXBFFIlm2r3cis2lYVhfq6GsQfSnjFAonA0Gb/niL
	F0p/7y+ur8jfo0D/5+89NtkOvAKPOmJaHAS2mpPOF1KpMY0sB4mGCJII=
X-Gm-Gg: ASbGncuL+rVIHpuzfZP2Dut6AGEnTiG3Gax2xq5o2n3RbiAMv7//EEsO7WDgvodFmsa
	ZPBHI51KEmc47w5Ozgby3r7RLZBQo6JUeUzPIz82B3Svkkph5XMkDXT4u5cczVJ5LlW5Tz+eRGe
	JftbMcJfAhrSAYo8JQ3cM9iUMeX3dBqdaAQsK66Ge3baUSnN+7ESO8WnHwZQ6grToE9z0KYJdMB
	fazyI1xc4MQK2F03FtuDXQ=
X-Google-Smtp-Source: AGHT+IFkQ/sC/s/4QAwlclM8xp2og6ZgeUxncw+E1xAHzjFAZWocrPGqkqt0tLwC0mxFcX7fM4H4zSIhQVpHMi/3Qc8=
X-Received: by 2002:a2e:a587:0:b0:333:b656:a685 with SMTP id
 38308e7fff4ca-33530534824mr7201021fa.1.1755598493156; Tue, 19 Aug 2025
 03:14:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812081243.22659-1-zhao.xichao@vivo.com>
In-Reply-To: <20250812081243.22659-1-zhao.xichao@vivo.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 12:14:42 +0200
X-Gm-Features: Ac12FXzU4f68lx-vnPMu0MlwjuQwlOsOhgF-cfcAJ8aW8LkUUYsFjc86GjLFFFg
Message-ID: <CACRpkdYjsS1q1mF=SYA1J7YFGnmd6+m8aj=YBPFWthxVoJSnwg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: bcm: use PTR_ERR_OR_ZERO() to simplify code
To: Xichao Zhao <zhao.xichao@vivo.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 10:12=E2=80=AFAM Xichao Zhao <zhao.xichao@vivo.com>=
 wrote:

> Use the standard error pointer macro to shorten the code and simplify.
>
> Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>

Patch applied!

Yours,
Linus Walleij

