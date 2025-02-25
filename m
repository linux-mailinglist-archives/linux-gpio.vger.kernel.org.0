Return-Path: <linux-gpio+bounces-16583-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E50B1A44B9A
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 20:41:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8475519C4B7D
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 19:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D78D2046B1;
	Tue, 25 Feb 2025 19:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vzTsfbJc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2780A1DFD89
	for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2025 19:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740512438; cv=none; b=gu9JG/fideP/KEA3Yd+oY1aMF2SWxtS0C17cYih8DeAoyNtuBzntk2TC1+xmOmd36C8DaHzoDT+1cuxKH/9pUJahLWoNSNZd7j74YAgxjltVZPPMtLQgHYV4kpX8FE64UsH2LJ4Jl4AUWpMSkUGmeK3LRlPZzT7KdbkTh5yvkN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740512438; c=relaxed/simple;
	bh=RBlI1QxxEa2sONjuWC3d57276G9VRwAmioAIKrS0KIk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kI0tXQblDGgVPd2K/20LaqKct11Tz/rojQPwL9BO1xRL8k4ExSS9PtezYwjdXo6gBNiCkyVbqXmHBYS1h7UUxoZvqogp8pZNceq9l3e70i0sD0tICVTR4/fxemciw6/jZj/bp5g68/kW2fNFO7fFupP4Q5ChKKSQNc71Ttic0bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vzTsfbJc; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54843052bcdso3202347e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2025 11:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740512435; x=1741117235; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gc3yrP08X6o+j70NlAwTdjSLQfHMGG7D13uEieUEDXk=;
        b=vzTsfbJcGY2yMlQwe8S3AfvoThcKjjd/pU/1k8gjwTjYi1gTYGljHVHnGSO7Aw+neC
         UNIOz/eMdHmEuOxJnYM/GCypSHrj24KXxjvF6wsfS8jxifOWNkP97NgFqrnz3t7rxjF6
         5cIzTsBtPfF/x0Nt+G2DTGkj4EDjvm7aCZNGKzEazdT0+xQSN1U0nujn35V2yiEy7Yah
         yMzL9ZjtLXAotPJCL/fxAUoCSk2wcLQqLbJs6FlvR+pkbiq55ULhwyNGOp/wRs8vxbux
         IH8nLtRFygwTzXiGle+uOpZuS3KeaGu8eLflb2L2DMbrcJ+X80WQRyE8tuqTa15No1Q0
         Riiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740512435; x=1741117235;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gc3yrP08X6o+j70NlAwTdjSLQfHMGG7D13uEieUEDXk=;
        b=Tf4h73MQ4Dk+4x6dndko3QsJ+P38tjpSEsFHr0VZSfp1ixfHBcoZY7eddzMKEYF/bB
         5TxA3pT/CIZZOKBbahAba80G9ix66iT4CVXBrvoVjqr50DMXbpNTdwGW51uq0a/zFys+
         D81y6GDgSEe6yeNAHzgUZOC52ZfzQD5CsBtvU86Zvw+4Fp2M3M1+eD2GEmXDjyDl4GQ2
         dmm/M/AUeud1rdE+dKF9vn/Hz6vAQQfvXCdZR1480E4y6nV9cyVPSeA7kMtKZGpSH04e
         RFGdpqgV9L9Y2LteXr+Lur28peHbpmZmkC2BGBwHrdOdk3wNVCGg7/evXSSwB4VWE8gk
         kNkw==
X-Forwarded-Encrypted: i=1; AJvYcCVhKjlaQiqUnzy2uRgNXSJ99X58wr9jSsZrcHVnekaj+XkCBvEblcupnQwmcXLbrfzrBO2n2+gJtqQg@vger.kernel.org
X-Gm-Message-State: AOJu0YxbWMLTkonUD7pa9AbHCPudsms54sGXkj+iWZcUFeT9cOSqCwPF
	jyZ1R2dnX5ieB9rDDH/BX7bhE09leZNw9jdJjlSwTmPxJK9VatzC5SZrCWINisnwEzmkw24gFll
	P
X-Gm-Gg: ASbGncuBlrOs8z9ypjZTXV88lV94Tow+ju+YISNdpjnKdz/Xra1cB9uPaNsX5T5F3fe
	bdHZtQzkiHFYhYlbup2gGGjmwe0HD4Gex8HBphn/Q3LZGTtIqvXy7c8RidGM7gJWmq2O5d8iTnu
	of227ub3h2URaUMs41w/eRXd9iq14a0MIjqCe4gtI24lYPbhUc8kbLiFh4dHYATewhtzNmeDMbB
	sh6Y+XB0IvBSmqr87uc2esFox4mWtm6QuI9DX5YKjviKIf6ubToYV5USRYhzhHTdGP3HSXzqErg
	lbXQPxLLxRAs+5baRkY0AqftvrcZx90SQ6Pi
X-Google-Smtp-Source: AGHT+IHWdyyvsqMXGGR3TXOa3v3kkjgRAOp2A13K9Nw7J7+E85V2nPO4x2qcS3cHyLMw0HjxiwRy4w==
X-Received: by 2002:a05:6512:3f28:b0:545:b49:f96d with SMTP id 2adb3069b0e04-548510712admr2889633e87.0.1740512435083;
        Tue, 25 Feb 2025 11:40:35 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a818164e2sm3089721fa.0.2025.02.25.11.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 11:40:34 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v3 0/2] gpiolib: of: Handle threecell gpios
Date: Tue, 25 Feb 2025 20:40:32 +0100
Message-Id: <20250225-gpio-ranges-fourcell-v3-0-860382ba4713@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALAcvmcC/3XNwQqDMAyA4VeRntfRVtR0p73H2KHaVgNiJd3Kh
 vjuq8Jgg+34J+TLwqIjdJGdioWRSxgxTDnKQ8G6wUy942hzMyVUJZRseD9j4LRtIvfhTp0bRw4
 VABirpLaG5dOZnMfHzl6uuQeMt0DP/UuS2/QNwm8wSS54K31p27oDUdbnESdD4RioZ5uY1Ieiq
 j+KygpYo7UGb3Tzrazr+gKE1l9v/wAAAA==
X-Change-ID: 20250217-gpio-ranges-fourcell-85888ad219da
To: Yixun Lan <dlan@gentoo.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>, Alex Elder <elder@riscstar.com>
X-Mailer: b4 0.14.2

This adds some code in the gpiolib OF core to deal with
several gpio chip instances per OF node.

The change was prompted by the need of the Spacemit GPIO
controller.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v3:
- Bail out of the twocell translation function if cells != 2
- Link to v2: https://lore.kernel.org/r/20250225-gpio-ranges-fourcell-v2-0-8da9998fa976@linaro.org

Changes in v2:
- Fix a speling error in first patch.
- Fix coding errors and documentation errors in second patch.
- Collected review tags.
- Drop RFT tag, this is for applying.
- Link to v1: https://lore.kernel.org/r/20250218-gpio-ranges-fourcell-v1-0-b1f3db6c8036@linaro.org

---
Linus Walleij (2):
      gpiolib: of: Use local variables
      gpiolib: of: Handle threecell GPIO chips

 drivers/gpio/gpiolib-of.c   | 128 +++++++++++++++++++++++++++++++++++---------
 include/linux/gpio/driver.h |  24 ++++++++-
 2 files changed, 127 insertions(+), 25 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250217-gpio-ranges-fourcell-85888ad219da

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


