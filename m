Return-Path: <linux-gpio+bounces-16772-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B38CFA49359
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 09:23:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B62E3B089D
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 08:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C43A2459C5;
	Fri, 28 Feb 2025 08:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N+nGMUUR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CF1242936
	for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 08:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740730964; cv=none; b=jCCFSUhfkm9VLaPKnfLotT0UO4gAKwYm3kFWtPoHGyInl9RW230k1LGkYZuzcM4GARoPDIR0dJqSsBndb7uVHnvhgyE098ZKVoCX90RnU5aAR9V231evNua+aKdyxvTZlD8ydwKQ5FIHipd6wlSYv5UfkXFhOb579aDneZPCsQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740730964; c=relaxed/simple;
	bh=Ei4jUH4UZc7x66tOrHfpI6mKDxIn8M6FEuQlF3nwXp8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WSW/VteEld/KCM6Cu3iW1NFxN93J3W/XcYBoW4mG0f+3lOY+Tt+zbE4wFqV3r1aThp1DzLCO6E1PjwwssanBhdwu/knWJAuNh9S7mgoeiQbt19ibHS1rC7dZjiF8FbJVYOVMcNJk3NxoszifmD9Pbdf3Qjmsu837gdm3byVesw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N+nGMUUR; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4398e839cd4so18306585e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 00:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740730960; x=1741335760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5mjk45jguiUNe+AcHQUbiNYsEpUBPM+3F/r+trzFvSE=;
        b=N+nGMUURT31NAiN4ymY6MzmgHoyQKaIw2xMWPJzpwtZQ0PKWUcbQSgzau20l7MY4oe
         +kyAtFeMEv8PohOxTLDkzgixaHyo4RMxoBvQP7w7XyjeFxHPD2A+ubCKoPMwZET6qV52
         eIuDO2eef38WeHzu1RXzdOyLh9PzqLLjlJ9yygxjbnuLZr3tJhfe0k6piDLMKKR7RNqy
         2nSxV8rT/ULgX7Cf1rM3DHFtlaaxU+3CWq3l0jQH+gVnBLx+e65ZGTK54OZCaNq7VLVM
         sEP/+yJQ3ruAxnF85aE5TPvcOl0D2VoTuMt2XvHBzjgJDUcPt12wwBYP9ZFH//jM14Fu
         fUFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740730960; x=1741335760;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5mjk45jguiUNe+AcHQUbiNYsEpUBPM+3F/r+trzFvSE=;
        b=vxkE/kXo96cQ0qOHoa09cOV4If1Z/RORY5PB7mQuGBJWJzJxRMeRsVj1jDkVOGMCTM
         xxlXiNw723klTqGqoT1zppU7qcLNEXUSLvGdOH3A4gInD8ZUCRWzs2MxCutYViosOoch
         hMA2msV4pqA36Zkms0uI8rC012pRF6pn0vMJyL/VH5/wPKxm94ZT6G6Mdq62b7j+577r
         ishCpFDGv3MKeDcrSRZmn5P7qMVAgNvEUJx1e2f+pKSr6LGPi1xuJIxNkz/9MUG3bwc0
         e4LiP2BVakyyW6bptAEVbNwY1dYWCiWLSI2zs9IvTvHBVhnMnf6rl5/WFochnYQnudeR
         OI0A==
X-Gm-Message-State: AOJu0YxNNveTo8pq2Haw6zpSsiQGE+6jphrYKBCs2RS76TpMCP23Tsc5
	Jd4FRjdYmMaExSAPyKAjDQ19NBVlu6OlVMohJ+Hiiu91myDhKxfK+ZOcbplPxx0yH2+WUTVFpHH
	Z
X-Gm-Gg: ASbGncvT1OHi1N8f3o/AOxF2A84fxJzjRFDN1u/i+2eVJI8L0qAEdAYnOfPUvoxq+sC
	jEYBJwJSj58nZxlxnctaAWNr+BGgGgY7dLE3yfZ5mSJ7pS8ZEe9/ll1idw7pcFr+YVFWPSECWC1
	JeidiN5+GB2ZT478PvnYCcLkqZ3TNlLkGu5jGXJOFsoTDHkSkmayCI3YyckizJ2y0J+qMau2cYU
	siUO/pcJJi+WZ1IHhRyCqIvefzx+mTRmpeRXXeXl5NAQEtiK3abxOmyKizjMpftH1gmfJx99NRV
	efmCOPzbylNt6ZAbbk5hoT2STja3jnn05o7dgxCiMWModH4=
X-Google-Smtp-Source: AGHT+IH038oCeROvQ6tVC86akUZzZeoenUNBH2cva8eK5sDSrImvPU+Z4DWRdw7Bok77rrj1L+R8WQ==
X-Received: by 2002:a05:600c:4f51:b0:43b:4829:8067 with SMTP id 5b1f17b1804b1-43b4829817amr44075105e9.6.1740730960086;
        Fri, 28 Feb 2025 00:22:40 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b737074d8sm48750365e9.16.2025.02.28.00.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 00:22:39 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org
In-Reply-To: <20250212-amlogic-pinctrl-v5-0-282bc2516804@amlogic.com>
References: <20250212-amlogic-pinctrl-v5-0-282bc2516804@amlogic.com>
Subject: Re: (subset) [PATCH v5 0/5] Pinctrl: Add Amlogic pinctrl driver
Message-Id: <174073095934.1139542.13898190567088651391.b4-ty@linaro.org>
Date: Fri, 28 Feb 2025 09:22:39 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

Hi,

On Wed, 12 Feb 2025 13:20:49 +0800, Xianwei Zhao wrote:
> Add pinctrl driver support for Amloigc SoCs
> 
> Base on the previous discussion,
> https://lore.kernel.org/r/20241113-a4_pinctrl-v6-0-35ba2401ee35@amlogic.com
> The existed meson driver failed to meet the requirement of the current dt-binding.
> So we start this new pinctrl driver to solve problem.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.15/arm64-dt)

[4/5] arm64: dts: amlogic: a4: add pinctrl node
      https://git.kernel.org/amlogic/c/ce78f679e08cc4f90db1ad8e61ba9f85530c701e

These changes has been applied on the intermediate git tree [1].

The v6.15/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


