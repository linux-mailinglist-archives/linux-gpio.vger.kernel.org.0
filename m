Return-Path: <linux-gpio+bounces-5856-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 148B68B235D
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Apr 2024 16:01:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48D03B22BAA
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Apr 2024 14:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E686E149C52;
	Thu, 25 Apr 2024 13:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="X63ezSel"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADABC14A604
	for <linux-gpio@vger.kernel.org>; Thu, 25 Apr 2024 13:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714053592; cv=none; b=JMF2OzU9GubRfzc9a57RAWndC7/Z2IVxJk8XcOehcwWmfpKXIh0PbM6ArBq2bWb8/m4+6keR4ZoTvLL7+zPmbM9lAGX8BJW60Y1hhvGP6ekZ3anIeBMKhnplcFVHcOlDMhp3phKXYUS+HVvmk0W6O4mmk3hlIREIFJCLAn3fhus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714053592; c=relaxed/simple;
	bh=mUZACTmIvN9VpSJnu+37t6kjVWpWjqK6pTbjUJgvM2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AoBallJn0wbfJGVB4xyXuCZHGhPanlivo1+ZDkQnGYmhVcPdVk4xeYwgUaYo+GiJ/HGMBHKVI56As+kdEPCRm/rlnOZcyiMjXfmn8L6BalBmiN25Cp2P0i9Ol4JpatYoyvG5/pULJSiQTH3Xwi12gRoYlsO3uYvnYnP1dmKZfio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=X63ezSel; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-41b4fd421c8so4002525e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 25 Apr 2024 06:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1714053589; x=1714658389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QyGh/Qwq5NmQyuXE/qEzsm92r8+stUz1K4JXovBXMG0=;
        b=X63ezSeloXRmXYmLesLrM27SmZ1LKGqrzeFCZo0ENlPq1UUApAfPejgVmKqmaE2l5y
         sQb4jryIocbCAf08vh0xAAP6ntn3DcV+bvlQBKAy8dDSBArXRLHd65VijYJ9w9SAPhny
         q6o/rfa7cL7iW8GCKemp5cJIIwabxIeEZxn822ogbTHz2vPiiIGyFPvkYsuhgYJWPAaE
         DJ02yoZE/vuSdceJC89ug4+5BpV5bK7jB3jwqAdeD5pxrnqUM2EjRaUshQnhGePVP+OO
         GGPalkrxii7qpZ4Fs57lhVEysaHWXaCvCHXU6qGLei7EeuE9vV/FDAYyEo/3sUrtUXbA
         EEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714053589; x=1714658389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QyGh/Qwq5NmQyuXE/qEzsm92r8+stUz1K4JXovBXMG0=;
        b=ovKyk5I0BGWbsBnKsmMeDyImSZaVq/J5UlPKmD2MIootPqKHTOsM/jwat9nE3/RCLQ
         EwtwIfFje5CVrGnvA1XE1RgeN5uYQO+hEWz3dSpfee47FOvwug9HccYyVy/VVhQjGcjn
         DxLmSwONJqdXwxh6IIlx/Iy9515BlExEITSUblkNxtH3lMCAPG3dAeFwPSFaKqNZS4TN
         o5UG3gRcNqFrJzg28qlZlbrFyPkCd/d5WQu87aYZH2QoM0tMmb/D9NiN7I7dVC2Gxod9
         mWMiRvPAhnf7gEf45jQhFi69OZCtlumhEy5LCgPHBayOH5FlUqax7AZWGHI3pbWXjJyf
         XUJw==
X-Gm-Message-State: AOJu0Yxz9bw/T7plkAZwHAUi/7oe1T+QeqAyMxWzDIUCZ0C9Q8c5QYFY
	yiVXhY6DQUFFNJ4tWEx6BAoKdKzCoGZ15Xb4DztBWDCmY9lgWjkoHRBPxFTDJnU=
X-Google-Smtp-Source: AGHT+IFYPfy7I3CXLjJMhD1uN28B2VhtrX5AMAV4Szqw3ZykCF+dF8pQtGiVV57q6XpkZbeoQLiaqA==
X-Received: by 2002:a05:600c:1988:b0:41a:c92:d323 with SMTP id t8-20020a05600c198800b0041a0c92d323mr4457143wmq.10.1714053589161;
        Thu, 25 Apr 2024 06:59:49 -0700 (PDT)
Received: from fbxleo.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id o12-20020a05600c4fcc00b00418a6d62ad0sm31479464wmq.34.2024.04.25.06.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 06:59:48 -0700 (PDT)
From: =?UTF-8?q?L=C3=A9o=20DUBOIN?= <lduboin@freebox.fr>
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?L=C3=A9o=20DUBOIN?= <lduboin@freebox.fr>
Subject: [PATCH 2/2] pinctrl: core: reset gpio_device in loop in pinctrl_pins_show()
Date: Thu, 25 Apr 2024 15:58:02 +0200
Message-ID: <c40d0634abefa19e689ffd450e0f48a8d63c4fc4.1714049455.git.lduboin@freebox.fr>
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

We were not resetting the pointer to the associated gpio_device once
we are done displaying a pin's information.

This meant that once we reached the end of a gpio-range, if there
were pins right after it that did not belong to any known range,
they would be associated with the previous range's gpio device.

This resulted in those pins appearing as <4294966783:old_gdev> instead
of the expected <0:?> (due to gpio_num being -1).

Signed-off-by: Léo DUBOIN <lduboin@freebox.fr>
---
 drivers/pinctrl/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 901f2f9bf850..ad878196ada9 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1670,6 +1670,7 @@ static int pinctrl_pins_show(struct seq_file *s, void *what)
 		seq_printf(s, "pin %d (%s) ", pin, desc->name);
 
 #ifdef CONFIG_GPIOLIB
+		gdev = NULL;
 		gpio_num = -1;
 		list_for_each_entry(range, &pctldev->gpio_ranges, node) {
 			if (range->pins != NULL) {
-- 
2.42.0


