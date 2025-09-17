Return-Path: <linux-gpio+bounces-26286-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DFAB7C7A3
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 14:03:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B7EC7A5EAD
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 08:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E41130F803;
	Wed, 17 Sep 2025 08:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lcCqaTPE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFF72F746C
	for <linux-gpio@vger.kernel.org>; Wed, 17 Sep 2025 08:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758099376; cv=none; b=a/+I7Zhgmr5qeLF0cw2X70iElokwfmgSKCcRPuKLXxJcxFKTr6oB3U/W4U13BfsRMxQ0waow5PxRs3PwYnPDvB4J5n7tqbZFZYEQytJdSdZCvSVW3sM5RGStKTFlrbucUKY+LZ/4QdaDWpQ03oagYnihaPnAtO0uT6ZNZ9sApRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758099376; c=relaxed/simple;
	bh=B6c9MTLwc2XGdBCrevDQ9qDxCYaiSZdKMcxvLVT9/iI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BOHnIzsSiPzPC1lantyHU0joZQ4Uf1PEf9ackTyLIjEcO+8bbV5jY8fHWHR52GNaIOvDbFVUYzIIs+Jv2q2vZo7WmEiwmu2JvF7q/e8tS3DjKNBwBi2pa2KgSuFmm67/J6lGlwlfEFC/e83WBMALqtlhdLIaqIiIlvaCpNSk3gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lcCqaTPE; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4619eb18311so3672415e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 17 Sep 2025 01:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758099373; x=1758704173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zJpgRICzbLGowr2FIuOE8Yg45vw7HbIpaAZsTNxfjgI=;
        b=lcCqaTPErfI+PKK5uWMawaJH14T8sh/TIZY6+iWPweo/rc504WRVI+Ny4kNJXCoZLK
         8J/n2XMdEVizzIMvbG/6KvzYOfxaTljtMZDq6lyDCJezjdXD44vy5THIw+dau/1EO6Gh
         Zi/Ncnn4srezIm2IiaZ42J20Fm5tYVVbmEuToI/u+46i8ba0vhmkRxR4Be/15nI+O9Sx
         jAA5bdZ/wN6eVz2LRnHY0q4oAsXt6NHFneEMF7SMsHz+DtA+r0aN/a6okDq4sigMDdRs
         /FvKs0B+rGQaYCqL7XwTkitrYuhYZXkvSZnPVixanYJ/a59cCYGtHqFFYBUUYHWAfNb/
         p+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758099373; x=1758704173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zJpgRICzbLGowr2FIuOE8Yg45vw7HbIpaAZsTNxfjgI=;
        b=fydy8GqmL6OZvbzXwjb//oF9aa12JofumVF1thrcIB5Rf7zzyylp14W3YhGBFWle2d
         LPWxzr6cDzA9rbDtfYCh3THLgmUvImbpBYnuv0HdguYjpvlleA0cS6wbnGe7cMRMoDnv
         SqmI+MIc9ta6DzVriefk3V3xWBvRwjqMdWijdLrWTrOglDkrej+d1Spn1NdM+ns8eXx9
         lDGp8gBfSspL1Nc3sZ4WJLTX1wLwyIlyBIurxcSLzjXZ3fvVtHkAk2Af5NtkwaOUwj3k
         r/aZpM16PlSCl7iucbXueGHr13QPPIwpjarReeiAjSpwYQ8ztx8zNj8X3cO1hn2/UIv/
         rBgA==
X-Forwarded-Encrypted: i=1; AJvYcCV1d1Iq3JCHTtqs3nPO+B+aqXP49uacXvn4UHJ/HKLDLKHLJCSnmDD8c4d+Laa2740as+m1JZY2HPvh@vger.kernel.org
X-Gm-Message-State: AOJu0YzdFOFOYL8Qda+3I4iJXlCQtwqYSltrJstlkVDaNtcUDqOcoER3
	SgYQAJWls73RSjEjw+M4GpwtSrW58rKOogA3kMs83jVGACqPvcc3TJQCWUsd/ZS1Z8M=
X-Gm-Gg: ASbGnctreEB1bQF+p69nyi4tUfcWj14vQnIw7p35esr5TqLO7ojUCvqOWhRUgiwdwUy
	FMb4jYq0a/CQgMChW4EQ7iF3Xu+WgP52XiCwMpIozgot6I9hiyS9Wdg7vagcbiPjvAWWcaYsWpD
	wzuNwlaV8M3qTtjWDHdrmF5RhVY+w9lNEp6kyZA1SlWQwOITYnwE/Rg6hT+M2ORCxOLDpTlamVP
	LXuX/NbVwx7FdNfzkQic6X2PFxo4T7i59Rrk4Lj/Wn9LSNuQLjUG+iHJyQEG+U5fZYJ+mAHAVIF
	L43q7ikP7v39pEzo6bkbfnu7K57knoRra0EZBTmQZHjux+RffUPgYfTPO2cYqd19rfK6OFqZr34
	v93aI05CgZ60Nj1uswV/gq1brkhQLva9YtC/3Zkhri5UQ8jkebLSlTucVoqxy
X-Google-Smtp-Source: AGHT+IFfHj1d6cqh5fxkybLL27UGQX+/B51RY41pe17x67AKJn2yXlPBr/91btPURGQ/8K0wjUfYSQ==
X-Received: by 2002:a05:600c:548c:b0:45d:84ca:8a7 with SMTP id 5b1f17b1804b1-46202a0e8femr12039265e9.14.1758099373158;
        Wed, 17 Sep 2025 01:56:13 -0700 (PDT)
Received: from brgl-pocket.. (94.red-217-127-72.staticip.rima-tde.net. [217.127.72.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ea6805001dsm12895995f8f.6.2025.09.17.01.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 01:56:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] gpio: nomadik: fix the debugfs helper stub
Date: Wed, 17 Sep 2025 10:56:11 +0200
Message-ID: <175809936780.35722.8768362923828333161.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250915091007.28438-1-brgl@bgdev.pl>
References: <20250915091007.28438-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 15 Sep 2025 11:10:07 +0200, Bartosz Golaszewski wrote:
> Commit ddeb66d2cb10 ("gpio: nomadik: don't print out global GPIO numbers
> in debugfs callbacks") failed to also update the stub of the debugfs
> helper for !CONFIG_DEBUG_FS. Fix the resulting build failure.
> 
> 

Applied, thanks!

[1/1] gpio: nomadik: fix the debugfs helper stub
      https://git.kernel.org/brgl/linux/c/0b1619c38600fc06c73b1f59c64af0b7df08fc2c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

