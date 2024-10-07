Return-Path: <linux-gpio+bounces-10993-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D78A999375A
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 21:30:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B25228531A
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 19:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 795681DE2D6;
	Mon,  7 Oct 2024 19:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="esqatJWX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477261DDC11
	for <linux-gpio@vger.kernel.org>; Mon,  7 Oct 2024 19:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728329439; cv=none; b=VqXieNK1qp7CN7UhPXVm2E/LcN6GP/NEVMZ45Cull5Yvt9dBIrL0PYT2avxMXj8cTTpoHeseEWCX+rqgpj6RUxFJ369/T4xGHsmd9RkU3yFS/B1CbfIqG2DLPnLKGfZSB9FxOLLUgn6V/qqqXX/NtBHRWcagme3z8Lj/Ti1hPxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728329439; c=relaxed/simple;
	bh=4XdL2+WVJ9F//kzcstAYi8IQNZmf0EtVIusvdQHCU7E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oDYM0nF7jekFCDRJ3UoqkCcIOPgxO55669mfFXN5LmTMrlxcwGkrfE1qucmepMzXE/LnDrDbEKU6dlp6QsMi0SRdvthf52IJ/iHOr0ee6n2FU1sHiw9z+4dT6iTS45Ff6jEpum+wQMG3gOPxc62iGKy4Xwe4S8kJxhkOZutlv2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=esqatJWX; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42cafda818aso50006275e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 07 Oct 2024 12:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728329435; x=1728934235; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tmqgmJUlFcbESupMAYcxNlYTm/h2fMG4CUA0gL+IzfU=;
        b=esqatJWXpD69PSvgYpbqZo4NLPBQrLaQW5ta1rH5K6hOQjtpxlNVFsR2Y1zJpTMlFU
         yCwfEVk2EPBsohbs/n+e4wjkDKMC5FP7fhr1RvbGtg0ZIqSN193sKbSHO3HSsu0tw7Pc
         1kubv5xbsoDHnQWdDdWTYhb6YRH1bKRUudeCozbZ2Cap5QrACGzuqNOhMKaURmlSaUMO
         kt7Um7cHGwVXu365Ni6lhc+mwitFhsqrqR3Znn03LYS4AUNjH2t0P9xKAeG1KIlOuIE8
         qjiC3usZPWTGrkARI87tXyFVpJ+7ib+2OHQ3uLRai4iQ+brcED1LI2/upKkQkgybivPk
         YZvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728329435; x=1728934235;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tmqgmJUlFcbESupMAYcxNlYTm/h2fMG4CUA0gL+IzfU=;
        b=G9lFMYp4Yt1SdInDVF4Kc/sQuQCpaQtkJJxUKENmdXCEEa9Y58OUQrhab4BmuBJozr
         To1/BoDZ5uv4XEpFPjRrCu5AiVIGcYzz9UgpzobL6MXJAx5ALdyw7EbF8zBSxLyJkacT
         5JWSDwYkFUkIuif1zIn94VPPrrnlwCsbZY0lSvp70H8VIt6Tk0Ty5sexo4FUBypq9eQv
         Z9QwcIGRun3zwznfoQqSj9sE34L0Y7sZYDyfwQaiPuujvg/q5fKYvhRlpdhBZjiNin2U
         uogm8wlhFspfH1ihm5QAkd/HdAszggQGfCrjEIxRuMtl+x2cZLahq7J1kfXPh+FBPhtR
         U8Vg==
X-Forwarded-Encrypted: i=1; AJvYcCUugQszsNKUV6ACuYTu+5sGswsrgXeBFXHcmPDHNvWVfAuzW/lkhu+bkzk0w2LmMLfMZjMiFXm1KACC@vger.kernel.org
X-Gm-Message-State: AOJu0YyaiL3AyhQgmayQ7/50JlfqmHzruMLM0bstOAj4Ma3S4HiqYF35
	CbumyBuYSws9Sge4QB524Xgy5nSI7UBebUuqVRTy+Q6oMZXDku5pXx/J5n2qAHQ=
