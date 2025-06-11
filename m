Return-Path: <linux-gpio+bounces-21385-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFB0AD559E
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 14:33:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34C00188CC97
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 12:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EBF9272E63;
	Wed, 11 Jun 2025 12:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wvgj7aGI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774752E6123
	for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 12:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749645227; cv=none; b=OxD07uxmMQyDG7XXpkRl0sEeP6AM1T4jpxMVfHgRJu+nIsIGtYAQGji1yTzo5YZPbwFEDVtHSwQb1k8DdW0KZ4Zrx3Wtoh4yAA2KEXvqBASZsTS88p2sddSIy1Eoh7fWzVW8/YFxk6a8NukeT9t/MZx2A76f8+5chy9jENB2n6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749645227; c=relaxed/simple;
	bh=g3NAXjEVv53ME39m4WFK3zaviYHTbygBx9suNW1Gghc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XHs7th5eugQ2BfjZnDbWhiRvoQSocnM1M48CqiPEnj9NgTtlGB8CepLmEMhujE0Jzgrgm5UhjooWqpJnySx6pvc50b+od9qiiTOGypEd4ZKEIIHQPsW82ILbkugqz+EGUgHnVIZK5GkqWuwFqh17oNCzxXI7lEuIshnsNW48yjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wvgj7aGI; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4530921461aso31195165e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 05:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749645225; x=1750250025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=58tB31KJ4kl8/PiwakZKBV9Caj2k0aAHpQ5UO46MXf8=;
        b=wvgj7aGIW7nNH3KEdd/Gaao/JvQpErAchCv1Z/8i+fWdiOWJzgeMdkRorHZ/A3z1Kn
         WiMJGOqKQNoG16lUzt8h3gHqnunYgiLhTJpGNFrcvxOISyBPlv6/bC+sY1fKK0yMHpEm
         KMvuwX6If2cDtbeDAhdWqr3aNFngiulnhrneswIyZox858Tm/aQ6UAd6k5xKpL4NQvMj
         Gsx0zTVkDas0It0Wg73hGPhglCENGBImoH2iqqEJerefbTENwZ5YSLVkhjwACu9QCY1Q
         m2cEUFk6efkiYXKEecB9bFjXEqfRLrIlR2QKtlaHaJwI8aniz1MRUG8uoQRwFUW5OreI
         dpdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749645225; x=1750250025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=58tB31KJ4kl8/PiwakZKBV9Caj2k0aAHpQ5UO46MXf8=;
        b=QeZtNn/H6NGR1Z8YG3eiMjDprRfJ09rLJL6gvUfhMKao+JseBCeoC7mKDp8dQTSWOV
         mFrgUAxLI/KYAWDF/M6LQsfDGz1udNdIyAbxGw+CKRz4tGE+klh9cCSSlnihHmoFbZUQ
         Oia7nM3FvkgLbDQWvVhGWafE5qeuOGlNNWOTWSClv8VfhRnXY4UGrokjdEqU4xFMyie/
         6TMjWGx/OnjHQsOVRZK8Ue2h0mOgQgQevYo8EUw4Ty9nvptQzhla/51h4PBINnUqJHkD
         ya1iNtsx1z34XZ9vr1JjU02uNR1N7HKathezqlCHeIthy/+hGvU+x1ShPfath2aT8kAr
         tBlw==
X-Forwarded-Encrypted: i=1; AJvYcCW7ihkpzOuAUfAbqp7copfFLOWRRaEK9mID7n1wtQPZaBYF+LKW+kjdWd43tcD9idDkqGsLWBMVhosq@vger.kernel.org
X-Gm-Message-State: AOJu0YwKsEajP61DsJkof8aO+Si8xfP6/ebiwA5XAMZv/6Lfm6ojPE9E
	q6TxZ1Z7i92OeWmpwUUjfpJNCdjSGSE15By/7L/fjr6ES7hmZELWhQ6W9mGtKrMZ6+Y=
X-Gm-Gg: ASbGncvjglmp7bGnwhjT5Xfd0sAt5oqkwTECDDUbkdovMgBZ7oD5DkWnosT6+OnNItC
	/aPMbkaATqhm7ssYiYJ7I3USUKJs+jxHCuWTDCOeXgVoHGk9ABXUFl23LoJQVc8oyxfoUBWvZRf
	KTwrfFJtZtNyKnugeqxVwez8bQ3UmpzKsxnZvu17xBwD+w5yqw6Fmep2U/R049IVO4DlDw3ksPP
	LT30v1DOyOtwGsCirWCLlvDycds7PtePSOO+1TuhdyBEazSKldU9Q0QUpn4L77ufxyuqobAG/F/
	8WD02NxnOBrglX0Vpg1zKvDMax0RJ7bCQuNbVfbQxEKNlVJR3OuzXP5E5di4fOs=
X-Google-Smtp-Source: AGHT+IH+yTHZNTGeC/+RF5wU+jFRSmzOWMhHxhfFM0B/77rWsjy5ljPuBPABLlLuzVsDVde3T5b07A==
X-Received: by 2002:a05:600c:4686:b0:453:9b3:5b65 with SMTP id 5b1f17b1804b1-453248b09a4mr27662635e9.8.1749645224718;
        Wed, 11 Jun 2025 05:33:44 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3994:acce:fbc8:2f34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453252165c6sm19762355e9.29.2025.06.11.05.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 05:33:44 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Huacai Chen <chenhuacai@kernel.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] gpio: loongson-64bit: Correct Loongson-7A2000 ACPI GPIO access mode
Date: Wed, 11 Jun 2025 14:33:40 +0200
Message-ID: <174964521463.38087.18017006359179937333.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250610115926.347845-1-zhoubinbin@loongson.cn>
References: <20250610115926.347845-1-zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 10 Jun 2025 19:59:26 +0800, Binbin Zhou wrote:
> According to the description of the Loongson-7A2000 ACPI GPIO register in
> the manual, its access mode should be BIT_CTRL_MODE, otherwise there maybe
> some unpredictable behavior.
> 
> 

Applied, thanks!

[1/1] gpio: loongson-64bit: Correct Loongson-7A2000 ACPI GPIO access mode
      https://git.kernel.org/brgl/linux/c/72f37957007d25f4290e3ba40d40aaec1dd0b0cf

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

