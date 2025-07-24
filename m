Return-Path: <linux-gpio+bounces-23770-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B764EB1069A
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 11:41:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83A1E189AD27
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 09:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6568E23F42A;
	Thu, 24 Jul 2025 09:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="g6k04WOs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB622376F2
	for <linux-gpio@vger.kernel.org>; Thu, 24 Jul 2025 09:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753349552; cv=none; b=He30pOeB89hWjEmZOd1K0cVKxaR+tw9Inx4mFeoH5UDuRbTgezMeKSxLWq/rRYO/4FAMHpAFo0m10zQDah0NBkDE9rs9+nEfZvrdbefjkFss42HhJGrwKYbLJ3MiezPaPT/dQeVetv4fEroE9uMspKL6hOHdI9tWF5O9ZNjP9oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753349552; c=relaxed/simple;
	bh=NageZ7oYbdXesl0USVbE1SGRPSLpR2RCxmowtRfPNFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=etpec5I0O+qrxde3NmrtgWdw52O8b8Cs/ZydeK8QPoZY0QqgTv6CJC8dTrpDGya+jq1r8ybS2WPYA8Y/C4ntU/vfzmtWIefeH2EtqTfc/R4aDiDe0rj1yZgsgmVlFZRU483sdV2vt4YyHblEXvLv3wkzopYPit5jRM0yOFmSM08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=g6k04WOs; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-451d54214adso4778315e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 24 Jul 2025 02:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753349549; x=1753954349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dTkemGUBWoGJ81ZV+e4KWAV9VuK8KryD4uecukSIjI8=;
        b=g6k04WOsWBMOrXg3lYs1Ii3Z62ivBNOlypWahoJHp+TFCr2Mw27iSIuFa5m8YEIO60
         9QO7uDfDmvIsDDKzIpyFukiPxvtvY1OsPiKvidV3CXlxNhCQj6MIVbA9PH16k+xgUgDj
         FuFEUhLC+D73d6qjNTN93/gKahnJYdeeS0hdYSti1QgvEvFbRk7U5u1FQiY2+7V/+BS1
         Q5TqV2o4X5t44AM/xh/bw4WoRPvmQeL7GUy49qMOFyU9Jj+z7mj+OrF8/dVmzIkvgtJ0
         34JAdrBvaPVIusujxc71QGmTv76QA2uRN6VrZ2ORjdPQygyx7uBMj+iwtGh2KGDnRyAG
         tb6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753349549; x=1753954349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dTkemGUBWoGJ81ZV+e4KWAV9VuK8KryD4uecukSIjI8=;
        b=k9wc3WDbrhfG9Cmyg62CPec1d9zTdqnJEIomVH+6tjIP6QsDl0GMpGILF3g4HsbEv8
         SVZwOOt67ks0vD0a4VzRP0adaBFlnVda5WlUi7bOx7Tu4jNgUZeaQRWPsU8OOXo9OfML
         oU350IhgmesR9PSLFPqcQZ7/8m04y19/7HojPpaLas9l8M9uQqiPjNUis3oEf5pc9Q0n
         rjrOQvYPF/njfjp0F8njSmCkp5ciwmpcne5LKYNJ2LJIG2bcIxTwi8LSAl7veH0drv8D
         kj/u2ywDiSJAgr1iMkoTB7RpLQta30Xtdj7Pj07ujf7LMp+93+UEGEKx6pYTDWiASzoe
         3cDw==
X-Forwarded-Encrypted: i=1; AJvYcCVz6hShH6hgV0g26gZM73JLEE4z2xDWIGmRzQz4x/a6XgGHDdJnipCIOY3GaxxPqEWG08xWxZbLyN/W@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/0iqU0cMyKo3nrpkutBg4iDJUGsDHgiYTBjcotnBUxLnzTT3/
	fUYdCjRmxmzTgo6CyeylXfvRfXQTJZm02MKNSQINYLEEmOwCtu9ZNlAUeA14L6zstls=
X-Gm-Gg: ASbGncuerdtV1nJxPZWV0e52fQ9mofh2nSyOXkfSTn2hK5AWL92KuMI8FkXqFZ2pJpZ
	TDnLYf9ykJpqcT+zZsrBd9FM7XRGHfJdPGXY2C4ILvzY6Uk3ZXWI5ukz4msswqNtJNCDtygkpZE
	WIRqHf12jBC/47ITwXLGoKz8qc5kVt5+Nspams1FKwQaBaeEpkLi0oAEJl54QcEjIUwLvyo0Dpj
	X8oHXdyJhyW+lP6skMwM39LtAonrZNUJC3KRHFsCtYdnoY+LsWS61SM56/tBrfUqAOtCzGwwli9
	TfHxDbCEMxZu6YCAc03ZB4ksQrxjDhjfD9D5fzQCnM/C+U+lE+/dz3mjKTYfJ4WIcHiIdK8H8CR
	8HF1p24R8zfTLH3VPpxAXsDDNtuq33aHBBQ==
X-Google-Smtp-Source: AGHT+IFzCpTjvxHNAFJhSKZzdmRsQmJ8O4RApI1QN6WkNSjAh/0tVJ4j7YLcOiCp41q6wWUKz9LYdQ==
X-Received: by 2002:a05:600c:34d1:b0:456:2020:166a with SMTP id 5b1f17b1804b1-45868d1bd14mr47498965e9.20.1753349548895;
        Thu, 24 Jul 2025 02:32:28 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:f44c:20db:7ada:b556])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054c599sm12719475e9.11.2025.07.24.02.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 02:32:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Viresh Kumar <viresh.kumar@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Erik Wierich <erik@riscstar.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod 0/2] bindings: rust: update examples
Date: Thu, 24 Jul 2025 11:32:26 +0200
Message-ID: <175334954445.20868.6666386614008401326.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250723-rust-examples-imports-v1-0-4c87e07a9b79@linaro.org>
References: <20250723-rust-examples-imports-v1-0-4c87e07a9b79@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 23 Jul 2025 10:16:46 +0200, Bartosz Golaszewski wrote:
> Here are two small updates to rust examples. Fix automatic formatting
> with rustfmt and unify the way examples import modules.
> 
> 

Applied, thanks!

[1/2] bindings: rust: fix formatting in examples
      commit: 8da049f2d7eacac5a290af27a90a871685b35ee4
[2/2] bindings: rust: unify imports in examples
      commit: cd32f27dd550753488bff4918aef4e230ce01512

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

