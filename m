Return-Path: <linux-gpio+bounces-9760-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEAB96B3C8
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 10:02:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D89B1C2164D
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 08:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 122E617BECD;
	Wed,  4 Sep 2024 08:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Ih0zvCLU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3BF176FA2
	for <linux-gpio@vger.kernel.org>; Wed,  4 Sep 2024 08:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725436915; cv=none; b=so5jAFZJMCV/0TxbCCHzT1Aj6gtGjFXMeiHDJ6k5lXxc8iQQ6mUgk8iNkroLVTvHlWITFbTcXztZu8Fw5pqwuGbJL8CezXGLkpJ8uArZYKZDB5MAxa7yAmKqS8lqrMyd25lNAea0aKaV6hGIyBFH6/7NQ8f/7SZt9KStG//A0ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725436915; c=relaxed/simple;
	bh=NE0zVNdkSQggFLaj6w+8JQWDBinoLV3SdgXeouoLfXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d2WAAyobd5QTfug5aXOTAgmRy1MFpgJqNJMCWDRT2GSa6zieSLDEig/UkPgnd9LBCYhFvvJ7m0kELs++BpuFHKdI6u1qPUFjPLbr15Stvd4zgdwkE/VZQhhiH0njil4zUMfj3GpiWUfqaOvx5XuE7AL1TV1SJ6mJku0zK0UWmqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Ih0zvCLU; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-374c3400367so2655786f8f.2
        for <linux-gpio@vger.kernel.org>; Wed, 04 Sep 2024 01:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725436912; x=1726041712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fgG2SWOBmEmcbYBqaioLCfXPV4aBp9tip53DbH+tfDE=;
        b=Ih0zvCLU+EvmT7+Ey9oXzO20y8u7xcJYfW3sV/FzNQTpsLtzzdQqniYn2xkTRdLyJg
         lJrtS2S32N33Eumj2+q0qJUL7bL2oVbpn4Noz8uMoGp6rh+3FupdRisrvkEfBNKkh5Gm
         2afbosPMH3Q0fSxGXlfyn9w/5I7GaSKCTwXPPGA0NbC7PSfg9hmOf5j5ekT70OyGFeH9
         zJEVXP41TaARf6hsZXu8FGmz3kX+ETSuVeomrus7ZE8IcnrkkL9WHIxPTiJ5l4zReXem
         Z4dtk8271VuT7jyYY8njdPN/7aOhfFSrf7DVOM12C/IWSvC+uzRoJQqOybHb6eZlgwX6
         bJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725436912; x=1726041712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fgG2SWOBmEmcbYBqaioLCfXPV4aBp9tip53DbH+tfDE=;
        b=VDsAjvlozAD/G9OSfW9jUrzaadGreXSNekia5fiRJm4CBAAs+uynekTZKkIDO/NFGZ
         IrheXTTgaCJ2/L28Ba6hO2CeGQIzwg24xSQF5F7s7bjSjl4NNcaA6b8uPdqaL7rQl02k
         sAuMhAM3gr7FxUtgEckOyTcj1bv63SJUaLf1FgWdQxkHQawW8I14E5/1+d0j17km5vJ1
         NFauqKNAWnxKO1+gZq4ZZx0HC6aZkje2Kc6v8XD7/aaYT34ZnwYwVtnr2QLxYE5F828w
         R3jW2WMeWhlXh1RZ2hzY0I+Ygav7WWfP2qgDmoCQGqVddqiwYavYIri2RUKsPgn10vfg
         Lg8g==
X-Forwarded-Encrypted: i=1; AJvYcCVG1rx37R7BU1NHBZ3iLNU9bguHPPr8c2NRqWT5+01Wpm3g6hC78+mTwq1N5M2ywnrnIYcOtUk3U8C1@vger.kernel.org
X-Gm-Message-State: AOJu0YwgJo4aFMD4hj1a9mU1sX+g1zhmzNz5HXbkXbGk/Lbdr45f2wf3
	3z6bWL7pyk8HlBuBAG2HmKw0Ep8PkyU5DDSGPZXU+o72+EwtI9bl86LAFLuC4qQ=
X-Google-Smtp-Source: AGHT+IHboRICQb0C/vqtbSkCRNWf8WdQM43byGBZL7tHaz2fk+Up3D8SXZWo563oF18JtDaSd1g2/g==
X-Received: by 2002:a05:6000:1f08:b0:368:7f53:6b57 with SMTP id ffacd0b85a97d-3749b544b2bmr15519213f8f.18.1725436912126;
        Wed, 04 Sep 2024 01:01:52 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:66d0:70f:5bef:d67d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374d00564b6sm6096319f8f.91.2024.09.04.01.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 01:01:51 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	vz@mleia.com,
	linux-gpio@vger.kernel.org,
	Zhang Zekun <zhangzekun11@huawei.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 0/4] Simplify code with helper function devm_clk_get*()
Date: Wed,  4 Sep 2024 10:01:50 +0200
Message-ID: <172543690825.12391.10926770607261853766.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240903080627.53652-1-zhangzekun11@huawei.com>
References: <20240903080627.53652-1-zhangzekun11@huawei.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 03 Sep 2024 16:06:23 +0800, Zhang Zekun wrote:
> Use helper function devm_clk_get_enabled() and
> devm_clk_get_optional_enabled() to simplify code.
> 
> Zhang Zekun (4):
>   gpio: cadence: Use helper function devm_clk_get_enabled()
>   gpio: lpc18xx: Use helper function devm_clk_get_enabled()
>   gpio: mb86s7x: Use helper function devm_clk_get_enabled()
>   gpio: xilinx: Use helper function devm_clk_get_enabled()
> 
> [...]

Applied, thanks!

[1/4] gpio: cadence: Use helper function devm_clk_get_enabled()
      commit: 7cea93092a28d3338e242b08f8ee5099c82c1cb6
[2/4] gpio: lpc18xx: Use helper function devm_clk_get_enabled()
      commit: c9e5cb9916fcf73ac8d2e0a1e35a9327bf0e347e
[3/4] gpio: mb86s7x: Use helper function devm_clk_get_enabled()
      commit: 1c927fb131fffea28a7ebe00220071d400a11d53
[4/4] gpio: xilinx: Use helper function devm_clk_get_enabled()
      commit: f8d5200bd59b9688f5f59ec8b1e06e8200dc4fda

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

