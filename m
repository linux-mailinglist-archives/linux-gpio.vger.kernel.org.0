Return-Path: <linux-gpio+bounces-34442-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJvpJ5ipymkG/AUAu9opvQ
	(envelope-from <linux-gpio+bounces-34442-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 18:49:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0931335F07C
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 18:49:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15D24305D6DC
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 16:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CFED3DBD46;
	Mon, 30 Mar 2026 16:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FpmxGqVB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40E93DBD40
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 16:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774889207; cv=none; b=DJsV/JXwtovQXxbGbrJNQfLCdjatnWaWGVkHIoG/OjdzpO/m4nnkxBZwY3WYr2FQs8qFuQMZLjs3LfQd63ulRrPl8wNAeANu6nCNl5cIpUmcN7mTqUywS9Q7+QG8l/02gBQvaWamQ/yGRYahY8IElpC9rwS0tq/i52SX4Hobuv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774889207; c=relaxed/simple;
	bh=NwyXZR7QbGUDm1mOXnBWp7u20Y6XzKuZR4MVtnLVmfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KMhWXpe7WJ84HehOPDZ4lbRA0IA06uaQBPmKoBnV6DtIdX5+lbxPRNs7gsq8QehGq9tEiJ3x3QIPefB2Np4nuZXfsd5KUvA+jDhyxZM+uhU8hja/7OfxX6rgzJ5q1ALE3uF551+oOxUw86nXYPSg8PoXC5ZbZj0xTGkECRM+J6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FpmxGqVB; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8cd71fb9f06so282436885a.2
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 09:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774889205; x=1775494005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K8GGrYi7FgQrxm+QRG1h+SJv0fVPLGse+KqfIaRcTgM=;
        b=FpmxGqVBiNIIVukMq+z0S4M2iJG76S5my68R780eE0C6R6EwiFOMurIf9J/0iqKg8U
         IfJ6qp0XzpsgBKvUyty52K5a5KQ466BeWMizLMx5YBLEvVhyH6y2r8L1FBtbaKcF2TZm
         fBNvyonAwxdaW2iMDgORhP1fSPyDjpi/trHA3B9efGCpghgsafsd6KJN+vPcG8Cdr9ka
         01qxxpYlxQGDUibTm0/81SKDAamKwjfCviztPcURDV1YuQiH5QodklcAgGyLQ9ZLK5jQ
         FfrhxFp9bK8Isa4UPcHGfKe0qj00DP9DECGrrNvEz95AZqkV6MVG1gMqZakJtrqGOuz6
         fV9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774889205; x=1775494005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K8GGrYi7FgQrxm+QRG1h+SJv0fVPLGse+KqfIaRcTgM=;
        b=kJ2894uBbZZ1EVHLjYqIYaVj8/qH1EcjcM7er8yOkMQkjS2J1Mhe0aAvsN10PM9xau
         IlZVMIbrVmbe4Ldg0xOdKYL6XGT7upkz5JVqchtTy9fHNRWy+KR20yGRYt7ybpGkjI8n
         aPPmTR4bnTJdU9Qu956FuY73u/k9S3och6Dvb/6cmfP6yXRPufOO9Xwvvg9cB5NKHQuV
         ABn+FwKYEJLL9nXUPP83J0Frdhi0jbooBXo2WmCnbkxiGs29f9TTxs9E+EiNRDxDA0Eu
         L/ayF9HLLpe8w1uIH9wB4HAxrC98OYL8nM4OUDg4ukTmM8a6h7/NQ0C7LHa+srayVCiS
         jpcA==
X-Forwarded-Encrypted: i=1; AJvYcCVyQMVSg4WEDvooSY/Mb99JnzBE3515q85yxBOW6tNQxRYC+ew4j/sq2zItsUnbGBKW3gEK9VY4dX4V@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwrg9zbyHTTRBdWxDNEasApoXbu5gqtclrV2X8ShRLYh54IO10
	EHFLcXUOcbcV3O+NXzA6h8mJ5zqW00M2BQTMNsGHuU1Y4VWqtGBJWYJV
X-Gm-Gg: ATEYQzwXIbcUQ97Bu3ldazctHugfwbaSa0oZCZ2vh0oNyRvH0q9hvYz2iao8rgS/ytN
	3oqKSzdodNtHhpzLq+m5AzQ4UbXlXqKO2JRNpbwGkzicYgElESPAOa4d41G5NxBUWP7NfT98DhM
	uYGBpd3aWroCow4mI/9qpN1AztFL9tHI6rphDrZFkKkQtAnzEoQRJEVTvY5iluCiT5JUCI90Wpd
	rG3+k2PeCVfdj4cIfH4wD7w8qOLvtmatQK2AkCddb2O2Hv07lG7HvYJrptajcjZTUYlEpzQF2fa
	72IzAQQ8cj37iJqp1QduPwRkiu9Q5bk/6eZNl2zr6yXyLEZY81QT9r5RQThCTXqhXxfLdbE/Bzw
	T2EddkrspstPsTSsRAErVBsCufMlYapazCgK85w67i0vKZtFJTiz+y9Tvta0P2Q90e5mZXz67Vt
	6g99EPHuFgfs2a/N2AvO/1zr8=
X-Received: by 2002:a05:620a:370e:b0:8cd:8f18:d1c4 with SMTP id af79cd13be357-8d01c8011afmr1722421585a.56.1774889204797;
        Mon, 30 Mar 2026 09:46:44 -0700 (PDT)
Received: from localhost ([199.7.157.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d027ed7ed0sm686529985a.2.2026.03.30.09.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 09:46:44 -0700 (PDT)
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
Subject: [PATCH v4 5/5] arm64: dts: qcom: sdm670-google: add reserved lpi gpios
Date: Mon, 30 Mar 2026 12:47:07 -0400
Message-ID: <20260330164707.87441-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330164707.87441-1-mailingradian@gmail.com>
References: <20260330164707.87441-1-mailingradian@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34442-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.12:email]
X-Rspamd-Queue-Id: 0931335F07C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some of the GPIOs are reserved for sensors since the ADSP also handles
sensors on SDM670. Add the reserved GPIOs for the LPI pin controller.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
index cf7b130ea0c4..b0da24fd1aee 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
@@ -519,6 +519,10 @@ rmi4_f12: rmi4-f12@12 {
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


