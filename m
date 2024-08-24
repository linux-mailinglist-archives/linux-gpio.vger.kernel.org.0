Return-Path: <linux-gpio+bounces-9119-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3311595DE80
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Aug 2024 16:43:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD1961F22391
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Aug 2024 14:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BC2117A932;
	Sat, 24 Aug 2024 14:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RCvKE3Kw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2176C176AAB
	for <linux-gpio@vger.kernel.org>; Sat, 24 Aug 2024 14:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724510623; cv=none; b=kCmH6nAuAEoSKHTMwCDaCzenMu3+1BOkOJZ7CYyiRvLGJ1aFBYtj6j5vWrtKgt9WOJFzwu7me1sAqNmsEygO03H1Od/htud4UCzU5og/HauRHltjOVPON2iciH93xjlcroNlhLhWLvKk1QsRuzpAp+QqGT1YfKgR1KTi+iRvuso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724510623; c=relaxed/simple;
	bh=TG/Q635uFGX6ibz3TtyerVGS3vHIeINHxFOb8QYWcCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AaKJ1VgAh9F3A17R0n5uZpLRQo71xq+JCVrBzj/mg2RoqVadCE6WtG/4YQXUWpIPXuJy/YIp9lkmKv+SKEg16chlOlqdurkwQKwqQVGFDTw7/9ItOGZTzH9JcIxvlhiqypWB1wpc8AUDNCpvl6UTyDxJNjoS5Gu7mZ5MENnsv0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RCvKE3Kw; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-533463f6b16so3322716e87.1
        for <linux-gpio@vger.kernel.org>; Sat, 24 Aug 2024 07:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724510620; x=1725115420; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TG/Q635uFGX6ibz3TtyerVGS3vHIeINHxFOb8QYWcCg=;
        b=RCvKE3KwgPp+3R2Y5oyMruspdUzBEqtT1uyl4YorwiWu1H/kaGpX0FSc8+LbySgNfq
         eVyFMSmIOUmQ5QVJt1Wt46AgfFSgWajs8mRDQaNr4AcWJax5KseAdzBd5uUCC6659EA+
         GHWGEhl8LNoDIV48zIdNaYfm2HzahTKZhUrEhJSM4JR50yXGUM/1oFP7tjr5X4/Jr8J7
         K2OdnHByzsfo/Mw1MhwzyR/fj/KqhUSKU5oOIAsuK16C1Kns+5urqajgWraxZmrNE1t9
         Qw+kb4IeVBJ9lPU7YZ0X1FA5iFIUP8WTE9QTQS+Mm/Konm+WwqxNXQ+eyvZZhBdlTTOs
         BRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724510620; x=1725115420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TG/Q635uFGX6ibz3TtyerVGS3vHIeINHxFOb8QYWcCg=;
        b=brULE3KZVp9zAmlqSSnKmfWfkEmqN0TDz2J5Po6EqvbVoLeNTumCISoKLK4M45MuOd
         6SBwRzY6M9oE9PPgkDffsMyj/rYJYH9om4zBRb9CZkQKlCXcKvkCBI8O45k2PjYR6KQv
         RZYuGBBRsWq4mxrar+Wa62fCT3dzaW1QHyOCn3uu7y2gBLJkiPLCpM/wLwf4acYChvqw
         Kg/EvybRRGvN/psynByyMBzQ3XHBB1k8FeCm8t1QLWUovu5f+Alz1fO5gmilbGozoaUm
         6q56IP2EvIDbF2B1+1ZRMaZB6c0EAkjIqEKAIJHf34h0E+mLEYZa+a6nNdcHLSX1fCpo
         w+ng==
X-Forwarded-Encrypted: i=1; AJvYcCUr8M97Y9UfENLMgpeChMcb4VD3JIifDR/fmmA472DQ4I0StyFt0ECchLdjNL2uYUbGpwnsANi3Fzq9@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3fCFyaN9eS/3pCYxPt7p8YlcEKF3wfdbYfZIUqS1IKcJlFUKq
	/X8zO34UNnFcFPT/yyG3hghC872RGmapq0JOgLEbKf5sywgebZsiOEcB/NImXS9xHlmQLmHeIxP
	SBSB3LymHUZ7GxUUaHbTwmIDmV+2CyZFP/rdw5Z1pqFglfmw4
X-Google-Smtp-Source: AGHT+IF1Lb1IYekbSwByfy+rWqqhhcaUglxVrpppACcE9AnsPrA9/GqTgMiYryV6a1z6VO0NT+wvEAYG/Ss8+fd6IzM=
X-Received: by 2002:a05:6512:b1c:b0:52e:987f:cfe4 with SMTP id
 2adb3069b0e04-5343878551bmr3688925e87.30.1724510619375; Sat, 24 Aug 2024
 07:43:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240819142945.327808-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240819142945.327808-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 24 Aug 2024 16:43:28 +0200
Message-ID: <CACRpkdZosbVKr9nY91oMTQUcn2zrm2t6ZjxQiyQbwQx-kt71Pg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] gpiolib: Add and utilise for_each_gpio_property_name()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 4:29=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> There are a few of duplication of the same for-loop against GPIO
> suffixes. This series addresses that along with proposal to eliminate
> the exported gpio_suffix_count by converting the array to be
> NULL-terminated.

Too late to the show, but excellent patches Andy!

Yours,
Linus Walleij

