Return-Path: <linux-gpio+bounces-6305-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4825F8C28BA
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 18:26:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BC5F1C22640
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 16:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF7E2176FBE;
	Fri, 10 May 2024 16:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="s+BF2aXy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FCD175571
	for <linux-gpio@vger.kernel.org>; Fri, 10 May 2024 16:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715358380; cv=none; b=pDk5XkDre7OV/RZURtt00Sn/pNMFL023Y1TChA87o3O1tzQfVfJ6Ud3jk0yAgxc9KRtMOtNk5QQc3loLke6vBmP5OJG4VRhU2P4LdcLRR1PMroJlVykWcQA8zSh7aKBT6OmQeMRa/7THffaFRfZjoqKjhkXDgdNDSz1Heap7K90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715358380; c=relaxed/simple;
	bh=KbpZ8d+RgwRLaIMQKqSigv1pMFc5n3ynVMEzJAYBd0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R7ktV+ZsKNdouqsR3nmzMmrygwzdNV0lMWv2jaV0WBPzHIZ57+DU+mPZQu1+cWmq4cS0OW9w4/UXFsBwJtDUqixGbgIGlS7Qccj2TrSV+8t44F+PvTku/ENRV0kUBvLYQ5zIpDDftHm2WBeRwRxwaJLIKqDTSMFEWiW3T8rUG6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=s+BF2aXy; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-34eb52bfca3so1873428f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 10 May 2024 09:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1715358376; x=1715963176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LR5Th4rgsENBGC1XHGIaoOrv3KgiGLQWWbPFYgnaOZw=;
        b=s+BF2aXypt2jr58DeNFOn2BHSyW10ZqG83XvjafmJtepCygO1c+J788odMPsATwUcF
         pd7RaXS19SrYF+8lHaprfICoQFxDeezqKMyWpLB6j7HxZPfa/SHcAbv6+DfZrdb/zrrY
         Xiuyoq3g+LYlI1G1DAkHoD7/woLmjDf3uxbn7LlB6JaAu8W3DXXdmOQAj47hkaBlJJaU
         YWZmQtArzxn6ZuxLNGqahXi7sslnVVO6+FphG1mxCVO7fEradADWcb/r6J1vzrwxuKfr
         A/ofCw8NGnkr+6iNo2MtSKPJxFnMke5QfSQ7dnBQHkv5YHFRbiANhxCllyss8wfjQkgI
         7D9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715358376; x=1715963176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LR5Th4rgsENBGC1XHGIaoOrv3KgiGLQWWbPFYgnaOZw=;
        b=FkKnF0qjN+hS2ko0vgeSJQGhp1L6dqRNJFkwCWzdJQ7d6ruwRsT0AX5psHrLruRqaP
         gtFxhr82yU4TbkVFgD/FxXRqV7TcyshwqIazV7re0UNsEWS04NGn36ieFogRmlwMSRj1
         JdrSxdstq5sXQXzseM6rT5ALO0atvh1oXRRlbiDY8f6EFwi29TufyM1ihmYSJxNi+g1f
         hfCljUqh1YvA65pz+58n2oxP0tio6L9dCw9rTOjczbI4AFjCzDGS/v3nP0Rn6YHJ01o/
         BYllfdxzhYTLoadVCv5Vm6skNAtSkYfT/a/SyxFVCnZRtd6zTq4oCNd2pZtZoLM5gAJl
         UljA==
X-Gm-Message-State: AOJu0YyaDzsLDTKC1enGrzAFSldq38t7BqLml2azcmmGBeak8YmGKQ8M
	EkErFhC2C7WnzOygeDTbua121bQmwS9W7SujOIobxGB2fhK+8pBwQz4nfzqaeXs=
X-Google-Smtp-Source: AGHT+IGnMyhOx29AvuQhDh0cLZxd8JVQPcGXpdsgHPHaDyNcqfDQQCBeaoRnQyw34Crs9jM3D/0ZVQ==
X-Received: by 2002:a5d:6503:0:b0:34c:eb4a:1948 with SMTP id ffacd0b85a97d-3504a631080mr2882705f8f.5.1715358376406;
        Fri, 10 May 2024 09:26:16 -0700 (PDT)
Received: from fbxleo.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b896aa5sm4952206f8f.34.2024.05.10.09.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 09:26:16 -0700 (PDT)
From: =?UTF-8?q?L=C3=A9o=20DUBOIN?= <lduboin@freebox.fr>
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?L=C3=A9o=20DUBOIN?= <lduboin@freebox.fr>
Subject: [PATCH RESEND 1/2] pinctrl: core: take into account the pins array in pinctrl_pins_show()
Date: Fri, 10 May 2024 18:25:38 +0200
Message-ID: <6df39bd47942156be5713f8f4e317d2ad3e0ddeb.1714049455.git.lduboin@freebox.fr>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1714049455.git.lduboin@freebox.fr>
References: <cover.1714049455.git.lduboin@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We previously only looked at the 'pin_base' of the pinctrl_gpio_ranges
struct for determining if a pin matched a GPIO number.

This value is present only if the 'pins' array is not NULL,
and is 0 otherwise. This means that GPIO ranges declared using
gpiochip_add_pingroup_range(), thus making use of pins, were always matched
by the pins in the range [0-npins] even if they contained pins in a
completely separate range.

Signed-off-by: Léo DUBOIN <lduboin@freebox.fr>
---
 drivers/pinctrl/core.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 6649357637ff..901f2f9bf850 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1672,11 +1672,20 @@ static int pinctrl_pins_show(struct seq_file *s, void *what)
 #ifdef CONFIG_GPIOLIB
 		gpio_num = -1;
 		list_for_each_entry(range, &pctldev->gpio_ranges, node) {
-			if ((pin >= range->pin_base) &&
-			    (pin < (range->pin_base + range->npins))) {
-				gpio_num = range->base + (pin - range->pin_base);
-				break;
+			if (range->pins != NULL) {
+				for (int i = 0; i < range->npins; ++i) {
+					if (range->pins[i] == pin) {
+						gpio_num = range->base + i;
+						break;
+					}
+				}
+			} else if ((pin >= range->pin_base) &&
+				   (pin < (range->pin_base + range->npins))) {
+				gpio_num =
+					range->base + (pin - range->pin_base);
 			}
+			if (gpio_num != -1)
+				break;
 		}
 		if (gpio_num >= 0)
 			/*
-- 
2.42.0


