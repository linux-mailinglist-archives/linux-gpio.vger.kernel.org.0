Return-Path: <linux-gpio+bounces-24259-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C3FB223E0
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 11:59:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6B885601AC
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 09:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D9332EAD1D;
	Tue, 12 Aug 2025 09:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IPC2Nvs1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E942C2EAD16
	for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 09:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754992690; cv=none; b=RfCd/fyIJIQNJenmnGYpqUsz5g+bJ8/LXB2vgxE4i+v4da/Kndhue80v3HTpzsLLYE9OlkV7mVokZIZgv8mU6loY9O1dh1m9Evw2w6hRdl02r9UapuZQVQlQ668GI1CRem3M93q/glVAapjNlUu6pqDcqBILBR0nqIwFwb7oOHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754992690; c=relaxed/simple;
	bh=weXYtvOJal0gfVKqkBOQyBy266M+SxjHRozHrgmLGEQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eJV5MaI1bDOJWboH0V9VEwidIIbqN6lmS+6Px+y36M7yZ0OdLBTHUKIpniB1xaVn2O4PwwoIychYjBP+Y+tZJfvl3zS17BFD7MA49bw4dEl/WAAXVfmJsJrsiyr3GNPrazcZ8bTKSFkzk1BoaxCaeLKYiRZWqGPJpTKF/u2JWJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IPC2Nvs1; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3b78d337dd9so3361394f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 02:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754992687; x=1755597487; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tpowzIaT1cDZkW3EQqK0abqv+liy/Ny1FTTw1g5xEZ4=;
        b=IPC2Nvs1lc8hYO01MxA+pPttH9cIOYlqOhIEAdn3ai9MO/+wVdBxwzckHlBZCnnnFk
         y8xyDN2PQxv4BGvAOK/srVh0Lod9eayzyXD3fH1j6FVP+YD3p6/QyCX/kcqm5Msy+leO
         0uRbhCbuqPmxm3fygMQLEIr8Sbje6V264bhZ1wVtrj+EgHHYFm8PtY5gbwlnmOsE8SOS
         xzjKA2ncrCqnLOUyYj7nbS55GMwlxgbCkZyin4lNcaoJil+QtTvMJBGZlzVeAxWJyafn
         q/m4mn1O4Jwr5nJAq6qpjsMob7ux/JcMPwxo7lxBvdBOTLyqzvFDLpoNoVGDqDQ3020U
         abHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754992687; x=1755597487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tpowzIaT1cDZkW3EQqK0abqv+liy/Ny1FTTw1g5xEZ4=;
        b=iZ4PbkDw5byvWZtY8W532sriI0pVn+kF5w/h/6XWr58q+S9Z658xug1sBTo3WP8oF9
         pu5sn088WD0IQcp6BY4r11yJHU+1PKlSAF2hd9K74PIFvU5CE5hkj1Z7ZYO9P1pt8PpB
         RwdYmzVSjXoDPZYzA1cpOG2eBlxTKa8ysH+wz5C6Oxa4UI9vBVvU0/9GrCPtbSRmHSwu
         jMm9ME0ITFilRDj7mgy5K7cEZ3AeW8pAVFaIOTnoBjlyYpLhU6AcHNfHI3iNUBrm+QNU
         U/FUJeopP4zG/L5q4Kw2V11gFRv9cY7hxrdVsqdX/pKjTfR9rfKZGsPcC3EZIjYsU4HH
         GEHg==
X-Gm-Message-State: AOJu0Ywm+uUL0JLohcA6mX7imt3YVqvzVS+SyDNyeVO/d7r0kqIBeUQQ
	B340VScQ0eC3O7frCVnrcQcQYtQRV0J1d1h9nWWvEwr1+pveMOtY3hktF+GY7mrCupE=
X-Gm-Gg: ASbGnculqnuIiG6qV55yXDcM6Q7mKguTAqTlDYIu5SHI0zTbpTwb/KQItJlf85d+P7u
	ifpxWCb4by2Wn7NRQA+hoWguDibiAPszabOB4EuzlAXUKRZwXif8OqDlX/UUJxKdiX0oSi919ih
	QuYO9nxNbum+qdmz6jutNVJYtZsYfpZxjsIxci9vj3cw2tIqE11tQ9r53w6nve032xNJ5kHe+Bs
	TBr+tOb1FaDTgyx5omwUlCL+F16IM8oxdlbm7hjOHbX7pStCqp0LXpyNCznwBbiRgd+DBThkeWh
	uUtrytiuo2Tj7vmBFDmMQKElujikgZ4FdzuGrGhaTrmx1HCW4PN90j5IsXdEYkdRQyZoWZZeuOx
	BZyy6EG1cL8EU3/u4NEE8x7V8
