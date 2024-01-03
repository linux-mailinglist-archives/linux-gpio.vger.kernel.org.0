Return-Path: <linux-gpio+bounces-1994-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BEC822E55
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jan 2024 14:31:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 523031C2364D
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jan 2024 13:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E17ED1A735;
	Wed,  3 Jan 2024 13:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="leJnLTpS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF3C199D7
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jan 2024 13:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5254B3F849
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jan 2024 13:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1704288547;
	bh=Z6kJEMrEbGLyI1yj9sToUKHZA2SkNTvsj92LWdDmHKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=leJnLTpSk2xWg3hTGpjYiIo5vh3CMNAij8Z84bbQzrh9U/YM5l6WAiyKti/ixpk5d
	 DeYtLjaIc7xiPCTx9E0aUOTHUeMxe1fJ9p6XhClpZ/1p4z+47CY3FeDJNPSszc10fi
	 5SVxb4YDWqh94iqhVN8EwMk9sce33wJbavgO15MEDqmSwcrEScjsMl9C7l48Q4cZTH
	 hlNlkVX+gOyF8wEiZ2i4d/2nxPI+A9Z61R12qzWytnloCw9UNAFsipp1xG4JIYhuPg
	 onKJ5hQv4rkYRgnokhnxydzTq4u/Z7T1gxvlhrGjFRuWf/KrnxAFjRTGLo5JGcKnyz
	 qFmdOm0JVu9Tw==
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-556a2f19946so627669a12.3
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jan 2024 05:29:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704288540; x=1704893340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z6kJEMrEbGLyI1yj9sToUKHZA2SkNTvsj92LWdDmHKU=;
        b=MhvltYwhvgmJhkdXaptVRVqDT9ncfWvStqyVt0hUeWUmUTOZxGQAC7KtjhJc4M2Zoj
         k9fx3OtUHmjwj9fvluruO43HBwH+oKaQ29Srg0xiK3lvBnx3AWkCchC6SxlP6qbjph71
         ifdLFqvh27THYty9sLKq1mk4czO+u9McNmACrituPXVreZg2ECuqbCXxshxPql5+rZh2
         uxWxuArWkTvpnLeU7bmsFVOMvzPOUARbtgDTiGhXCPvtXRZxzQCG46dZ2eulv0nX2h02
         VFTIReH7h7bQr2z9Hl4JQFkDyD9rmf7MESTDmXblr34+yVz8+PWnW+RPkCLsZHr+DBy8
         t8cQ==
X-Gm-Message-State: AOJu0Yzx+xU8jBLvygSbqQIH148aQ0vDoNZIKkstF3QKr2kzo6FQI/BW
	A0T6fqk9dVWDRmq4xVazXT1c6kuevocZN/h0rsIXufv0OmApGJpb9BtYSqI4kOUSRUNhsLnj+oz
	sHuFXqR2nsjVBxCAsFh5Cug4v8NtA+Q6K3bX7oZuC06U+8Q==
X-Received: by 2002:a17:906:3cc:b0:a28:28a3:89a6 with SMTP id c12-20020a17090603cc00b00a2828a389a6mr1880013eja.54.1704288539859;
        Wed, 03 Jan 2024 05:28:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+dUglk3qywpv3HLiAtpq5rTNNTGkv6sHrUH3Nu8K83CpFHOwrW3TADKmgsLV6w9iY21gf0A==
X-Received: by 2002:a17:906:3cc:b0:a28:28a3:89a6 with SMTP id c12-20020a17090603cc00b00a2828a389a6mr1880002eja.54.1704288539708;
        Wed, 03 Jan 2024 05:28:59 -0800 (PST)
Received: from stitch.. ([2a01:4262:1ab:c:5af0:999b:bb78:7614])
        by smtp.gmail.com with ESMTPSA id eu18-20020a170907299200b00a26e53be089sm9549873ejc.44.2024.01.03.05.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 05:28:58 -0800 (PST)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Drew Fustini <dfustini@baylibre.com>
Subject: [PATCH v2 6/8] riscv: dts: thead: Add Lichee Pi 4M GPIO line names
Date: Wed,  3 Jan 2024 14:28:43 +0100
Message-ID: <20240103132852.298964-7-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240103132852.298964-1-emil.renner.berthing@canonical.com>
References: <20240103132852.298964-1-emil.renner.berthing@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add names for the GPIO00-GPIO14 lines of the SO-DIMM module.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 .../dts/thead/th1520-lichee-module-4a.dtsi    | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
index 9865925be372..f674e5acd0f9 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
@@ -37,6 +37,45 @@ &uart_sclk {
 	clock-frequency = <100000000>;
 };
 
+&aogpio {
+	gpio-line-names = "", "", "",
+			  "GPIO00",
+			  "GPIO04";
+};
+
 &dmac0 {
 	status = "okay";
 };
+
+&gpio0 {
+	gpio-line-names = "", "", "", "", "", "", "", "", "", "",
+			  "", "", "", "", "", "", "", "", "", "",
+			  "", "", "", "",
+			  "GPIO07",
+			  "GPIO08",
+			  "",
+			  "GPIO01",
+			  "GPIO02";
+};
+
+&gpio1 {
+	gpio-line-names = "", "", "",
+			  "GPIO11",
+			  "GPIO12",
+			  "GPIO13",
+			  "GPIO14",
+			  "", "", "", "", "", "", "", "", "", "",
+			  "", "", "", "", "",
+			  "GPIO06";
+};
+
+&gpio2 {
+	gpio-line-names = "GPIO03",
+			  "GPIO05";
+};
+
+&gpio3 {
+	gpio-line-names = "", "",
+			  "GPIO09",
+			  "GPIO10";
+};
-- 
2.43.0


