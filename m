Return-Path: <linux-gpio+bounces-25016-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11272B379F8
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Aug 2025 07:44:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C104C681FDF
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Aug 2025 05:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0AB6310627;
	Wed, 27 Aug 2025 05:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dd/H+G7c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C6C2B9A8;
	Wed, 27 Aug 2025 05:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756273449; cv=none; b=eg01WGO+j6FaF689F75RLZLQQcet3yzXIZyHNsE5M5QofukxhsaneP4OXFZ2CyZ6YEfzzr5UVUiI1kU57SNf0zVgLa+wIT2qwuL1MfOBRbuXDfaGewyrbJwtzrZpPqOpe9+V9dL7yS8IqzD+tlujVyxhNpd/6wHrcYdCGAh/vhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756273449; c=relaxed/simple;
	bh=qU9yX8+H58MZdiUi9Zflq3Mtb6lMEBvIB6QGMxIgO/c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kmVV/VXJMPBQT4GUYotM2/FKJgBzVxDEqtJ5lzLtBRj0Oiol4o1a7sHtrdXrSae8ixyyWnDoLd+FWp9Fkzxao6SWc7vR/yEXBIt8qMM+M5PfKqf7t8wGkBanSMxvWFghSH28bkP6dq0qc2pIOJBHcH2diG3HKow5tC2P+j1qb78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dd/H+G7c; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-24687a76debso7175845ad.0;
        Tue, 26 Aug 2025 22:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756273447; x=1756878247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jQp7KNKN1iuXkYFWalQAnGSYaGLmdz1P84h0k9rLggc=;
        b=dd/H+G7cVRj3ABzESP2qzMSsvyMDfrknCyt1xolS03rwWWbaJvd9tfmTUrcMlJGo7b
         5sw0UPMSFu2wW1bH+85dzuC+3OSwtgvEciTc0i9A5Ek0mJF1TbesCkLq8Czd4Ks2m6N9
         VhriQ2JrAs6zYKW5f2nI77S0SV4hR+5FnDORELZRWCyQJ61uB4IyZrTq9g9yIKyURJS/
         ylvZO+TtjEZoQzmCJ9/u4WvBZ6Rw3OtdKpX1/sJ1RghqWgei2TSRPo/PDzkg1KZOrVb8
         axsa8aVVFNo+5TS6Lg1vscC2zvdiG7eO+V7JMSC0269Hc/wKwP8rKynr95E5R5kXfbCg
         AAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756273447; x=1756878247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jQp7KNKN1iuXkYFWalQAnGSYaGLmdz1P84h0k9rLggc=;
        b=pOAVQYCB0XzgP7rz151s1K+/aGaBYUQCgamgd0v7KcgdyucFZMfSrwG4wIh5mQvvho
         Ai47RMUr2cvlq4JJBmbQvnhZ3aDX/ow3vo8yCDsJuYBLZL0Bfj89NkcU7G7tZ9PrgP2c
         pIP2wTGCxnCQ7Tq6+4LZjZ8Rb92KrfRKiiZyGyTIik/fOQOs4FgdFb5XuStVhbEuwX20
         TLrVb9hGinH6OfTovh8KWODGK+g4baXILHFGUs1ftE9TyvIfKVh30tD4LjL1EIReQeMi
         f5APbRhMxLKbczenvDAgtAt6zuw4oo62g7mwXrd2qmrT3TDdn+idUZxigIb8+YlS+csS
         ezVQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3Uahgam1hkmv14uVk/rpG6IKHt8Z6ooLq6BhcsMqtkT+iNc0yNXiLWHwORPCPyfJ8gXtSGSDC3lpGRg==@vger.kernel.org, AJvYcCW1lbdO4+KTGdibwnjVyHsvp/P/82ZO35vrZqoHwz1iptC3pj5pYJH7O28qepXrirjcTvhO8xN4QiZxcnwV@vger.kernel.org, AJvYcCXhTa5Qse8Sw3M8i+6i3Va/nsRVMjqABWtTxgdHr90thbVe6deMxNIwJiOZ1133/HLfxrNJqlEjLgA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3gYUK9zyBOOyQBXTrwILI3BMYfyDcVOEfnRYewVPbxfh/URxE
	mfIz1Y7fy1mKIDhdfNKmO0VIaXxl0gtNf/t5tcCBWtR3XwLSm6JwmoGv7eb11dC9F8A=
