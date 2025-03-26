Return-Path: <linux-gpio+bounces-18008-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9E1A718FB
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 15:43:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6992189605D
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 14:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8C0D1F419D;
	Wed, 26 Mar 2025 14:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eoIGKs4B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0001F3FD9;
	Wed, 26 Mar 2025 14:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743000003; cv=none; b=UO+98zPAVIl2ppo1VI9eeAyJSEhkN5DUDHZc/Hm5Vtu7NY4yqQY76cAXhR8+F/Mu6VXOuLASVSO+AO+5GQ9P/uuSJY7kOgtAci0YoJmEfsq+nSWln59MNXDuLgCcDT3sCDowZm2z7O5vP6KbB12qH/rgoiftdUVxMHEa96q1Wfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743000003; c=relaxed/simple;
	bh=MjetRzEw9atYbiZV33wWHMWx8SJT7X1CSDA/az7euos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IAo7jPVKI5YIczPHMPezjv9mP+8N/HwD23ZafXh/8neSAqoa8P4SxtQ6MENJJfchgmZ9Wwcr7JPAUYkxHMr7tcuzN+h4DLysXG6Ht1jXvFeqYtlzomn3C7rHhXsNQeEWez5Q9SaAqn71+SLrQvNsNKiE+LXaF6qaTODn8HnjfWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eoIGKs4B; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso53476935e9.2;
        Wed, 26 Mar 2025 07:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743000000; x=1743604800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PmNfwSAKSGPZhhRnskxRS7VGBq4lfQUQS0GhmNutj3I=;
        b=eoIGKs4Bz5/nEYqk9/jb4H4S5rbL16Wt8vx/ud7g+6q+E+kIbakJgIV173a5x+BiQC
         md95VF83pPdn2cMmuoCMTN0DIMxwMKnTP0GX00sEwc/Bnih+ucpL4D6cIKJDdzRjngl1
         AXeEYlWEw1IrfLqMbmLcA4CslxgRsAhlTBVubxboHTG/l6XBvJvOF8c9EaXO4eJgYIaJ
         gka4KYgPx5Id7k+PM14fT9dlgusQjSN86mxBnOKRWy4jqVRVkLpdETZ2c5T3QKnu+cwy
         W6ur6wLCP+fRY+gaaYOjgJwCMMpMUpNDTvtEnxUUr/jDM4QAI3RcVX73PDaXhzg9Jv7l
         ehjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743000000; x=1743604800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PmNfwSAKSGPZhhRnskxRS7VGBq4lfQUQS0GhmNutj3I=;
        b=HPfSK0sZCnk7dN6GJwKj8GPmUE9SBgEzBJVQfmRQAnb7v66zWKAOBALL2JqNuFDedi
         zF8kizRPi8vVVye31zy6de4Rn1Zvf0DL2XPGpPaz4Im6oqMaCVeDX+C4+GdUrlzfPWJY
         DFfWLtk77HnVp9vY1T0Sy/OCQFDP0NYAG40Gck5XeK5FI97UhiPqhbI+kJ0ZlnUJuxTJ
         syVc+MJEdxCFYXu/cJJhZi9BDSSj7Ajz/T6pAPN7REh79ZOKkvrg8XmBZhID+zg1G2Ky
         elrAUVkM7tlzY3zaiVYbgwXXc2/+whsnxtenxHV/uzclIRU2ifodsuQIcX8JmjwkeEWH
         kAaw==
X-Forwarded-Encrypted: i=1; AJvYcCUJovPw0D0lNlMsVyhbaAgoAo9dPf/1JMAbXojkobtddbpClZ0xvUfCUVRi40EkC+Rt4QPnsCEqn/5o@vger.kernel.org, AJvYcCUVVZBb4OzelyXq1vk9oW7embGV1zHEMIA5vN3UsSnbXgRTuUj71TFKscKqHzEQr9S2agom7X9RsVjbh2fc@vger.kernel.org, AJvYcCUX4r+2x+WJ81ucjuR8J9ZJVu7Kv248q772dj+//stHYwfgruw+RIz1UZDYjZwPsltcsgVf34uRy3i7@vger.kernel.org, AJvYcCWFHHKnXfljuKb3W0fy3VUm/kHJzyGvIteFKeL5qykDeIAguOpsFE/+Ui7TcWf18qzT4gnii6GpuTnc@vger.kernel.org, AJvYcCXDlBhzXTE057sX3g3+2ubjpyn5xSB5BBhjZ0quPsmFZFXjVz35VRfEhQW2mdIbFvJ73WdB4M2XwFX0yY7r@vger.kernel.org, AJvYcCXKJWyuQbQprPVpbhWeWR+AiPwPuETdq18snS73hq/Ww/pBed7blFzXDw5YY8vCUsP53PiwBH6h72NrPg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq3yTz6TrbhREg/CZ7ngKcwPwj8hMwOmOo8g8OsLUoPWRnIY4p
	llc3mTPBiRv4vCrGGeChHM2XeJU7xWawMKtfpdDXlXcYjRfCfgqU
X-Gm-Gg: ASbGncuOKbaJks0clplkd7Xw2dN2DWu5A95pIpC7z7qLpt9EV+z5VPdpNWTlqtopQi6
	DecXN8pb9xkpI58S78m0qcI+kNh0+7o8aubJ2dqIGAzCewz9tMYq1mEROCGEQJSfqlMuGiTL+a3
	pz7G5Yc8pvjI32g0H+Vb5ocYrHX8dly9IR0yqoxZTtKxZ3WEtBfI+i6tavpYZwr4FQX4M77q0rG
	n4t3t+YM2khPn+7kvFuHysF/HoE2nLI15qwOrt7B7bQj/1wJobw3DA4cxoqj47dIYy2VRny8r3l
	BktPmtSTSivRGHPZ8/0ABCWTXYU7q32mazyGTj6ozQlbfnRamwTPN9Zt5kaI4lRj0F0l
X-Google-Smtp-Source: AGHT+IFW4brLWtC9uniriyV99C+jcMPdP/8oJA+VeJMpM/RrrFNh6VS98vM0nsOkR0ZMiWAoC4oFKA==
X-Received: by 2002:a05:600c:3c9a:b0:43c:f4b3:b094 with SMTP id 5b1f17b1804b1-43d509e189bmr202063825e9.6.1742999999885;
        Wed, 26 Mar 2025 07:39:59 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e63e:b0d:9aa3:d18d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efe9b4sm3891885e9.20.2025.03.26.07.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 07:39:59 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 02/15] dt-bindings: soc: renesas: Document RZ/V2N EVK board
Date: Wed, 26 Mar 2025 14:39:32 +0000
Message-ID: <20250326143945.82142-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add "renesas,rzv2n-evk" which targets the Renesas RZ/V2N ("R9A09G056")
EVK board.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index 3e61ce372a57..3e3987c9a82e 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -553,6 +553,8 @@ properties:
 
       - description: RZ/V2N (R9A09G056)
         items:
+          - enum:
+              - renesas,rzv2n-evk # RZ/V2N EVK
           - enum:
               - renesas,r9a09g056n41 # RZ/V2N
               - renesas,r9a09g056n42 # RZ/V2N with Mali-G31 support
-- 
2.49.0


