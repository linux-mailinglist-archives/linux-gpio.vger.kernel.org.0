Return-Path: <linux-gpio+bounces-16471-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA33BA4182C
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 10:08:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DADF116C55A
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 09:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0FB6242929;
	Mon, 24 Feb 2025 09:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vFbagN9F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54F423F406
	for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 09:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740388013; cv=none; b=gKdsXr1SHmERhVu4qFfrikC/zNLz9N+9yofp4ah4pVwHwMxVgeFLoC3QjBDI0YsRi7gHRiDaor/HgtT1xS4GN0pX/4awoXhdePYmNp7iYgNBoXIupPSmutAPkjdPbUMSlNlyeqX3X5qRxjitPCKuEPY7dQ7GelRJg8dGr7tHfmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740388013; c=relaxed/simple;
	bh=yDGWepIHLbPVLZ5Rl3jNTHF4R70JWVTndC2BD1bDldE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h0blsrY06r0mGZ5bSNTJ27jtY/mvt+eUvTlIvZhuUGm6km+/xzPDFYllQgyKSg0KCUznqB8s1pG0o2KyErZY35SAbkKNKTKu1xOxkwwMRll1y+bqlRchfnaAJsbHHH9lubaDorKaS63KwaBkHcq4ghqrqPLozPjHi3lf7GYAFIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vFbagN9F; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4397e5d5d99so24580425e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 01:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740388010; x=1740992810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYxTXn3Dc5cnG8TtU5kqenlM0ZtDWqWGDCzwlccpQPg=;
        b=vFbagN9FmbhemAI6Czy6FhzH63lWSBF/QJAsiHbbdazPYSqCX9cZ4bWF64x29rNDhq
         xbV1DANnZIwIl5JeTXcaI9j1oUZFNd1e8piaCyXbNxCyZmPbbPmMJZXG6lJEPRNBVM47
         sd81GT2xPKWSkjCelBABAFOZXfqY39QU8txF7Mv7xXCr6uaSIBlQi7MfUQ0zpoBzWvGw
         sRWaGK9RzzY7rjmii10m3teEHq9ISff8T3gvy5v83YUC2g1y8RP9v7O9exzunWd7LVYc
         gdVuhyJ3HuFylRGGI8qqO8PH/0YR03yZSJqWFDlunqzNOScfFa1M4x/ggLEnKbfwZF8F
         J0Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740388010; x=1740992810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cYxTXn3Dc5cnG8TtU5kqenlM0ZtDWqWGDCzwlccpQPg=;
        b=uJkyqq1UvAJn3IC3HMSAWwgGE8cpP4iaTKQpmYCMuQRLjMc1YKTc96OqZ+zrFwRDe1
         j+2YZbKBgKfUiaBYzOdeEi4kqZ8+nWUX3Ue70QNlC8XM5vFJNFJUEUqxoKGsPEZF52/5
         9haEOQLqZF4OKW/8Bk6mdOjCXVZK/BpxxJdO677S1CTxbHt0YQL+p13WlGHqC3G0WScK
         Fg3hluOkDWbSlAfmGGXXLsELJ1dG5y+3o2CtRARwc2L1Lluy/9gINRHF9djeRWFOSr6b
         JEd/AwQsOBkQe2h4KwbDH+JGmt6hwxIYjgwbpRbn1rKX5ZwJ80ePR50ayZ9aq+iM9Aua
         xSYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbQ5YlqJC+4dJJreoA3ALUbKTI80ZmSr5hF/6fx5Hu89iWOcxKwEU9u0VjHBMJZUDv4BHKPrTGG80c@vger.kernel.org
X-Gm-Message-State: AOJu0YzHtyEUTaU2c038mrDfw4uqxv732QWdqpsb3quy5Yta9HXUhTL/
	lBP4UbltcVbEv/BMuwIqnT4oRczS702FpssGxhpX1BzsGW7aHbYVqkytvSBXYlc=
X-Gm-Gg: ASbGncuu5Vb4PEB5JeNBSX7J3Hob+5jAZsqmO9mNM8MHUk56jYFJLodRWYkjT4qUCRt
	AAN2FisTIGxt8KPBNPOndMUbsvk5TzmnrFARTsbU3C6QO9HrPLtF71VJ1Q0W3ic0Qds8/0g+Kjl
	tXMSq7BKBNdsPouVFxZ3fOJo4/FMoPZqEyIKcyc5OcGcn3gR8wIFDVfWYv9GdgL9K2y0z/fV7IL
	sIcZI89A18O1vXizhS4YMoGFCh14MuoRJajkbAh8IxROX6fF6kZ5DCBeLLmKRT+nVtZD1507ZLI
	i78ri3bgd7jpmZFjG6CXEjgp
X-Google-Smtp-Source: AGHT+IH6mI67VN6+LJhW4CQixdQKl6hq9aE0FVeh49meEBwPyv6KSQ0mFCOhMgKfSlM+rzBNT1MX8A==
X-Received: by 2002:a05:600c:468e:b0:439:9b3f:2de1 with SMTP id 5b1f17b1804b1-439ae1f199cmr96841805e9.15.1740388010179;
        Mon, 24 Feb 2025 01:06:50 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:eb70:990:c1af:664a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4399c4df982sm131355455e9.1.2025.02.24.01.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 01:06:49 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: read descriptor flags once in gpiolib_dbg_show()
Date: Mon, 24 Feb 2025 10:06:48 +0100
Message-ID: <174038800639.24858.15060256292022357731.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250215100847.30136-1-brgl@bgdev.pl>
References: <20250215100847.30136-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Sat, 15 Feb 2025 11:08:47 +0100, Bartosz Golaszewski wrote:
> For consistency with most other code that can access requested
> descriptors: read the flags once atomically and then test individual
> bits from the helper variable. This avoids any potential discrepancies
> should flags change during the debug print.
> 
> 

Applied, thanks!

[1/1] gpiolib: read descriptor flags once in gpiolib_dbg_show()
      commit: 11067f50458a5bb3b72f83c508e03f321e0c0c34

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

