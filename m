Return-Path: <linux-gpio+bounces-11280-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E610699C35E
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 10:32:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA4EC2835A2
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 08:32:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85DB31531F9;
	Mon, 14 Oct 2024 08:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="g9u/1aeT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D480614B946
	for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2024 08:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728894708; cv=none; b=BamCSPoLUT3zcA4mKI4D2pbL2nZWp8lXkvR40ynrWCcV3C+aDa9J2k233VPcUl6nsdPEhIpNNYDfbknjF8fsSq8ym81J0oj/B4Ka3ArQHH3jJ4PAtzxUyYJwRz9P8XQMQkyhE6b7btvhR58B4vUqCBkQd0K3p0DP6/obosFmicg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728894708; c=relaxed/simple;
	bh=gmWuCVngXdsFXb2tCMrklsahOitu2AkKO6bcxumDxTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tOuOEBoYvmTXA5TwEK4+6uYfvc0tmMhGBAlGwmrIswDNQ3MTXvihallGKtq9bSDmFfcRUv0m9rn8ZaBEY5AJNgtUPY9Totd+zOeB7i4UYswFIrlq4hM2HGDLbTKKAAHMdhfTHNm6UuU/1hDWfkVXV4PEHIOpCrFXnVVb9i4d4ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=g9u/1aeT; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4311d972e3eso20821505e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2024 01:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728894705; x=1729499505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v2aUenQHtDR4d3im3kX4S2ns02KTZQwh5qzY3YgiWBY=;
        b=g9u/1aeTUqMYbDGTvsHDQH3407XRnf9vJvFYtYwKmX7Wxs6lxTVrHrl66lSCRgqY31
         wpLx9vaDTiIH1q3lqVrFKUWyTJe9KlFNEf5yWJlg+nwYh5woW51VdcOOTp1nV+WALNuG
         66mV/dxeBR6KHwevjvDD12U5lUzsn9T7J6JQ4CKUzEL3N8z8HMFiOqHNLebAXcK4Uchi
         aT2zvQTNZPgg/VZCnRPEqrghHdSQpLCAesFoH6hUyGYyMZaI8qewICIVVKr/A6FLPhFj
         MV3dgFrdgROrSgCGC5c3YyHtEHPPMdaTIt7sPh8aXMaVN5ULITb8sA90+rqEAIN7QalR
         ciJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728894705; x=1729499505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v2aUenQHtDR4d3im3kX4S2ns02KTZQwh5qzY3YgiWBY=;
        b=eXkzm5PXB/bNPQjzjAuy34O8VHE7/+ZTZvNlMmLA0q1RaKirac/1BkzqEHDXqCt1ZX
         u8Rzp9c95iXQpBSxtTmnK4gnVP1cAtyBqb8I1VROWhr/B5pEfKYHY6qEuVimZZ3PwCVm
         m9G5Y72urbATIcMu67AZK0DlXlhWXPgVY7xGtHYdV+fL89pGshGrDejaR2Btr1SB4Ow0
         nhSfPHFQ7CxtiMjfOK7soQ5ZVlRHN07/Vvyf1Zg1NvncTkXJYGEY/8BgH8OuqtLPVfAZ
         fXnFZYsQAeTBESxY4I2Fh8jeHzeuzfK4tIBA62SH5nbboSG+E7OSSnc9Sowx0tGQHvsH
         08Tw==
X-Forwarded-Encrypted: i=1; AJvYcCWSa+chJTHi29F1EyqrPUqDCHtrbKZNIrTOfUMD06oO5CI2EuYi99NLP3vb84WjxAIJ9Q/WD+Yaf/dq@vger.kernel.org
X-Gm-Message-State: AOJu0YwdlmUcTRrSmpNUBv6i0JO2YtvCx3Z8x97KeG49mbKP1HvpUQvQ
	p6mZANKE09N4XkLi16h+IRslgLVlsK7kOFHPScxZai/AoHLd4YzsZGV6NbWs1dTJIJV8x7FIq+/
	m
X-Google-Smtp-Source: AGHT+IE0IvkqMtxjmmWnvyKx/nVbv6T1IUy7UMhj+4NYk+B3uzC/VKqBrGEM/7Aqd8RMPLchoDgXNg==
X-Received: by 2002:a05:600c:19d0:b0:428:1b0d:8657 with SMTP id 5b1f17b1804b1-43125609022mr59886525e9.22.1728894705196;
        Mon, 14 Oct 2024 01:31:45 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:de54:ebb2:31be:53a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b7ed69dsm10737698f8f.92.2024.10.14.01.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 01:31:44 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] gpio: mpc8xxx: use a helper variable to store the address of pdev->dev
Date: Mon, 14 Oct 2024 10:31:31 +0200
Message-ID: <172889468798.57095.15268233570021195003.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009162910.33477-1-brgl@bgdev.pl>
References: <20241009162910.33477-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 09 Oct 2024 18:29:09 +0200, Bartosz Golaszewski wrote:
> Instead of repeatedly dereferencing pdev, just store the address of the
> embedded struct device in a local variable and use it instead for
> improved readability.
> 
> While at it: rearrange variable declarations.
> 
> 
> [...]

Applied, thanks!

[1/2] gpio: mpc8xxx: use a helper variable to store the address of pdev->dev
      commit: 2707a028c9b9c54a6dff22c9dcfebf3083ea095e
[2/2] gpio: mpc8xxx: use generic device_is_compatible()
      commit: a937ee6d7eba055226fba300e17ade6f65de6d93

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

