Return-Path: <linux-gpio+bounces-6931-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2B28D4877
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 11:29:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9EC52B2521E
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 09:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C68296F315;
	Thu, 30 May 2024 09:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="i6ouBkYa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D356F2FF
	for <linux-gpio@vger.kernel.org>; Thu, 30 May 2024 09:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717061369; cv=none; b=DUNhcroReWVd+n34/fi5dWL6K0+MpFtIDNSvrgO6R3kTd1ZJzgpM5+YWRF6LUeg5jSFr7k4ca1r3uQNwE5PTOtbo3H3yylaJZZtKmmzYpci2WfMZKGw0avcoSq0sGE9F557X8cLaqecpLLQ5PvQJpf5UU/HizM4fIGt3A8nJ6YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717061369; c=relaxed/simple;
	bh=Mzwpc9HSOPfDS9J1k9xeAWmoD+azW6P9PFcyGQzLf1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BqTTFfS+ibRr6R3Ff8EAf19W111KAlqzWakWV4a7weU/Y3ZCvNIfa5RvFry67+IS412alSBmUwFFzEUomjuQ/TMbU27A0Fw1VfSvnkAj9+gP/JCm+PaRNJki/WJYJsh9gYimDnQOQvhSg72B1yoS6+kV/jVPcS/6LpUctUeWRws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=i6ouBkYa; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-421208c97a2so7151435e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 30 May 2024 02:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717061366; x=1717666166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ma+zkUDMFmRGmAdFFiltA3V8CcE1ips8EycBhVAAsJk=;
        b=i6ouBkYaspgGtfIfk9V8EzysRUqBkF7Tze4Ln7E81PyZ2euksDTMy7lgltvNfT76S4
         LSYhCEllVMqjhOC5QKGRNLcb9rur5xEBaU7xXYiuzm1Jm0YSpqivutwqu65/gYm2koM9
         pIlmvJ0ekR+jwEuj1SHCjZkLmZM5MFiDLizJtRcB6hU27+HX6ZwHA4xumMy0WfjEAeNk
         i80zmMnmEwZg1e7mesbDXWW2aTIea8AKujRMn8KjeMuhUaH+y701PqkKDaZ5geo/huiN
         FP8EHkMighRauxgEZqLYP5uAg3wa9uSdO3NhLKrFsunfWWvNmVqnSjH/WIdAbnJOr6Ii
         r7+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717061366; x=1717666166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ma+zkUDMFmRGmAdFFiltA3V8CcE1ips8EycBhVAAsJk=;
        b=szuwk9wvALWetdyL+EWvE5nUwh2FOdqYGvSxSyQtDpQAfr+P/GH8gU2mwfpCOEqgGm
         Ut/d50b67zG5H4PCDfjd5bsedoT7WFdcDUSKqOsszLhlcpIx8rmrIJBqs9T6OzBnwGDy
         bZz9CCyg+hafSkFYnkIAQoh3bM/RY0J0jCiDotEmJdCtk4ELAqWfVOIJZFo0FMrcc7xJ
         0jwxBjrYSMFsDlsFL+kOuBabyZPo6CYqjTnHSeNUCHXZZtfUHg4IjQdGLHEjCJaSaqeG
         mp5eW5LCXW99mjxS81RL4dUrZySw04fz46DGqaM1n512mMgrEPzDwUWTzsBDhE7FthKB
         DOhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFfVb37D+UUcSeJ8psa9Y4Qq8wyGPx+3Ahi5Y142AvCIF2pv6Ym1gQbFhh6qKJ8jpBitsj+12F0FKiFyFPEHzPWHVkkqDBFfgtfQ==
X-Gm-Message-State: AOJu0YwG5UsEtBZEI2Y4n+IBTY4kVKasKAheFhjqf42s0eVpXRvzKo8w
	yNt4bs0ZLCB6DCjetpxSOQmm4D96gYpH8qFr4RRLaLExI+2e4k+YYrqg5wIrlcw=
X-Google-Smtp-Source: AGHT+IF/nthLELANpgmLRmO6xyVsD7IA/WH2LIwNU2QgfY56qcIKeDpZWXMGEctQ+ahsgnu6FOq7dA==
X-Received: by 2002:a05:600c:45c4:b0:421:c8a:424e with SMTP id 5b1f17b1804b1-4212781ac4emr19165455e9.10.1717061366464;
        Thu, 30 May 2024 02:29:26 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:aae:8a32:91fa:6bf5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42127059901sm19369075e9.3.2024.05.30.02.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 02:29:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	brgl@bgdev.pl,
	linus.walleij@linaro.org,
	Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 0/3] gpiolib: cdev: tidy up kfifo handling
Date: Thu, 30 May 2024 11:29:25 +0200
Message-ID: <171706136138.33273.12296733431611345251.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240529131953.195777-1-warthog618@gmail.com>
References: <20240529131953.195777-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 29 May 2024 21:19:50 +0800, Kent Gibson wrote:
> This series is a follow up to my recent kfifo initialisation fix[1].
> 
> Patch 1 adds calling INIT_KFIFO() on the event kfifo in order to induce
> an oops if the kfifo is accessed prior to being allocated.  Not calling
> INIT_KFIFO() could be considered an abuse of the kfifo API. I don't
> recall, but it is possible that it was not being called as we also make
> use of kfifo_initialized(), and the assumption was that it would return
> true after the INIT_KFIFO() call. In fact it only returns true once
> the kfifo has been allocated.
> 
> [...]

Applied, thanks!

[1/3] gpiolib: cdev: Add INIT_KFIFO() for linereq events
      commit: 35d848e7a1cbba2649ed98cf58e0cdc7ee560c7a
[2/3] gpiolib: cdev: Refactor allocation of linereq events kfifo
      commit: 4ce5ca654a761462a222164e96b8ab953b8cacab
[3/3] gpiolib: cdev: Cleanup kfifo_out() error handling
      commit: 2ba4746b418dcffadb3b135657fea8d3e62b4c30

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

