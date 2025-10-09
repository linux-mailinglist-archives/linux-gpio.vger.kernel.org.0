Return-Path: <linux-gpio+bounces-26928-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D635ABC86B3
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Oct 2025 12:11:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 881373C4DC4
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Oct 2025 10:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 172302DAFBB;
	Thu,  9 Oct 2025 10:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="daRVTGGP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7D32D94A6
	for <linux-gpio@vger.kernel.org>; Thu,  9 Oct 2025 10:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760004646; cv=none; b=JkAmO/ePqvAYHVcpl+lM1ID/h7voBMtdzvOrzVMQ/faplWWZ7wMEbIZJcMxFV4L045On1Ub5SFC4WNDTHOD8lJ/ESx+jk2JaTWITvHrMzmqPftlRwKmIB0zrVf6IiOhBIa9RsCEsnqPa2J+9dTfXp9Bn6i3VklrjarXkSCAcs08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760004646; c=relaxed/simple;
	bh=sjfKdQEPDoSQf4F9EzpbLfwi1WczNowKnWmMJSXfTeU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FWFz2RlAZBEPxaMbSUnVYmYakZoeY0lUvqpR6NqgVBHq2ioQTxE5jcALLVkwdD9HwXizR9BrvQVEj7WOZVzhOxAZeu5wWqtgNooAGGs6dfR6Ubk/yJyVjSfYqy7aWo0Th1KMBEq7Z/4hWXIONczWp9K0S6LVE7qa8V2UpdVc9S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=daRVTGGP; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3ee15b5435bso477118f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 09 Oct 2025 03:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760004643; x=1760609443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ibyhFzGQvN/S6kLrK5hTmSXl326cALeU9/YFVYqH0+E=;
        b=daRVTGGPsKc77UUVkPLvqe3odMgJuBUx1/psLDtMvGXObfbI+UTs59y9SkbVbYAVIw
         N1AR0z+d8OIcmvosw2evvVZtRrASTJP1SRHzby4rQEAG2rkUkI41wetfGbd/ByEgrvEE
         kJeSUKRSsdc0varJpXJqZ9c4Z7Skg+2s2h9jBuhliadC9VyrfAoVUImmKDJiJhTBzp1f
         g/LcXz4UgqBGrfrky0Th/Gq5IXc0wDatcAKUHpKKePHnHgNFijI7x5cps/Kna3l3VeGs
         0TVGiJ96u0LaDwhVE/pELHAEk/unCBALUtWLLdChJObBuPVV+SP6HmJ90fr7nrmH7zqB
         hrcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760004643; x=1760609443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ibyhFzGQvN/S6kLrK5hTmSXl326cALeU9/YFVYqH0+E=;
        b=b0wkw5vkGu02hvFhoG2uGiBJurFpofpT0NEeXwCCV1oUKdp0bX5Fz11PL64AZOPhsT
         44pMlgPRGxqL5Uf+LBB7YA31YeIjeHwkJ1nas6phanxkgNuqGKqtGXd8xKiDElULZBfl
         gmgoDWX2tQ20OACaSpEVpLDvhbgqk3+y5w2ZpShpAqt8uNqO+k6n41qVkqGh/XcMtZcW
         z94LVk58Um+sWJPtZlUkrQ6lkHzrlB9S1lMGgiR3xVzlSL5Gb2v7j6aY8V5ZJk4eIGad
         IBKB82HQXHMZ5b/ycRQgKeiXRaDd4PWfLXXbwdAsHd6YwuoLzFy87pXb5etq50yVc42M
         gg2g==
X-Forwarded-Encrypted: i=1; AJvYcCWHezGxI6ogksgUKgJmAHoQPxFx8T/yQNWyZgZw/vf8ACySk/2Y81K2PzvsQBCgYzNoKPA7gfnGG53p@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6JPazQpmKgd1G/tZMx7k5o84HXlG5rEogqTqIVl5phpjt9VHO
	IEujNY2Av3vaTulqmA/4j0ZDuA6ZD3olxtPZEA+MuUvVlDmx7+DoHbIiae80nW5XaYA=
X-Gm-Gg: ASbGncvsrNe75fz+ruDM+WFU7JEa2dBfGbux8M8AU7+sxb7uNG4JcoWBvNPBAkxZzYW
	PGDLtYVjkYxGDmNilHfOdZmgdNoQ4S7tbcKntAVJO6RmXjQNfehf4Z/pRvRuw21qoKd1/Io+XZ2
	G2XUAM9URvZFCF7Yw3tCye/Y/11G4zWqmEc01csLYIfr0UCiwiOFJo8wFm772j6Ub273V3D0W7f
	2okvap7bXghy/j0H3J4CnPYcn38Aq2SF4PzBtPvTgEm+VhNJK7LjjcXp9oDlolRnyuIaFcLYKv5
	j8+sABCS0dr7FrTxDcdzty9KrZ7HfNk1LLusMld9CiR09KRP9lgTNHj0zQuH5EvsrEq9N/mikxS
	Tkd7msoHnGu7ii/8puhhR3PJ2vnzcy4slZ0kgfyy38rQJZw==
X-Google-Smtp-Source: AGHT+IG4c1/8pO2k+AcCAaL8hSZ8WFG0iU61AePqa1LX5LsDB5/873stoeLVdfxvwI2NT2ku5YbPpw==
X-Received: by 2002:a05:6000:4201:b0:400:1bbb:d257 with SMTP id ffacd0b85a97d-4266726c2f0mr4427872f8f.26.1760004643285;
        Thu, 09 Oct 2025 03:10:43 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:a78:91ac:9309:82b0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8f4cc3sm33932600f8f.55.2025.10.09.03.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 03:10:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Hans de Goede <hansg@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: usbio: Add ACPI device-id for MTL-CVF devices
Date: Thu,  9 Oct 2025 12:10:41 +0200
Message-ID: <176000461219.91113.15900317842092079922.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251001212416.4871-1-hansg@kernel.org>
References: <20251001212416.4871-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 01 Oct 2025 23:24:16 +0200, Hans de Goede wrote:
> Add "INTC10D1" ACPI device-id for MTL-CVF devices, like the Dell Latitude
> 7450.
> 
> 

The driver in question is already in Torvalds' tree so I'll take it with
some other fixes for v6.18-rc1.

[1/1] gpio: usbio: Add ACPI device-id for MTL-CVF devices
      https://git.kernel.org/brgl/linux/c/aa34ae9db2e8b397330fb986ff69ea7ef332ca40

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

