Return-Path: <linux-gpio+bounces-19492-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DE7AA45ED
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Apr 2025 10:49:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A1DD463B90
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Apr 2025 08:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BAF5219A7D;
	Wed, 30 Apr 2025 08:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DtfVkXVm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E46D2DC78E
	for <linux-gpio@vger.kernel.org>; Wed, 30 Apr 2025 08:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746002973; cv=none; b=BakDrIZu7M7rpwLHyq18fTNyBMddfHNXCPyepozgcZxPEjCrAlTEYY8ViQqMow9Gmvs7kRH3d/rPyJaOFoifU76BtjJalEwXYW1TvEJnGgRCxEf+jbKRPqjl9DrPM+eINAW8KffhtsNPT8bKz+cyR755kQdW11ZZ0ZSUZ7nSdfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746002973; c=relaxed/simple;
	bh=OdMty/Hw6fMPWS20+EvqZ4ZzEGgbViSbEBmlpkQnDoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L5g+aE7yTZlqMoZTJHs/ZrTdDlWIEe1TKaPNApabr/LrThBQOKZZBVd0xaoALLvTG7MRVU+9FLa+6jHJVeLkg8k9YFZj4+mweqrp5mMsYTqu/p2kPO8m/pTgPeIW/awzu3x32b4VLXDGcxGx+i9GbJCjXHc0LAF5tXQ6wbw5pjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DtfVkXVm; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a07a7b517dso3161626f8f.3
        for <linux-gpio@vger.kernel.org>; Wed, 30 Apr 2025 01:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746002970; x=1746607770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYSLy56ignpVc+FFkYz56Kzg8HGsqpWp1q0ZMonUO78=;
        b=DtfVkXVmVTk84NAKDd1TG5MBc9xlXLJxhOlpvBVtSk7jzSBATO7Eaut2TNzSb+rQnh
         nkizZIs0d2tHnwBMCHuOwuAHnFHYREBWu8fxQvXFm9tyfHT/Yz7lCfS6Hza7gibLifAv
         z8Aa9sSbrEtJuIgf/DImKLGcSro2AQfD8ZJR2eApARilpxeGl7cTaFp1zvmrDKdtcU5A
         EJxd4uUUVa5xVkfGEHj/5cfDuPvVJIiPePLQNS5KEOQw5BLJVy1OVnuVREOBZbw186W+
         FJg4vzMkcHqITf21xIvi7f0BI9ftJ5vmGxrhXvN2P2ZA7NeoUOk3cZRQfNlKZND1M7pJ
         iDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746002970; x=1746607770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CYSLy56ignpVc+FFkYz56Kzg8HGsqpWp1q0ZMonUO78=;
        b=d2/ZV21NN5ogM/KcgHvbx7Jw92BGUvJJICfcVKNZ4FdueS2jquljBYHDDjVm5trV9L
         dl/nm3ZL28Wg8xR3ZlM8zE/5VTuUW3DoQV/vxN8PaPLy+DBVZrBEden6xq8yVXLqJYtq
         NuuMxCKAIS0qh9DlT43aSQaakz/pRQh4vgZvXbOndrhWd3jvVTo4G6lOKG9ecVCvrxlB
         4W1rgnXg6RDGeIEIRqVLohvrfXp8zVNeZWqQPp2uJRQVPPcgy3vhHlX5RkN+W9edNN18
         kwLJcEu2p5Nbs1qRtOzEZIisGzivFB9Cc4bAepzIVLPsQ4MnwEjVgI6gZE9Ou4xfICdI
         NaCg==
X-Forwarded-Encrypted: i=1; AJvYcCUUImOtphUvdJuVodcus4AYXPCB7/x2GhJJ3ur2w+nqkC6fqExt7O189J8lxGOzTlr4WIb24T1fBiG1@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw4dmKinAK091Gk77bnNkxjDYYc3y4J7wb1XANh/yZj5ReSjkV
	w7MkPVFB5zn66S0nBeLVCeG/RwAZxgJEehtynuqqn2zjwFTkFsRmkl9wOXgBXoo=
X-Gm-Gg: ASbGnctnjefsK2w+d9ijtSCJHvYjqfDkVkVbhURrR9o8c7u8rT1fbYPmXI5O1jVk3xx
	vI9+1Qi6pU1hsnKf96Y24amHx53nhLPunTk0T7gTH2+qOiIghen1UrBoj6JCi3DgAnCniI6hpWe
	uG+pgCE4mf2jtLnTJiK6YErAf6vIfn4CyCtVcnuvxbzG65lAuxo9eMiWGc5nud6jggCWrwUVfgC
	//C0aVUjzQiQyXz6Ux7qxKfiO+6oEKrn/4u6gJ8WHrzzz1L+Le/S7ZtcQg2/8MbZzkXLf0xLd5v
	vFOHrJgPLELZytveEOgKnlw5a5IA/++2tOf1XSijZw==
X-Google-Smtp-Source: AGHT+IHeNpaT1DZDH8f/17Wo/63Pel73XgGjjKRkrg+oQmZlvTGGPG9htj8UarBxnwBnoHFN5PMepA==
X-Received: by 2002:a5d:598f:0:b0:3a0:7f9c:189a with SMTP id ffacd0b85a97d-3a08f726d1cmr2060463f8f.0.1746002969745;
        Wed, 30 Apr 2025 01:49:29 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6298:7254:d3df:f23e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8cc74sm16624158f8f.11.2025.04.30.01.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 01:49:29 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod 0/2] line-config: don't allow memory usage to increase indefinitely
Date: Wed, 30 Apr 2025 10:49:26 +0200
Message-ID: <174600296365.33081.3014456836400750739.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250424-line_config_mem_use-v1-0-fa0abdcf0cdf@linaro.org>
References: <20250424-line_config_mem_use-v1-0-fa0abdcf0cdf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 24 Apr 2025 14:06:15 +0200, Bartosz Golaszewski wrote:
> I've received an issue report on github pointing out that repeated calls
> to gpiod_test_line_config_add_line_settings_or_fail() inflate the memory
> usage of the calling process indefinitely until it's killed by the OOM
> killer. This series proposes to address the issue and adds a relevant
> test-case.
> 
> 
> [...]

Applied, thanks!

[1/2] core: keep memory usage of struct line_config in check
      commit: 2560a857ce43f2bd7b31284ce2b354d5c2edcd18
[2/2] tests: add a test-case checking line-config memory usage
      commit: c116b6f6f118b983dbd9674612396cc04a883905

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

