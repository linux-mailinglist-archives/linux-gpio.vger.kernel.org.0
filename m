Return-Path: <linux-gpio+bounces-12866-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B79839C5850
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 13:52:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 704B81F23346
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 12:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DB5070819;
	Tue, 12 Nov 2024 12:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="k1xRH8iG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FA55D477
	for <linux-gpio@vger.kernel.org>; Tue, 12 Nov 2024 12:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731415926; cv=none; b=GXsKDvrQQNG4fdPnsDSn6RPDQakHR2JLzZPOL02mPYkPlzkn1jSXZTIuKS4WjTFf81UWgDStMRnDitoJGTRnF0ZNioTtBNjrGZbsvUWoW/DKWutHlrsgInGfzs7EIRCH+2nVsxc3qd14ZKNGfaibxSUzSWa5E14Q1W2R0WaipKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731415926; c=relaxed/simple;
	bh=WEQednnW/wFnwxpMGjVhEQb8fNxGWPhIjnN5iKz0fu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XVgqlCfQC5pYnPGRuXEh7KdEX7D1lEJLtLw4JhBrB6Ezmhyia/lViWjUlwBA0E1cAka55Th3iYgACBIqel3I3m0lEK/3z6j0czcF0E9oyazm8aBhyj7O5qPhyK53BygrfWSEFGshKaDwBnFEE0lbw5XgWR2IqVckPNAeGAwExqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=k1xRH8iG; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37ed3bd6114so3517875f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 12 Nov 2024 04:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1731415923; x=1732020723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ItC2fxl3q3F4+PCf0UD7oi85OBnIB0U+ggjyxuMdhdo=;
        b=k1xRH8iGOWLElFf8WFuDBJRUF0GcrvIyUWvFujlsDqf6Dmgl+8yjulFoivG0Zfb9bj
         IPCPlICg+s0LAwV5G/SvC1oJSIpeBzAM/WEaVQ+RtZ5q6SjqpcSY3zthzWXNvFpI/J6T
         LTRDv8KL2rNZGb82OmJ0O67vU6xe5/qLAKE+/mR7gAmUBxTQ2TxOvW1oCasMDBO+6Qhg
         oykpa0ryFgY6ZeaQZ/z+ie6UAsi0g1CfO2VxkNuaL0qZONNmHhmCQhioRuEdL5tuuqs4
         PXlKj9KFkKXNBjmDBiaLUgl0cJYIDvGkFbTHa17O89MSzr9X+r5ZNby9UrmlwrEtp9yz
         VoBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731415923; x=1732020723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ItC2fxl3q3F4+PCf0UD7oi85OBnIB0U+ggjyxuMdhdo=;
        b=OUWkCUOTxQN0kn7vMg0AZM+YdmYmCz4E65cHzY4+TGv4PDlYU24e0vaav+AiGcyKwF
         C/e+mOBevEfs4DW3bBpw/2zl2VYM5rSOcvqo8Lgy+BTuNWi2IaTfAbzIp8CIm1OahmtV
         03EwKBqJcd66zouTXNAchX1sWfJfHMaIyiMxh37/h6GOQMqw9VV3OE6X29uPTSQQwmmt
         C2w6yuOhfrnTvjXHqVmYeZa6i9YC4QYluCHiCPqn3IVMPA7FviMr0IJM+WtIyT/sur6e
         QzzqshFl+oVyqQg4tSa0atiowJMgTuNBP5gz22oHTRRHQacqwaytL0nQkUxYMnn/91BD
         ZMGw==
X-Forwarded-Encrypted: i=1; AJvYcCUlYQLaRAFkdC4cVgzdfBArIIRtdRl425dr1egb8iAGDQVeAFC+2VmcpAcF7BVfqCKEmO23rCrnKpT6@vger.kernel.org
X-Gm-Message-State: AOJu0YwbJOM/x8HpnJR/e6jIEdTJhRpF61y0sxdwH36EV85BXySlHfBB
	V1Yj2KihmHatBoYBJkB7moNL1hXDuuQ3Lxg3QdeseORM/F+1aSPGHxl+63No3FAUA9ndJZX0L+d
	X
X-Google-Smtp-Source: AGHT+IGP1vWW532uhucbygG3Lp5or8zZuQTeIPnXLHkrmwfWtKfTiCcJOexZfHzCsZL16ncrBwbjCQ==
X-Received: by 2002:a05:6000:402a:b0:37d:5103:8894 with SMTP id ffacd0b85a97d-381f1881319mr12834957f8f.42.1731415922836;
        Tue, 12 Nov 2024 04:52:02 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:94a5:ced7:f64:fdaf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381eda04ad0sm15287346f8f.100.2024.11.12.04.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 04:52:02 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	heiko@sntech.de,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ye Zhang <ye.zhang@rock-chips.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com,
	tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com
Subject: Re: (subset) [PATCH v5 0/4] gpio: rockchip: Update the GPIO driver
Date: Tue, 12 Nov 2024 13:52:01 +0100
Message-ID: <173141591574.57283.303844773378689063.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241112015408.3139996-1-ye.zhang@rock-chips.com>
References: <20241112015408.3139996-1-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 12 Nov 2024 09:54:04 +0800, Ye Zhang wrote:
> GPIO driver support acpi and new version, set input direction in
> irq_request_resources, fix division error and debounce config error.
> 
> Changes since v1:
> - Split commits with multiple changes into separate commits.
> - Adjust backportable fix to the forefront.
> - Modify messages of some commits.
> 
> [...]

Applied, thanks!

[1/4] gpio: rockchip: explan the format of the GPIO version ID
      commit: 591ae6bed250e4067db926313ff7279d23a1c7d1
[2/4] gpio: rockchip: change the GPIO version judgment logic
      commit: 41209307cad7f14c387c68375a93b50e54261a53
[3/4] gpio: rockchip: support new version GPIO
      commit: 8bcbd0379c05c66ce2e842c7e8901aa317cdf04e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

