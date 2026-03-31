Return-Path: <linux-gpio+bounces-34506-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMnyEQsqzGkmQgYAu9opvQ
	(envelope-from <linux-gpio+bounces-34506-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 22:09:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD59371032
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 22:09:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 084FF302AD1A
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 20:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88DC03CE4BB;
	Tue, 31 Mar 2026 20:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pjk/78Ru"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7233CCFDC
	for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 20:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774987583; cv=none; b=QVytsdzHbzCtZyzCFL5IvPI7Y6UAff1+std5vcM30R8Gf21adj+Y/wkGoLCy+juENYzAseWmy872pJKZpbWeZaDyGc7dH9pzi9R0Lh1UPdPsqrSD68O3Fun7G0O6JyP7Tme4Mz0BPRWfwkOZa8CzruyVLBhDG+txrxU84jPm8fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774987583; c=relaxed/simple;
	bh=F2jd4YlfKNnvFt29JpBxPwcNHTeYzsN7X8O4lT8zPQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WVoqDqPvKGmJ9ooqG1rByjEPkY4WbpjOUcaAAR+Z9Rp8PWyg5twT2hhEGz8UQz0sSv5CcY/DUhCBYTS5cA9jhjdWzup7UBSWCcMElzdYoQcypu2a4rhy3IQsQxTyUH7PIUtYkMfhK+gLOc3szDY4ob9L+eBAy/oN7yn01fecFos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pjk/78Ru; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-89c43c4c383so79771126d6.1
        for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 13:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774987579; x=1775592379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19KHAW1LNse1noQ76jOhTwQRI/f/9iJCwz0Ji6ODvQE=;
        b=Pjk/78Ru/5PeRhGeiZ8TQKT3NzKBydjqXqjigkqcm/rC/MnLG0kuLbrIz1/vSfveYi
         4/4f855idwUVJstWczdLVOdNlCcwi8m3LTG+oQpnSaSC4IViXBmtClUGbwxl1IkOj4x+
         YbdUH1vr0dBvVaGIiTLH0/AJzcBc/BdgjXkkKiDA96nGrp+n5pCtXOtuWy0qLk4Sz+t5
         y77DrlXhbekguX+UtfTFJbs9uLI/zPTKaUrBNCFZAbcwEpi/4DoqTDfDEhPOF71BGOPs
         FlZa4oCMv+1cpP4XCqdWBoOulddZbcpaV8jfGRqhYVd+nyojr9oAjTb1O5Z934q5lJm0
         +YwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774987579; x=1775592379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=19KHAW1LNse1noQ76jOhTwQRI/f/9iJCwz0Ji6ODvQE=;
        b=qmeZJ+F1el/8iAT5l/2yjTk+L5y75ucgPIcG9fekQFwaIC6eeeyp5UUP+mf0Bd/Czx
         BPjuVH2OfyxalrCVtNlsFU2kbvUlClxaUaMXRDTQhCRGksdvUKgLh68G/C5Rny7mh9IY
         5QXOeEneaZauKIsjNzswWtAXug2poYtAa7b8ynIRCVU6RI3myDaIMqkepLYasq3Qb4NM
         fDiUukEQypFqUw6sBgIR4mnS1QCeCrKXSbTfx7TjKciwuUon0f3fTMI8wqpyqMvuUDkD
         tFmM5RbWH6+r4WJmkYxomD+AFRS7xEFAKEBpvK7YsYeYXvyUQHBQkXLCj9TX5jiYtNp1
         vznQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9ErPzHWqzwi4IuyfVQUhOpdsOHz6FM7rVkVyoMOb2HQK8xcZ+4/JK4J0/CbI4pkVXKRdRArbAZtJ0@vger.kernel.org
X-Gm-Message-State: AOJu0YxpBt9GkX2fAiyqg+V+FBg9/lmPkrt05DYuGLJmrWKC1xcDxK0n
	6dqYSOn1EE1GsNth0+tMx9xgeEWB9aFOSPgUqi308Nqqnyc7+exhx7KL
X-Gm-Gg: ATEYQzxf8L0+juZEdz8jA2s4BHtEGTxQDEX/aClk6Wr4q1U6xWisX0wGIxgxYPWEVdj
	Qvg4hUWVoeVj59XqPLEop4mfQTfezpzOEyxb/gelDt0S+WmoDZj/kAS/4PVtO71izjfY0BJ+7OO
	OfTmZUCUEtvhXGxlxcUDdJ9rw98bvec+8ENxyofMI5xlwTfhmBIn8S4LUfCd6qcVDEMKF/gXMqN
	nrxyqEEpPUs5GgprET10Tw6ZrYWjlepLNfm047vzPaHZGl7LQ8PQW+SkPCsNKHJrx53OCrZY0gm
	Ejb8Og+lqyW50Cjq/HPA+ipqKhcJQVt4h8wJNWrwAbdACP8kd7rLXSesepgboT4rlOaZ7Is9xHk
	uKPiRhduwWResNZ4izLu6FVOgq99pJbS9av4eA/6DD8ZszbFoMDokWss/Ka1PSBcbJHVsghmdaP
	7j8XUC5lvNz6JOoOyMBu+Vx2AB
X-Received: by 2002:ad4:4ee9:0:b0:89c:a2c8:9432 with SMTP id 6a1803df08f44-8a433d4fb96mr17415776d6.0.1774987579053;
        Tue, 31 Mar 2026 13:06:19 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecbc9e086sm100400496d6.12.2026.03.31.13.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 13:06:18 -0700 (PDT)
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
Subject: [PATCH v5 1/4] dt-bindings: qcom: lpass-lpi-common: add reserved GPIOs property
Date: Tue, 31 Mar 2026 16:06:55 -0400
Message-ID: <20260331200658.1306-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331200658.1306-1-mailingradian@gmail.com>
References: <20260331200658.1306-1-mailingradian@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-34506-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: ADD59371032
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There can be reserved GPIOs on the LPASS LPI pin controller to possibly
control sensors. Add the property for reserved GPIOs so they can be
avoided appropriately.

Adapted from the same entry in qcom,tlmm-common.yaml.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,lpass-lpi-common.yaml           | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-common.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-common.yaml
index 619341dd637c..30f93b8159fd 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-common.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-common.yaml
@@ -27,6 +27,14 @@ properties:
   gpio-ranges:
     maxItems: 1
 
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 30
+    description:
+      Pins can be reserved for trusted applications or for LPASS, thereby
+      inaccessible from the OS. This property can be used to mark the pins
+      which resources should not be accessed by the OS.
+
 required:
   - gpio-controller
   - "#gpio-cells"
-- 
2.53.0