X-Google-Smtp-Source: AGHT+IG0JFbzvxgcB6X4MyZBqm+2xPe40r8xhGAf0WOSzlzFftx7jbu+1MVfa5fUGL+ohg1QwvkoUw==
X-Received: by 2002:a05:6000:400b:b0:3b8:fb9d:249d with SMTP id ffacd0b85a97d-3b900b2d934mr12705009f8f.21.1754992687241;
        Tue, 12 Aug 2025 02:58:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8e0b2d2fasm33098977f8f.50.2025.08.12.02.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 02:58:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 11:57:56 +0200
Subject: [PATCH RESEND 01/14] gpio: generic: provide to_gpio_generic_chip()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-gpio-mmio-gpio-conv-v1-1-8492f4a4c1e4@linaro.org>
References: <20250812-gpio-mmio-gpio-conv-v1-0-8492f4a4c1e4@linaro.org>
In-Reply-To: <20250812-gpio-mmio-gpio-conv-v1-0-8492f4a4c1e4@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Hoan Tran <hoan@os.amperecomputing.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=872;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=q7IZHV9NOU3n+seY+p1AeQbkCwKHTjI/3z6Qnen62yA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomxAmwRO4IQbNhdYvzJyHfuqqGp/NqybhgbKLH
 Eiji2ez+r2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsQJgAKCRARpy6gFHHX
 cs/LEADLl4q5Pp9BmcpGAF8+4D4VldZtJWYz9SJ98k/ce2tzQ29zimKTLwC20VXHTZuYGjDvQCm
 IuqcLDT2QEKqqMzdPPAASqN/z/heGoW7W+ANwWXhY+AL+mK7ndBSvCx0I4ZZRkzOvpck0EDo04D
 URysnHXBiXHO5o4wtfVCkJcNStCJSlP49m4xz7npz625zWjJVmTmArzd2qX0FBRp+RnKwdnMlLn
 kEDxHP8qeVX1GoNaairRnPuMRSt7CSzDa4oK3UWwMl1ODoUvCXjDx0LNaEjr3jsGoeaJyQSWrWW
 LA3ecwTWriz3GW4lXlZPsxk/JMLJFjYStN0m0YTaHilKwTVnGkTJSE5OZeVxei4vgN/CaWyOCsR
 /INhTtXPt8/FgFiD5901OxhuaOc2eDnE7z9AtCsHAynRsFhyGswM3UnwBwwHn3I/w9cNmGXL4v8
 ZAXOYcNeYtcDeczP60htbgUv9u/t818B2GGZ8UfhoyCyLViSCSdJ4O0Bo+ck0cvqbClej21ogsg
 lumzlDWb/QgrgbFaeGdFhLrbtvcIy9TpbuR5oIJCkD7CCY2qYG+VBHyD0bwV1h68QE6cbNIBVx+
 PYPJ2h8R/D5Gx1M//2p7KfUM2tUdw9iLn4nw0tZcKhYDQDl0HGDCe87CrtYC2Ms/8up7QZ/WHxU
 wr+ngzWXtIQhYFQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Provide a helper allowing to convert a struct gpio_chip address to the
struct gpio_generic_chip that wraps it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/gpio/generic.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/gpio/generic.h b/include/linux/gpio/generic.h
index f3a8db4598bb59f1dba4fbebace24dc10be44ae4..5a85ecbef8d234d9cf0c2f1db7a97f5f3781b2e4 100644
--- a/include/linux/gpio/generic.h
+++ b/include/linux/gpio/generic.h
@@ -55,6 +55,12 @@ struct gpio_generic_chip {
 	struct gpio_chip gc;
 };
 
+static inline struct gpio_generic_chip *
+to_gpio_generic_chip(struct gpio_chip *gc)
+{
+	return container_of(gc, struct gpio_generic_chip, gc);
+}
+
 /**
  * gpio_generic_chip_init() - Initialize a generic GPIO chip.
  * @chip: Generic GPIO chip to set up.

-- 
2.48.1


