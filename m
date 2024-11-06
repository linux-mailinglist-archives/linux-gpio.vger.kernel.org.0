Return-Path: <linux-gpio+bounces-12631-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9105D9BEF41
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 14:40:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42D361F23E9A
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 13:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEDF01F9ABF;
	Wed,  6 Nov 2024 13:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="KoKOi8vU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE85A1F80C4
	for <linux-gpio@vger.kernel.org>; Wed,  6 Nov 2024 13:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730900430; cv=none; b=khmg5vUJD+xna+JlyOLRfC54dq6SVOmaIpdecyKCIoZ5wlXIWDsBG/DXp6ndf/pcaoENIQ/xeeNfvV8EeU0SmGjevqsLv4W/ddbfiWEVDIc7mzojipte8p9L/A4fQhFw8YEyifb2z+T7hEgXmKeyL7Mz8dAcFLQp3hhPmtvCfxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730900430; c=relaxed/simple;
	bh=TY6HkgkZqxXgV+nGGJTpffFzpW6hatvBAFjnEtIdyuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DmfpK1+cyjJnhMvIjIASU5GVH7CiAMRZgBNGDiLY+xFaE/sWufOdq64eRLXpxMZ+h/WCODPfEBim6r+d+3TXJuTvbN78TyVw5OWus3JZs74WlhR5kL8ACX4x24anu8406Iyh3ZMLTHufGDQhmoZRdhL/ghcumOLRf3YXHQO+YQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=KoKOi8vU; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4316cce103dso78524395e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 06 Nov 2024 05:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730900426; x=1731505226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jqPYiyDoOvhKZalnLQaBAtOB1rfcZRv4WnzG8o35tOU=;
        b=KoKOi8vUEOnnAdyWYBlmZm//znCskB3VfK2SrNdqlSkUbd5lsLiVwHYn5FVMuxXJYV
         2F1ivYUP6t56Vt48VvjzlqHPDCOkDP8sSyhvdgKNxSvebeooYYFzeS/d1OEKoKwbN1VS
         Q6sC5Ic8znNUMYkfoLtK9KZ4YzOn5Q6BUkAw1gGKm2/+9oqQxZFu6NvdbLMGKK4uf+NR
         SL9qnb4nUv9+kiZGTGJbEDgaWlVK1cHrydYbHivdBR7LNQyYFkClRY2AH7D6yB0EXGTu
         +NGysYF/cA3nSYzkctBRBO5gGiQBXPdQ3B+HP/KBJbQL1q6+zjyGf89vSWRmCOZsbO8B
         eUKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730900426; x=1731505226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jqPYiyDoOvhKZalnLQaBAtOB1rfcZRv4WnzG8o35tOU=;
        b=lCCe8Z6Kas6LRHwmxzupz8TDEU47A2sRKyrXjtAqlsIkyqeRepKctPPoZerwTE1gCd
         CPMAn/mw5JdB1ocYeThGrOMWGhY/24XMs9pYHrGmcwt13e5nV6idc+fbItA6HqIC/9cL
         ibpkkiiIacp3Bc0iF9h5kVclssyUnT2aUex2ZwXVD9lT7dAzI/JwwPkR8PROu9EQGd7R
         urVcwgm2yy1ALkwA8pxp4pKTlKzS0Zv3Ov1rVI7OiLgoHaa8DQzzBr8qRpc9UhGXhKx+
         o4roXqpNQG2Ly3jdquPgGBNvr9nbvreN2yULRnGdWT2MVMYuBRCkwKeKBYX3uusOUgjH
         +IdQ==
X-Gm-Message-State: AOJu0YzxToDPcvYXxBUNAj8mLb7RRI+THnYm3Echw1Y5eIXU2HuE9EL3
	vfjuRafOTdU39n4SalA3VlGRIa5GeyY3TKklrIrVHSxBLYR2MON3JYqap62vpfPhrtT2zATdY/m
	26QU=
X-Google-Smtp-Source: AGHT+IEYjdx6iAaqgVMiv5qoZ98C5wKI6iabbiQwECB/JgvndP9gCYZQtd2hOjlFtkFX6XlvcoaCpQ==
X-Received: by 2002:a05:600c:4f03:b0:431:4847:47c0 with SMTP id 5b1f17b1804b1-43283242c79mr198800285e9.7.1730900425621;
        Wed, 06 Nov 2024 05:40:25 -0800 (PST)
Received: from brgl-uxlite.. ([154.14.63.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa5b5e56sm24151925e9.2.2024.11.06.05.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 05:40:25 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	Conor Dooley <conor@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	valentina.fernandezalanis@microchip.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v10 0/1] Polarfire SoC GPIO support
Date: Wed,  6 Nov 2024 14:40:23 +0100
Message-ID: <173090042035.17337.9744666038236867720.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241104-obtain-grandly-1daad5ac36b9@spud>
References: <20241104-obtain-grandly-1daad5ac36b9@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 04 Nov 2024 09:49:32 +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Hey all,
> 
> Lewis is no longer at Microchip, so I've taken over the GPIO controller
> patchset that he had been working on prior to that:
> https://lore.kernel.org/linux-gpio/20220815120834.1562544-1-lewis.hanly@microchip.com/
> 
> [...]

Applied, thanks!

[1/1] gpio: mpfs: add polarfire soc gpio support
      commit: a987b78f3615e20c9cf9a85e38505bdcb7f19495

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

