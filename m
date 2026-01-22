Return-Path: <linux-gpio+bounces-30913-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKktB8lKcmnpfAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30913-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 17:05:29 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0808697D0
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 17:05:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4EA53030E9E
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 15:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D3FF44DB6A;
	Thu, 22 Jan 2026 15:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D8Aa+9Nf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187A5410D3D
	for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 15:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769096628; cv=none; b=GpyYCoT+7iTLYejpZMUfxPGG+nd0AI6JobenogXNq7WErGDURCoBJ/bLLT2JW6iiZ7QYc2sMo/SXOM8VQQ2oxvZs5qoK00/vdOY+RftK6A6xwSNojcZhoBjRBWMEv8qwV3Mv6grzR/u8BXqY3iO4Ufcs5Q65IM1g1C3117EaxBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769096628; c=relaxed/simple;
	bh=mvLpDBDtjjTy7WC1hkY3vl1ccJiFCt7eD41ttUSpx+U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S1wJnS8WG245JrHzkeOq/Sca4+VGl8po2UtUSCNEFhe3Kb35sHouiv/Tdi4SkES1rX2FIxK6OKGIMfXke7sFecdBNZoDX26XUy/J8ZH4WcO0r+1I8tHvykLCnsTXbCSpSRwOUL/xJclmtygi+dliHaIzwrNUpTCezpsr0kqe+/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D8Aa+9Nf; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-653780e9eb3so1580198a12.1
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 07:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769096621; x=1769701421; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JjAudqG82zBneeIXc6AyLX5P/jBbCjeUnuIz0dqoYGk=;
        b=D8Aa+9NfSwRfvFE9J8LVFGnQBCFxZJBJUpfzXI8sfw61cgY2YjNsctyot9MjAdXTgh
         +4kCgmTz6FVYOiAxXSOVpb0plaTkuuVNVLqdZ+x8sMSiHlMg4Gmqd/XSCE2bZ5JQW9+9
         drNe2yWNV8yMvo54IGIKoTJ0Ao3xyc9HKdjH2lKRHG91SDzTZ4ToSSZx/rDjIRGPnn1h
         GkavFaMbwHm016ZByak6DnTOqpHThlZ02GMArS7e9m5uHJW3e4aGExlhzp5gbsDN0QlK
         wNng27pp0xj3VfSo2rlJx7qNlEFV3rZ4wclAsqPpvd/KySQatvb4xBjgzACAvUP5GTIL
         /o/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769096621; x=1769701421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JjAudqG82zBneeIXc6AyLX5P/jBbCjeUnuIz0dqoYGk=;
        b=IU5Shg2GG9gybE7RuQbdpuVlnL/h0neeIozxPr5vLUZHx9yvzDVKiPllPZ5lv+eCEb
         qXtLhufnsiymlCP7s5IyNIlP6XByija5OJL6nsocCLjTrcCo3yGdE3cP8DF3um9sVsW1
         IE9pvIGn9O5A4G0y2QTi+iukj2K9ZebDHphTOYDSx1YFDQdyjsZM7sg9br4WgQPug+ld
         2voIa5I/Hq/5tiU/dvoFFTYP1OPrO6Yg8s5YEI/e584avjsrCkMmsX9b9NMBgCEsyfk6
         tzYh0x+AOhyaE/OQEtPaUhaonmIs/rsV4kRZ9bNdO2HJWGz1Eszypp25WKSKF0vlFpli
         MaZA==
X-Forwarded-Encrypted: i=1; AJvYcCUgfyDdbKQUO4ZH5o0K7sPQbk0sE9huDxVwnVHMHre2zt38rYP4NBCkL5qnQyBQIavStDmCWOBzL95i@vger.kernel.org
X-Gm-Message-State: AOJu0Yza1x5NCjR9YB0cFPZdxzwKl3VVgQfSUBXtqOyfdWWW3smRLHFQ
	sSeWIh5doMyH6wHcl4NK64JyNkyuFK8qq52RDX9o0e5BZLAv7d7YxTsusAnMHeiWBag=
