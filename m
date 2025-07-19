Return-Path: <linux-gpio+bounces-23511-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 402AEB0B0A9
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Jul 2025 17:38:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE24BAA6A5C
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Jul 2025 15:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B24392874EB;
	Sat, 19 Jul 2025 15:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GtasaZZy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FF321FF4C
	for <linux-gpio@vger.kernel.org>; Sat, 19 Jul 2025 15:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752939534; cv=none; b=EXzCIeSWPlXHt74cm42gwgcQcGBkVW35y/M52ACiesyeN6ODlMQ+O4H/fjPXMH5BiC9cECwH2aFfL5Xpu7rfoHEp/++LT0OdBD1T2VxNbbS0gCbAS3KfCmjkv2bUhqJL09v/I3wieIOAtlxGHCtnU22SxOsUvwNsPA5wGtgGH2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752939534; c=relaxed/simple;
	bh=esvGyu8JnnHIYbCLir0OmV0T51s3+8MXKXoURIZNyTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jL5QiD1gaR2k/0VG7rmDooxuTXa73zpMorT30JUixeWZLt/RsgNDDtEiADpkeP3zPfdUAJoC6w9RdktmjT/eEGA7OubUbBDoIpnaBJSEYl63FPKdxfVlaficU5pMD2iVLzF8Bq4V6cT02t6XxyDdWAY3ZfJJzN2YmyONt+72xJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GtasaZZy; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-32f1df58f21so30618091fa.3
        for <linux-gpio@vger.kernel.org>; Sat, 19 Jul 2025 08:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752939531; x=1753544331; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=esvGyu8JnnHIYbCLir0OmV0T51s3+8MXKXoURIZNyTg=;
        b=GtasaZZykNx4LdK54H+dzExtvhEEuGHZDBY7FVV19QSUuomlUzQQaBZAkAgey3kFNr
         Iy4px2j3DLC4J0h4h/Uf9Pqp22TfQmord69f+bSbbt9c49KRhUVAYWsIz60gKpjYAofg
         mtmcyghjY+vI3Kk0mtLPFp3kJix0x2X0v392h+mZzasvIFwijEuWuoFPO+uYSOgeCUbw
         dvNYsEspnBOD2Aqn0ajJZFf6tL2madrQaZx8qyr6qUJSVM6MgqUNHOiQo2e4/k8DEcho
         TIycflbGTWzIs/a6S+cB6cygyZ7NIPHpq9nGj5rWXuWmcO9wBAArn2dOOmKIiZ7u/pug
         t2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752939531; x=1753544331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=esvGyu8JnnHIYbCLir0OmV0T51s3+8MXKXoURIZNyTg=;
        b=RvBRiyZf4LsADPWMB+TFstSZEtAansKmaajOT7NWYUONSeZCc0CsXlvUh5xw/g5ONl
         QS1LYd7aFCRHJ6fsgYM38xWdOFZqbgTcqx+VGqs14HI5DuezsGs58EuRU9ljUVcJ0VWK
         17/AeXE0oybbXfqfnElzM4CzcOyg3QXGwG7FKjQt/oX1bvgep2nWiZdPSzcIyf5Hgh4J
         GwStknAf1pBPCuB/owHccWzbP7rkrrozeOoVUlF0cYULI1NXVN3pl3Ye9KIWgz45bGRJ
         ap4Nv6hGqyC1GriT51WreNzdfz0cQj+La1Ip0P3kfsg0xiPpDiKcT/iDomIVkuSrIDl+
         xtjg==
X-Forwarded-Encrypted: i=1; AJvYcCUDztpC/C1iXFbyx316k9Fx+QN+cLmX5LbH6Lkfrr68i6dWzrpUKy/1zvATFTGCN6+RAZU+e4eiiNEn@vger.kernel.org
X-Gm-Message-State: AOJu0YwXG87sChdtZ3sfqmFXkR83bcZGKMoMk0suT4oN6AjfYmW04cCA
	qcn/6hz3XxInKAoa5oLSYI7MoBMInluEESzU5bI26LhCADLVGxEvv6W1uLs1Ia4igiqzJ3pqQ5R
	jtl2K6vTUtBvYLxc3BFJCsKIiuFQNpk1OROrbpc8tLQ==
X-Gm-Gg: ASbGncvD+/onCzmaeY5YmRtJdbW7QeFlRuEnJ3cVquG01tHGDyNyDwbmne9KW4SC4Cy
	5NNHqMZoduTFyb1aC56VyHuk2mtm/YUBmxxYjEaO8zPvrWJJ9Ff4yMPYp1GW+SVmakx6Ceyz1BO
	o6xfyI8TP9nM3Yod3kU1WyRBTn9iDP8YVDimUF9YAt5uujXXRddDqJFjopAeI1uVe/opTqi8tCr
	pZtzbI=
X-Google-Smtp-Source: AGHT+IEwlbXHvry/qY2RXEOh6vpApFq8XZg4BSuHABf7Sre3nDCz/8jjYq1SEUpJJI5MtznrxVrRAdQS9Sa5qhK2BeA=
X-Received: by 2002:a2e:b911:0:b0:32c:a709:80ee with SMTP id
 38308e7fff4ca-3308f65a482mr33857141fa.39.1752939530816; Sat, 19 Jul 2025
 08:38:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250717125758.53141-1-brgl@bgdev.pl>
In-Reply-To: <20250717125758.53141-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 19 Jul 2025 17:38:39 +0200
X-Gm-Features: Ac12FXzPHOlu5REnsZeyzyWx9zIDyQpFtIWVYfIb9ILC5hC-cRqM0O4_7jyb6Vk
Message-ID: <CACRpkdY1G1WyWABbJV2=sGzZLLRS5B+P7ZfJfpOXUTwxhwr+jA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: ma35: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2025 at 2:58=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patch applied!

Yours,
Linus Walleij

