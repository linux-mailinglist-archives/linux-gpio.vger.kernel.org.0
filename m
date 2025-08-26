Return-Path: <linux-gpio+bounces-24984-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFA4B359AC
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 11:59:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 005267C2ADA
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 09:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ED1E31CA45;
	Tue, 26 Aug 2025 09:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xUaOVQju"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89252F3C1E
	for <linux-gpio@vger.kernel.org>; Tue, 26 Aug 2025 09:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756202351; cv=none; b=YCfHMB9s0DHoYa7hWyCIWdoaV04a1YnuS6Dsdbl+OIJFketcZxAF2OcjBtVnANX9GyGGpHm47kfaHYQwWtHfawLqdxOU8CQVuFVmalzOPOPTFwaFTPY8IeHufH0hQv1K2ID5PXCfpruQtFBrycGUAroo9REsRiPGXv46SDgpLxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756202351; c=relaxed/simple;
	bh=TLQe8HKqVprzOWSS+QrcEEJ6qsTop6HAIBHPmWLduOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vjb4LZiD6KDLR+tMkhqZ8VNJiyw4PRVZn2sSmsCwo5WRDEvgr/KgZERrtOl1GqTvpIVGk2mUPuYDvNcgRyPaaOASz9eUzDhwnFrkDHtMFiBgo242+oOS480rjOFfToxXUmLfKDgKcbR4ggSk/ujyMbtFg/HnEvz0LYNck27anGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xUaOVQju; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45a1b0bde14so28962885e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 26 Aug 2025 02:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756202348; x=1756807148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+Y0JVb+zyxoD2ZTloOvpkOul6QpmpNVbYqGaduRqGk=;
        b=xUaOVQjuS0XGQY+NggXHewaAIjKOx14olU/RNXG73mRF4WSM03fmRopl4J2XuYuOh3
         +mEgXvZUSMz50uVGVAfB35hfs1tzJdZYdN4aPGPacB+r4D79aNjpJTxxB1U6nRNurJ1t
         7e+fXNu1B/NR4T8X+I0wXChKM4Ztm1LwqSURefHJnnzAkS2uPeg+jh7xdYRuLOArv/l1
         S8CNeGEy5I5Jvhf3m4bFomHwnQzYZj4L538SZ0j35MSnnOj1AKKXpNv6Y38b61aW30PG
         2nVcsrjNdKxb8Vf/u43oj0UhnYc+49tgAx087kOPn817ho/77+5Di5i2wvORoYfPimQ3
         CzBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756202348; x=1756807148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+Y0JVb+zyxoD2ZTloOvpkOul6QpmpNVbYqGaduRqGk=;
        b=MCbKqt16ZWAtMhGmCLh2c+K/svhaDXaDAUUEtAup2WcNzOIbyzzcDhBxzf3m11LXXD
         Y1VTjCOJEB1nnAHOuwBZsWtqe48qv6cgBYXwLLwLJ3dgUp4+hDgC23FzBDFms8R2yV/j
         dlpH8sHCgZpIOuW4C+qTlEDHwml1hG8frSXfxvWy2RQxvbR+6SudUGjgq76+xO2NofJn
         qRDJ8xnLKgTp18R/gP60rjMpXI9IiAiXlCDQmMGSq2FHuk4gcNdwlwfgYxHQ7rpTtcGR
         915fL9X3kEHCro6f8WpeMqM3ABogQUjuf8KgHyQ/NQogdiH35utYpfJyfl797RtZbGao
         LrQQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4uK9OrnR2sl24jO9T6+V/DZjFEndscDCIpqRZq8EHMrHC32/LYcx69I2b6qIY2+do4JYziY8ED9zn@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0p6TSzbnAIjMxg9pI3gJz7HYqeQbaK3K3f1pr9PFXV4SI91CP
	vRTg8ksZfYI+wxReyXeddY7e9wyb6bTMvUyHf125bO74GPG8+Tv+7Wr6V13+/+PosTI=
X-Gm-Gg: ASbGnctvjmDApZj9GjD0hZac3kin5QaIpQgF+K+jDeoRp4KV6yAfqaBNUmYiwDtcKdz
	k+EImBzGF4ALlnX3qkWh3eVkw3BgNFvjjzduGlE8hK3Klffi3Ey/f3baE0xZHgdXPKQ0DCAvP0b
	qhRbGjapJWw0ddrG3TwdD7ApXbaNXwu6L7waP/Fg6SOc6N/4K9WL3dVpBIkc1IwkThf7YIIsW2k
	Lf2y2JQH9DEfSYHGFVqjoDmZqnt1yb9J4F2FiBxohfGU8JibviV1MnmTBnixx7wkPBl3lhrWZJD
	dTjA1P17k+lRjBz92tOU02lc7SdSReMMGsZk3JBbudYyPOMO7kO/ZNj7mmICIopWpSES0yW7lGG
	Mbj/En/dUHMFoIb+Pn+pqM9fVO7BP/pG2mYDj+KjXpSqS/g==
X-Google-Smtp-Source: AGHT+IHBhKg7IjKrhhcVMyL/r57y1ugEvw4mEz2iVwUNncB45EjnSI4PTdqiXHRrUmtm1gPJ4N/MCQ==
X-Received: by 2002:a05:600c:1548:b0:459:d709:e5b0 with SMTP id 5b1f17b1804b1-45b5178e893mr140193745e9.5.1756202348058;
        Tue, 26 Aug 2025 02:59:08 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6300da81sm60418635e9.23.2025.08.26.02.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:59:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 1/1] dt-bindings: gpio: Move fsl,mxs-pinctrl.txt into gpio-mxs.yaml
Date: Tue, 26 Aug 2025 11:59:05 +0200
Message-ID: <175620234226.21143.1718612785479357856.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250820164946.3782702-1-Frank.Li@nxp.com>
References: <20250820164946.3782702-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 20 Aug 2025 12:49:45 -0400, Frank Li wrote:
> Move mxs-pinctrl part into gpio-mxs.yaml and add pinctrl examples to fix
> below CHECK_DTB warning:
> 
> arch/arm/boot/dts/nxp/mxs/imx28-xea.dtb: pinctrl@80018000 (fsl,imx28-pinctrl):
>    'auart0-2pins@0', 'auart0@0',  ... 'usb1@1' do not match any of the regexes: 'gpio@[0-9]+$', 'pinctrl-[0-9]+'
> 
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: gpio: Move fsl,mxs-pinctrl.txt into gpio-mxs.yaml
      https://git.kernel.org/brgl/linux/c/66edbb1e32eede16b261a90014451d67119fc875

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

