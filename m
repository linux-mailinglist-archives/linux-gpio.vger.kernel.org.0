Return-Path: <linux-gpio+bounces-9473-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D95B966C1B
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Aug 2024 00:12:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D019A28501D
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 22:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B60D1C174E;
	Fri, 30 Aug 2024 22:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H2Dgv1vb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2979B1BE84B
	for <linux-gpio@vger.kernel.org>; Fri, 30 Aug 2024 22:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725055927; cv=none; b=jP9uke/nl7p3twMdqefW+b1uQoUlRaw1n/iRKs69b0HK+96Uck4OzeLMyTRuMLGZAgVi+zDGwJ9PbCwXMGZQ9o0s7ScZBJboMhJL11g5aDlSt1ZEoVvVZLS8EWM2Vp/FZVJRqz2OoQabDjhOFOexqb3YHmRTVOkLLBkuNJXAYRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725055927; c=relaxed/simple;
	bh=Rwh8M6A1//w3NduZYo3bZPoTmO8CDMDW24C3pIoKiLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iQRV1dgQ1di8aF/bdNct7TVoPqXlglJ2YaTjSuHb04+SCVITQOMJ2Eli6ERxHZC8EJpu/KNF3BOG7FD3tAAZ0Uzsxnb2vkpwg5WfHLR8psC3RnqiCOc2FLz57GxU5alisiYzpqBpP/PUAhNbZHS9QBIHJ7pjeVVCwUrVN0G0PpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H2Dgv1vb; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5334fdabefbso2855919e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Aug 2024 15:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725055924; x=1725660724; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rwh8M6A1//w3NduZYo3bZPoTmO8CDMDW24C3pIoKiLU=;
        b=H2Dgv1vbz0E50G7x1JyVf+8owrVBoyf6hZ5NR3lu6mkU6QdLMz/t2w/b5PUbZbxaQU
         z8dF43kmaTBpYd67RBQotoUptMSD5isDVgmYYLJONy2UssQtAb1p68jXphCJE+3gTEap
         SN9hZCnm/2RegmtJHjoukyeld4GI5v03/+SUJGFhPafJnyIWANAu610jQpDNs5QEo4Mv
         XM0ECqsoF2TKaJHAcLHNVmNwkyVw+XEh3PEGVtgylwx+2Yupg/unFfg2MiX1p6UZl4x1
         /mdxrF/+PprovTMmRQVnl5fn/o3q6J46xXdgh3eq5ON1lG3P+8FeQROOrm4/FDC7qkkl
         gGzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725055924; x=1725660724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rwh8M6A1//w3NduZYo3bZPoTmO8CDMDW24C3pIoKiLU=;
        b=ehkMwJgv09TDrXZUfaZjNS1sIANfUtdALc89b8Z25W4MiLnEdcImV4Jk5EXDVtl1Rl
         /aowMYeR83wDZndgPijOVUnsmU5pwcPHbvXMTkNsnBul94wAic/0thS21hozH6Yi6bf4
         sBtg2QQ9t+/jnjhEuCDvgBDJ0HboZA2z9jTAiLrx2+YOEuKKOjrBc76gQgsgXtKI0oVf
         sNjxKjaGgbNzRMszxefHSkdykjLdZc2e+uynnZAKTR83JFngnKkKBx7iKw7a3eNVQFM7
         zA+fzIHt2FHXlEppTrzYRTpmA9GlG5m7BhlbXGliIBnJQ2Z/mr47yislzvEeStnYyV5u
         q53Q==
X-Forwarded-Encrypted: i=1; AJvYcCVh71YD1faPBSPCh6ZIksRA9+pLl+dQexxPv2AJ+N+tV5ji21u6lUWlE2wEUw+1Qw9mO7oqrurxv5Ek@vger.kernel.org
X-Gm-Message-State: AOJu0YwhgGdpuAvaf95JQQbAV3Y9MXIjRR4hJXO+ynFabwuD5a6T4GGM
	WG1mpQ7y/DTz9kf+TnARQscMb5SCX+Q1hVK+vQd/8JlCLOXIBRCPPTJGbm1RDPqp4Q0u1LFDl/1
	5JlozzNMeYOMviGWsB/pS53F9WRsLcQIEepO/uA==
X-Google-Smtp-Source: AGHT+IG2GimMLBi5lPm379Nq+PM2LjCqEC72eUxNPBP5FlNmfqi3CtzsuE6fdy7fqHbWAp4512GJZfLvCgLXmPidcY4=
X-Received: by 2002:a05:6512:2308:b0:534:53ce:54a8 with SMTP id
 2adb3069b0e04-5354636e9f9mr1052118e87.30.1725055923441; Fri, 30 Aug 2024
 15:12:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240826095306.1420628-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240826095306.1420628-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 31 Aug 2024 00:11:52 +0200
Message-ID: <CACRpkdabwp611SQDDkDRDT3EG-SVirLu3Eg1P6X+BLOxLdGtyg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: stmfx: Use string_choices API instead of
 ternary operator
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2024 at 11:53=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Use modern string_choices API instead of manually determining the
> output using ternary operator.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied!

Yours,
Linus Walleij

