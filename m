Return-Path: <linux-gpio+bounces-6965-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8078D512D
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 19:41:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51EA91F2322D
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 17:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69134482D7;
	Thu, 30 May 2024 17:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qzq7Py3N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E934AEFD;
	Thu, 30 May 2024 17:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717090903; cv=none; b=c4FBXHpuZYdE/nHj7VotXQPwyKKFEXSy+an7+QEfkOJ2WcJikDLUfVbTX6T1r1Lcjpg0/dUj68M69DftG3IUY5Yuf/Ow2XhTWcFQ+3a1iHOk6lc+rR0FnBHWTxcpjoPR36o8kVkMWgIIqnQt9NqWMIJWxyFHfu2qlUNBo0KeZ0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717090903; c=relaxed/simple;
	bh=J5HoT6wvLCEP6PKrxjLxadfzILQKD5XkS7lncw08i3o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rAPbnZQem1UayBmBDWkcZiDN/8VLfcpf0bEEEVhExaHqES52wGCBhXAbRmoEWR2YrL7tFMj0a6Scls7lgPRSUiBgss2iJxYhspgT+LTuVa9bTQJuRlVE9wtE6p0171aHErSkEsrgKW00yoQC8oDvDSYwuPWirYU48LE9lBUbEjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qzq7Py3N; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1f62217f806so7246765ad.2;
        Thu, 30 May 2024 10:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717090901; x=1717695701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m/ota4vn2GS8aqgXje2STBimgM+Hm93FTRCKMqODBkA=;
        b=Qzq7Py3NyH1N6ugUBy/k45yVvskWtppUUHAxDsRWfFWwZVaIQCyFJgjTgZl0WGV51o
         TK5d/GBDpPGJs4JW7MhxWn9/Qjm9ZARsWrIlvMQ3HadOPunpMeASrj3Y0/0b9aJUJh+h
         HkFFjs3EJpQfPuRk2bPo0Wbh3CxxaB4LkMIhuskyTtXM8ZmG7pb4tpKagTtfUsMgzmPa
         dIZ+rd6Mu7BJoO2/+obI2rxBnjhDVj1WvQMvnRAkq5DSzVhwPu7oxrHsGoZCjJ1LKmL3
         1ax4XyjP9EyuYI/7QMZMLuHwxK5vhB0pmqCXPuagcXLyhx6fMMKRr4cwfArWxczWwm6x
         y9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717090901; x=1717695701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m/ota4vn2GS8aqgXje2STBimgM+Hm93FTRCKMqODBkA=;
        b=i8DO3hTWeV1iFmWmyvYJMov4M+dYTYIcTFSbWZdtvag+uf8HOChfoMaa88E6d8huYF
         qZ/3VblfsNcEDflsAac2NJ+HJZqwXbbem4bXotihCQnOg3dhF66nCYfIltN/vY1X/Y3u
         GxiSnK8wNSdG9gkvzCN8BvAGEhxfu0FgZV1k0Lt8sjEiWYbN6MCzBb99e1joW7vPjcBA
         nzJYRXaE9aD6tKdPHUxUk6bl0ayHichY/FrxWCNvRSYlCvjfZ5FABr2kAYGPi3iu4+zS
         XoyPn+IeIMVchYYVQUPBJ0Qhi9j21xA1HfX2oNsXhgFUYLvm5lhiQUEjPYA9UanKlL5f
         CQZg==
X-Forwarded-Encrypted: i=1; AJvYcCVOD3H4/v3u38FI3wbn0rWZAwEDi9AtGMEfAd0IHo95jjr7FnxJJyDTx8ZMfh+c0/UlH0xqrpOQ4vg5sB+cFx8LxlMSR10XNdGSQOU/pmFzjZgmuBNLbRrxZJXXCm2+4Q1wBS5Z5MBWfGW31cxSvAXesFtwTJxf3ZzMKPUFo9GQ9BH9x4s=
X-Gm-Message-State: AOJu0YzmS/qXZ/OAyuYW0+aJLZpBdFE6qRFu/csQ0z6/0qatdVuVbQIn
	4R2Q+aDjOyFGMU7J3nj7UY92jTgDUuoCxmZiGuB/FvXwVYnWCd3h
