Return-Path: <linux-gpio+bounces-21979-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 960B1AE368E
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 09:18:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F87A3ADAFF
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 07:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44E921F4C96;
	Mon, 23 Jun 2025 07:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Yr+p19OW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2E31E492D
	for <linux-gpio@vger.kernel.org>; Mon, 23 Jun 2025 07:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750663079; cv=none; b=fK1qwQh3hmDeYecdis7fuNdUmK+qBdGq41Bw8jktjLJkKZoupfMTESISPoy+AsZhCNE04sBM8jIbZDfyEL0r3X92cliVlWceDsflEXmSNOcUS0CjmOFRjfBIqQ3I3QwiWa3rtdKpXBmI5WDEU5epN/tSJgcRvE5pzpabLxlZTq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750663079; c=relaxed/simple;
	bh=JiH7hRPLOgVujgb301wm9++iFil/jT+c/aMlUu8BpxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SbScnbqlXp9ipDJMP9/HFwZVrWiulO+H9DHFl7/b5XDBrOtC9HTgePcVfe47h2KJ3jKmt/WRmzxPFfHWncXm6Qe9Kehhman+sfwnVTvoyYRo0zkZ1hVu5c55uH3uHF4liU3qTWUqzy4Xpq87gNbg41K4uGGIre0xWSfmex3g2/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Yr+p19OW; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-442fda876a6so34505965e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jun 2025 00:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750663074; x=1751267874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rAse4kZ6s+b8Vpx9RBnwscqcpgPOHjNp8pAKbBAsk2E=;
        b=Yr+p19OWbC3avYf6BqcZC2tZlSVpHGeXjNeA2L+LV257djvOSjaMJXDRhZTl1aKduW
         PhGUh86ogwehXHSC8QjKm093BOqomfTrUJep1x7BSmEbqTxANG/3llXGYWDuRbBAELQ5
         RyI5dUlwq8QUBERazt8T0YoYVMLiywF3P7tl9PldAQU2SrsyVcqeB0FN+p50SXxNmitA
         ie0AGGO5MaiahX4YwYGV0nxe/rmWIYZ521qij3KX80oQfWiAmwIfQylnESbzKlec2EtA
         1HCinW2m7PXJgwyYBAO1QG0J6oIgQ8wI6O/XHVoE+Q9427DDyLpgWUxlY8ZbiBZPzigx
         4j+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750663075; x=1751267875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rAse4kZ6s+b8Vpx9RBnwscqcpgPOHjNp8pAKbBAsk2E=;
        b=pqfP4zaWfGbUOqhgx4PyFbXvZ0GtUmdlgbGe4Yk4EX1+ZTdrObbYR9V+yqRdBYIfu1
         e3DBCTNow8IB75pjE46PNWPiniCkYyQaLrBaGBe2r//BT8wn2aCb/D2AhhDMYqoFO/PY
         a6p1aNKiQbMZX4GSkFk5BNhmxiIDbczImkIOiv5MoWxi9Vy4vXESFiUCyByrB0Laat++
         MI7A7tFe7D2v+b3mTR4pUhP3+n+sQCg8RPgjgMdXQKT14KKRD6EsGWJcnAREq/Q2AWpO
         EfxyuOUJ0gZu9KygZJZGewmG5axP+3TsgcRo+cYOiarigFamFOnLuoj8YvS5R9jRLC/b
         8+EA==
X-Forwarded-Encrypted: i=1; AJvYcCVrYnbnoNg9eQMCAoUfFgHyoNywEKcY3n+UWB1DyoDb/6cLM/Ur/e01qJU6y7fbFgLgbI7dzd38wRCY@vger.kernel.org
X-Gm-Message-State: AOJu0YwIvDCKjKO1RkPrfuhyhanePGdkXNSxDTU4Gy73o2htg3/nMa3q
	niuE8GeC1MM22NJ93mCPtxuRLCSTflSxlI82uco3zhRxTPphCU2SlOxLdySzwXSR0U8=
X-Gm-Gg: ASbGnctAt2CQCA6dWqvyIr/hOvyDbbY2/6QWaiyvOZRdohNJLrkLQVp0HD1yz3AvZwn
	7k3Y3Vqo/+ChnwMQ6GeZYFl25ahC5M3Dzi0sKliO70z7eXvn5v0FKzs5M7inx6SQ8VvFBjMyEmf
	TI6CI+nrfPTkUuKnPokRsVG4/4zZCyXNgeHTC/nx6euOJvmUrzdthJFTZghmSJ45M4IIRSVRfam
	YWnwa/i0UKn6fCag2lK9pSRSjafOqyzl4O2kqllO45N26hYofpf1lVxBTTalpH28HDN4amz6PaB
	t1cdD0yzojqCV3a9b53u8bWd0n93ap1ObYPqUKg+bLS3Q+VcbFWUokT234pGbg==
X-Google-Smtp-Source: AGHT+IFCpjuidO5QLU/oYBmEBHw1uYf5VwCY/oc7uHhwxQ+CnQNt37ziidV9uUnxD2ZN0RFDtoSG3w==
X-Received: by 2002:a05:600c:3e19:b0:450:c20d:64c3 with SMTP id 5b1f17b1804b1-45369e5f397mr78398085e9.18.1750663074589;
        Mon, 23 Jun 2025 00:17:54 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:5ce:238e:62a6:cbbc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d117c5f2sm8896926f8f.55.2025.06.23.00.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 00:17:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	Daniel Sullivan <danieljsullivan7@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: ts5500: use new GPIO line value setter callbacks
Date: Mon, 23 Jun 2025 09:17:52 +0200
Message-ID: <175066307043.10786.8480717489128765308.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <aFdKce3Go9iF4A6m@danv-Standard-PC-Q35-ICH9-2009>
References: <aFdKce3Go9iF4A6m@danv-Standard-PC-Q35-ICH9-2009>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Sat, 21 Jun 2025 17:12:33 -0700, Daniel Sullivan wrote:
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> 

Applied, thanks!

[1/1] gpio: ts5500: use new GPIO line value setter callbacks
      https://git.kernel.org/brgl/linux/c/a0cfbc67d71c763357a8847305e3d5254028c0da

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

