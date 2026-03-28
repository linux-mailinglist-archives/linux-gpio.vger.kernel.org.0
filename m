Return-Path: <linux-gpio+bounces-34336-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2B8CJMM4x2nSUQUAu9opvQ
	(envelope-from <linux-gpio+bounces-34336-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Mar 2026 03:11:15 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FF734D02D
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Mar 2026 03:11:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A6A530413B1
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Mar 2026 02:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 690F0355F2D;
	Sat, 28 Mar 2026 02:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kXgq126o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAB134EF0C
	for <linux-gpio@vger.kernel.org>; Sat, 28 Mar 2026 02:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774663804; cv=none; b=bHqLGNlN8dnnYqlcdEHY8ZKRBr3bDdP0tgw6NPW9/5OzvqUVzp8yCxaKveORZTYnttY7yH+BPPdl4lqNBCxbDBE+H2spWH8GN2VKyaEjFQeGTcnj88UTxSRxEOrVhKDvHJ0uNX/CQwhOZfMRU4UTy8ad9pM3nPb9AAbeW09Fv+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774663804; c=relaxed/simple;
	bh=uW/3K3UMjEvwTByyxHR7Fhx15GvNRE9uCTdeKnub7O8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YMcHWhrkoWvB5TqIuu4NTnw2y5d42zu/rcuvIMeznzrMLSlmXCmdesuYMi6j5DdoCppRxkEsfTr+mBivU35filMwSf+WiS3aTGi/OeZ35+dU4B46IFcDND5AIbkC/8fmduwNYCqiuPPkCDQ9ZkCx78LZ3m0vdZ4mQ36oOLzUgC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kXgq126o; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-89cd8596724so30069016d6.0
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 19:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774663801; x=1775268601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6wJ27J4UnIhxs5w1VYO5h8hnetS3rFQPmJPMQB2sOXQ=;
        b=kXgq126ojvs944gyzr/zdrqBdN0g+WfOxXkz9MfWZA03mq1Cu2fly0uMGEyR5WDD4Z
         Aun8p0WurkO8RtwzTecjG8Uj+bmvZAhvIkyVG6dLgsd0dO1ngKfKQ2+Wqh+o1F69Ivm3
         8fUAnlzviy39BIrsI8yLioJI1OlJiz0pRgMryup8porp19xaZOk+78HwWS9+g3iCl1mo
         FnQ0ajaGn1HIx/fTzZR0pKTyOW6KFsHi0UKQVYb1ALDPTWUIXIfTIzCuPDeWJtChbsip
         PQm4xu8S+GUxYTtbKK3AGpuW5aZDbNy4sFdV1263aLY2DmUYq/f5TPKIKzdK72gpgzyj
         g/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774663801; x=1775268601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wJ27J4UnIhxs5w1VYO5h8hnetS3rFQPmJPMQB2sOXQ=;
        b=A5G2z6UnmXjQuezn1rO90W1JzEVX/lZe9xRjtHz2KnVKqB4/JxCe1jZCh/gkSFnSGw
         8nWhOZESctdvsYU3jXnF0Ne+cDxyRu/seXJCDTgNPY3oaDk4IvWc5L1YFcvzVu9QCwuJ
         l3rBNZoSf/Ebbg3RTuvM/XXe+DmyvRZtBZB6KEHohbGgEkY0xntt6RdE8CD1t4Z57nmV
         my2DKAmSNqd+gel0GLAIfo0cVXZqsODA0k9fJxxSBPx8IUtXt8ld1acw06L2FN//sp3O
         kG752yVwL3lbiAmUIKTH41LORakVBOgFC6MziA9xG9R3d4okZVsCZ90NC2ENs44MPNnE
         Ycqw==
X-Forwarded-Encrypted: i=1; AJvYcCXrpZZGF41PPnDKHmUAPezHyUN5rNZ9W1NRKkFoIZk1Y0PcZt/2qzZQEMjBoXF0q4ZbmREt50WDalDn@vger.kernel.org
X-Gm-Message-State: AOJu0YxEOL138m/H14IqAqt3oNyyZ5ND8pfwSnI5pQbRf6eJtw6Qy4V9
	r2bDhupBNG3HwJPLP8ZNzY1Y9mm9aUyxaG7XHYJ7E4Re/RNNGTqc9Hrq
X-Gm-Gg: ATEYQzzhbq/K88YVFCONAawGqzrU596jHgSDSsks+FxLxLbjGHNwnfpzRClWTAVx6LT
	i3eqFEgSzIWQFe+y0o6u8ja+y8I9anBdXTIvDDJYs8YyWiTfm8lP39y4xVVPWQCK8yxu0HUo1TL
	4JWL49aC8l7G4DvEsuyulOqntrBFqtRFkcvAID9jfCO04oxJFyO+IgjPBQLdSu5QySmQGcemOBD
	4ZxpktFdJvBQf2yQN+oSuwumL1hqPYXxVt6KTHnRcDE5uF8C/ESOw7xdNVDSpwK/g+yjANaE+kx
	RXMXCMEC0yD2f7yCoY3xOtrwNV/jZbSaEDlH/pRUDoeuSL2rEw4zurpVXhECNc7vBgAvNTlgjAG
	vHSqlOnnvGEro4I+AojVRzXxLfa9V3WoQIf6pjJb9a4fOqXm7Cmfvfnv5NohKvphnUFcWrbSE+x
	IO9X0MK8jWKMy1DiTnXODA1HLhCY5evxbMGMsk
X-Received: by 2002:a05:6214:2425:b0:89c:dc57:326d with SMTP id 6a1803df08f44-89ce8ea0a31mr69749096d6.38.1774663801184;
        Fri, 27 Mar 2026 19:10:01 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecf2820d8sm7937796d6.26.2026.03.27.19.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 19:10:00 -0700 (PDT)
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
Subject: [PATCH v3 0/5] SDM670 LPASS LPI pin controller support
Date: Fri, 27 Mar 2026 22:10:31 -0400
Message-ID: <20260328021036.85945-1-mailingradian@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-34336-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: 32FF734D02D
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


