Return-Path: <linux-gpio+bounces-27134-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 283D6BDB002
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 21:11:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FD5219A0781
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 19:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D4692BF3E2;
	Tue, 14 Oct 2025 19:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TD9f64jw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560AD2BE037
	for <linux-gpio@vger.kernel.org>; Tue, 14 Oct 2025 19:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760469094; cv=none; b=eSIVroWe4hBfDkNg3ufMSBMWCQ3i6FVtb80/lX5XUqH6pFdTn1LMDW35DID9QPe+mIpBJniVQJj9tTsTV5OLr5rmEmiNKfkVhu5WdwJtwVcrqP5BwWA3D1coSO+aO2icsO/LyKHHSpViDsgStj0SLPNhiZwyTyxllSMXxx4xhqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760469094; c=relaxed/simple;
	bh=JoNiSlBHX0lRsNEM+X+qf5ROfd4SBePaFleHfgcatAU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k5iSQae5Q+KlA8VOagwVAd2UpMrazOrCmt4dFNPwtO4if1Zz1Hk5rW9paVy5ZrJPuW8Mhqprhf+4RUY4CY74ftOT6fi4T29Sng/BsvWNBa83GV0jhpMxSKiMpoKOUcig566RZRBlLmutscIqflgbsmlY2ja53g4BG+n8RAnk+SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TD9f64jw; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b556284db11so5034563a12.0
        for <linux-gpio@vger.kernel.org>; Tue, 14 Oct 2025 12:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760469092; x=1761073892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=St16IbHkGZRw0WWM1PwYJ2PuL1/1u5d5uZewUoKrBqc=;
        b=TD9f64jwwsmeEorCpnClT+/WvjXKc8O2j6YfZab/WgoOsNL//MKLDWg1+2bzw7WGiv
         yXTTBX5iMqYLzjRlUYnfRZOrmyBsSHwdNk3vj5zLd51wPW3OvjjXgoCi9944toudOnl4
         USOvPG05TDIve+VJVd9Ti0gI+3lQkXdtKvy0+Amz+wtv03TD5zVz9pUqQuv8aXWBgx38
         +5+XYpDuYap5Pcs503C6vZsM9GhfIIugGy/gVzbPEl0BsM48iPWdh6ccne0tP9vTmHUD
         MPTy+BJJJNY3hqijGAyP4+Q4oM0v8jwJnri9bmqYz6kUGT5Uv5iTJ+eyGwmvDOvPtYUd
         NVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760469092; x=1761073892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=St16IbHkGZRw0WWM1PwYJ2PuL1/1u5d5uZewUoKrBqc=;
        b=AguwA2/CzEBA9DKQih+369obegzj8STkYqBJodXWA2Yo6kTRZMzqGBEEY/15hgZZxN
         YJIiRQ17mg7dMbDfOIUEo6hbrieeFx5Tvn0F7YnYponPLwT8mdbnuwl3DPLF5OBtYmKq
         s3RQDPvdbPmEHNP4jAm42XNcG4aja5Bh+H6t0UPNF824sJjqx29rdBlwYbzIYL+CG+n+
         5lzOEAzwT+Pue22V21wsRVvOfD8ISV66VgEQhqskOC4DPGMl5xL64sz2BS8kbk90IUAI
         dLxQCIf8kvpnW19nzkd24LR7yeCF7gE7UrMDleckK9ypA9wwruSxiHRo4yGhYtWxeftj
         HPlg==
X-Forwarded-Encrypted: i=1; AJvYcCUuS58ijEufoKV0GScBnwlYAffPKWEWS5ZQ+pLPqMcbIFYbED+InXmGHw2Wds9iZgsoOiCM+5349qGM@vger.kernel.org
X-Gm-Message-State: AOJu0YwcuMfs3usmnd7nHWrzkJ5GE59fLgKDXfXvTLohi4n2KaBwtAHp
	EFi9KUfeNqwk0mVpvcK0tdL/MdyKgXO4DYr4/878Xycq5PCfT6B1Pt7bmNd36Q==
X-Gm-Gg: ASbGncu1nsoi3PdHym/lgG3NQi78qinivOienWm0zU+/E+a7XnVOdjteX45HPqjWhz5
	I0BveqTMqyERsY8NqG96PBzztuWPQCRwYLJ3X+ecWgQ+45/D0CuEwl5o/DNN8LeN19mnJmo6JQ1
	7X5eMgBWEGDPAuPmTcWeRSUjQ47I4ftsiDPFoc2rYXul7WF0Re2fomAUHJtiOUorRJJEwG1uudq
	qijB3GxYGisEvc2931eRKUDt7tQdKLEENK/Ex+C28yHbPN9XGMTFleBFFGvpHXks5S/9Is9z+bK
	Dh8eVJvNR3+sNZLn40N6znLfr16/prQ7rcYvrInigKDniRKuC2uBKn7+6HWhceSbq4CQgLFfzXq
	3tZQAotDwparrgSuqcnbSPnhQV6/Dn/KF89OLFGYY0Le+uzmVDoF81Z2Qna6b
X-Google-Smtp-Source: AGHT+IHCjOQ38l5+wUDId9pV67uaFxJ6e4csyg6AZzHE9fI8Bkcg7dp7NE09q8EsSbM69FmMTL2HpA==
X-Received: by 2002:a17:902:f60c:b0:24e:593b:d107 with SMTP id d9443c01a7336-290273ed7aamr298836245ad.32.1760469092296;
        Tue, 14 Oct 2025 12:11:32 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:c7d3:9987:bec4:a0:deaf])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de658bsm172402755ad.22.2025.10.14.12.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 12:11:31 -0700 (PDT)
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
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] Add support for configuring pin properties on RZ/T2H-N2H SoCs
Date: Tue, 14 Oct 2025 20:11:19 +0100
Message-ID: <20251014191121.368475-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series adds support for configuring pin properties on the
Renesas RZ/T2H-N2H SoCs. The RZ/T2H allows configuring pin properties
through the DRCTLm (I/O Buffer Function Switching) registers, including:
- Drive strength (low/middle/high/ultra high)
- Pull-up/pull-down/no-bias configuration (3 options: no pull, pull-up,
  pull-down)
- Schmitt trigger control (enable/disable)
- Slew rate control (2 options: slow/fast)

Cheers,
Prabhakar 

Lad Prabhakar (2):
  dt-bindings: pinctrl: renesas,r9a09g077: Document pin configuration
    properties
  pinctrl: renesas: rzt2h: Add pin configuration support

 .../pinctrl/renesas,r9a09g077-pinctrl.yaml    |  13 +
 drivers/pinctrl/renesas/pinctrl-rzt2h.c       | 230 ++++++++++++++++++
 2 files changed, 243 insertions(+)

-- 
2.43.0


