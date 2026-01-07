Return-Path: <linux-gpio+bounces-30205-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFACCFBCEC
	for <lists+linux-gpio@lfdr.de>; Wed, 07 Jan 2026 04:09:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3CE030843BB
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Jan 2026 03:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BA6B228CA9;
	Wed,  7 Jan 2026 03:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="AvtUVP/T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF432571B0
	for <linux-gpio@vger.kernel.org>; Wed,  7 Jan 2026 03:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767755270; cv=none; b=MXRPP46PfFmkquzLPYYi7QJiQRasZivUkI8lcUCDfTKxNzmnVxSdoDybMoeR1ZTzwD2rRobvUHoh3NHH/pkrPQTBw9ymlp9DTUKUZbIWNEAfikX9ESA7mNhtM2x6A5O/iR04SygmrDY+w3hd7a7A8uthk/jX4OdkrLdKVi5wZp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767755270; c=relaxed/simple;
	bh=pv9Ul14Hhl3C/6tp4wzR+hrKRSItog/0e3CBoNlER7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H6K4cmI9oYDEol6iJdh/IiDW6sKs4TRUHOKH1lYCBEKge1/8JESvqQtUUTQd+KH/0CYWdSNE0zEjs5LQIuLcLlLN13DwA2Zsxc+yLN8YQl/HWFUD4kJ9+zIZJr4PvEfGLzpyNC2e2mr+VmF3S+cOxNcHzj40zYnf+IvhM7/I3Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=AvtUVP/T; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a09757004cso17697685ad.3
        for <linux-gpio@vger.kernel.org>; Tue, 06 Jan 2026 19:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1767755268; x=1768360068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u8iCc64Rjmu7gwf6ybOiip/8D2NfZmfyUw4QOx0iSAQ=;
        b=AvtUVP/TmSpeeB7k0Dl4mX3dYLflcknmJSfNVHblYMTUZXfafaKmxWhLLKhzIQok7A
         +sh2o8qtYHRLEkBS5JET3IPxB4daTBnSHtBunUG49mGYhq+MPZSMTdfTybnJgW8RXs5S
         4clpv/YtBgojFa9RvBKaAHdbB7VDCPA2/5zqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767755268; x=1768360068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u8iCc64Rjmu7gwf6ybOiip/8D2NfZmfyUw4QOx0iSAQ=;
        b=sv17IidVVGt6PyaV3g3JsuKWdgDCO9X3Eqs45qrZ/B6E++ISQTEbcC1TLtAipxmqkA
         q8QN8OxQEkbwqwFdcqlLVURCSkzkjWWu40jGT2Is5bPRSPgJEhu5rjem+z//yMZuiDxJ
         ZQeIZKzNG9ymyW/Gx88ADiAkeKgr2PzDN4mFncctH4o7Ga7ZGpTS5O5/z3oWfhdeP0IT
         J8ivFzDS8t/+YK+fVvF0QmQ1rQZfbFYzREjT1RjGyLXqdejEkgg1n3jYhD9hsVEEotsL
         5JN4BtzelF/cPQMhxB2AfShOfxpZ8ZZBVpUdV//8kujDZROF+hgahZw1rvqF7ApbPVYv
         yVtA==
X-Forwarded-Encrypted: i=1; AJvYcCX8mAUotf8Y3oRjQNpM3AGdAx5HqBPYVj7dlfSa2lE1WO0282lj53zizTnCYKkAIutCP0KB0xAy9rUq@vger.kernel.org
X-Gm-Message-State: AOJu0YzmPzOOsEFtJVDrz1rglchjKt8z8lbJmpDoML72YryElbVVQuUd
	RySlmrTT6onog0WNqHiZZP7EsVcgSP3LKPK+0H5kKhoaFLc0tAzxm/6pTCUr+tspJQ0=
