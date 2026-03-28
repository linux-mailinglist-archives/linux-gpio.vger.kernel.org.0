Return-Path: <linux-gpio+bounces-34337-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBpPJYs4x2nSUQUAu9opvQ
	(envelope-from <linux-gpio+bounces-34337-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Mar 2026 03:10:19 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5279134CFFE
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Mar 2026 03:10:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D9B41305F539
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Mar 2026 02:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 877883563CD;
	Sat, 28 Mar 2026 02:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qZuGNvUx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF9F351C09
	for <linux-gpio@vger.kernel.org>; Sat, 28 Mar 2026 02:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774663816; cv=none; b=jXQQlBytovwejiNI9NXucXXDmbbz1dSSrHnOJwHOq6mq0+oodjDsyNW4StnRklsyNBbR0v0ma3r5Bgbee+pXuvErCYonQnLcFFr/z81L4TGljutmjocdXRsde5AtzJFi6uvNbBmvofcC/TJMr6TF8BkA2vUMZntjJKLHpWRn3Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774663816; c=relaxed/simple;
	bh=zJPyjta3QLSXoZw42QVF4jNijJKutu70WwFNGkQPwFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GFJUa5lv5ACZJEK+y66dx6AsGutGRhFoMRWNo8GFnRIU75i8Bq7Q0205R8X+4NfINHWxOdhfZK8PE6SwjCBrklQ/nR69okhgj7WKZqiwd8AqlAkKtZnUZVKSXsyRTCRvyojQiLq+CQjG2H9XzOoDcMpwtMS0aR06Wbl2zbmhQfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qZuGNvUx; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8d00cf835b7so360319385a.1
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 19:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774663813; x=1775268613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y79BlWEWTg9b8lgzADfvCeuR3QiTHOYZHrj4HPIVc/8=;
        b=qZuGNvUxLe0dfIUkn8XveRLN2K669SijhplCkrADD8HezrkwnYlTcx26Viu6IMOoDC
         pDVaJTorK1u808kjLogXVTLIOAzlpvI5sxjPvXydPEMGjnCzLe2qOM5klziQO/1q37y5
         XuOfePRtCksUhrlI/0k45KU/xPzG4+nQ10HZsGnpgyP9mvcSfGVsPhgitin6w8TcNdx1
         Db0QZcSR33OEJl2cRzJHITYFIJRrtzoNOucHbrYmp7Y74+rFTlv4MDU80CNv8jM7vIfq
         TaidA90fj0Db675ZhpXarFQQEVX92KY1i1W4QNS28zVzyq66lEhhMxDhn9jd7kwGoXPE
         4Yew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774663813; x=1775268613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y79BlWEWTg9b8lgzADfvCeuR3QiTHOYZHrj4HPIVc/8=;
        b=C/Q+j/PluAZCEJs5WSAVX6Xos8XXnfANDQQEptabaCUVUKyW7rl9vCMatAPampiq4c
         TkL0Gmcd6M5FzjRDUUn5f2SX5G99YEnkbn54Vm5mP5BdEyR+ZIx4KKDnICdU/37FrqFV
         DBOPglnKE3VqqzjgaToGB6hjMEHRj0/m5XS0HS4OEonWXaUx6Js2FYXOVxtotCeRS8gd
         s51KKmpdoV4tYOuxG0/FW2Rlk7GG6LtfTOz3wlGpKild947jyrF2Pnrpt4CvHUu6Am1/
         aspkMItMEba4EQaMrlaC+1blgPPyjHfjAeTdF49FqwaeeOr4riZJxAoM0s1paWfBvuaK
         oFqw==
X-Forwarded-Encrypted: i=1; AJvYcCV7m950vFqrvZG0iaKT4N4rwusDT47yG9vhapunTX71+6rfsx87lBMX4j6EUBUMG79KepOyNBaaL3Ys@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/FppnMjyeEvVWtcUY04hJxp4lZvzQEQkNhuAvFjVld4f/38SN
	+4hZb/JOLsKvbejxEkkm+7AG4XSp4IqkEX1ch4VxwHxswazTaknoipnb
X-Gm-Gg: ATEYQzybGc27/e5/kIOolMSa7/8Isd0TqBF9oP60NF88X0a+x90mvypAQcAaUM1jRbt
	S9nvXWiETpoV8iJ4QIT+w8gOzEpmkARSvv4cv1cZqdIydGgUfuuFS6flI19z6GspMYszKBSp0n6
	/j4j5btJOcdjCxO6ZlAScOrLejzZ+SEMeCPITyfybttY4ptO/3uM42Z+FcHYOMTCtLysOfHoJ62
	DJtIba2IeL24yQtzfo01Bxm6+tkva0HDwS755eoEUir11lH9gM0Xhylq3mw8NemwYpfHQ1kmerJ
	p0TcE9IS52B+9EX479JkcCyLnVDs27jGKboCoZqWF5MA/9lZ9jXtG6MW91iw7k1WuBU2GNtHpbj
	g5wjj0CAIVNUpPJAPFd2kyGMB92LG4EvAHiVJTW+/H9aGSp+BCJ+E2e+/cs8zYB6o6O7p6cNinj
	ffchfawxUm7eZN5QcJcjgIFxeu4A==
X-Received: by 2002:a05:620a:1a0b:b0:8cf:de1c:edeb with SMTP id af79cd13be357-8d01c58f42bmr597133385a.9.1774663813037;
        Fri, 27 Mar 2026 19:10:13 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d027ed7ed0sm72120185a.2.2026.03.27.19.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 19:10:12 -0700 (PDT)
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
Subject: [PATCH v3 1/5] dt-bindings: qcom: lpass-lpi-common: add reserved GPIOs property
Date: Fri, 27 Mar 2026 22:10:32 -0400
Message-ID: <20260328021036.85945-2-mailingradian@gmail.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34337-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5279134CFFE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There can be reserved GPIOs on the LPASS LPI pin controller to possibly
control sensors. Add the property for reserved GPIOs so they can be
avoided appropriately.

Adapted from the same entry in qcom,tlmm-common.yaml.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
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


