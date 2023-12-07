Return-Path: <linux-gpio+bounces-1075-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B5280815A
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Dec 2023 08:08:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC4A22819C9
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Dec 2023 07:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88EE11428D;
	Thu,  7 Dec 2023 07:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="YQkAT+Nx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7985181
	for <linux-gpio@vger.kernel.org>; Wed,  6 Dec 2023 23:08:01 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-54c5d041c23so723442a12.2
        for <linux-gpio@vger.kernel.org>; Wed, 06 Dec 2023 23:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1701932880; x=1702537680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TVyclZazJvX0BLnaExZFu9C3yH6+5Ao3su3cId334Q4=;
        b=YQkAT+Nxdj3his7EyWpn1VUSiZ7ie8RiRYyZQ4gQKDDZ8OfTB3L/IeHEp/Lbd0LxDu
         Be2zYwp/3MbEjlgeuwDsALXmMr5MebJkB7r80DPjB58ulbuFAvhzToO1KUqhnkvfLjRb
         s1FuZVZp4HKAHR5QMicQlX483eg/y+yApoHpiyIfnZRWcq8cIvak/jeEO3ZCSC/tzEln
         gmSp/ScUAbavTL9nVCZZwJKpDHBTkQFUlK6OZCo6cIzHg5uWgHXJ16N2ePjN6QiTLlHS
         kgrRNRmX9ozJTwmNRRm+GUDtJufuJNIKV1Ns154h1ecEJLdmvPwio7F2OaSangP1Z96D
         6hfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701932880; x=1702537680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TVyclZazJvX0BLnaExZFu9C3yH6+5Ao3su3cId334Q4=;
        b=smqY4jNmbn2OhWYfSQ+u5Ob86vEWHElzTMrJ10Df0K7KWLgG+74cPdZz383Eoz695p
         iYeHifbJbtJo40wSu0DOTtJGyv++aj7ub8Rc5UUZSCpsVqPnAXwbMBnncsKI2UfJfpRX
         Ol35YvNLkg3lWEA1hLDilkEzs4oV7UXjPnIy8+ggUE7wPLk9QRQRPPBzn0uc3sRmoTZY
         avfTqFIQgEUdzyvc+iv+5JPATrwYF5rxwUDDjFBFL+JIaE5A1uGY+++m0l9QCvFCFw4k
         TfGjcpW24CRkBMB8BCF6CQoiOYhO1B9F82La3tC1D7L31nyHavxPF8xwZ8Pjg4P8q5Cw
         T/ZA==
X-Gm-Message-State: AOJu0Yx756jVrK0c9BsUjojyhSnzBnJa4GEV+0LEdCurk63rb/mF/eTS
	+R0+uy6Tg17OdRV+hlVj68PcDA==
X-Google-Smtp-Source: AGHT+IEC0FkV7t0JGk/8vCkIjlrSN99fzjy/K71uEAV88dEq3aC+gkR+brEZ3swbNQIpMT1WiCCaHw==
X-Received: by 2002:a05:6402:176b:b0:54c:4837:9fd8 with SMTP id da11-20020a056402176b00b0054c48379fd8mr565439edb.47.1701932880051;
        Wed, 06 Dec 2023 23:08:00 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.22])
        by smtp.gmail.com with ESMTPSA id b41-20020a509f2c000000b0054cb88a353dsm420818edf.14.2023.12.06.23.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 23:07:59 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linus.walleij@linaro.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	biju.das.jz@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 00/11] renesas: rzg3s: Add support for Ethernet
Date: Thu,  7 Dec 2023 09:06:49 +0200
Message-Id: <20231207070700.4156557-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series adds Ethernet support for Renesas RZ/G3S.
Along with it preparatory cleanups and fixes were included.

Patches 1-2 are clock specific.
Patches 3-7 are pinctrl specific.
Patches 8-11 are device tree specific.

It is expected that patches will be integrated though Geert's tree.

Thank you,
Claudiu Beznea

Changes in v2:
- patches 1/14 and 14/14 from v1 were integrated thus, didn't include
  them in this version
- dropped patch 3/14 "clk: renesas: rzg2l-cpg: Add support for MSTOP"
  from v1 and associated changes; a follow up will be done on it after
  the current series will be accepted
- addressed review comments
- fixed typos in commit title and description
- collected tags
- removed IEN functinality form patch 6/12 and added it in a separate patch
  (patch 7/12)
- patch 11/14] "arm64: renesas: rzg3s-smarc-som: Invert the logic for
  SW_SD2_EN macro from" from v1 was replaced by patch 10/11 in this
  version "arm64: renesas: rzg3s-smarc-som: Use switches' names
  to select on-board functionalities"

Claudiu Beznea (11):
  clk: renesas: rzg2l-cpg: Check reset monitor registers
  clk: renesas: r9a08g045-cpg: Add clock and reset support for ETH0 and
    ETH1
  pinctrl: renesas: rzg2l: Move arg and index in the main function block
  pinctrl: renesas: rzg2l: Add pin configuration support for pinmux
    groups
  pinctrl: renesas: rzg2l: Add support to select power source for
    Ethernet pins
  pinctrl: renesas: rzg2l: Add output enable support
  pinctrl: renesas: rzg2l: Add input enable to the Ethernet pins
  dt-bindings: net: renesas,etheravb: Document RZ/G3S support
  arm64: renesas: r9a08g045: Add the Ethernet nodes
  arm64: renesas: rzg3s-smarc-som: Use switches' names to select
    on-board functionalities
  arm64: dts: renesas: rzg3s-smarc-som: Enable the Ethernet interfaces

 .../bindings/net/renesas,etheravb.yaml        |   1 +
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |  38 ++++
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     | 173 ++++++++++++++++--
 drivers/clk/renesas/r9a08g045-cpg.c           |  10 +
 drivers/clk/renesas/rzg2l-cpg.c               |  59 ++++--
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 164 +++++++++++++++--
 6 files changed, 398 insertions(+), 47 deletions(-)

-- 
2.39.2


