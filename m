Return-Path: <linux-gpio+bounces-9216-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA718960BA1
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 15:17:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B30E282870
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 13:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 258FD1BD01C;
	Tue, 27 Aug 2024 13:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jCjcdqty"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5275B19DF60;
	Tue, 27 Aug 2024 13:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724764658; cv=none; b=iP+NVmVVZU3+TEng0hV7/PmmD03BJmP6pabxofSzZZDJ2FJ3HRgbvrVtnUAD/khnkaJCq5luoFLAW0jyRT0lB3pwVuvYHs6BtS7WfHRvcwV7mBSweH7axBqoe4UURIlyrtIkio4QvpEq9AkbL6ifMUsfqXtDV/WHpNoU2svkUVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724764658; c=relaxed/simple;
	bh=uIkc39ylb6r+hyHeen+QeptUF+omI8/FErqWlnTHqvs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sD2hx1YJUSAjlHcA7FivlxOpogGA3WmTalrsfPIGeMZI0n455dCGRb8vCOnKMTAI4sE1ZIiqxOWhkjGPqcYykxLLSPk3OhtOvwdo0U8/1zMe2Stt+ckmWQQabVHUKgU0o+WGAKU7cbXYXO00coeJnTpCZu5OU5orIy0yAJoL1js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jCjcdqty; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a86b46c4831so382942366b.1;
        Tue, 27 Aug 2024 06:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724764656; x=1725369456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6Rltc0dlp0acN61G5ykarJjVmbg9pURDbOAUOieJU2M=;
        b=jCjcdqtycihve9c3Qu3Q9bXyXjtKRPZe08jeQlPuVw9QPVjxes+85WFq/czHOJcY4V
         pqDNla0ncZ4R9Mn9MX/PuWBhbBX92fR9QISFVQrL5ymYALWECbPHTtHsa+YeXIaw+Cci
         el51pIgVJZwdZbJVBX7WLrS6FarQK+qZ+23zHx8iYkiZNHFwh5Je1Iju6JUweMQzJAqW
         RUbyudL8DxoKkjJ+nPZvVd5cLpds0f4AvN/0fnub/6BMlF+ws3RHLrW8+/Zf5BtIcWaR
         V648McO2zdT7yD7SF4DE4iZMgLfNI49Rf24fn/e8FPTu6fPLqeraNcr/N+IjZD/CWg9L
         fxfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724764656; x=1725369456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Rltc0dlp0acN61G5ykarJjVmbg9pURDbOAUOieJU2M=;
        b=lhkBJJB5M8+AFhSbVqw9VStICNlqx1p92KYlDA9rtJ7aOCqxumBjrmiiIHyKFJVBYS
         dF17+Ro/A8M/Elhe1hZWRCQon5NQ6YnHW+AtbHLK3QVRSon5gdsrsydG0dvlX4JapNDU
         zJ5vn23Mem/COLNLFNQzn4eie7yIpjXLl8A0sQHDm1fJNTsKL402yEMDMtyQtBuSJXWA
         fSVH25Q0TmQKxv46GkeAUmGAVFJtCU0q/w5NlHhvALpvAkVnlmdfjyEaXyM0jugV93/3
         tvnb3b6FTpnKXjGp1lxZWqY+X0BNa0Kk8kRkqaBYsCR0BTBJSoTtvn3NJpxv146W89kF
         5uYw==
X-Forwarded-Encrypted: i=1; AJvYcCUQZr82el13vJEtxMOeoMbPQzs/70r4Fda+o+o6HPGfKBc8x9RKlDDjLqm5DFsLHs23dh1PKtOlq92DWxcX@vger.kernel.org, AJvYcCW/Kd0K/eHsAuGl44BxXhWXD4ff5yGyh0zNaqjPR/mym83Qrfm/JqgzV11YN2WUG4yZ6PQGh3lg1nqF@vger.kernel.org
X-Gm-Message-State: AOJu0YyA/crAYpcnaP3uhfYtno/ZeVkqtXnDh5z/IapWTfqmbf+isgi3
	irQZMui4zY4zMNrgsGea/5XZnA8x5mKKqe/qTgFKz3QuqTA+SoeR
X-Google-Smtp-Source: AGHT+IHe6Q2jYCpIRXCfbpk/VsL/6sbEOqDu/yXJ1jviIbZI+YPHuFU/RykAg3ieMOg5qjVLHIKLLw==
X-Received: by 2002:a17:906:dc93:b0:a7d:a080:baa with SMTP id a640c23a62f3a-a86a52cc935mr942928566b.34.1724764655027;
        Tue, 27 Aug 2024 06:17:35 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:5ac5:89a0:20cd:42bc])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e5878597sm110338466b.175.2024.08.27.06.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 06:17:34 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] pinctrl: renesas: rzg2l: Simplify noise filter cfg macro
Date: Tue, 27 Aug 2024 14:17:20 +0100
Message-Id: <20240827131722.89359-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series simplifies noise cfg macro, by just adding single macro
for configuration and while at it simplified rzg2l_pinctrl_pinconf_set()
function.

Cheers,
Prabhakar

Lad Prabhakar (2):
  pinctrl: renesas: rzg2l: Introduce single macro for digital noise
    filter configuration
  pinctrl: renesas: rzg2l: Move pinconf_to_config_argument() call
    outside of switch cases

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 62 +++++++++----------------
 1 file changed, 21 insertions(+), 41 deletions(-)

-- 
2.34.1


