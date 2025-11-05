Return-Path: <linux-gpio+bounces-28077-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C62DC348DD
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 09:49:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBE8418C62F7
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 08:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E407A2DC786;
	Wed,  5 Nov 2025 08:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mgyiBinW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FC12DAFD6
	for <linux-gpio@vger.kernel.org>; Wed,  5 Nov 2025 08:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762332476; cv=none; b=nLh5oVx5DNB4bVSPPyQFcEBfcXegNW74Jkml7FYEnkL9oMBNbH5+pQtME8Vdw0OAtPB+OdtpIVWRQO1ccAOKYSvFWzneC+6asjqay3Zt+Q3+ZQrcxc31lq1T473hlgnm9t9rzXju2Eeq3DhjZOXJ3bMBuh0u6Z6FeRh3FUzkh0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762332476; c=relaxed/simple;
	bh=r9cDw/aJYsPjA+g3Iqusl0ZJO5kkF5Y1AkYeG2Ln6YI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NGfX9OaHkr3uWA3OnnbK7ueUY84HeH21HyOwoyJKbWJQGi2Ysu0yf7lD/+7KMPFuUCHHJkeR6HqGr2umySqompRKMwQhQtWcIjb3JoWur0ErrbVGJ2OrVdH4WeQMT83qnxkpaAUhz5hD3B0FWikqh/orROsV6p1x15UgrfXtfzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mgyiBinW; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-426fc536b5dso4024193f8f.3
        for <linux-gpio@vger.kernel.org>; Wed, 05 Nov 2025 00:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762332473; x=1762937273; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fTmt0EBBpoH00wEC41/FLfqCbZ/Fh2wyVTiBtA0d/dY=;
        b=mgyiBinWBB0fSgC+g88kkirgvo+BWvUhFAsealfBiCIW/m5cpu2dcXcf3Dtql20nMi
         C+7NKsZsMnOFEazCy1qkw6zLpWITchj7yYMudq7imSMsuc2gJKYXCLm0bYpaijJIHHUu
         lEPQujvCwK57wbXu86MZT8tLN1tUIRwI/Of25R/GNBeUIrGN0oC0W/33fVyuTLiov/Lz
         4fa14DtzFrKy5Ha2CGW66nuays+qsU+RNgJwxWIpmexUAZMsPEVPKRiTOEnD+xVIWLcr
         PSWtYsfnKJNxdozKJzBxf/jZR+6ZnYTPLVTPJvNC/h1XQcwHMjRjLDt0rbuZpbfLD7iK
         xJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762332473; x=1762937273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fTmt0EBBpoH00wEC41/FLfqCbZ/Fh2wyVTiBtA0d/dY=;
        b=thHkoVfUhuMVgJu0NDedpLBlmK0fYbjXxONCCybRnTlEll7PjcKGjqsU1wBgoxrSZO
         323ma16pYRWDaSV5l/NQR9sZf0gfHChCfThmZfOJ8afyFFdYG1tqvjeF5tD2duqSWb3D
         SyNyi8IfA54P/X2c0Ry0IXspAErurq2Fr9DhDKVw9f4e9WkDCXKOZhMvP0dYZbMlbjF+
         HGfizyr7CSOHPvVOljqzlftTZn/sdLcmjAn6eL2OVZuPxbY5aDnFCacp44fX/ESEQtW3
         zWdH3xVcfeAqTDJjYwe7EoLzEjJ/630O5k36XEgTcjXkiNYeDkG33kXjYHpqNvKbBnxi
         2BIQ==
X-Gm-Message-State: AOJu0Yym8lQVa6ROmcftEtKsxFab6EBPekIu67BBYapEYAm8gcyaQvM0
	In+gmPAz+9yZileglABIsvJq0YrRKZI3sxlR0NPVOWupYc0D4QKAILkE0zx137lgDCE=
X-Gm-Gg: ASbGncupYuBPt0X1A55HdXtMKm0BAepwU2QUS1E2sL/9trbuFYMhNaoEqlz/skYtccd
	8wpjO0HQmWvjvDQgoozzlUexr+5kzqUyQKc6vLRsYXMiGSXGRT3m1p+GTeEdxYxgSywnolYmPbQ
	u1rVakYlvWKz2Uy+82C0GRIEj2mmf7fDQIgwQh5Qtlg6b0W8ZFVk59oWpnuL2W0r2r9IzGQJdw6
	QdXNZ1Lb9oso/ZPFxGTvReOylnVJXSvVzM2xshIBOxgZBA1tpw2gXWvrhbSjdWeTz5AicjTWgZS
	3+XIRMrQgHFiDSFVIpZy6nfwOruzkC8xi1L5EAKC2GjOelUOhobx1H0hhtzufVIJgXTE3KyrMTh
	KOY3Ej4ENdP6rYxDbN3bYU67VQszj86Zw2ixTouroGfDxzQPhh3uYpdSycc6eG8CFD1yqwQ==
