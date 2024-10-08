Return-Path: <linux-gpio+bounces-11064-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A649950F0
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 16:03:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 506432859E9
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 14:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5532B1DF978;
	Tue,  8 Oct 2024 14:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JUgMDHgP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1111DF733
	for <linux-gpio@vger.kernel.org>; Tue,  8 Oct 2024 14:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728396179; cv=none; b=Ly4B95NRjdq5foZTVyqu9nPk65wMcO7AMx/AtAYFdWXpsnn9qxTimlmlmpJdcsDfoC0mVKakkahQ51fT6DGY7sPo7NUKwHiMPWkNxqGH+/4Ytbuz/CALZfqlkpCIQj+be/lmyRFdgnZmoavcnd8S9PTlE7NCLjWIYw27ZB6IJO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728396179; c=relaxed/simple;
	bh=acPg9HeQJ5h5qnAYasmTJ/Dv0cCea4ZzsVf1ipGbU30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lh118eYnfnAeZMooRgMiofh0IqtqaYWJ5aGj15dhTTIL6Q8aq3A/6E6tvcRKjcwjItPUTAFUCPuoy3ZuWsM8KnmgvEczmi/UuzDkH+cgzAhRjcKsn3FCsFM8XrHpgXafoSoVMaroSAELp1KZz0z7Bhq7IkcFa6tpH0RfB73uG80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JUgMDHgP; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4305413aec9so5906825e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 08 Oct 2024 07:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728396176; x=1729000976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wrB8SyBEggX7gkCJYrDAfUW+IVD/j7Ve4yJ4nlFfibo=;
        b=JUgMDHgP8Leo+fy/6lZpGNTZAuGgBFK4mvu7vP/6PW4XKX0uM50UMyS+9/c7c9SdBW
         4389N2k9LaDMkyfHWEyVt/LcZsTVqGRbU6kh814T4T35XDT1jEketze8M331ofmKuw5r
         f1IsoQp5P2aaq7dazqwKYvRWfigDdcPAEoZf0SFZk+t5nv1h77x44FdkGoh4RZxR56bO
         KOkr6RMihlsTZy7CSkd59lKH9e/lMW48v7H07lZrsCzPplBtDu37C4+eBCkfUlQ43kDm
         AGo+vfWUXjuAunuGoMduDvBf+jlOmYV6I28QkNdDRkwzXoKdae0pLHekWEgFxLxFgvSE
         s2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728396176; x=1729000976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wrB8SyBEggX7gkCJYrDAfUW+IVD/j7Ve4yJ4nlFfibo=;
        b=wvQkBuvs2p2oxXYkyji7z9vtooaOjD2bjLnCSf73eBittyOSUUPRRmNleLdizx15Sr
         q5vDo/TDvXXrMyEj9R2GOzfk126q7aYP0T59hcKQSVnpn59o1M1Me/iMLF08cYaNzXlZ
         KWHFLZju4+XHIBsoRS1Z2U3mts0bvX/NDEKqcOmJa2CvvutUtQNx5TCQsY7buFb5dqju
         8KFtsx5m79LMIomj3bKmn86OdsfCQCK6gxta6An8vsbBahpvnPx42HROJaM0R2sTmj5K
         10rNguhcGdExkYNPb/Y7il/yTRzHKlMOIz8L62l9asQmbcaV4NyjFSTGPFifzV4yYunj
         BnHQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+r1EZ1OZ5XuKu48k39WjjDGMSao1oA6gM0m2Sbhqgl3RxD9T6/TBiIIMqY0IhOCNpnx/10QKsU+qS@vger.kernel.org
X-Gm-Message-State: AOJu0YwE070HFqNwcaex4pw2zbiJIqCQe8+pXVMwwNYwv589BBE9Lyyi
	fdlGdv9RE4YS9njzE7+keVzPzgcD7dry5vpobVfs0EtSkb00M2qnNRL80HH0J617+xt8/sbDaJC
	a
X-Google-Smtp-Source: AGHT+IEV/6cDSkCaLspx7rOPlHS533C+1XbFqrGunzht3iptdfLNh8w9eozrda6COlsrBspViWACGg==
X-Received: by 2002:a05:600c:1d0e:b0:42c:b995:2100 with SMTP id 5b1f17b1804b1-42f85a6d722mr101173635e9.6.1728396175387;
        Tue, 08 Oct 2024 07:02:55 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:738a:20da:f541:94ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d16920be2sm8205953f8f.60.2024.10.08.07.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 07:02:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	BMC-SW@aspeedtech.com,
	Peter.Yin@quantatw.com,
	Jay_Zhang@wiwynn.com,
	Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: (subset) [PATCH v7 0/7] Add Aspeed G7 gpio support
Date: Tue,  8 Oct 2024 16:02:52 +0200
Message-ID: <172839616610.55104.2573120540182552334.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241008081450.1490955-1-billy_tsai@aspeedtech.com>
References: <20241008081450.1490955-1-billy_tsai@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 08 Oct 2024 16:14:43 +0800, Billy Tsai wrote:
> The Aspeed 7th generation SoC features two GPIO controllers: one with 12
> GPIO pins and another with 216 GPIO pins. The main difference from the
> previous generation is that the control logic has been updated to support
> per-pin control, allowing each pin to have its own 32-bit register for
> configuring value, direction, interrupt type, and more.
> This patch serial also add low-level operations (llops) to abstract the
> register access for GPIO registers and the coprocessor request/release in
> gpio-aspeed.c making it easier to extend the driver to support different
> hardware register layouts.
> 
> [...]

Applied, thanks!

[1/7] gpio: aspeed: Add the flush write to ensure the write complete.
      commit: 1bb5a99e1f3fd27accb804aa0443a789161f843c
[2/7] gpio: aspeed: Use devm_clk api to manage clock source
      commit: a6191a3d18119184237f4ee600039081ad992320

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

