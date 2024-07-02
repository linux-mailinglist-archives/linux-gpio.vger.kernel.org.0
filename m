Return-Path: <linux-gpio+bounces-7875-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 752C2924005
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jul 2024 16:12:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31D97287695
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jul 2024 14:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ED3A1DDD6;
	Tue,  2 Jul 2024 14:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K6ZAUWmC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704AC15B547
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jul 2024 14:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719929539; cv=none; b=jou7vW07vj9vALeRiSGSuuaHmsZAqZTgQyg1H2aph7wvoJsKBU0imAB4WopmhvvgbQQ7tFS+vBgsGn68YUJDD1qGVqF7pvZGgVAkvhrFiJ7WOjtL9UMEUjcCh2SvQVHEEAlmtp1xHZpzP+sETNb+M8e0h3uib+vbbq0Enz0cTYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719929539; c=relaxed/simple;
	bh=shG5lZWmJIegSYpSHXhcYRFDeuQI27pdOgORWbTtyac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Te8aWFeIen2zOq+1iCynl+0Z2iVOtEH4zhGdnZ6XyGJvw62SBsFwhjdebKLSiEptGer+JK6GI1jjc6i8nc5KIHWnSYWdeyC4rDAixLXPQwM8faDOcBH8s+9j9H4kqvlHgDJ8JBhihUtArL5+lkFEAydJiDPPoOXYw2qUTQxxJP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K6ZAUWmC; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52cdb0d8107so4935404e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jul 2024 07:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719929536; x=1720534336; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oJ4UA5evAUJjIoUWG77VadWQLKwj0QB4y+/NHan8kFI=;
        b=K6ZAUWmC9unUTM4EDv75E+RwLh/0SHkljVBRNE+H1um0lZVCwt7AkrIhItKDF0LDfr
         0rdd5Dtuj8wbIPQDnbSax7s9hggo+HxnNsjMgXGXQ7Z5495iqw7Y1X8+6QZstkYK2DWu
         Nx6yMgaas5nvS/j6ngQioNxujZIzBjHKm1tINiHoaDicZzknh06Lv1sFinZfqGRQRvx3
         qyPx0fZEt4blcsrcBoXa2eCKO39mO47YIaiD6YR4s4LT4Ay8F1CfAdiFYqlKeuOSDdYs
         Rwm7X6v87JKe1w0C6CXYSrGvoOBeZjwdsDixn2eV/qpXJ8GMM0WPQkR6Ff+Sy6p1XOMT
         brLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719929536; x=1720534336;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oJ4UA5evAUJjIoUWG77VadWQLKwj0QB4y+/NHan8kFI=;
        b=Dzg1QM3ZZPqNv5vskdvYD0JpcF8abzGnX/WB7QK6LozMS0nYz5dyEKeGYAVuA3EWA7
         qm2PxjFG+boYVbrW+fFeB3t++OXNeOsb9QmclzF+fCyvO3L2h1euGQfS+VU+SlabjSUy
         goK16MpTESjGSMpfQV1ir2ql7oq2HDLm1kmiUTpcEz6u1XQsK2x1IjTob4iEB1dbRRL3
         AbVBTCV0pWvfnDGzGQogKOaP5I4gFmbw05TxqZAE11NkAhNJukTSlg0ljwb7M4p0IjVc
         O5HoSHSEkrAPb89zuoJYgLYL7MKIPjCL8qmZKebSGRsNUMuslN/dw6u15Zq0uzTFLuBy
         asWw==
X-Gm-Message-State: AOJu0YxI1ZlRH5+Jt9TDRLLNsGrGXPHd20UakXY5cXm3V93q8YeYBMSd
	cBMMw9o496pxjjWQrxwPWDAF1AXE1nGrql3f5jfM5Efg6w2Pznxbjksj84N1Awx8rrSIfO/y81q
	C+xJdJ5iQOA8WBRLYHVpMnGJYUHTP7yd1kFJ3pg==
X-Google-Smtp-Source: AGHT+IFaxQxCQEEb5o/B2PpaP5biYN4d8g2kkpus5N+4+6r8yLxYI6GBvNnfB0J6ohbOlIM6qiaouvHssrfz75vqxrc=
X-Received: by 2002:a05:6512:3b87:b0:52c:df6e:9517 with SMTP id
 2adb3069b0e04-52e8264bd04mr6961071e87.11.1719929535516; Tue, 02 Jul 2024
 07:12:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1719837986.git.geert+renesas@glider.be>
In-Reply-To: <cover.1719837986.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 2 Jul 2024 16:12:02 +0200
Message-ID: <CACRpkdZzj2unuMjE3TMzFfEcGzvaS0nsF8Pzh_eRwo7V86YU-Q@mail.gmail.com>
Subject: Re: [GIT PULL v2] pinctrl: renesas: Updates for v6.11 (take two)
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 1, 2024 at 2:56=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> This is v2 of "[GIT PULL] pinctrl: renesas: Updates for v6.11 (take
> two)".
>
> Changes compared to v1:
>   - Back out all R-Car fuse commits.
>
> The following changes since commit 9bd95ac86e700ab8b1a6c225685e0e5afe426b=
4e:

Pulled in, thanks Geert!

Yours,
Linus Walleij

