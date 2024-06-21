Return-Path: <linux-gpio+bounces-7605-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4419120B0
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2024 11:34:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5015F1F21AC9
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2024 09:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D30E16E887;
	Fri, 21 Jun 2024 09:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ppa1S6Pz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1F278C8D;
	Fri, 21 Jun 2024 09:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718962441; cv=none; b=oz2ClLCCVFZ9D+cm97zh0tJ4vvHnP7nCObCynWrvFUvKRJEtEbIWstEmp6r/z8uwLVyHBR3qVoY8EkZ8e1nPKx+3sDJu3MUAkibzUEifZ4G9bi/LHBy9vgQAcqsGbpZDQ+jjJDNTJ6Y6Ft4oPxNxvtrhvtgV28RtdaNF/O+cDds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718962441; c=relaxed/simple;
	bh=UQtLFqj0hfhWLB4hel6J1+AjzvJGftbnprF84jEbx1E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SJq+ceIX2IjfRN0fYjOf/65kSmqtrm5mvWButCY+LVX4RXTetItU3T/pS001XwMdWnfHf2T10joeLs8mvgKKJpCXcj5newoxox5a2oyYvCSyyboFc5jl2jaSoGLkZTd9/GGudPEI5ZyrAnvSZqcgLh1gvnzsM4cLcsC9byBKaBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ppa1S6Pz; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-70436048c25so1801123b3a.0;
        Fri, 21 Jun 2024 02:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718962439; x=1719567239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6EuLE0zsm5KH8c0x8QdqGW/DlRecU3YrYL3GIe8b3zw=;
        b=Ppa1S6Pz75E8D3TuSQdNicEkKuI3spY5mBGsO1uiStWGfvlb3gEnI2k6MB8rBJXINN
         bqcWu+x01ipXhttrU3UTJrSGBvozLf9dhnPa/b577ixOB1VTNnwHoGh/HC9szbyY2xsy
         V4K1ZDUigf/s8HI2JKlCyn29o5Ky9Jfwew55MlXlOskK5aSI0onKdmYxUjPW3M0Gby1Z
         WZbdaiJP9YIY2xg4jc+hrTFlfahf91EvR3Q+DN/a8lgVfm4bcm7v5czS8vDoAeeVZ6Fg
         tOmwN6w/ARb9jIq18Qd8o/t2Wj28pOQneN92Gamte08nsHbwkZr/4zriA5jHceBM0oIe
         +bag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718962439; x=1719567239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6EuLE0zsm5KH8c0x8QdqGW/DlRecU3YrYL3GIe8b3zw=;
        b=TgM05U2jVk1OOZadb7c4l2mBnWY5i+0qMAImwSYyJqlCbgYZVhN3RcZEgV7TtOFhjn
         JrwIkXcKq1bzqhSXXJmZA+y7h3WUhP/KCq2j38D6PeoevMxIHG03f4dTMEA6G/QgnHfe
         9P8HncjLugpuRNTgJnfOWYa28W5/a9BeEdGtCI1NpDg26H5zeF88X4fMNI20evJ2DnSx
         2Nj1JgM7Oh21s27Zc0s0EWE8XQsFaIyTHkuMCDXmtSRWEN25kO/GtF3omi6vEgTJjK4r
         xukXNWwEeE9oGUP7wYwqzNUFMFP6OSYjN0/JMnnKuYONVM8Q5Dopc5mhjhPOYFUDEweQ
         5nFw==
X-Forwarded-Encrypted: i=1; AJvYcCW9agp4Ly+7RfwAZ3u+dbFq9wpADZRq1W5AQH6J0fniY+eB8ETbTki9SQ4J6/cs2LaVpLg/5zSWf67Er9AvxJkibmjwr8X+ajueh5RVQac83rL75i9Pma35Mya8squoRMXBCqMMr2hCFiVzxpKaITUc/9I+vPheRkbwLGwFkUApLMzvaC0=
X-Gm-Message-State: AOJu0Yzo0uMv05qLAdsTQxQOuYeOy6lPDAImL1WLVjrFYOOe+itPH6Py
	SYpPwNUXSp2pLuyQA/ANFtKtfmPXDJQdP3mMUYZ1PQ3Y+NlULjqM
X-Google-Smtp-Source: AGHT+IGqbYxg7cu+HPCe8VWGFd/57+AVyKBihDN8pav/FDazcA3yRQCWyOHk5hXwaIUXi2kEcRMoJA==
X-Received: by 2002:a05:6a20:3aaf:b0:1b4:cd5f:4e0a with SMTP id adf61e73a8af0-1bcbb3e0e03mr7220194637.13.1718962438881;
        Fri, 21 Jun 2024 02:33:58 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9ebbc72e9sm9810365ad.296.2024.06.21.02.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 02:33:58 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>
Cc: linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Patrick Williams <patrick@stwcx.xyz>,
	Cosmo Chou <cosmo.chou@quantatw.com>,
	Potin Lai <potin.lai@quantatw.com>
Subject: [PATCH v4 0/2] add ast2600 NCSI pin groups
Date: Fri, 21 Jun 2024 17:31:40 +0800
Message-Id: <20240621093142.698529-1-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the NCSI pin table, the reference clock output pin (RMIIXRCLKO) is not
needed on the management controller side.

LINK: [v1] https://lore.kernel.org/all/20240613080725.2531580-1-potin.lai.pt@gmail.com/
LINK: [v2] https://lore.kernel.org/all/20240620012512.3109518-1-potin.lai.pt@gmail.com/
LINK: [v3] https://lore.kernel.org/all/20240620084337.3525690-1-potin.lai.pt@gmail.com/

changes v3 --> v4:
- remove pin list in dt-bindings commit message
- add note in dt-bindings document to descript the reason of adding NCSI
  groups

changes v2 --> v3:
- fix commit message typo
- move dt-bindings patch forward

changes v1 --> v2:
- add NCSI pin group in dt-bindings document

Potin Lai (2):
  dt-bindings: pinctrl: aspeed,ast2600-pinctrl: add NCSI groups
  pinctrl: aspeed-g6: Add NCSI pin group config

 .../bindings/pinctrl/aspeed,ast2600-pinctrl.yaml       |  7 +++++++
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c             | 10 ++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

-- 
2.31.1


