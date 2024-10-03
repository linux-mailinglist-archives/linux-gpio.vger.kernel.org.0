Return-Path: <linux-gpio+bounces-10805-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF3F98F68C
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 20:55:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C20122840E8
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 18:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11B731ABED6;
	Thu,  3 Oct 2024 18:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gouGuzzy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06AB1ABEA6
	for <linux-gpio@vger.kernel.org>; Thu,  3 Oct 2024 18:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727981641; cv=none; b=QCKRE7S0RqaI79e44ClgOTZ6fYuxvGqNq9vJF0vAPSJFyo7BjESs1Ui4nhHuATpGgFHgyVZ6Rs/TEPCyiDTHSSFFhLeB7dP1Q87zGiSblmf6210jgl+6XSVm8emDiC3lYvFTuIhtKjCZoO3uDtcgpesQ8BvC6Wix9Ui7S+VebiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727981641; c=relaxed/simple;
	bh=Aqe59oBmHOyl5wWiS1U9TJYJQG6Xi9YPCCHb6ik+U3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iHGZQfJb6+b2YMuL2HutNZ+1B1ImizKcN9fLxIeOsRtaKHKDtiKi5GjL6oGBizP27asaClMp2ex2H64iW6e4pgJjPNJTRJaQnamcDFYAOJgNZzQDITjAJ2Tg4t0WloMczc7ospAbbnjwl5nHjkr9L18RWC3NQaywQ2+XGg1V7cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gouGuzzy; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42cb8dac900so12745415e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 03 Oct 2024 11:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727981638; x=1728586438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W7Rgivd96fCzL22YiGf6WhlNkKr0h3M5JifVUpHx5A0=;
        b=gouGuzzyFyO89iwnUZkliBMHAGJH4D/HjB7voreS9uqMPY8byltWXYYbuxN7jVS722
         OM1hszG5EjzcC5ZRHIVdpLWNfzYMVc+vXZmu+LD4hKOPp0++QVhXeU61wMxvqDyU8gpC
         LMMhHQg8cBNAdNomed7vcGJI4bna0zlByE7uyqb+JuY9Nw/GX2/oC+DRKG1fi7priMAH
         eMxK1xzQqy5eDauvB195gwDLIT7f+asWTxmpYR1jz9rCWwAYcmkcT4a39TNDGcDTCEb7
         ruOCv3AYnqqcbdShNF+qkcTdTQKvQmWRGXW4z2WISnyAgv2PuQj9mASLsq9aIzkpwinN
         W5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727981638; x=1728586438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W7Rgivd96fCzL22YiGf6WhlNkKr0h3M5JifVUpHx5A0=;
        b=bXIwnWLzXxisQTWuHS8VhQcWp33Djoh7QaYGbByR4ONgsSYK9i+lZ8eUjl24arP7C5
         arI1ghAJo9D+seVj4QAh6e+vrDQ1zPRHJUqzSciNZost/IxUS9Y00QRmV6dwvAxq4iib
         N/gk2xbhDjr29uBJo+oQTtzQwASh0Lc95y9RAt9GhjcTPcvEkKHvQ2qa9aidwAIV+9Y0
         x+BX7/91kVaPZ1WtkSXs9Nb6OeGKkx2FuoxzNhIyNpBT4jAIza9l2W+iPwjo1yfl9KMM
         4oTVXR6Y1VttaljP+GRjm3D9VenEpqnznvKPW6Z5QHdr/Jj+PfYIjyWQmeVkJSGolm3N
         eWQw==
X-Forwarded-Encrypted: i=1; AJvYcCXnKFoOir2ISxf1aVWLTm048N8e/XEjkbqi6F11sbc9vpwa04XR7E/b7xIQ/xXRIXjbkT+FkEbAD70s@vger.kernel.org
X-Gm-Message-State: AOJu0YymNAissx6WDoGbMmIa2LG6jczBfqAgH3rrGJg4vlZ4FYKEq76l
	r/d9uQFJ3emy1QT0yT5GmO/egaOVWg7wf0/4ntUywmVe3i53UbgavecFsn5CmL8=
X-Google-Smtp-Source: AGHT+IGdMDDuB+X/iH8qp2PoHwumzrpJ170SAsJSIi+VUZmj/upMuarzwVOFa8anmg4yM5/TdKFQUg==
X-Received: by 2002:a05:600c:3511:b0:42c:acb0:ddb6 with SMTP id 5b1f17b1804b1-42f85aa8087mr507345e9.9.1727981637826;
        Thu, 03 Oct 2024 11:53:57 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:d16b:3a82:8bfb:222a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f7a02ef4bsm50870425e9.47.2024.10.03.11.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 11:53:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar <prabhakar.csengg@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] gpiolib: Fix potential NULL pointer dereference in gpiod_get_label()
Date: Thu,  3 Oct 2024 20:53:55 +0200
Message-ID: <172798159241.47650.3165790189839746577.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241003131351.472015-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241003131351.472015-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 03 Oct 2024 14:13:51 +0100, Prabhakar wrote:
> In `gpiod_get_label()`, it is possible that `srcu_dereference_check()` may
> return a NULL pointer, leading to a scenario where `label->str` is accessed
> without verifying if `label` itself is NULL.
> 
> This patch adds a proper NULL check for `label` before accessing
> `label->str`. The check for `label->str != NULL` is removed because
> `label->str` can never be NULL if `label` is not NULL.
> 
> [...]

Good catch, thanks! I added Fixes: tags and queued it for rc2.

[1/1] gpiolib: Fix potential NULL pointer dereference in gpiod_get_label()
      commit: 7b99b5ab885993bff010ebcd93be5e511c56e28a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