X-Gm-Gg: AZuq6aIZxRAQXL8zia6t0P2jdfrqU7OKok4nlaxosM5FLgrtJhbMEoE/g0JUbcOinlV
	WpW5CQPTEXsdv3d76Bhdrp1a2FeBEmZruhMvSplDfriHD3EqxHr63X2nZFbRQXuxZ984ybK3610
	UfZKVZJQDYmvxyr6utqSnCV0LFATU/Yu0sbVYmtAWKKvZWprxw7gOmT9pHBBGXdrh2nEHS6cbfL
	gqfWsKBNELUiFru0boEnUFg3cG+j25RnFYYxIvU6+lRHtap5YK5jVTaCk0UXXswWGqUs21KZWX0
	BLzY2PBVFG/HwiWKJUNDX3hDetN68PTHKFHrCubaXayUBLR6uROdCi8Y2kVdXDSzW9WeDGLrJHD
	wO5QzEb3tlXXTBC/+Sb2QrTpSPwVCXjyMXdS/x/GCN9/7eL4qEpEK+s8Yo0pJIh7fhhZBGI3OS3
	RhlfUzVvEMLWYBRIy2Owt8gr++SVt1FcUCSbFX+DNFcfiv6EiNzfH7vx5s6nRaojgNuJx9eOZm6
	BELUQ==
X-Received: by 2002:a05:6402:350c:b0:64c:fc09:c956 with SMTP id 4fb4d7f45d1cf-658487b7eb7mr24682a12.29.1769096620921;
        Thu, 22 Jan 2026 07:43:40 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654535c49f4sm16334363a12.31.2026.01.22.07.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:43:40 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 22 Jan 2026 15:43:35 +0000
Subject: [PATCH v7 08/20] mfd: sec: s2mpg10: reorder regulators for better
 probe performance
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260122-s2mpg1x-regulators-v7-8-3b1f9831fffd@linaro.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30913-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,gmail.com,bgdev.pl];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.draszik@linaro.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: B0808697D0
X-Rspamd-Action: no action

Bucks can reasonably be supplies for LDOs, but not the other way
around. Since rail registration is going to be ordered by 'enum
s2mpg10_regulators', it makes sense to specify bucks first, so that
during LDO registration it is more likely that the corresponding supply
is known already.

This can improve probe speed, as no unnecessary deferrals and retries
are required anymore.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 include/linux/mfd/samsung/s2mpg10.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/linux/mfd/samsung/s2mpg10.h b/include/linux/mfd/samsung/s2mpg10.h
index 9f5919b89a3c286bf1cd6b3ef0e74bc993bff01a..aec248c51f366359ff323f421e453a0ec1d1dfa3 100644
--- a/include/linux/mfd/samsung/s2mpg10.h
+++ b/include/linux/mfd/samsung/s2mpg10.h
@@ -407,6 +407,16 @@ enum s2mpg10_meter_reg {
 
 /* S2MPG10 regulator IDs */
 enum s2mpg10_regulators {
+	S2MPG10_BUCK1,
+	S2MPG10_BUCK2,
+	S2MPG10_BUCK3,
+	S2MPG10_BUCK4,
+	S2MPG10_BUCK5,
+	S2MPG10_BUCK6,
+	S2MPG10_BUCK7,
+	S2MPG10_BUCK8,
+	S2MPG10_BUCK9,
+	S2MPG10_BUCK10,
 	S2MPG10_LDO1,
 	S2MPG10_LDO2,
 	S2MPG10_LDO3,
@@ -438,16 +448,6 @@ enum s2mpg10_regulators {
 	S2MPG10_LDO29,
 	S2MPG10_LDO30,
 	S2MPG10_LDO31,
-	S2MPG10_BUCK1,
-	S2MPG10_BUCK2,
-	S2MPG10_BUCK3,
-	S2MPG10_BUCK4,
-	S2MPG10_BUCK5,
-	S2MPG10_BUCK6,
-	S2MPG10_BUCK7,
-	S2MPG10_BUCK8,
-	S2MPG10_BUCK9,
-	S2MPG10_BUCK10,
 	S2MPG10_REGULATOR_MAX,
 };
 

-- 
2.52.0.457.g6b5491de43-goog


