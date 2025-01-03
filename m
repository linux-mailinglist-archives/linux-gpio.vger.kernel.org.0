Return-Path: <linux-gpio+bounces-14455-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CC6A005A9
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 09:19:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2DAC161E5B
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 08:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6720F1CB9EB;
	Fri,  3 Jan 2025 08:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="grDeuCMU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73E51C5F38
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jan 2025 08:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735892354; cv=none; b=oLLuu66zBnngmk/bgoZ/UeXinP3Cl619i5j4PvTzU4D6VhsUGjM2zOu5GszFKXo4f5fWfooKjC99FG12ahSLfgDCH3fqRMGdyZLzy+2CEDbqlwywHmFC7RnTGYHj9YRPPmxQE+A3WC7umBMeG084ZPZvIghWLLtwqTcQKNuBsrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735892354; c=relaxed/simple;
	bh=QkW/V3ekuW7nhc7ABjgOa0/Vd3a7U27NkC1u1ZKIURg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=u9XRiTm3yLTSZ+F5UT9VYZpCNyYHCxQ38Y+FBw7AIj3ScR7VqWZkcyZGnIs7B62hLvlWbA+QE1JmKw+NMynGyG5q1iFqw7+gjiS1ks/H2df6Jk0tSO3bLme88NLScrbyIzrOLrdmFvOIr49sgPTmAlrM/dPkn0Em8ZqE+1TOm6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=grDeuCMU; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5401ab97206so12786705e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jan 2025 00:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735892350; x=1736497150; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FH9sD/4hZ0pU+eGtiC53kCE0/sXA5n4RBd6XBkyWO40=;
        b=grDeuCMUbrvuo7KsNsla022j7uxvHNTN0HA5mGzOnBKjoX0keP99JEoyZPDwv9jKqP
         Qfac7YPLqE1E7TYhbpw0lg+2HC8z6tatxR7FP5kaDofMTv+UtQkoJpdKCguPCskq7gQD
         wjUzj7WEcNi3j1WIqZs07zSBQzvUrWt9ACt3JWgSgKNyMp0KcdhOnFOhS/nqR0HQNgxV
         3exxtZR7HaSL2btXBZIYrEevsgBkOb3o0iSrBT0WSeitqgWqZhLTbAD08yqVXotv+bFB
         TRQjamB6U/QIKDQ4rZm23QpB9Yq+gJsRvFClLHlL6THtQ5i3Ldd5SCKNSazbD5ciJatu
         f1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735892350; x=1736497150;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FH9sD/4hZ0pU+eGtiC53kCE0/sXA5n4RBd6XBkyWO40=;
        b=kJFL1O5TZhVaTrrAuvmKG5c/sj+EvR20t/T6fZ8Dy2bh9S58Rhdic2rPlcWT2wyId0
         xGJ2+scdhbh44Us2tCghSA7vIDc0FjhBlYD+yYIabIo0ckEF7VDRepAcbHz3b2DwUMuu
         mMOGxaF/fVZwcYMvnvlA9HbtE8uyxSfkcyyb3Zc4z4dEZpAFkAsfm6lxQ8cFtf7km2F7
         utY09r3OI8qRISga0A2v2VNA7qeKr5tu+U/kPshaGQ0Z5Wx7aS6dei1iNYRlIVAXAo7I
         YC7bD6p0ZU5m4yCXUDobDtbxzPaInlMgKbgmih2g3muxe4ZQGb/9mB0giW6e7FcU3m5g
         c0bg==
X-Forwarded-Encrypted: i=1; AJvYcCVZlig8TTRsZXEJuq54FFse1YwFqqB+ic31JNNeCLvTo6onTSM3ST+78+QK8B/mzo/9062PsbGa4HSW@vger.kernel.org
X-Gm-Message-State: AOJu0YyOBdduD4Znwa6Gi/6duk+juNbP0XFGOYJnmS8T4PdI+jxfm0vw
	9wyF8M3BmPUm24ZAygyPetpvXeMow74HgtsfBWQtf8vT+nylI3v3UY1rSsINeyq9tArhufGtln2
	34wXxEAMvgnozA/kP32kAeJi0oLml4gwZNDUkYg==
X-Gm-Gg: ASbGnctytD/YgTYb9dWsqgFQa70UHmOkojC8cLhOh7HXzNHGdzGPf2+7MiwAGH2DeiU
	EnGMuDXo5c9DJpNE39sVv7SkWizmKj4pkKg1S
X-Google-Smtp-Source: AGHT+IHFI+t9Q0Rp5fetZEot+hHYJ8LYh1F/0lbddx1WIWkd30vBXcFI7J1Z0LaNAPOzAjvoXaOMPo8ciSxfYa2ya0g=
X-Received: by 2002:a05:6512:1309:b0:542:2934:71a7 with SMTP id
 2adb3069b0e04-54229532463mr15310101e87.15.1735892349827; Fri, 03 Jan 2025
 00:19:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 3 Jan 2025 09:18:59 +0100
Message-ID: <CACRpkdYCDUW5QMh5Tx9zkSniEhWzmVBVnAQ-6tTvUWeZ+eZTTw@mail.gmail.com>
Subject: [GIT PULL] pin control fixes for v6.13
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

two small pin control fixes I have harvested over the holidays,
nothing special about them. Details in the signed tag, please
pull it in!

Yours,
Linus Walleij

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v6.13-2

for you to fetch changes up to a37eecb705f33726f1fb7cd2a67e514a15dfe693:

  pinctrl: mcp23s08: Fix sleeping in atomic context due to regmap
locking (2024-12-17 15:10:32 +0100)

----------------------------------------------------------------
Pin control fixes for the v6.13 series:

- A small Kconfig fixup for the i.MX, in principle this
  could come in from the SoC tree but the bug was introduced
  from the pin control tree so let's fix it from here.

- Fix a sleep in atomic context in the MCP23xxx GPIO expander
  by disabling the regmap locking and using explicit
  mutex locks.

----------------------------------------------------------------
Evgenii Shatokhin (1):
      pinctrl: mcp23s08: Fix sleeping in atomic context due to regmap locking

Fabio Estevam (1):
      ARM: imx: Re-introduce the PINCTRL selection

 arch/arm/mach-imx/Kconfig          | 1 +
 drivers/pinctrl/pinctrl-mcp23s08.c | 6 ++++++
 2 files changed, 7 insertions(+)

