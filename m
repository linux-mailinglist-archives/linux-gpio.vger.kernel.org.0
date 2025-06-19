Return-Path: <linux-gpio+bounces-21855-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FDEADFFF1
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 10:37:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C44E819E212D
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 08:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FE82264A63;
	Thu, 19 Jun 2025 08:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VkD45JGv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AE8264606
	for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 08:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322152; cv=none; b=CMDiza+OQFg4ha/LQWV3w7UsebV+57o0qVpO+82PI9GF7No+gFcwVfMdPkHtg5buXJe/5uyK3hJ56veqFzUbIv/KgN58TZ9Ejei/1K8hXjDEA/mjAmaG6byXOYbpKoVKWsaRTlGBL1z5s1QnNSIb248dJ895HWWDJ/Anq5sx4cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322152; c=relaxed/simple;
	bh=KUz46dv/HPNmmRvM6Il6GhBzQK5zF9Q9c+15wuOarxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aTI0h5xAsVfgePZqZpZEw6t70P4YhOUVN8l03rXdzeRKL8lv53EkhbS4umGfstPC8deR8yCwg2TWNVnoUoO+YNF9AMRrKL5s3ACmtDcpI7ccT1GdQn34GxBP4nOah8yDw93QGH+tbn3qgbP78VEMYigraPkJrIHo7JnfNwmIiRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VkD45JGv; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55220699ba8so604213e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 01:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750322149; x=1750926949; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KUz46dv/HPNmmRvM6Il6GhBzQK5zF9Q9c+15wuOarxk=;
        b=VkD45JGvAqDyWbqEvJ6FaDP0DutDwPdlrfgSKMJhdJzPlV21PQC8Mle0P8SV5kzXFj
         7i36b4GN8hLxFxANkXZBm6MLHWJCebxIji7q9i3LKF6iI0ZWeORr+o2cOnQkutpckFsC
         wplFzfXd/cXBxOg7w/vcl8eiKfT8HUxgitXqo9ElN+jjbkukjVoo5988tcgg1o/r0yUT
         8hz3bU8ICpGVTq9jAyOK67BySzpE6PTV+/9LxvJTbhv/XQkfk9C56vBSvTXJyTSA7+KF
         R1SlWdGaiTDhqnuVUdIR0j07kdZQs7n4zFhvRlWNHazrzvsCQQ0FGONbYQtpoLwObOVk
         U0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322149; x=1750926949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KUz46dv/HPNmmRvM6Il6GhBzQK5zF9Q9c+15wuOarxk=;
        b=oyW9zB9peRRwLLFuCTMHil4CdovY9G1qaq09fqijE9soG7TYAHI4Ts0382m7f8Om+b
         iSTaIXfycIE41VoUdhyHSS/y/filXgaYC1cQ5Pw/QoNRMaKXQGxGIzkqd4cHHMZutEkk
         oPqdeyqUC6rf17CAU33IphdOMN35bOMvqAKhSV4nSbUXGjPhHwpeOeKLAX0jH5+Vl4uK
         y0E+N6hP9fHxp+/HhnRrVM/0cG4eNJm3x9SG0N2lazmIfuCLkkiqN82BMHCa48A4RqsP
         DUAuMaZgxezFhREB3JFtXNhlHR6mAuFA0qaA1mcDhBbDA7vbgsenda6mPGp2h/xjDjY9
         eipw==
X-Gm-Message-State: AOJu0Yz1PJYvAlFkXbZ6bKq18UtfNMoaWLUPXWMpef81zfXIdSBNk62H
	OOoIjhGA6dJvJSPsqTIWQDbIfw8IcMwGNqiNJoZVis0cBdNAGevsDlTSt3aQjY4YwqfaX1Avxh9
	GLB91JMg+HlSei6jt2aw7Buz0xuqo/PEnN4OViprKcA==
X-Gm-Gg: ASbGncurqBbQag5Xw6aYwE+r+f05c8S2Cr08iJt4Tz/pYxbivvzlZT/M22g3tGY2Yhs
	xhtRv9vwMBg+wEeaFwhVYpamxLwducKRQLgiCg6wR0+qUINgW47V0jZdiPQbTMHjT1xmecnW5pz
	ZkK3mYUxphY4qGTem5Yr0nF/hecmUolSGKvkuumpMVb5d+wVtQWnin9A5itYxlTVUOFOrXi+i0z
	mg=
X-Google-Smtp-Source: AGHT+IH8gdDhvgqHv68xYgng8lKIS2cL5/HDET6GaBoi/sUwyPhdyhtejDnh77c/sFHn8pTtyC9K0nsXpo0/Zf7DZT0=
X-Received: by 2002:a05:6512:3e24:b0:553:291f:92d with SMTP id
 2adb3069b0e04-553b6f74d65mr6198225e87.57.1750322148760; Thu, 19 Jun 2025
 01:35:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org> <20250619-gpiochip-set-rv-gpio-v2-4-74abf689fbd8@linaro.org>
In-Reply-To: <20250619-gpiochip-set-rv-gpio-v2-4-74abf689fbd8@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 10:35:37 +0200
X-Gm-Features: AX0GCFsIiQS81dI7axg97KmA9gzmGEG_3kUmqhJIMLm18HQZTbPd7_8gMWe8jkc
Message-ID: <CAMRc=MdhuQJvTwQRoXxCVa+AOt3ryYrXG1ECsqYwDKqFfAnWEw@mail.gmail.com>
Subject: Re: [PATCH v2 04/12] gpio: pl061: use new GPIO line value setter callbacks
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 10:33=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

