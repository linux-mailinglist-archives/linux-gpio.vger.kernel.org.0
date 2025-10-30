Return-Path: <linux-gpio+bounces-27862-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FF6C1F4A3
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Oct 2025 10:29:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1427D189FC5F
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Oct 2025 09:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22B1C33EAE3;
	Thu, 30 Oct 2025 09:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="F6hQ3jA6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5BF30E857
	for <linux-gpio@vger.kernel.org>; Thu, 30 Oct 2025 09:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761816526; cv=none; b=jlEOgor7uZkUAqEsh/1/41PSXm2D5HPMzZmfYrBgbnffVMEi1nsW4rx+mjmOhzDfH7fNIWN1pNDuge7NYzfwy2JVsLusntq4GVat9Kjge6CZ0HoejbXU4JgAgHScd56jpkPO0w3XmWlc7heb483AVcNybtMeZAQOmpJ/VNPD5gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761816526; c=relaxed/simple;
	bh=vIAW4Zwu/W6Q8q359FT7FGmmqecIKjR30/9fruhsdh0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BvKl0bTL+jnkm02XGZ793JSR+3LkirnZVP5Xe7LxKLjboIvhUs74qQMYUD2Tj/PmLsqH/Plp1HzDud3dQfMvmgJeW8V+Ae9t3VE2exKQVRZMrRsijlaCWpi9y63X01XXF6WljhHilv3D3D+VQAq/HzjdYAx3ANKlEPQJM8SphR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=F6hQ3jA6; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-426fc536b5dso509738f8f.3
        for <linux-gpio@vger.kernel.org>; Thu, 30 Oct 2025 02:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761816523; x=1762421323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QlMCS8zFdkhzxHQpidU95re9+f+f/wicSl76SjrRjFY=;
        b=F6hQ3jA6hRpSwkwQ74K5DvPM5Y48+KqU/4HmnzwujGbZw4nmoxU4DCxYKzIuRHidnY
         pDMIhF5n4I0h7deP32V1pWbEh2oZ9PC/9H1xy4Jhr4hYGQ31r904C88t+F7n7MA8ifCU
         xmeN+gM+j2AOmVIb1iXsN6U5bXcQ807wU/rMKcFoEKHQnKDwOphEBaYJQBN0uuzEN2yq
         cLl/t7qxrkg02QN6c5Jq7uOrVpDhjtIEdTsxkfW83enklwSqi426S7zH8dIeq1UOJF81
         dJ5tfW40vWg2cw8h4MP4vhKmGN0s60Aiqa6zYI8JBb91FccSF6+yw0v3AA6gF64bSCGk
         tq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761816523; x=1762421323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QlMCS8zFdkhzxHQpidU95re9+f+f/wicSl76SjrRjFY=;
        b=E1YRe/5AqLNmE+U3VhtYgQ/0MvumGovxYd9tnvh6nnCCwtvSoY/5LwVlTHTCTV/iXG
         1g3SrYXcuOdzBZ8RttGDnACoq+LB+OM3CJXVFuqcoQiJMq+G7Eotk9e1UMm5ke++7A/a
         OkZyeEJj8UpWjZzSWMAtW94ybfWFu1ACYpGesi9Fz8tLdvRBXP01uAjrPRmRoMKkXKsR
         Y9pT9s4ONIoGP1gSRXMg/6XviOVWere1ZJPEMvQF6cq2/LhHia1wUDcGMe+49EUE5anH
         EYBnT461qHlrCM30UWjyA8kCxywTILiFYN/r7dOZuRKo+t3PViRQD5ttQLCCZEIJwbH7
         i/Sg==
X-Forwarded-Encrypted: i=1; AJvYcCWdjJFBmgSCBzVxppUY5uLQ76FYpu+FbE68b45GEHCl+2mqp7+s2MUT0HsMgySyZl/Mvk8AqFt6oxVA@vger.kernel.org
X-Gm-Message-State: AOJu0YyIKbADkOtKJKEU47kNmiGXpcmTW7/ZSuwbGOw0Xj+/vHwbfxHj
	DG34BWLYfuvs2V9ECNptJQl5sd3VQU92xVcapQOqQ6hsXyFRFPaiJjEYdJqFHkHVLj8=
X-Gm-Gg: ASbGnctulWkRJ+oADsbkKXLAKry9Hm6TBffydN6PgEpXWa9KmAxXkI2Bn1YId3CrSiW
	pWQbuI6CZwAC9/D3PJjxnNlgmTy4nVlH9gp2E64L2uMrI91MApw+mSasi1XzdMjjPKshzp3tIGh
	uZoRe7k/Q9dkEIok3LEWem3xXMFZWL6X1X1f8ozcuRpeWEF1sxKFK/Iatys/Kfbs6/c40RaUCFk
	ZVIM4fcVrn0fDLSVd6TbnhCl6FZ5i/ahmoOVjKcGeHs0p+XoX9PvHv5aoOMlTVZclL9lhVGMPxW
	hVnGY1m/1/CDcLa6jRaJV1/4AH7gI2UJcmpRBlbNczVfj6kfU+luMDNpBL0SaZQBQVMKD3QOu6Z
	0ml3iHME8oO0mxCxYZISS+vJvjW/0jV8ybI5Qyb2Oe/q72koPdcWlLli9Z1x7zeR1tfOLW5hx1u
	BaOEh3
X-Google-Smtp-Source: AGHT+IGlvzC6Q1tht+J5f7b6Br8g6viF2wvjUGhpKtoD8qbOydQjRzdpkyGa16FvgoLIO8huegHYQA==
X-Received: by 2002:a05:6000:178c:b0:3ee:1233:4681 with SMTP id ffacd0b85a97d-429aef828edmr4959897f8f.23.1761816523017;
        Thu, 30 Oct 2025 02:28:43 -0700 (PDT)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:4de0:1456:94e9:3a3b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952d4494sm31524134f8f.21.2025.10.30.02.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 02:28:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] gpio: mmio: further refactoring
Date: Thu, 30 Oct 2025 10:28:37 +0100
Message-ID: <176181651569.78037.7678074832123587651.b4-ty@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251027-gpio-mmio-refactor-v1-0-b0de7cd5a4b9@linaro.org>
References: <20251027-gpio-mmio-refactor-v1-0-b0de7cd5a4b9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 27 Oct 2025 14:48:01 +0100, Bartosz Golaszewski wrote:
> After the big conversion to the new generic GPIO chip API, let's further
> refactor the gpio-mmio module by using lock-guards and dropping the -
> now obsolete - "bgpio" prefix.
> 
> 

Applied, thanks!

[1/2] gpio: mmio: use lock guards
      https://git.kernel.org/brgl/linux/c/7e061b462b3d43a1f85519f5aebdc77cbbe648c0
[2/2] gpio: mmio: drop the "bgpio" prefix
      https://git.kernel.org/brgl/linux/c/13172171f5c44df67e8882d983fb50d9b27477ad

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

