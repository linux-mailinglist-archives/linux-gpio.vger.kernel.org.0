Return-Path: <linux-gpio+bounces-24137-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22257B202D7
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 11:12:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C3EB7AE7FE
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 09:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25F532E03FE;
	Mon, 11 Aug 2025 09:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mN0lDivT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0162DE703
	for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 09:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754903426; cv=none; b=U9+3Ig3LUsoj3VxbML+twKSrJV36/np5b3ecUOaUOFQFnHdvFCuGefE85KQRcb5oh803f0Kw3sFmCYBcqFljpYVooCCSToT843G0kKo7CYejL/T1K2S8/aSV7GqzfOA5O+o9HltiCu2rQ4MgH4I3yVscxfHrXeO7JGoX85FJPjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754903426; c=relaxed/simple;
	bh=GTK6PH2GLJ8zdSVDaRtEO8SDfY/2lLgVp3FVW1DDiu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lQfi/OFvJg7Pe682KvoK46ysnw22n9wuV73rHAyuFYT+a4g93w9swaMhqW0HLhnBKxYqIpWtH8hT08BfLI4Vhfy1U1WkzVbkcfKTLvWdrLtnUvDApfPlMtU5fi9KhW952A9JEf9i3Tr+483ljYTzfC4Gz/LCEcdxVGJ9kjp9sWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mN0lDivT; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-459eb4ae596so37137915e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 02:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754903422; x=1755508222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Qn1l1+ZBQDpWHIpCv84QlPIvcnD4wklf3q7JJCJ7Zg=;
        b=mN0lDivTJqUAj7KjwFxGLT7b5TbbuJwp6wlEUE6xNJkgcPjPaQnwwB3fQlRUvRUEkz
         uP1c8frszNctt0GmMa4zDthhRYNY/4zrg6kgbBtIEyYNWMPR4/jfIhIOA+WG0/wLelPM
         t1pGuAjO0ERj+layORSrxMKo3fV8GUWvb0occv5ApT6/mYszUEcrly91OKIQ3QGDE80N
         XplSB3uYKu4S83Lj+AKk1rNIkm9E8V54hvT0WBb2BZksVrl8vL9yabLjP+2aWT8U1U39
         acPEyKkaqrwjUhu3J+Sj75P/rmK8INS8VKsrPWt0yEr2W5oxADEsIsC+McL81aoG74fV
         KNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754903422; x=1755508222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Qn1l1+ZBQDpWHIpCv84QlPIvcnD4wklf3q7JJCJ7Zg=;
        b=b1hnFDvsQgYaTlqs+JQTAuhy0vwEatkof9gEUpz4WWE8BRDpfROU+NUAnvxi5Z8o1o
         iXDcL+DOvUhdG10S4WN9/aNM6PCfutlpmWYgDZ/ukizskUP6g9VB/OnHGbw73sd/lSn/
         NCqktZ7qrRHslIk461UrIeig/gRPS7+VtTTe4vrQ2VsxhJYISg7NQy8IijF8V0hVRZVZ
         T+/gEtEpXdSVdyTZwrhC98LynKUjkoU3S3ujozTlnpzj/dDo8bhjPHvb1U/b35ssVKna
         xn8TguTcedpaukjlRDDz8lZGqZo9V2tb+i72GHBC1bL3A5JUFf/8hfxya/LoblIQ3YVw
         v98g==
X-Forwarded-Encrypted: i=1; AJvYcCV7uEfzn4cE7RB8G57PDx+5DuLqkgC3+sh2lWZCmNRmczRwRAyPdz056pinpvtrFihL0dtpAVwd93c1@vger.kernel.org
X-Gm-Message-State: AOJu0YwJBQUO7btO71+cQBBhPe938dWPpAIQTAcOVzqDGoGHy85blkyK
	y5kyi2MH/BqdUCciB4U0nPup6+GNo5Cv56550TPZLsftRuIWHl8J/y4xkHrHqN5Mnso=
X-Gm-Gg: ASbGncvREIshX1NesxL8exwBbBVJwL1XLfkk0xyoMpQSXJn9sFUusW4BMuNaJoN4Ute
	42kIedgA9G8LNGt0iZhneJ3aEJMKG3hIFIMCrGBw1iiNPYFRr29aZ0OCHxgatTjz0meJcZeX7HJ
	uk2sMIxH5N8RRDF3//aMGDDvMohU5WzdFnk3arq44HgxQembby+lhPYM06Kf+cgg9bq4b9zRJtF
	UlvYdtA/LxSJ5zDzxlFAzgWGmr8VyovWKYp11W3OC70BvlTTWy8EHJKdVagH6glrgcGQAFarDzG
	UyPphB8FGr/NsP8x9gRhC6GOKrRMtDYvd6jweW67f8TfU9LWALMT6d7Als/hgfcA/+fH44uq28M
	qynnNUlaJVp56IryctoaiTM1j
X-Google-Smtp-Source: AGHT+IFdVlgR2Uf1ca3NIwmvbqqLhuhd81ZtRnQK2kc8IJiQBuEcYZM46ftlzImE+aVrkBs1IL9pwg==
X-Received: by 2002:a05:6000:2010:b0:3b7:9d83:5104 with SMTP id ffacd0b85a97d-3b900b83ce4mr9953008f8f.51.1754903422254;
        Mon, 11 Aug 2025 02:10:22 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6841:8926:4410:c880])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c453ab0sm40220239f8f.44.2025.08.11.02.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 02:10:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/1] gpio: stmpe: Allow to compile as a module
Date: Mon, 11 Aug 2025 11:10:16 +0200
Message-ID: <175490341188.22509.14430833125542251906.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250728060544.18169-1-alexander.stein@ew.tq-group.com>
References: <20250728060544.18169-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 28 Jul 2025 08:05:43 +0200, Alexander Stein wrote:
> Add the necessary boilerplate to also make this driver modular.
> Keep the subsys_initcall to not change registration order for built-in.
> Also add OF match table for module autoloading.
> 
> 

Applied, thanks!

[1/1] gpio: stmpe: Allow to compile as a module
      https://git.kernel.org/brgl/linux/c/03db20aaa3ba3998b5a025e243b04e33b5bdefa5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

