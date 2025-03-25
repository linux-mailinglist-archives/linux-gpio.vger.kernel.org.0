Return-Path: <linux-gpio+bounces-17955-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D69F7A6ECFD
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 10:49:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6D2A18917D8
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 09:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37B481FAC3D;
	Tue, 25 Mar 2025 09:49:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from unicom145.biz-email.net (unicom145.biz-email.net [210.51.26.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DD3E55B;
	Tue, 25 Mar 2025 09:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.51.26.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742896185; cv=none; b=gaUocdYRWBrZ0kmLCbiHd+ThZMF+mSCUocXp/g0Znw+t94mdIpnWokJf1BU/0zorftWiJ4BGXFWxNUIvq2AOfKG2MpLmlogfUicj1pIZZaWanJjdXAkzPob1+IuOi4P3CZEQnhBhq7S7XHY1UxDR9U48gcasaipDfEwAsZh2BvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742896185; c=relaxed/simple;
	bh=PhPqvCNep9GXA8GASs7KBDRdd7Xp6ZJj8PLYP5kRmgE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Hnn16UDWRx3toWcOH7ZprwxLw/Hda+EoQCBwvIIkKSNBhGFC+BAPr/+sLSWTnm0M2GqQRQebMYFA1CbTlZ2V8GXcf/ddAw6AN2iXTbZ37S6DAxQiguvtxgSHh4tfMhl1CpY0fjRKqqNIJCsrQsVXCez1bsy/u7gRopMlLBIb1+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass smtp.mailfrom=inspur.com; arc=none smtp.client-ip=210.51.26.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inspur.com
Received: from jtjnmail201622.home.langchao.com
        by unicom145.biz-email.net ((D)) with ASMTP (SSL) id 202503251749357760;
        Tue, 25 Mar 2025 17:49:35 +0800
Received: from jtjnmail201607.home.langchao.com (10.100.2.7) by
 jtjnmail201622.home.langchao.com (10.100.2.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Mar 2025 17:49:34 +0800
Received: from locahost.localdomain.com (10.94.16.22) by
 jtjnmail201607.home.langchao.com (10.100.2.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Mar 2025 17:49:34 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <andersson@kernel.org>, <linus.walleij@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Charles Han <hanchunchao@inspur.com>
Subject: [PATCH] pinctrl: qcom: tlmm-test: Fix potential null dereference in tlmm kunit test
Date: Tue, 25 Mar 2025 17:49:32 +0800
Message-ID: <20250325094932.4733-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Jtjnmail201613.home.langchao.com (10.100.2.13) To
 jtjnmail201607.home.langchao.com (10.100.2.7)
tUid: 20253251749359596ef88eadf45a263ffedb16e9b63c0
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

kunit_kzalloc() may return a NULL pointer, dereferencing it without
NULL check may lead to NULL dereference.
Add a NULL check for grp.

Fixes: c7984dc0a2b9 ("pinctrl: qcom: Add test case for TLMM interrupt handling")
Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 drivers/pinctrl/qcom/tlmm-test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/tlmm-test.c b/drivers/pinctrl/qcom/tlmm-test.c
index fd02bf3a76cb..7b99e89e0f67 100644
--- a/drivers/pinctrl/qcom/tlmm-test.c
+++ b/drivers/pinctrl/qcom/tlmm-test.c
@@ -547,6 +547,7 @@ static int tlmm_test_init(struct kunit *test)
 	struct tlmm_test_priv *priv;
 
 	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
 
 	atomic_set(&priv->intr_count, 0);
 	atomic_set(&priv->thread_count, 0);
-- 
2.43.0


