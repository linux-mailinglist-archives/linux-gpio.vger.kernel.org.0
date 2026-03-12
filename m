Return-Path: <linux-gpio+bounces-33215-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBASAUw+smk6KQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33215-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 05:17:16 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC44C26D012
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 05:17:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 62340306A960
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 04:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3AEB39446F;
	Thu, 12 Mar 2026 04:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZoBY3Yy2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF2A396591
	for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 04:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773288979; cv=none; b=qi8ZkqhdEb+jpz6/H4vegNtPY6zCm21pbOBnaipf3Y7t/T82D4K8HHfxoQahVV3Wmg999cNEaBeXtNwswJ4zkLDdx5xFhqInq9j8wwE5NEMNOTOYAOPnc1rSBuFCv0xvAhPv9skYhsoR+kME9OGS0DUkCo8IJ93kqUtKmBjGa0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773288979; c=relaxed/simple;
	bh=plo3cdLp0mM/REsTKnMKP+T7Zcgsn/lfKl8OdWSoeXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KUzWVZIzOvbYna3g9BZ1e672R9hCN7Bsdo324FMgezmo2nzT7J4GxThhPsF3KOtJzbm0iGb6ZHP+8LX9LZY10jx3EOWwBXaeE91MWVbrmXJtl+xvlNvA4LN0wusEKJuhYqktqjZHDHQNcqHUXqcnt59kMC336L4ySEaKPpjV7L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZoBY3Yy2; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-35a09e0dd63so462459a91.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 21:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773288976; x=1773893776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W/9M/lTT6d/B4Kv1sMdY42lBtxyscWWx3kEUkACbugI=;
        b=ZoBY3Yy2qfVpJRv/D238K5ceqnOQg0tpLV7IHc237SqlJbWf/BQsNaMmATDYJNJksY
         q1kxLV5GxPVGKHiDEqs9PqfhdXfWZR/CdpRPttvY/OLC54o21Xgp+FIepEb5KtwUan9I
         MO6qD5sSpgx9ydp2bKbIBbfWe2ugs6/0+cII+TdLFtP1AfONkMcCwlhhJ1v2O0XYLeP4
         nLaQYxx7MlIOO8mjW+iCvahWxdT+iYGxqH8rxT0GAjnqRdTIsn+YJpjpDN7B7xi7AGeD
         RhIqZIJCPzGHBudElG5rT3Jy1wGikaNItHow/3XtBTxx9wMiTlOlvHH/PNfMafJ+AncV
         GB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773288976; x=1773893776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W/9M/lTT6d/B4Kv1sMdY42lBtxyscWWx3kEUkACbugI=;
        b=s3rJZf1VjmqTTu3yjk8e2vH/MwoaMdYaOxsSteA67ZHWTqMI+qjzFP8t/On3WtNESS
         Qy6qxZIy06JzYXHQggfA3GSuU9mfeKx1Vgz3zft8I+p9xVk/RC3FLKZ+HaUm/kiG5uP6
         blRc90OvHKHQPHE9jdILhNvsxu9TYk9dZDVxP9Ry+38bdnE/uLc19f+XEMYQnHQ2dshj
         WooWkIQvOzlxEQW/FdX9WpU9GyLG4rbe7DUclfRyxJmGgZ4+cKjT9TuKIN6CcXS9WSB8
         pf+CnEKU4JzGhtNW575xvXotVwY9S+a/QYhCOq2WPXN4YqeZc7loTmnGd3BD2Km8pTVB
         U7Sw==
X-Forwarded-Encrypted: i=1; AJvYcCW1V2SAxUKSjh87wCRzYpg1An0RBFrsdytkVbQdV/tD5idRvyykKBeN1c/aPNkoYr756S6DosRdcx8I@vger.kernel.org
X-Gm-Message-State: AOJu0YylO20j2OkVYOHQTAiV4cpfcfLF2Q1BwytXhU/itkLB9O8Uvwro
	78uqTnhDNIaMJgWcO87TFeEjEoYuJK8I3XaZToAZ0t4YfGDVYDsf8Gyp
X-Gm-Gg: ATEYQzw1pYs3jX6WhnyuoLHahEopJklJSQlW3Krzyj7Bg/Rfu0tX0eUpxE9Frd5LB7a
	ZJsvZ3bvwVzza5dkPJRdCTndeEij2AF6ZAMJIbmG5MxKPdzU8wQjxa1yWBq1SWAuqQ9KV73Y3ND
	/vtHiu5lRfgr3bKu49f9forjDONOZpp2p/vzJxIL1xWI7qWcecUDw4fPkIs8KHjm8+etMDz7dE8
	VK16++gcNpjw3mx/eoA8vizXJv8in84P7lJ5xpiQl/KPDjUnWXp/19DXt929OF0PQksmlaHmWPW
	PRZgtsskHAv9Fc4EK7zAO9utbMpt6iuRAjeKNp2v9TI+XoCOROSVEHqnEho8z+ImiIe+z/CHcQS
	OQShnzU6vgv/vHeIam7fO4AGsQWtsQHf7wxQJ4C146iJl5o2bmWbXnbvaEn5sHdBZ/mJ2VTH2Os
	ccNNqb11IEbgYq2CeE0MWTBx+P6B5tHlXi/IWqxGS7J28OZwqHmHZmPHoZ0RI34AX1PuJJqXjri
	4iIlWU=
X-Received: by 2002:a17:90b:3c06:b0:343:7714:4ca8 with SMTP id 98e67ed59e1d1-35a01201d6fmr4340930a91.15.1773288976536;
        Wed, 11 Mar 2026 21:16:16 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02fca40bsm5018229a91.10.2026.03.11.21.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 21:16:16 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sean.wang@kernel.org,
	linusw@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	hui.liu@mediatek.com,
	nfraprado@collabora.com,
	linus.walleij@linaro.org,
	mars.cheng@mediatek.com,
	andy.teng@mediatek.com,
	hanks.chen@mediatek.com,
	sam.shih@mediatek.com,
	rafal@milecki.pl,
	ben.ho@mediatek.com,
	erin.lo@mediatek.com,
	zhiyong.tao@mediatek.com,
	Jason-ch.Chen@mediatek.com,
	amergnat@baylibre.com,
	seiya.wang@mediatek.com,
	tinghan.shen@mediatek.com,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH 3/6] arm64: dts: mediatek: mt7986a: Fix gpio-ranges pin count
Date: Thu, 12 Mar 2026 13:15:30 +0900
Message-ID: <20260312041533.187553-4-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312041533.187553-1-akkun11.open@gmail.com>
References: <20260312041533.187553-1-akkun11.open@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-33215-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,mediatek.com,collabora.com,linaro.org,milecki.pl,baylibre.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[akkun11open@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AC44C26D012
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The gpio-ranges in the MT7986A pinctrl node were incorrectly defined,
therefore, pin 100 cannot be used.
Correct the range count to match the driver.

Fixes: c3a064a32ed9 ("arm64: dts: mediatek: add pinctrl support for mt7986a")
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index 9693f62fd013..9ebc196107e5 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -187,7 +187,7 @@ pio: pinctrl@1001f000 {
 				    "iocfg_lb", "iocfg_tr", "iocfg_tl", "eint";
 			gpio-controller;
 			#gpio-cells = <2>;
-			gpio-ranges = <&pio 0 0 100>;
+			gpio-ranges = <&pio 0 0 101>;
 			interrupt-controller;
 			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-parent = <&gic>;
-- 
2.53.0


