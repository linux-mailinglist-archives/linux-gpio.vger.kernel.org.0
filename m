Return-Path: <linux-gpio+bounces-19430-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C71A9FDF4
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 01:56:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64A561A85F0B
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 23:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D56BD214814;
	Mon, 28 Apr 2025 23:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=simulevski.at header.i=@simulevski.at header.b="Zh0zNXN6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D0A193077
	for <linux-gpio@vger.kernel.org>; Mon, 28 Apr 2025 23:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745884577; cv=none; b=mYu7W6cohWkCm1dYzmkbKve5M3hHgHL1JUD4gsHmaiDeJYd88NYaq3QTspwwP3PvMevGA1pT17A1sXcn0iHyqlqGwe1DK8UgDYik0TQN1dju6csFc4hCEl8TwVIreNYHcPATL26cV6n6qiY9vG+msD0wvGSfjoYKdEN2GOqvGeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745884577; c=relaxed/simple;
	bh=bxmFw1R18RCWVmkLj5Gw+iQe32a7Ap/yaP+7IqnIbJU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Op7XFF2tTL8Xcjdt9boPJQ1mbeKKHCdrKmoZNCnRChglR45T0SGTfe7kP9puTMLHTkGJdyZI7eZbM3+s4hECL+XlI1yn0A/RQHR7i57efbNLLxMFYES7S+66p3yRuBqs2nyA4WYnch6esrbgLQAgzRCPlYgQDOiEYDkOaaTYugA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=simulevski.at; spf=pass smtp.mailfrom=simulevski.at; dkim=pass (2048-bit key) header.d=simulevski.at header.i=@simulevski.at header.b=Zh0zNXN6; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=simulevski.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=simulevski.at
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac2c663a3daso1060947366b.2
        for <linux-gpio@vger.kernel.org>; Mon, 28 Apr 2025 16:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=simulevski.at; s=google; t=1745884574; x=1746489374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wB66ToxGKEi9eBswU4ICqh+7barhwHPSPNy0x89YMy4=;
        b=Zh0zNXN6D5U4hIy3YZHGbFWQW1fbAcw9p9uNazDHQhHhs0VZkVhkyFuJI6pDUWsnSm
         sdMl6Jpp+ZLWy1cVViPoyt4dcAMRGy4Z8IKvmcF6QPypmx9+U+hBO9v+WASconf0+z+H
         IUxOKz7uLYZPnzMB/qEb1AkWKWCB+0O4h/dUhT0VTZSfLE661rAMwBak7YXgBm/tHtdA
         ioY48RsQ1Sh5QbXecud9cpMGDDcHLomMZNSmDZ0Dxl8OZf/ZU81HXq/mwrVDdgAP806w
         rHMpUSNqjA8bYK8PbDRRvuNB1Me5drtx8TkZIW6EpxUzIrvl6vIGlPipve3icde+5tZp
         LETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745884574; x=1746489374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wB66ToxGKEi9eBswU4ICqh+7barhwHPSPNy0x89YMy4=;
        b=lyQYHD6vo1S2XuVRI+kNze4KiBBwhh3pkLo/rf9MsOCUD68OPmRPTJNtcw/5NYfwFV
         YrrZIPqNkmRuEZBCbENDQDO7jG3PdGqPUn7bWAPkIIqkb6MgLrZIUJiaHyAICFzM95P5
         x3by5cGMb6HdXLgSumwpU3rTzxdDAFdE1MlTZMFfj6NI8FfJqy/M/M8EJiSSQF1VxSut
         FLR/0iNyxQHR0SIhMcuAuDLdXACEZqG6TSj/CCDm+dgrQgkIdnoEOY9uHp0bpfODcqcG
         8t+JqFb1WD6D7itKyW4Xl65sMuGWVFlV74pa/9rOD51Eg1GQcHBL57CthznIQnaepgo9
         Lmzw==
X-Gm-Message-State: AOJu0Yzt3oeB/WwdRJfTR/2rCyaZGb5No0JD7cbfKdj49scf7FeVWHjT
	SpniSZea056p7gSlY3sX4IpbhlMGSSPSjsRoQvyQKeoPkn+NNG7YZ6c18XK+ux14xIH6aJydNYN
	p0/bhdg==
X-Gm-Gg: ASbGnctcFwdd7ncZM0M5SebAG+57G1Z6JwhAPweKEoj4luqhl3F90TUDwIeJx8GwRT9
	HP4nlYHlKPtROVa7iQ0Fn4Bq2dntveCibjoEUgjg27IKL1PTfqviMq3YR23WQBo84sLXpUtEbnG
	DOPqKbLnNK632U/kyOJJOzw/56rdYuw7kDaLlPq5bRLSPcMJ8Gwrxf+sDViDxv7oNHXdKPjIW9l
	kR9DBHZq6BCRfgubsycri2i9LOqATs1khtUVj+Xcr69oBymQGYQ0n52rgisxZblfZspy85pxCYG
	IrtJobJhU2URRdX73TW9Djn46Tpmdytm+EtMMAJH7az60eYS/JgVqvOfo0M8THuUbT8=
X-Google-Smtp-Source: AGHT+IHrWau5pzqlu8AZB408xcJLGbooNHtqSnUwY0qLzTMn1zlXklldf4GHYwIOxwVXsIAd1s9Zzg==
X-Received: by 2002:a17:906:c153:b0:ace:31bf:30f3 with SMTP id a640c23a62f3a-ace84ad7e97mr958675166b.43.1745884573629;
        Mon, 28 Apr 2025 16:56:13 -0700 (PDT)
Received: from fedora.home.simulevski.at ([91.65.134.65])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acec3d78514sm68656966b.131.2025.04.28.16.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 16:56:13 -0700 (PDT)
From: Ariel Simulevski <ariel@simulevski.at>
To: andy@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ariel Simulevski <ariel@simulevski.at>
Subject: [PATCH] pinctrl: intel: Document Tiger Lake reuse on some Alder Lake platforms
Date: Tue, 29 Apr 2025 01:56:10 +0200
Message-ID: <20250428235610.11324-1-ariel@simulevski.at>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some Alder Lake systems, such as those using the PixArt I2C touchpad (PIXA3848),
reuse GPIO IP blocks similar to Tiger Lake. As a result, enabling
CONFIG_PINCTRL_TIGERLAKE may be required for proper I2C device detection.

Document this in the Kconfig help text to assist users encountering this issue.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=220056
Signed-off-by: Ariel Simulevski <ariel@simulevski.at>
---
 drivers/pinctrl/intel/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pinctrl/intel/Kconfig b/drivers/pinctrl/intel/Kconfig
index 248c2e558ff3..b8e1436b04f7 100644
--- a/drivers/pinctrl/intel/Kconfig
+++ b/drivers/pinctrl/intel/Kconfig
@@ -54,6 +54,11 @@ config PINCTRL_ALDERLAKE
 	  This pinctrl driver provides an interface that allows configuring
 	  of Intel Alder Lake PCH pins and using them as GPIOs.
 
+	  Note: On some Alder Lake platforms, including systems with
+	  the PixArt I2C touchpad (PIXA3848), the hardware reuses
+	  Tiger Lake style GPIO blocks. For proper device detection,
+	  enabling CONFIG_PINCTRL_TIGERLAKE may be necessary.
+
 config PINCTRL_BROXTON
 	tristate "Intel Broxton pinctrl and GPIO driver"
 	select PINCTRL_INTEL
-- 
2.49.0