X-Gm-Gg: ASbGncsggJ0fkbdHD/SrLGHxV6VtwtWNPFC2pXOoRs46gP184LBaI4X31UymWGtmjOR
	bPFAA0DyXGiJQF5sDPNDC+wBgYuCrrEsSPFMwbMSgfJ/GGfDl+1qlUEclVNj/xX+bf/7RQY7Srt
	XaA7OT3KKGd2gVXgymZFCht5RY0XWJDdiBF6eiqmTLgULsKb4QMERoDWyZxm9EqI3adVfVFvqi8
	8cCuxO/akrNKpJCUEMUkBoxzs2jkh/GRQ3TJejgNdQiCaQ4zaTM3VivlIJnCmNQ0iFfcdCzQ9Us
	G5lKqYXl40lQqJRKQkBUr5D0NzGxL6qesF5Oat5HfXxuBEb1A8JFP3SZf9S+GUPP6qABpN3hBsQ
	nsMUE7frFCSGWOkUT2DHUWO/3+BqacTXxgaguDMvUv5ghw3G5yCkKMeDPLB6W8+A=
X-Google-Smtp-Source: AGHT+IGoKqncQcz+xpadUsWaigtheWVoyRaDvpL63DrsAiQ3IjXWG2PVNzBw3ZHT0sTIj30mp4B1GA==
X-Received: by 2002:a17:902:ce88:b0:242:c66f:9f62 with SMTP id d9443c01a7336-248753a2725mr52777755ad.26.1756273447389;
        Tue, 26 Aug 2025 22:44:07 -0700 (PDT)
Received: from fedora ([172.59.162.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2489aaaf051sm7785025ad.62.2025.08.26.22.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 22:44:06 -0700 (PDT)
From: Alex Tran <alex.t.tran@gmail.com>
To: linus.walleij@linaro.org
Cc: corbet@lwn.net,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alex Tran <alex.t.tran@gmail.com>
Subject: [PATCH] docs: driver-api pinctrl cleanup
Date: Tue, 26 Aug 2025 22:43:52 -0700
Message-ID: <20250827054352.669598-1-alex.t.tran@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resource cleanup when using pinctrl.

Signed-off-by: Alex Tran <alex.t.tran@gmail.com>
---
 Documentation/driver-api/pin-control.rst | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/driver-api/pin-control.rst b/Documentation/driver-api/pin-control.rst
index 27ea12363..281533c33 100644
--- a/Documentation/driver-api/pin-control.rst
+++ b/Documentation/driver-api/pin-control.rst
@@ -1202,22 +1202,24 @@ default state like this:
 	{
 		/* Allocate a state holder named "foo" etc */
 		struct foo_state *foo = ...;
+		int ret;
 
 		foo->p = devm_pinctrl_get(&device);
 		if (IS_ERR(foo->p)) {
-			/* FIXME: clean up "foo" here */
-			return PTR_ERR(foo->p);
+			ret = PTR_ERR(foo->p);
+			foo->p = NULL;
+			return ret;
 		}
 
 		foo->s = pinctrl_lookup_state(foo->p, PINCTRL_STATE_DEFAULT);
 		if (IS_ERR(foo->s)) {
-			/* FIXME: clean up "foo" here */
+			devm_pinctrl_put(foo->p);
 			return PTR_ERR(foo->s);
 		}
 
 		ret = pinctrl_select_state(foo->p, foo->s);
 		if (ret < 0) {
-			/* FIXME: clean up "foo" here */
+			devm_pinctrl_put(foo->p);
 			return ret;
 		}
 	}
-- 
2.51.0


