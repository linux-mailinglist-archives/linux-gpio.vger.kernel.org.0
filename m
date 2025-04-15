Return-Path: <linux-gpio+bounces-18819-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD05A89610
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 10:09:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23DF017CBF4
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 08:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 169D4279907;
	Tue, 15 Apr 2025 08:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MzagwxYg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB552309B6
	for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 08:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744704580; cv=none; b=nVX38uMnbv+I7EWOPK6j954D6IXsFg6VvUjGZdHdNGFUqKXNvoguualI7oAlpWM4KTWADA/gzDiEem+dHcqRJ3rwPwe6PHctKXcXGEl7rs0iqf9JYYSFrrL3Q1lh677wvlPYhnx4GVAsdjaXOVkQToFWyREZ33jxjWfqk64n3nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744704580; c=relaxed/simple;
	bh=a1KLlXlZdYC0DQZmxE2jQ7mHnlUnvqQd623UMlv4WaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ps1iqf9bpOW8GcLG5lJxUAl9icgFJ6YK4nY1M43jgRPw3KAk1+miSPYWtrq/cA8sRhMruq9pM07R/NJ2JB9eBi9k8Hejjdlc+S6g+5h31IolmPAyO4y5dJ2l/bid5cvT1rCbNDDjUI9Qs8FXWCob5Ziarh5kYa/VeqTQURfqvNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MzagwxYg; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-549946c5346so5931809e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 01:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744704577; x=1745309377; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ICfwA3EdEWzVcVx+hLIJ6dLtBuJmhGYaj0rjrQ65WG4=;
        b=MzagwxYg9X50BylOmXjHipvJap58tOUpE/nafLw5uaec/GM4h/ADslrhhzRSr/b3+B
         wnXTz6f3D8O7euVuyIVnmJZfxx64pB+zLFUhLAAIPfoDYTyznEsVRjPhwa0otmnsUKp6
         UjzOVquit8zfh5R87GKW0FR5jRE8uzv3k3rfhM9dKXsuQIub8rsE03m2wECV4RkjPYtH
         kqp3aySE0a4mfkKTIZNt6iIIpvEHsr4l46UmChxaawD4hIsiHkPLy4W3ccXBVNHFLN1V
         Ccx5H0ZA9gXWRTmDBrS/OEvKUNPq1f1pnFij9gYu2Y/Kcm1JQPehFqPnHuMS8RZTNh4H
         2OJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744704577; x=1745309377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ICfwA3EdEWzVcVx+hLIJ6dLtBuJmhGYaj0rjrQ65WG4=;
        b=WTyOIqjqeN6TzCfo4WpO1et78cTRziYXsFh3iBgZFLhD+eGRk7zdlG9Yr7iFjvNXfW
         9vgE15OsQ32G5J5IqOwNPoTXKyxN7t/MZjvE8Q82xrs8paJEB0QkmjYCJzjSz69sazZf
         YuIWPgwX6riVSdEF9xtYtDbo7qWYYo7FFYnZ6Q0/NZJbkfFLbx2IYf4BkogMg/tP98Bc
         ZGPDSrYaoJLBqDdTsQpKr1H0bc0BuVs56T4J4eoHGYJS8CSC+LaTb0c8SPLLfZydtPOS
         pfbt8byKfRmY880degvzqQUzGaSm1QWJfLA4qZEV8st4zujPyiVPJZQ7XiHRx0i8b7uv
         Anag==
X-Forwarded-Encrypted: i=1; AJvYcCWJ/bz1EpJB+GkwAr9gRmWUziphxgKv7xcf6e15wO36jXKixEA1zFO7XJCN+DDo5LKaPgvexTyIMUbY@vger.kernel.org
X-Gm-Message-State: AOJu0YwrKeKTo/F6SSlHLK2JRdu+sR/7Gey6ImA4W2HDudOg/DsWwPWZ
	I7L2CjWq4HrKO14MDKrYjAqZ35tYYW0yHB/93U/F8XvNCz07qQwq0g15G8mHMSBUcCu6IaW9V3P
	7Xa2bI/xZHbcM1QBAFeJaYK36Z2q8R3dchsmljQ==
X-Gm-Gg: ASbGncu1kL5mp3g7/14WQ1GQSr8N+OfIPqKjfFcNZdpsRIJn436NkAClMGkMqyVW3hy
	Q9HxAOWNA7H0SQ5YIqFS2uRFQBDN2rcPtVeGUbCDJcTLMCF0APna+1sOk73tsz4cP+zyM93Ffuz
	lHbuM9xzhKhPqMmrEGBIGTng==
X-Google-Smtp-Source: AGHT+IH0Y4jm0LaYVhqlf4ygy8v6EM0HqVDr1pCml9YV4eSiyilIsQJQAcufVd3/LXkLFdiQwaLxvtXP5qPvFl0mrI0=
X-Received: by 2002:a05:6512:4019:b0:549:8f06:8225 with SMTP id
 2adb3069b0e04-54d452d692amr4312543e87.53.1744704577064; Tue, 15 Apr 2025
 01:09:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404115719.309999-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250404115719.309999-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:09:26 +0200
X-Gm-Features: ATxdqUHY0rsQZ362mf1eSV0hA552eBY6l9M2A3A0WPZhzC_XlT3-mPSct8oGVPI
Message-ID: <CACRpkdZr-s2sW07M8f-qr6YzRuNxJ_vRE6-kFaXaX7v+3g01FA@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: meson: Do not enable by default during
 compile testing
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 1:57=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Enabling the compile test should not cause automatic enabling of all
> drivers.  Restrict the default to ARCH also for individual drivers, even
> though their choice is not visible without selecting parent Kconfig
> symbol, because otherwise selecting parent would select the child during
> compile testing.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

No comments, but the patch makes perfect sense to me, so applied.

Yours,
Linus Walleij

