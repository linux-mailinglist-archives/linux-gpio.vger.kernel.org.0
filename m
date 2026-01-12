Return-Path: <linux-gpio+bounces-30464-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF90AD15A67
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 23:51:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60A5A30B2C18
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 22:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BA44296BB7;
	Mon, 12 Jan 2026 22:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VT3umymK";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SpyAJq8L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535672BD587
	for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 22:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768258148; cv=none; b=HJyBY/1OW0cBiKImDjc8u9FB/9yL7KESYmJDJ3jm0LtIg+0XVxyfS6e+D+0Hx1C+vIpA9QYkHGxBmh+7D5o21vJVldLi/g31vWoE2s52o3LP/BxxL3GQJJwIMFEFEA9Exf2+Dr+UhiLoyHFN2ALpaADufwfWJNbSYYbFczHIKt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768258148; c=relaxed/simple;
	bh=mbJVZxZKVBmjDnZTaCwa/PwjxMQDsuqJGVoOq4paXbQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=REuPPfhyxxPnMce4hS8XqzXVgkbAWBKxZWBaL9xCxifRikbwB1Nsrlfyknby+J05mHI5L8qjJtWPDfi4W4kSu4iPoEsCheXtj/Ul0wd5fUvM1tQwEQemkVbDY61m1qcZzpqZC8YLp9WCby1t8OkTHhmSesrLN1JewVfGs1Ft0xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VT3umymK; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SpyAJq8L; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768258143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PN5GmDLXcSG6MviXs9j1fDYcLJyVYu1IRtnI338h+pM=;
	b=VT3umymK1pbTic9y4Hi2kcDdFbzRKGpt3wk/wXNtSa4Ykpj/Wylcv4zJMRQid5VCdiJV8X
	9alVgAtSKvI6AApBQwL7HCoV5pCWvzRFFqye49rxl5k1a1se7RgTmDocECmEhv/b+ojR0m
	SEeJ1Rlmkdeu+R2FX1f2w8wKd63Iojw=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-cbiNPUb6OBSi1mcQwWAQHw-1; Mon, 12 Jan 2026 17:49:02 -0500
X-MC-Unique: cbiNPUb6OBSi1mcQwWAQHw-1
X-Mimecast-MFC-AGG-ID: cbiNPUb6OBSi1mcQwWAQHw_1768258141
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a2cff375bso178405526d6.1
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 14:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768258141; x=1768862941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PN5GmDLXcSG6MviXs9j1fDYcLJyVYu1IRtnI338h+pM=;
        b=SpyAJq8L61xaBVpk5O30y7I2XVA9Kjx3kPPeo3fUiTqsx1bVcXzhmj2hRNmSMsr5Nj
         wK2p2HlRwEwUEJs/Q3RPdsd64pTkcOXdAl8Z62rUr2TdSaHW3obONtfG6zixIXcGlQX5
         1ungoYHjfEfy0KQhGSJMkaFOB+pGrbmuhjtgwx0HbdDoW7tfUjzqqP/iEfolbk8Rjfdm
         rTKldmgQIwyN72NPsLgRh6mrqaaEh8Oa/E3rKwhTpD54jH0QPWGcqHIz6EqTcm+8sXtn
         Le10qL+OqAoaVAiWY4TgL9lcbOA4z0u/6PSLZr97UoBmvDMLp66eV5NGbs84AMAwWZEX
         9ThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768258141; x=1768862941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PN5GmDLXcSG6MviXs9j1fDYcLJyVYu1IRtnI338h+pM=;
        b=p1mm7USWSnwkeUNaKg/GDaVdGTUOBqkKCo0wk4HX1F9/vqPjFH6rHEPc9JemLiY1gI
         /zCMVYe28MifhNcjANh/uAM0dZq11IFnm59YFjUXtU3Hew7Y+siKNIh1neUW6VGzzjZ8
         qUJvzlenMEAk+Fs1/eAaG9kAr/UZp14GUBhpLss4y0XuEFpA5PaxkbqthI4uvj9FEx6s
         eNrCcS5HlmSUufFKhyRkQ78hQa4+avz8x/BHzgngsSk1mOsdym7AorspwF4AYQqcMptp
         oNEZ81MAwSK5CXoJMVF69UPaMeyJL28uC1P2NYcejRXowC8M0TCLNvFrIWlHLcmcmCC/
         9E1g==
