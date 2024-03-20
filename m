Return-Path: <linux-gpio+bounces-4481-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B208881027
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Mar 2024 11:43:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EA4C1F23369
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Mar 2024 10:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 578E739ACA;
	Wed, 20 Mar 2024 10:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Up8pId5g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6A72744B
	for <linux-gpio@vger.kernel.org>; Wed, 20 Mar 2024 10:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710931413; cv=none; b=UhNUUhWt5EYkAqPjrIfsy5GuSl0xF6dFPpIH/DYV2nbGugseR557z/Rw0jkbOkmyabaX39SX7enGw8wT2Ua5etEeSyST7V9klhUmeVeXVuMv/ga0iJkgSEQI66eb1QCZYUrt0RvrLjilJnUikFq4bz3AIP67vkkOwoa/lgdGbEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710931413; c=relaxed/simple;
	bh=nq2wKNNpeo2285g0qZC3Hza2dTO9nFQmoZ1P4qfdFx0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=covQ20izuKpNnBzfSd5EPAYFDdiaDJXtW/piU0vLqIIQG2jAKMeXCJncddV9P6t14atUQAQVkf6PTPnsey5NiVXxB/P2fJWnsAebX+3Ln42RtZHJso1zeHNL5Db27PXsplFxRsEWbE9CPiVkbdTxbwC6ESqSsuyfi05Z8RddWfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Up8pId5g; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a46db55e64fso223895166b.1
        for <linux-gpio@vger.kernel.org>; Wed, 20 Mar 2024 03:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1710931409; x=1711536209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y7YCcW0F6Lrt8JcoNOIMWwfvsSbg5Iix+K6rhgXUVTA=;
        b=Up8pId5g9gHg7yqNhNkSZBxi6B+nIwj4EMyhmy/LyddFTVOdCLjDtqiNEizarkPG8Q
         rPJzTDLIQujxc8HyftQ6KrMJeRzUKpeD3537E535ddBUiI4bc0PKuMpFO7FHidakLops
         dUonoIGpO9n2AtbWW77Vm1Zlqst++PJef8SZOIi2GMTK8kUNvFd+15h9X9Ejoc0qAJBW
         Eux+tDnqPXXMRsuSW4IqZ+GtyXnIB4eDjYtL28aY0Z3BdtqMXoreHCiP8id5TNwFHTUi
         x0NGt96etxuvPGHCOQUKZ2+81krzzMEbyY3qgjyrqCYNbsN4ZBBLTAXW3vR4YA2+uXBk
         5iTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710931409; x=1711536209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y7YCcW0F6Lrt8JcoNOIMWwfvsSbg5Iix+K6rhgXUVTA=;
        b=pszHgmdLwHbTSrWdN/uGDLYwUkbw9svcc2Hn1ZIGtHhFTWoy35ubic5lko5K7zgeJW
         SxGq6EZVfy2plx5mHPFYE3QOPvKN8hib3wCAAXuH2t0djRuSPTD9ncO7+EvjOqFuRG6D
         F3myxf72HiYQ5w7uWPQMLWoXdoJ2RbagbIre7QBg4TI53nlvvj2GyzmdTLBICSzRgyWK
         04OnKM4rczNFcq47l/63vi2SB/dRCG8FH7FQ89Rhlda+kRUHU1yEvnUulTYsJzdWdUc6
         E3W4aINcfN0rYaK0oVSGD2QeBUa/fZvBkGsw3tsEG1GbG0bJsPddzrxDC6Mvw36/RuM5
         R9Tw==
X-Forwarded-Encrypted: i=1; AJvYcCX97zkuKv1kaPtiGsfIBT/8jocq3PLAWKNcfbBlYm9v9IGh7CaiL0IhmP64l8210unJe/GPKnswnY+dkYTQqaprBIKyrz9XLUwokQ==
X-Gm-Message-State: AOJu0YxSu7bkuMvrv66whs6nb3Y0kXPa7aHghL60bGd9Xthntzd5NMuz
	eD7MBlHmGepMTyMqPhELYqtXjOrfKIiehxykAMYII8jSYo1sCjsvxVEKM+sM6Fw=
X-Google-Smtp-Source: AGHT+IE07FfjL+kP7sHe9nti7Psa4p1ib+32l0yhChQlqn2xgLf69hil2T/W79Ix4Q3NmFccWuYlkw==
X-Received: by 2002:a17:907:208a:b0:a46:636a:2c23 with SMTP id pv10-20020a170907208a00b00a46636a2c23mr11284694ejb.34.1710931408673;
        Wed, 20 Mar 2024 03:43:28 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id o20-20020a170906289400b00a45ffe583acsm7092081ejd.187.2024.03.20.03.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 03:43:28 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	linus.walleij@linaro.org,
	tglx@linutronix.de,
	biju.das.jz@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 0/2] pinctrl: renesas: rzg2l: fixes for pinctrl driver
Date: Wed, 20 Mar 2024 12:42:28 +0200
Message-Id: <20240320104230.446400-1-claudiu.beznea.uj@bp.renesas.com>
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

Series adds 2 fixes for pinctrl driver.

Thank you,
Claudiu Beznea

Changes in v3:
- collected tag on patch 1/2
- added patch 2/2 in this series

Claudiu Beznea (2):
  pinctrl: renesas: rzg2l: Execute atomically the interrupt
    configuration
  pinctrl: renesas: rzg2l: Configure the interrupt type on resume

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

-- 
2.39.2


