Return-Path: <linux-gpio+bounces-37475-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOG2A1ZiFGrsMwcAu9opvQ
	(envelope-from <linux-gpio+bounces-37475-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 16:53:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A11735CBF76
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 16:53:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1951C3063833
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 14:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01DFA3F210B;
	Mon, 25 May 2026 14:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UlFEFbtE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835503EDE44
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 14:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779720471; cv=none; b=BHFuVzQkS2DaWov47xGu7Az2afTjfINok9SKrfnpobHt0KxH96R0BfMT5A1FET4XGPaKIkaL/LanZ0q4GnrdHyYRYiRiJnXe/yv/TofZKIZx+gykWgcUNJwMqI+ID07WHxasXivKQTJ52CPjkGx8jtTxEKw1Hmmoe21vmTLasYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779720471; c=relaxed/simple;
	bh=rQev9snjUDQDOjiwl73HCrNzxpOg3GjolVgiv9srQUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dydNkMB/ilWm8SabK87dTts5E/Fd55mOiBOvlPnUkJiFlocJifhhgRcJQFZH7gKCpXF23wxCnsWQcwAcpscWEL5sW+5MhyUMw28z3VlavJMy4xtFoL8kM6QBLqxCDG/2ShmmR6ZKGa1nVE8nKz/Y1frbdxupyBBe/Y2R8Ow6VCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UlFEFbtE; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-36622412e97so7316318a91.2
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 07:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779720470; x=1780325270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVVGG9O42cYkv4+MEhpJhN2Gsiqdr8SLjGLZwhgYa/0=;
        b=UlFEFbtE4LX8kXg4191YimQ3eaMGAtBr7w0P51NQTkYRRd/JGvwIF6zH4KVfzCEFsf
         ck860WhFm07gR+HHLGAW3m5LbhgNvOFwjqfBX/eGYW9o2BMDi4T2mcqF2yKfgOfLkf7B
         c9YvT39L8wBDCebbfMvJpaY5vpmu6S8VP5b8gTEWqfqA2JkB2U3KfOWIwPg+N71ShVkd
         2my3IJnbNudbfyMSjOEDBG7pzWqQNpmaOXPmIWBPq5t2tzmiCEZ4WEr8RQs9OzMzrk2h
         Y5xGzLepZ6VsIY8bogN1TU6nrewVqakKLoo0SO/EAwo1/L3Wllh5KLmUW/SHo8Yif3YL
         J3Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779720470; x=1780325270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rVVGG9O42cYkv4+MEhpJhN2Gsiqdr8SLjGLZwhgYa/0=;
        b=kJP2JYtg1smzLM5ZbvpFUrDHItbm7RsOmS4t+BXHcshNP960zEqRwXzl58l6fb2QQ6
         lhWSe5PrLxZtoOOuVygkrEHtVR+PFh90hfG5P9Q+5BZM6TfUCFXpSXfnYf5Dzr/BP4d8
         eOX+XT75vZ/0oTRpo9cHyNaFvt/pnudH5z0DJZVWJuaK6YIcolt8wuKfpu8874oC+kk5
         1e8Zi7yDaMCjjO8vphrlOrGjSeNFaKg1s5VwT+ctITDenqgsorqjcUAP99ZHHh5ZsZAN
         MOjDDRdXVYoKSZzf5wAeo4G89J6avA7ZFYRPFbL6beRSJ+AgckkSaJewybyrZdibFRyW
         N+LQ==
X-Forwarded-Encrypted: i=1; AFNElJ/EYgvlBuk7tZu5mtSL8u4PlA/arI/0FFMnuuCAtzjyD0myjAwh5MNeH7/XqUN+IABKmAN7e9t6UpsM@vger.kernel.org
X-Gm-Message-State: AOJu0Yx41fvlB0VhpXmIflI7xqO6MskllnInrRARjugW0h7tNf5OeyM1
	yZkmxd7qom0UQRmx3yWc21PhAVwqgxQnoXkNTYgNSpWImxTDE3FmGuEY
X-Gm-Gg: Acq92OE2iy7OiHbUHrImSn8RwWHGOrLHhvI/Nm4g8hkY+cA3biJJ8TBO5c5sP+zIgDm
	ZW/xo+6tZP8pZnL881CVWneKMa5Eqw1fSVi+ijOp/mZqejQNivyn4S/Q2CXE/2TEzfs88Excuht
	A8oiBsxpN9tJXiHoKllJDIRlI0HnJl7ke86s+94uyxm4fWX9L7KP+EFOyYj2skmUapqt4H086Yu
	E8nEFyVUxviFJqTnQcMBKsmKDv1/tyBwQFSQl585Z9v5AJpKgYClXlpNSpV0jaq24vUxPbwRcE/
	Fv0la/Jiibu3X5plIiHHao8WH0Po5pHyVGswqaqwc4eb4UCdWIA2Cbaf4KKU2vci9nuNouyNvoh
	oDGTkXF1aDTyl5+B+F9nIQ1ng/VWo0yXiNp292vFjokRK29kCR60krvme94GLU8HSCQZGoCaLs7
	zNru3lXm3n7Tcp0kW0cFNh36bOY0JjyMh84ijCJdk=
X-Received: by 2002:a17:90b:5284:b0:35f:b7f5:9b3 with SMTP id 98e67ed59e1d1-36a67420e95mr13511527a91.3.1779720469769;
        Mon, 25 May 2026 07:47:49 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a5f:4fa1:cc65:18c0:209b:38a4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36abfe17c95sm2721993a91.0.2026.05.25.07.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 07:47:49 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linusw@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Grant Feng <von81@163.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Robert Marko <robert.marko@sartura.hr>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Pavel Machek <pavel@ucw.cz>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	Romain Perier <romain.perier@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 4/6] arm64: dts: qcom: msm8916-alcatel-idol347: Fix sn3190 shutdown GPIO polarity
Date: Mon, 25 May 2026 22:46:10 +0800
Message-ID: <20260525144629.498630-5-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260525144629.498630-1-jerrysteve1101@gmail.com>
References: <20260525144629.498630-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,ucw.cz,kernel.org,hisilicon.com,glider.be,vger.kernel.org,lists.infradead.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-37475-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,lunn.ch,bootlin.com,gmail.com,mailoo.org,163.com,arm.com,linaro.org,sntech.de,sartura.hr];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jerrysteve1101@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt,renesas];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lumissil.com:url,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,0.0.0.68:email]
X-Rspamd-Queue-Id: A11735CBF76
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The sn3190 shutdown pin is active-low [1]. Correct the GPIO flags
from GPIO_ACTIVE_HIGH to GPIO_ACTIVE_LOW to match the hardware.

[1] https://lumissil.com/assets/pdf/core/IS31FL3190_DS.pdf

Fixes: 1c8cc183d070 ("arm64: dts: qcom: msm8916-alcatel-idol347: add LED indicator")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts b/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
index 2de8b6f9531b..6d51d6efcbac 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
@@ -197,7 +197,7 @@ &blsp_i2c6 {
 	led-controller@68 {
 		compatible = "si-en,sn3190";
 		reg = <0x68>;
-		shutdown-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&led_enable_default &led_shutdown_default>;
 		#address-cells = <1>;
-- 
2.54.0


