Return-Path: <linux-gpio+bounces-20979-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9D7ACDB74
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 11:54:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2E341664EC
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 09:54:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A13747082D;
	Wed,  4 Jun 2025 09:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="m/+OAtlN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8243428C5A1
	for <linux-gpio@vger.kernel.org>; Wed,  4 Jun 2025 09:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749030848; cv=none; b=U3Oi1jLrLhtxuv6p+OsQKvqV87JJmaK+ueDGeSwc5vtHu6DPLdqSKwZvFdk1giMlAFWLNW7V6avSGqvN2oMzligMkvkH226no363nW6aLSrwuMOZLqydYPDKRYcTXBLhkVc+FP35o7JtWwr1qUauxagDuiFJ66w/XxwDJsWJvSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749030848; c=relaxed/simple;
	bh=7/Oha6Eo5reH/Z0/Jyw/NK0zfRkA124IU42KP6Bsq5M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NWx304rPLmRx9zvmydVTBnkmQCeP5EuRsheeVRPEeUF4v28/aCIr0O6HfZT8eCM0v0UnVkGNrjuTIfoW93Jm02Alo+TwVxR+xjNMQ8+BDzmN1ypKXqhjTvGCGaB1CQiTEYiOXLi6RdY4zHm1RS+s9LO8eXg90QEom0RpcAaWZR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=m/+OAtlN; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so541809f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Jun 2025 02:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749030845; x=1749635645; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=So+7bY5B94Wz+9+ULUTh8P6IFbxeLILw2vz+4Ibi8P0=;
        b=m/+OAtlNIjDah2GWUtaaIB/671lGfIcAE9+tlx+IHiUqCc3+Oyn/kCobCh6wUadpAl
         OsEH2K/2EAQ3mDACN/xBpvBflHU0d9QsRPJjBr000Fh6GucMeH1iivWrs6r32q1wr5iJ
         lIH6VAxcC3IUM7f1hVnra2y3LySShHMkTo8cYFR/yJx64cegB02or2UtnJ8zT8M84zB5
         Z5zvnbOMR6WueZHEmv1c6SXGoqdnrrXPk+bAGNqh1lXuZidVj80UYp5+CnDudhAEl6Ze
         9A6ucQfnKVoZAOp4jsOYGzD2p5087KD4x0a45z8Io9ONwujTxFWfj4DiPCw3x79YJtSY
         u22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749030845; x=1749635645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=So+7bY5B94Wz+9+ULUTh8P6IFbxeLILw2vz+4Ibi8P0=;
        b=eWMMN8+JAlIt3W3zluX+708YuUjET6VtpjF4ae4scuLfhKCdfX95lBrcmcoZLN5FPF
         K8XPQOUflTj12lsqpR4se8F7Lp42LIG6pwNBcVlOJj1X17ZTPh3jN2fmrxwhKaGrgwdA
         ebDU0EDEvx5ugOactKU8LyFZ5qJn8ewonEJy7jpTGLkgzSbxEIS1n6qoH0FADpWwhPB9
         E+Up/dchcexxBm8eYXvnmkhEupJo/Rnvkg2aX9JrQMO2Mu0PqR154JvgWXzPIT3u19LO
         Axx2N9jlWdPDjc0vYxp1DHmcJWRxXL97Q6HUBkNERgsr8xCHhjXVjNdXPOe9MNGfiUmI
         A4pg==
X-Gm-Message-State: AOJu0YwvIeOCAlh5vNJDAkF5KQg1Fvwcv6o0D7OpIwdF07s8cd+We1WL
	9LCSTW7ueJdJ1M6haeyAupFyEWM4XUJlmDfpuIiJ95BQUOwa4TNGdsTg6K4O1fkDswM=