X-Google-Smtp-Source: AGHT+IH+m6E6WVdfcS6ls7YmNBuKBG9FV5JAluo3xUcZkxIadhZrNqI56KfB5EmPbH1Np5HIAcrzDQ==
X-Received: by 2002:a05:6000:4102:b0:429:ce81:fe0d with SMTP id ffacd0b85a97d-429e3311c7fmr1609181f8f.60.1762332473294;
        Wed, 05 Nov 2025 00:47:53 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4e71:8371:5a52:77e4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc1f9cdbsm9315936f8f.34.2025.11.05.00.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 00:47:50 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 05 Nov 2025 09:47:32 +0100
Subject: [PATCH v5 1/8] software node: read the reference args via the
 fwnode API
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-reset-gpios-swnodes-v5-1-1f67499a8287@linaro.org>
References: <20251105-reset-gpios-swnodes-v5-0-1f67499a8287@linaro.org>
In-Reply-To: <20251105-reset-gpios-swnodes-v5-0-1f67499a8287@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-acpi@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1086;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=URxmTnl0JV1lV+vabMO/0fnz/R+E+W6aKsco0eYVKD8=;
 b=kA0DAAoBEacuoBRx13IByyZiAGkLDzGgxErq3XTBSHBKX2hVQ1nWMaGMH0fqS57EsLUZNHmkt
 YkCMwQAAQoAHRYhBBad62wLw8RgE9LHnxGnLqAUcddyBQJpCw8xAAoJEBGnLqAUcddy+YUP/1d+
 hunHrEvjaYOZrXyexTBe7vgqA+mNYDsISiJVcApUeHI4DbwZeiLr9DgM4scHLYocuSzI9BWnRxh
 a0Ru5i/JYr2W3v7z+i3z2tW5LV+JWlfv7cGAkDtw24lEKkuMuFZDRScKCVGR3Kgis1idsA0lXbk
 JWbs0m1O0EliG4r9fVE2Qf4rJ17aHMFFcdoYq7uLSJZOb3IKxqrWR1uaBNlJhxvo+TnjdscfYOw
 UW58nqyFNRQPxDM12X4uQVPv3DeT0svG6O1beQQLrYwG2spn3H1UBR6cY5sAPE7bxlcMubm3Q0o
 JAEWAPv3gDJK+qim+4pJhMeEXK3nzmt05NlFbqvGlJl7ff+Uo75YS0MlXm+m50huCg4PYJGCktb
 xGIbhRvqM/6MNANPotyPiL2ja82vJABG2Xv7wLhWhwngmOM903iFIxqstayxkeAdolJlE4ajP+e
 rgf0qohN58Y/cDE3A0MqrW77T0Qw23CvILOBirYeZ1bivxMNdESj4DeRTwsjz7lmlcMuDMNN2R8
 CH5jnWWwgJuS+TxHqeYpbnioLZ2fj6WMMj1urlUKWsJdcZtL8GknzpT2fkG+NjY4w+fb7koWLsj
 gDptVl6Fy0QrqC/rWURCsThoXMwagjm2/ZOLETpo6kKPF4jiACGjp4YzsAarb6sGdN+iK5lbYm9
 UotW8
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Once we allow software nodes to reference all kinds of firmware nodes,
the refnode here will no longer necessarily be a software node so read
its proprties going through its fwnode implementation.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/base/swnode.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index be1e9e61a7bf4d1301a3e109628517cfd9214704..016a6fd12864f2c81d4dfb021957f0c4efce4011 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -540,9 +540,7 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
 		return -ENOENT;
 
 	if (nargs_prop) {
-		error = property_entry_read_int_array(ref->node->properties,
-						      nargs_prop, sizeof(u32),
-						      &nargs_prop_val, 1);
+		error = fwnode_property_read_u32(refnode, nargs_prop, &nargs_prop_val);
 		if (error)
 			return error;
 

-- 
2.51.0


