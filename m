Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44C76266E6
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2019 17:30:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729758AbfEVP3p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 May 2019 11:29:45 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:9640 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729832AbfEVP3m (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 May 2019 11:29:42 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4MFSLdn021231;
        Wed, 22 May 2019 17:29:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=B6DKjDnb7O5BR/R4BaH3RkAeSYESY1eQiVlZXH9oE8A=;
 b=Nsbzx5vOjEJkV6yl0J71Fvx548IwqVYr5OK+tf/R+yDwNL/jXPYF5cCRqDr/O99pgeYH
 0ozfyPcQkt6fT8zAvU1kfbBuNu90pOOEkOzQjh/KFw/OAAuwwg/Bry9j3ZzkAxvjmzTB
 S9cYHgLoffD6ew/N+GxezB5ZBZasKT/JVJpusP2/sWvqP93/T7zHcOgu4y6mYBlTeHEq
 0hr71YovpDRlVqBWpd6wZSqmxK/hmmIgDcx6Z4YXDXZXONzyegRzNWS2r8q8e4L5TR7T
 2Dpj+FLeOrndDydEazYRjwezPqxckX1Hssp03CO49DxgnkEfH4BkR1wPXqG9aX+Gnswu Kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2sj7h11b1j-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Wed, 22 May 2019 17:29:32 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3A46941;
        Wed, 22 May 2019 15:29:31 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EAEE42CD8;
        Wed, 22 May 2019 15:29:30 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 22 May
 2019 17:29:30 +0200
Received: from localhost (10.201.20.122) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 22 May 2019 17:29:30
 +0200
From:   Benjamin Gaignard <benjamin.gaignard@st.com>
To:     <linus.walleij@linaro.org>, <alexandre.torgue@st.com>,
        <amelie.delaunay@st.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <benjamin.gaignard@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH 2/2] pinctrl: stmfx: enable links creations
Date:   Wed, 22 May 2019 17:29:25 +0200
Message-ID: <20190522152925.12419-3-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20190522152925.12419-1-benjamin.gaignard@st.com>
References: <20190522152925.12419-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.201.20.122]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-22_08:,,
 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Set create_link to inform pinctrl core that stmfx wants to create
link with its consumers.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 drivers/pinctrl/pinctrl-stmfx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index eba872ce4a7c..55a9f145b4d9 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -622,6 +622,7 @@ static int stmfx_pinctrl_probe(struct platform_device *pdev)
 	pctl->pctl_desc.pins = stmfx_pins;
 	pctl->pctl_desc.npins = ARRAY_SIZE(stmfx_pins);
 	pctl->pctl_desc.owner = THIS_MODULE;
+	pctl->pctl_desc.create_link = true;
 
 	ret = devm_pinctrl_register_and_init(pctl->dev, &pctl->pctl_desc,
 					     pctl, &pctl->pctl_dev);
-- 
2.15.0

