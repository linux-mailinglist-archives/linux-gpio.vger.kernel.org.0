Return-Path: <linux-gpio+bounces-13485-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1B49E3CFD
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 15:41:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98819163874
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 14:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 369A81FECCF;
	Wed,  4 Dec 2024 14:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="btlMSwyy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD30B1B4157
	for <linux-gpio@vger.kernel.org>; Wed,  4 Dec 2024 14:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733323301; cv=none; b=mIEdyt6wHieKSHKSnZSmTfCgOW20aXCcAoOolXb/XS3fhpP5ydVVNJMLBUpFdDn/CtsjH3IBoD75kphna+1FxjY8Amhz640XAoVVb12OTcAWvCkCu/GlDWeSLmafdulU+wVPgcqg/zTq/CRsvybfxl6kIvSgQt3iFn9/a8hUcZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733323301; c=relaxed/simple;
	bh=nlPt/217m2IB5spyUDQdfsJ1L1fivjidf1bdkf60d4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SDD7cfDNuNkn17hhatgToakaZ72/tfojeW6opdxP6HyfjRJq7C9OE8UqfLtI8mqNk0MuMs0s7JKGDre07iTYx7gAn5bb77MA2B0jXUqu49VWqYLqpawX/ZHMuGW0T0hL6IBsVQKKPzO8Mofl69MBkdbTz2MMSQeSeIjsQP9tlzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=btlMSwyy; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-434a8b94fb5so6297555e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Dec 2024 06:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733323297; x=1733928097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhGl/6JVH/dXKoRU3pMclVBBK/lYldgB8q4d0vdsZ9I=;
        b=btlMSwyywAnPt2gRyaAyZulSEON8vrlf9YwHyo1vRs26LbU7eL0qPXrrt2UnVBQLiw
         f5ye6cpVBF5FhScD9OOhwGH6YJgK0fxjd7kX+8QFHltCxxsfnPiZTPjt0TGQ5hx+awxT
         CdY0435QC1MgfW0MVu840AIu3f0Yg304dD8Ywn6BKVbTx6vHlruZqBtV2FnQvGlgHs+f
         uh/dT7CHchSSNpS/U3GBijUSrG1/q6BI2JMQm8RrovVXHg88xyajQ9AgZA0AGBhNzZUC
         aUJp052qps505RCzlN/dp+NCiMGTzYbrGhZZk0BH12kXsq6qEpt+WFE3jJIFDqB3wSzc
         t3Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733323297; x=1733928097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qhGl/6JVH/dXKoRU3pMclVBBK/lYldgB8q4d0vdsZ9I=;
        b=LYymB67q9SKNrQnVFkjsoxkU0ZWke3vz8OQg/4b9Wt1rbr7m/O8fUZIhRmB7ViWFaL
         jmyOW+x8/WE1KRBfrD/qKXS14uIwFkqueetkwkjhUWnH8pZqqzjRkHSyLa5FVJv1nIzP
         cFw04yVO2EIIj4M6cq04VIJuDfe0DEWtLY9ardpUMRQfN3lXtYuwWGYJg4pYtjPRpTgD
         3RRLTPYpmbj/OZsYYn1Fmb3LU1Yckk+FTkWUTOHHEuSM8ocPbLmW2USyPEDmwcST+ju/
         oIZXqwWCyseirtka1NpjVPTkKz88BdEtx2l1ZqAgKxISa4nu5J2MvZwuYbNXBiamZYZD
         NH1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXAD6q2d87vA38iyR9Bhq6+vQ5ZVxJ+VTdzD8OaCeockwRVe0/U+/3aOq/pe4ZOlnv73TvhtbxJLZQ/@vger.kernel.org
X-Gm-Message-State: AOJu0YwdmxqE3yCaNFV2C+LBqYNPxcC7D5bo4d2rDbY83aj1ZL1YDpSp
	1tcH79iWdwJtElqM0RvvsAOnMddeo0bUPsKEtbqnJJ7Ukj4HF77UeLfogGI4VBg=
X-Gm-Gg: ASbGncuHjQJ94OISUSZ9CN/+1IivvEhX82XK/NaxO/BTyC+zvqHvdBKTDeU3S+krCzj
	ZNMtmh+vp/qCYO2dJYBfbnWcgp7t/qK2g99fvgDfjASv8NK1ZlfAaeUlmwhxsWkC2NfrmytbcWe
	/KlrwMzbatQH2GWyhZ4pe5wth8VVC9P5L6bGqucIO30vH9KtotRWcbFQJFqB1+lhYOcBnHFGVUT
	YdbEWv0agEtMbEup0yLEDSkb6yopIcOWDroBicoQkvAje2DbvWzOUvctiqcbvk3qaBasLW2L+7S
	njeM0Dg=
X-Google-Smtp-Source: AGHT+IHiCrxtrxOZGFdMYFRWw8hMLJcbS4lTT/2HQaZH8PkQM044OzLLldtmNR8ZhHOFG2ZVMZbm1g==
X-Received: by 2002:a05:600c:350b:b0:434:9ce6:3ec with SMTP id 5b1f17b1804b1-434afb9ecd2mr234338215e9.7.1733323297075;
        Wed, 04 Dec 2024 06:41:37 -0800 (PST)
Received: from brgl-uxlite.. (5-226-109-134.static.ip.netia.com.pl. [5.226.109.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d527e12dsm26368145e9.10.2024.12.04.06.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 06:41:36 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: GPIO_MVEBU should not default to y when compile-testing
Date: Wed,  4 Dec 2024 15:41:03 +0100
Message-ID: <173332326029.11398.6855202202316597607.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <6b9e55dbf544297d5acf743f6fa473791ab10644.1733242798.git.geert+renesas@glider.be>
References: <6b9e55dbf544297d5acf743f6fa473791ab10644.1733242798.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 03 Dec 2024 17:23:16 +0100, Geert Uytterhoeven wrote:
> Merely enabling compile-testing should not enable additional
> functionality.
> 
> 

Applied, thanks!

[1/1] gpio: GPIO_MVEBU should not default to y when compile-testing
      commit: 70327137eb3eb64f346191dcd0ee5140d5ab34d8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

