Return-Path: <linux-gpio+bounces-34437-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GINWInapymmx+gUAu9opvQ
	(envelope-from <linux-gpio+bounces-34437-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 18:48:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E73F135F012
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 18:48:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD022305616D
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 16:46:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 337F43DBD4B;
	Mon, 30 Mar 2026 16:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1M6Yzng"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B97B3DBD46
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 16:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774889187; cv=none; b=NVSX2n3vXidKuMvyv20793HBoffwVRPUCekreL0JobhJVBqIZ3tS2i/wEooAT476QEEcl1RL/dMw6q9Uwtvme8Upa4FmgTjM5FKiZlkp1d8lwDQGoQhQ6EFDx6pauVWozMdVzvIXNlP7qIISFDIctjHqgJJHIIPLdx6/pdwJ7ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774889187; c=relaxed/simple;
	bh=YJin1wPk6QwSKNDkDugbrSYwGRDBzaEpXCdg+uaVnik=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ApUbxK6hlZoYiP8Sm3aG4YYyiK2W9Pa+3ZAvlxAF3QjE+dcOY88Nqcir21xVCR8JmQF5BoIlodkqIkqqfbC0QmCnz4WM4xQPAcp/RrDafM9M8Urvl8YPMEP0oYC+cSfNd3jGEcL56qNpHpTNd3TLT8FqQxVoRrgX7x2AqtOa3qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1M6Yzng; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8cfd44fa075so654304985a.0
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 09:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774889184; x=1775493984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P9N0rhaxdcZ47rPdqHKXeK0NE0HClZsrO2nPTgCYshE=;
        b=Q1M6Yzngkxn4QBqtmEAaxt6qZck+3/1f/0bchHS3raDZc17O0Wnzl9yuCf7acWtdQ5
         wJdOjrYHEmd+9JQ16fETdX0XRd0TamBehfsLzSIMVAD2gpoZ8pLsFo3RdmeZLKvEkYVN
         l8Dj0Ej8yuubFacsgMuRqiEOElXJUzzUrEO12tNJ3oyNWXEzfAJV1GvP602j/WDnFpHH
         rmiI+6jz0+9gFikJX8Nm4dYRWQc3K7mw04cX9JrjZKN+mQEND1fTxyYlvHAtpAJgY+Cv
         rbosPA+0XB+1UjvWSWlq63wh3PXnCV4gIQUFjRM6qiv2vncef4a+F+xFrGnxQTQJWN6G
         Akxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774889184; x=1775493984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9N0rhaxdcZ47rPdqHKXeK0NE0HClZsrO2nPTgCYshE=;
        b=VN8pt4dijMlOnATALCFD4DV2XT940dFR3PdJXWUVfdPEL9gsu8sispdeZT66lffwza
         MzYgd/DxHaE4CFgdEffPuymhofpxr6BWKmHgSfDTp04+1NUsZ6SDhZldhbkTOgh7wkiK
         dViFnIwwaXQN8EwdHTXR/t+ofcrRsXjOX3LAyUJJCfjsjDExsKnpJcT5I85/o3JuQtXX
         wnGCK3vhp4pHDyZhlEU6dnqiG1siF7CYjGxpuvDGy/EjZyCIf5krWxk7WP8SNx/FuJzt
         mDgbHIhvXBemokYMDLH2qg5fDCJUdL6v60N7Lsx4ss+lMiE/CSaZqK4nzXTOPLucuQMN
         etog==
X-Forwarded-Encrypted: i=1; AJvYcCVvYn153EopUCBjOQVf7HTkNpzm+kd12alTC+g/N42RsQflH1DTkRsm9efYvOKI5OZ4Ovp6wlqvzvnW@vger.kernel.org
X-Gm-Message-State: AOJu0YzXLbTIDrOPcmByx5B6ujA58AjgiR1BmbhpYa/ZIB8GuUIrXLV/
	367wIFesznMBccISSgKbNeVFXXCsg0SCqKlSD6qJ8TUh1+eZScbb+Joz
X-Gm-Gg: ATEYQzzk/BPDlvrKsmGZPXWnIvSI05vdKNmIdk4pFZq38CoI6M7vMHSBSG63JhYlCF3
	OoloffEljh6KlmkoRYOl1hbya+Z5R7omblscA0l6BFpLw5rAjYaSW3B1Ddj204U2eRs0KbveEIT
	JdZ1I/ywKC5Rza402HWWJ8YZBzfdX8oXnvapjiPoQKHWVnQkT0mTsWGXK2dOdg5pH9daTaFT+2M
	bnFjFjFYouL9X5B6g03oHvQcjoW3v+eZiagMuVUh+t+qVL3+uOYOh/DGSQiGGIWEJKlOPcoNLjg
	IaXNuzpJW57VnaC9ad19DWBQBhcKTPc4Tq2vNCyI4mmuWnz9xcRM6AggoRdWY+E1CsKAxx5s4kD
	Od4Fr6Ozzd3UCxJ5+IVHMTijRGtJtMyae97dy29JIno7DBh5r6CUphWJaI8w2og81kDCt4Jrrl9
	iUK+QuviI3n8PSrF34VGfJdZA=
X-Received: by 2002:a05:620a:1710:b0:8cd:972d:335 with SMTP id af79cd13be357-8d01c7969dcmr1595894185a.43.1774889184606;
        Mon, 30 Mar 2026 09:46:24 -0700 (PDT)
Received: from localhost ([199.7.157.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d028086d25sm638355285a.43.2026.03.30.09.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 09:46:23 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 0/5] SDM670 LPASS LPI pin controller support
Date: Mon, 30 Mar 2026 12:47:02 -0400
Message-ID: <20260330164707.87441-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34437-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E73F135F012
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This adds support for the LPASS LPI pin controller on SDM670, which
controls some audio pins (e.g. TDM or PDM busses). The ADSP patches are
not sent yet.

Dependencies:
- SDM670 Basic SoC thermal zones (devicetree nodes are touching)
  https://lore.kernel.org/r/20260310002037.1863-1-mailingradian@gmail.com
- Support for the Pixel 3a XL with the Tianma panel (for reserved GPIOs)
  https://lore.kernel.org/r/20260310002606.16413-1-mailingradian@gmail.com

Changes since v2 (https://lore.kernel.org/r/20260328021036.85945-1-mailingradian@gmail.com):
- restore review tags (2-5/5)
- add review tags (1/5)

Changes since v2 (https://lore.kernel.org/r/20260310012446.32226-1-mailingradian@gmail.com):
- add minItems and maxItems (1/5)
- add review tags (2-5/5)

Changes since v1 (https://lore.kernel.org/r/20260210021109.11906-1-mailingradian@gmail.com):
- add LPASS in dt-bindings patch subject (2/5)
- change pin names (2/5, 3/5, 4/5)
- add reviewed-by from Krzysztof (2/5)
- specify gpio-reserved-ranges (1/5, 5/5)

Richard Acayan (5):
  dt-bindings: qcom: lpass-lpi-common: add reserved GPIOs property
  dt-bindings: pinctrl: qcom: Add SDM670 LPASS LPI pinctrl
  pinctrl: qcom: add sdm670 lpi tlmm
  arm64: dts: qcom: sdm670: add lpi pinctrl
  arm64: dts: qcom: sdm670-google: add reserved lpi gpios

 .../pinctrl/qcom,lpass-lpi-common.yaml        |   8 +
 .../qcom,sdm670-lpass-lpi-pinctrl.yaml        |  81 +++++++++
 .../boot/dts/qcom/sdm670-google-common.dtsi   |   4 +
 arch/arm64/boot/dts/qcom/sdm670.dtsi          |  73 ++++++++
 drivers/pinctrl/qcom/Kconfig                  |  10 ++
 drivers/pinctrl/qcom/Makefile                 |   1 +
 .../pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c   | 166 ++++++++++++++++++
 7 files changed, 343 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sdm670-lpass-lpi-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c

-- 
2.53.0