X-Google-Smtp-Source: AGHT+IEX2EteKkS75T9Hm1R/cpZx+g0dB2RyTr82qG/CxZM39DrMstdoVWNFJiT0iEReSnGJJjH7fw==
X-Received: by 2002:a05:600c:1ca4:b0:42c:b23f:7ba5 with SMTP id 5b1f17b1804b1-42f85aa92edmr104412365e9.10.1728329435576;
        Mon, 07 Oct 2024 12:30:35 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6100:637:cbe9:f3bc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f86a2052asm101321905e9.18.2024.10.07.12.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 12:30:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Oct 2024 21:30:24 +0200
Subject: [PATCH libgpiod 3/3] dbus: client: monitor: free the line list at
 exit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241007-dbus-memory-fixes-v1-3-0d56d1aa032d@linaro.org>
References: <20241007-dbus-memory-fixes-v1-0-0d56d1aa032d@linaro.org>
In-Reply-To: <20241007-dbus-memory-fixes-v1-0-0d56d1aa032d@linaro.org>
To: Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=770;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=3/+o3BcGcLYfNKNjs4DPFBqO2wzb8ih7h84HYaGdD+c=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnBDbYsfrFAGEG/fziQ9mECG0UeCcuJPZBg265u
 X8T1j9QTwCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZwQ22AAKCRARpy6gFHHX
 cle2EACChVTHn/ZPSGb59GFaIMMR8xHmBmc0nPV3k51m5RUw75VIYUAuRGttjdfmP2Creq18HLb
 H9d16jhE0DZgxVT34mldfSBbTbL1/+ZVsdJmW1vMh8LTOdP9aTqFc6NswuTKoCpMcMFX8twQPhS
 2jYgO8+4tRevrF92WQR/OpT0fLrFq1BVxHurwVJQIhgMBtZms1iLZ40VlbcHOsUf3MkSqGb0HR2
 Gh2YF+dhLuwANj3MvPp/Uiv+b+i7H8ppaY4Ff8JLmDyKQ0lKXMY3YIOXP3IDB66mB7f+HRXb63j
 Lwd8flIvkjxjGIDbuNaxXi/ZLr2pDGT3HAQTIrOApP3fTprC/Ww6X8AgHiHvQHEI7t0hOq5QDU9
 tpIzHqxphf1+ZZsTAKxPb8yMNUh8c/Pnws/EDlk/+IaYIxw4Rpo9D1HIzGX6YTDJEjOlNovda6o
 61fi1wmzIQK7C56e1cVtWndTNu6wtxwdI8JY6ciBVJRYUJAOwHoY0BjDuGehf0z79vwjeIquI40
 myKA4KbL8hoZvltaoYj9mAenft0wIz8Xu3HyJwUmVyplegwiLTZv+D35qrZYCIrYsKNcDkCDE4X
 JxWBUNkY44KiUDONUTW0pyAFLnQ+5sZY9TaWtKsbDit1ZJz4A/IDZ389AV0980xA91LSjf50kBL
 TmLnqbDAFNt43mA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Free the list of line proxies stored for the duration of the program at
exit to fix a memory leak.

Note: these objects need to be kept alive for D-Bus events to work.

Fixes: a5ab76da1e0a ("dbus: add the D-Bus daemon, command-line client and tests")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 dbus/client/monitor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/dbus/client/monitor.c b/dbus/client/monitor.c
index 3bd25b8..df7eb51 100644
--- a/dbus/client/monitor.c
+++ b/dbus/client/monitor.c
@@ -185,6 +185,7 @@ int gpiocli_monitor_main(int argc, char **argv)
 
 	g_main_loop_run(loop);
 
+	g_list_free_full(data.lines, g_object_unref);
 	g_bus_unwatch_name(watch_id);
 
 	return EXIT_SUCCESS;

-- 
2.43.0


