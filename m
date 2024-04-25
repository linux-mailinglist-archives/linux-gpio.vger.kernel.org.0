Return-Path: <linux-gpio+bounces-5855-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 164ED8B235C
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Apr 2024 16:00:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47F131C2089D
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Apr 2024 14:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1F8B14A082;
	Thu, 25 Apr 2024 13:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="NRgp8HGU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33301494BB
	for <linux-gpio@vger.kernel.org>; Thu, 25 Apr 2024 13:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714053589; cv=none; b=tMDnGmGvVERqmCJTPbos0pf31dkehIxJ4l8whEyHGX+pIvPbDgJaSwbPuR690SBlVscjdQf/LQD1ymgktmrCw81wPiHF0wRowJD2xPskJObw3YCt/HlGfzM4p6M94owFs4mKc6W6xom65CULNtaT/j6yOnS+L4yLvIXWnK/hegY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714053589; c=relaxed/simple;
	bh=KbpZ8d+RgwRLaIMQKqSigv1pMFc5n3ynVMEzJAYBd0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Avq9HiJWmvaI4Dlvd40jB88CSKxgbs9aAgwPf9vFyyWZttsHvojPAH9Bd1UFfLl2Zg/8Y+IrS2bpPi2lAcaUQJ36VFQqoeWLUmlV7jJ4fffgNT1X6FQuDP7i+ewqBNz1DDxP+CA7tJUprl+vjy/chtfuDyn371hs576j9QIK5MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=NRgp8HGU; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-41b56838250so4570685e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 25 Apr 2024 06:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1714053585; x=1714658385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LR5Th4rgsENBGC1XHGIaoOrv3KgiGLQWWbPFYgnaOZw=;
        b=NRgp8HGUleo4R2R34dIp8M961Lo6v72fpysxICs9WvOaGeFSK+YeZQUQYXpQq/qRBo
         KURk57Udb+3Jcntf8mGanubEU2y8KPx/3LVeq1vNXztSZ+T7wAf4p5/OMWd0wGjFv90x
         ZbIXAjSjacCrVG2AxDBKMRv7Kt2zbsZJtwtkko7f22tZHmueAHVedM35krXyCTVSwPoy
         oXbgJ8pGgwwDpnrf8cpCgM/fzwv696JYqII+biPcxq8zaLTKRZYJPqdZTISaMEiGdHe1
         MjXke+uVRWdmySD9qeDjaVbphDFCUEMMRJCkopdsU949LUvaT6y+/dH9R+ZB+/nzRXEp
         qS0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714053585; x=1714658385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LR5Th4rgsENBGC1XHGIaoOrv3KgiGLQWWbPFYgnaOZw=;
        b=L6cVm7K2n0NB11v9c8/lKgRYvXr8RVDZXs4GqCTgf9nhQ8ZS/JkMReStVR53BhUtq9
         KYE39BkbSnAywqKCPtTLUkzpLIzk2h0B8/uUd/oqjGH2VwUp6IzR1amofbQvgkR7rnx5
         PFvYuXfW3Btfwju6Yx8EK0+jK409Fslxn/kyNiQwPtqJUhDRPQep8m1vaYXk+Lhb22YL
         uNnwpLsE8MbLmjLH+d9/H8LSw28T1x4PJGPMfeGgN77AVFdHXe8PHqrgoUeT/3pXlG7y
         E3OmzNO9yhQZYLqs1KF3QBEFGDxZdZZDQJZ/6HJ1BStITygKOIeo25iKYR1IjPqki9BD
         ytcw==
X-Gm-Message-State: AOJu0YzJ9GoB96n7a1PKcX2xbSOyvsc+t3ucOORdUzurql2zYtfr1YtT
	onysuRoFUIYy6Z9FNnkr3Ekoz9srVixNNJCrKLWfL3AEIPaXZ9NQLk5Rzkav+jk=
X-Google-Smtp-Source: AGHT+IHGaFhMe5yKL6F/+83lu4EV+Z0XaPXrPqBYQngm29el1FnXbXjw74hkSw+DvAhi+EO+LTBgaA==
X-Received: by 2002:a05:600c:1d04:b0:418:ee1e:3445 with SMTP id l4-20020a05600c1d0400b00418ee1e3445mr5798812wms.26.1714053585319;
        Thu, 25 Apr 2024 06:59:45 -0700 (PDT)
Received: from fbxleo.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id o12-20020a05600c4fcc00b00418a6d62ad0sm31479464wmq.34.2024.04.25.06.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 06:59:45 -0700 (PDT)
From: =?UTF-8?q?L=C3=A9o=20DUBOIN?= <lduboin@freebox.fr>
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?L=C3=A9o=20DUBOIN?= <lduboin@freebox.fr>
Subject: [PATCH 1/2] pinctrl: core: take into account the pins array in pinctrl_pins_show()
Date: Thu, 25 Apr 2024 15:58:01 +0200
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


