Return-Path: <linux-gpio+bounces-18437-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7101DA7F688
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 09:39:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D67D7A82A9
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 07:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C630263F49;
	Tue,  8 Apr 2025 07:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Zh4Xau1v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA7C26136C
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 07:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097794; cv=none; b=Rcj+jP3p1R4LCFjtWo9kRQ6Xo9KeWGF1lnNmiLLqWwf0IAtPRLuXANKFDk4yuiLUv8+DBbVse9EwVStZ+jP9KoDBr6JZBK1wnLjUUcCnTeYyJX6aYQAjmIqiMMzdGk6OCzrJrQy2Maq7hk/TU+HCgo5CwCS60kMC9dmj4gnGQqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097794; c=relaxed/simple;
	bh=64XAKV03Ho+Z3jvPtLmTCQSUmsOOsN0XOZVHAEPYRRg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=txnY0sAz2Uf/fHSxhNrq4OOateSo7smxeT7s/07EEpFxFmdpNKNcj5Vw0tz5qkIpLGkVciGKyn3OXqIyQlc20kzkHnpELt7mDgS18TA46KCE+tb33bM1F4a0VauYVtJOH1OOluinYIW0H3XBiP2EKyd7y7Up6Avm+GwTmdKIgBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Zh4Xau1v; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso32767565e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 00:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744097791; x=1744702591; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3oL2xWPiX1fT1lZ50mXB6CsRpN3IwcAkRnIEu0JOAU8=;
        b=Zh4Xau1vyUINFzr3xGR+gTs/S5+CIqdiz+UqGbJisaMVTYkSj4/SUZAfU+KuvCbfaL
         cnHWMkOQb35bPLuVwcQcJDZ5REusqsqGTHnJh3skzv/lhoMAteXuA1f2QMlQXM8xEPBU
         CoTWS6b7TAuRDLmQx71KU+8gSf4YwXFjSmZW4E4OuXFeRSi4QIipaJMAHeDxaXsTQoh4
         BpOOV1vu1BGVm488TG/1ooMil+FQf+7aOtlhVil58vp6lP5RhrhV/x3LY9AHlNiEQEYR
         ppMy9B8O4MrIsNG8IqG+vZC3WiglS63R2eZK6Ysw4MQDYA7VyGNXBiP3P79IX40zaSrn
         RWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097791; x=1744702591;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3oL2xWPiX1fT1lZ50mXB6CsRpN3IwcAkRnIEu0JOAU8=;
        b=sRa2EUCTutiQw/PXsmumQeTonjPepp7CmaakBQwYXPBXuJc4ocguoc0b95j00+U8fp
         5tEEeZXJZ/W4FzQVYP8rHJ8wEzp2vyyYc+f1GTllK1EWgfNeJIC5AvokpjLLWWq2rgkJ
         LIB4775u/3zwLQP8cbwcRklcHCNq7zxHZTMoEAps1tLQbwU2Yht01SU8ArZ6cacuV/rH
         f+1Yxga+cySIR2AqR3OvOqilG2JXTmMILES5xMwGy9InZubMgCR3nW6JjoGGo+2KlEic
         vS93AatEu/qY/kJA0mQf5OnFXDHjdNDvZDTb7PoTnzg4Ph+ceMRD+kOprXhDqhFXPUw8
         1oLw==
X-Forwarded-Encrypted: i=1; AJvYcCVp3CTRDaCKjHTzNrxw1f+LtwsYWwxgvCdJkeBbTHxsncoZ7+XcWq9f2SRdBOObWY5d2cwzolp3Yoxu@vger.kernel.org
X-Gm-Message-State: AOJu0YzDAkU7YOZrnaGD1bgbQebNEj5Bma8J76X9GhPJkDKV/1MJ5D2u
	9LpbF6yccmgeFaOlRxkWe8kuDDuESovYFxwGYwc85QYazNH3gB7NczBckcGn9XQ=
