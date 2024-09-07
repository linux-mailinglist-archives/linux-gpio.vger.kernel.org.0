Return-Path: <linux-gpio+bounces-9900-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DECC970080
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Sep 2024 08:58:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90FE31C21425
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Sep 2024 06:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CE8814884C;
	Sat,  7 Sep 2024 06:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nHWWcqsZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EB03EA71
	for <linux-gpio@vger.kernel.org>; Sat,  7 Sep 2024 06:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725692332; cv=none; b=CZU0tJxIsGAXdSvinx/w1xkTXm/6Y/qm08fIriBllq/rHzvkEfHcEuRV3wgP15U/DQPh9w096pznHtmvlNuTbKjo/syfYQA2YnGSubYZHX+9No2PBfF0eV3XUzi3kZj3JW9HcctrichEXaHCq9JvhCcPebJOXVqnXQZmXkE+wwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725692332; c=relaxed/simple;
	bh=rgaGjgEabV2AZI1mYeylbTN9fxh/1IY0+yKdiZ9hXl0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=roNJfGq7m+GWrChyMNmH/8o5sL3PT+Zs8TaVK15Q2Pt382JW1kMuPkRd8D1WJP0YXoXOhxd7b891irFWCQc3vzrqSFoUUgYJldx8KCLn0dI5b6nTrN/YXebvkmeffdvi4zIdU5ChNtPim/y5EB9W9NGz/FPIuLyQkW8Q+iCXkrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nHWWcqsZ; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f75a81b6d5so4275461fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 06 Sep 2024 23:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725692329; x=1726297129; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PPG/uD8SZZ9HQeRTUezsbbELYqqE6wi9aZnU/g/IvvY=;
        b=nHWWcqsZymLeX5Ll11Prcgms18hFO7Z8ON0f2fwdjFLRWuJckNr7UNIqGVkpN0oCsL
         waJL7aLYTczvAvDMCNgKYvPdd6gEpwfh/ecQj7cAXaeVO5m1gxRePjnR3DhWZJkSJIkM
         +KcwYs38Uod8jM4CC4QsbQ7SuRgDjEStY7tLdO6KpmbGBymGkXuPJ/LKY1mMjuGOHMst
         UvV1H2ao+gWjakl0r4p79YW1M2z4rsR+q1jsabPiVmHb+FCr6dyauWEuVu+V2g2YHpY2
         /5TPkXhvS4A3r0YcxGiLefQBK6rqZXXl5HwqNcHsU7irNviX3SzBNl2pnpoFFQ9m4OyI
         bXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725692329; x=1726297129;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PPG/uD8SZZ9HQeRTUezsbbELYqqE6wi9aZnU/g/IvvY=;
        b=RVNN2EKR8YU3DW2rw0RbkEdkKG3qB23eClYpebanA/I9IPm5fORW4fppb1NB5Ax1pX
         ZPho7bNk69zrU/wGqU7Nl6Zog1cWaPBxNLsmlTh1rV7YzmQPEwA62+X6UKV+MQUE6Eq+
         3Fjy+XnlsnhlWwKdEqK2pFuMMUrhTLOZexCF+ZE4Exm1aph6ejRjDaaoizzIi5tb+kmq
         a2GHwwAzctgs5CKG0yrnRVN5Clc0A+60ByYA92WCX7AESEm4B4UTJpZ6BecYG42S537s
         IQ3fT9L91nIr0KOad54U8qxrbT4okCexQKvBVZXZzpnmo/JlCEHbNi179ic01PiduUib
         qV5Q==
X-Gm-Message-State: AOJu0Yw5bPrn2HXfr0ZEFur908PfXuZOlH8SGZoh7YF+CS1YjTkumb0e
	5521O1mE/+vROavImT3yOc5iFb1OX1QUYtinNF1cnsusUBHc+IRKbuRXcJO3gLYqPgI2oVMxgGm
	MLbWiac9VSiW6AA3tGXPCBMjUjetNrEHlityJ0tO5CboPdjYCpiM=
X-Google-Smtp-Source: AGHT+IGv5vE7FDTgdRe1M+YXuq3EjLJ8f7JAA0CMbIA7imH5TdPdPm87UXNbt5jLrgHXzb+2dRUXPtMD1uL0F53zgSw=
X-Received: by 2002:a05:651c:b20:b0:2f3:f39f:3719 with SMTP id
 38308e7fff4ca-2f751f5d783mr27611151fa.29.1725692327975; Fri, 06 Sep 2024
 23:58:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 7 Sep 2024 08:58:36 +0200
Message-ID: <CACRpkdb130FuEhKC2M6Ge42-sMDnKE04LGFv6uyAAUEvKXWyUA@mail.gmail.com>
Subject: [GIT PULL] pin control fix for v6.11
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

I have this critical Qualcomm fix pending so sending it to
you.

Please pull it in, the signed tag and commit itself describes
the issue.

Yours,
Linus Walleij


The following changes since commit 431c1646e1f86b949fa3685efc50b660a364c2b6:

  Linux 6.11-rc6 (2024-09-01 19:46:02 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v6.11-3

for you to fetch changes up to 602cb14e310a7a32c4f27d1f16c4614c790c7f6f:

  pinctrl: qcom: x1e80100: Bypass PDC wakeup parent for now
(2024-09-02 11:07:48 +0200)

----------------------------------------------------------------
A single fix for Qualcomm laptops that are affected by
missing wakeup IRQs.

----------------------------------------------------------------
Stephan Gerhold (1):
      pinctrl: qcom: x1e80100: Bypass PDC wakeup parent for now

 drivers/pinctrl/qcom/pinctrl-x1e80100.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

