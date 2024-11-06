Return-Path: <linux-gpio+bounces-12632-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF809BEF45
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 14:41:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C11521F2438F
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 13:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92E3A1F9EA4;
	Wed,  6 Nov 2024 13:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="usW6H5NY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C3038F82
	for <linux-gpio@vger.kernel.org>; Wed,  6 Nov 2024 13:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730900507; cv=none; b=lBcPBvBnidjWzf9nxHbEvQHa84oqKyIhrUkgz57hmzb/zU4/m3BjGrIH1eJJK0RKSjqw21MgC8nmqMiJGEz565u/HWz4PmSOabPOFbcGqAhfm0dcgZC/coEaMhFO5OkwzQRFIEdzUUG+7SludZcj1kpyBYMwt1kVRl0eDwzMaPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730900507; c=relaxed/simple;
	bh=tDPpAiA8qq4eYGg5kFCzg79MeqhLAL4jFkMT+y3ROBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ofs51j53ORZD1nqOmym62RLByNIfhYKUVAX4OUwyaug9jfU09eWu4luSoUIzBqQiLgxZYYzrXvvo+vu8j0zOQo5WoonjymeK9iMzBf7Qjig5SGzsqV8MwuFHmjeCzrVEx4eQCeHc7sARMtsyKAyHGUibh8A9kBNaiJTKKMR/7V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=usW6H5NY; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3807dd08cfcso5608151f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 06 Nov 2024 05:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730900504; x=1731505304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgJxednhr3opq3LZItuuNkskAw/GzNLN+52jnrBsQ/U=;
        b=usW6H5NYlgX3E/hmuVTWJNXSd9qedmRxU11MOaHxVui/zvffXVY52aZKcKhVnmuNdW
         dJX0ob7B7oF1aRc+ZIbwiZAJihknkpDq+AvydPH4phrI/qLWznW8dfY53XkFmE7GTgTo
         +oNEvG0gnovMqrsTugm7gV6wXvLWP+CrXVsa1x0+lPrefxchzlF0Beuiva41l/F7o2ZS
         Kvt69IAusCYYJuybfsag5/0FvfeAhOEQABmtogtFblZ2b+QDLRZWOSiy+OpSG/nk0AQC
         KJZ7em/+tn3VmbgBmIVjEISuJz8WvGeIjdfJeJUH6JK+xhVV9kj9gRfCQj6hoZaCjK4O
         xWow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730900504; x=1731505304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HgJxednhr3opq3LZItuuNkskAw/GzNLN+52jnrBsQ/U=;
        b=EFJUxVMkocpG2GiKM+sxlilLi8bkXNA6AB6ulYKYL2Ct1mWIAsKtAESTAeTbSPzSYs
         jqF5GR6Jd6DHrNngZ6M6n9UC4+RwrK0stAAiEAUtA4oV807gATaERCeREjManPrxLG7S
         MNUWdf4CakH4FqvUMCW3Rk0t4JtG2kzuGRVfLecTu0UGYAzYpzhaKi1Ql5J/ZwOfjgPl
         AHjrQPVImJxO++AepJFcXWb7QjrpXI/QtBMYj3dhMelJUOVoh1xGaz2Mnmkl5ol9hfzc
         IJf8qzcDMYCgGXSa7HjfdnjxSZVmVIEDCqcU8iw92r8LKzv0OaxYzBvM5R1Klm0uWZIr
         bmag==
X-Forwarded-Encrypted: i=1; AJvYcCVkesCNB3jgrf1ETC/etNFcCvL3i1y5NoKKdbhdEY8Y44Mf6GES9tokqwtcdXcqxK4t+KIOb5rBo7zv@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8Td9z1060+eiP6yWzQbZI+cxARp5yM9TefE7bL0j7md8/Mfku
	I7fQtkE22G8tIOWsu32mWdLepKDO7hyE+z3yWJP2QMunSsKw/DdXmgp1tMy1uSU=
X-Google-Smtp-Source: AGHT+IEyaj+1sTsFmFtwwzgISgvluY1k3NLJkFphoe2OvRRtlByJCOZac64u/gC+dzPW7X5Bu9rwjg==
X-Received: by 2002:a5d:64c7:0:b0:37c:d1fb:82f4 with SMTP id ffacd0b85a97d-381c7ac46e7mr21350952f8f.36.1730900503962;
        Wed, 06 Nov 2024 05:41:43 -0800 (PST)
Received: from brgl-uxlite.. ([89.101.134.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c1168afcsm19150857f8f.91.2024.11.06.05.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 05:41:43 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Heiko Stuebner <heiko@sntech.de>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: Use of_property_present() for non-boolean properties
Date: Wed,  6 Nov 2024 14:41:41 +0100
Message-ID: <173090049917.17542.13429958441997211039.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241104190628.274717-1-robh@kernel.org>
References: <20241104190628.274717-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 04 Nov 2024 13:06:27 -0600, Rob Herring (Arm) wrote:
> The use of of_property_read_bool() for non-boolean properties is
> deprecated in favor of of_property_present() when testing for property
> presence.
> 
> 

Applied, thanks!

[1/1] gpio: Use of_property_present() for non-boolean properties
      commit: c6789170ddef58d28cfbc3342933713ce1e2c860

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

