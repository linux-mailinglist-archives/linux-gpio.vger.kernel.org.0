Return-Path: <linux-gpio+bounces-25294-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F72B3DC44
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 10:23:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D92E7177ABB
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 08:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 406DC2F1FCC;
	Mon,  1 Sep 2025 08:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1N4fii0f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0D01E520C
	for <linux-gpio@vger.kernel.org>; Mon,  1 Sep 2025 08:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756714990; cv=none; b=p4nusoIy0cgKu2doLAGtwSXtyC18k0dAaXkSP/Lv3ALd0ROqiUeZmSv/dM/BuvFmcWRVJL7NjID4fCxmpJ7XZ+Ke/V8FagnRDK1I1zaV5lzAenGrYeGaP2ANYKRbnWugkhxlLuGf9uJS7lWB7/RLEcKEcdI6wff7ZyaRXKWxt0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756714990; c=relaxed/simple;
	bh=eBnXrN+bhDWrbKFo4imenTN2oMgX8VMrSdNc+8UK/i4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uGg0LJa7qWBcVJwGD273S92WnCPgAXus1+ZsKg5cK70Vz5d4oUuaSiHja+ZhGBruxAJzRY+yd9dHq/O3wbQwDoM4cBKg7HNgvWWYazN8HzGc/VGR6904vHlkJsv494cLOscikZQGcP3imdj8mqgSHhBrsxqBq4wvmhGz9EkmJtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1N4fii0f; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45b8b02dd14so4818175e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 01 Sep 2025 01:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756714987; x=1757319787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/TzMfU03iVoNhQlUC5AV+yJRC85Wh+VvFF8IARXztA=;
        b=1N4fii0fNk+PRnoHtNDEaIGyUIwA7YIlNBpmNTitF2twJ10a8sGYwGmf4AkFcMeFML
         DbvFzqHuRuTSPs2ER/ERwb8v5rN8KXXZo1rd/aBLOILqY7JE05F3+5lG2vPDIEWLlwY/
         jBHxQxU/Chz9OHXkB5660nAM6J/nWRvrfN/RQ6Mb/9qzNOc0kWWjTfo9gjwPrszTvFMK
         OorWuVPpwXrGBADcsMWmX55LJ+olQCyF9qwqrNbzs3Yyq/CHPGl37vM8cEeqIx4N/F8e
         i4mxBtFSiBSL96M+zyd7MVqeOAnLRIbxuH5bs1PYAqEPeAFz9xnwy17FupdDg3C3i8Pa
         jv3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756714987; x=1757319787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y/TzMfU03iVoNhQlUC5AV+yJRC85Wh+VvFF8IARXztA=;
        b=tWKU9nBFu3Z8MS1rLIAemZQ3rqoiVf65/poHT6nkJ/XUTgLfctajdtn7rKJlGFRg48
         CGeJtL0ZTX/WhP7KbZPzNJstK4xeNrWi6uWhrjhNIjogdJkm6ShIcrugAvYnEWGgInma
         Bf9nCSstTqJUHc3Y54/S8rfew0j6Ji5oVYMOrgVwSSFx2keRNzTrO4s3XWq7dvJ5M6Ao
         4DZWSIRIrZAP+Ea9Y2O1EoiPdFq/D4+2m1IVp84+iuuUWMs8KU+8s+uByWnYs1wPgig7
         Nz4Ef/CrsrHpd5dTbGL4p5S00IFfVUwrK2ZqeabRLHymj3kaptlm/fszrE0ilZzx0d/2
         f2DQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8HOcoczLewwoMJcJVdth82jnAYn2zlr5DG2KQI1vCx7wBucFRv7vxU+ve/HWyuErqy2f9683bPSeO@vger.kernel.org
X-Gm-Message-State: AOJu0YyZBVh+6MNjpv9g3wrDSzcwMqlMOD6X2PADh2xF4amKBf5fOKDy
	lEmaK0anGMBmdBc5pUzYLEdyMjEJYGQF4C7K7k2vr9gOmoTE4UMjfV7Qof+NXXTSzjw=
X-Gm-Gg: ASbGncs4aPTz2JWY5YE1erthFOi1k0SvCX3ry7bw288nRHvV4Lx9xOOdrxIsKH+ZDSE
	462zZmAbIu7QJkEt4omsxe5kkpfsa1u2qct9T4vJB3QdkFHQD+YHlF4TYuy4pOVZX/QaRTIXxu0
	gLUJhf7gMwaEQCPa1KcVvvX/2eBvGz85449jGutrFPrsF5cS5PBXRc4rk4mD1uArTIp6M7VSFDb
	K2LUT1VPHj8kTFfcRnVBoZP+fqigJJzpxiRWROh/qycYbzmvmf1AmFTJxcrzMjreME1aRedRk3l
	B0ZyCc4EfTV1Gn/fP5ZVWkRJSSCQoVVweoOdPhhqH6e+K42pbIApDfrSE3D3ODphtkZR10DObcQ
	neAGrA4Fpa+hndnbMk8nSE48=
X-Google-Smtp-Source: AGHT+IHrRAvVHJoLxG+zvXZm3/POhVhgn706XD0S+1ZzXZvuoVmsWB2DreVoI1b4HDndfh7Uf1rk9w==
X-Received: by 2002:a05:600c:4f89:b0:45b:8d2a:cce7 with SMTP id 5b1f17b1804b1-45b8e2ee782mr13233375e9.15.1756714986550;
        Mon, 01 Sep 2025 01:23:06 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:fab9:fd92:e2cb:ddcb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b83f86c8dsm62110925e9.7.2025.09.01.01.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 01:23:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod] build: bump required GLib version for tests to 2.74
Date: Mon,  1 Sep 2025 10:23:04 +0200
Message-ID: <175671498133.37289.3804178597204624737.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250826174123.56862-1-brgl@bgdev.pl>
References: <20250826174123.56862-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 26 Aug 2025 19:41:23 +0200, Bartosz Golaszewski wrote:
> Since commit c116b6f6f118 ("tests: add a test-case checking line-config
> memory usage") we're using a symbol - G_TEST_SUBPROCESS_DEFAULT - that's
> only available in GLib v2.74 and later. This version is already almost
> three years old so should be widely available. Bump the required version
> in configure.ac.
> 
> 
> [...]

Applied, thanks!

[1/1] build: bump required GLib version for tests to 2.74
      https://git.kernel.org/brgl/libgpiod/c/5e744bf56d84947203b191a79c2e505bcf8d9900

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