X-Forwarded-Encrypted: i=1; AJvYcCVuJu8w5qO7ZHCPKz9M4aYswNpcU4zsD07bHvNP18AwXSfk0j7VNlrU37hZd6Y2O/kK/Zd7CugvQOCO@vger.kernel.org
X-Gm-Message-State: AOJu0YwdI8mVdDwyMDgSsqSemL6J4XtEobMYKbsX/n8B6Syj6/LX9s/k
	kg8MtPlu0dyEEAUwLlJOcGdRHyGlDMou/i6RVvDh0P+fVM0CgmxbRGjz2cGuJgHwfnEn7ygJiP1
	PXqe+UfXYGuN2G2WTrC/bws+ZpyNsZpHDPPd7lmUNYEvdKW8QbpmwqNzCT37H5tc=
X-Gm-Gg: AY/fxX6ZX4SsCRdSFEoXP4GiSYlMWZKDp62UiKhkOvR4WnKU5dXhAVzLJtaueV+DFIc
	GqkpYrpa3awCs/W9a2DZtg6atDiiSxThIsTPwNGkKOSWA2eNSTBcai2xeuevBMw04pZRUdz534T
	+goKIA2/zthhh+ZMUbmiKTNf3ebBdSy50S99PC9ziCIXtzdWcNfIBHdRiwqM+IWCCaN8tZx8N1q
	S4cwMyM0TeY3xZheF5tew9ta4ioVu/BIY+MfHZJYExKdlyJBER2AA/lRtHUqQHniqOa4zNYAAG+
	CZ/DQL9x93cDV8VSuDo0PuRmHVMyF/nEJNxQmS3d67M3MchnoHyXr7ZSKDjhXf6upHUgRMwVfK8
	fR1ur1WfdDpEfhfyjnNfBZn8uhwMThYIi6Rwjg5HGpmE3p1RG6w==
X-Received: by 2002:a05:6214:4286:b0:88a:22fb:38f5 with SMTP id 6a1803df08f44-890841e3eadmr316772766d6.13.1768258141586;
        Mon, 12 Jan 2026 14:49:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDNHLeM7CJCyKDHhlsKT0hefto+HmPl2QKwgH62DvR/9bvznHo5QEQ2CBu8Y5MB0btSe9Bbw==
X-Received: by 2002:a05:6214:4286:b0:88a:22fb:38f5 with SMTP id 6a1803df08f44-890841e3eadmr316772596d6.13.1768258141180;
        Mon, 12 Jan 2026 14:49:01 -0800 (PST)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a6145sm1580930385a.5.2026.01.12.14.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 14:49:00 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 12 Jan 2026 17:48:04 -0500
Subject: [PATCH v2 10/16] pinctrl: pic32: update include to use pic32.h
 from platform_data
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-mips-pic32-header-move-v2-10-927d516b1ff9@redhat.com>
References: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
In-Reply-To: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Linus Walleij <linusw@kernel.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1219; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=mbJVZxZKVBmjDnZTaCwa/PwjxMQDsuqJGVoOq4paXbQ=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJTq7yXcrXJmDkmKZ/5p/YkQI7jVOAtgc4jrzyb9UV8H
 FRvxV3qKGVhEONikBVTZFmSa1QQkbrK9t4dTRaYOaxMIEMYuDgFYCJ9HowMm40yb8QeeKDOkimQ
 yhn4JPj85/8M4aImXvet7nSJJWqzMvzh6a/5kSacWTl57fbFccVRz9ytDh8SS+0Wd7tRtPKG5gI
 WAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Use the linux/platform_data/pic32.h include instead of
asm/mach-pic32/pic32.h so that the asm variant can be dropped. This
is in preparation for allowing some drivers to be compiled on other
architectures with COMPILE_TEST enabled.

Acked-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/pinctrl/pinctrl-pic32.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-pic32.c b/drivers/pinctrl/pinctrl-pic32.c
index e8b481e87c779291a69490de1892fbb7ec9c45f1..16bbbcf7206288df5f91870e6233970582f7ef80 100644
--- a/drivers/pinctrl/pinctrl-pic32.c
+++ b/drivers/pinctrl/pinctrl-pic32.c
@@ -15,13 +15,12 @@
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
+#include <linux/platform_data/pic32.h>
 #include <linux/platform_device.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 
-#include <asm/mach-pic32/pic32.h>
-
 #include "pinctrl-utils.h"
 #include "pinctrl-pic32.h"
 

-- 
2.52.0


