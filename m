Return-Path: <linux-gpio+bounces-11996-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C04CA9AF053
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 21:04:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 695EDB224BE
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 19:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D215F2170D1;
	Thu, 24 Oct 2024 19:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cbUhuSnP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50957216A25
	for <linux-gpio@vger.kernel.org>; Thu, 24 Oct 2024 19:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729796662; cv=none; b=KNEZR0snSnscoIIS8OeNX12fne+IdEl8a06ETAMmKfROJIBpuixX87okOytxuf2El+Y7aWOulDaA1NdCAVH61ya+/dnUXZrpXt/nXf9zZjPQRYNQZH+wLbli7RW2nkoDzT3nEYv7jZKGiHVTG87Go72SZELubGoiWAYtmYPPgI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729796662; c=relaxed/simple;
	bh=2J2Yj2NOa6oOjGZM73x/zLQanFb8Ii+YDrcmRuwRtSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SFv/kRhyePIY+IjW0gJ/sF4p7frKLWJWKddmROm0vAmIJa/frfo98CmbFO/WtY/QSldhNt246CKYxnllusGhlZWO97QNXtPygTlfbdyje1IrWgKih7gh9R6DlgkUCrIUs8oDVG4AVFcxociytz3A36AKVyacwOS6QzKFNSOc3LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cbUhuSnP; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4315baa51d8so13101545e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 24 Oct 2024 12:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729796658; x=1730401458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NLJF3aIecRErbpZ2bVrOXhmtA0VmB7KUrZ7YjkGYIig=;
        b=cbUhuSnPYxmlh325/woMdLZQ6a0vW437+BTWhgJ64YNki3RZzP8MTpR2y5wU0Orzk2
         uAExq3EnJtpmZN7ltePfScGj+14iS6Ua3odsmPvWJpjuELGhmXWNgQ8WtmVFuq0Gr+b3
         k5zcDg9Bjasi04pH9P9oXmy7e6+KtItRf/OfGfNFAtPZYvYgL2RTvX5Tg7LWDLGXGkPw
         Rw0pxHQucrDlolC+a7Hi4ofthJB5XiEc+pMX4kLPr0rmO7zIW8l9cDiXw75ox3L8DQgL
         eaXHVGmXsZS/lzkDinvSLaTtIjcmNnmSp8MxAw0JDt019HHIgrG5cOzdB5svRYCg2wXI
         divA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729796658; x=1730401458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NLJF3aIecRErbpZ2bVrOXhmtA0VmB7KUrZ7YjkGYIig=;
        b=Rvfo6rn5vOCSzuCIQ5cE8d2Rnp7WhGFeKhmQUfF3E9oxMaUFKXKwjcU9Et+ipM6Nef
         KBX41oiuOWkzzdfSVV7mG4Yv3TML6qCOrekbG64F8mJtsO6IwMFxnV0wPwhpCpoIGYK2
         AGOpYYoBR38cMp/4HawFHNV2kG8WXw11f5Rv4lIbpgBGp9SyvegCaAVxC963tRgT9EGz
         xXmjVSw34juv5BjhooqvtI2XPh0gOL++XZNESvVGheryYazwKP/qhHIUOU42n3o11DXk
         LnXWvKuLfQ/Rrg25KxEecYXVwvvbpYyn/iHNIVVj8xBsLaLf/60g6RYcJqtQ8unpN3tc
         nstg==
X-Forwarded-Encrypted: i=1; AJvYcCVqh+Y8xP94O6ThuoLgR4cwYRtCpDZGegMNsJl0EuaBOas57VG/c081DmUZPEGQoSwif52xc1fFkutr@vger.kernel.org
X-Gm-Message-State: AOJu0YwgLGqQjFDiACWKDBFIo5/jMLF4oCVXOMR0DTDweVLGaNNJ6uij
	o7lLmDP5HzPWub3q7NUENPE6MHk+BezQnQaBSKV6FwOOFJ8ji14sAz240KB6aWE=
X-Google-Smtp-Source: AGHT+IFCnaX/c0lMd0V6SDI/A27X0TVS9VKiXa7YuZhYWoUQgwhnSkjLqX2ryTpdgF1x9ooXB5PuZg==
X-Received: by 2002:a05:600c:45cb:b0:42f:8515:e490 with SMTP id 5b1f17b1804b1-431841341e2mr60270955e9.5.1729796658245;
        Thu, 24 Oct 2024 12:04:18 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:17a2:e679:56a4:a25a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b567838sm27112365e9.23.2024.10.24.12.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 12:04:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Klara Modin <klarasmodin@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: fix a NULL-pointer dereference when setting direction
Date: Thu, 24 Oct 2024 21:04:14 +0200
Message-ID: <172979664791.66034.4461804157130165429.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241024133834.47395-1-brgl@bgdev.pl>
References: <20241024133834.47395-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 24 Oct 2024 15:38:34 +0200, Bartosz Golaszewski wrote:
> For optional GPIOs we may pass NULL to gpiod_direction_(input|output)().
> With the call to the notifier chain added by commit 07c61d4da43f
> ("gpiolib: notify user-space about in-kernel line state changes") we
> will now dereference a NULL pointer in this case. The reason for that is
> the fact that the expansion of the VALIDATE_DESC() macro (which returns
> 0 for NULL descriptors) was moved into the nonotify variants of the
> direction setters.
> 
> [...]

Applied, thanks!

[1/1] gpiolib: fix a NULL-pointer dereference when setting direction
      commit: 1f4a640e9ac7f450752365541ad9c064b13ef8bf

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

