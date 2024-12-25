Return-Path: <linux-gpio+bounces-14226-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 865099FC37F
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Dec 2024 04:59:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3F5D18838DC
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Dec 2024 03:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 765975588E;
	Wed, 25 Dec 2024 03:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z7XTzHMZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E22946F;
	Wed, 25 Dec 2024 03:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735099168; cv=none; b=QelUmQfSSsKjQv+hL67l0cvVKJ1gVSV3E2izBNa5vo/cFP5PETTujpIrmgzKIx4xSatn58fbLtxoXCnm0/O587/Xj1cMPiwQ3B/SAQXxvRcgc37YFFHAwqM7vTNeDnateHdQHauiUFn74JGfY2NLTfi4UVRGP/3cqWb+Xbz7lEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735099168; c=relaxed/simple;
	bh=kT146jOFBvU0uuYdt8Fc+msXZNLFiI3bx7HpkCYTi5o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZB9Lwo7InwpxQqs3nNlHsJ7yY3BfaAKzRAgv28ywcHGWdfB4aSZy+stbtbnN+zpcJQ67dYR+4g3LJ9QxMd4QBjqLs3LfJGFIat+zDPKTTAa29jaM4hK6M5XGb3yWJ1RhY/Am49lfYbxvKFlGfluwHcGWZK1YE2OTD2xU4vySxSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z7XTzHMZ; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2166360285dso60545855ad.1;
        Tue, 24 Dec 2024 19:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735099165; x=1735703965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ql1WyCfsmB2Z8+1lpFrs7KbOLYfrOZv+t/AawKpQgfc=;
        b=Z7XTzHMZanHIP/YIAQGA7zqqipyTbVa7aP8GbG+ABzowaKct8cG8qcW4xj8Gstlsg4
         TMPU4g5MZVxS5Aea4MmMNmLsmHHYlFTCQoAaxRQLIZKFbrxOq5PCsZEy1gB/Jch7PPgR
         dEpckY2QnwvSDLEVbckdJ31MTubWUPBRWm2Ysebggk1T10Z8Y53+uCp1Esb1IWMqGXab
         JvZO0WAMAAatp4HW1E4ywxlDri02I/FvXXm6EPH25otbmJ9UBIzonqOXOChV1Zs6qT1c
         PWd5B/qFquIWBpCSDDrQQXzA8CJo8+GWYSk54rB6+8+QHDd2u4BR++1vI4qUKcu/sp/z
         0qYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735099165; x=1735703965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ql1WyCfsmB2Z8+1lpFrs7KbOLYfrOZv+t/AawKpQgfc=;
        b=IHvelwWADVP1EbUI+1729UL40fEWjy0uvIsmXhgSvBOCTrn1hOka9lzzf+DR8HO2DE
         R+AOvIn6poCDL+t56IKBMrHzP0npwQXHMPyeuy1zglzYlJ7pTEri2E1yu2f+scpIu5tg
         T4TMXEF8sbMx8WF3BA2iNSTQWsT6AOZthgYOcz/retDslILuTm77DH+6sbCPrBUuZWab
         8FSrLKXKr7GoQW5AAJSzxUAORXxTy/yLQtGQr73cp9dJU/W+1rrnnyDHspNK4cAxeq9i
         9clGcqjPONQ4OJz53goS763p77WFo+mWgfgDAIK0PLLAkA/NZBvcRVe0+wu9B5bTDCJv
         XdRA==
X-Forwarded-Encrypted: i=1; AJvYcCU2UGUn8pr06BJ5BgY+RSEZmaJQnEbets2rPjyFnUgZWNyx/RFb5HS6BWCMNgkLTIQdQ2UjH+/oEHXihQ4N@vger.kernel.org, AJvYcCU2v0P9e2fLcPPuZdVYMdTp0z0xHXXix/0fjSvqTVylz5RWuyGIpYlpCHz8SDJ7ZUFzr2ZD+QR2hVCI@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt2p2miI2aM9qr+jdgE/hvsQ2WnpE4PyVillXCcJQJnGJWM62e
	/jrtdi0ZGMCn6vMV5zZaDOKGjtcTsOarIEdS6XsN/dwYM2Xg7AAbcLYx2qd21KA=
X-Gm-Gg: ASbGncvpfgnbq+wAoGVG4RU7zvHosZsIDGZD8xVQYx5gt7FWFy/I3rfh2E54saSdnXd
	4Y+OJa77wUWEEltwiSfzupXY/4r7KxztDBhHH6+IJtHp7i47Y0YgaHdyLEXNuNq/1Qwy9AI4meh
	V86kdzlslzU6gqjccCXlkueqHYny1OcoTGwih4VaC+gKVy6Y7wEkBWlipAZ/dnZBqmixwLF+RCf
	pU5RfItz1CXundFXk64nncfKFFvQOgZvCYjpwG7Lf0jvcHH9JpkNG2lgTWhDXgPFpk=
X-Google-Smtp-Source: AGHT+IH+zFSv34Rfk4izkxUMBax+szT+ehzigAxsSjn7Lx1sWvEstxJhSd8l7q3qGqstLuHEfo9nvA==
X-Received: by 2002:a17:902:ebc6:b0:216:501e:e321 with SMTP id d9443c01a7336-219e6f2700cmr283031235ad.56.1735099164795;
        Tue, 24 Dec 2024 19:59:24 -0800 (PST)
Received: from guoguo-thinkbook.lan ([112.65.12.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9d447fsm94256125ad.128.2024.12.24.19.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 19:59:24 -0800 (PST)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Qingfang Deng <qingfang.deng@siflower.com.cn>,
	Chuanhong Guo <gch981213@gmail.com>
Subject: [PATCH 0/2] gpio: add support for GPIO controller on Siflower SoCs
Date: Wed, 25 Dec 2024 11:58:49 +0800
Message-ID: <20241225035851.420952-1-gch981213@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset adds support for the GPIO controller found on various
Siflower MIPS and RISC-V SoCs including SF19A2890, SF21A6826 and
SF21H8898.

Chuanhong Guo (1):
  dt-bindings: gpio: add binding doc for siflower,sf19a2890-gpio

Qingfang Deng (1):
  gpio: add support for GPIO controller on Siflower SoCs

 .../gpio/siflower,sf19a2890-gpio.yaml         |  83 +++++
 drivers/gpio/Kconfig                          |   8 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-siflower.c                  | 347 ++++++++++++++++++
 4 files changed, 439 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/siflower,sf19a2890-gpio.yaml
 create mode 100644 drivers/gpio/gpio-siflower.c

-- 
2.47.1


