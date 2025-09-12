Return-Path: <linux-gpio+bounces-26040-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D80FB54CA7
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 14:10:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C1636B61BD1
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 12:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57CE030C62B;
	Fri, 12 Sep 2025 12:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DL4/ihgf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC403064BE
	for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 12:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757678596; cv=none; b=laLRE5ulrqK4iIYzvor9hLfmfMS5o5F7tAFbOqCKhF/q5+Zf1zpAT8lQRVSLMtKBt7gaAk56MKuLknxQTY0sANnZZQeeLrCOJefrFsKuilL+BsqzQdXaYwFqAXdp/kqmZMoZPkDcoLRLZOyV/8CQ8vWqKoNyUt1VTsw/zO4xNow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757678596; c=relaxed/simple;
	bh=QVperRnHEJSGJPTmM6KVvWxpKyHPxQzH/drJR08pJQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dPfF6Yt7uwsMcvRcrqCWmpFTDvaSaovEPs581RJJpeiufDU8CSKSGypvH5goNTsMAVmYc2Pubq8wI7MfWXT9Iui6mINJkoHUxTfExZDaqRsdg1OJdaH0LGQC8x3m4+3i28o99+1vnfJUiSlZwglMvNbkz8z01SfFy9Tbz57R1jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DL4/ihgf; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55f7ab2a84eso1602897e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 05:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757678592; x=1758283392; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0PdFHKIGbwFEvO78k7VYipO5DNz3mTKctmHS0mOU/VI=;
        b=DL4/ihgfFFXwIRBDN6byjzagNqLkh6HN+KEtNsE5XF3GAIey8uj/hdG7u9iRH5pUrg
         gWHhGaL+Ykdw4rYmVdMYI6leNkBKlLrFjG/1x2rQkFpUAQ6Z3CkS11dReuW9O4AmVMlt
         ASL49h+4ZOzl+GtpEKbGODW3bjM7/2AuiTCL8lmnLbTssR8bW/hIoQ9PMrwaz01dAjRh
         SXPjN2aeV8ms/mb3CGu0aM0/ZupGivEdLqnLPrCsOyVJuW9XV8g/VhgxyWMaAuU2PpfE
         PZu3gHqsfIk4TLuF+bXwa89ifMHGc2Ndloe1sLqoc4tXbclcSngtOEcCjhm2JwvqnjCR
         trsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757678592; x=1758283392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0PdFHKIGbwFEvO78k7VYipO5DNz3mTKctmHS0mOU/VI=;
        b=MzF3fiqfn0XzEbk5WxMgm0i3MTDyH4cHovbTavSw+RG18W1YAkD/GY/Lwb6anhq42N
         3kdnldM5/Uh0xw3fjyFuQ+AN27zu33LZAiOV4SHdtFdteq3McwPYxKl/CpFPMGrjBGXN
         ErQ/8EZj5+ESw5mDriARhQPRzHNEWP9eN+iM306TlKS9Qaa2NHRQbN1rDoxJVGKArOri
         cawKDRZBZ7fp86hDWS3TwkauiaJz9KydankqOPEKLC9YFU0z0jrXzxWRdoi7tGskSKT0
         LZi01VqIg5QBdKHssBHYhQvM9nsBecmS6Tljauo1V3MZgc1ehprNK7VVi2a25ztcUFEq
         mIYw==
X-Forwarded-Encrypted: i=1; AJvYcCVCjjP5ViM0+d91Nf/w/g303J2beiezBc1Zwyqokt9WQY6THASIjMwQgzRLLmekrIx9cqaZUwifBH2t@vger.kernel.org
X-Gm-Message-State: AOJu0YywqkB3FPfhiakzHGhC0UqlCGP2sepNECaTCEz4BSDuqngLmUV7
	Ja9bZwHxo3r+Rel1KH3WN8EOgcm/+OiB37bpt25PaOSQUuLavx6G/iM3UmdJHHa/tMZeyy8D4jy
	98q/+OLAXG5avpU3sYr5FcyWNERbEOcJQvHb2DzVsvg==
X-Gm-Gg: ASbGncspLsHCkrCnDd+57qMypI0psRvIbLqrue5ogr8Zd7a0gteK937EEOHCx6YfYb/
	OJ3kX0cgVAG5je3UsIzmIEus7Sk5eEpfRuuyblnymcItRawFgPkuVoRwKbwgBxXPCLcTMwHRTRg
	QlrU8NBkOTw6T04arezavNJ6cSrT9yIN09IZYNmB6KGQmhEsbKjB44pXG0fAsZpbEJTuwcMBcX6
	xpx/WQ=
X-Google-Smtp-Source: AGHT+IGSZOlTW8CCLhnbl5TBUxb6BdFbzV6+OuHe7/KsFBuH3oWJWnilJXYkrdME2jw+G6yIQ8lGS/eJCMYe6xHrNns=
X-Received: by 2002:ac2:4e0e:0:b0:55f:493c:ba2b with SMTP id
 2adb3069b0e04-57051f3c661mr692236e87.49.1757678592231; Fri, 12 Sep 2025
 05:03:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909181841.102103-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250909181841.102103-2-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 12 Sep 2025 14:03:00 +0200
X-Gm-Features: Ac12FXwqQ4S6LsJ5ISymFmSoLLy-PySRhoETtxxqmtEpkSI7Fd-SoneEsLrhhRs
Message-ID: <CACRpkdZAt2n2gd7TuwRiBzUwjKy-LH=d7EYC7hg=j753UxKQYg@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: samsung: drivers for v6.18
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 9, 2025 at 8:18=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d5=
85:
>
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tag=
s/samsung-pinctrl-6.18
>
> for you to fetch changes up to d37db94b078197ec4be1cadebbfd7bf144e3c5e4:
>
>   dt-bindings: pinctrl: samsung: Drop S3C2410 (2025-09-02 12:31:25 +0200)

Pulled in, thanks for taking care of the Samsung drivers!

Yours,
Linus Walleij

