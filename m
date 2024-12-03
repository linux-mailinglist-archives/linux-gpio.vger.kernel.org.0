Return-Path: <linux-gpio+bounces-13455-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 966149E27FE
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2024 17:47:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8582B3B001
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2024 14:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 149D41F4285;
	Tue,  3 Dec 2024 14:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eV8dbB0y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652B91F470C;
	Tue,  3 Dec 2024 14:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733235307; cv=none; b=asTpiVGA9eLniWNTdhfQA1KKHYycInzO6ugwPJwWHKnCKg2NHzPOQRMVfQCkMh0j8JBQtIKJp0kPRqWaiE/tXzqVmD+Z7gY0oihlpn3u+LxDpDIQe9Gsq0eAAp4dKfxz5i86a3sUGYFf1e6PaZEVljpNwDq4FWCldXylzUAlmoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733235307; c=relaxed/simple;
	bh=otjp6fYdcQzk+5AvgniGQevgVU4Q/zRyHp+OMqcrZCw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HYaDxpRPChn8Uyjf/bQiJ9juK9RYfC9uUPWIfAWUGDsCd8TdRMte6lZI9adO30MtC2DoSrnBkQky8FMaZ+p2RIJLctrDLpce92vGEwqFH5ksf8RMqUtgDbPtFcmxK3YSv6CH9JiCG6tw8FKjyKeH8R2rfZ3uvgTj1f5bzS9I2dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eV8dbB0y; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7fc99fc2b16so3250635a12.3;
        Tue, 03 Dec 2024 06:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733235305; x=1733840105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dnnlg27hHT84ddacWLdvIxoxbg96vC/0KvkjROoZZL8=;
        b=eV8dbB0y1bzCbrXUoYprAhUDE9RUYyYe2p4MJOvDcDQwwxElqT3HstuzEZQh/bqKfW
         DUHrOd9o80Las/8OPBidV37o/d7xtePx0MsjB52E8wu3um7I5kY2UDIAm8LbvIqRbK1u
         gr09YJegMUuMJ2E+RND77FegRQBjehxouoo1sdnAkNDwho47J9blaaY6oCF7oFMngBT4
         pB2L+ODqimTb+r3ftVm+v+BRfkXX+PSOb8/7r+zgm6C+QqD1LzTWGl5pGqd9iAKoKyIM
         u/x9y1PLPi/NORYGxHcLPnhoLsuscvzTq+1SWDrC/uw0ZM+sj0eJRbBza99qC+LIgaPy
         nmLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733235305; x=1733840105;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dnnlg27hHT84ddacWLdvIxoxbg96vC/0KvkjROoZZL8=;
        b=MGkXgx/NjHFrUGu3V2P06G1CKfx5Ax+R6mFYndu8dEczCuyGdX7UPCDV3zK6o0JE/a
         8cbmGsw4AWBrluzEBHcTmcOlRQ34eRh9cZvH7YVXvxegkf3fBAMG2JDE/HOzNFzHDVp0
         piM0gxHbx8+Fsc/0x8oly+eKRirTlKeNRG0mSwpoabXEkTaWmCx/gEaQ4y3rvnQJprQH
         PPm7vuvxXehysZXIVlQZfujKVai/jSMLv+obzsR8BOxhGrcF89GWORTrcp55iDRK3qZB
         IlsqcmRPNd6ImK/cndmPybE90y9rl/HX0ijYMz6DQPLRK9WppQThE+F07pWK9s+XQjzq
         aMEg==
X-Forwarded-Encrypted: i=1; AJvYcCV1qk4UYm5BUcxQAc1p3I7OaBU0rZEMsMMasCD1dMn0IVKu0S/s3YWzP2zUNJMV9x+HJBG1Vi8oWxJNuJDL@vger.kernel.org, AJvYcCWiWavQQ+tCQZlk1nGpkKoj1IeZHmsuYquViJnvVrQia3H9v6dNLnEG7zP6eXZBVJnntP0n22/+L6bIX54YAKge@vger.kernel.org, AJvYcCXgWgF0IfW8ZD+Ed9SlItHI/cJzw89CYhVbGIUjF2NliB2mUZk/EyHGkpdT6U1KEHiUwtq6igFVYSq6@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2tVsKTQkjHLJT7jlFswRq6WrvWuT5hOy+v/RLDi5HlK8oq6dV
	CDmMdnpDn2YnefxbiBywvv0U/emq2dqxbHyfsX3tdO8Q4ylmUfJK
X-Gm-Gg: ASbGncvxMm0dU8dG4YcZ//ZJUEvka3yd/0x5Ho9xmw1LIhcVB0KL6uRlBA5TdWyUebE
	iCBWdjFrfamSHbcj+xmymYWMvRgjASZHLaj8aqGESjFSD34ZH5IvoA2tmQciQ/lrT4RPMKpaPbX
	zxFJTMWJgS2/dQUKn+zh6XDHZzUmP7snWgE1wETbvFNownmOMx6IMuS/om879hFuTmGaswLp8Pt
	GUK5QZ1GNAEZxeH8SsmjfFmXWewpzgtsxhRN47gX3q5etcCS4dkiQ==
X-Google-Smtp-Source: AGHT+IGpfGDLH2w610CQpBh8JS3ZVLxqkebA3sOq33OOaOXgapbnBj8OqD4JhwtGZRXqXu0UffIboA==
X-Received: by 2002:a05:6a20:3948:b0:1d8:a9c0:8853 with SMTP id adf61e73a8af0-1e1653c5066mr4269737637.23.1733235304954;
        Tue, 03 Dec 2024 06:15:04 -0800 (PST)
Received: from ubuntuxuelab.. ([58.246.183.50])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d3e28sm9798996a12.17.2024.12.03.06.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 06:15:04 -0800 (PST)
From: Haoyu Li <lihaoyu499@gmail.com>
To: Wentong Wu <wentong.wu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: stable@vger.kernel.org,
	Haoyu Li <lihaoyu499@gmail.com>
Subject: [PATCH] drivers: gpio: gpio-ljca: Initialize num before accessing item in ljca_gpio_config
Date: Tue,  3 Dec 2024 22:14:51 +0800
Message-Id: <20241203141451.342316-1-lihaoyu499@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the new __counted_by annocation in ljca_gpio_packet, the "num"
struct member must be set before accessing the "item" array. Failing to
do so will trigger a runtime warning when enabling CONFIG_UBSAN_BOUNDS
and CONFIG_FORTIFY_SOURCE.

Fixes: 1034cc423f1b ("gpio: update Intel LJCA USB GPIO driver")

Signed-off-by: Haoyu Li <lihaoyu499@gmail.com>
---
 drivers/gpio/gpio-ljca.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/gpio-ljca.c
index 503d2441c58f..817ecb12d550 100644
--- a/drivers/gpio/gpio-ljca.c
+++ b/drivers/gpio/gpio-ljca.c
@@ -82,9 +82,9 @@ static int ljca_gpio_config(struct ljca_gpio_dev *ljca_gpio, u8 gpio_id,
 	int ret;
 
 	mutex_lock(&ljca_gpio->trans_lock);
+	packet->num = 1;
 	packet->item[0].index = gpio_id;
 	packet->item[0].value = config | ljca_gpio->connect_mode[gpio_id];
-	packet->num = 1;
 
 	ret = ljca_transfer(ljca_gpio->ljca, LJCA_GPIO_CONFIG, (u8 *)packet,
 			    struct_size(packet, item, packet->num), NULL, 0);
-- 
2.34.1