X-Gm-Gg: ASbGncvZkEhtNyHuA2Wy59yBOQx0lb0LxQWpgmW1vI4H/2fsfBg0KJQet1N7uFR40Uv
	EIUINscIjSOozwBPm5ftMhXcT+I+8eJR0VYxeMYCnvFuAcU1JGpDkSMm1J4VZKJCeFEmYv947DM
	ZljL01lMf+tIOPWg20jg9vGOVhRn2W9GPAXJfg2KJ+HQjCKJig2WxHE0BJePbVbAq5TsfWDWpyl
	nBqEJppLHhziAmUNb45tHLuOfISsEc0iG5KnLMh1cjONthCeWZiFajBMW/DV/9lJ8H1jfOeMYjk
	hfYFUmGMpGiv7V981Aoel0RQk4AQvSuDSHIUSzvlz45b7Q==
X-Google-Smtp-Source: AGHT+IGVnnTGFaab0DoGGUha9sYF8F3VVer5gWeJ8Iep3h0nlD4X+FC/xKBZrJoQ7I6a/j/fqc/uxg==
X-Received: by 2002:a5d:588a:0:b0:3a4:d367:c586 with SMTP id ffacd0b85a97d-3a51d551389mr1654755f8f.13.1749030844742;
        Wed, 04 Jun 2025 02:54:04 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:e8d2:e71d:f170:23e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00971e4sm21525640f8f.65.2025.06.04.02.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 02:54:04 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 04 Jun 2025 11:53:55 +0200
Subject: [PATCH libgpiod 1/3] doc: reformat conf.py with black
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-rust-docs-v1-1-8ff23924a917@linaro.org>
References: <20250604-rust-docs-v1-0-8ff23924a917@linaro.org>
In-Reply-To: <20250604-rust-docs-v1-0-8ff23924a917@linaro.org>
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=683;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=duFNkABcyruA/b+8Fi1QG2o9TAeLhkObsX0mFxW/AYs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoQBe6vNAAKYLJPvZbO+GU7YUA8PgRz7T6ujFPX
 pzgruJNSrqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEAXugAKCRARpy6gFHHX
 ciX3EAC5oqLdE9AikX0DthHmFT39nSQVmL6BPdG2NdHcKtrE+3qPjo5/TZIHgE1wWNmR1sxh4ng
 UpJ7LSHMVb9tRB8QHeJ+wL5GP4tJS81457Sr1s1tk11CJTPrnArCLWYYdUzs0ZMdrWE4is7Q5UR
 6losUn4HKn+pdeNtzpQWoORJrEvFeQioiNG87aSG3t5Xi/qyoSgcQVDJoLVB1SpdBBzZ34XGj/P
 B6/aMjgGQOW4mtAUN6ViNIGdP2BIdjZBnONmnRedkJ9Ds5f5j1EQdi1xogEUbwsy+4kfhmKZfI7
 KV9ekonAWJ1XPHSEheeLqgvWaq6qI3cFRXmiDXFPQ6gDdVJp24DuFaKdSh+syjod3W73hA3C/RX
 4ZU9JXQF+4Yisk0Lc82PndDH7qLSH+qUrCRtwb70w2zUK6/G3VvV7HNi8MArsDqiQUkTXqBO/5a
 Q43HAn2nJOccYGwdwn1/hTVw62n47lqmz5uZj8QySf+FFNFryu9nwPEB0KVCcUMo9Zx//4YWmr/
 65Ntukjk3jVI/rwGqXh3eqvEuO7INBpcGK+HpcAkc6DMRucZL7hfQDz2tAfCsh2Y/w+sAfcqArl
 UKdEBUZcdDlSDoqeFtky+SDAzbz9W3gzIH+qID+se2jx4HpYHnU6sX6smaGezNUXTO5cFSaJZJg
 +ICMmDoLz7ogaRA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There's one missing newline according to black so add it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 docs/conf.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/conf.py b/docs/conf.py
index 6fb399dcf195bd01d1fa739de89f142672f3f16e..d89c13454baa8fbe9dab17b7c3fde6fc59b577f1 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -54,6 +54,7 @@ except ImportError:
 
 html_theme = "sphinx_rtd_theme" if sphinx_rtd_theme else "default"
 
+
 # We need to know where to put docs generated by gi-docgen but app.outdir is
 # only set once the builder is initialized. Let's delay running gi-docgen
 # until we're notified.

-- 
2.48.1


