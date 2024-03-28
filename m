Return-Path: <linux-gpio+bounces-4803-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 545A3890C28
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Mar 2024 22:02:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBD591F2387A
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Mar 2024 21:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5BF013A86C;
	Thu, 28 Mar 2024 21:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bXvp4qIt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E8213A3FF
	for <linux-gpio@vger.kernel.org>; Thu, 28 Mar 2024 21:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711659755; cv=none; b=ZDu2gXyIEONIXu1b7lTqD4qtUrfJlLFhCqgvbj7YP257YWbu+FMJlYuoisEh2IXP8BPV177NXyzgA2crtETLSW2gVVfWrdiDWw1FAyaGMZkWN3FjFLL/ttqqbuolx4kc1/mKaaSYfY3w2He0kSqUSTuvk1F+20qpoF2/1NTj//I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711659755; c=relaxed/simple;
	bh=PfpknSTxgoJfuD0raOrJ+PU0Mw7buY/9Y0NgXF+NxJM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ERf3sLntnNmSj9c3JIR3dwxl1LwIZbNUHAa8OG/Dd3KIeFt+jykpkefoRHLlvrOe1CMrTnJ47P5TykpBwkiOl8Q6j5/FJdjzDvbYYJ6TGlPvqLN6kFSdR79Q+xJHMut8Gie9DtpKRNJqo7hzHS4jRcJ/ur+aXp0HIIT5AlLBtpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bXvp4qIt; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dc23bf7e5aaso1397193276.0
        for <linux-gpio@vger.kernel.org>; Thu, 28 Mar 2024 14:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711659752; x=1712264552; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PfpknSTxgoJfuD0raOrJ+PU0Mw7buY/9Y0NgXF+NxJM=;
        b=bXvp4qItJjy/TKe5Bu2Mc4jPEzYhOjvkcpHYEB0Y0+V73sau9ePGn96Ny9t5aAjwvp
         rTShvd3uw3a+ietwgrtvukwYl9VHu+Q2SurPoATPGWYY2YOGofBKfjRMFyzViCJrpt0w
         gbGkTXJZ3udaGQ6+kSKkuntA/4dzX+Dr5Ips1PyrO1mrJbi/ki8ML/7xTEm3dnllILqg
         33XfM2/+pN0fwXZekLXxbR4IZ4Zczwms7Om0e9a6z30HeIlmzvllofqdAIAPsvpixkI7
         oYlTSdvkIoa86YoEEHlY2iw6jvyvZ4JgS3riYhJc8oMVyR6cScLQ0JN9yVU+LEdvNGc1
         NO5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711659752; x=1712264552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PfpknSTxgoJfuD0raOrJ+PU0Mw7buY/9Y0NgXF+NxJM=;
        b=gUVSA9ddKIad8+Y/QP0+6U2FONzQbeOf9z3/AULzHDlzVJE9p1kiQUAVa7tCDCdWrO
         lg93hmFJMRWB9sM31qP0DVEGyi6mlg216yD4HPy61pQ7TYLR6UUqgmPif6mvhjhur3s1
         AhHWH+4ZEqeIu02adFoAgx6YIQcUYg/rheboAolZHpg0TsVpm/IfXCxCl6X0GgABOLnZ
         t+zkzf6UTwes2nK9hlqyp1tosw86hfTfgzNnToBzUk8jYF5DnFjAkL+jm0+7mEUsTGN1
         BICY9RSIUhyCMgKTvUxCeBtnn8BmJ9btoNh0ebhUiwGafM8dn8cSEPfXTiSyRgd6bhjv
         6Q1A==
X-Forwarded-Encrypted: i=1; AJvYcCUNYV8/bLLlCVBwu4iAs/KtHsfOr3ddEK4tJ4bUmbXqYoBV3c/hnjBQhVeqs3SSdGPyIpXGCPSlso7+vzeoDCqlJ7iPNBAhpmSOAQ==
X-Gm-Message-State: AOJu0Yw7T4Gw4Y9rdNDmPR8ApNN3BXqOWvljJHy2HmN3rqksYWF7ddB6
	78rpNyekBKuhcmbnivTzzmyb3mPTkeGR1qi4kKZkHMzzFseVh8Mwh70EFNE1UipmbEI7Ev+U+pg
	QJd1VJCKcMT5YfW3xM9K80vmgh2lkLyna5x9vVtbRYRdvk5d7
X-Google-Smtp-Source: AGHT+IGxi4OD3TX9YX4kd9Mo5TVa7H4x1/FtN94/Yz5tgRXdC1t7KKaH5XTDmHinOsqcgVfjh1lKeog0QOMLKiEl1bQ=
X-Received: by 2002:a25:8110:0:b0:dd0:76e:d630 with SMTP id
 o16-20020a258110000000b00dd0076ed630mr480682ybk.53.1711659752409; Thu, 28 Mar
 2024 14:02:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Zflxi8SCzzouP9zW@login.tika.stderr.nl> <20240319110633.230329-1-matthijs@stdin.nl>
In-Reply-To: <20240319110633.230329-1-matthijs@stdin.nl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Mar 2024 22:02:20 +0100
Message-ID: <CACRpkdaRM-uqp_Y=gT=FMC48=835dQnB0YomYkxR9ag-SW5cOg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: single: Fix PIN_CONFIG_BIAS_DISABLE handling
To: Matthijs Kooijman <matthijs@stdin.nl>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>, Tony Lindgren <tony@atomide.com>, 
	linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 19, 2024 at 12:07=E2=80=AFPM Matthijs Kooijman <matthijs@stdin.=
nl> wrote:

> The pinctrl-single driver handles pin_config_set by looking up the
> requested setting in a DT-defined lookup table, which defines what bits
> correspond to each setting. There is no way to add
> PIN_CONFIG_BIAS_DISABLE entries to the table, since there is instead
> code to disable the bias by applying the disable values of both the
> pullup and pulldown entries in the table.
>
> However, this code is inside the table-lookup loop, so it would only
> execute if there is an entry for PIN_CONFIG_BIAS_DISABLE in the table,
> which can never exist, so this code never runs.
>
> This commit lifts the offending code out of the loop, so it just
> executes directly whenever PIN_CONFIG_BIAS_DISABLE is requested,
> skippipng the table lookup loop.
>
> This also introduces a new `param` variable to make the code slightly
> more readable.
>
> This bug seems to have existed when this code was first merged in commit
> 9dddb4df90d13 ("pinctrl: single: support generic pinconf"). Earlier
> versions of this patch did have an entry for PIN_CONFIG_BIAS_DISABLE in
> the lookup table, but that was removed, which is probably how this bug
> was introduced.
>
> Signed-off-by: Matthijs Kooijman <matthijs@stdin.nl>

This looks reasonable to me, but I need Tony to review it before applying.

Yours,
Linus Walleij