X-Gm-Gg: AY/fxX6hNi65YojQ5Y88i1hGBJt6IkDrJA8hGm1Ee/+IkFRyb+4t3W/pJ4Gto7kEIcF
	47YL1OrshOkYzMWVSKJ1gmidEni79qaJTc5Xmgsm8kKOtyr00mf3zrqoccewdE+rGkW1KDMQebW
	m4ZUNMP1rNJ47Ur41q/diu8jhGCNPYxPECiR6Vjkycro0m6Z+JuOYqSFnF89uPYhAtE+dWT4N6j
	dDsQvvxFjlyWeTtDJq96t3t6DKB+Bs6K125IsxcGZVCN4fvOmoVtGp8+eCDqnld7Na53XZ4a2fQ
	pYPmEU/+JKD7n7KLzFlyVPBU3A5cFY4G53+jynskqSzDhnMXYe9CzOGAcHCXh34+X7e6Y4X6Ft8
	xXUPklyhXUlVOrNUdZGVm/jkCjYzqJZKXwIiBnBcde5l/Z0HXS/UCEAmcVGw/EcpWVTJms0QVzO
	qRf6Nu5NQaFw6h5zPlcYs1cJ5MQKe7VfdM4x1j8RBoMQPIEAjKZpdbWKripkrdKEOaZUyLV95XA
	YM=
X-Google-Smtp-Source: AGHT+IGszkSXtL7GhVTTV5pPCscn1qVDfJim0T8bRvyNHJT7IeORevR9ZW/WKb1oqJD5skkQqiz3Ew==
X-Received: by 2002:a17:902:ce88:b0:298:6a79:397b with SMTP id d9443c01a7336-2a3ee4b8d62mr8864915ad.56.1767755267806;
        Tue, 06 Jan 2026 19:07:47 -0800 (PST)
Received: from kinako.work.home.arpa (p1536247-ipxg00c01sizuokaden.shizuoka.ocn.ne.jp. [122.26.212.247])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a3e3cd4bd8sm33694165ad.102.2026.01.06.19.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 19:07:47 -0800 (PST)
From: Daniel Palmer <daniel@thingy.jp>
To: linusw@kernel.org,
	brgl@kernel.org,
	robh@kernel.org,
	saravanak@kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@thingy.jp>
Subject: [RFC PATCH 1/2] of: Add a variant of of_device_is_compatible() that can be build time culled
Date: Wed,  7 Jan 2026 12:07:30 +0900
Message-ID: <20260107030731.1838823-2-daniel@thingy.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260107030731.1838823-1-daniel@thingy.jp>
References: <20260107030731.1838823-1-daniel@thingy.jp>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In a lot of places we are using of_device_is_compatible() to check for quirks
etc that are simply not possible on some targets, i.e. a piece of hardware
that needs special handling is only on one specific ARM machine and your
target isn't even ARM.

Add of_device_is_possible_and_compatible() that also takes a Kconfig
symbol and checks if that is enabled before calling of_device_is_compatible().

The Kconfig symbol is build time constant and the compiler should
remove the call to of_device_is_compatible() if it is unneeded and also
remove the data for the compatible string.

Another merit of this is that in places were we are checking for quirks
outside of drivers themselves, i.e. in the gpio and spi subsystems where
some legacy devicetree handling is being handled for specific devices
is in the core code, when the drivers that need the quirks are removed
their Kconfig symbol should also be removed and it'll be easier to spot
that the quirk handling can also go.

Signed-off-by: Daniel Palmer <daniel@thingy.jp>
---
 include/linux/of.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index 9bbdcf25a2b4..70be20b0be22 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -358,6 +358,8 @@ extern int of_property_read_string_helper(const struct device_node *np,
 					      const char **out_strs, size_t sz, int index);
 extern int of_device_is_compatible(const struct device_node *device,
 				   const char *);
+#define of_device_is_possible_and_compatible(symbol, device, string) \
+	(IS_ENABLED(symbol) && of_device_is_compatible(device, string))
 extern int of_device_compatible_match(const struct device_node *device,
 				      const char *const *compat);
 extern bool of_device_is_available(const struct device_node *device);
-- 
2.51.0


