Return-Path: <linux-gpio+bounces-6304-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6592D8C28B8
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 18:26:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 025A5B20CE6
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 16:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4EA6175573;
	Fri, 10 May 2024 16:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="bT+yulIP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A32174EF3
	for <linux-gpio@vger.kernel.org>; Fri, 10 May 2024 16:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715358373; cv=none; b=TDG3gC/KDtPztEEnwrD13PUGJWFDlqqtXV30nWRWGWmHIGUHKyTcRMCJK9bwVJjFf28hxiFQvRx+37JrtfdxhHNg/Tf02wu1jmMRnCQh3i4aLuxvHcTgHV5514kqD4SCBZo3oi2aPqWFRezc+1VLNuHLFPl6lCaEsDkoNVyB8Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715358373; c=relaxed/simple;
	bh=bxaYAw3KFAukICHyA8ZADUCzO0ruG6dtxRHo2LheGEA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=A3UaDABBNUlsTbbFkqDPBYBIc06nzvSo4gz1ZIDGXnifbFIUCvcx9VGEmk7KPSLcY8KLMwQNDZcO3yKA/jBCS4FQ91zGm2g24VSnY9LmcMvs1RPXlhbX83CSTRz1VYQEi7S5SYjUietDeBSLiHgloYxps6G9bDV2KWUxAwkmwaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=bT+yulIP; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-34da84cb755so1648883f8f.2
        for <linux-gpio@vger.kernel.org>; Fri, 10 May 2024 09:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1715358368; x=1715963168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c/c8R+r2wKwqushYa97j544g6TTlix/kEzEOUalKigY=;
        b=bT+yulIPfBuCmhrwbOs9fec9hlm51bL2/87avoYVDjJOFGhlruSrobDTYJ2IA0a9XZ
         NDANS6WRU/yKQgWscuS8XwvLoWO+FPJ/m9MBqwiftXU69J4myWYoQoxi5llxBMQDs4gT
         tT6SVkGVZhEkmZQ7RbxneYW4pVFeVU4FirAxWSjmqWdnBsmXR4tkUWBgXCJTRZuUHx5q
         xK3sEB7iKV93AAuJtbkNS6HnLmya24Bs3S7hPP0XGU5Ins+Ol7gvBbkY//sNih+kJUTL
         ytRjLAJKVXiDAibG3t4Z6rPLfWUN0igihHI/09iwt5QU6mNp0iBxeMuc0lovMIWIdXu1
         DWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715358368; x=1715963168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c/c8R+r2wKwqushYa97j544g6TTlix/kEzEOUalKigY=;
        b=LjjXoN72jyK4kJzmP8/GaJVfnxwElleyQhBqToHKrcfbXZKnAy1ucdnsQT2VYYzAPG
         2ogpcVmLGywNnUVU26i41EjSW+kBCYVTGLpiQYvrNm4xma8wpiXUklL5MuPitvp4LVZC
         IEGGXkCP119tCK87Rnk1VUTemTIic2cEGM3WGnYduIZbB35fmh48nBkFzsW1pQ3t8Vkf
         fBwg5z4dW+2Kd3bDlk31IyrKNL8hYnciIiQs9b1CIqgaz+UYtXlwYNW2Io9/sdIXmgJH
         eIjId4vgCktwQoYT/zf39mFxocX/E1z7edAMCKRyEa/09kfEwqLtXyPem6CthNdRF+Fh
         xPFA==
X-Gm-Message-State: AOJu0Yww6bm5k0Xf65h50VUZV003O6RVtXEHpgBLvrXJTmEJj6F5b65C
	SjhdJS8IO78SmN6mzD0Kkom8LYGFCQuJcnkstNxuih44+7NNq0V7qk2lwOJX5MFriYvXUXfn7Dd
	2j6U=
X-Google-Smtp-Source: AGHT+IFqMc0sFti2/1u4QVjRR44zxDuQymS4K5HaIca7tQzr22CmfzsY/kBGySUABOBPgaGAYLB/TQ==
X-Received: by 2002:a5d:4483:0:b0:34d:7d03:45fe with SMTP id ffacd0b85a97d-3504a632fd3mr2132265f8f.23.1715358368252;
        Fri, 10 May 2024 09:26:08 -0700 (PDT)
Received: from fbxleo.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b896aa5sm4952206f8f.34.2024.05.10.09.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 09:26:08 -0700 (PDT)
From: =?UTF-8?q?L=C3=A9o=20DUBOIN?= <lduboin@freebox.fr>
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?L=C3=A9o=20DUBOIN?= <lduboin@freebox.fr>
Subject: [PATCH RESEND 0/2] pinctrl: core: fix untreated named gpio ranges in pinctrl_pins_show()
Date: Fri, 10 May 2024 18:25:37 +0200
Message-ID: <cover.1714049455.git.lduboin@freebox.fr>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series covers errors I encountered with the pinctrl_pins_show()
function when dealing with named gpio ranges generated through the
device tree using 'gpio-ranges-group-names'.

These errors were introduced with the original implementation in 
f1b206cf7c57561ea156798f323b0541a783bd2f.

Léo DUBOIN (2):
  pinctrl: core: take into account the pins array in pinctrl_pins_show()
  pinctrl: core: reset gpio_device in loop in pinctrl_pins_show()

 drivers/pinctrl/core.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

-- 
2.42.0


