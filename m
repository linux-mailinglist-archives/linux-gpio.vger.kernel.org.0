Return-Path: <linux-gpio+bounces-23584-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA5AB0C50D
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 15:21:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 150343A46F6
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 13:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 272D72D8DC0;
	Mon, 21 Jul 2025 13:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GhFmMM0h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459368BEE
	for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 13:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753104054; cv=none; b=YckSjHcysQ3XLfe6+OCZIOl8r9KJxjfJgG9i/jLkNDc5ketxguZ43sB7Q6KkVjrzYYpRYfy18LuTDk5y/gBDytlPUUKLt/skBiaNqx/enxccFpGDfNXsa/gsmAQXnLq6vLjTVway9sQIR89EPIhP+FzgQEDq+lUv8K5fhq4zMxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753104054; c=relaxed/simple;
	bh=mUhbe5qr3r+32zDbQ7eucsF7wVhV5ZuqRT3vPqPsCcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EXSdCzIVljMBkhIYQFEjre8Rf0o0bYDgr/w2nVZWkMpGPEIlu6vsSj6+Z7WhAtW9MHxF3p8KXtpOHohiWKokQu1dirtq9XKOF69tWn99Sz9dscBcfuA7s7vBO5tkerFgsa6IeZ2OPkdly8rLTJQiKAe/tY2NpJiIkvSttpF6c4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=GhFmMM0h; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4563a57f947so9784895e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 06:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753104051; x=1753708851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nCDds6cBIJx0QX8fIz5yTpKePTXmElluLacrBZINO1I=;
        b=GhFmMM0h4XjN6Nyo/mEt5WoyXr+NCgXNbSI1TbuD7ZiVSEXAbtIcCi13J66R0hXsy4
         Y6vpkycATKLzL3fDM1bt2Ko9ZRQ4Rl/ZTAeqX5zuWnUsQz8r6O0B2br+/QUPIcD14d1T
         3AG2Sd+KWZ7Roh1qzXgdaZT9i0RbyJF9nFEBdSpx7zivQ4Qe/E5f7Wa1S9Uj8OCWBYJ0
         RDGAJXUHGWOB0tLJtuClw4YtF1YIvw+6PqLWURE46Z8OIGnvAtfF5fJ9V9THMd+G1RQ6
         pdlSJLsg/oWOwGJP7QantEi9E8fsaPKKFefgmWge3b3ts0wukEoQ5dCHd88sSMER6l/T
         869A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753104051; x=1753708851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nCDds6cBIJx0QX8fIz5yTpKePTXmElluLacrBZINO1I=;
        b=hOId5jA4SMbKzUCCTzdhgrepVVEVt5/tDa9Zx0cajSmWPiSQHE7Feiy9v3ydnBXICv
         v551Bjwq19AtxOurH3utU2vq4gD8RqAKr0vh2l8pMB77gKsVDAy8s6aCrtTZFscnKvQY
         bvaLSxVdqAKyXrGWD1cHuALvd5TuIsF6SbKyvRJhZA54T0zFjPpg0yxNeXEP+pMYhmF5
         J9tn5xoMUrhE1e0XtTAYL032/Qdv4ebIxFsV8hqIyRBvyMv3SnNe61ByRAgCbNUDzR1l
         9R9J/dTmmq4y9vke6wPf0fTgzjeP4PWOYTOY9NfUlO6AqcC3ATKg0UcVwJqO8UmSy0rF
         CmAQ==
X-Gm-Message-State: AOJu0Yx5EbxZfmOpUiEha39ShNfL+tEomsVnbw87fU89SIq49vsdE2IS
	RqBQ5bXt1fu1XmjaruTLlFbBmtrcMi/UdNvjFSCJq4UA4TDWQyTHXU9V6vy/JuhFfVKXNn4a+9u
	6L3IMkro=
X-Gm-Gg: ASbGncuAyZhJBWtLW7ElTwZc1XXYyknXpdiiG3DwecyYyrv0hGD15+Fcg/jEuKp1s+S
	Pb0fpUIntYuWoRQz6n7GRxASF5K0Vi/zHQH92g6Gmmif1vrACGirzbKcEid9KCVdqirXfakzTj1
	qsMSg1H3aLtquUCZncoLJjUsHVkQ+5pb0Q/Qc0DKTUBwmUHDth0io9gVK2Gx6VwkNsM2pTBRiMX
	BleYyBFa1rWxAA19etKrAwGrA6jYOD+LH7AVOujCLV+blbr1WkHrC+RTgC8M/ZNaMvfV9Tlnu66
	Zyd8whIhr/pFdR/s7I7d+RZLX/Mwk4Qs5PyUjg8l4LYOQ3uU46SZI7qE62bJ/MaFUn9RJt9Kf9t
	K+ungGaeJhchm1IbGCEbc1Q==
X-Google-Smtp-Source: AGHT+IFcD/Bdj4/SAShi6UCNt6L/jgtlVu+l97jluZhOTe/PhTVcc4KyQIXLPYRpgEpiGKmaNTrZfQ==
X-Received: by 2002:a05:6000:2087:b0:3a5:1241:afde with SMTP id ffacd0b85a97d-3b613ab2ca0mr14319057f8f.9.1753104051223;
        Mon, 21 Jul 2025 06:20:51 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:a0b1:7516:7c6d:ded5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca5c298sm10445189f8f.76.2025.07.21.06.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 06:20:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linux-GPIO <linux-gpio@vger.kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Erik Wierich <erik@riscstar.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH libgpiod 0/2] bindings: rust: fix clippy warnings
Date: Mon, 21 Jul 2025 15:20:44 +0200
Message-ID: <175309950626.52365.996413847130348843.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250721-rust-clippy-v1-0-2ac0198b2ea6@riscstar.com>
References: <20250721-rust-clippy-v1-0-2ac0198b2ea6@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 21 Jul 2025 09:53:06 +0200, Erik Wierich wrote:
> This fixes warnings reported by clippy 0.1.88.
> 
> 

Applied, thanks!

[1/2] bindings: rust: remove newline between attribute and attribute
      commit: b20401360ce35fabc123c379ab3fddb394ee467e
[2/2] bindings: rust: simplify format statements
      commit: 6263abf3abb6fcdb4b85745664a7bb3c1d3c4f8c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

