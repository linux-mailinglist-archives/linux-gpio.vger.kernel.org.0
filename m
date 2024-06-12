Return-Path: <linux-gpio+bounces-7382-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EE0904C39
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2024 09:01:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A3C2BB23ECA
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2024 07:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B67B16C44E;
	Wed, 12 Jun 2024 07:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tRnbJ4w+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7E716C440
	for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2024 07:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718175642; cv=none; b=r/RjyJI4ZSkC4hC87Z0O865a5UAg1e7LUsP9LkOas5tGZoVMuzXeFyu0yskr8/bS7uETPYOMT9R9BjYwL0SJJr9AmEZik2KMCbA2Y4p1CSyMZb6VSdf4mcYtWHMfeXSaQXFJEIEVG+DaQrFldlzlAln6xiFlxK9z07IZrPozIUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718175642; c=relaxed/simple;
	bh=OscwHNEBraxjXT0TgXjSjjl1pljTEut6w8PorcGMCFM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=gh2w9cXzZWlGRTf/ofvpgxPcjFiRfH6K+wX66BLNi1seqtkm73IaPC20Vn699W3iOaGpqf+nOBCa5UinQfPj7joVzi/8/U3ae3HVvlOwab6vdyUnnkzxiR7w11QcjF9Hc4xk9ps482tihMz6WAwRgBsN1yDxv0hvX2Wh3W9aDKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tRnbJ4w+; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-62f4a731ad4so16658027b3.1
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2024 00:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718175640; x=1718780440; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I/wC/xKlaJhlLxFPJxNnjPTcgc2tAkZZ0x5vCfuNPTA=;
        b=tRnbJ4w+nIjDLfHo3fKvXKDSNDq+aAHqzDhsWDy9uIUPBr9L39b+ruyysh55tdvftF
         iYqN3OTQDSy0MxHAB//5W7QwSKzZ1NltyYYyZXQL26ZCMCb/b9TJ0C4oG63bxCeGw2XK
         kj3b6eySIedgWMu88aODpQQy4ioEr4cHrDL3neLRIEo7KgmdUDFL25NtPagGdmXlCdpC
         dU9S2wdqPXz8NZmxyjiXzHKxKPec5dj5tsaG1SmEEGjxFjivUp9KX/RRGmCHOO5376T7
         yp0xXRNwVrf64B4ugXVIHk0IFugxRmUhkkFtPhHI5itzRLBeMMN5cVUp3tr3VsQ3ZeBM
         yo8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718175640; x=1718780440;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I/wC/xKlaJhlLxFPJxNnjPTcgc2tAkZZ0x5vCfuNPTA=;
        b=klUhzaKUjpRPjP2MtGv1tJkb9MyeqbavTn9F2Dx/ebv966Duj4hNNdjfFG6oQUYL3n
         JuF1n2Jg8F/cAN3Y2u+1P6pysGgrTDwswOURB1njq2NEUIpYFtrg4PHtwimAhTGTvCji
         W8hkT8ObI+UrW61wzmmFVi/ScyN0Rmkc1FxT2xo2753OaHzAyfdLUHyHhWh64TyiLOLT
         8zTZ8cHq/4X6h5B2rOfZrhz0vK6iGKsZApmmpitWw9RaJqWZuU6ESxCIbjQ1nFzTREFQ
         AgeCBd6k+OzlYQQyqneXeqCksl5A+tSVQolCFVhirEgwuImDo8wgW7WTdOVuUg1IWXVz
         tczg==
X-Gm-Message-State: AOJu0Yzb3khGPRaEEM9Catf8CY1OEI59sQLMmdlBqYrUHAV8+X85hO2K
	jpw4j3dFduII0oGdfObFLMPzyGhRpFEDf1WfBissa2uSEYg6RdJivpsUOUjItELB2ZzeCdbtKKn
	aUcgLgwqmLQ==
X-Google-Smtp-Source: AGHT+IFjk2lid3CXTmQbLNeTOwbpoOYkNzVE+FBNDNetJc2GPftTJ4PBKr+lFhPrBSaKTJQmDF/MbWfJzFIDxQ==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:690c:60c1:b0:61a:d161:ff8a with SMTP
 id 00721157ae682-62fb95f886amr3164577b3.1.1718175640030; Wed, 12 Jun 2024
 00:00:40 -0700 (PDT)
Date: Wed, 12 Jun 2024 07:00:30 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
Message-ID: <20240612070031.1215558-1-joychakr@google.com>
Subject: [PATCH] misc: microchip: pci1xxxx: Fix return value of nvmem callbacks
From: Joy Chakraborty <joychakr@google.com>
To: "Vaibhaav Ram T . L" <vaibhaavram.tl@microchip.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>, 
	Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Joy Chakraborty <joychakr@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Read/write callbacks registered with nvmem core expect 0 to be returned
on success and a negative value to be returned on failure.

Currently pci1xxxx_otp_read()/pci1xxxx_otp_write() and
pci1xxxx_eeprom_read()/pci1xxxx_eeprom_write() return the number of
bytes read/written on success.
Fix to return 0 on success.

Fixes: 9ab5465349c0 ("misc: microchip: pci1xxxx: Add support to read and write into PCI1XXXX EEPROM via NVMEM sysfs")
Fixes: 0969001569e4 ("misc: microchip: pci1xxxx: Add support to read and write into PCI1XXXX OTP via NVMEM sysfs")
Cc: stable@vger.kernel.org
Signed-off-by: Joy Chakraborty <joychakr@google.com>
---
 drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
index 16695cb5e69c..7c3d8bedf90b 100644
--- a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
+++ b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
@@ -153,7 +153,6 @@ static int pci1xxxx_eeprom_read(void *priv_t, unsigned int off,
 
 		buf[byte] = readl(rb + MMAP_EEPROM_OFFSET(EEPROM_DATA_REG));
 	}
-	ret = byte;
 error:
 	release_sys_lock(priv);
 	return ret;
@@ -197,7 +196,6 @@ static int pci1xxxx_eeprom_write(void *priv_t, unsigned int off,
 			goto error;
 		}
 	}
-	ret = byte;
 error:
 	release_sys_lock(priv);
 	return ret;
@@ -258,7 +256,6 @@ static int pci1xxxx_otp_read(void *priv_t, unsigned int off,
 
 		buf[byte] = readl(rb + MMAP_OTP_OFFSET(OTP_RD_DATA_OFFSET));
 	}
-	ret = byte;
 error:
 	release_sys_lock(priv);
 	return ret;
@@ -315,7 +312,6 @@ static int pci1xxxx_otp_write(void *priv_t, unsigned int off,
 			goto error;
 		}
 	}
-	ret = byte;
 error:
 	release_sys_lock(priv);
 	return ret;
-- 
2.45.2.505.gda0bf45e8d-goog


