Return-Path: <linux-gpio+bounces-32864-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHl1BsByr2lPZgIAu9opvQ
	(envelope-from <linux-gpio+bounces-32864-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 02:24:16 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6585D2437F2
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 02:24:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48BA6305580B
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 01:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B9DD2BF3E2;
	Tue, 10 Mar 2026 01:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQjjj4sW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41320280CFC
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 01:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773105849; cv=none; b=X1VZTxF3tR07U4MMsWkbUJYupb0lnLRU7D5zgCyqjemHq8VPO32AwGAIds4VCMCB463yuykZOcaNErUIkX6YklmpzaczgkP+Bmvj7V3/M4lqCqD/M894IzzYQan4GteLgQk3drMMDly6SczEjl50jdP7WJorHgtC+cMzEC3QZKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773105849; c=relaxed/simple;
	bh=LiQ8EflkNH/uZA+ems0QOL+ZbRGh6LZN4zZMLOj1rXc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CiEqB4guwA8u2AaYFOFDeeKj3Js066hvKd6g6aFsB/OzbfXcg5wB+JUM+2cYiWWI5FSItCv4L6oTU61eT0SbNacjX7jepk7zv+0PUcrDLZDjOpOAo5J/BMGgPCs2sY+nva9JR++T5ZzBmJpUlqivFn9GZ7k5zmhzde81J3Nnhqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQjjj4sW; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-50917417efbso13214081cf.0
        for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2026 18:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773105846; x=1773710646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7CeMWLpnBLUWUr8MpkL2IM0mC+LILizg1OzjRtJe76M=;
        b=jQjjj4sWjru06czyKnUE3iPes3HzZgXEDEQ30cZancv4ilEdVBI3v6jCs05RBLz3mG
         iGuMEMGNMDHe+GJ2t3k1WEhZxY9jizavMUFOsfvRdN/nMICVNdg2TnOUExpIiYZueqNa
         4E81sHQVOfDAb+o/447EEZZ4DERZJME9Y7IkTOORQAPKtMNkq9H/D4Zz8pm+dEGv7Csz
         caAjURm4FOsr63oHq0DhXVT2hG4Z1xWi4LmcQxTDS5UoekZtrEQljy5DGYPOIV/81LHm
         QqErcRi/scKh225pJ2sa7+uwlr6J4neKajpR9dbrpJ2JgrjUSmR4J+xTxLzuL/2lon60
         axQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773105846; x=1773710646;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7CeMWLpnBLUWUr8MpkL2IM0mC+LILizg1OzjRtJe76M=;
        b=uXpSMvwEe6sxaOmj2RF7fbQUHK1DTbvfT1Eqx4LaccnptZF0HjCKQt9KpLKPQ4VJvY
         E8aZ7sZ5ck22EldRewiasFYEuiclO9kJUXdnr5KW9Rzjcj0PLX5Oas91sEKwRRyMCv/v
         7sB12gcnBpm2f+cSf5DXm7RC9wIsAUF3zFzPudwKDnURm3ERRFY0aXN1+E6Ce5ol7/1s
         wboQ2WDRRngStQu1RFMpjiopuFAveIRZbfWsvRUpCzf5vX5NQs/HHl+clvbZYUavx6nS
         f2H4aWsH4ofQlytsuExqGyvrotA7tfRQUv/TgddIFxn4knUQ09yHr685bdTXPmDPzBne
         vKqA==
X-Forwarded-Encrypted: i=1; AJvYcCXJmCRscO3kuVSBksS7BnwxCoRXG1Q10MmvKyMe3uXwytgU3zp7XbwJh6nU2adtp06Ejsborf7maWJp@vger.kernel.org
X-Gm-Message-State: AOJu0YwL7kmwNCDhXLn5U97DUjGafMSPWfpQnUAliOebXB6qBJR8MLrK
	9RJgqXS4e1RF80Tn1ahOa34EdlW276XNMwR2pquYDBcr2H7VNGNUg84v
X-Gm-Gg: ATEYQzywZFJ498oX4Tit9iwDrd9JLHNaxCoi6K/fwhT6k3fTF9GSsolmZoF4EG+QT6A
	64fOBamwGlb7kd0DTlr77Lh30K2HsG6GN28vEUfUx2mHtUUezo9LfJGAe1KTWg0LtyOHVZcoIA6
	jUYgDZcs2zuXOPqmrvNRaGZvRGsm/jrOW7uZgzUh3kVU/3J+S1IvoqRTEEJTs4DO+UVXpH8QqDt
	iGATn0XFbV9AqtyQHE+N5fSV+urUAAsmWzO20TwMFc4vu0UWHSGTuQBuo8hlh41nMpP0+NOlD2d
	1m0PkhszjEve6FNYRs/VgeqsXOH3mzq8iL6IqfssQ0OHDf03HE/FW/QuIQegmJ3k6bBV437Ld4v
	01WyU7761eRnbu8UtmIPLmjZK4+QaFx9dOCYnf+6/VM9vfA/CeCPhftCMf2L2poQeGpzZjqjUHx
	AN/MWn3vZJnuFc7qawa5tppRB+UUv8FTbhfdeY32igMTYVDBmcD+DwjxiGbRjHORy4yza++it8H
	5X5rwoRYZ+cj2s=
X-Received: by 2002:a05:622a:1350:b0:509:aa1:71eb with SMTP id d75a77b69052e-50925ff7427mr20643721cf.13.1773105846247;
        Mon, 09 Mar 2026 18:24:06 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50923ed69bbsm15741051cf.28.2026.03.09.18.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 18:24:05 -0700 (PDT)
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
Subject: [PATCH v2 0/5] SDM670 LPASS LPI pin controller support
Date: Mon,  9 Mar 2026 21:24:41 -0400
Message-ID: <20260310012446.32226-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6585D2437F2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32864-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

This adds support for the LPASS LPI pin controller on SDM670, which
controls some audio pins (e.g. TDM or PDM busses). The ADSP patches are
not sent yet.

This series depends on LMh because the LPI devicetree node is next to
the LMh devicetree node (NOPUSH: link to LMh).

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

 .../pinctrl/qcom,lpass-lpi-common.yaml        |   6 +
 .../qcom,sdm670-lpass-lpi-pinctrl.yaml        |  81 +++++++++
 .../boot/dts/qcom/sdm670-google-common.dtsi   |   4 +
 arch/arm64/boot/dts/qcom/sdm670.dtsi          |  73 ++++++++
 drivers/pinctrl/qcom/Kconfig                  |  10 ++
 drivers/pinctrl/qcom/Makefile                 |   1 +
 .../pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c   | 166 ++++++++++++++++++
 7 files changed, 341 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sdm670-lpass-lpi-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c

-- 
2.53.0


