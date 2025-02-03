Return-Path: <linux-gpio+bounces-15226-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B61A25415
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 09:16:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCF951881A9F
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 08:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FBD2214812;
	Mon,  3 Feb 2025 08:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="i3apWOqL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1F02147FA
	for <linux-gpio@vger.kernel.org>; Mon,  3 Feb 2025 08:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738570389; cv=none; b=j5TTXCV3WzRJY8NVO7kdgooDjOjV9La+CsKRXt5Y2ZzTuViLgZEo9QIqJPLQTVEREYTrzmWmTa4La954XCfpwIxMNlUWS3Tap7ONNoddaewBLBm0WPWwoc7LX+Vvks7D0JczDA8fhYIwh/yMS1UZKScu5TA1yQLbeoQt6RZvxN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738570389; c=relaxed/simple;
	bh=8BzrjfzW6hMDq8JMBmAHvHJ/8jbUh41Fukiv4MAQV0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iV265j6OrAwzw3uMyyfT1mEB8yfEc8o85obEvWPn3rRgDBeQp+KLWJjF3PfLL2aeagG7GnzibArG5RyqpX/E61Ep8Hssp6wRe5UffukORE/nVDNz2t0is0eruf3YeUxU0oTMYYyr/wA6ln9uWvDqzj4N2DDEcit3VjzYT1/qPto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=i3apWOqL; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-385e27c75f4so3414406f8f.2
        for <linux-gpio@vger.kernel.org>; Mon, 03 Feb 2025 00:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738570385; x=1739175185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2IIA2EevMgnUnT2y0Tcftlgxz2rZdSe6sO6t8T4gDhc=;
        b=i3apWOqLHYC6bL1RzMegFXJE7HYUYkRMcGjbc90X9vOytR7yAWZxhKFnu6pjVbUb59
         JdocnU8BZZbfxuyxu9WMB/QBikj2BDJjt8dhXeqKy+ztRVfLejhJiU2BnHxVHbYgE82+
         asDluLlVVwMVUGL0daoY0HSiyJAj+LINHn43NvO0UUdiDlHfoP5DKo/2JEvmE8ymgzyr
         Xx5OnLRx2RBbBBi1RWQyEVD93Yv9fj/qichojPCL0f/+Gru0mdEwxwx00UbTGgjJMUTr
         bfSDXCagosr/BeMCs+R1UrWSXFztVusqTOqMqY7CfpxO26FTZ4tAQ1ubKlaSIhC0gsKF
         yO8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738570385; x=1739175185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2IIA2EevMgnUnT2y0Tcftlgxz2rZdSe6sO6t8T4gDhc=;
        b=UqKdcf3jOXL8XKqExjj8yS0r0ulvp3Nf6Fs7TjKgKwx7qKY9S8zTJf6RpMyOhJBjea
         3kNmQJ0fsud4HqZGhKWs+Xt6O7XPRVe4S+lEgPSe7GBO0wRAh0XrfiDQnvGD3wr8jzZF
         sLvRDJjqycsj8AkjEhKPcpuNFJUc6jr6V+V/maivdNyS0gl+0x23NKeUVLm+YnhIFleW
         SxIoFmbu5lwHaYe3vBo+Pv4vPhy6sqO3sIk140IN5b+sRhfqk/kASMVijYFJGCRopkVl
         h7EKNNdwiG4Cr2eqwLkNMAc0auUZJZeyyEnpJ3IjZ6++TR08zIF1wPjOQmunGC0e4xGs
         y/hA==
X-Forwarded-Encrypted: i=1; AJvYcCU4ECdqN2ROEtaZaYmyvOdxLSK8rQIT5mnmHuQSdvVVxGyK6+em0GNoiogMvzlFSQF58H+OoIecDWxA@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp3S9Y02P5BQdbdT8mFY/pbL52CXJc9Vy0sffJOsrh0qq5g4xU
	Wn8xlnmeSQvsouNILWbQVL8VHjkblVAL9g4S1ONXeQYJDU8ZxqRzMs+eQJ1uQg0=
X-Gm-Gg: ASbGncsakI89sP7P3mzQ+0w4fPQ3uV2B2kSj/7Jq5YX9j1sF8kZ2XiEBM4Y/p1/f2/M
	l55JWFz0GrRq50+LuSnhFJoaLJ2+KGqQnSnBllGsX18k6PKfkt6suD0ZSox0x8P1mG3L9Ah1Vp3
	A2Rrny7lokz/77rUPAugJ8ZjLFMZbNE9nNDAQgGEv2qgsMtrQMuEHmH8UvVhq4fqSD/CgHMqKvl
	9EfmWL2u240WNQDXHf58jnlQPiSU/HBQsuu++MvSY9/SUhMjIjlibtWXpn5AQ7GWwxNuPvrN1Yd
	KEjYwKjRqy8cww==
X-Google-Smtp-Source: AGHT+IF3lNNZmS2B9T8gXfcE5kd5EuOjnSuh3iWUdY1d50Algj3kP3sHpQaRcW0lvgZf4+fEDGkUsw==
X-Received: by 2002:a05:6000:18a9:b0:385:df6d:6fc7 with SMTP id ffacd0b85a97d-38c51b5efb4mr18533137f8f.25.1738570385202;
        Mon, 03 Feb 2025 00:13:05 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:62d7:938e:c76:df44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1b574fsm12019825f8f.70.2025.02.03.00.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 00:13:03 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Nandor Han <nandor.han@ge.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	patches@opensource.cirrus.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2] gpio: Use str_enable_disable-like helpers
Date: Mon,  3 Feb 2025 09:13:02 +0100
Message-ID: <173857038027.20723.17081473974273068659.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250114191438.857656-1-krzysztof.kozlowski@linaro.org>
References: <20250114191438.857656-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 14 Jan 2025 20:14:38 +0100, Krzysztof Kozlowski wrote:
> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>    operator has three arguments and with wrapping might lead to quite
>    long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>    file.
> 
> [...]

Applied, thanks!

[1/1] gpio: Use str_enable_disable-like helpers
      commit: de454ac4fc5a117a4264e8bdf60fca58021574b1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

