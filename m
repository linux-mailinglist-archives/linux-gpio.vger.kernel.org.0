Return-Path: <linux-gpio+bounces-958-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D14080322C
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 13:08:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D6A71F20FB2
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 12:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7766B2375B;
	Mon,  4 Dec 2023 12:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hbbvKPKp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9E8AFE
	for <linux-gpio@vger.kernel.org>; Mon,  4 Dec 2023 04:08:47 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6d8d28e4bbeso924193a34.3
        for <linux-gpio@vger.kernel.org>; Mon, 04 Dec 2023 04:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701691727; x=1702296527; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IAe9GaCJ0H5vY1B6g7SXdKDaasEFIEo0v3Vb6EsU02M=;
        b=hbbvKPKpKMeBxZJRrYw5ZC4METKpBkGd3y9IHK4Sqc3ohdwfV/BRaSWuAaV3B+PUTs
         DuAKw4npdBh8X1Qo30EFXMbPaoc/d4iuMW7K/o6tlQcspx8klUIebUGH7tr5fUcwFMBr
         3qsPHNsJ5rmjsPtR+ug4DC1AkvfcZePkaAgJj6xUF0vgWPNO79f03ZOj9IO3krSWtvnf
         8PpPFE9GwJgIW68YiGt/UG5uD99LKF+hRTtGfXoKdNYrPYkGzEct9FqrAwCFF1v8POyu
         3Ik2v/rVKrwfd4Lg8RqxfUr4Dn217aM81MaGKT49/7sm/BW1llKwj3Y6nys8YcOTUUnO
         GNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701691727; x=1702296527;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IAe9GaCJ0H5vY1B6g7SXdKDaasEFIEo0v3Vb6EsU02M=;
        b=WaNjoraM7jSSLneSfImo0iH3TUV9XBekIuuhLynmbh84X+5xmyO78nnYWuzWvQqRtx
         GcLI6Sv8WbbJTxZF9TFXWU20QRWUEEFXdN0vui4/jzLqgi/JRMNbd5z+fXQ+fiQbem9X
         /7+Hb49KRwPE+g8ab1K4kIDhR2ltWQouOJu48HGDFndNTAhnEj8UtQZ/PYUp/8yxYUeZ
         UjScOHJ5LK2vPoukf0riP5+ay8raZq8f/QfkNBGa+am8JDU9zxLnxZDAhobSBWfsQck/
         myrYiJBty81RWVPivqpBG+ykj8C84QB+Gz2dh4mZ56vbMIuxRFySl8P99DpdT3eNXW67
         9bjw==
X-Gm-Message-State: AOJu0YyM29ONAcshmAYv+ZCNYSjfW+ZtBREAK3eXrceaiV8+4EeNXU0o
	f3Q6kXvwWGM92ATTtq5IR5tPizrKGKYFoqUScH7ISA==
X-Google-Smtp-Source: AGHT+IGpxhG9ncEHtpz4tZmgtmPIk7IOrxR6wBSf/VSlVIlLP3HqVCGl9n1/Gfb0hG0y3KjTRRQ8IEEqRzi+yhZ9cYg=
X-Received: by 2002:a9d:75cc:0:b0:6d9:9e2f:e743 with SMTP id
 c12-20020a9d75cc000000b006d99e2fe743mr1360919otl.16.1701691727048; Mon, 04
 Dec 2023 04:08:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 4 Dec 2023 17:38:36 +0530
Message-ID: <CA+G9fYs1g2Pt=DQeaJC+3ZJTeMwKAs9GuGJ9k6BcwKwEXcn5kQ@mail.gmail.com>
Subject: arm: gcc-8: drivers/pinctrl/mediatek/../core.h:211:21: error:
 initializer element is not constant (struct group_desc)
To: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, 
	"moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, sean.wang@kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Russell King - ARM Linux <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"

Following build errors noticed on Linux next-20231204 tag with gcc-8 toolchain
for arm and arm64.

## Test Regressions (compared to next-20231201)
* arm, build
  - gcc-8-defconfig

* arm64, build
  - gcc-8-defconfig

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log arm and arm64:
------------
In file included from drivers/pinctrl/mediatek/pinctrl-moore.h:21,
                 from drivers/pinctrl/mediatek/pinctrl-mt7623.c:11:
drivers/pinctrl/mediatek/../core.h:211:21: error: initializer element
is not constant
 (struct group_desc) {      \
                     ^

Links:
- https://storage.tuxsuite.com/public/linaro/lkft/builds/2Z43zPIMN6vxVKd9rKJFdOKXpox/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231204/testrun/21472198/suite/build/test/gcc-8-defconfig/details/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231204/testrun/21472585/suite/build/test/gcc-8-defconfig/details/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231204/testrun/21472800/suite/build/test/gcc-8-defconfig/history/

Steps to reproduce:
---------------
# tuxmake --runtime podman --target-arch arm64 --toolchain gcc-8
--kconfig defconfig



--
Linaro LKFT
https://lkft.linaro.org

