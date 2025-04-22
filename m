Return-Path: <linux-gpio+bounces-19151-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DFFA974EE
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 20:54:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8F775A0589
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 18:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F066F29CB2E;
	Tue, 22 Apr 2025 18:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KuDvxyHy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8A22989B5
	for <linux-gpio@vger.kernel.org>; Tue, 22 Apr 2025 18:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745347940; cv=none; b=TeaUy7yUq3jH6bZpk4jSn2xemZ9nCRYtz/jXVfE5vaQr7o9Bg5UuF4P7dN6Z73aMuacSjpSeolqznp5C0+XrMItZuz2H7HL/EUehB9pdcULQqDIT1GlARzaAHBlyncIZo96vaZ4tKG3B2zxaCJBoL8AOn5PBRogc45shZQ6zK9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745347940; c=relaxed/simple;
	bh=1k1unQkkbNJWyNIqqzpizkZc3aIKLdvvcUxlVK4aZEM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m1qrOZ6oFtwMkdIxVr+6hw9ikPLr57CZUTHsG7myJl/rPPPhwtQopj4NQbqWye6yonyX1ycSopu/B2BSyDHu3KNw8tySvGtk459D47+LpSuXswpirWmi996+u9ni6t7mEt2NrcAnu7Nqalw8ACJydHmPqL886HmHeKScOtsllmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KuDvxyHy; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so3716490f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 22 Apr 2025 11:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745347935; x=1745952735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ADsz4nM5zt5mk0SaIqSNaWehe790A/IESs0jsUHL+uk=;
        b=KuDvxyHyGrC25lEjuJl0sHhcCvZF/pF3czD68drf8To7cQccp2Y8qxi3RM0ChZwcqX
         NbVxTb518ACxsReOslqkprpiBHaHOsJ8IdMQTCRFEV963Ovpcki1WXdbPdsJohoN2OaC
         DdHN2FholbvCNcoeBTvuMjkjOshdifxbF5wOtUb4xrs4i7LW5nrDHyYm3+H8uo/1UK3R
         t0mskDWsLu/XNkDzlLEQfHxAoLRN8rqABMX3JXLWx81j8DkSdtZVUAXKY/eYCtcAODTV
         Na/ivldAIglcA0uzm1Yo6rn9BUBgEVJ6BV7RqnMUXGgkFTqOb49hZ6SdHUNbe0dfMVTC
         M5nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745347935; x=1745952735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ADsz4nM5zt5mk0SaIqSNaWehe790A/IESs0jsUHL+uk=;
        b=bqi+y78wvKAwPiR5rUcP4mWbY9MxXeIkPXvJXT5UAmjgCpqwage9IQnPVE+R1DRZr5
         3bhd7OPrXy08FO/pTQGhNTw/WRrY4Gke841UXsYqh/hLL9vf/ISZQck6AOYJrx7K222V
         5zs09t6sjWZuYjiTUAFdOdOtjsM4dWTUC6PzEVuAUYSYD0Z97aDM5niixAWTvBAPx1AH
         /ZUYRJrRNIhoj5PxMFyO3ILeLD14ib1WxlTk4E5hFgfKhjkkEg41oJJO0fjPnoNGPFGO
         qBaph0yrQuQCbH1YKLvwqg9vKa18C/Ihv7OPRbmeOICkjQoe0KXmH3Q/kr3de8bKfK2H
         CJpw==
X-Forwarded-Encrypted: i=1; AJvYcCU8KNkl6rmWQ/KiM7VfCkS0+PB+hUTCNa0eFI6LN/P3OOxGzbwwgXzPwnrQoAHnd+gPjABF4RtlS+Co@vger.kernel.org
X-Gm-Message-State: AOJu0YxrJz5MO4foNcCdT2JrcYqtk4JgzFDtOpwXKt3758J1H2yXQP03
	vl+LOZV1ecTSz7v/6U82Ce9tvidSLijyxeeWTCr0mK5r7PkQutmbFjJ+lAx7lfQ=
X-Gm-Gg: ASbGnctEcaT6LaBkREelaOobjOICk49sA8MwLoBh8vhF3jnl86MYcJWhS1bP3rkzIKR
	evgSul6nUg6tU3vZsddDxluFX8XIDhUINYdsDYCl9W5953WjgdiPt+U3A54WpGdxBnNH03EThew
	hbShBFHrag7jMr31BZd+DiVuguESNPxjWrVXTSyvqssFMwj6VJcTm0oW6w9C0+YFmJzbeguz197
	0GAb4cOfTrt7oQfF1agE/kUs5EoGk+CEzJDG9M+Rm6E0pjw95WmCULzuTuiBKOwb+o0tFQLLkFu
	wRbQNakMe/ldsrZHlDs0/zyNxc/jsA4NmYiCBjupL3R1c8/hvdaCF3XqidDy5p2aYSoxQVB7ddF
	2tXa0kg==
X-Google-Smtp-Source: AGHT+IHaQWcyIld8HmOWqZEWQ8mfScJy5XfhH5TexVF3JHDuC1C8WH0PzZCZR43OQba1F6XglJkm3Q==
X-Received: by 2002:a5d:648d:0:b0:39c:141b:904a with SMTP id ffacd0b85a97d-39efba2ca27mr13013041f8f.11.1745347935584;
        Tue, 22 Apr 2025 11:52:15 -0700 (PDT)
Received: from localhost (93-44-188-26.ip98.fastwebnet.it. [93.44.188.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4207afsm16278846f8f.12.2025.04.22.11.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 11:52:15 -0700 (PDT)
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
Subject: [PATCH v9 -next 12/12] arm64: defconfig: Enable OF_OVERLAY option
Date: Tue, 22 Apr 2025 20:53:21 +0200
Message-ID: <8baf7818aae1fe5be046015e4bd8121ccc9acb20.1745347417.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1745347417.git.andrea.porta@suse.com>
References: <cover.1745347417.git.andrea.porta@suse.com>
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
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 53748ea4a5cb..23656b0bb7e0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1640,6 +1640,7 @@ CONFIG_FPGA_BRIDGE=m
 CONFIG_ALTERA_FREEZE_BRIDGE=m
 CONFIG_FPGA_REGION=m
 CONFIG_OF_FPGA_REGION=m
+CONFIG_OF_OVERLAY=y
 CONFIG_TEE=y
 CONFIG_OPTEE=y
 CONFIG_MUX_GPIO=m
-- 
2.35.3


