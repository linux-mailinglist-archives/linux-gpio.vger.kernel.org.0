Return-Path: <linux-gpio+bounces-39442-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0XurIVS5SGoatAAAu9opvQ
	(envelope-from <linux-gpio+bounces-39442-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 04 Jul 2026 09:42:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF77706FA2
	for <lists+linux-gpio@lfdr.de>; Sat, 04 Jul 2026 09:42:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=H++nUGkQ;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39442-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39442-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25E18304A8CC
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Jul 2026 07:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 309833998B1;
	Sat,  4 Jul 2026 07:39:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4751E306741
	for <linux-gpio@vger.kernel.org>; Sat,  4 Jul 2026 07:39:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783150776; cv=none; b=e4HP/HqHgzj09Y0h7fh+bH9YstnXcTlFtHP4T99VrtdeCrWDqhA1UgrsYuOfePmRAGAEina8sWwFIW5RstAKEgsqXcojbQbL/qI9gl1fxt5+cnAZhEdCaQtI31dmqnS4yP23IUOx4VpZ4z//dXTDXE35wtPAE33zasezR9fijo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783150776; c=relaxed/simple;
	bh=g1VqSh/+rz77BebTdDSvcjUILqmP0rSso+fqRMDRhDk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VWEYhr0yTa5yz9vTWsJh4xpR+7+OYVUzan3imjA2NgHQAToC9AGEG4KON9Rn9qDX7ugJHbvX8xU50M7xcT8EWh3j0vkmxshRwCb0cl0CgqHseDny3EJKtB0JWoxRt6gyHmjAEXSH/Dyr02dDC7XCjCl82OJXOtu5cre8hzQsOKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H++nUGkQ; arc=none smtp.client-ip=209.85.128.52
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493d3135e9bso842785e9.2
        for <linux-gpio@vger.kernel.org>; Sat, 04 Jul 2026 00:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783150761; x=1783755561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BCU57h1AQhpc1p/9qZeN2ZrfUbMLmuZ03JO7I6z1Jug=;
        b=H++nUGkQM/mRkkmW8x0gzyZ2zJhufQ6bYgk/5qAI6hZS9q9X5YrY8R8/bhriajnHSZ
         OsSnLWkAlbQv5pblLYORPNYNFMRL6lZYsnEj4DjixQoAq7Rbw6r691fS//cJ9bHDDwRe
         vyXlbR8qnKp1y7YylVbL6gW6RqVlkfxj7xzNuLFVg+NOFjakLLum5KiVVLmTs5RI+GjM
         QimPmilJ1w1lQ+jNwykOf2Dt+EAmiBnAKRXsNMknZSvOgoVMLPpLpzKgLgWFqeglntym
         1Qgt0kWRz+uXUOLuToekqWaCjJzxzVG7zHNilWiytaDVqpS8ZfYG5tfGEHtHJJPiVk5Q
         AQFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783150761; x=1783755561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BCU57h1AQhpc1p/9qZeN2ZrfUbMLmuZ03JO7I6z1Jug=;
        b=GMoIbjVfchBTZW8OTJFzr/PM53n+z5f49XR42iqXFSu2bnt1NhRI7acDLAkrfroJxz
         IJtLVCqFh01Ox+Jmj3+gdFGOLeNTL+xcpPXV9yYMCqeGhmqceQVioayXtQlYmpOgygJr
         MZUb7TwLqdaVkA2krfAbEPefcQl2JZMzGIolFy6rFLAVgLCN9qioGEvxwOo7Q9RfuVOS
         j/Hb372SJk6XseeEkeA9KWOFBP8ZMbWV3/5QKJYOaGoNZZEOVjNIfgRH8rENXVo5cOWS
         RvtFc1kp+l8QEHz81zVi2ifQ9AFV2oDnDHXNUJBc0ndFfJfEs9iZmLGGtrHF0N5Oxsna
         zRig==
X-Forwarded-Encrypted: i=1; AFNElJ+J84WB9spCF5pYPeaq1RTxuGGssnWIV28Cb0h/0GoK0se8QfDK+FY3LC6d5cF7zrFW3D/bU6IT7nN6@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr0dJdGG0+HoWCLa8ihE7Fq++PFqsrhvkmDes9ZzxOYl2C3fOG
	3xYD7PFWxCM6K8P6B7jyijf0fBgjoalOtvgtLTfpP2/Lh46BmAGdC0ri
X-Gm-Gg: AfdE7ckWBbZEatsgNKWdlA+ARZ9+tPGMQCHKcw0s8YorHZvZ1vYpvBSq/MUcR31aC/N
	WJLYls+/aEHKoQLsPLGxa3sJG3u5hRZiSXIBywfJylfeIRwN5pwDp4Vnw8HI7UlvtwdnXdcCI2Z
	NEHS8ixjsQfdw4tJES5uHRHDVaBzrQrbs2TTe9H/ZhQd/cZkBQI3uXnoQdSUxln1n1WHsa9E9FI
	MpJ06STpfVa8T4Dly+t081BsWvHd04Gkq2LsYPWHqZKRlcl487ZfiyJcvIGHktJMshsC7YRLJQU
	PnK6t5/1iKw2RvI6m6FJRHUxuB02O1rg0AY13P3d7LEreSek2Z9/u39vkmWcNOV8+5MJ3M52/1M
	VK29NWk8YSBpQMkvSE+h+cuKqToLOa3es9Fg90cpxiJbLbVvs04CDhBsCRjS3AG5t8R7flSGjei
	96wsyC3MTs3kpoIm5mYvbsn/dYPXi5SppSaw==
X-Received: by 2002:a05:600c:4e13:b0:493:b729:3a9 with SMTP id 5b1f17b1804b1-493d11f577amr25900125e9.27.1783150761434;
        Sat, 04 Jul 2026 00:39:21 -0700 (PDT)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e736sm6565488f8f.7.2026.07.04.00.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 00:39:21 -0700 (PDT)
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: [PATCH 4/5] ARM: dts: ti: cpcap-mapphone: use charger detection interrupt for CPCAP USB PHY
Date: Sat,  4 Jul 2026 10:38:42 +0300
Message-Id: <20260704073843.1750458-5-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260704073843.1750458-1-ivo.g.dimitrov.75@gmail.com>
References: <20260704073843.1750458-1-ivo.g.dimitrov.75@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-39442-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:aaro.koskinen@iki.fi,m:andreas@kemnade.info,m:khilman@baylibre.com,m:rogerq@kernel.org,m:tony@atomide.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:ivo.g.dimitrov.75@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:ivogdimitrov75@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ivogdimitrov75@gmail.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.infradead.org,vger.kernel.org,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ivogdimitrov75@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2CF77706FA2

Update the CPCAP USB PHY interrupt mapping to use the charger
detection interrupt and corresponding "chrg_det" interrupt name.

This matches the driver and binding updates for DCP detection.

Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
---
 arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi b/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
index 6b1195c2a768..b75a327caf1f 100644
--- a/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
+++ b/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
@@ -125,11 +125,11 @@ cpcap_usb2_phy: phy {
 			interrupts-extended =
 				<&cpcap 15 0>, <&cpcap 14 0>, <&cpcap 28 0>,
 				<&cpcap 19 0>, <&cpcap 18 0>, <&cpcap 17 0>,
-				<&cpcap 16 0>, <&cpcap 49 0>, <&cpcap 48 0>;
+				<&cpcap 13 0>, <&cpcap 49 0>, <&cpcap 48 0>;
 			interrupt-names =
 				"id_ground", "id_float", "se0conn",
 				"vbusvld", "sessvld", "sessend",
-				"se1", "dm", "dp";
+				"chrg_det", "dm", "dp";
 			mode-gpios = <&gpio2 28 GPIO_ACTIVE_HIGH>,
 				     <&gpio1 0 GPIO_ACTIVE_HIGH>;
 			io-channels = <&cpcap_adc 2>, <&cpcap_adc 7>;
-- 
2.25.1


