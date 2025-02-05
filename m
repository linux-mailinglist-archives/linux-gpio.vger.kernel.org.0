Return-Path: <linux-gpio+bounces-15366-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A617DA285B7
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 09:40:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9519318854C6
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 08:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC5C222A1ED;
	Wed,  5 Feb 2025 08:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="x/bFPTko"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D530425A647
	for <linux-gpio@vger.kernel.org>; Wed,  5 Feb 2025 08:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738744827; cv=none; b=luOGsQByTMTdT5QwqmhUA+XJCGsdA2nj2JcuGlf1LjLriqQyG4C9LRDbJnUAWgsid7pSWxGW5MFJeCC8VXswgPrjqpFZiOjAyN837yHsvfnldNLdRk4GZXChF+3F+DP8hS742LkBBAtDJ4BChVTD2Xl62/aDqxOZ09PgaTehkVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738744827; c=relaxed/simple;
	bh=M2MVI8iALnKpJXMVChrCSiUClSCLtLgDztXe680Nrzk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hi0rcaecVXseMUuMQyXN1ALWp3grR4ycf14LFmjKU8f4hddOedw3aeTstdvXc1dMJeJ2b24Qp/SNtUTiTYyKsRx+9YwFIwN/rwuzQV1jYGSgtImG1O2S2NNN1XahrrW987Vcw8sSH6C2MglGliyMRmPTKJ5MpjIL/XB9SmHdinc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=x/bFPTko; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38da713b9daso1537467f8f.3
        for <linux-gpio@vger.kernel.org>; Wed, 05 Feb 2025 00:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738744824; x=1739349624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+es5DswhUHJuqnAtb0R/kgWj5lIvrRgBlmdAByRuO1k=;
        b=x/bFPTko+vx6Pm+bmmT7pmpTeZ3JiwfE5oDBEwpc4KngjteYF9TbDP1bctxBAWoSWl
         LvlN3V6zXy3LzKoYlxgnOB86pj0PE7QQkVxXvcEoGB8nZrnNEsEMMbiTSAlVaKNEd4c5
         ft+KO+wu2IFFM0s1qmnZbo6rFWBciXh5ragUKKtyKjWv0z9DBrtDYO2Jkn+jCCI3jUYY
         /XHcL08ag/NDhWguh2bfA3eSeoEfAHpw8C68nhaRmhdYRl4NjfKWBRHEohK1oB5JUIfz
         21PP5Y+8jg5KuoQWKodEaN9V1BgUeUZswUxA5nT8+dMWwm6RMXWTamC/2Aegmfq+2DXc
         4aTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738744824; x=1739349624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+es5DswhUHJuqnAtb0R/kgWj5lIvrRgBlmdAByRuO1k=;
        b=i+NGTRZrY+riFdEB+BTpIsR0ulgXkSl4V+ucUCjsSZEvLz9CxaqsFJycY+6JTSq8IJ
         30xL2YeKTjxis9B9rHFsvR0K1NuT6oQJKPlVbfRlGdS+E0bMzLBeKdtKMstzgRlmWx2d
         7Eo4ghS9kFvfKQNRC8YBraqdMkc7ldoOG9l+/2EC/C+2QxBl4DZUAGSqZlYt9m4ZZNRZ
         CMOLJzdqy7Bgsav9KeO2hCr5roeqLaMHFObBkaNH93tmDmbmVOtjAU9oismxvUQZro5h
         1qVfxwf869sLFSknd9RjoiM281X7JMCw5IDnmljdi3rKDFNjEUekd9XXItC2H4C0hAM9
         nW0w==
X-Forwarded-Encrypted: i=1; AJvYcCXe0NTiy6r8Joylm+L+h2FNTEvUDi4dF8PqN+RDZlNf1XQWO/ihWMNxEBMeK1+Q+RS0U+AKy6VjK8dU@vger.kernel.org
X-Gm-Message-State: AOJu0YyWfFuhCR3JKPNel4OJMmUeQPcYXQWufe1ugXBPJFTImyEJmttR
	E3XY6cbkAjlYHyMP/ljIgDRzuWdaKiHieaYTf/eAp/vVGwZCGxlZhqcPAuJ3gZU=
X-Gm-Gg: ASbGnctzmfQOBCSXNRlLxelR3nFRRvX0ONjAXR48kCFV/dGrBtj4VHDJq1pBgIvMqv+
	quB3ZUAU+Oyrk9LMp07EYFr4C/feH41DnvrLhzGHVp2gCGwzf/aWIFVQ02KUV8GqOiUfR84fJ/S
	s6A070elx84A2nzmoyuFEmJfdUpc9giCTD9a0wfDg4HOpAILgKiwylEHw/E1uIsfEnI8bijv38j
	K4FUbI5FpXA/X5dPucP1BH0tLC1yjB/qhVr1Qjzyo5/1jmX3oQE8f3jUPb41s7IjseIjV73Iet6
	DZsetfdqKQNWHYE=
X-Google-Smtp-Source: AGHT+IHufl43yH4h42TNeRNb4pIxJfhWtSlcWpDN/3IHQPb679izKuQl7RiI9837Q+o9LDGQeygmhQ==
X-Received: by 2002:a5d:47a4:0:b0:38b:ec34:2d62 with SMTP id ffacd0b85a97d-38db48a0aa1mr1427352f8f.24.1738744823940;
        Wed, 05 Feb 2025 00:40:23 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:a766:1fb1:99b5:1d5f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38db6d7fb3dsm704259f8f.72.2025.02.05.00.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 00:40:23 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: brgl@bgdev.pl,
	linus.walleij@linaro.org,
	minyard@acm.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	openipmi-developer@lists.sourceforge.net,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org,
	eajames@linux.ibm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Ninad Palsule <ninad@linux.ibm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	andrew@lunn.ch
Subject: Re: (subset) [PATCH v9 0/9] DTS updates for system1 BMC
Date: Wed,  5 Feb 2025 09:40:21 +0100
Message-ID: <173874481706.6250.3472033617115260753.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250204194115.3899174-1-ninad@linux.ibm.com>
References: <20250204194115.3899174-1-ninad@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 04 Feb 2025 13:41:03 -0600, Ninad Palsule wrote:
> Please review the patch set version 9.
> 
> V9:
> 

Applied, thanks!

[2/9] dt-bindings: gpio: ast2400-gpio: Add hogs parsing
      commit: e8f2ca6be61f1cae2ff12932fa03224581b6b231

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

