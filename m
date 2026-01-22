Return-Path: <linux-gpio+bounces-30909-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCpMLPZIcmnpfAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30909-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 16:57:42 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7546969545
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 16:57:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8938F300278D
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 15:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0410844104B;
	Thu, 22 Jan 2026 15:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KdBn/v6E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40493D667F
	for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 15:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769096619; cv=none; b=HOIZy54BSMr1HivykQ7nbL8yzmSmPnxwQgMgHeSYgshTxamlBiqAvX7iGhjESDDM80op89gNo61Mo+y6jYLnM1ZWVRVNLQw8CP/liJ6hu+faSan/9wE7SKjDi066CNVH4DVbdCYFKQCnjfwRQwqu7f3Nvcoyu7mW/FZv38Ne4aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769096619; c=relaxed/simple;
	bh=sXR9KtyAp4dsOisRc5Qon6HKDNpy4djntDCBxqC+GI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QnhqJFhlu27Eqnq8zaAA/1/70FSLrd2WcqkfgsiOAAmvNaMuhu7dFNH08a1nUSDsddHEI1tmrhcQJVv/VnF4+m52ykqZjhE7UKkndJs6LZib1aSlVUh2zqM4RJIMu5eaqyZCC9uXwsG7n7IqMZ71UmINbqnoQTgGS76PdoutO4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KdBn/v6E; arc=none smtp.client-ip=209.85.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-6505d141d02so1602401a12.3
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 07:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769096614; x=1769701414; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ae68cN22St48fgKU3R1GMDois55LwnfaO6xzCLCshFk=;
        b=KdBn/v6EqIeTCV0UdT9q+AgE02o4VVKrv7hKTsCcR2+tdPqPL+Hb4sxDWGxzCSjp8R
         qw6glICslciKi8oq27QwqFUJzDyKlCyHPgjyhU/cpGgU885YZho+ihVUE1LX7Bby7UTl
         Ojbp1F/OT7aeS6nQROqPHGxxo7Px3wGaKurkAanJIGrjMQQ1Ksw+ZmhKE4n9oRwZpcHJ
         ERuSKPTdFasnuLuzBSfvLjAGyRk4NOQSLNg44gJtcSxm+Ez4JPB/3U53neg0C3JvuUQ6
         +oJ6yGygMOtJDZtr4Mi6qVLNP8QbJqyUaTWUVewpV7ztN4svxkOkvQBJB3cs1CgjDg9S
         k0Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769096614; x=1769701414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ae68cN22St48fgKU3R1GMDois55LwnfaO6xzCLCshFk=;
        b=bMtgwNsFKOtFfh76o0c5smz9BwevN+dwK7aw+WVBBhJNrXcEeA6XLdtt8KWicvxO8N
         wjCDLwRMNlWqU5EJReL4w+sJJ/TegQpmvWo5xyTYbVjEhOJwW4gpc326Uv1r87p3Y2zD
         CmK/WSpAzZbImUD7pqQ6ix+cE/7QZbPMYrPsVM/Z84Y4/VLdESZPLeGKXFrYwvJnXWSO
         8+C8K2v+FFpNW5VHKsIVjwTsBmCgwcoxamUi4VfYNNjdKj9KpYlz+6jULU9d/+arg+eA
         6kfVgw/l07epZRiXi0WVGxmy34o3x3TIGJvYG+R0V19nHa/1hAEbxLpkn/HWXPZBofaG
         QakQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/gwrWHxz4YYk2TTm49XV/V9QIQ6p4uLKEiSuANjMu+bEmRdNGEiiFpV0zyLud2qZmaxMZ2VkvOpIr@vger.kernel.org
X-Gm-Message-State: AOJu0YwzSX0UcmyN4adiQlbD7WsEBbvlO+1dy9UrkFsVZx5NF6w4nWYZ
	YplajskB8BXgmsfKCzZUKJnKHal/DBYJva8YvXHmxH55EokjCCk4LiX+4EibPRuH7Ay+FrX2Ky6
	PwWjh7j0=
X-Gm-Gg: AZuq6aIZl48lpiuTW/AqD/h3H30c6D8m7O3K6Yx5B0Rmv7wynipDFW2k/rAZamKRyF8
	j6CZXH86Y61Wygcq9GqEFUMJ8H8912pfcykXRROTJd17KsL9IqDObn+ahJfSGEkXgbEnZ6/JIyT
	hU98ZL8nlCfYIG0xKCsQOllCHAsQaOu5/YzJm5oRhASnTgrS6nOHW3CSwpgJYCTOa2N6y6Fic4E
	L1xByXNkNY/pfe/J9Aj4UOqO2v+WZd/Omny05FDFJ/eU/MFGWgHawHpLRqN6YSN8C/7DUO/TZtI
	yEH+hzMuOoDJ0M18pmGSHMafWEriUT4EbznI5xrTaCOzwr0PGLFYT4TFgL94Z1YkqnzYgzwfbmP
	OpvvMUY0xR7PiFEXeprSOPWgxtem5IraXWND0tNWSRVhHuyNwNHnlEredUZmZiwbsltz8asWRCy
	51VmLelq6GOotG8r7wytPL/gMBwifRE6Ut4oO2g6fzSjQ68lfpE2TZ1Y86LfYjw1pTMn6fgugtt
	AqHfqynXDeUNhNr
X-Received: by 2002:a05:6402:27d2:b0:655:ad4d:66a2 with SMTP id 4fb4d7f45d1cf-6584874b756mr38972a12.1.1769096614097;
        Thu, 22 Jan 2026 07:43:34 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654535c49f4sm16334363a12.31.2026.01.22.07.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:43:33 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 22 Jan 2026 15:43:28 +0000
Subject: [PATCH v7 01/20] dt-bindings: firmware: google,gs101-acpm-ipc:
 convert regulators to lowercase
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260122-s2mpg1x-regulators-v7-1-3b1f9831fffd@linaro.org>
References: <20260122-s2mpg1x-regulators-v7-0-3b1f9831fffd@linaro.org>
In-Reply-To: <20260122-s2mpg1x-regulators-v7-0-3b1f9831fffd@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30909-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,gmail.com,bgdev.pl];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.draszik@linaro.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,linaro.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7546969545
X-Rspamd-Action: no action

Using lowercase for the buck and ldo nodenames is preferred, as
evidenced e.g. in [1].

Convert the example here to lowercase before we add any bindings
describing the s2mpg1x regulators that will enforce the spelling.

Link: https://lore.kernel.org/all/20250223-mysterious-infrared-civet-e5bcbf@krzk-bin/ [1]
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
index d3bca6088d128485618bb2b538ed8596b4ba14f0..4a1e3e3c0505aad6669cadf9b7b58aa4c7f284cb 100644
--- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -75,7 +75,7 @@ examples:
             interrupts-extended = <&gpa0 6 IRQ_TYPE_LEVEL_LOW>;
 
             regulators {
-                LDO1 {
+                ldo1m {
                     regulator-name = "vdd_ldo1";
                     regulator-min-microvolt = <700000>;
                     regulator-max-microvolt = <1300000>;
@@ -84,7 +84,7 @@ examples:
 
                 // ...
 
-                BUCK1 {
+                buck8m {
                     regulator-name = "vdd_mif";
                     regulator-min-microvolt = <450000>;
                     regulator-max-microvolt = <1300000>;

-- 
2.52.0.457.g6b5491de43-goog


