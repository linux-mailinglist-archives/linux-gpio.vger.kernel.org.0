Return-Path: <linux-gpio+bounces-25021-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAC7B37C21
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Aug 2025 09:46:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C99F365E44
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Aug 2025 07:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AB94321420;
	Wed, 27 Aug 2025 07:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SRpFjIuL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36D5301489;
	Wed, 27 Aug 2025 07:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756280759; cv=none; b=jNAoFxXXOAlBAqY3mcER/TCYS+xf6TFYyKU+tzmjUL2JvleY9GXZW99sUEXCfvYj1Rt55jSbBqImKVAm8VoNZfMhym4wq0OvjTizwvtPf6O61lYEU7P2TjTtz4BbT0KSHI4ZzKQeHciOAQVFBQsZ9X91mbiXsK1C/r4v5hPw5ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756280759; c=relaxed/simple;
	bh=avl/vK+1OqsP7WpQH/Ok7MQgeR/3z/c1bN2rhgFjxnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SU8PFir5TJ2kGBmewORPu9XJKHinqYc0Kyx7nsWFQ/rcXdBCHtd7PksxRBU819GDx2x2Ga6at1jvIVlx8YIwPDkMyACFyNBPrtgFJasqjGxbbdEqXmVvoP/TnJ0fr4QblZt7pfDqSZ1XKatJ7vvg57Ubrs5Vqhsmdg7BVd7m1Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SRpFjIuL; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2445827be70so66170745ad.3;
        Wed, 27 Aug 2025 00:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756280757; x=1756885557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iIepKPqJnHLoIt+6wLgf2MT4M9JacFA48dPHW00otEE=;
        b=SRpFjIuL49gGbYeeQ4CwJKtlSiq79kvvetZPiJL79la7bQEMGkvAiMcA0sm30bHLNn
         5KVFFpbl6r6/uLD9fl4A1QYn2jZqRVBl268iGk6X2AS3njNbOfwvX5j9ms+4Mj5gJwW/
         DoQ9KlL7IQAieuwVD0TyxYCTiS7C+q5PNI111FhV7Q+DW7wzqo7GPPQ7bIjW9yIdoie3
         R07zYXXZVfAs/dQAFfuuUa6CyDn24tWalz4XWtEdmFakrj3VFIDQUhWaSWSxo17WAroQ
         QppKIb83pUKfxIAZm4k5XU4hQk1kKiUW6dmAkh7RdaYcsZgjUmzMBfoxQADooSHpAY/l
         0GOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756280757; x=1756885557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iIepKPqJnHLoIt+6wLgf2MT4M9JacFA48dPHW00otEE=;
        b=tYMjCzbiK1KQCkGQpNVD++oQu4+26AwNp91vDT6BSpzDPN3CHAIVJ+UDhs+YVRA/ym
         Q+2APtjuNXn14E/3tZt7WLuYRmC0DGYQPTwyZ6Vcnql8ERl8iRWJ9ub5KEb0df5m3IWS
         F3PHGv2I/M2MvmG8X4AoYbTF/SmXSurcbCa8yef5YcpwULukmwJRSIosT0kdFoNVdPBC
         6k+PzbvVzUy+QKs/9q1sHNNaMU8QklAxcNe92WPcDDGroSfuiHBADppNCKamJwS3DZu9
         eLcZ78me2EHV2HdO8dBRm6M0k8MFyn2X2aq2tUY6OqIQidbv1xiYWaZgCL9G6LFPpiu0
         5+Jg==
X-Forwarded-Encrypted: i=1; AJvYcCU69ksjFRmhSA5HKftFeogthStxmYLLs2zlDLxQT9t7qdLGOIPc+XfyFBp9VWr5WL9rxOzPSuEnfQY=@vger.kernel.org, AJvYcCVMii3qlswgr+22bIifEVcV4JTO7C99NZkg/q11xJxZp36qm6lJU4GSU8Hdo1VzlX/UtJM8vINV+TsZTZwc@vger.kernel.org, AJvYcCVPm/4Y9WX/vtSwAMiUEbRedb0+URx9Iou0Ygp4EdnXtgIyx3zyoGTcsTCJtNfl2J3vD6+pxMXdm4zXiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw92QwrYh66ywlTSrc2yq9F9CFwsmZGA5t4hEbJOd9VZd4UZI4e
	kUOE/Nvc9YBHcdCa5e+tGp+3URvrFK3SaeEvIWSEioWLg+gx0R63FJhj
X-Gm-Gg: ASbGncsYfpV6g1/iGIXl+87Y4Xn1jiFowurJNo1fEzpv0xICWy2nNAuznibAV7s1p2K
	r+/cdx1G7hiW8ui3PiKFaMOsyTc1VvrgkxO5/W3daEm5KPLR80uRtEi70HkBKk4lXgdNJ4t0MdK
	GmxpFXHLK+hhPuF9hWPgrK4S1j4YfI85zQFm2AVis4GdxHW0bHbw1xgz7Lc6L60PM/SzfWN93xT
	FUuydOfSe/dd6ZdZ+OjpEZ++A1HvIHp3q4j5jCd/iuA+fD2+9R0i0PvIXs23qGpG1vG3VPDyzIj
	bVt2KElTEDr6J+54bcA/T3kZM8mTs+UI3Nmk3lJDUQi7Ru0uB107i1lVFSy3RviBncc6hEyIi8c
	u/TBSDa+qyjakup+aF6xUUWWi4IyNqSNfyQuV1aQlOJT4lbVM6ET8
X-Google-Smtp-Source: AGHT+IGqoHkSGoPzsg7Czmr2HMEXWIc8NI+soKEjzL0mu0e9fZIXG8FjCQfq2bvEtsnelC5I0bUaZw==
X-Received: by 2002:a17:903:4b46:b0:246:4077:455b with SMTP id d9443c01a7336-24640774de6mr260855125ad.36.1756280757085;
        Wed, 27 Aug 2025 00:45:57 -0700 (PDT)
Received: from fedora ([172.59.162.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2466889c61bsm114824125ad.143.2025.08.27.00.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 00:45:56 -0700 (PDT)
From: Alex Tran <alex.t.tran@gmail.com>
To: linus.walleij@linaro.org
Cc: corbet@lwn.net,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alex Tran <alex.t.tran@gmail.com>
Subject: [PATCH v2] docs: driver-api pinctrl cleanup
Date: Wed, 27 Aug 2025 00:45:25 -0700
Message-ID: <20250827074525.685863-1-alex.t.tran@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

changelog:
v2
Replace FIXME comments in the pinctrl documentation example with
proper cleanup code:
- Add devm_pinctrl_put() calls in error paths 
  (pinctrl_lookup_state, pinctrl_select_state) 
  after successful devm_pinctrl_get()
- Set foo->p to NULL when devm_pinctrl_get() fails
- Add ret variable for cleaner error handling
- provides proper example of pinctrl resource management on failure

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


