Return-Path: <linux-gpio+bounces-1943-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 455A9820985
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Dec 2023 03:05:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 792F11C21530
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Dec 2023 02:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D2C8A41;
	Sun, 31 Dec 2023 02:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RQLxbsa9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841D57F7
	for <linux-gpio@vger.kernel.org>; Sun, 31 Dec 2023 02:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2cca5d81826so90796451fa.2
        for <linux-gpio@vger.kernel.org>; Sat, 30 Dec 2023 18:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703988317; x=1704593117; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bg9T7VBHq20PDl6so8Y3JRTVg5+hHGkKCA2CIVlOqIE=;
        b=RQLxbsa97HQtwOJ5JD6gsjbD2sV7r4UsPLbX+pS4qhBHipn9p0ZPYfgAYjkRuSI9DZ
         L14VITKPk0n871hVqimsHbjMrEzWHCEye3+lGWlY8eAzP/Iq2NMBg73gihE/8Pb1EAzq
         8AHR2H+PBnrPOrpP53vrAo7FuwkjqStR6TaTPvxjFzllh5tDbANbXz6AWJ3p2fAqnuu8
         jYkv+N8Oehmf8LVehgoRzFYm0+xz7ZFwb4EQzb6mWfFOJ7GyXU7ufX1Wi8q+ZtQxhEkf
         7QsFO/D0e9MNRLX16mL9mNKJ5ZTnfGciNws0jURO/jPFRzFvA3fsLRydTr6O5Si+phPT
         WImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703988317; x=1704593117;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bg9T7VBHq20PDl6so8Y3JRTVg5+hHGkKCA2CIVlOqIE=;
        b=AFjAmzLLFwwe69oRhAXu4QD5l7tv8TZ4tdsFxQDQZO63SgGQkYzaUrdFIzF/8BYhHM
         BVDOyjT96n29Pkqsf4fF+shd7iEinbBk1IDRl552UqFs1/YZWHLxouOSsLw9iHBPgumG
         2/g/clZzGgHgtbyCItxCObza3YOc4sBTkM/Bq19GTRfCOIXutzD0nBuD7I9s2GvZn4Yv
         JV28g7bZMV57SIGPlujoHRHRIX578/1TMlsvYR/l8UbLHwzyMc/iAyTyYK5oUe4Eu2le
         4LCnENFozefnfpa6vVz/Brz3yRZwRT11KGvlyONUqY9mVfvjfvi4CuaYjwqf04RzggJZ
         swGQ==
X-Gm-Message-State: AOJu0Yyiz9udeNhIeWeoRKnbTeTnR21MYjLFL2DpDU5h0ZfrbQbvBiuk
	inA2jmM69ghCO6yITpCRsFtlZfxbXdB9DwBzlH0SLQaf
X-Google-Smtp-Source: AGHT+IHMd+m8jz01bMoqxVPtjejYD1601Py6Z2ifaJsyXZPwMtwnYio2xwBJoYk3+jB7avrnAdhX+bBM7FHbUEvYOwA=
X-Received: by 2002:a05:651c:1a10:b0:2cc:cbc3:9de4 with SMTP id
 by16-20020a05651c1a1000b002cccbc39de4mr5410270ljb.50.1703988316987; Sat, 30
 Dec 2023 18:05:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Seamus de Mora <seamusdemora@gmail.com>
Date: Sat, 30 Dec 2023 20:04:40 -0600
Message-ID: <CAJ8C1XMpDFFTf6W_YW5EZM4Qok+=O9oOvGudUaxh8zQ-nE2iEg@mail.gmail.com>
Subject: [libgpiod] Documentation question
To: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

I read a description of libgpiod recently that I cannot find... (my
well-organized reference catalogs have failed me  :) I'm hoping
someone here can help me.

The documentation I read made a point about libgpiod restricting
itself to GPIO; i.e. not I2C, SPI, PWM and a host of other specialized
GPIO interfaces.

I thought it was in the libgpiod README, but it's not. Any ideas on
where I might find this?

Thanks,
~S

