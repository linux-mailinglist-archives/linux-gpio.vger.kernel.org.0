Return-Path: <linux-gpio+bounces-25193-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3318FB3B8FC
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 12:37:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02559364D67
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 10:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71B423093D2;
	Fri, 29 Aug 2025 10:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="EZhcrnJM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AF51DF256
	for <linux-gpio@vger.kernel.org>; Fri, 29 Aug 2025 10:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756463826; cv=none; b=cr7z7ABY4zOLXj6KQvERyA7iJ843sxm5UsqzGEr/n2ZKITtXAdxXLWTehAteqycVjmjX3LVRB83ZqCsc2lKRkhwkWEqfdlbCypA2frvuKAE1mjQP+i0ltGxKfd5P72QisSyErISP4Jn2sHUeZTJViLAoSasdYbhPNDUgOGv5StM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756463826; c=relaxed/simple;
	bh=ht6WBgAyA95EiKx1XQ4SunluUCT71doNEKHyo7TqvdM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=eSGSYpkQRpMZq4dFNgOGxlszcS1nrif3ZgrmMtt+dBQxVACwM1gkgPnlM1V2P4j6RuS5/dRCjF15rOzusxZesugSkiDt0Qe5BaRn31lHjlfq+OMGPC+k7lsfPB5jhPtP6Q2JHF71ecxnri2xEJC5vIIFWP1QPgpe8XQUz1ccNVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=EZhcrnJM; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-afcb78f5df4so328855266b.1
        for <linux-gpio@vger.kernel.org>; Fri, 29 Aug 2025 03:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1756463822; x=1757068622; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ht6WBgAyA95EiKx1XQ4SunluUCT71doNEKHyo7TqvdM=;
        b=EZhcrnJMPtjazKT1WNyRdMe0gIKYoH4pgR1uUPsMrQR0NBn0URI8jGDSa12b9SPpT9
         mzA59I7wH5VFcU22JZ6VpavlqORvB6nhOVyFaz160XxaZGHuCARxOktc/utaiobf3hQj
         7hdeNt664QeYcjEEt1dm0SOHoW9B9HcO9WbooTETW7HFmdlrcClEnVmhW1m6VQJOVHwW
         R1tXRP92lFcZ2qJvZc++Jna7kCKpmVJiPyXZqSj0sAU8Xj5kfh+q3DY2XOZBeAwOJsBi
         4yeRwPCRReYZ5cV+5OItvWqfqP/jMfPLm/OqjVj90RaoDdXc6HhUJ/H/RiE6ELYFvpaI
         AC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756463822; x=1757068622;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ht6WBgAyA95EiKx1XQ4SunluUCT71doNEKHyo7TqvdM=;
        b=KsUnKxPqZv0QBwmrHNAud/sNGTg5R0kuIXXrlV+YJgPG6MwvmgEU3SHbtEK9GY4JeV
         lc+uIQZ7fQLJR/guyE8PkaVXNJlSuEyD4YlVDutQe2b3FZG1bhgJ5WtFOPPH063rKCvZ
         SuXPq9BCxL0TOKqS1vRX51JdlEZ5xL72X7mXPY1nfWbcRl5wXJD7Goqhsg8aTEcNprCX
         IFI7bkBVLXJ9lVXGz05loKOX+6ybaDKJNfwat53X9TYvZqt8sM53Q2Red0TvAgVKIa3Z
         9wbZ4S9n3Yn+OM79kdzj6QRuPMZ+JGcSG4FFxgIKnSTbUE/mMeJ3bkuOcImcB3+HtdBJ
         lcAg==
X-Gm-Message-State: AOJu0YzHqF1fUR/kB9HS6NTwrLgWyTrlEjZ1ZUdWm9O4CN73IW0uXQ0v
	UjMNnOZgNeb19N/YKIrQ2UeFZFWkOanNGkcndL1ISyQ56EikC0lqUaoLrcLonOkNFccxPYnap5S
	sKcyIfHE2WV64fRvnW3ihvh0ZlFXuSvCXjOS8JkgHBg==
X-Gm-Gg: ASbGncsndzREWhGwvb8kuuyQmmyxN7CJXOlIES2CgvRc7+LcHNmv83c8CLc+XvMsCkR
	zAWNcxDLVOhQQupQETCaWFRk0S1gNx3OGvkageg/YkUqVrMugxz3cClKFfKQkRhyaB+Fctv1rlr
	Ft9wo7FsjsQpklHSFuKQXAJ/wHSQSp3KREPlkD++sNXkNsoNny3UvsgjjHYeAV9P6KAGsSy+0+p
	hJj30QpE8E72PIqwakXwbwmAMJE0h7qmNu4+heLpWnxQfrayA==
X-Google-Smtp-Source: AGHT+IFJ+Jql9GTRMLxlWZHn7QjRxggZgajkeOxoiMobrLO8cg89kqcVxj2q/e0SSzk+iXh7lkPI7os/QvbDscIIFvM=
X-Received: by 2002:a17:906:6a1f:b0:ae6:f087:953 with SMTP id
 a640c23a62f3a-afe28f8581cmr2645873166b.12.1756463822326; Fri, 29 Aug 2025
 03:37:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Phil Elwell <phil@raspberrypi.com>
Date: Fri, 29 Aug 2025 11:36:49 +0100
X-Gm-Features: Ac12FXxDx_q65zV0RpYvhwxDqgb7j9X7N2Dd3p_rpz4w55Ux_u5snovoEr7Jb38
Message-ID: <CAMEGJJ06_3bgiWfPjQy3JRgtzq5vcr4FgR9JrzTFrGKOxTe52A@mail.gmail.com>
Subject: pinctrl, probe order, and CONFIG_MODULES
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>
Cc: linux-gpio@vger.kernel.org, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

A Raspberry Pi user recently asked us why I2C wasn't working in their
custom kernel build. The primary change they had made was to trim the
number of enabled drivers, make them all built-in, and to remove
CONFIG_MODULES=y. The end result of this is that the pin muxing
required for I2C to work was not being applied, leaving the interface
talking to thin air.

I eventually traced the failure back to this change:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/pinctrl/devicetree.c?h=next-20250829&id=d19c5e79d46efdf89306be99f3c8824cf58e35f6
It introduces a requirement for CONFIG_MODULES to be enabled in order
to get an EPROBE_DEFER in the event that the pinctrl driver has not
yet been probed. Without CONFIG_MODULES, the pinctrl requirements are
waived. Removing the IS_ENABLED(CONFIG_MODULES) clause allows the
probing of the I2C driver to be deferred, fixing the user's problem.

Is this requirement for supporting modules reasonable? If so, how is
one supposed to get the pinctrl to probe before the I2C driver?

Thanks,

Phil Elwell