X-Gm-Gg: ASbGncvCVll/NvTqCaJvL/kpn9SO6YRgifaoOZyykO21mAdlKxnry9rjrVlNUtBUgGh
	Ggibb2gPNClvsUdA19WFt8mqcx7ohMDdLnLQpPZMibqbfP1jgc88++ksszZsh4ZqM4P+U6Ea63+
	obK/nuL7gTwCj2y+89py0/7ao2BIkJEeXFAk8LLZeBeFj9TwKVZEdpk4Z6FyVIYfY/8bisvWg1T
	PSlkANjIwQ25+L0TLNeErg85sGppREisb3UbnZt2Vy/c70MB6Ib0Oh1bc6j83cws3456Ki5RRrc
	7JjQmSMn0hl8lb2sYWpwgAGUakd9fx6jwEaqNw==
X-Google-Smtp-Source: AGHT+IHmBKd170rpPUVo2CW/2nArPovoJjIeVFGOn60+YzO4ebxQNDuHyhP93HU+yCozqPWA7zIjlw==
X-Received: by 2002:a05:600c:5105:b0:439:8490:d1e5 with SMTP id 5b1f17b1804b1-43f0e55e881mr16913565e9.4.1744097790668;
        Tue, 08 Apr 2025 00:36:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d980sm14287627f8f.61.2025.04.08.00.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:36:30 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/4] regulator: rpi-panel-attiny: use new GPIO line value
 setter callbacks
Date: Tue, 08 Apr 2025 09:36:27 +0200
Message-Id: <20250408-gpiochip-set-rv-regulator-v1-0-a18b6154b31a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPvR9GcC/x3MSwqAMAwA0atI1gb6QUSvIi6qpjUgtqQqgnh3i
 8u3mHkgkzBl6KsHhC7OHPcCXVcwr24PhLwUg1GmUdZqDInjvHLCTAfKhULh3NwRBUmbqVOdb5x
 vofRJyPP9v4fxfT+h6wIGawAAAA==
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1026;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=64XAKV03Ho+Z3jvPtLmTCQSUmsOOsN0XOZVHAEPYRRg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9NH8qqweyiug7GKAUM1qPRNoABkNLfTEOUORV
 w4QNWh4jMeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TR/AAKCRARpy6gFHHX
 cteREAC5W8EMZzyYdurOHOFPG3ZBduq9ZGO5tH5hBIyZayyfLVwT0a6iM/koRDG6WWixwoGdztd
 wRbNhBsT3/Guh8Fl12Cv9NhaAkgZKbB9A90N7/cecuEd6KCIVXfE0vmIUduhlDmJwrpG1n0gQfE
 rRkSeSTrpiCrV+dEpfDzjgDQcY03JrQ13kHl8i15ViFToU2E8pJjeotMYFP29Oo5xtXefgQOzEc
 HbZBYPcW+7jKzGI/tlFHxG1wi64+01xPKwYGbtzys0qFbIg229psP4XNovdUqkgx9TX72+WIjXF
 y/ZD0jFMtCjbForfgapGgsxL0R9tEsUWIn8EzEuhxBYsmo9p2jJj8jQq4hpuoXT+GVNSJSyfXY2
 T5A067okZhOMKCklJCnTt4/3bbahrYaICRvo/bEKVurZpu8zXMd2t/VVVNGhZAb+1/BPfFI7Kx1
 aHsiAtpM2IPUcdAVJVU80YcAY4dvr977Rz3KcJqpYNORYJLtaahyybGadJuQ2yUc7hdqyz8ND2x
 vKTgDm3M1FtqyxY1l+M6TDu2Gl2Mn8OEXnGwVy/Tv6TZOzycBCIzLOI6S4ICL1kdK3Xr2mbhfb2
 7P8O50jyxEMlWaEnITsN0jt7gf95ImGJRayte4TKdIlqvxiqLl09uxBpFNkX3ggPjL03qIAk1QU
 YuHbxOhgFduhsWQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. We're in the process of
converting all GPIO drivers to using the new API. This series converts
the only GPIO controller under drivers/regulator/ and - while at it -
refactors the code a bit.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (4):
      regulator: rpi-panel-attiny: don't double-check GPIO range
      regulator: rpi-panel-attiny: use devres for mutex management
      regulator: rpi-panel-attiny: use lock guards for the state mutex
      regulator: rpi-panel-attiny: use new GPIO line value setter callbacks

 drivers/regulator/rpi-panel-attiny-regulator.c | 81 +++++++++-----------------
 1 file changed, 28 insertions(+), 53 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250331-gpiochip-set-rv-regulator-e12b909f5af7

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


