Return-Path: <linux-gpio+bounces-20759-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBF9AC7F3C
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 15:51:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 993E84E7A96
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 13:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0851A22F779;
	Thu, 29 May 2025 13:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DSlmVOqC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C415822F164
	for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 13:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748526574; cv=none; b=rTxIYiUPzJdoVC4xjq616jZlEqeguzgoD16OGNS+i9Op6aadvKy7P2meLrwjT2f10CPiVPQLcKMZc1qYvTb9EtboMFBl4yfNXw6ZfWcyWVwIz/I+5jBr58eQOWrOxC93EF8C0RIOkc6CRjIlOqGSrI7wtdAYswvkWuPccsQv/sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748526574; c=relaxed/simple;
	bh=RRM404hdZVflbCbuZ7OBxFTgWWaneCmtEfkgg/Xp1Lk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PM8TrWFYo1eggiShfPfd8D+5tvNYXIvSzyUiU5Vw78tWiCcQ6ho5vLUtdHPH0pSUVZ/3ud79LVdRxCT3Xs7cmMXjjCSuibZNEhYfbl99v2P0XU3eJozRzeqRIku4aiQ+4hfr5/6AhtUJ2L68ukANllDPYasPv6o2n/6Y+ZekJwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DSlmVOqC; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-60462000956so1559273a12.0
        for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 06:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748526570; x=1749131370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hTCgL7Vlc0a5ielumzwkk7bjVhaA3TYeVWaUN3CkeyQ=;
        b=DSlmVOqC8tFVQh9PifCTO3dTVQm7c6Ym5Gi16t2dMktNE9kuYyieUwCXmlr6S4rx/9
         8A8EUa8sl0ij+fUKAuKFufNPS/wr463IKXnhy2oqeIFaJYyIcpcaiErYPrTndmH3Qcja
         ayW9TsUaamZ+5IQpG1qiqwdShEsSCEIRSuZ9bvzH4ne2yAgM/IJcoSdg5rWCODAM0/l0
         klUoJDyEBkqn1pSSeyPjZvMVK2YrOO31IogRzLp0Z1yMq8uuLHnTw4HhJaLWHtnVnBSD
         bjFF0za6Pd9a+h92ezd9CkSjE+S4GJunZdCDpMFalAbsn/X6Ddhlt9gfQhN4e4xoWbPj
         XypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748526570; x=1749131370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hTCgL7Vlc0a5ielumzwkk7bjVhaA3TYeVWaUN3CkeyQ=;
        b=nwsx9g9viRGT/RwndjgmPBFsSIrZafXmFCt1UtAHWajiSVAbddJJCJQUcccufs1/sy
         CjuHe66c8tHGbWLkaSnso6N4yx9s7ztuSxsS4KVATu0UXDhpu/FCsXcaQtCXLMw05vPP
         j4szed2AmyW/HCdfT2oFuEiGQY/5yXwfoY/kMvc+HNqbVMgacUYJqtOFLqQSj7C3tQ8b
         JvB75m2b+bqgL3lqKrQSkvdkn8Ez3zjTjSyincO/LgtGhsya8l3vFsuoGCc2DTvA80or
         Mp/S2MpQjy7y1cCK45feeQU6+0qKHSldOVBMaQ34yG4bMwrX4SnxgFfYkfDl4nM+02pU
         SPuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfhoamqHFkk1vWg2UxuOoKWBgk00SYdRcg8pGkiVVKrz0NShl0kRJfR+Pq40o7uAMnRGZZkHP0mniz@vger.kernel.org
X-Gm-Message-State: AOJu0YztIooT/DD4YYv7sjqw2CMsN/wjUPWOoB57wz9034VsVK9/0527
	Nl2nnDepm6JD3JC3xnJzGkW9CoJ0MnYlCmcV2dHJrLVu0txHT+YKaxX523bBo8pVmek=
X-Gm-Gg: ASbGncu0SP1ag0njDyf+SLXs+qV6tbiMy/G0Lo1XnTFWiMalbwWbf86NhjmCnIqVWCN
	J+KOm7H8pdOGrtmJmUf2YfTx1EdiCVnSRb5h6Lz0xuAfIzSw9ffzaJaHSuOeO4eVhDXeQgwZ1wh
	xVbovoN38kAs3DtjvlwvpsJiaoSP99cww677vDfPsdP0Za1F5M8kA+E6ipew/b9LJNv4Gzx7HL1
	5VaCzIYATIjRwhjIo49PgEXcuu9zf8LlMpJm4kRdExjJ1ECaCjOsEjI3V34h7OMVOuUlfRNoLxe
	qeag1z17AXb2bCKV5lA3apYcf1kc/yC8zFoa6bV1JFzFRmHE12jSv4WMfUGPfI286vP3M0F27jj
	8XTwKPIElrUjk0o0sLWDPgw==
X-Google-Smtp-Source: AGHT+IG4MzMu82x8TfpgUN9WiYCMM5FeHzKNEVK3ejORnoVUR1rTDmcODCtdcmtp8bgBgoEd5vCLFA==
X-Received: by 2002:a17:907:9410:b0:ad8:a935:b90f with SMTP id a640c23a62f3a-ad8a935c99bmr503129766b.7.1748526569836;
        Thu, 29 May 2025 06:49:29 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82becbsm147641366b.39.2025.05.29.06.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 06:49:29 -0700 (PDT)
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
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
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
Subject: [PATCH v12 12/13] arm64: defconfig: Enable OF_OVERLAY option
Date: Thu, 29 May 2025 15:50:49 +0200
Message-ID: <20250529135052.28398-12-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748526284.git.andrea.porta@suse.com>
References: <cover.1748526284.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RP1 driver uses the infrastructure enabled by OF_OVERLAY config
option. Enable that option in defconfig in order to produce a kernel
usable on RaspberryPi5 avoiding to enable it separately.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f6e9bb2a3578..ccf2f50673a3 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1659,6 +1659,7 @@ CONFIG_FPGA_BRIDGE=m
 CONFIG_ALTERA_FREEZE_BRIDGE=m
 CONFIG_FPGA_REGION=m
 CONFIG_OF_FPGA_REGION=m
+CONFIG_OF_OVERLAY=y
 CONFIG_TEE=y
 CONFIG_OPTEE=y
 CONFIG_MUX_GPIO=m
-- 
2.35.3


