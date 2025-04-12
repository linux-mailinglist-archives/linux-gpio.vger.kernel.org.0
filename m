Return-Path: <linux-gpio+bounces-18741-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 57079A86DE0
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Apr 2025 17:01:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 394A3175DC8
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Apr 2025 15:01:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 268B91F7910;
	Sat, 12 Apr 2025 15:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="K96PN8jw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E180192D97
	for <linux-gpio@vger.kernel.org>; Sat, 12 Apr 2025 15:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744470101; cv=none; b=H+xct76pyP71K4rO3liZidOUlhN2PqMKu9/7nlJwG6DlEEe+x3fa5P3baR/wkA/a2EQGjD5oB+KTh5ZlsnDAjuW5rf9C1ekVCWlsdrxcnAgbtoC+Ikr5z5ucU8aTTklCsLEL5Wr9JfA0TZfVteyTwGECaHFmOSUsdan8XZC8eQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744470101; c=relaxed/simple;
	bh=QCQcBB5VFK0IPcWPaNZuPc349e+QqUYMSWvQeVjbWj0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m34he/3PjBGW3w3/PTW2/n/ntj62EPiktyeVz61p1V4x8aiMIjRJ5dZCAdEPaE7sHsKBe0ZZPWzWkjwhMfIvjblEOdGrwbaRn6UIvTxIvw2OCgHcqmHNwNch/st1WdnagCDEj9VCbkCuSZFGOCXxBai9Bhu+8fxjipIoJEyrVNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=K96PN8jw; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E32F83FB77
	for <linux-gpio@vger.kernel.org>; Sat, 12 Apr 2025 15:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1744470089;
	bh=rJslOADLoGpOIdP2afwJiiNrZskae/nRuT1W9FEresM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=K96PN8jw27tVO3IuNH8pFs+Rors/4R7SsgIa28n2pm71qXR5SY/+DDZPkmNhD21mv
	 yY2h+ImzdyA7VDzoCs47AcVqSGZu1lvhFUw4lUaBeEiepz+F1xRlIv9a+zn1RAfFyN
	 QKPr21rRW/9AdruLU8ED0OBjmJHsvAIxwYJ7OiSEEccsXNbatj50oK7J3Mc2YIHGSx
	 P8gCLNwJndVHFWkghh2+l/iMa40Owac5ZmOPYA26aRgvViiUianb7W8XlFx+gea6MG
	 qpAsViB/d6YWlef+8UoJEzdjwho4XudBHXSDt/B92gjttWpogBQSp/pfwW/f8rP/Wl
	 ygIac546Pnu9A==
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7395d07a3dcso2090291b3a.3
        for <linux-gpio@vger.kernel.org>; Sat, 12 Apr 2025 08:01:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744470088; x=1745074888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rJslOADLoGpOIdP2afwJiiNrZskae/nRuT1W9FEresM=;
        b=FiJt0ZiSXMRXOOs3S7ilF9f2ITvRYjjKehTmAs++EJKyhCwZw4KchE+INu+yWTqdJa
         YQkO4VW/LzLkgytkergiA8YkiLzKy33uyjzTJw54BCEAShfboNLGCvI9jcwFOnuplecs
         Ab6cA0G/FA/HyKe94E4u+D+8RM954iObmW2ewERSsctKK0FMkPa+4s2zS0X2Y8vlsDRD
         h0gfFIY5YZCmUaTIGJm7S+AhptpiUn3qyAl64KkWdbZczdOZyPDz0BYtR6xsR9jfILXC
         TsFcRnBAjeYWFZEzWb5mrJH2pNN3uQQFpgBhpLCHY00mpU0cHb862SSMMsNaLy/Ypoau
         oENg==
X-Gm-Message-State: AOJu0Yx7Y9/K+705pjcIufXK4JAHfsryP/LmI0FKi/o5dauTbBqYqLc8
	s/Cunu1ctnnFiJxinHRmg5pWRHl7a6BkB/kRpJC38jWuva28Xd/aXspMsCdgFZcPWKRBX6a8XNF
	895t2noAfW52RBlBkuAez8CcVDE/lBeEe5GcuztbchXHLX3RgMrtSyoLscmu4OkSuldEd7Rw67/
	vVbLDUPPE=
X-Gm-Gg: ASbGnctTFCw8/K/qKslo2QvYpiiHIM9SS94oTCdglgzRpyIUIEVC+NcVjkj00vPOCfC
	4Xh4ySeVjN0x3CcUTNJ1oAcDSQtZX4ZYfWnAY8u6DYReg3r9VzfB3FbYvcRMfPRR3kjBU3xT0lp
	/x2naICZWcOdqab3AKVCnichWkAIl/tbdgQhTdOoyUJj2mHH6cVW0C+BODsl+t5zAW9YDHVcUd7
	QKUAEINoCHTFpMr8Wh0ZX86N1BcxxBoVvc91xPnBzalv9FijauPa/K9lePic/eeiGoehdY+Ur7v
	ypOJE4yt0WM=
X-Received: by 2002:a05:6a00:4644:b0:730:95a6:375f with SMTP id d2e1a72fcca58-73bd1199eaamr9676999b3a.3.1744470088082;
        Sat, 12 Apr 2025 08:01:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8blR76lPWX5wm2vatH+K50azpOgn9gNFUMnrfRLcqy5g0JgIh6KXPB9NMmoGFETTpuJYHgw==
X-Received: by 2002:a05:6a00:4644:b0:730:95a6:375f with SMTP id d2e1a72fcca58-73bd1199eaamr9676936b3a.3.1744470087385;
        Sat, 12 Apr 2025 08:01:27 -0700 (PDT)
Received: from z790sl.. ([240f:74:7be:1:3a1:1528:8601:c20c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c62c3sm3612168b3a.52.2025.04.12.08.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 08:01:27 -0700 (PDT)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests: gpio: gpio-aggregator: add a test case for _sysfs prefix reservation
Date: Sun, 13 Apr 2025 00:01:19 +0900
Message-ID: <20250412150119.1461023-1-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel doc for gpio-aggregator configfs interface, which was recently
added, states that users should not be able to create an aggregator with a
name prefixed by "_sysfs" via configfs. However, it was found that this
guard does not function as expected (thanks to Dan Carpenter for
identifying and fixing the issue).

Add a test case to verify the guard.

Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 tools/testing/selftests/gpio/gpio-aggregator.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/gpio/gpio-aggregator.sh b/tools/testing/selftests/gpio/gpio-aggregator.sh
index f1bab62c4cd2..9b6f80ad9f8a 100755
--- a/tools/testing/selftests/gpio/gpio-aggregator.sh
+++ b/tools/testing/selftests/gpio/gpio-aggregator.sh
@@ -335,6 +335,10 @@ test "$(cat "$CONFIGFS_AGG_DIR/agg0/live")" = 0 || \
 agg_remove_line   agg0 line0
 agg_remove_chip   agg0
 
+echo "1.1.6. Can't instantiate a chip with _sysfs prefix"
+mkdir "$CONFIGFS_AGG_DIR/_sysfs" 2> /dev/null && fail "chip _sysfs unexpectedly created"
+mkdir "$CONFIGFS_AGG_DIR/_sysfs.foo" 2> /dev/null && fail "chip _sysfs.foo unexpectedly created"
+
 echo "1.2. Creation/deletion via sysfs"
 
 echo "1.2.1. Minimum creation/deletion"
-- 
2.45.2


