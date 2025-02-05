Return-Path: <linux-gpio+bounces-15406-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EA4A28BF8
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 14:40:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 583F13A8FE1
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 13:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98AA313B5AE;
	Wed,  5 Feb 2025 13:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tPhjCD1v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B531369A8
	for <linux-gpio@vger.kernel.org>; Wed,  5 Feb 2025 13:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738762804; cv=none; b=tcxIRXg4pCZR4MLUwUzPbBo2o5CVUK5lGTd7IMQvj8w67jWmkd1g1SJj26Ur4Ej1J1+Q9B+l5orOcsyVeooI2BgPveyRW3inphV7EuF92QCZwBHiG7sBASZs0UgZqyLddSqEqLG8QSzict5qIpOdm+JS9UVX/wqNyCs5IboWm2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738762804; c=relaxed/simple;
	bh=PLo9ekNb2mKGhOqPJ5jYEscWQR6GzGgX5mDmmyYgIDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dk1S4L7uuuLnwT3EO2MGS6tEIJvUa/bfRgceSxSN2PyGJJY5QS/BcZHEbtAGvmnl/k9Lg+lXeQacwk6y7PsbJwoeo7t41bva9mFVkQiVzwA/xGbJlfJLe7DMn368T5OlayMC0cgsl98Va2LVWf+2EKS1Ol6dzXgN/Fu+Mu2OSO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tPhjCD1v; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso5462965e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 05 Feb 2025 05:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738762801; x=1739367601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PASFoT5mXyDxz1C4PLJNUKTV2eZ6J8+dyrWeDE9Wios=;
        b=tPhjCD1v5xtcnFBTxS3b1UpfzRUrh2Vupb6ur0F0WPd+EvUjwI6qH7Bv0uOMuoYQW6
         E7IFjr8Spe9rLnzuZM8f56xz2hlPZEF6b8aHZ/KWdR/8+HU4gJcpybEpm+PEfC9UDGZ/
         yMwlpK7DVzZgf8wc8xA/cze+gUAPOPOV4zE1dWcZLUhM/PtapmqtDr+1atdWyAI9OPWo
         vEI0zGx7Wt7ropzn0V30PisdVa4YV284HIQCjhzrdN+R0rjF2pUeLB12SS0I4PcpXCqx
         DO+9aPYsbk69qj5JXa839VhZ0B/S3mFMaySFbQTDiubvqhe8Zmv4x4v377VcUYzLGl3a
         ilQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738762801; x=1739367601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PASFoT5mXyDxz1C4PLJNUKTV2eZ6J8+dyrWeDE9Wios=;
        b=AWb/JQ1rFbUTgL72ZNV3mGcg3PNAFXr0l5KshmBd/aR3HVYz7QKaMGWRLs2OAj9G5i
         N41LDTfGsAHk9L6CuM70ciyhidLBr/FUGi55BZOm+Zzj3W1rQtD2o28rL7sGDwueuSPc
         x4rTWB8Pk7BknTBMRZIwa0L0D8hvAkaHE9fzvbGrVg5Pa3dSMLXTVM8LltjABJiWWsiz
         ODcO4zKUs2KrTQ7lnWnztuI5UJKd3CyCKeQ6kIn5JXnceYfS+tR/FacAll9ScqnWxakX
         TuVSdU7BC4Pyt2ufL8WAyurbYmc7ghiX4J3nTtNA2d8TOVnU95fI1xX5f/ler4aV05ew
         YkRw==
X-Forwarded-Encrypted: i=1; AJvYcCWd9ioJkRARheZoBX3XKRZTRHTXycowMvI2+A3b72Y5YDXbgfTRY0cNxaki4ED2KptKQw5cJHjVjBip@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3QGaSy94G27zIHFVq/kCrlGSX6UfVA3sRBYmvXFm3+YS0gbPT
	zZZwjKEXpn5s57lV5+HRhfvZnjCS15IOp3gz5eODJAKVmQ3ScxtF4v8ZalshyME=
X-Gm-Gg: ASbGncs04srdqplhboUuQG2lJv9jgsEhh3EeU2DPnnMXkFIad/CKAeMQm9Mh6zmNMWu
	8CxN7HxVSKYy96bASvmsFTJZNLQkdl7Bpt4qxJtTgOIzJif2DqZYEH/Mxe8LyVEDCqAQWHraz2V
	SNqLO3P4nuNAq8NM8D09vd5DT2JKU2rq5fQifOkNmatoGCNc7PPTclwIx3M12UiWqTIFXcneJ/A
	gBc2QqmHKyrQUJO9r/xjtquY2tfzAA311xiIW+rjNY/PJlk9szlouVxxhScYKW4kUDgc+YDGI2e
	NXEBR92pXAPGick=
X-Google-Smtp-Source: AGHT+IFq5CZt4RefqVhDnLXc5QwlgFsHEvvq6JuF5fgkAmxF3evmOI2s0at43EjpigaLCtH9U/Rjww==
X-Received: by 2002:a05:600c:4693:b0:434:ffb2:f9cf with SMTP id 5b1f17b1804b1-4390cfbda73mr22108905e9.14.1738762800604;
        Wed, 05 Feb 2025 05:40:00 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3239:b668:f15e:fed8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d93369fsm21974185e9.3.2025.02.05.05.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 05:40:00 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Koichiro Den <koichiro.den@canonical.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: sim: lock hog configfs items if present
Date: Wed,  5 Feb 2025 14:39:56 +0100
Message-ID: <173876277706.18360.299205391890654246.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203110123.87701-1-brgl@bgdev.pl>
References: <20250203110123.87701-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 03 Feb 2025 12:01:23 +0100, Bartosz Golaszewski wrote:
> Depending on the user config, the leaf entry may be the hog directory,
> not line. Check it and lock the correct item.
> 
> 

Applied, thanks!

[1/1] gpio: sim: lock hog configfs items if present
      commit: 015b7dae084fa95465ff89f6cbf15fe49906a370

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

