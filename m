Return-Path: <linux-gpio+bounces-32869-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AA5NNVyr2lPZgIAu9opvQ
	(envelope-from <linux-gpio+bounces-32869-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 02:24:37 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B507243855
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 02:24:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6855530BC795
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 01:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44B99175A7D;
	Tue, 10 Mar 2026 01:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MefgSQ00"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10D5261B91
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 01:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773105858; cv=none; b=tLlsJqBblqnUciMnPZwFiPdJx5FiIT/hacMzLgpeCv8SYcraZKBqOGOcgEkv0UrV1f6G6TTcI9BAQC/xRgj6o730phnL/Fp2Y3W2oDErv79ecmE1YdNNC5KCl+MCyloYqKUVk+/FHVZYbl5DgD15N5vyxRoZXoCQGvPwLp2xtss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773105858; c=relaxed/simple;
	bh=4Ze0y2cjmtPpXTVBK66uy64h2g68p4mzHlFXiYEMiMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XzyEVSCyEzd5VooiQ0srdQ/tbEgCxiHJmMVS5vm2Ar5xTeKpqHGHT2SmkM5f72nYOlXqOS2MQToz3QLYyTjVS00OGtjX5q6jUtsnFWRAhBpsyxWRrnpsapybgTiDXgyFdMLcP8rsN8CxzCi8fHw4lvW6LYgv8124V9j0pLjwJ3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MefgSQ00; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8cd71fb9f06so217241185a.2
        for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2026 18:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773105856; x=1773710656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nmMtH/8gaMTRAwfMry41Wt1YyOu+JvBNqb6FqEJnCSM=;
        b=MefgSQ003RNz68tLL7MROcNp/GhnbL0WumEuhG4iq4jLK4giCbHM7+pOlp2tWV79s6
         mEoe4REMP1aTnwptdnSjy6D2zRYbUh3rbZTt4pzRKHWAs1vy+Yrv0ave2ebZNbS4IW/F
         BwvZwoXQQA5B5g+roZlBV5K25IaRtG+Yq1akHfaRjWmdmcdPOQEs5IoiGoqBc8bxix9/
         xvS5ft9wgOTrHvVE9yA7R7MNtUaH5ktATvYzjVuk4J0in8uMOUG76Os7Nedj71aRToLr
         ndilUas3f+DC92Q7FtzffvP13L6pEABK9F5+LojRYNqlosk1bcBOm9Z3l28UUWNitQ/u
         B+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773105856; x=1773710656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nmMtH/8gaMTRAwfMry41Wt1YyOu+JvBNqb6FqEJnCSM=;
        b=EKT2CW5mTKuGq9FC5Pt6Xj+TSPF+vILJIU2ymZcKBXDlCR7fwbbqlAEi6uc+6totn/
         IPPMAIEKVf442a4dnzQUmCJYURkfWLvs4GClz/oH7Kw0iELoHKOTEC15G1tXBgULT30n
         TU4s3UYx2kgZPgTywLSUqPxXG1opvH5PmYt88HztlLt9O8t88wA5jH30rdHNUcLHqQER
         ExrQ1Oc8KdYY0AvEe/aGrXzXymfLBrprFyy2AjK+FTiJSajXpFMIlITnh8SAnxGgfKbS
         ur2p8e3WESLrCvF9OC5GTSvQXtn2jjlzQ1mnzyQq2rTZuT93fieBpDpKPF4naXEzuy2E
         lkiA==
X-Forwarded-Encrypted: i=1; AJvYcCW2tMf3Yh6r+Z4Wt7dkpxev6zWISYaKGKxwe2+PqsjF/qsKvZlzW/OsJat8jggSlzr0ncCV7K4ju+DK@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/6i6qiAiseCPEYjNYlH8NBUCEm/wj4+QK0wcfMoWDcFB8DWxb
	Pez3a26bg/oxmBk7gGaM/XBnOatiH6GLyU5q4BiYUWTN+QLTAEG9YrEg
X-Gm-Gg: ATEYQzyLJA8tjqk0Zq8/wFFf9+/iqwSuhC1ZU7Ay7P3RxI34uA94ErkUUjBEVI1r9n5
	3s9YuP7cghLXjB9tQKwc24mqTGoJCNjqPh2jL7P+YBS2T8WOtYfkLtYMBRfhuTd5AhAwD59dTG0
	F59uDV/KzcoZpjxKToPFc/Zjbq2UI82z68TC65ghGBqnaRVVgQJ6FxB7YizPJm9qY2bd2YzoyAh
	bjGbmksaAbOxtQdvnvL+uTjme4pfvmc9N+qUmTneI7w4xCDLe1DtcbuAg9FAsFMIgtZFN2ErqG0
	JWTBexRZruGhpWPMsBA8ti2wftxvbL33J1fO78XjKZKd5lP/aEO2lA2OJhxQ1agvhvuakU1jhJK
	Frt6XOZ/1Nm8qE3vd4zXmSuUCKsA65+0fnpZaFP6pmLiGZWuNU7TGbPvI4HJ4rwFGcpORVZJKQC
	9wB85w7eRB6rnJDMxnXlpkuXAd9IefL2HPlCbflArMlrzGkdwhOK/JPwNdIdRb2Eq0kT+Fhcx4L
	QbttQiQUSqpz/o=
X-Received: by 2002:a05:620a:31aa:b0:8cd:8ee3:5004 with SMTP id af79cd13be357-8cd8ee35361mr443453385a.27.1773105855850;
        Mon, 09 Mar 2026 18:24:15 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd8ed57f3csm215379285a.21.2026.03.09.18.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 18:24:15 -0700 (PDT)
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
Subject: [PATCH v2 5/5] arm64: dts: qcom: sdm670-google: add reserved lpi gpios
Date: Mon,  9 Mar 2026 21:24:46 -0400
Message-ID: <20260310012446.32226-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310012446.32226-1-mailingradian@gmail.com>
References: <20260310012446.32226-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3B507243855
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32869-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.0.0.12:email];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Some of the GPIOs are reserved for sensors since the ADSP also handles
sensors on SDM670. Add the reserved GPIOs for the LPI pin controller.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
index 6116ca8dc426..d8e0f29b8c38 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
@@ -517,6 +517,10 @@ rmi4_f12: rmi4-f12@12 {
 	};
 };
 
+&lpi_tlmm {
+	gpio-reserved-ranges = <0 8>, <12 6>;
+};
+
 &mdss {
 	status = "okay";
 };
-- 
2.53.0


