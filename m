Return-Path: <linux-gpio+bounces-18972-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 948A4A90822
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 17:57:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17E124438CD
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 15:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85B602080D5;
	Wed, 16 Apr 2025 15:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="O2KWPbQE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E773420F087
	for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 15:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744818998; cv=none; b=T00GxzO/H+juuXf0l7b55sGI3yFpw/k8kqRoDfDF/sTqO23vzatEGE9JjBMv2B6WMV4mt/sFVelIHG3oMPK/qpea+M8E6owMocFVbmzpM4ghZtr3ytgctj2MoWUzZr4NdZNABWtzu6BLhE+MUTKahVSOzk1ImgRSMjH/LGYInPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744818998; c=relaxed/simple;
	bh=D2U3pMjx1HkB0gYSri34kJrZX7WrXhn6TRocmrlyD7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CeVBaDKQqXJObmVypHd/f3tTOchPaG+z4ZSwAja31YWdr6pTahl2ASN0fb8hOfUOv/pH3FXv6lhz1SePGnJwmIbQkmcp1saaNz2DgxkoGOVqeOXM0dsC/hRH3LIezYdCFrBIjWMo70XS7nlsYcnh8DULM6GNHonPzSFtkSLC/ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=O2KWPbQE; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso4088295f8f.2
        for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 08:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744818994; x=1745423794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W/pQ4LEvtXREXkFPD7yKVlDcfVBD2jRYp4fpUeLGjxw=;
        b=O2KWPbQEOczyJgMpJ/wd0/mkecDqVNde7paqKn9fRJdvZ2QqK86w6lTxtwVtTLgbd/
         RXt+O/9RI62LGH+LLQcd90nlFtOYNMdOel01bzXAanrArpyah7Yo7wRdMma2YECz3T1X
         sJL1wiq/bV+5KE+CC+V7Z05ih9F3vI/yJ5YecKMPFCZ2OwyJRv+EqVS4IPKIkJDBExqk
         UufwndHipLB4oomGDTwqynpxHTqGPH4RoxHkmFKKccb0QalNitpnnf3JVNaF+5q228t4
         SWc/V9dzpl1tx7Hax4mNw0tgzh5TVF/XZAaoimyU3UfipyoXn8UwQmOa7ugEtxb64TqH
         QUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744818994; x=1745423794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W/pQ4LEvtXREXkFPD7yKVlDcfVBD2jRYp4fpUeLGjxw=;
        b=N/xz+NR4Fsd0m+2wugqpziQsolfMHMxICCP/PUPgTjFl8zkZ6VJvt26f9HgtHG6hZh
         m/a/6EaMhX2QFue7PE7DMQPe5Gpj6D11GYFWy0ykAk1BreMAjZv4cpd6JIhF6nP24jIQ
         r/0Sz70iCSu3oloB8Z70S+MWvykUzeIW5s1Omb1SMjVc04M6HNCdnYBCs1r1/9er+yE8
         m4W5Lg6us1Gxs9F2IuGHk3UqkBQ+j9VrCIdzvYBrtEbXhVvt0QRituSBQbibpR/kKfY8
         If3QBq39Fp+iONYl9n2DaOgJXDSjSgGAdb2jZL2OxS+ulPlU7zz6SvCIqnrKQ7gxZVu2
         ucog==
X-Gm-Message-State: AOJu0YwxF5rlzUblbwR3eN/FlxKLMy+/ZfxBfhjzShZPczjSKDRHMxc9
	IltzI3KsK/2npe/28HXa9iuWwYxuNfQyJn8rFIgIp1uFYy1pRus3lJWRzKgLWJs=
X-Gm-Gg: ASbGncs6132N6x8KoBhk+cH+kVoiEY/7xUICovpvjXwFSWLUvpSrRQ1wHtDPIgpSuCw
	YCz9KTH7FgJ5anvAlyZvp5t3cWAwG7XbOLjKsok0SM7ofyyUa57RfKBG3ovK+1VSAHezcvgBa6T
	G/B7k3bc3pfzxbNQs7rL4BkL9U6VfHKjjanqZRTQInI9TdvIpa+wXu0b8we6CBC+df+G8SRvwwX
	6OewuBliAV5GPObasfeVDKc1iDFP5oVjsJHjRpPr1CCe7qv7QbCDwzNf3Y5+8+bF0l5SvYGqOc5
	PLNV2bOFVStM4gaD6ohQF8C8t4gQIlW1kJVyY2K2
X-Google-Smtp-Source: AGHT+IFFm2/bZph2mGuhhUb5TvCItnj23ALODz/FJLvzCZaA83ACY0hoj3RAJPrANj0Eu1kZob714w==
X-Received: by 2002:a5d:64e2:0:b0:391:319c:1950 with SMTP id ffacd0b85a97d-39ee5b13b19mr2067015f8f.8.1744818994136;
        Wed, 16 Apr 2025 08:56:34 -0700 (PDT)
Received: from brgl-pocket.lan ([2001:861:4445:5860:9621:2787:c462:7dd5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4404352a5f0sm37224015e9.1.2025.04.16.08.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 08:56:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: James Cowgill <james.cowgill@blaize.com>,
	Matt Redfearn <matt.redfearn@blaize.com>,
	Neil Jones <neil.jones@blaize.com>,
	Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] gpio: blzp1600: drop dependency on OF headers
Date: Wed, 16 Apr 2025 17:56:26 +0200
Message-ID: <174481898217.8191.17051961705037896290.b4-ty@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250408143629.125576-1-brgl@bgdev.pl>
References: <20250408143629.125576-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 08 Apr 2025 16:36:29 +0200, Bartosz Golaszewski wrote:
> Use the generic boolean device property getter instead of the
> OF-specific variant. This allows us to stop pulling in linux/of.h. While
> at it: drop the of_irq.h inclusion as none of its symbols are used in
> this driver.
> 
> 

Applied, thanks!

[1/1] gpio: blzp1600: drop dependency on OF headers
      https://git.kernel.org/brgl/linux/c/01aecc78d9eaae7c8a7c3183edf47a0aac52ab5c

Best regards,
-- 
Bartosz Golaszewski <brgl@bgdev.pl>

