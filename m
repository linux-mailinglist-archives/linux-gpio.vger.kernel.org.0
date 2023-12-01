Return-Path: <linux-gpio+bounces-827-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E678800B90
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 14:16:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA5D2281A8C
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 13:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44B3D25777;
	Fri,  1 Dec 2023 13:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lm2Dg8hk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34A9CA0;
	Fri,  1 Dec 2023 05:16:23 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40b397793aaso13688305e9.0;
        Fri, 01 Dec 2023 05:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701436581; x=1702041381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Oefvw8vfrlQSt1SiU7MAz2Q9oKRpPY1beWRnn6ETdA=;
        b=Lm2Dg8hkZVwc6mRC3vov3Ip1tRqB171LzdmOvvo72IdehHu6EXvjqeT3Ispg4Gj1hS
         kWGg3ME0e7Hbei17DEcJg2LRY1yS/P3mBWaL4uERRJPX2DXT17n9R8tjQjaGCSiVbKnw
         sSyAwZeCx1FoI8Zzlx8p/tfHuFqRoAevmj4DOd6OMcB+iLtWVJ4YOpWt3haTQiIJM7bQ
         cwjbzirTO1FCanrAWWGRC56bNkwDK5zSo2r8CKTJWO2FNQyyiZQYw+Z+RvxTjU4+6lVN
         VTmYOdFdV/WetyMISDkTtKS3Ir5zUioNsj5O8CL2VEVe2R/sgTH0UvN5EVyIkXxQS2Bm
         crYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701436581; x=1702041381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Oefvw8vfrlQSt1SiU7MAz2Q9oKRpPY1beWRnn6ETdA=;
        b=TVZOgZ5IxBG1uj5tS+okDwROHuwY01+kIGjhjKxNXXGpG8jGAOIqXe0tt/MSQgifac
         dBgSt1edHXUmKrz8fSpAzy0pIsi2X73X6IuzeCmOqoa+FEygUk84FXgBy7U2xvSYosdD
         kgKr7BOxOk3viBJdzVjONKk0EVOpkaaxLCdPqfby7XGme0VR/qfs58r+4bTvkSl0vBaa
         bOpzLYjfoypHgJ3wVz3SJom9B7fbuVo5PRwEQ7HkS3Y8xGRDE7p4Pg+CLF35aBTVVpmX
         UfzxemTB5312Z/hH3Ptf5XBGS3t/pt5yLRlrztgylwXsV28uMNpwX8jp5E4YDx0Fywp0
         CGTQ==
X-Gm-Message-State: AOJu0YzrJATSkfjMz/qawqWv60tud9R7C2HYN4iuOhpquvynTq/TBa1y
	/loGWDM1CDLO7wEvIYnfVsk=
X-Google-Smtp-Source: AGHT+IEHAMpWGDplKBye0RkYxyWg5uIkbLq3Ug6U1LqAC8O2pKq7QhmYO/iPQ1ktZG4tdA77mc2N1w==
X-Received: by 2002:a05:600c:4687:b0:409:6e0e:e95a with SMTP id p7-20020a05600c468700b004096e0ee95amr719556wmo.19.1701436581462;
        Fri, 01 Dec 2023 05:16:21 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2500:a01:3c2e:cd45:f50f:f083])
        by smtp.gmail.com with ESMTPSA id fm21-20020a05600c0c1500b0040b3dbb5c93sm1451723wmb.1.2023.12.01.05.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 05:16:20 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 0/3] Add missing port pins for RZ/Five SoC
Date: Fri,  1 Dec 2023 13:15:48 +0000
Message-Id: <20231201131551.201503-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series intends to incorporate the absent port pins P19 to P28,
which are exclusively available on the RZ/Five SoC.

Cheers,
Prabhakar

v2->v3:
* Fixed build warnings for m68k as reported by Kernel test robot.

RFC -> v2:
* Fixed review comments pointed by Geert & Biju

RFC: https://lore.kernel.org/lkml/20230630120433.49529-3-prabhakar.mahadev-lad.rj@bp.renesas.com/T/

Lad Prabhakar (3):
  pinctrl: renesas: rzg2l: Include pinmap in RZG2L_GPIO_PORT_PACK()
    macro
  pinctrl: renesas: pinctrl-rzg2l: Add the missing port pins P19 to P28
  riscv: dts: renesas: r9a07g043f: Update gpio-ranges property

 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi |   4 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c     | 265 ++++++++++++++++++--
 2 files changed, 243 insertions(+), 26 deletions(-)

-- 
2.34.1


