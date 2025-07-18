Return-Path: <linux-gpio+bounces-23440-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1620BB09D0F
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 09:56:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F1701C27E25
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 07:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F53F2951AC;
	Fri, 18 Jul 2025 07:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Sh/UfQU4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9792B29345E
	for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 07:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752825381; cv=none; b=hmyw4ak/d2dB4P3nYvXNGOW7FiFRuSEgNdZIrMokk8f3k+eS9fLOqB5AucxChIJGBD8aiU5RG/yc+8HxyYlXPKgv7MkEb8KsmYt/PU+anTMq3VQcTr9JIWz0WXtGaU647RSKQRM6IvU6NIZCl7sOup4ttBbxcSMzDYyWsfhkwok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752825381; c=relaxed/simple;
	bh=ftRw5OTTN9pPVwHGIIkCV4t7mbPYyECa7PWEzFp3EUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mbVg6cbGlOZK8GZ0aSoCV5AwUDLbRiLsI3UtfLKcMBpIqqM3+djXtXBTjoVoyuvq+JbARbBjQkp7Ermn9O4867izscCTCeL8Gmvrd58kksAJyzjrgA5uwvp4soUpoSHnq9evDSBKfF8WteCVTQZxgKRLPxO4yJpwulupXA0i9yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Sh/UfQU4; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so12572775e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 00:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752825378; x=1753430178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9WG6llnBzWL3MBIZ4vJuqyDtZMdkbt5W1e9HnPWqk+0=;
        b=Sh/UfQU4a8MvDGz+54ZodRBksOHOBUT2CJMqHJn4jmScX7XTMuIG50vSTZO/K6uOej
         D/EWk13U/mlVo3k1gOdP/j7Dco3Wu7oVbas6lhBLEluI+3wlqmqWLNYRNm1Pt5yWS7Ki
         pM+AhF2bpCSSTAu43kHpXiMeAjJVIxzBZIQ9B43IZtjYbMtPRs2XL8AzQzl+nYC+K42g
         hEW7zcTrL/dMOd1vHX89aewTE4nwhlpWAE38L5m5M80Woysa+55IlYERtiGMla6eqQ4y
         Umip+dCztfyo6mz+Qz2VCGH6Wqzfcxp0cBFcsbMUJJKv0NfGbw5an6Ipon2iF4X6Ldtp
         eDoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752825378; x=1753430178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9WG6llnBzWL3MBIZ4vJuqyDtZMdkbt5W1e9HnPWqk+0=;
        b=hVB/wY/01H5KsWovSeTyqpXHsngbt9Fr84Sj0hh8vGtBogyolovo743LpmmckUSq53
         qGlTosRBaoboTBJnbMLGMHBJgfEr47GmzkrzG3zR3MXuukIGM96qJQTJ1q7S63KTFmFe
         osw7y1ODBbXl0ico2zS6TQKzVfBQzVfeVM4MkyIsMBmJJuUst+An0iAzWRAUooTAg7ai
         2QP+TfJ2AabvqVzF0cwK3s6Ymov1zTYQtpwRBpcnSJ7kaDywkC0fRX6TIczSUJ7wHV5p
         7ZK74/Ly54YP4I2vVO32hYM6qo+443RZgtk5xTljkA6Xz4hcddoWI6uPMLw/i98UrFKr
         lbPA==
X-Forwarded-Encrypted: i=1; AJvYcCVH1Q3PGyNiCTo2GcV4fnYfliaQQuoVlt3HOBwtlVEVtZn2UT6IkRCSBVUqqhLP4yW26rc+O3ZLQpEt@vger.kernel.org
X-Gm-Message-State: AOJu0YyShbZtZTzpVUAZOPcLid0DzyW8ak8NuXRclJgmnLVQ1RF2KD2s
	VBFo2bq6MUIE7CbpmziVi5Ir/Xj+V/CPsK8xqqpOklEkeEWf0xdBnO2BhvPf5q1r0JA=
X-Gm-Gg: ASbGncsR0u/I1dvtOoUmbKNqVrhXADuFGOcywGYvlCNQm5qItxRRXAn2oL4FtBoNHEJ
	RN5bkzBIqKtXRxEDdHEBWpumWJBcciZa3NgME77wrTWqcXE5bvklKtMRqQLZBY7hNSm2gkWyaID
	QpnfjSjDqdE13GBX3sc2Jy/BIn4kpDnHwx9IYiRbU6t+iRjs13HvTqnVRNrnaQHnAbZlNHdstW8
	OHg5ZtOOfwJpsQJ4C+8NH3KBV+6X0h4wHkUbCIfOAXeAb6QvthjwEsg26M/3Z1xJ6Ss1HIdjwWO
	v8r+Zcc8bSM9UnyZF0Ln5uwOzVS3ew/MFzpRJVrVeTmJ5Xlu093aXME1VqjAmQNmGDhSItCcXvG
	ULdLrFkT2hcYrcpFd7SCs
X-Google-Smtp-Source: AGHT+IFjvvtk0Gk4O4i1psaL5hF0WvEUOZLUp4xP7m1e2rW7bDd4F500xiEFX6IzV9sl9d9EjIZj+Q==
X-Received: by 2002:a05:600c:1d03:b0:442:f4a3:b5f2 with SMTP id 5b1f17b1804b1-4562f7c7596mr76814415e9.6.1752825377878;
        Fri, 18 Jul 2025 00:56:17 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:be63:a233:df8:a223])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca48a23sm1080851f8f.54.2025.07.18.00.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 00:56:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Khuong Dinh <khuong@os.amperecomputing.com>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: Convert apm,xgene-gpio-sb to DT schema
Date: Fri, 18 Jul 2025 09:55:49 +0200
Message-ID: <175282531514.45055.3453969331255231197.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250714202821.3011099-1-robh@kernel.org>
References: <20250714202821.3011099-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 14 Jul 2025 15:28:20 -0500, Rob Herring (Arm) wrote:
> Convert APM X-Gene Standby GPIO binding to DT schema format. It's a
> straight forward conversion.
> 
> 

Applied, thanks!

[1/1] dt-bindings: gpio: Convert apm,xgene-gpio-sb to DT schema
      https://git.kernel.org/brgl/linux/c/9bfe54c511dbea9ae00db26abba1a084fb0bca59

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

