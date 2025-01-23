Return-Path: <linux-gpio+bounces-15018-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB073A19F89
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jan 2025 09:06:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A71D5188D492
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jan 2025 08:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D388D20B7F8;
	Thu, 23 Jan 2025 08:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hNNFGfEw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AD326AF5
	for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2025 08:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737619599; cv=none; b=mQHK8pY8w6lW0r4t6pusj/eqjW2gNHvnJOr9Jr3ZLdLII1jtRA+k3k61cI5siX7X5x5JJzHtBQWT2ttt+TvNMMkutlcNbHMIWHMdBwzEW12+Ar+F/n4QW1tGWQEfqqhQo29nnCxlQob6quPmVN6od0CIIyzYX2yjluYq6vBYelA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737619599; c=relaxed/simple;
	bh=gxTHY5tNFQ26TyUclI0HVgzv6uKE7BrzAyF8O0x2uWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u5TkWLVAFODO0E3VmLBZGqwg+qkIccC1yQVuTe8SwX9PVEw+dkxsg2v3tD38yfPAhT/4iklDdzGfxr9GhIcOOOGJL30MooNGDX7gAP87c+THhnNsitj+fafgyZ5JYPfvDvZeiPnnJqZ0+YvFlDHsoy3U1DZbJyhXxvZuwYIQzCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hNNFGfEw; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38a88ba968aso499718f8f.3
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2025 00:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1737619596; x=1738224396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7vfNOMJ4n++kfz6xlTIcGOIzfhrBCGByHH6Dh+jmoo=;
        b=hNNFGfEwVhQf5PmXEwZYtlf8bB7Si1FKUS58lkVhIv3m2z2a0xi/1D0BvhI5d4u6pa
         GwtPMgZzbBydg6BDA2DypTTNoqtTzAb890QmK4vtYn+UTPEiPDeX55orsqmbrIUo/+2t
         /8q5GW+v68tR9eJwyfDptb8M5dvmcGALmCMWFKAsmtUTBjPbdpv6mBaH1z7Hh2YhbcfU
         qG+8EfG+ZR0oS99huvXTuH/PwzAveTyqJXGUnRYzLWcENmOvSHZsLzNi1OXpg4nEulze
         wPPM88Qqve281jtbnNITmzu8bjjf6RR+W2OeQrXOHmsn3WwRCreMQlL4d7+cOEqw82bS
         XwPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737619596; x=1738224396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S7vfNOMJ4n++kfz6xlTIcGOIzfhrBCGByHH6Dh+jmoo=;
        b=Mcsy/Xcm/iQKUQpswwJuSM09AoS0ZqKi8HPdAcwVV1Jn1fBbbPVwu9HRwA1NUKMZ1M
         92Ftl4rPyiQf410qTe66jJOvMxEBactbAZjNNwZZOeW4lKk+9bqLzP2L1DnnVi+IjC3O
         MixE+hWmSVY0Hv8GS8np+BkrQ9RdEh8v8CeEzLuP6gw4SNA2cWsiKFwtIoMkOrfGGZom
         9gdB1FOaC3gi0k62AU4xEOVpoQuuio2b9K1f7rC7lyqCnv1rYqVxDNI8OZIIwWaTA/20
         SMR3rsp+k075hYk9n3xqjEHSxQ4g3Uk/Ur0q4BwaqRH/KuNA5yLCa6QfsAkqGINXp0Ya
         W2cA==
X-Forwarded-Encrypted: i=1; AJvYcCXgzdvunGeAS2a82vz9HRKWHe2IQi7kif0/RePGrAb1rrH2lWaAvNJBojSLUPcZcTEu1v4FY4kGM/bu@vger.kernel.org
X-Gm-Message-State: AOJu0YyB3YQEPD4vkzjukJeNEqgCxEulxdCTNqzGwiaV+f5wV0+nauuv
	Zh0FaR7mNdqNrcBZQeH5TvwCWnnJ/WisqFOPckSWUc0FJhjSK32yuc3Nl0Y/RME=
X-Gm-Gg: ASbGnctUXZXU8gwOwjmWcA91NYK+dKcL+QJhKejumLAVuzhKpTC3NuHdiM6khydcesY
	Zj7R74EyEgc3OexVdv5log6Br+tgAJHayZu82+gwEBBtQgVDSITLxBBeb7cvs/sZtTtO+jfzSRc
	bc3Wz1esk8X5QSxuwKtHxVQ1uDXr5FoaHRTMaHbrfNxFD1q2ApzLMM03eeCsrtIytHUT1lJ7Qeq
	5sC2ixsEdozvBSAUSPeRF7MQNYhpTQtg8SWUChtShE3dtehsOypL7rKAgMZaU5G5UdkMqwzBIHK
	oT1Lsk+Xail+tW4=
X-Google-Smtp-Source: AGHT+IFoSVv7AjtPcj5hMzm0WESMq53vzX3x7yD7jufTSV68NHpQ8JrlP4BZsZhmIRQzeL0cGJ5DoQ==
X-Received: by 2002:adf:cd81:0:b0:386:3a8e:64bd with SMTP id ffacd0b85a97d-38bf566464dmr15670016f8f.22.1737619595796;
        Thu, 23 Jan 2025 00:06:35 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ad40:de3b:e658:a016])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf327e06asm18802231f8f.95.2025.01.23.00.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 00:06:35 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Catalin Popescu <catalin.popescu@leica-geosystems.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH 0/4] gpio: mxc: silence warning about GPIO base being statically allocated
Date: Thu, 23 Jan 2025 09:06:33 +0100
Message-ID: <173761959063.8981.4421815655644713601.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 13 Jan 2025 23:19:08 +0100, Ahmad Fatoum wrote:
> The i.MX GPIO driver has had deterministic numbering for the GPIOs
> for more than 12 years.
> 
> Reverting this to dynamically numbered will break existing setups in the
> worst manner possible: The build will succeed, the kernel will not print
> warnings, but users will find their devices essentially toggling GPIOs
> at random with the potential of permanent damage. We thus want to keep
> the numbering as-is until the SysFS API is removed and script fail
> instead of toggling GPIOs dependent on probe order.
> 
> [...]

Applied, thanks!

[3/4] gpio: mxc: remove dead code after switch to DT-only
      commit: b049e7abe9001a780d58e78e3833dcceee22f396

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

