Return-Path: <linux-gpio+bounces-20727-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8B5AC7CDF
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 13:25:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1733A405ED
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 11:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44580290DAD;
	Thu, 29 May 2025 11:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dJVQ907N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6E128DF41
	for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 11:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748517755; cv=none; b=eDvllbJcFmU6TmN69kDTXAV8rizYgVAiUyyeLQCdAO8RGZFK+5o2BGX4Rv1INr9OBLQJQOjDe/kFRajv9yEg/dVruEbbcCpEJI/HeXggOp9Izn418cpfDrp7mojkYyUJPBVtI9JMZM0li2sh6aTlfIxrUw0HF1gGyi+sD3LoCp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748517755; c=relaxed/simple;
	bh=Cxv3DdNSTbG6mkWW+XlQDzM5M3k//FCq7uG/9MGjWvM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qUwc+uXA4pTBMD5EO01jylKF9il3zdBl2BxvRkEqpZ0PgL7w5wrlSrbdoxiijyK49YxEkBrbxM17l+z/n86p1znTHPMo0VHwmLd4HennhGtd4Yk4Qb1AJi0z8yJSe4SZXbtJdup8i0dZl+T3tENFyr5HTEzm7zE3rbgq1q+2adQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dJVQ907N; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-60477f1a044so1248340a12.0
        for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 04:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748517750; x=1749122550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8LMEHYmovrRN8zYWQwYy5+2ddqvSDMDQcnZraZcEHI=;
        b=dJVQ907NALSUscYeIJLvis9Oc5iPWNtGVZZttCHjXFn3E4xsvNfJn/+bEoC9m0bWYl
         m3+BTeB78Hbv3Tm8OEOsoZ6k4MfzsR3+ZT4K+88PuUQ3tKQ6aSgOrSVTxFkGzBOAJpvg
         nkhmh3c+bIKRx3zLM44euDiK0AAvMJghQvBfxCbQeeaii8wXuNjZ46IyHfaSPnK3K2lX
         NjyILxJMns/9VW+pmzNwDC+m4yohnMXYrm8NexWxOPHUkf38Z1Yf7bO7jO6mt3BstS2i
         QoLsP3O6/ORhn+3Tn/uqeTMgfrMbCe2ghZ/wGX0qkG0BtmJBLy6hQHPG3gqn2rKJlDO1
         G0DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748517750; x=1749122550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i8LMEHYmovrRN8zYWQwYy5+2ddqvSDMDQcnZraZcEHI=;
        b=fp27ms/WEuSQ75vcfOjZK7odBNAI3k3kWR9ABd3n71u92rddDC3zEi9FRF4nbk1yFp
         2RDZNoPIBoOY9wa2SMkX5alzLwVIlURrTPRp1UVuSjz3zEGX/YQQyL5x0ASO8iPXt7Mh
         8fhSbGUON723NDICxXY8wGk0UhdQ4Tnc54oOxG9NCn92XVewjRFJ7dGqpb2rFZCl1Jb0
         /yBkrgM09OUxVXLuDajmp/TmDb5AvampqikitIRB0Mh2DpagMtSgXryhtNHKfzst4Ih9
         y2FYQ7eC5pdaLyYAiPWzmMspJwKnGnxsWbWVuoEeaZrKWprFRmMh1qVOduqm0GwFn8tH
         YuzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAcu4dp2ab4n71T5Bw/9f1wRMKh++g9BVrMvzImymkXQ3ud4IW8nRxfPqtXBBNvdA5/Kr/0rutsbb/@vger.kernel.org
X-Gm-Message-State: AOJu0YwO/rJi9jBFhSKS7XdC5pfQHFPjMyn7qu4+zLz/XPTGulvidnva
	JzgABwNBrfUCU8Zu7gIRP0CD6/nlMmVNuY7gjXResgAWsmXc0LY9jC5wM5ZxNLScvcc=
X-Gm-Gg: ASbGncuVVF6/s8wxwaggGn2FbzbzBLj6wRRnhmaKwdwc7xKjXUKJaKYvsu9J7QnpCVj
	Dj4/z4Enb5ghuDlHnSN9qUW7x+SaGcKn7Ba1mV608EX/ezqCuREb8sEeEvXlS56OD0kKxZh0FrN
	nmOrBKwQIxbuKf2V8p2kyqiuK/QDrL1FQ3ENf/Jen4NxV+TL+GsbQHBoFayviCA/LU/0JJG48ll
	7PbBGhkp1d0IzBdhzpA+Gs8E/4+ofcphNf4nPtvuB6+VMJpahKLLvvsnyhNytUipeGCHD29DfVN
	SWVcxsLkdut22VeyzDWL2ndcRjZNSdDV8HE6BMdUwabyqEJsjnM9iOwQDezJKyFbWCgtBaVvtPp
	98dm4uXTUyFT25ysfiCo3CD9Af1nw/ffw
X-Google-Smtp-Source: AGHT+IF8XwGQ/OgGZTBGcr2X6Fq/XxCyQEjsrXV9gHdoKK3u2BCfu5O6iMLab7sWG6PmCBIWss/qqQ==
X-Received: by 2002:a05:6402:2803:b0:604:becc:2f6d with SMTP id 4fb4d7f45d1cf-604becc3233mr14133877a12.27.1748517750408;
        Thu, 29 May 2025 04:22:30 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6051d5f814esm2194013a12.32.2025.05.29.04.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 04:22:30 -0700 (PDT)
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
Subject: [PATCH v10 13/13] MAINTAINERS: add Raspberry Pi RP1 section
Date: Thu, 29 May 2025 13:23:48 +0200
Message-ID: <20250529112357.24182-8-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748516814.git.andrea.porta@suse.com>
References: <cover.1748516814.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Raspberry Pi RP1 is a southbridge PCIe device which embeds several
peripherals.
Add a new section to cover the main RP1 driver, DTS and specific
subperipherals (such as clock and pinconf/pinmux/gpio controller).

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2b16ba4eb1ce..2add073f5bdf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20197,6 +20197,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml
 F:	drivers/media/platform/raspberrypi/rp1-cfe/
 
+RASPBERRY PI RP1 PCI DRIVER
+M:	Andrea della Porta <andrea.porta@suse.com>
+S:	Maintained
+F:	arch/arm64/boot/dts/broadcom/rp1*.dts*
+F:	drivers/clk/clk-rp1.c
+F:	drivers/misc/rp1/
+F:	drivers/pinctrl/pinctrl-rp1.c
+
 RC-CORE / LIRC FRAMEWORK
 M:	Sean Young <sean@mess.org>
 L:	linux-media@vger.kernel.org
-- 
2.35.3


