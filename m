Return-Path: <linux-gpio+bounces-6306-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EB98C28BC
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 18:26:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A3711F213C6
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 16:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF1DE1779A9;
	Fri, 10 May 2024 16:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="WjFSInR+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C19176FAB
	for <linux-gpio@vger.kernel.org>; Fri, 10 May 2024 16:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715358385; cv=none; b=HVWOZ02mFnKishm1OGjxRohNQ5HN46jRMCfr2LaFDPs2i/zji3z6u0YlmadUBW0cru7quh/YiP8OSNW1vfGzE5O8P2xU+xCpKT7EUVlyWNfyCGypnrHLWJOTaxISDjwbCnhd+C6LqAOmrUDTKrTLbh/fgvZvz2vQc74HLlaWvkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715358385; c=relaxed/simple;
	bh=mUZACTmIvN9VpSJnu+37t6kjVWpWjqK6pTbjUJgvM2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PPvRjGGEo3RivRFjKocBTgoas70v+L/67a5+ohcZus0LHIcDwRKP9ZhyKfcxi52osnkUA+R7SpX64WGLahZgh0dGB0U24D/4aTK+HUxDQhC3WaI0SGHNTCgKs4HWXIDpMBQtvI6yrTxFK2I+ymWqh2Y+2jSdfN43fen+l7B8piE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=WjFSInR+; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-51f45104ef0so2308894e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 10 May 2024 09:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1715358382; x=1715963182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QyGh/Qwq5NmQyuXE/qEzsm92r8+stUz1K4JXovBXMG0=;
        b=WjFSInR+004w6lES0+Sqg96x+A0/oUCJiki5+9SVN0gyrruZSBj3408Vqg1dOOgtJr
         GIOkBovnH3X/SxyNGeCr7XtoXtydBSU4/m+w0jUvkEIihPxe9j7YAqFXm2Ouqw8Sap5M
         kw60olOuLghrLDjttCacq7Uz3h8KMprNoZ5TYG2xxJoQKthweA+Cd8qJsI2XNsfF1RS3
         BXEgRb4DgE7fQza9KXZGscn6oJMboPbeFLm0vgbREYo3MXBD+xbzLD8yTLNXjabZc5Sk
         Y/fp7289weaEGP7neKAgR5rthEA6Yh2297aNDYclU3130+Ct72SkzoIv0SjvAC19dGJB
         3nXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715358382; x=1715963182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QyGh/Qwq5NmQyuXE/qEzsm92r8+stUz1K4JXovBXMG0=;
        b=LWQ/Hf9Iddw2u2z70HQfFcsBQz5ZsXSVIZKWEG7gEuFOTNRio6OYU70Q6591kwNgwq
         Yrl0RpvsWIn3KSO7mxEzZ97gEDu2S2l2uS/I/2fqxryDzEUoBP8PIV1Ar8I+dwqdyJd/
         jMCSvZT8Knm8SdmSEKmXQEcash9O8GvZGpqUoImX9nzOhoricoVv/VbjQEUDGCZvgcRV
         hKlCmwgXTV5utWqSEhnbKHL274osOeHLRg9Nbw8cQ2P1OllSxX5XQVz6P4k27epzqVEA
         979mwp0AgDbnTImHs6JLmOMbtD9BAgpppq6WXRJlCirZwi4ahhoV7B+q5hl5wE6eQLyM
         TYMg==
X-Gm-Message-State: AOJu0YwVxn6upPPRttmdQmSdSjOmiQUI8AIv2b1CxVwlK8GeJ0lHsu1I
	xe9YaEO46kG/DXS+oja146/s/bLjBgUbubTHLHfKz7aZAmB4R7VWC0wNOojjIp8=
X-Google-Smtp-Source: AGHT+IE+Rh5byA5+4RfuhgVDmEQbOyg3w/YYGC/qD0xJW0Xl2arSt0vCilMQiRGox+uasSLbDvJ/1w==
X-Received: by 2002:a05:6512:3283:b0:51f:1bf8:610e with SMTP id 2adb3069b0e04-5220fc6d559mr1885977e87.37.1715358381642;
        Fri, 10 May 2024 09:26:21 -0700 (PDT)
Received: from fbxleo.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b896aa5sm4952206f8f.34.2024.05.10.09.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 09:26:21 -0700 (PDT)
From: =?UTF-8?q?L=C3=A9o=20DUBOIN?= <lduboin@freebox.fr>
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?L=C3=A9o=20DUBOIN?= <lduboin@freebox.fr>
Subject: [PATCH RESEND 2/2] pinctrl: core: reset gpio_device in loop in pinctrl_pins_show()
Date: Fri, 10 May 2024 18:25:39 +0200
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


