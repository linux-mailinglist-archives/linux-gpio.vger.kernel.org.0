Return-Path: <linux-gpio+bounces-13426-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F99D9E0D59
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 21:52:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 906F0B24DC3
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 19:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6F7C1DE8AF;
	Mon,  2 Dec 2024 19:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sG4bWpNL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701C91632FE
	for <linux-gpio@vger.kernel.org>; Mon,  2 Dec 2024 19:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733169260; cv=none; b=i8R0GxDR90fk0vMkuWbuNpLTdo1d8DtxbThc4ijdYSzYJgFbd6BIOq9ZO/p6rH5TEF24ajYI3Nn+pk6mmCNAe43MStPKDfQ+MCSSNeiO0KtQ0qAJ0nDwGfnasNDbc1Fg59rB4ayX8EWsMhK2FXerQ0YspE5HYzTR6ShbYPVTD3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733169260; c=relaxed/simple;
	bh=YzpguT8kyhs1xYYYzli3b8l8Mlv7u67LCz3qjN4k5go=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eklBeXrG7RSsKpH1J/RHumFXLTXP0zNZoc+mKf7rn5Y/RmzChiIrlsGfac2qEJ33tnN4OAdzneaEkKFwwHGe/PgyDG9QpDG/1ASTlmzznXG+kxphVzOQen5thistGM9+Bt8sUdCQxEnGMuEdHikayUXloTV5ShizfPKM70/sPBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=sG4bWpNL; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385e3621518so1949627f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 02 Dec 2024 11:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733169257; x=1733774057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FukiMR67pYGjuzqlDCobr+BZxGjNjmQXor+qiE2YmEw=;
        b=sG4bWpNLtnDzzvU1I0SVamOuWfC3cvhRdM7NNPZcoOtoi+SNe9E9fLwCzIc3kmLbfT
         4Nc/LZZ69YKAe6Vy9UU6MBEM9RNBNCTUudPFmljomsRWeQJjY0FcoE+dGn68h0j8fjlk
         Qi2eXx9KE2yfkGtGLEXwyRNNFlr2QVWlsgsLI3dG3h0bzVL7KuVY4/Vsp5vulk+PHbpg
         zFHiM8N8dqnTjY0PwtvPjlyKZIYSLWIyzmDeCDaMsRfjBgenipfTMTnwaDK4i3/69rZG
         d3h1uiJjCdSAOoMIV/4LG2kpuIO5gDuEXyBIHEw4DPyFOz2k7AoO4Q2+6822R5tB3g77
         lCGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733169257; x=1733774057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FukiMR67pYGjuzqlDCobr+BZxGjNjmQXor+qiE2YmEw=;
        b=LWfYKg1nWckqWy4V98YqjMkm6w2jAUCxRkHaf0KhkzKfpZs70H3PJbGrIqLGK0ufnH
         lwya2u4iYcy+omWQpRSICZxkEGX6eMWW+qXzRuTUUPrN3sRaHpxjsu1S1agMVnxe4MFA
         J+ll3L3ybpTPlNyRJMKpN/Nrt2FulX5eVwHtLMR6a0whnHd2Uul8ZvWmIWTF/U0aU04P
         KzFUf+/EPwDCnoDKvpTAyIUrC1Ds+dSJmE+HGk5QPWFE/SeHaDaV6p2EQUif83831UK1
         Pbog1kmZ6hgZma4BN9yvsK2KmrzW2fVl36NXA2dB8nuVRMELXTBK1xUuhGSd5xqtnnEv
         hgEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjdZ0Mv28dEPgZmDWTgonBRB4sXJD3tQbUMJd9ohv7yuZmZIeT9G1S8ldRVdIpTDwiSWW05EFpz1d7@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi18192eNH6vbK8uES2CWQuxyZkC8aDOsKMj/1bbpIA9VMCPHk
	eMZisdC0/1raLoQJ1Hv1iC0sntLcS3jCE7byfDdeuzAZsh1Xdt1bqJ1/lHPFShYGSIcFe/q4ErO
	D
X-Gm-Gg: ASbGncui8KemEfRnmuTOUGmBiS6hvCzIV+Inbw3YW0GF/7MdJfYQml0pD8KSai59+0t
	CSI2316e9/DNLgOxWLK20Z2pxmdoT5dJPTj7q3kypgGgKW8z5x4muUNn9u4IvX98j4fvbBF3KUR
	k2SKeVt5yiOX69Mh7Bm4stHx0SvI60TFgO1/o0iLYhGS5+theBgbpQOtdhopqLinBP/HPkIhx3I
	PfxjfIpjw0pDMEicDZa/zMiRaImoYz70HJ3rM54S8QqFc7edGtYgeMe1Rzo8pelUTxP
X-Google-Smtp-Source: AGHT+IGF9hZqufvhLHAFqgDENeLJRt8HBKimO9WGaKlCic6twbJU1CVxbIuKIBHrV5VMO7/7U5qPfw==
X-Received: by 2002:a5d:6da7:0:b0:382:4503:7271 with SMTP id ffacd0b85a97d-385c6ee21a6mr22722606f8f.54.1733169256655;
        Mon, 02 Dec 2024 11:54:16 -0800 (PST)
Received: from brgl-uxlite.. (43.174.185.81.rev.sfr.net. [81.185.174.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd3a71bsm13325812f8f.55.2024.12.02.11.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 11:54:16 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: brgl@bgdev.pl,
	George Harker <george@george-graphics.co.uk>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH] bindings: python: Fix PyDict_Next contiguous
Date: Mon,  2 Dec 2024 20:54:13 +0100
Message-ID: <173316924459.49416.11593755526646855012.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241202171302.51437-1-george@george-graphics.co.uk>
References: <CAMRc=MdyYV=UrtyTHya6V_FK2w+XqC=BU19LrYFeJCLYi9O6wg@mail.gmail.com> <20241202171302.51437-1-george@george-graphics.co.uk>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 02 Dec 2024 09:13:03 -0800, George Harker wrote:
> PyDict_Next does not guarantee pos is contiguous, and pypy increments
> past the end of the dict size.  Patch fixes reliance on pos for constructing
> args for gpiod call.
> 
> 

Applied, thanks!

[1/1] bindings: python: Fix PyDict_Next contiguous
      commit: 7f12d44b311f430674fb02af7e731cb105c379eb

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

