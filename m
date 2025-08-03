Return-Path: <linux-gpio+bounces-23976-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F19B194D5
	for <lists+linux-gpio@lfdr.de>; Sun,  3 Aug 2025 21:05:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F0C417185B
	for <lists+linux-gpio@lfdr.de>; Sun,  3 Aug 2025 19:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A84B1E47AD;
	Sun,  3 Aug 2025 19:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Q1P2gAsy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1451A23A0
	for <linux-gpio@vger.kernel.org>; Sun,  3 Aug 2025 19:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754247936; cv=none; b=nrEB9ke+9BGmyerVaAJ2frFpijaCZrEevXLopaZAnS5VJtco9ALxkiuV1uv7Wg4OK9naARzS7s7NnAb9Y3HyHjF+DgafI54E3lWu/2Dm7JsLs6Xx3RUJ8aNy35mkaD3/wcMs9OuIjBGPnRstKi2GRhL3NajQUJ6nvsl66JCO/5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754247936; c=relaxed/simple;
	bh=PMyIylZMNl7hOmJVaTu9fUoxGlBy9SQAK3UVNLWLrls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NN/vyJhycdajwkVM4DvT0kgE9M8VnbIvZxELr7eco/9C1vIov0mBsV4mdCaL8y7gfYkkYXc+SjRBuoljaRoAPMXJaEeeEnifJOQyg/iT3ikNinaZRW1tUyUgH4g3XZ3CKY0TqxPrEM3bF6QTeY4b7q7N4tvUdiBny9lc+/84AT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Q1P2gAsy; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-459d7726ee6so2759445e9.2
        for <linux-gpio@vger.kernel.org>; Sun, 03 Aug 2025 12:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754247933; x=1754852733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ue6yILCiUSW0isjVw7pYnke0QhJ7+S+qitF1Pphk5Z4=;
        b=Q1P2gAsy7L8Z5AZ36R7leLaTYaOfvPuLe0IxqKBoCRfPpeDv47zTqHcFLFwEPG/B2Y
         J5FElgUY42ClHZ4bCZcCUfqg1je0JvT65ZuVUSFMO8Du+qdRTFlfubTGO+wLbVh3EYuh
         7TjoavOWf0NBe6DOsyGh6ATmD2AOgSMi/F94EZEvjbxV/WbjaAqy+nC65AZ/Q0YSOUgj
         6x0A8Qs6ErpDFH48ec6MwLprh1P1AVICMzIo71ccsp8qRJWySNEc4Wf+XSB9rrI6cAhQ
         S7/a6gx77YjW6sAXUsmFfWli83NsQbHIcHtxvo7MouOU9UikVE80q2eprAlN93tuLsTx
         mhPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754247933; x=1754852733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ue6yILCiUSW0isjVw7pYnke0QhJ7+S+qitF1Pphk5Z4=;
        b=hUx9BeOtFdk7tPGVSlUNeWrDaMlLpeeDFTrXOhwSqhKW44EanuUNP1iRy3H9ynW/FQ
         H6O9MtINiTTwa4MCq7Brh3atlft2yjDRi5W7MhchZbZ9wduWqb+fzhA1dNF1qdffzBRX
         bRJi0YEf2ovDjwPlaIttlXrlAuOlqiIR+Qd/1JWzUXT7wugdk9H6kjXSgS49fTN5wNwo
         DIVRVR3vCc8SSMH4fFk5dmSiaxVr0UJD4q0vQLVzGLVTB+xbiSdeW77ffublsyUI5Z9B
         nT1s6Lho6NVDA6c/LUUDD0D8d0wwf9GRrw3EMmAmu9Pexj0Wx2RwsNQH1krlse46icz4
         i/ag==
X-Forwarded-Encrypted: i=1; AJvYcCUN3pIf7gZ/LHlPwqRme1E2F/QKYKk6Fj8eSZmD9/M8/EfaonyVJCLXQKED+DmQ2U9rP99z9G2FemKi@vger.kernel.org
X-Gm-Message-State: AOJu0YyzMYHNdJUCDu4gOuUSF2nJ/qpvBDWrsxxApGkRgNQ4v183lqX4
	2vHB1hIH/TPmfiyqsMnGJLmqBnGUePsUV5JcUUqFYjVkF3sa8pzBihUvaxz9NduzQG3A2lYoObm
	F9C9D
X-Gm-Gg: ASbGnctl7m8wRw4FRNq8VYs0CJrmDEAqcTxAV//d5ED+DjWc5EweRK6ov7lhH1O+ZLY
	x7yL8rR/ayRaW0Fqcm/ylT6pvWNmJf1nJqh2IZJ6QP7ZxA12JVKE0/n5ENUcmd7nU/aEWrpD8t6
	gD2aX0x8K208BY2SXWlbuLWJ+gujxmtsleHoqOFhpgtGE+LRhVX2u6MUL32iKsklt7JOpxu7ach
	39cDFOD796dl7mUp8PyGnv8gQV9YmkLVwAIGvCcAxOKHKpZ8+edUS20VIjG+xwYEQ384iBZjTTG
	nVZFhTgtT57NHT5wik1d8/tUTV1Ja48/6Zir6Hf5b24Asa1SbesA0eBCw+rFHwANsuIGI148Lx/
	w5ni8O+y0Nx8LTV+3YMMxoMNPpLL+0IjuTAIKdmY/M5Llj4EL8yYHZL95jSKxc1AgwGGwImsQQy
	2vBrNjYQ==
X-Google-Smtp-Source: AGHT+IFIHB5mM0/8HsYQwqU57U0GSbxPiC90f1GhhyqIwsvDX5hPAvaS1dkEc5zopKvLYYmIQx2Jkg==
X-Received: by 2002:a05:600c:a43:b0:456:173c:8a53 with SMTP id 5b1f17b1804b1-458b69c8300mr56997445e9.2.1754247932932;
        Sun, 03 Aug 2025 12:05:32 -0700 (PDT)
Received: from brgl-pocket.. (2a02-8440-f501-a968-a175-e139-72e5-a366.rev.sfr.net. [2a02:8440:f501:a968:a175:e139:72e5:a366])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c4534b3sm12948486f8f.47.2025.08.03.12.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 12:05:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Robert Jarzmik <robert.jarzmik@free.fr>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Duje=20Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Subject: Re: [PATCH] Revert "gpio: pxa: Make irq_chip immutable"
Date: Sun,  3 Aug 2025 21:05:25 +0200
Message-ID: <175424788064.7115.2655491563046401147.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250801071858.7554-1-brgl@bgdev.pl>
References: <20250801071858.7554-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 01 Aug 2025 09:18:58 +0200, Bartosz Golaszewski wrote:
> This reverts commit 20117cf426b6 ("gpio: pxa: Make irq_chip immutableas")
> as it caused a regression on samsung coreprimevelte and we've not been
> able to fix it so far.
> 
> 

Applied, thanks!

[1/1] Revert "gpio: pxa: Make irq_chip immutable"
      https://git.kernel.org/brgl/linux/c/b644c640923b625340c603cdb8d8f456406eb4de

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

