Return-Path: <linux-gpio+bounces-7072-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B89D8D822A
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 14:24:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8DDCB25BFC
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 12:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F0A712BF23;
	Mon,  3 Jun 2024 12:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ThatlpO7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DE382D7C
	for <linux-gpio@vger.kernel.org>; Mon,  3 Jun 2024 12:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717417442; cv=none; b=HM61X0X2yMnSCLZqzhHShfNQ5fz6BkrmD0BZHXLntGf/xiF41oheNqGlHMK8FQieSo363xsi8tmjTiZvN85D4FzumGqwSxbpHvG/GfK3RjWhrrxv0JTasqwxG7nU6WwdzTj+TlqNai95NRdH6zFJasffRR80dO+tYXDESKd+3XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717417442; c=relaxed/simple;
	bh=sdzFus9iWb7MdyLcKMzB2O+os0H1yvpL3U23jpmxnik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=imm6SLw9duLBjsTQlorXLvvXMWJf9PL+WQ1Wljq8VC5A8NGE+bno2TkLeNuyvmBOGdvcdGX4/f6zyLpkGk+ku1XnWcgTAZr0KFc4ZDdOkURtgwca+Bj5UQ7/omWjIig+44G8xRpwwr+K40QHQyn/Sp1m5ay2WvPm9ZPUfFyxBGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ThatlpO7; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-35dcc681f70so2052840f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jun 2024 05:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717417439; x=1718022239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vR46fXcoXv6ChkybX1LtRgF9jjoOYKn8LfgvVCf8DkE=;
        b=ThatlpO71mXGVfaR864SxLJtMTFtkn+s93FIUPbRCIsqBDoSrOUWBNomjsQQxpnbBv
         PuSRVO4RrPktNLGOY2e6Zycfx012WnQX+0zcKn9+jvo14RXqgIAKpP1UIWPEUzOLHCt9
         bjqvv5UMqkLhsYhdVaKC+aSw+2n+wvtLmCzksDxf0wTeOaa6Kwfuood6yK3H06A5FI4b
         rHnOazVm4lkQlNPwcIyUL0yxf4hPiWqZv8M+N3Q8hUPhNfrCsrav3ejQY8dX5Z0GH5uA
         E85v84043aDhJflDgP9JPKl33TSqFWNFPH8U+b8f8xKgjutd1Yc8Vtkj9MYufe6nhOy+
         /efg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717417439; x=1718022239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vR46fXcoXv6ChkybX1LtRgF9jjoOYKn8LfgvVCf8DkE=;
        b=dajOrbH15h+4Ltk47L+85TKxSiarse+t1/Ziouw0wcqaBtkTz0HPD1auwZnPAXf4s5
         Nw0vb/+isKW7Qz7O6ijyL4IZiUEZ/+d9O9m2UTyTm4UkhcOCrslC67qUozlKFrYgdcLA
         Tyri3qAXp+I6V4X9OepZYpz67hp8P7KCjATuaG8IGNqvS6DbQ+sLTKoxFPPDapBsGflr
         KKcxhL0O4bpW+9ymGVYug5tKbvH7WI21YopKfL6xdDJG8OI/uRkJtE8VHBfsIi0xg4iN
         8GLhPAbtg6phNt5oj6y4H5qgwDT0ZD8G75bfJUlw/CWPqooH10e2W1MrdB+ISK8GRkDR
         PPBA==
X-Forwarded-Encrypted: i=1; AJvYcCWTEAz+A/vxUa3lS0xyHtzHmDe1ks530uhJ0ijLanF6W+Sjt2bnpALMU6ySG4nEvwQFTdavjMxot94RJIjoQgTkXMAcxRoglf6DuQ==
X-Gm-Message-State: AOJu0Yy42qkkHUGI24vyzUUaphkveQDesBJkgzvE2BbOGEe2NVOc9nz0
	dwI+L4XAYPj/A4PNr0wjt/CAX6mZXeNcWi8xD0tgbMIAqHWzsd9DTicc1JD9bOk=
X-Google-Smtp-Source: AGHT+IHB3TUN3a1VvRb01F02ldgZaivCRHBmm9DVppPgU9/moWf5g70KbShoONHjFApsB7/wMVBgRw==
X-Received: by 2002:a5d:5f8b:0:b0:355:796:15ef with SMTP id ffacd0b85a97d-35e0f25e488mr7585207f8f.10.1717417438990;
        Mon, 03 Jun 2024 05:23:58 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:5b1:48e9:27a3:7085])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04c0e8fsm8687533f8f.2.2024.06.03.05.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 05:23:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gregor Herburger <gregor.herburger@tq-group.com>,
	linux@ew.tq-group.com
Subject: Re: [PATCH v2 1/4] gpio: tqmx86: fix typo in Kconfig label
Date: Mon,  3 Jun 2024 14:23:57 +0200
Message-ID: <171741742898.63658.2302976335873675404.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <e0e38c9944ad6d281d9a662a45d289b88edc808e.1717063994.git.matthias.schiffer@ew.tq-group.com>
References: <e0e38c9944ad6d281d9a662a45d289b88edc808e.1717063994.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 30 May 2024 12:19:59 +0200, Matthias Schiffer wrote:
> Fix description for GPIO_TQMX86 from QTMX86 to TQMx86.
> 
> 

Applied, thanks!

[1/4] gpio: tqmx86: fix typo in Kconfig label
      commit: 8c219e52ca4d9a67cd6a7074e91bf29b55edc075
[2/4] gpio: tqmx86: introduce shadow register for GPIO output value
      commit: 9d6a811b522ba558bcb4ec01d12e72a0af8e9f6e
[3/4] gpio: tqmx86: store IRQ trigger type and unmask status separately
      commit: 08af509efdf8dad08e972b48de0e2c2a7919ea8b
[4/4] gpio: tqmx86: fix broken IRQ_TYPE_EDGE_BOTH interrupt type
      commit: 90dd7de4ef7ba584823dfbeba834c2919a4bb55b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

