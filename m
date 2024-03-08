Return-Path: <linux-gpio+bounces-4227-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F568765F0
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Mar 2024 15:04:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C35CA281A47
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Mar 2024 14:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DC943FBA9;
	Fri,  8 Mar 2024 14:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YVlP5UDa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751B23FB98
	for <linux-gpio@vger.kernel.org>; Fri,  8 Mar 2024 14:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709906686; cv=none; b=o1CyAl01blyEItoXv/v/Z2yBbV3/0o7cTmSLZNaAl0lKbTi9ujP+esImFFF7A2CV+xppsVkfw6NiEuBLyJ65hT0Yt+eHqp9F4rL2CMU8pYuQ6T3D7hjzlO7HCKXb99jFB29HwRPFrVWUnW0DjNsHj+XQ/EjmIzJToYdU0ME+sb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709906686; c=relaxed/simple;
	bh=EVJwTxvDqw+IEiCysfOqhoGic+/rqF8QAfV8Ym9e5oo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=u9hA90ykiQUWxQHxauFysc7NsvWOBQ0Shl6VLO5a8sCGHDIQpiCF+tTlsC/nTqhIias6GEZKfDVLKu4ewNqeC7IO1hW1u3W8RMiiAThIj7klmgE+dGvtvfePS9onQ0G5GPLgtVN/hIthO4hoQ4YWEmQ0xowWVdiWRW2DOZ8Bhvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YVlP5UDa; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-609fd5fbe50so15077167b3.0
        for <linux-gpio@vger.kernel.org>; Fri, 08 Mar 2024 06:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709906683; x=1710511483; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TkLHfMfEsOU+L3AKSI3LG/yIew94A6XVkKahH9yQT4U=;
        b=YVlP5UDa4OQVB5gSPZOfws156Dfhcx2VynSn1ORBp5fz1z2thfz2IcHnMsI/MgJ4p9
         q/lIhAfXiAVrXpjcQsxehBoywKA93ORY2CgqqQYlvCDoWHqEQWgP9UlxgsPBz24yWI40
         LXnmQf0gw1XtOcb37kf0VTxYxqFLpWXG/nXDRVxSHUCPisB75ol1X45oNTCmD18sydlJ
         WKQWg9WtaYbIEDBzKxOHTJhDdsh2NSwZrIZipg1iDeHJZMq+OXzeVIBajju5OIcTMoPS
         JgpF51H7Kunl34B/DzjKTo9dHcyW73zArAUdQunwc5q1QeC3Jm4qrdXK2B3YGHE78KT6
         KM5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709906683; x=1710511483;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TkLHfMfEsOU+L3AKSI3LG/yIew94A6XVkKahH9yQT4U=;
        b=gDUYY8zVKoxlmseribER+giojTTKcaR1owISTvJIzKtysw0Kb3t0NSyDjlTM3CfKSc
         z3GE0D2qtGeAC9P3bNQpwYbNoKCFzdy2UPdGsKq+2Kul5auwtVYNTEp3Kneu+Zw4NzA0
         apm/of0VwFooENJgVQqHrGUPrBngVgG8HzLMXf+B5rRHJOKkBdS1qJ3kYUY2yH95xoRw
         IlWxIqN+0rT+2tagIelGiuRk8o4f2uQYh9uTe0LgJjAcVNAN2p+7DVECUGB+dJWVoz8i
         TGj0MwjSTbGhGKe5GDcZOuQsGRx9GBPsC965WwpkEH/TnL0bBqASkr0Ab22liR0ehHcw
         1NsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrFax4CYIlJ2kHL86CUDmcTtbw9VRZ8VC83f49G+J7p5QcIJ5TIcvca9imPwaO5DyaSmMGUpC9UXCyZrY24/LKggDd4L9Z4a4rSA==
X-Gm-Message-State: AOJu0YwDD5bkRbwVYwu4pjYFFHK/KEghW01xuRzAPCYQ1SU7bH3pRdOS
	RXpUlXkvB73N/tPDHfiFgLPUUXs7/3soqti90LlMUkuQnjA8KlNxiobYxF1zqNQfoBvRnfBYhSh
	2+PvnG3VaWRH4Bk+4fibPV6G83FA5iZxWmHlIKu6zS51ByTUqQhE=
X-Google-Smtp-Source: AGHT+IHb8DuJ+MCBmvywQxzt1aiUCUBpGGdNLrlJ9KE2Kidw/4BwfrHoN6Bk3R9DkohEzClub9KLa3lyp+MtvOWHvE0=
X-Received: by 2002:a0d:d302:0:b0:608:3960:ed46 with SMTP id
 v2-20020a0dd302000000b006083960ed46mr21482629ywd.37.1709906683460; Fri, 08
 Mar 2024 06:04:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Mar 2024 15:04:32 +0100
Message-ID: <CACRpkdYomV_hSse7tExpQXzuOarC35cqAJoSQPwwwbN0mi81yQ@mail.gmail.com>
Subject: [GIT PULL] late pin control fixes for the v6.8 kernel
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Antonio Borneo <antonio.borneo@foss.st.com>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

here are some two late fixes for pin control.

Details in the signed tag.

Please pull them in!

Yours,
Linus Walleij

The following changes since commit 841c35169323cd833294798e58b9bf63fa4fa1de:

  Linux 6.8-rc4 (2024-02-11 12:18:13 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v6.8-3

for you to fetch changes up to f6443e0177a55f78e94ccc1a43eb63a023a0b6fd:

  pinctrl: don't put the reference to GPIO device in
pinctrl_pins_show() (2024-02-29 14:36:40 +0100)

----------------------------------------------------------------
Two pin control fixes for the v6.8 kernel series:

- Fix the PM suspend callback in the STM32 ST32MP257 driver to
  properly support suspend.

- Drop an extraneous reference put in the debugfs code, this was
  confusing the reference counts and causing unsolicited calls
  to __free().

----------------------------------------------------------------
Antonio Borneo (1):
      pinctrl: stm32: fix PM support for stm32mp257

Bartosz Golaszewski (1):
      pinctrl: don't put the reference to GPIO device in pinctrl_pins_show()

 drivers/pinctrl/core.c                     | 2 +-
 drivers/pinctrl/stm32/pinctrl-stm32mp257.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