X-Google-Smtp-Source: AGHT+IHZ0dDmSPfX+xofX/WmcrGuZDwcUggoaa+ft3XatTCOde0yruag4R9avDoOo4qe8Wvx6gsKpw==
X-Received: by 2002:a17:902:c943:b0:1f4:9474:e44d with SMTP id d9443c01a7336-1f61961bcd0mr37074115ad.21.1717090901019;
        Thu, 30 May 2024 10:41:41 -0700 (PDT)
Received: from prasmi.. ([2401:4900:1c07:3bcb:e05d:a577:9add:a9ce])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63240c947sm450105ad.269.2024.05.30.10.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 10:41:40 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 00/15] Add PFC support for Renesas RZ/V2H(P) SoC
Date: Thu, 30 May 2024 18:38:42 +0100
Message-Id: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series aims to add PFC (Pin Function Controller) support for
Renesas RZ/V2H(P) SoC. The PFC block on RZ/V2H(P) is almost similar to
one found on the RZ/G2L family with couple of differences. To able to
re-use the use the existing driver for RZ/V2H(P) SoC function pointers
are introduced based on the SoC changes.

v2->v3
- Dropped patch 1/13 [0] as its been already queued up.
- Updated description for renesas,output-impedance property
- Added three new patches 02/15, 04/15 and 14/15
- Updated size for cfg in struct rzg2l_variable_pin_cfg
- Included RB tags
- Introduced single function pointer to (un)lock PFC
- Now passing offset to pmc_writeb() instead of virtual address
- Renamed read_oen->oen_read
- Renamed write_oen->oen_write
- Renamed get_bias_param -> hw_to_bias_param
- Renamed get_bias_val -> bias_param_to_hw
- Dropped un-necessary block {}
- Now reading arg before calling hw_to_bias_param()
- Added gaurd for custom_conf_items in struct rzg2l_pinctrl_data
- Renamed PIN_CFG_OPEN_DRAIN->PIN_CFG_NOD
- Renamed PIN_CFG_SCHMIT_CTRL->PIN_CFG_SMT
- Introduced PWPR_REGWE_A instead of using PWPR_PFCWE
- Dropped using pwpr_lock
- Optimized rzv2h_pin_to_oen_bit()

RFC->v2
- Fixed review comments pointed by Rob
- Incorporated changes suggested by Claudiu
- Fixed build error reported for m68K
- Dropped IOLH groups as we will be passing register values
- Fixed configs for dedicated pins
- Added support for slew-rate and bias settings
- Added support for OEN

RFC: https://patchwork.kernel.org/project/linux-renesas-soc/cover/20240326222844.1422948-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

[0] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20240423175900.702640-2-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (15):
  dt-bindings: pinctrl: renesas: Document RZ/V2H(P) SoC
  pinctrl: renesas: pinctrl-rzg2l: Rename B0WI to BOWI
  pinctrl: renesas: pinctrl-rzg2l: Allow more bits for pin configuration
  pinctrl: renesas: pinctrl-rzg2l: Drop struct rzg2l_variable_pin_cfg
  pinctrl: renesas: pinctrl-rzg2l: Allow parsing of variable
    configuration for all architectures
  pinctrl: renesas: pinctrl-rzg2l: Validate power registers for SD and
    ETH
  pinctrl: renesas: pinctrl-rzg2l: Add function pointer for
    locking/unlocking the PFC register
  pinctrl: renesas: pinctrl-rzg2l: Add function pointer for writing to
    PMC register
  pinctrl: renesas: pinctrl-rzg2l: Add function pointers for
    reading/writing OEN register
  pinctrl: renesas: pinctrl-rzg2l: Add support to configure the
    slew-rate
  pinctrl: renesas: pinctrl-rzg2l: Add support to set pulling up/down
    the pins
  pinctrl: renesas: pinctrl-rzg2l: Pass pincontrol device pointer to
    pinconf_generic_parse_dt_config()
  pinctrl: renesas: pinctrl-rzg2l: Add support for custom parameters
  pinctrl: renesas: pinctrl-rzg2l: Acquire lock in
    rzg2l_pinctrl_pm_setup_pfc()
  pinctrl: renesas: pinctrl-rzg2l: Add support for RZ/V2H SoC

 .../pinctrl/renesas,rzg2l-pinctrl.yaml        |  23 +-
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 773 ++++++++++++++----
 2 files changed, 619 insertions(+), 177 deletions(-)

-- 
2.34.1


