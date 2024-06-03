Return-Path: <linux-gpio+bounces-7069-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0390B8D81C1
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 13:57:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 351901C21CC5
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 11:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44D8E126F1A;
	Mon,  3 Jun 2024 11:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C8GZ/S6E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C037C86ADC
	for <linux-gpio@vger.kernel.org>; Mon,  3 Jun 2024 11:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717415871; cv=none; b=VWTu3tWDGncFuwIUnoqkirVeK5cLdy6HlIZGib6DHywcpMi42s8mM9doRGUfheQOdlXyCO6LUBTJnD4vd7Lw6Lo8dN0q2/5IjPU5D9EvJ+P69twkr4TcIDhsyXsG1k3vssV9uOclN8OYgUeKc/cMHsTTTDwBCXKX4Y2OePG2izA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717415871; c=relaxed/simple;
	bh=By0sskLtsJR2SmPLvqK3yAISa8I2U28qqOzJtRbUzjs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IRFwmwdkmwemE5kSAnhDn3f0AAK8dBrcX/KaZHS6Q70SB+QNFCf0+SGhpgUGblSf2hqJwBOT+DcN09n1c6KlborrEuFHglX8vZtw2EIVpZ+g336ZFl7D5T9jIsirWp5qPx5dKQ/XsURmo6fnyFpC3Tc3tovve163GXWW9nvfusA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C8GZ/S6E; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-250928a8580so1313051fac.3
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jun 2024 04:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717415869; x=1718020669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kTxn6+22qsqvdTNGin/rCQxGWMo5hWHfE9VLPjXTvE4=;
        b=C8GZ/S6Eh/cidwwVtnJd97j+blxEL8/0zKLZc+8Jwi97tGoeLXybouM+kihsGDyObw
         tS6oK8MTE6pv7kJ/VkxudcUSEvvMLCkK5fvSyNwRrcceS/UaW/JALmXn7NaoqP8qcsYm
         v+2RTdS6rTa/55u54DxBZYnziOh3910aQulz1w28s1GZtTqKtkYiNeDLwsFR32W61H1G
         I9wR7bHxmEMSfDuSfd00Rf+tSCIIhv3zIlR1/8TyAATvjxESDPeyegZBHh6YcqDerrXf
         ymgc2vP5lYtQ58ZRtH0lxLfePdtnLqq8bZ+vuhf+bX65V6Wxt4gV1fVM9YZZzL2ZstGj
         l8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717415869; x=1718020669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kTxn6+22qsqvdTNGin/rCQxGWMo5hWHfE9VLPjXTvE4=;
        b=Q1qIMDDtF0MAmJusnAyTnR/dV/eDR3x3YdJWa0oH5U1X/GNlc63Gw7wOR/2GpN11hs
         9vxTPZfai45P8C5YOKCS+l7dlfmWDxWrfkZQzpnE5hCS0Uq1CBAHv/74DgsPKPTre4F8
         uCfl1QscDJ5t568e+xBwo9h2cim9LntREGlll+PrxF1YCKcdKWDU+i8m9n9N2PoYaZSo
         trA2juOsd6vFKczzdMrih4I807wfHA1mPcdn76uYyE7uoOGwLH3yRybaTu+K6Ho4xLvk
         pNqZrujfhcH6G7XWNHf+ByEUsxGnuGaQOSEEvbDxAHIFjzDii1jQv3ceG80Dsa+6ZWCt
         LtpA==
X-Gm-Message-State: AOJu0Yz0gqjbnnh9LiKb8TNsds8bvlJXBWhMEIGz3S+Xfrz25LrmQeZZ
	RB8iXv33GYXQNvKGMifhHtDzRTz1ECOWsFGyXS/RDanbPk9whtWapjL4CA==
X-Google-Smtp-Source: AGHT+IE880TReRtYKhQzY6eDBEN4vzPrrirVnr3PlgLN9tsRmeATkN8NogoNfQ2mwNpCBeR580XWlg==
X-Received: by 2002:a05:6870:5388:b0:250:7601:fea6 with SMTP id 586e51a60fabf-2508bc195a0mr9804098fac.42.1717415868757;
        Mon, 03 Jun 2024 04:57:48 -0700 (PDT)
Received: from rigel.home.arpa (14-203-42-154.tpgi.com.au. [14.203.42.154])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702425e1a71sm5328492b3a.88.2024.06.03.04.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 04:57:48 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v2 7/8] tools: tests: shellcheck don't follow sourced file
Date: Mon,  3 Jun 2024 19:56:27 +0800
Message-Id: <20240603115628.102616-8-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240603115628.102616-1-warthog618@gmail.com>
References: <20240603115628.102616-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix shellcheck SC1091 - not following.

Use a directive to prevent shellcheck complaining about sourcing
shunit2, which we don't care to check.

[1] https://www.shellcheck.net/wiki/SC1091

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpio-tools-test.bash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/gpio-tools-test.bash b/tools/gpio-tools-test.bash
index 83b05ec..4551dc2 100755
--- a/tools/gpio-tools-test.bash
+++ b/tools/gpio-tools-test.bash
@@ -3087,4 +3087,5 @@ modprobe gpio-sim || die "unable to load the gpio-sim module"
 mountpoint /sys/kernel/config/ > /dev/null 2> /dev/null || \
 	die "configfs not mounted at /sys/kernel/config/"
 
+# shellcheck source=/dev/null
 . shunit2
-- 
2.39.2


