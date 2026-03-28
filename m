Return-Path: <linux-gpio+bounces-34341-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALwcBKc4x2nSUQUAu9opvQ
	(envelope-from <linux-gpio+bounces-34341-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Mar 2026 03:10:47 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F25434D00F
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Mar 2026 03:10:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B8104304951E
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Mar 2026 02:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3902E3563D2;
	Sat, 28 Mar 2026 02:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mqgo4Mgs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BFF358361
	for <linux-gpio@vger.kernel.org>; Sat, 28 Mar 2026 02:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774663843; cv=none; b=MOD4xIX8SBYN4rNBWoH8V0fx6AwapFxR8Moi611gkAoHhbbj4Vereh7wN3yqdvCm3Vsb+k6R4ln9Qz4hWo8Ar9C3USFFGEtSIq8Mp8AslaA0KoBKYC69RKta6zAuvfl7QqfAyYP3FgfGFdi0jHvllNz5CakezJHh6zcAWUoxpm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774663843; c=relaxed/simple;
	bh=R69+L2JPeD1MP85dLFV01UZLGFMXU4a/hgYOgtTZilo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ovB76wnINjMSvw2gC3D0XYLAQ2tdKe91Sl0MUgFXaIMNsb//z77QKvvHk06PC4jj2eug3ZFRoz49nueqZxce9LErGt0imPKf48ezzaaR/YJdEjv88WXZMnE12rliKI0p24vBjZ0ngSM2k3D63LWGG10SbIQOtQXQptaG97m6I/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mqgo4Mgs; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-89a6ac6f389so30981676d6.3
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 19:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774663841; x=1775268641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lLYu3/l3eIAYRmWYcKe3ElSedjx9TC854siA3A1aW2Q=;
        b=Mqgo4MgsTcUhLTvbXXSgHovg1o/GOnvAvEjlhSyfEoQh4s2RkqFBoesJ61+bINXHOi
         ipoE3OFQGAJLP83pX39LSOiuhKEFP/p5j2skY3F08FEpVKZ7WHRZBhwoDsnJZnbIYzOX
         bsY9BUhLI8vftVYObiWI0yboA5m7BWY84kBLLK9f+7M0iuowbDQGKtnWKwu1wrmlytKy
         Q3GKoCFWBL2N6TLTeqCwlePIRryggIAQLOh9Rv6tia0mitcB/+ej41d2PMoKaZBp8qVb
         /ZHcrevQBGQNjDkhhwZeG6Kql1MC+t/UVTqx6QvvOJ1sihJ5lIzfB24jTOx0eDNKsCUy
         hDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774663841; x=1775268641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lLYu3/l3eIAYRmWYcKe3ElSedjx9TC854siA3A1aW2Q=;
        b=GbAt+sYoWS+F/ceYi2d3jaf57ap0pgi4wu38jYji/wzp0t2hSTnPQnhG1pXZcZvelf
         hAJB57uHRE3F2HGinDRqQpi14UW9C0lEwwX+KYfQ3nvoEFjdsNVSLL5hKRJq1z2pwQPQ
         9DdaAScUPDTtXrazXrfmG5iPhL3WZdV6aiI8WLA9gjkaHPjZ+UMD8Q+qKCFdE/RWlbLC
         DNCioB9ErsOJNBpPj2PvYdVzNxKY1RTIrJrhjiGnneTIw9QxYPDJopjuHG/1tUeFmsfH
         RJzMNBBBSdAHZ9xgh4Cn/amYkpdoFgycMutS6GJdeg9SyeG/VugRi9lV09ANUMBf7/dp
         rsGA==
X-Forwarded-Encrypted: i=1; AJvYcCVQJbtHDqudgMpHGJE/dBBINuxyeLZix3qI0RPqNvXh4gEalCqQYAVRIAFKb47zDyKpJoQSArFWRbi9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3ANzjF4lJ+sAHDWBGGoVftNmcoDbG0TD5VMoaaN9eaLs/h9uI
	rWBjeAitkjs61XXylY3x5hwpi6S27ZcB+OTpw36FV3g5P2a6uYqur9oz
X-Gm-Gg: ATEYQzwvj96+SCdf4+l3+mumlZWXdSTHuYih0t5JI60aYpQnq4MC3bS0D5/GdRzyz9i
	q2qpZmbRtxUEBIXWS3aeByaXcmOTLAVf8f3XtWLx/v0fzWyiH6mlUoSnOcHvcofivfOT1ghnIfU
	tYWQGaHK4aEKLfXtWfj+IZOxyuIhqWrSYemRvj7BDIeJ6mF2TDbtnQODFpY40BuKwg3LbHPelcY
	G4/1DihhKmaCupJWAPBf4UaAr9y4Y/AeWDiSh7CSnwsp0Kq+F7ie29F/IakmutJQgpEoDXgw8je
	M4tZkfcg12D7N2gkMgz+Ur2vlywbi2GE7ivW1STv3X3TesukONEJLgfC0J84N4w24ORF2pS1V38
	XQ2b9jKbvnn0BzfOWZMalM4lRVT5o4XAFf+eOyAgecxJfDp+Z2rdLUBONeGgwmjKfw24MYJoNev
	UUFTrJobFclLm9p/745KYHFuSOMZqfNzICJ+WXbiZZt9l0I6pruX0ZrXe88kwVesFw8FYTYRCE+
	m3Z7PZw0CtXoew=
X-Received: by 2002:a05:622a:19a6:b0:50b:2eee:4b38 with SMTP id d75a77b69052e-50ba383ea86mr67519301cf.8.1774663840912;
        Fri, 27 Mar 2026 19:10:40 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2dd8b81sm8304811cf.16.2026.03.27.19.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 19:10:40 -0700 (PDT)
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
Subject: [PATCH v3 5/5] arm64: dts: qcom: sdm670-google: add reserved lpi gpios
Date: Fri, 27 Mar 2026 22:10:36 -0400
Message-ID: <20260328021036.85945-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260328021036.85945-1-mailingradian@gmail.com>
References: <20260328021036.85945-1-mailingradian@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34341-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7F25434D00F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some of the GPIOs are reserved for sensors since the ADSP also handles
sensors on SDM670. Add the reserved GPIOs for the LPI pin controller.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
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


