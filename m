Return-Path: <linux-gpio+bounces-22028-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE3BAE5291
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 23:45:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1639443D1E
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 21:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED906224B01;
	Mon, 23 Jun 2025 21:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Rcj+I9n6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE59B1E1A05
	for <linux-gpio@vger.kernel.org>; Mon, 23 Jun 2025 21:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750715096; cv=none; b=N/8251O4NaaqW7GJUaYCw3edheNQIvg3Bz2ddzHJbY2EUcXtL6VhYMncpOjVdxrSs6LjwDbA4Nn3u99KQTD+vKz9EmkQRi4bTi5lPZuV4QfJuL7w1fbysCtikOkLudsDRvuLYQ2aFzaocDerTtbj9G3D9uddifKNElj1ziEAPZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750715096; c=relaxed/simple;
	bh=HqA16LR6HAWvdlEy3wx9eZOBIMB7ZcD4My374Vzpq4U=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=j/FdGYBg5j42cC5XTgoLg87lgv++2f7rgnyNquOE5a2vogVaG21l5sJMohAZ/YqTp6ORl1ffdIF7coaUBZxz+Ows+zjMfNFS56PdzPWGltINb5p5tpSeD0PJzfr597X3QKE7geU82NwjCQ2VljP/H/aul9bWz+gpyeCNh+CuPvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Rcj+I9n6; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ade58ef47c0so948402366b.1
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jun 2025 14:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750715092; x=1751319892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tECQ70x1JM1SCckuRST7a9aJYN9UOBuJJP77Z07Vo14=;
        b=Rcj+I9n6/EFsI+vmFncrrNcRdNIfIA7o5h7TRp/9WTye5ZWZApO66hmwdk2THD9tSw
         zV90QuwmYmyio1L1m/JvPHuzQYdwpRHUXVmwv85munbhL02OmDrjdj4dDb1HIbCgEc+T
         W4cwZKnLdaiOmJ1WVsDfFbEADG6msDZ+zGHHU8R2H8qj0Wh8vExF3j4Lvu+cErjGgDlb
         BfH/3S6/4JuYBszWG6ISV5JQPf9Zu7YkCySy9I80v/ih+KtN+oQDy2Mez+3BY1aJc8Ls
         xlIerZ3PVudz+L63s/J2AsUM0wgT8295jicFY2Kvid4Rse8NBY8ckObsENKtftBvBQWR
         4t0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750715092; x=1751319892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tECQ70x1JM1SCckuRST7a9aJYN9UOBuJJP77Z07Vo14=;
        b=pvxaK0iHDjevPx5obt7PDHAhg6QdHTPsMJ59hUuA1oBBzf2n3KhhWwxL66kPDug+BZ
         d986Q+pxSDwuxt5wekCE0FUrcVX3vuUovDAX8qQxi5TDuI9yiIEtHePhZ61styVJ9cu8
         YNtAPCKlFB0LyDYdatrpNPJyhGlyuTuklG4CLJRNL8Hb6+p9rXsSIXQesaU12P5hRR2I
         nIaXcqI5VMny5YBrRcb650v1Uh4wxbcZfyQUq0QHs+PUBWclgUN0ZN+7KWP5sNde/nLC
         70Kv6awFVoA2+Ii5dNMoG0Cig4LkOH6uO/moMyeyRFqnQKsz8Z9rqBobPrvbZ00qL3Zd
         w4Fw==
X-Forwarded-Encrypted: i=1; AJvYcCXoohZBr/BVa3BnIvUer35uAqP8NVE/ByXv8HM5MuFwtaDobyVjvqZRI1O3fNsJjKhDihJWARMwQrTc@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc57YQfFiveS7uyd/E1CddNhBksN2nOWxLPuUQkmoHSFw12+nz
	67GR3myF8J9ZNAWXkU4CW5Mla6eXshK7gaCsslC/Epy2IRVtvE4cv5Hkz0+8H4p/axY=
X-Gm-Gg: ASbGncteqeg8fBJSlMrrCs2I300lbv/4+axe+2XsgaojxctOfbpj+BL5LW8cK4Hl7Bm
	ryFez5mp4iKAP3VcX176mFLvdAAGWYJ7R9hV6u7mXYqAQC7Qzgc7XPyAC5pu63dEWxlF/UV7et7
	L2OfbNl70WvFOLvl4N/EUHAZ9MtNUDJ9akBaMkyLrDTKuoteNCwKG2Zvpp9QKHXeNrTagkEY6k2
	O7pkvkv2RHOJXqcUulWNz8LeGL4DPOwnbnLk8GWwnumpwnqDkHSWwevN4J8hrWj8q/xziL1Ww+0
	OT2G5tWXkdnkZ/hGv3qQd2Rtpva/+lVPOFWgpOvAEhTEGJ21dY8ySwprKmvPTQew2QvJJwXcqdm
	Q6Wo9bRTplOD+MDSsX77Brvl6bTxGPLGRxde23Z8iAv8=
X-Google-Smtp-Source: AGHT+IFCBGEMw6diC/0MRBmRK+mfhHRRzOPyJ8RG9tL1So/53qQwBJoVq147ne0xzxnIzQxsdYUCdw==
X-Received: by 2002:a17:906:d7c6:b0:adf:3cb9:e3b9 with SMTP id a640c23a62f3a-ae0a71f4c6fmr113325866b.3.1750715091959;
        Mon, 23 Jun 2025 14:44:51 -0700 (PDT)
Received: from localhost (host-79-23-237-223.retail.telecomitalia.it. [79.23.237.223])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0540849a5sm778326766b.99.2025.06.23.14.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 14:44:51 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH v2 stblinux/next 1/2] dt-bindings: clock: rp1: Add missing MIPI DSI defines
Date: Mon, 23 Jun 2025 23:46:27 +0200
Message-ID: <c20066500908db854aa4816b40e956296bab526a.1750714412.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Declare the positional index for the RP1 MIPI clocks.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 include/dt-bindings/clock/raspberrypi,rp1-clocks.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/raspberrypi,rp1-clocks.h b/include/dt-bindings/clock/raspberrypi,rp1-clocks.h
index 248efb895f35..7915fb8197bf 100644
--- a/include/dt-bindings/clock/raspberrypi,rp1-clocks.h
+++ b/include/dt-bindings/clock/raspberrypi,rp1-clocks.h
@@ -58,4 +58,8 @@
 #define RP1_PLL_VIDEO_PRI_PH		43
 #define RP1_PLL_AUDIO_TERN		44
 
+/* MIPI clocks managed by the DSI driver */
+#define RP1_CLK_MIPI0_DSI_BYTECLOCK	45
+#define RP1_CLK_MIPI1_DSI_BYTECLOCK	46
+
 #endif
-- 
2.35.3


