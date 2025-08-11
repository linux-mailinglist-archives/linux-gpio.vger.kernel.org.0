Return-Path: <linux-gpio+bounces-24138-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FE5B202E2
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 11:12:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EFC33AEAA4
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 09:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DC102DEA6A;
	Mon, 11 Aug 2025 09:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="SR8NFlZ8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7406C2E03EF
	for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 09:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754903428; cv=none; b=URe4SXufFB67Q54f/cW+jM/e+16tlv2ljIxCeCc73ZjLxgviECvsNPVr7T2YVP3YP0byQ+ictQQh/R54VwZa4zX0rT2t9DtW2BXsekI/1wmEwS2anbkZVRBzLuXV3R5wANswPSVlQoN5PJW3lSC7/+sn00kZspOdV3fO3Luidr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754903428; c=relaxed/simple;
	bh=M68uVMQpulbgye48v0v6XRugtABzksy0xafNWUr1d8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XFE2yzf5v0yIvDZOs4HdeOZLWu5l4lupSn25EUtDO/EXq8TubU36B6js6XMKTW3DSnahmu+6ZSk7pNTq7J821idfrZ/XQ4HT+89BwBKckeAo/uK55Cca1bCAs58GFNbxhK21+zfDcImvoJt/mX4SNjvhL4NUA5NZ82RYRizsArY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=SR8NFlZ8; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3b7834f2e72so1953486f8f.2
        for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 02:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754903425; x=1755508225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CCWWcnBEIfeiHc1uumppXRXN8TIhuTosOXsIOWKXc88=;
        b=SR8NFlZ8oJ24+FbhNxZnVUKahU4+ROy+xEkf9pcDuJfxDI1948KDfhZ9S/4wHI/ucR
         xg9lVVym4Tixouqyb8YwqdIjwmPDqSQOUEIXK1RWfTgp1qDyENA3T6gx5ttfis302YF1
         AAqEyHYD1DrwM2cKOoWrdMfn89Ya4k8U3YHT9IqeNOo8oh17oM0jAl2UkrI9ZA+ZRU78
         lLYPNfAWeg7CpwdbQs1tXWJQkEV7BIg9HMlz5bvHCDhL2HRjdGFO/UgZSYpcujnubiHS
         IW0/9IJfx4R2du5W9Yrq1CNlXXjPAWXX5vTgLDo8L6KlT2Bgr5CKj8Fj7lWxkGr88/Sr
         7NdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754903425; x=1755508225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CCWWcnBEIfeiHc1uumppXRXN8TIhuTosOXsIOWKXc88=;
        b=b5yo2QTNH1Qv7atcnQToJvY90P6vanNyP1yNZHregQpTVFh0Tx2PvuQ4esJl+R+oao
         lEQQyJu0bjR5viT5owueqPFjceW/QwKNsitGDfuXqdEzv9Ym7TvClUhcp6lED+DCj4f+
         ejHL/N+DgjBXcMMcDlJ5/bIeAYLdO0Z0YAu70dRuduuZi+YhvnZ+YUB19L5bSoUNcl/3
         ys4TnRvj2kinGTpvBh0isN7mZxL6VNzBB6UrF4RraY1RKdVqJmdyC2o6NzgKMRlFl+Al
         O6XeEodpN+amNDrQ9zRBlqEr5qoAIVt8t0NlqkzZr7JgZPyYYuJBjZpfih4hniIPGGjY
         ViOg==
X-Forwarded-Encrypted: i=1; AJvYcCVEdjPfwM/LK5zh2pucjaZ1da1JG8H4YGTusu9V50TyZjDC0EYnXQGif0MNEmpzfqN1uy78+SDVs8p6@vger.kernel.org
X-Gm-Message-State: AOJu0YzRWs1tIzvnD9Si/focfmKt2+gtppmaIv35vI7tXMO2PFFeT1mx
	23xKRRFw0pHOcSYPKQg4pWsVIAigVCgIZwKNLrCB7hNWPzVBVHLKoNZCC27seur+DnE=
X-Gm-Gg: ASbGncttLJa/yHnRk4RTPsOxMyldEPW9XXLBqu5LfX0v32u782VHmDTqlSvTWkzMbSY
	0paQX+YXS/V0t/7yIAJJ8Ogxup+zW4MH2/tFi5k3TflrUrmGV8NejyL1Ilg/Ni1DJbu2cJ0b3Lp
	nv7Jy1cgh/RTgs0ib26SzT3YbfVVjeckBFG1oELYwXbZiVi1/8Vk+zf29Ml3GQsrki75EI+gO4E
	35h6adBnKdymMC/5Ma3YwZIURoPRnt43qFhvsNUpwEcm4WruoLJa/QnyXGCEinS0Db/AgIKOHvj
	W/n1vybEaheTwihRp3PMzCaM+vd3lkgvVfKgJ7JoFbwNflOnoBvzzvnsnFv9EWUuKcZeGQsODPf
	ZYJeSZJCAzZgRHTEyx35slJy1
X-Google-Smtp-Source: AGHT+IFcsRQpF2y3qvZCx8CEhahwxH5ywYYmgyKLZxCskge/Ce/FxoMSAajJ5ljwUgcIeV+8J9CNHA==
X-Received: by 2002:a05:6000:40de:b0:3a4:f50b:ca2 with SMTP id ffacd0b85a97d-3b90092fbb3mr9639037f8f.8.1754903424211;
        Mon, 11 Aug 2025 02:10:24 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6841:8926:4410:c880])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c453ab0sm40220239f8f.44.2025.08.11.02.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 02:10:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Waqar Hameed <waqar.hameed@axis.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	kernel@axis.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpio: twl4030: Remove error print for devm_add_action_or_reset()
Date: Mon, 11 Aug 2025 11:10:18 +0200
Message-ID: <175490341188.22509.3589235210519192885.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <pndjz3im7te.a.out@axis.com>
References: <pndjz3im7te.a.out@axis.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 05 Aug 2025 11:33:33 +0200, Waqar Hameed wrote:
> When `devm_add_action_or_reset()` fails, it is due to a failed memory
> allocation and will thus return `-ENOMEM`. `dev_err_probe()` doesn't do
> anything when error is `-ENOMEM`. Therefore, remove the useless call to
> `dev_err_probe()` when `devm_add_action_or_reset()` fails, and just
> return the value instead.
> 
> 
> [...]

Applied, thanks!

[1/1] gpio: twl4030: Remove error print for devm_add_action_or_reset()
      https://git.kernel.org/brgl/linux/c/0d1e68fb1efd2fe951d68cf05460e3672d4a846d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

