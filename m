Return-Path: <linux-gpio+bounces-11354-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE0D99E4C0
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 12:57:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0FB91F24229
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 10:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEB2E1E764B;
	Tue, 15 Oct 2024 10:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="w9sXKcvb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61BD1E32D0
	for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2024 10:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728989796; cv=none; b=mLDFtUjJ5PHA0DShGtoCjLMIYYYrktzBoxahUCO1jd2v8syIAfC4eRtSc5ytRWFJi/4kXE+YXalQPGvCuE64fIzp4ZC4AyH5xSDHp4mzhK4UIOlZdFuzibwo4byDOgV0nO/yIhn0mXYHui8rPZNhzp3Mar+1B57c5GdOfuFMctQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728989796; c=relaxed/simple;
	bh=POHh8g+2CvyZoU0L+E1KmaYOw5grZB9aKoaGo7YEz6Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i+0G9wb7V1OEViPQUnlf2tF2ZKwJA4GNgD30/K4oQ4FnHRF35mg1mBwU3KYmy/1ZrApfJcmZOU0vvLnGjhgXl3vERG8I1fwGTLxccytk7gF+4h7K52ogfOAUsqlAn6qwVApIYFFxXsyQPqyQmgf0sUsOe4pm/JFSGiTlme4r0Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=w9sXKcvb; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43124843b04so28338635e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2024 03:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728989793; x=1729594593; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OB/wBkvSEUCyn6Pce3Sw/d9S+YTAmxmeVBF6YPbGUIs=;
        b=w9sXKcvbLnUe1a5tQ22wsZYvHb4Tw3cASFTgrym2nJ0UggtAwMDJl7JYrsrIFJxA32
         9bDU++pW7fZ/9N3X6xYfI9cwxflLMhAU/BOPjBIimDlwutivGbWfpqMm6Eu+jNG0ZGEi
         cwieASLOIgo3qrk4QLZwxje2vgGCJWLlcmVvV2u3g3R4jNy0jcE8RVYf75f2EPUbkui9
         +RZNWcN9q4WRG0NOX/lvEOR5skEL5comTMzqS+Rm0iwFeodFEFf3or+xaF68oIOHTU3D
         byZw6ymKQckv3E/2i0veXzgBj6KUGUCKU8WPO0Ju+viaIFXPoSiRK/Td7ldMvGnr8HBo
         yPlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728989793; x=1729594593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OB/wBkvSEUCyn6Pce3Sw/d9S+YTAmxmeVBF6YPbGUIs=;
        b=UnFNUcHKQW8UfWAOPH86vYSiqDJteJ4mnpVG9kIx5i+ucnA3Cdt7cSWiLQ0N9hEf5X
         kz/kTrbfi68W81zoKBE46CE+YKCqCkP5dbsaCoTGVoVgsSr/gMHidSwzVZcmjVqs/lI9
         lYofsHqj51xdNIUXr4de4ocz2WHj6sJRl0u9XVIsTZy2wkVuQKEZPZPrC3kNcry7IBm6
         min8xVomcVtBKypl5dSxqi2/vgdOEaHzH8gPEc69ex664TIm50wBVRhAC32c+90Tgi65
         9Sh7oAFl0IZXVo5o0am6sccEoxW3usO4koksepVQb4vTOkp0KIOhMGS4/MFoLAVpb58t
         F5lA==
X-Gm-Message-State: AOJu0YwhyfjKrkAhGXD9P8T1T9wYOVPWCuYIsFKn0sUDEt1HsOyjjbaA
	n4VjL7TL+M3VcccRsGtgTV40POg0unzsROebqJ8NBp0IxsmhByfd0VnbKfIHFrs=
X-Google-Smtp-Source: AGHT+IGPDhoxi4t0FwbzmOsIZ+cexOTtluzQbWzttetOTGpkuLst9zhZTEkHOz6D3ry6ydwqci61oA==
X-Received: by 2002:adf:f288:0:b0:374:c4c2:fc23 with SMTP id ffacd0b85a97d-37d5529fabemr10540698f8f.56.1728989792803;
        Tue, 15 Oct 2024 03:56:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d382:b11b:c441:d747])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fc403d3sm1254115f8f.101.2024.10.15.03.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 03:56:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 15 Oct 2024 12:56:13 +0200
Subject: [PATCH v3 1/6] gpiolib: notify user-space when a driver requests
 its own desc
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241015-gpio-notify-in-kernel-events-v3-1-9edf05802271@linaro.org>
References: <20241015-gpio-notify-in-kernel-events-v3-0-9edf05802271@linaro.org>
In-Reply-To: <20241015-gpio-notify-in-kernel-events-v3-0-9edf05802271@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=782;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=zMsMSJX1Nl0+caHE+JZSEzX7KhbE4YG1tQGrQmi8r44=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnDkpeBfCLeK9n2OwNNmJVy5zXeg4cQdpyu/cED
 vlQToy6702JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZw5KXgAKCRARpy6gFHHX
 crb9D/9Z4QrxjSsPaqs/c9ITfR89kkLc9Ke/IetJgq89alayXHBv62HDxc2ES/R8CD14LiZAeXu
 aYdLFTwt4qndPwq+Slj6jgdbUrCc7/YKeTRLYgQdPbgCDGC5KBW38BUZg3V/EQbkeHaY+6z1TL2
 sszaWxReN0zuGFopufoQPH9CK6KNFVT8087Fs84p0jAGRAkxgX1AW68Oxw5gMDz86PTl30U0R0g
 YWc4BKkfgNyBnFN0CzIlUrLHfyo+hZRKTyIFE3UHG6YtHnoFxsz204NUShRT1dYkxnQu4SZd6P4
 QDzjqzL1r1wYBn7tFERmJryQvX7Kut2vl3Oyc55H3ZM0QtsuZolwi0rhE2r589Wwj7tFCI3t9dn
 Jy7ZapZ1X/GdoVJa+QDFIR0SrwPXE/PmTs9ub/GmdzqR3VbrZAJ2sRGm+g/T38UOnDU85CGcBk8
 Yuny6fVfxlz78r/GQaHcMRSJf7sOwOdvr5dTZFA2l05HmtujRQuUwR1ao4xh3/CNKpjAnYq3yj2
 TCuK3HsSf+vf0VwJrAcYWCVHK8PpzQXu0X4GLAR1C5QiZ6IObqF7NF0meLcH0RFrSw+No2MRLPr
 FxvATwHmJMw8YXtikGAoeSuPh5u1vYJc5chUYH9WYwowKcOGLp8tAHFMsHi8bg0zsRzZPNRZpyo
 4yYXGcxw5KL2OAA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We notify user-space about lines being requested from user-space or by
drivers calling gpiod_get() but not when drivers request their own lines
so add the missing call to gpiod_line_state_notify().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 97346b746ef5..c09464f70f73 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2532,6 +2532,8 @@ struct gpio_desc *gpiochip_request_own_desc(struct gpio_chip *gc,
 		return ERR_PTR(ret);
 	}
 
+	gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_REQUESTED);
+
 	return desc;
 }
 EXPORT_SYMBOL_GPL(gpiochip_request_own_desc);

-- 
2.43.0


