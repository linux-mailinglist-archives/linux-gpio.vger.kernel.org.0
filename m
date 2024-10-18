Return-Path: <linux-gpio+bounces-11593-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC849A3780
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 09:46:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DCD20B24BA2
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 07:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B67B189F41;
	Fri, 18 Oct 2024 07:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="MSOaoyrH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4547F149E06
	for <linux-gpio@vger.kernel.org>; Fri, 18 Oct 2024 07:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729237561; cv=none; b=Ab7lk7v1mFxzlEqCQ9eruu/ZwjGKZ7aCU+FXIZLYEXleYsyGZ/bJJjahElXTiSm0q0MFkuhhHY/b09XfrMMbJPRSPWEEy51Zp22n++pKYQ0cbNUWkPAQTWQUhugRu1Mza+fUqMyd8dvrCWW+f7kYpTk5iQjSJqHTdrGgO30Ce/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729237561; c=relaxed/simple;
	bh=Gh2fo/iRRPytp+2EBjWtmYPyu/onTCGX9kjNpTpbz3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e0xvUyd7zMjUmzachPNjetK+B7OJB3qG0l6TBZUbK5oS/T8qqzuPriKOHk6mKGwAvAqhRAoXjQnAA+wrM8XfKASpTQwuZkjZ+Ba7UXqXqCfG7pZVfLljTMbYVki8n366HKNty57FKxnJsBW+IqnJ0gb/OS7jqn79gE6cGibZSDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=MSOaoyrH; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4311fd48032so16131425e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 18 Oct 2024 00:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729237558; x=1729842358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FEB/j3iNUrzlEu4sDrQl26Q4k57vw7Dq90T8AcnUxoc=;
        b=MSOaoyrH7EUizcjr0//bardEES4LZpQzXqlQDPJMi7eq4nSmC0+sLl5Qs4Jvp3qnYJ
         ZhRNIRWL7BBWcbAtjZ4TlSslNhXm5UWP/CJfa8cQrpCXra1XIKhBlaj9A5aSHI1Xjk8v
         YpM5MX0k5sw5nlasrZf5D8ydLxPbz3YUAxFT3T/1jrDt9ipPNIHd3JfKQq4v3qXh5bfx
         C42/TiMyiNQMXlHSFNRQ8ufqjtv1D1lTiNqhpfdAGdmAQSfdYPQoeBzTmDG5GCZsEzVe
         Sfn/iuC6WMgH3AZ5RkEEvRW3UJercKKUvi5I89/Iveraw0196JHV9JNxgsTXxaYPqo9x
         YWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729237558; x=1729842358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FEB/j3iNUrzlEu4sDrQl26Q4k57vw7Dq90T8AcnUxoc=;
        b=PLCN/YXyBh/572P8C+eMy9WhjRSopl8CAgCsTA8b8KSwU7Q80F6W0Z4AAfphvFk4Gp
         p0r6Q27hvqCqHu9kXcTM8qbf5OpSLTz6wW15n50w04RojmRsW8nVK3JijTONZ+Bz32Zt
         wu4aUPPorHLbYeqY6GXvzJDq4DTYzHVdlFFPSWOJBM0bV84vNKtdCtEwKtm9R7TujCyf
         88s+/uxkYGBOzZMalaV7sgJtQVWOiRUpkZiuAvMp0Pu9+emmnrDLn8ijNP1bnenzX+Ac
         7hAU/GFIj5jpvDpIC/LvgFL5XjIsxd84MPBtetDAEgoMQL3OYHdXX9IuDMLr7dAcXzsj
         eOJA==
X-Forwarded-Encrypted: i=1; AJvYcCWxS2jY9YcgspaB6uHemL7aCXP91EptbbRQj0zP0UTpn2qr3iIWfzL5MJfOHaJTepLvhGYVKo0fBQff@vger.kernel.org
X-Gm-Message-State: AOJu0Yydc/Pi21U7/yvw2T81cyMnbPjgtTO1qMJRcbR+A0KtmK4zJ7xb
	yHA8CGBVvBK0rm9GlH1IyoIIb3WPr3BzytJznPz0GU6WclFQBNnPwTQdTcrsnmY=
X-Google-Smtp-Source: AGHT+IHi+Ja1NorYoqOth82NOIUjsr8UAb0UFEkUFA6qyRXBh/5ygzllv7mMr7rulA+CcP0cbSdrrA==
X-Received: by 2002:a05:600c:444f:b0:431:12d0:746b with SMTP id 5b1f17b1804b1-43161693937mr7027615e9.35.1729237558374;
        Fri, 18 Oct 2024 00:45:58 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:45a3:93e:5196:d8ce])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316067dc4bsm19809185e9.4.2024.10.18.00.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 00:45:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/2] gpio: mmio: Support ngpios property
Date: Fri, 18 Oct 2024 09:45:56 +0200
Message-ID: <172923754794.7933.16034123594657778317.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241017-gpio-ngpios-v2-0-cecfdb38d40e@linaro.org>
References: <20241017-gpio-ngpios-v2-0-cecfdb38d40e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 17 Oct 2024 08:46:07 +0200, Linus Walleij wrote:
> I thought this generic property was already supported by the
> generic MMIO bindings and code, but no.
> 
> It's a pretty obvious usecase to just use some from 0..n
> of a MMIO GPIO bank, so add support for this.
> 
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: gpio-mmio: Add ngpios property
      commit: b4c69d471b72aa70766d94a11c31bc4c13f29eac
[2/2] gpio: mmio: Parse ngpios property
      commit: 1ed9f099323ed366291291826a8beb1a5adfc2c8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

