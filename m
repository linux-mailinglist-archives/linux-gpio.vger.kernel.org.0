Return-Path: <linux-gpio+bounces-3112-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8049B84E230
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Feb 2024 14:43:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B567285F53
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Feb 2024 13:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65C1276419;
	Thu,  8 Feb 2024 13:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LDZ+Mlqd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A217376404
	for <linux-gpio@vger.kernel.org>; Thu,  8 Feb 2024 13:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707399828; cv=none; b=PUgL5ZWe3h1gefV9N/0S4pDUezbf58PYpNoyshKSfs9X9oRvQROAcNEhrHe9HM9Bf3uvOakY7K69a/WQ3D/1vdkcdlFxWsf715G0QAt/MB8fSkBKOm0X+ss2/nB7w93vB3P1nsOP/JFLVBVwrTUSWJJOnr9gMzCmOl48yr3vLlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707399828; c=relaxed/simple;
	bh=5jGH/zhV28vDFyUnoLlaSkEyReXanJSvoB7mQZGFOUA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=TlS8WjFasXfMWrY+Sv+QDiQxVuMy+ulT5CUnKai5wnd1NcIazMdDvf9HTJH8nA/pwrO5Hl2z1pktmUzxezScAbn0jqYjWKhrRGPjM/gtErJuRiEK4/q64GqCQVMMnAHlxqgL/BeCqtY+yris5bR60VXmqHcOln3RrYtTyN/lgzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LDZ+Mlqd; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-60492a2593fso17715057b3.2
        for <linux-gpio@vger.kernel.org>; Thu, 08 Feb 2024 05:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707399825; x=1708004625; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4NcmrNXNkTGWmQe8SOOEZ+dOwv4Vtoh8Jt4rx1wAv1g=;
        b=LDZ+MlqdtJpMx+ajyeGLLITx2mWu30MMMLShG3eiL7eGL0QgPD+JAMnvsKMxF6pHt4
         NI0tDlMDqS4ERng2MaAfTHYbwGUexAZ+ZPeMsmD8TA43WEu7hTT7NoIj9D8nEoBZUC+H
         N9ID7ER8gz1KC4tkVHEBg0sKzxbBXUtAj5g7BPyQHLEDzsbFIFIEFJIOvmTt0Zr2V10s
         PUMG9sMU8caVf60vOzOsFCF7w62QcfK9/JMLYhJ2R/oz9qT43dmsiWF1d3GF7sL8DiJ7
         d/hlXsh1Mi8xoBBXM2I06jhtoWX/zYE3UGU/C0Xz2HN0mx6GYmHIUPV27jo483t6L04D
         fPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707399825; x=1708004625;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4NcmrNXNkTGWmQe8SOOEZ+dOwv4Vtoh8Jt4rx1wAv1g=;
        b=K5nUVmCLW2uFxCAdwtn1BuXdBqVVueHKSE+GkESEwfwhjBzDf4NRgM4cFL2IatqT6y
         d/g+71oqbLdyyh5iLlBj1rV+wWWknobjLXeA+5iqNk/b1BM6ep2uTsI0jGRJ6P3j8FUv
         MacUxur4l8qIgoM9SaxeTlDApPsHlmXmTifzBtLmHhAAvtjYjenBXubn1J3RAaFqL14a
         7aOfcqDcl+P4ynct0IZ8o44IQd2b2J5jZgtCemRtUhHQHHoaCFZ8+I8rH5EPQBFx5dgF
         u4ZJjO3nnYetLdXO4wHZIwLAzW9AVefvmCcNUODjarE6wJX4iJg3YwlSMgSHs2UGSA6s
         GGXw==
X-Gm-Message-State: AOJu0YwvyYGV/rvZsyDBbUDmX6/X1eFtOJKAzGxotSrLxs62XBVV3LUW
	TPsK1BTe3AGYH7PkHa98o2br4BdHEX9kcJEMU7r+BWwZ4wTZf6lDG73hm6r1aO+vgZawxXJVuYz
	KWXjGmxS8eh5jSaWS+vNBlAzDtq6Y+TlTaCPT/g==
X-Google-Smtp-Source: AGHT+IGFKj/d4cY5y88BNS7PZ7/pRrzZwWFLGYT/4DFaqfFCX2e9LgPrF1DPY1U7/XN/weDiyZzcB2xSoHzMHRVjcfs=
X-Received: by 2002:a81:9a96:0:b0:602:ce29:8ea with SMTP id
 r144-20020a819a96000000b00602ce2908eamr8563943ywg.4.1707399825553; Thu, 08
 Feb 2024 05:43:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 Feb 2024 14:43:34 +0100
Message-ID: <CACRpkdYy1Y-y8ON2Q1cz56NJzMFx7C-=5PFXeQ_xwem_bWma7Q@mail.gmail.com>
Subject: [GIT PULL] pin control fix for the v6.8 series
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	Mario Limonciello <mario.limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

Thorsten poked me that this pin control fix is urgent as developer
systems are affected, so here it is, affecting a bunch of AMD
laptops as it seems, caused by mismatching IRQ flags.

Details in the signed tag and linked bug reports.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v6.8-2

for you to fetch changes up to 4451e8e8415e4ef48cdc763d66855f8c25fda94c:

  pinctrl: amd: Add IRQF_ONESHOT to the interrupt request (2024-01-31
10:06:07 +0100)

----------------------------------------------------------------
This is a single fix for the AMD driver which affects developer
laptops, the pinctrl/GPIO driver won't probe on some systems.

----------------------------------------------------------------
Mario Limonciello (1):
      pinctrl: amd: Add IRQF_ONESHOT to the interrupt request

 drivers/pinctrl/pinctrl-amd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

