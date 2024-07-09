Return-Path: <linux-gpio+bounces-8110-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF19892B163
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 09:42:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B1551C2144B
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 07:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C83E9143752;
	Tue,  9 Jul 2024 07:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Ydv5RTag"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CA613BC30
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jul 2024 07:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720510925; cv=none; b=XFGITYOhoBg/OE9lrDynA1DxIU6Zt0du0JFCtOART0Pw09GWdDVjlaXHGbOuJafIVNIM0zKjSKUL/i8kO4LJvuPHHnzt7r24etQXTODQ/l13CkUZjTx3vvC7Dp1fbbMxX26QFTjGthQuq+NyQOPTJlkYO2sh3RevYZZ4XQ+/5Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720510925; c=relaxed/simple;
	bh=xJRLCzKoNDhkeYwYcPWKixASKx8FB9va7pEq5MrqI0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kTBpD8lK2n28sHCMg02UKx54CIi7TrtITlzXb8hA8UjFQu13eb3cl2FdKpz6FmaFEWBvvqZ8qQ6S459uFvAZT+rRbna4vvvCu4hYXyl0DSOXQZHk1xcrVS54WDb/1TWjwXcel1upnW3E08EmmyP7xBJfK9hoiJ1RHaL4WCyZzWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Ydv5RTag; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52ea952ce70so2998051e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jul 2024 00:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720510921; x=1721115721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JalcFjrpq0ahXu3HtCTQVi+o1I/12oWKnc8ukzoGtKY=;
        b=Ydv5RTagbNhpnQsERG8J8pZnx9ZuFH5wXQHhmS0PpacOhVMFQmhuFx8emRIc8oQWNE
         JkZ0Crwv0hJSFH2Fn2AgDb63jIOyESOD/p293DOWXZSOpOQmy4JWSuGcGMvMsRIL6k4p
         XU1S28cUOiSuorKhkRiVqOga+8uPaTlFg4n1jlBOln3sYzcLELVJhGLV2zxGR7wTdmLB
         pMAKPdvHOLpM2ozdA+xKkhS2LskIDTG0yNqvxxtygPyE3dk/Df9mSGuFpeO2XUDM42t9
         6A6BOmLmKNiZ6+l8TazCWtOFNbKgfUDHllEVq3VXsEc69pM1fHjqD0KLIhMKWiuKlHpS
         QrNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720510921; x=1721115721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JalcFjrpq0ahXu3HtCTQVi+o1I/12oWKnc8ukzoGtKY=;
        b=Dne2QBCvcohWHp9VH9VWQppqrfH9CmPBRdPY3FGM/d00h00jiiAWWY55VcQKlmIAIW
         fcSd17tx148DnSRiXZlN3n1nItupH7JnJ3qDpXBlYEjskl6XH2J4uhZ/usRZfVCDiPBV
         9JUoVyZQUx3aG1krtpgfCTP5bhBAbg/zW5jKuTCnqHDW4knfiq9jKo0le+uQNA6dJd7t
         djNk7y5bMJ/gXURL0DqwibRDUAhLJBbtudqyx/VWMttAlXZBHRf/6uBVyymUOjNJ3OiY
         uv0By8cFMzdYyU1ociqTTZ31WpPYUaYdXaKsGTXbqxvcwjJAFdvc5jsL9zg0fqpTaZ/U
         hKrg==
X-Forwarded-Encrypted: i=1; AJvYcCULRdxBXAfTrG1kJV6JnBcvywuSp/sWFJ5NtoxwjzH/6JFL1nz9IUzVcqjLu5vjjruqnANr4quDruyhJbiZktMgWxvuKPm3A/82/A==
X-Gm-Message-State: AOJu0YxeSYwQWu2i2mdC/rowBJCUE0DhUpfOf3b5id6xWJ7J98vIKMaR
	R9NPX++F2Cd9qDZQShbqDcrA7P9lpKgx4o44oPOdvv/Flg8bmVi+bFhLN/81yq8=
X-Google-Smtp-Source: AGHT+IFzgDVpkTFnErT06UxOVfkF7s4Xx81NBC6zg9ksoy0SIYXBWXCUEC3KtDW6Olt3ymjJu1TieA==
X-Received: by 2002:a05:6512:3d01:b0:52b:88c3:b2bc with SMTP id 2adb3069b0e04-52eb99d151bmr1214588e87.48.1720510921137;
        Tue, 09 Jul 2024 00:42:01 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:c270:70c:8581:7be])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42667720667sm83291675e9.33.2024.07.09.00.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 00:42:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10] gpio: virtuser: new virtual testing driver for the GPIO API
Date: Tue,  9 Jul 2024 09:41:59 +0200
Message-ID: <172051091644.6169.4337890998290511696.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240708142912.120570-1-brgl@bgdev.pl>
References: <20240708142912.120570-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 08 Jul 2024 16:29:12 +0200, Bartosz Golaszewski wrote:
> The GPIO subsystem used to have a serious problem with undefined behavior
> and use-after-free bugs on hot-unplug of GPIO chips. This can be
> considered a corner-case by some as most GPIO controllers are enabled
> early in the boot process and live until the system goes down but most
> GPIO drivers do allow unbind over sysfs, many are loadable modules that
> can be (force) unloaded and there are also GPIO devices that can be
> dynamically detached, for instance CP2112 which is a USB GPIO expender.
> 
> [...]

Applied, thanks!

[1/1] gpio: virtuser: new virtual testing driver for the GPIO API
      commit: 91581c4b3f29e2e22aeb1a62e842d529ca638b2d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

