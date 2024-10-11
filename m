Return-Path: <linux-gpio+bounces-11172-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6C0999D6C
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 09:06:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A9D51F232E6
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 07:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB23B20967D;
	Fri, 11 Oct 2024 07:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IwB5TRzj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018B81E32DE
	for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2024 07:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728630366; cv=none; b=q4FFPyHTsXtK8bB/dwWREr9uwiuLeeCRtPZmoFla+n5VqD7FfF5yrVa3jwoNydXg9ohPdN5qgqIzXdRaexB5+yZ7XV4XbxNyQpd18hYEEqTPrUfPunfsmTniItNs9w5lSBxCjnZKQKhKTo5G3NwQ2Xghsm1pQzqHvs8RQr9b4os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728630366; c=relaxed/simple;
	bh=UYWmRPOJ9agPa54+7bFHUne6XJDZ4rsf7JqfyugsRJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sRY1Tnl4DxIYx2aeDWTjaN7EOIU4zpaZqWTcKCqMYAtz7RKU2+VwE9ngk6+zNwTXqKa1qXBRjDpX63ALbYBYza0kHzVve65RI7tppXCkxHBldjb8uA651jgC1ibYU9pp8kffeTzoYKZxURsS8j0th/iHM75en4mYLMVZk9njkeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IwB5TRzj; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fadc95ccfcso17951601fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2024 00:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728630363; x=1729235163; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UYWmRPOJ9agPa54+7bFHUne6XJDZ4rsf7JqfyugsRJg=;
        b=IwB5TRzjW1ZTRbx3yt+onCkz52zjrn1fi/CBJLTHDxusfJGYuME+szQzc9F7C6o3yu
         pr4qWqgDy8LVWWOrXPGIpwrH/hqfM/E1o1YZeK+gXl5niW3Kv89aar5DA9ltVchAN6aQ
         g/AWbJ1q6ODS1oDxKBd2jMlzrZ/1QARYqnrGE6JEwxvVJ6MSXOISXhqsoHEvsXVm+1bm
         rul0esGAIOIOj7/wZker9kibxA4Dcc1Yy/59WcoELOrAi8A2s4AFyUH3aDp8ZH8qAtXe
         w13soXnyHiM0ddI456sxI5LC1Ye59e3+16wSsu5Ujc+vYC6ewSlQ98d+ec2eTYIlxCQi
         XcYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728630363; x=1729235163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UYWmRPOJ9agPa54+7bFHUne6XJDZ4rsf7JqfyugsRJg=;
        b=qAOCcBC3sOMY4q57fBfXIycGZpclFGH0pceLOOAQVYI/MBj+SyR3IX9nbXE6z9/n4t
         Ww9Lg9UsWxUUXhEZbqw9+6EfVSABG6IT60hcZ65q/EKYGjwA6/BGkxfT4O9TUmJ4v5G8
         Qe7out6UP2cTk85w9QIZ37UNDl2+IMaVaXXXJplQHquaKK2CpLO+wJ5H/rTCRSGxpv5w
         KVrKVuLuzXGm7DfTnSWg2CJCi7c+0LeLfp1nRgYtb31Xvej5JyXUs2GzcbXmPT4qccWR
         jOdgpfeBNojxyekH5RVqODRW2AY9SL2HXdl9YuVgZZIDV/DhfzZdZShdNW/1KmfONcrw
         hPDg==
X-Gm-Message-State: AOJu0Yx+hZ7WXHAzJcC8jDRp7JAABg5Bu5UeWzLaXc6NiipLd+bfrZ38
	fu52iIB6p90PC5ajIBmBZb9ndUVXStDaoUXUiTALyjP+yeiFkGNY/AJry7O9aB4/B47w1qdNqD5
	CRjfk+VU48mrZDBHd0RulJDGuNhxGrD4o5yRR8g==
X-Google-Smtp-Source: AGHT+IG8zV2+iAyrrbJ4WDMnZQFSISzC1s84X7Xtp+3otAX9bwU3ugO5M90Syf8AIdg5cszVYklkeEzk34c4PQQiivI=
X-Received: by 2002:a2e:bc10:0:b0:2f6:5f0a:9d00 with SMTP id
 38308e7fff4ca-2fb3270597emr6660451fa.1.1728630362991; Fri, 11 Oct 2024
 00:06:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009162910.33477-1-brgl@bgdev.pl> <20241009162910.33477-2-brgl@bgdev.pl>
In-Reply-To: <20241009162910.33477-2-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Oct 2024 09:05:52 +0200
Message-ID: <CACRpkdaMzN3pps=Fm9YC0i9HB2GYLa1C4vaO1QB27KpUBiR1vA@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: mpc8xxx: use generic device_is_compatible()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 6:29=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> This driver doesn't need to include of.h and use OF-specific interfaces.
> Use generic property helpers instead.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

