Return-Path: <linux-gpio+bounces-17968-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E29D8A7035A
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 15:15:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA68016A27E
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 14:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCE4225B67E;
	Tue, 25 Mar 2025 14:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="Gb7nXLQV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3077225A2BB
	for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 14:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742912021; cv=none; b=hqFZTVW+7mXWldka4LaKi4aVaIMOCSE6rooitija5WTT9Q+WUs5GxtO6Z+WUbzrgYg8P3qgDHKFCsDTnWYlF7k365cN4m3hsZjzDqqUlDk5cwyD+ejAkHp+ljIg7zyzafYIfskZykgA1qcqDVVuYVVhmdRg6cRNN7LY6d66q0cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742912021; c=relaxed/simple;
	bh=D2seTNqsA+k60CiwsBqeP8HOf191uyBjDvtVghGiw5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L73BQ7nckFeUXx258BMfZgdqPo6psFRB53HbkkDmFfiBc2D6fPMu9qE9jXVGyB7fqCOXi9MgFFFOP3zcnnyJ8vs5Imq37YA1cn1OaGBAEBYRDhdLSDKKpae+4PRiN7XXIZnaukUf/OCygNxpAJp5H4tDzSsVgeR8Om92TqwAEF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=Gb7nXLQV; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C4D0940407
	for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 14:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1742912005;
	bh=z1YltY4DUAOKhOrYaqFTN+9X4KCj1NX0eIOCMrmZPFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=Gb7nXLQVW8mGxHbzaIfg40Cy9E4lNQZt9c6rlkVYBb9zrMT2tlX2gC7uT8Fwu6vE8
	 xpNxSK8mX157lKgKbTasKZeTwl6sSEoRw5VVs1DlAuVkbFVgu1Vu2k+rdLC7MdC6bk
	 hsHddpGSkNtgrywSbuS5gfP7bETJpRU6PWp5tqLRAqB99SykV//7PUBfIMSlQggpzm
	 kiNI7hY970R4jL9I/x4ymS2v8+aOd/65iZtfgdGrTQ/Tfi/4dfCkqEv5msLcXXeO14
	 MPVL0+w0t0X23prM/neLbFRUfnzTCnlvS3ZCH1k7/6jx3ORT61M1LCcDxzUySw0S2w
	 eRpZ8ilDNuzQw==
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3913d8d7c3eso2943190f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 07:13:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742911999; x=1743516799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z1YltY4DUAOKhOrYaqFTN+9X4KCj1NX0eIOCMrmZPFU=;
        b=h8i7leJy1sudi2VXLymFPL1F6ILNanT4mzsc5JvEdJGhYvTefc5r8lEwij8xc/gOrX
         5Ub2RVsfR0Jn74I9lVRbXIBWAZCr3hgP1YWJxpHiTvtJovLW0Gbks5ffjbFMi+Fn8tIm
         +D8mM2C36avRFjLBdREihf9zsmAHX/6ziqRknycaAlQ4NJEvj3TXomKEAnrDmYX1gTKR
         cHrtHsxN8SlrXA3oTJn8/kItpN5F55n2bgHzsTNNs8BOfLHr28ALgATNkClrybhxxQxh
         G+xeVfgOcs/gdxFa3CWP1AwLwuP8w6u7qY2UvtmV0ibCcVP547uh9GhUmQWt5dElkGaO
         29UQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpD2p1K3S64DHm1T6QeZGUmxphTja7FYKHiBxgtGkQnSi726aSU993Dih4cCjjZEiRcv8yA1KEtCsJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxvfubFmjD5IpwSzBrZ2cCS3JAks7ZvXP6Mo7spAhEtMuOYlfiA
	Ul/jEU6tSfep2d3ZAG2XeJK+5U8WCAexDfd/7os8S7SeSGUeMUzx6eApn/otXlvyXyU4itdx3WI
	nc22b1Cqw93MA2I7qFtdFtiPRFguo5/SunQvGtrIivRCJ6z7N7L5tcX6mm1PccuL1PX90FdTaOk
	A=
X-Gm-Gg: ASbGnct8qlUq22cEzA/iJLhE3uyyH6jNKwQW3CldCXvV2Po7iktALgB4E5lK0LAODbp
	yCnABOFKSZi2kpOZa5cyW4tSFZ73EFdajf9ceyDLsKftLi2NuCP9yOGBShMUu02Q7+2WY/Dp+Nr
	ype4mJ55z+LuZeGviHuntKKygSkMbifHEfoDc51o4NxAgViUhQk2mozRcz2Ie//R6zwpzZHU2MD
	8HIcy/8N/KCS20wUv25dA0dGl+hW2LOTQYNen6GpVs+NgkFtX61SidqMb7mXXUp/Iwo0TKeb1DZ
	F6iV6es4AGLbGl+1IW8DSomVYmrUOA==
X-Received: by 2002:a5d:64c3:0:b0:391:4bcb:828f with SMTP id ffacd0b85a97d-3997f903714mr13947094f8f.14.1742911999490;
        Tue, 25 Mar 2025 07:13:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHI6KEgZoCtSliU6E0BwKfVc69vn7sSR/m3U6awSJRdbl6af8gLXmNSZGr1/IgpSiG8Z6CDew==
X-Received: by 2002:a5d:64c3:0:b0:391:4bcb:828f with SMTP id ffacd0b85a97d-3997f903714mr13947058f8f.14.1742911999075;
        Tue, 25 Mar 2025 07:13:19 -0700 (PDT)
Received: from stitch.. ([80.71.142.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a6326sm13532091f8f.29.2025.03.25.07.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 07:13:18 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Min Lin <linmin@eswincomputing.com>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH 4/4] riscv: dts: eswin: Add HiFive Premier UART pin control
Date: Tue, 25 Mar 2025 15:13:06 +0100
Message-ID: <20250325141311.758787-5-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250325141311.758787-1-emil.renner.berthing@canonical.com>
References: <20250325141311.758787-1-emil.renner.berthing@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add pin control for UART0 and UART2 in the HiFive Premier P550 device
tree.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 .../dts/eswin/eic7700-hifive-premier-p550.dts | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
index 131ed1fc6b2e..c278695dcb2d 100644
--- a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
+++ b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
@@ -20,10 +20,56 @@ chosen {
 	};
 };
 
+&pinctrl {
+	uart0_pins: uart0-0 {
+		tx-pins {
+			pins = "UART0_TX";
+			function = "uart";
+			bias-disable;
+			drive-strength-microamp = <6700>;
+			input-disable;
+			input-schmitt-disable;
+		};
+
+		rx-pins {
+			pins = "UART0_RX";
+			function = "uart";
+			bias-disable;
+			drive-strength-microamp = <6700>;
+			input-enable;
+			input-schmitt-disable;
+		};
+	};
+
+	uart2_pins: uart2-0 {
+		tx-pins {
+			pins = "UART2_TX";
+			function = "uart";
+			bias-disable;
+			drive-strength-microamp = <6700>;
+			input-disable;
+			input-schmitt-disable;
+		};
+
+		rx-pins {
+			pins = "UART2_RX";
+			function = "uart";
+			bias-disable;
+			drive-strength-microamp = <6700>;
+			input-enable;
+			input-schmitt-disable;
+		};
+	};
+};
+
 &uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pins>;
 	status = "okay";
 };
 
 &uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2_pins>;
 	status = "okay";
 };
-- 
2.43.0


