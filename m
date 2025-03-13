Return-Path: <linux-gpio+bounces-17524-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A03BA5EEB7
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Mar 2025 10:00:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34A5719C08A0
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Mar 2025 09:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A6112620DD;
	Thu, 13 Mar 2025 09:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JQhxQX7G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305AC260366
	for <linux-gpio@vger.kernel.org>; Thu, 13 Mar 2025 09:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741856421; cv=none; b=I6VcEvc6kFOsQs57ETygV7ONUXsIGiTjSsuH/ZPvJHy4zGA3VtA7BCuYVZliVO6dbwbDOsUQWTwgJNsgG42+ufjxcgSdAvObZSCPbA2yRj4bgMKPQbO3IHoZFJrnmeZ0pmpE+9gPtuF7QVPXq6fcR36VxqPIn6dB2ZV9LVkR3Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741856421; c=relaxed/simple;
	bh=A5Kg39SNAyQUwi3pExfxY+hcZK1HLs5e12K19Dbt7vs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OX11ifI1+r64gB4QIsk/4NKfHwTxGLzBqe2Cz8nikw4zKW4sahCEJI9YAc6n1SufzanMix9T1bmODk1W3BQkRcsmoxAChn9oS16jRDWw53EU/1RbfjZ7Mxo+LDRBpny60vxMghmGCVoLJk9Tu3/lU902hTw6mMo7e4Nx7MZ7xLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JQhxQX7G; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5498d2a8b89so721827e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 13 Mar 2025 02:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741856417; x=1742461217; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A5Kg39SNAyQUwi3pExfxY+hcZK1HLs5e12K19Dbt7vs=;
        b=JQhxQX7GIB2uP+rgMKcei4njEJoYpmynYWtiSCLdPYXBbEPC7D6gZOQXlB/Vd3sPJa
         KLpDbMF7jruDu6htUGnjgo6GHZfJAwybeeOkrIttXYIvPguv+AOTFnXm3ke23MUUsQUX
         r/o+pDa97KOOjG3Qbc8U1/i/wvYfFb63pgp5ATIGsOcQKe86f6YkkiqoxKitqUBWE/WQ
         Knfrw430fFW6JsnKmrxPEf2nT5CXZtT6LQfYPN/7F73+X0XyLo1DGp2CsCcivJfJaQ8o
         vUTMKYaZ74b0HIH64vcwtIkOIpzeH3KvnS2fwKy7zcxi80pU59MvK9nLtBCGxC487AJN
         b6vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741856417; x=1742461217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A5Kg39SNAyQUwi3pExfxY+hcZK1HLs5e12K19Dbt7vs=;
        b=PvGucqw3tP6Cmd81indj6JMi9lbCFnfu42T+NdQX7Jf4lVFSC9Z6UE4k83VNy9Lc9W
         9jsyN1d5NEccRZE+AoveMadmMSF0FjlzhP+1UFQ2hZBGvX3q26zS455WSWS3aPmGRxvE
         wKRuh55r0W14/KS2I1e5lCdylmWUiTG4233Fti0SkkEsSaR4egDDSgYANnDhf39f1C7R
         0gO0c1WxbaD2SCnunseLqpq4+9XfRUvYIjaqVv3FKrISAncJQrJ49wVAO9y1BSiiglSN
         n2qvX8Zho4XALo7iVaj0D/RuPdIRwb/HStcjOtAy2itme4tgwjem8Eaew1EfnplTsTvl
         4ieQ==
X-Gm-Message-State: AOJu0YwU6ieLiod+gAd+dJsXmyvSyyjWUHLZUO+0Ztp5jQDMWYS1Pm8q
	O2v3uvyswpEVmv19swLiuYrWpVyB5MnvARk3mKs3/lpg6yZpO5UJc4x7QD0b+m0tqZ3cgHsgZmv
	7S3YTTRQA9e7Orn/HHYxfgJ25kBPBx/8/nwkj4A==
X-Gm-Gg: ASbGncuGmMqLQBlj2gNDlMm95dwaHdMXEnRKKVvEUKVMuNNziD38OZ3R2pzJEatwU4E
	Xv3AcRIbPX8qiMzJ/ddZj7m/eP0Rl8v8nRDrpq/Af8QWft36mjpliuqh76PTzBCT1MG6OG4Uf9c
	ETQVorvNONbncRblKgzmiAQt6eYA==
X-Google-Smtp-Source: AGHT+IH4/zWtTxwpb0WnCPNiFlVqd5Bk0BnYYAlgyTItnCn9TmP8S9UH5o1Rn5ACqgaSvxKr7nvnjitU5BXvaCnIN5Q=
X-Received: by 2002:a05:6512:ad1:b0:545:60b:f38c with SMTP id
 2adb3069b0e04-54990eb1967mr8628441e87.41.1741856416965; Thu, 13 Mar 2025
 02:00:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z9FXo5qO8RCZCKzk@black.fi.intel.com>
In-Reply-To: <Z9FXo5qO8RCZCKzk@black.fi.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 13 Mar 2025 10:00:06 +0100
X-Gm-Features: AQ5f1Jrvygz6anRRrNlo6pdVJAEEgYCCKgaefm5_HwkRULX8wUFKpXGajOZ6yVs
Message-ID: <CACRpkdbyoUt39Mw+eifc5yX5Uq81E_Bs6pRtjXV_GmaOZ9nRkg@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 6.15-1
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux pin control <linux-gpio@vger.kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 12, 2025 at 10:45=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> A batch of the updates to the Intel pin control driver. Due to driver cor=
e
> changes some other subsystem drivers were touched and the respective
> maintainers provided needed tags. The changes were in Linux Next for a fe=
w
> weeks without any problems reported. Please, pull for v6.15-rc1.

Pulled in, thanks!

I assume the devm_kmemdup_array() comes from an immutable
branch that also go into other trees? Just thinking about what to tell
Torvalds when I send this upstream.

Yours,
Linus Walleij

