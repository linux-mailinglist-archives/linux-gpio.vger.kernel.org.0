Return-Path: <linux-gpio+bounces-8037-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C08D927089
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2024 09:27:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D86781F2503E
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2024 07:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3A7F1A0B11;
	Thu,  4 Jul 2024 07:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2Lu453Lh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807B11A0AEF
	for <linux-gpio@vger.kernel.org>; Thu,  4 Jul 2024 07:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720078012; cv=none; b=c+KaYaJKjTC7TUdhuRz7U+WSOhyxWJUAh80MvZvDdibwWcHCdhTs2gPPRDAb5rMG0uImXPpIwq/oImNqgh/h1sdvq+eOzjayKZQ4SbgfD9MXovm6M9dPBkLNIXfFOYn8GLWVJUj39Y/ATLq01kmz2Q8+Bo+rjG85uimFFBvlfdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720078012; c=relaxed/simple;
	bh=L8hkyB4iq65moVh8U5U7Hfk6dfkNNxJvfiIGb/94R90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qYgKBPTD1h5sBIPrCG0ilb7FZioQdFrbGRNvT/he8h5KlaFYxdPhhysxoGOlUVw6aHqcTvvbeMK05ljX00xWUjqBcVO8ICubsbP7VPAnC8MMpgXaUEtSZTyq7JhNl4KBnY4Vqkvp/TwPF1bqsxI0/Q30K6B/3ja1ZbyYS8XEI3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2Lu453Lh; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2eaae2a6dc1so4025191fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jul 2024 00:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720078008; x=1720682808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bsJ3JP2U+OMM/MC5OxeS7nWjCli9SHs/T5AYnnnofFs=;
        b=2Lu453LhX8tlBqdkBiPL41xUn8xJr/ahPXpCbMscyyoUIPvr/23p848shOO9ZIBI4O
         3wPThp90WVlN6hRNCjHkm2iHSsQtL86TKMmomfiI2rb/3NpYaugDnIzoHif6xr223nmo
         FMYIBpMtcKz4gr8MV0MpuMfxYh8iaLBsIG1rJrwVhF6XMHWBzEZgbSJNyEQacBk0ZfjF
         KodbD5RJYrjMiuwGLW5IjIbTW4IcHLMjh+peMTdrc5XZSW3HueeqYwJRsJ7S6ZiW7rhC
         6kzHZ9VAw21vZIBYVM9bbcA7DnZvCE3WnCn4GiMhBEHr6vSMTxhHXCuRX611LOGA2ol6
         K6CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720078008; x=1720682808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bsJ3JP2U+OMM/MC5OxeS7nWjCli9SHs/T5AYnnnofFs=;
        b=GA5W7Bet66t3eXybmB6cAODf4te3NqmI1KqmIBemmpIAUcT6rlaer4idJpkk2Bp9/1
         Am73ClBfRGpARpWJL0rFc2+wxie+z/AWr4buGzq5tVfVAXJ0L60qxOhe1tKtedaJE/Eu
         DMVHONlk1pkaUbob/kJZx5OYss7sBC0x3tzElEzV4irBnTWPV1sY5fFUu/liacww/XU+
         q0r57dvDW8lOfyztbDkCtRnL2shEUJ1FZmc1zUMn1rEN7ZFl6L2Z9RbjKwx5z/PpMj9g
         YyC9AJLNJNCjaP0caN4xA1GNxNlTndSaGZistyAo/6xyysYYmX+hnOJO1Vh86Qjm/4xM
         slVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRZu48M2iTCxdFZylpRPYVqAI/HU2sBTrLpLdwhMe8+Zmwzp+EdfoqDm7YlOmsf31ASi80mvY1D2tb8eDRde7fY4tpI5uuToIoBw==
X-Gm-Message-State: AOJu0YweGdpefyNmT1ohJgw7P7csREtCXTRsaW1un4a0/Uh58R/EzLC2
	fpfPCH550VmVVnloqNfh3woUzdpSNLinZPBzPrm5+cobY6XmkfbRlgMy/r6c4z8=
X-Google-Smtp-Source: AGHT+IHeGvVYJNwlBwjEX5i7a2A260SiDaXGmU3EXhosJ9vXx/nTVNGkGZ/0ynYeTH7A1+UC/bIZew==
X-Received: by 2002:a2e:7e07:0:b0:2ee:4cd8:94b6 with SMTP id 38308e7fff4ca-2ee8ed90e17mr5781751fa.15.1720078008358;
        Thu, 04 Jul 2024 00:26:48 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:a7bc:91b4:6b09:23cc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264879e491sm10112775e9.0.2024.07.04.00.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 00:26:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] gpio: sim: lock simulated GPIOs as interrupts
Date: Thu,  4 Jul 2024 09:26:46 +0200
Message-ID: <172007800287.6156.4204655048215569328.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240624093934.17089-1-brgl@bgdev.pl>
References: <20240624093934.17089-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 24 Jun 2024 11:39:31 +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> I realized that the gpio-sim module doesn't lock the GPIOs as interrupts
> when they are requested from the irq_sim. This leads to users being able
> to change the direction of GPIOs that should remain as inputs to output.
> This series extends the irq_sim interface and allows users to supply
> callbacks that will be executed to inform users about interrupts being
> requested and released so that they can act accordingly. The gpio-sim is
> made to use this new API and lock GPIOs as interrupts when needed.
> 
> [...]

Applied, thanks!

[1/2] genirq/irq_sim: add an extended irq_sim initializer
      commit: 011f583781fa46699f1d4c4e9c39ad68f05ced2d
[2/2] gpio: sim: lock GPIOs as interrupts when they are requested
      commit: 9d9c1796a6ae70290c2e013fe4d79e99039a1015

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

