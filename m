Return-Path: <linux-gpio+bounces-10174-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F1651979B81
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2024 08:50:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 300E61C22BFF
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2024 06:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94CCE83CD9;
	Mon, 16 Sep 2024 06:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GEzAlc2X"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D04A4DA00
	for <linux-gpio@vger.kernel.org>; Mon, 16 Sep 2024 06:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726469389; cv=none; b=fqaBE5bDgVHZhhMNRXQOykQ/Onm57BemzQJpch0G+U5f0W5UQSH8VFrmF0xzGD6Jy6/rEQN6vBFj3RzmR/13gBsRhL8ongjJAgNT/q1W3fQdElH5l6a+kJK1I/HbxwBvrhs5xr/6av4DqjM3L2x2ouk2xr5maAuzlYZbX3/JFqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726469389; c=relaxed/simple;
	bh=LqFyvfoxL4NyazPWc3Vs96IZF5AAGr+z/reSIEDUQT0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ISIiUWhpbyi9yOug2amMKo0Ly30Za2IKAXaCeKiaCYdpTX2zJbvo2x4QWG0lD6f+FaBZuSEpdwWHyhm8o+OeEwdxd4IVNtMlQYytSzTyu0keaDpuXoQwDKNV1wcin6I8FI7WKPoSZg2hoFO/FSiXPfF0QWrbkah4ejqugQ8Uc/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=GEzAlc2X; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-374bd0da617so2725774f8f.3
        for <linux-gpio@vger.kernel.org>; Sun, 15 Sep 2024 23:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1726469385; x=1727074185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3tqPsDphV4Ii9IYx+QZiuCpX4/Z9d4JMpoo8jYcvIN4=;
        b=GEzAlc2X6wsr4A0l0FbfnDxFkF/mMifF/Jq8y2pNmoSi8Utd5Kx1Q06k7XlmscaIbp
         ViCPkJhQ7YLtO6e0k8TiXnM/uT2as4rY6TxdwgPJwIKMhBQKZNYiUBQmPCYt/BBuyYKO
         pmb/ScoqcWIfmM14mQlpEEWLnJ333nw7ofOaawJQaa2ac4zovZ7jnPkrFI8eq2YbcUpC
         rK3jJsW/EzwX0q1EVz65K1/cTKYtlNmBJ6/46mHMZLq8jGBYjm8yIdKytrxlU8PVYmhi
         Mn5xCxMJ8yFE4FoVs81eF7sngmY2ZW/aBEuREAIb392zxuvxthZ/0Id1AdZpHoAtOoaS
         AJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726469385; x=1727074185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3tqPsDphV4Ii9IYx+QZiuCpX4/Z9d4JMpoo8jYcvIN4=;
        b=SUCHWWtDiffmBOF8nAHC7MIG7lt6Rngk+fhCYv081g8b6c3GYq3Ej6b6RKUYdX5SdB
         WdsKWdfj4d1LJYhvjZKf+xHVzKswWDKb5OVujM5shiL+WZAhxWm5FAq3/xJBAMLOHnrz
         7k+xtrM8CllFHY0Skx3p+mhmN8PVoX2/dSfqSzNAhaFxhc/qwxEbiMuVo3fXmj2zFZRr
         gM2cUandgff/LAV26NfNA9XjzoKpL4ZHXmZ6P2M37Q8llvt9xQS5LAY806Ee0tWyqc0C
         sAoaPvI/jfQhX+BP3qFJY8ETTFeGHYCIMPk8eike5/BQpsVSFXPSYbu8xw/+vzjQZKUe
         dvQQ==
X-Gm-Message-State: AOJu0YxE5Lz2fVlykmFLPc9PhBxxwLCWre+tZm6SWzCfOlRtgIAAgiQm
	cJxJcho6Ey9sJZVZ5vkdfsP9oYQ1nSZswQW0fJdujBJ8/+9CyjqCrrU749alMVh1T3S+/d6OB53
	b
X-Google-Smtp-Source: AGHT+IElGoH5qhUyAoQwjWThwi/FYIp5NcA3JEitcRF9dWHqW8S8hRrugskfWGlrjZTJg8g7diZwpA==
X-Received: by 2002:a5d:4303:0:b0:371:8a90:112f with SMTP id ffacd0b85a97d-378c2d4ceaemr6951192f8f.44.1726469385331;
        Sun, 15 Sep 2024 23:49:45 -0700 (PDT)
Received: from brgl-uxlite.nice.aeroport.fr ([193.57.185.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e7800243sm6255188f8f.86.2024.09.15.23.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 23:49:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] bindings: python: fix Chip.request_lines typing
Date: Mon, 16 Sep 2024 08:49:41 +0200
Message-ID: <172646937036.185947.12601581979717995833.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240914183352.16090-1-vfazio@gmail.com>
References: <20240914183352.16090-1-vfazio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Sat, 14 Sep 2024 13:33:52 -0500, Vincent Fazio wrote:
> The output_values argument was typed as a dict of tuples, however, the
> code expects a dict of int|str.
> 
> 

Applied, thanks!

[1/1] bindings: python: fix Chip.request_lines typing
      commit: 7c815ae11f3cfc98216d60eb0dca2bad0df9721b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

