Return-Path: <linux-gpio+bounces-26668-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3911BABE9A
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Sep 2025 09:54:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D3C33BFAB8
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Sep 2025 07:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1E392D23A8;
	Tue, 30 Sep 2025 07:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GabZyYet"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7A52C0323
	for <linux-gpio@vger.kernel.org>; Tue, 30 Sep 2025 07:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759218851; cv=none; b=KIC9uQHVdBc27EmGEfyCqnmQe+0daar8s4zhqhlwxHIIwtRFOUtQxkGpHdgOl071DtVdoSma1jBXZopSlPE/+v21zph7BhGpu9Z+dXyZeMEmRfYYcfAM92kttb8yYBGUwE10L9DtCtyuCSHQcefSRqea0papRNQdemDk5Viyh+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759218851; c=relaxed/simple;
	bh=4VdkPXeBH6NP4siPVYvQOBh3a0DG9hIaVZnRYw5ZHIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BJta/9ELWI7t6CdNdqA1lYl9JP8CG5DjsD7vmMGXvWjfR7QGwGg8ipqHkBjNwfgC2Zf39j1D3cfwOJkUCJf4dFgsj3ErFSqKI/1YBM+2noj00roinEtbNvvESrdHGCGe4d9AxQK1UVdIiZ+bjTfPZl7QfjmjvLMw/etSrXSu+z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=GabZyYet; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3ee130237a8so4012113f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 30 Sep 2025 00:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759218848; x=1759823648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DBWvcTyxOaA12NdLYzKitgtgTNT98k7mjj1jzcMRcLI=;
        b=GabZyYet5NAarQTbdSD3NVgv1QPypsI0J/iWmxnVbBKkNfdE4v8nDR9sEBec2Lh/OY
         PxAT3k5j6z4DJ92zaqBDdtBh1nT3MzHhtKFqutIg52Y/TogGVEeeayXiCJ3NhJYxbSvg
         iEuN0Qtnlt0zMA2fpKm9ZGF5DBYm1L445ym4WDUlNNO2V34A3y0waLRRZ8f5NEg4c6/E
         XdZtFRkUcHceY88KIBZLSgtjKXsB6RQOFmACCNsfU1TzJLFKoHt2RReoBGU1wtJli0Gm
         gTSkHHLQbSGMSWmdNUhKTGDnQflQo4KqpSEnVlWzJH1qcIBbXsJJQhrbvVbwl4sRi+wu
         XEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759218848; x=1759823648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DBWvcTyxOaA12NdLYzKitgtgTNT98k7mjj1jzcMRcLI=;
        b=v23ilNupfLd3g7CdeakUwx26vvKnX2SMBMsskseC6U1/YIHr+rZl/vYBN4ljkTQQiY
         mZqCLG2TSEhoayh/C3KzDoR9xzBDXTzJwY6uhkYlWIqkQZ0oImYUwgG0EqLqXd0pHoIM
         7VxuRJKVMoogiCaWAe9udjeWMJRFa/7qFIrvY+9JioXmXLHP54cDT7fLkNheZaLQ/vLd
         5y+3tAnNJ+5jPTipoM2e6E2BSpcZtY+9e1drrwfCDLEW3JDtrL7REGw/ImS9BxuROyWF
         C+uZGa9ZWR6vAjq/wMFKUr4p5v1TfY8l3K/dB4I2Bk0gShGlHFgrY6CnsJImS3IsJm4U
         kTQA==
X-Forwarded-Encrypted: i=1; AJvYcCVgqSIIzKeXFRKMH8f5MfEl0hr0aFQUjlpBSxGecXI9XVYsdOsT3gDu+sYFPklrcTAfW3+elJeX6QMD@vger.kernel.org
X-Gm-Message-State: AOJu0YxyPEGvAq5cxKUHqHmFyBF4FEyQRabVowCbCfbwFvZMWuVE1/8y
	YXN3NA/gZHQcES54ktlgkD3JajgfGPSPFyPLtb+0MBCefn6VoYJymudjV3rWpNMtaQY=
X-Gm-Gg: ASbGncswJ2Kwirh+s6XucWAs+fbX3f0V/1CI6nuMAAkOI1U2RsbNQXtFDMgh0vKxOxz
	DSUXvjkOTSZhO+ZVrmgMh81KpbK8ybdSLcKaOdu9TZRmPL3eHkMAuQaCvdRFJD9aMouvciRA76h
	Ao1nMqOjZKcUmpPSapJZcnbkICOGCxQCq9tiP63l6E0eTWUwbYXnSQGDiTP2WnvCOYSFJ3tB1wZ
	RB7n0HPD6cVQK2/0u+ZW7NL+fTLmDgIfxlGRchTBWwLPWkhvlu0hj4WeKZvNMgmrgjhA9v8w4TS
	cQS+olXPoQ82OSo4MclY+9E3ndUDURHpeTGq+CEdgsjqXTe5EQ94ySa3RvcKkMx0IoLr97Im+rQ
	4kCXhtlE3/6CLs4F2+vYXglRxN2u/RSR/5uUzngqs9OKp5Z5L90hN05NiSWvN8kbiZyKh+w==
X-Google-Smtp-Source: AGHT+IH4qjLb3VWmEMpt8mLjEz867avnsvy29FZRpZUOPHC1oBdmuTvrrZSoMsgTy8jZHLKX23S22w==
X-Received: by 2002:a05:6000:2203:b0:3ea:63d:44ca with SMTP id ffacd0b85a97d-40e4adceb15mr15343331f8f.32.1759218847601;
        Tue, 30 Sep 2025 00:54:07 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3817:2e85:8b35:9e8e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e5b63b407sm9321495e9.2.2025.09.30.00.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 00:54:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Erik Wierich <erik@riscstar.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod 0/3] bindings: rust: pre-release tweaks
Date: Tue, 30 Sep 2025 09:54:05 +0200
Message-ID: <175921884297.11146.14838684003913613834.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250926-rust-release-tweaks-v1-0-beae932eb691@linaro.org>
References: <20250926-rust-release-tweaks-v1-0-beae932eb691@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 26 Sep 2025 16:35:41 +0200, Bartosz Golaszewski wrote:
> Here are some final tweaks before I do the 1.0.0 release of libgpiod
> rust crates. The first patch completes what I though I already did last
> time when updating the examples but I must have borked. The second patch
> just runs `rustfmt --edition 2024` on all source files. Finally the last
> patch adds some examples to the readme so that the landing page on
> crates.io already shows how to use the code.
> 
> [...]

Applied, thanks!

[1/3] bindings: rust: complete the unification of exports in examples
      https://git.kernel.org/brgl/libgpiod/c/e5494942299014784203e6718dba6664cb514958
[2/3] bindings: rust: update formatting to --edition 2024
      https://git.kernel.org/brgl/libgpiod/c/d0f1291f4137c7243f44b118ca6ecfe0cd4fd92d
[3/3] bindings: rust: add examples to the README.md in the libgpiod crate
      https://git.kernel.org/brgl/libgpiod/c/2eab5e896f7dd8e6ec5bea5070b95f09a2fbbcbb

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

