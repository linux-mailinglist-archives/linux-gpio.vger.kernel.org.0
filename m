Return-Path: <linux-gpio+bounces-12985-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA1D9C775F
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 16:37:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3B111F29F96
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 15:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 513A51632DC;
	Wed, 13 Nov 2024 15:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ETZwWDqb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C916F1632C9
	for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2024 15:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731511859; cv=none; b=e62Ov1arD0PILEUqlToGw0t9eu8RFN0zWmF8l6fXV5I3VMzyi9bwBzHI0eyrWoON9pdC3YdMcBCLO3yuUe/Qc4yU+rgt9PXSlu5sqLGuYE+f+sni5av6zmeYnMspB5PbY1r32s55FIAwhmOqdaPfPDI6PeE9A8kASqn0CSR24ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731511859; c=relaxed/simple;
	bh=haEridOgQHCmmtKLPgrZed4sltMc33ZVnB/hDcfhsf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BfL55VFg9vTnNxu5PpE5wiuBLPj6d3aenmPUXxGIo4CcawFXGUYuLwSYZuPmIGLSQqoJFaZDugnvWjnSsp7yQIUodeLeMFIvPlNIrJ7IAT3RA3rlp5autjU3oJiniVXnjyAJ4JLMqMzOjqm0D7PJ4hihkzNHtWSZlY5UEAy78Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ETZwWDqb; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37d49a7207cso4762289f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2024 07:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1731511855; x=1732116655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n5Is3Oh7ydLFl6T+vL0M6CtHoi+ednqbxLHSW9hK3aU=;
        b=ETZwWDqb24MUuuUSC7MFruZgjDSWo/DYFNBvtZr/iE0bV9WAlDgysLACcmSf+DvXL1
         g23xtQSWaPt8T3Xw62YqfHzdzHVXlpUA2phI50orTbxGhz75EscLlFTJtg6srC4LCyK8
         BBJeLkM/7lY9vOwTaOgUgfqklhU1oR3AmDY2Xqehv8VMMYUykGl11Ts45lhoimG78ZGP
         5cST2tzGOGgUqL8YP3rMwjgIpKxWeEnisTH/1vaqqUk9fgYNZ9jwRYCtM/zrmAxl/K+V
         OfCjAVFTTg71gvSWQ13LqM9aMl+gYbP+SP4ruHQyPifXcg65D/aGBGy+QAdZRBcWh74e
         VLQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731511855; x=1732116655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n5Is3Oh7ydLFl6T+vL0M6CtHoi+ednqbxLHSW9hK3aU=;
        b=WZ8wj7cViZ+SF3QFJmDIG7oIlzeqE5QXd/K5MylDydh272YlucyYLadpjlAhvnJxxG
         2boWur/fiwuS707fFB6m80/y11M4TPqzIrBLAwO0bB+/UUh/KZv9/I9YdUrZB3VX2KQJ
         zPgXlW1c1NL+8i5M+QBIaT+0ryaePGhpcllGBFR9e13QuaQhe8Lad8lnK+t2qOb3h9mg
         btFFziPba9zD4+26wjG+GV9R2fbTuiDPgUNmLiAz2IM0ofdL7KWHehRIHwCfOCLS5wvJ
         Nn+qtsERxkjotcxNsY6Z4sbdB1f3NFEaa7Ouz1cA7ilzLA4x4MiQz69sTi4Sxio3CsDw
         34GQ==
X-Gm-Message-State: AOJu0YySvut/z34FAD41E+papByGww7efym0jR+/4oaZI5Z6xJznaVM7
	y1ybkDjfgPwg+vHF8tf/0wMsUGKWn9ITQoGhlA9avCOkSipdTbrnVawZDjgFhw8+fl3aaBOl5xi
	D
X-Google-Smtp-Source: AGHT+IFxiR/WL41z6iEsuMbw3qc6EJEwdN3TZBFGtfwYiY7iyMeJYUsl2YzrRMkMb4yvLW4eiUSS/A==
X-Received: by 2002:a05:6000:2aa:b0:37e:f1ed:67e8 with SMTP id ffacd0b85a97d-381f186dd5cmr16703079f8f.35.1731511854613;
        Wed, 13 Nov 2024 07:30:54 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:1b75:191:f7eb:da75])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed9ea4ebsm18689381f8f.69.2024.11.13.07.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 07:30:53 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	Conor Dooley <conor@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/1] polarfire gpio driver follow-ups
Date: Wed, 13 Nov 2024 16:30:51 +0100
Message-ID: <173151177291.90710.9989301559939159522.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241113-ramble-blaspheme-b303dbf37271@spud>
References: <20241113-ramble-blaspheme-b303dbf37271@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 13 Nov 2024 12:01:03 +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Yo,
> 
> I realised last week, while rebasing the interrupt portion of the
> driver, that coregpio a compatible in the kernel as well as a dts user.
> Given how long the driver has taken to even get partially accepted, I
> waited to get it to gpio/for-next rather than showing up with last
> minute additions to it.
> 
> [...]

Applied, thanks!

[1/1] gpio: mpfs: add CoreGPIO support
      commit: 65e936372d8f56f9faf3879925738cecc0a5f7e7

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

