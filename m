Return-Path: <linux-gpio+bounces-23438-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E074B09D0E
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 09:56:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F11D3A2D1F
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 07:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47C87293C61;
	Fri, 18 Jul 2025 07:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZGu7d3Ll"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B83D292B38
	for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 07:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752825380; cv=none; b=rsG5FCALckdnnsS9jkmRo6e8Z0IltwtVJ+21GAGF7t0clYot0eiSX/EiA97L9V4ucjsqWZXo07x64kuBpziz2llDur3Hcg9KZH5eA77dexYfGLMiJ3U6j+Ma2rnRWvHICbKIet45EJ0oK90P4PoL+/qc9skXgnxXhM++atZBhPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752825380; c=relaxed/simple;
	bh=9EZi7hXjRsnXNdY7SoZRLPhrUWdg/ELcZQ/IDT3Ukb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PPQCwRFg8XZYDnKOPuxbdvkV4yQJgIeQavXq8HeuXc1sfEyeS+fhCaz6RG3Ald8lOsY81ousIYVLP84caiwyKWucX8ExC/b9Zb5cYIQm5nb0d6B59rM7E0etUHK1bJwMQyNSNuXf1a4T1ax/V/HSkiBAixBJ45BVuXZoHAhcmio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ZGu7d3Ll; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a57ae5cb17so895283f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 00:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752825375; x=1753430175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EN+uHHE8PV9NsxzDe/4vVMLQJV2WuEBnbmW7nc4a7jQ=;
        b=ZGu7d3Ll8exsqBXqMxcqXTbyqNHDQUMjFjD55W7K1cxxJcxb+3aGuw++8i2rsBunn3
         4pNh421W5tv0OYu6P3Tauo7dJmwOrnqMclXhrDKF68aU8kCjFcL5b8Cjwa8YyJEEhkq8
         R9hkIeL/lxhxD+M2IzN2cQGilgPosnKqJlJ9a4f2VJSI4nuNJaccL0ncyMV4uAamqdgy
         jgNi1z5DArp7K1fD5F/0QBv1TjibGZxldNsjbDJzMcMMRRtcUCHrZ+/p1TfGJwwSjAzg
         ZK54wxxTYxYNMWSNuk8IA288n4n7XhX6tILShbAeQB+n0W4wobovD/gqtGQVBgKC9+fm
         1fJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752825375; x=1753430175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EN+uHHE8PV9NsxzDe/4vVMLQJV2WuEBnbmW7nc4a7jQ=;
        b=uKbC464KKC6i8xaJQUIbKOGolMNPsB44bOKzkaV57MdKrrhnQGjbIZ6Ba6iR/OvYYQ
         DAO229n2jhychUQXonh4NOk1gov/vgkKzoxZT2cTmsn6ttfaQ6MnNoUvIcQuaBEhwWRP
         liyYHAZjMvAJ7kxkHDXc2zDtU5gbyKe7jn54bWABFbuREFaZAxtmv5eFJ52TZB0eMQDu
         v2stuowZGV6fGqPu935gLBWKF79oGg0JYWA1HshEsPuA9mkLx3CedJYaPBv+syes1JK1
         9ddbWpGNJygwMMAQqqu8k+j+BHYiBOrrBX58iU6Ok9dpcsQGar9fYQa/FlPPws7OEXqr
         hWDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiaXtWJir4UDSXNShxWmK+IN6laXeXOLdjMmfhCB5OMK/CWe/S5durqxiJA1lwnedo2b0PogmTlk47@vger.kernel.org
X-Gm-Message-State: AOJu0YzkiILctE1zNoWQmUFfp7spMN0WjaWymP+5qczUTMU4JKZCaDcQ
	bYC6NU06PK0fwuATSOhjL+MhlPj8qqvKlkqpBAawXy0Yvzsar0g7/3S66oateF7b89k=
X-Gm-Gg: ASbGncsKIdI1ad8JqrBbhI/VpdAdI+5ouZI8I+rQEZhX1g8ANW7JA51DnqE4Jwb9hCa
	RRhHPXYqlCxkeZlfF9u9H9/nO6CjMIf9fk8QysiBRit3mNCHKE1UK8COKjLvRpjD7i8GBCI7Kx8
	jWjhmP1DJa3Hcx2S6p4aQbnuWE0RdEI7ACE09QhTM1V2eifgtJRIoGhdrVJLDiieNxdvr2c2HG6
	KI8w7eHSnSXPjl/j25j2sD3177/EeGR4JsbWT70TNcbiLn+dLAiHcyEDsLUMSosIl2eegL8BqCj
	HrwqmJ+F1xD7y+TrWW5EUB5e1uKUfRWxPm6Z3DhNUEb9xdMEOTcWyDSLzR4EDl0R2WmP7HiGyR6
	BT+j/p2mw+f0J9TVEmg6E
X-Google-Smtp-Source: AGHT+IEiAzcAEAiQ9ayFP7S55kjzIXFer1zIeY1cYSz5UvgjCnvHPIHe5gFVJIivHGSmeTQprnBFYA==
X-Received: by 2002:a05:6000:2901:b0:3b6:1ed:9ad2 with SMTP id ffacd0b85a97d-3b60e51b8bdmr8413573f8f.42.1752825374548;
        Fri, 18 Jul 2025 00:56:14 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:be63:a233:df8:a223])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca48a23sm1080851f8f.54.2025.07.18.00.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 00:56:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: xilinx: convert set_multiple() to the new API as well
Date: Fri, 18 Jul 2025 09:55:46 +0200
Message-ID: <175282531509.45055.666620085878969574.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250717131116.53878-1-brgl@bgdev.pl>
References: <20250717131116.53878-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 17 Jul 2025 15:11:15 +0200, Bartosz Golaszewski wrote:
> The patch converting the driver to using new GPIO line value setters
> only converted the set() callback and missed set_multiple(). Fix it now.
> 
> 

Applied, thanks!

[1/1] gpio: xilinx: convert set_multiple() to the new API as well
      https://git.kernel.org/brgl/linux/c/906b955c60770bfdfae141aa993ae5fdb3eab193

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

