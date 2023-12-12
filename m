Return-Path: <linux-gpio+bounces-1332-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EA880F9FC
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 23:15:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C36A1C20D49
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 22:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9A3164CE3;
	Tue, 12 Dec 2023 22:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cUuFc8yQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AB36AC
	for <linux-gpio@vger.kernel.org>; Tue, 12 Dec 2023 14:15:50 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-5cdc0b3526eso50647027b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 Dec 2023 14:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702419350; x=1703024150; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sesFDYuvisaQAeLJLAlKFp7z3aGtkUSoKH2xPGkQRmE=;
        b=cUuFc8yQvnOMN0kK9NcB9AS1ArV9f3fHHKU0IXuc5stHJHjnFC7g0OtlF2dCxA9MzH
         x2j6+1yQoIbGnicFx04PcjXVsh/RHbE6ewMSNpSZRBJQWB51HM74G7VUsf8RZExiQTXS
         Wi+XNzOJlpWEPZMFBtzIaViMGEEeglvpgz/baK2Jzajqa++yF2RjQQTC+M/5K5m9tdDp
         OKDwKuNfyCmaBbkfR5bvnKsNwrKZAuxrt5ZrdN9mp1F2F0x9geCN3VLI1rfFYxzeSU5d
         /vnY8orNcyWgjZkrCQtUZy7zQKhFRtif2zPvlqv+78aEjk7fwAeAfJ+2uhprEQkxo9EM
         WIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702419350; x=1703024150;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sesFDYuvisaQAeLJLAlKFp7z3aGtkUSoKH2xPGkQRmE=;
        b=TjlF/EWI4feMaqjnRD7Cl6PCQF16R4vGFtfZTgy8FJHbtG+1d45nL/h49FcvyD4fB9
         vXdxxGRr8yaLLrh+Oy6AKPvqnRQyK+fwK5gHfAciKdLQAP8A+xsqHjmpVfhtuqVt3B0g
         bV+lPls+rzb48mXeKhmdSRxSa+QhuibeRrfDLPv88aJEOTIsVIw8mkYhOw7JYijxvCU1
         iXJao7nwZKW1w9LcJo03PL5opB6nqLM3tM5bmItAMgJkxGjdGGXuEZNPuI5+eTzq+f81
         qjiAAm/4+pD0JkWp867eSUW3NhRw/281LmR2TQYqa3jVPA31PpeM7eGYsviSD9NB2UT2
         Pe1g==
X-Gm-Message-State: AOJu0YzYFuLiJ94iraBQy08YsuB+yy79XkG4SWr2AZem9krWos2TzBgV
	XJIocntllVMy0vM0jv/u9O/J4NM1t2E2WQG3wNVBBg==
X-Google-Smtp-Source: AGHT+IGGyJlE32Nn0xvD8pTWqNKXufszc7hVjv2yNNUS0YVajqTHhbf2kFuywehaBgET5yUsVEcXfOU4GbPchRYGqZM=
X-Received: by 2002:a0d:dc07:0:b0:5d3:66ad:f8f6 with SMTP id
 f7-20020a0ddc07000000b005d366adf8f6mr5195337ywe.24.1702419349823; Tue, 12 Dec
 2023 14:15:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128132534.258459-1-herve.codina@bootlin.com>
In-Reply-To: <20231128132534.258459-1-herve.codina@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 12 Dec 2023 23:15:38 +0100
Message-ID: <CACRpkdYT1J7noFUhObFgfA60XQAfL4rb=knEmWS__TKKtCMh7Q@mail.gmail.com>
Subject: Re: [PATCH 0/5] Add support for framer infrastructure and PEF2256 framer
To: Herve Codina <herve.codina@bootlin.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

Hi Herve, Jakub, Mark,

here is an immutable tag for the PEF2256 framer, as promised.

I have already merged it into the pinctrl tree for starters.

Yours,
Linus Walleij

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pef2256-framer

for you to fetch changes up to 1e95d20ae8e6a383b4c1dd2282e5259790724037:

  MAINTAINERS: Add the Lantiq PEF2256 driver entry (2023-12-12 23:05:25 +0100)

----------------------------------------------------------------
Immutable tag for the PEF2256 framer

----------------------------------------------------------------
Herve Codina (5):
      net: wan: Add framer framework support
      dt-bindings: net: Add the Lantiq PEF2256 E1/T1/J1 framer
      net: wan: framer: Add support for the Lantiq PEF2256 framer
      pinctrl: Add support for the Lantic PEF2256 pinmux
      MAINTAINERS: Add the Lantiq PEF2256 driver entry

 .../devicetree/bindings/net/lantiq,pef2256.yaml    | 213 +++++
 MAINTAINERS                                        |   8 +
 drivers/net/wan/Kconfig                            |   2 +
 drivers/net/wan/Makefile                           |   2 +
 drivers/net/wan/framer/Kconfig                     |  42 +
 drivers/net/wan/framer/Makefile                    |   7 +
 drivers/net/wan/framer/framer-core.c               | 882 +++++++++++++++++++++
 drivers/net/wan/framer/pef2256/Makefile            |   8 +
 drivers/net/wan/framer/pef2256/pef2256-regs.h      | 250 ++++++
 drivers/net/wan/framer/pef2256/pef2256.c           | 880 ++++++++++++++++++++
 drivers/pinctrl/Kconfig                            |  15 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-pef2256.c                  | 358 +++++++++
 include/linux/framer/framer-provider.h             | 194 +++++
 include/linux/framer/framer.h                      | 205 +++++
 include/linux/framer/pef2256.h                     |  31 +
 16 files changed, 3098 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/lantiq,pef2256.yaml
 create mode 100644 drivers/net/wan/framer/Kconfig
 create mode 100644 drivers/net/wan/framer/Makefile
 create mode 100644 drivers/net/wan/framer/framer-core.c
 create mode 100644 drivers/net/wan/framer/pef2256/Makefile
 create mode 100644 drivers/net/wan/framer/pef2256/pef2256-regs.h
 create mode 100644 drivers/net/wan/framer/pef2256/pef2256.c
 create mode 100644 drivers/pinctrl/pinctrl-pef2256.c
 create mode 100644 include/linux/framer/framer-provider.h
 create mode 100644 include/linux/framer/framer.h
 create mode 100644 include/linux/framer/pef2256.h

