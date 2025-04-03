Return-Path: <linux-gpio+bounces-18188-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A19A79D68
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Apr 2025 09:50:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C270E1896FD1
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Apr 2025 07:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6C521E9B1A;
	Thu,  3 Apr 2025 07:50:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC74DDDA9;
	Thu,  3 Apr 2025 07:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.216.63.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743666625; cv=none; b=Jwjb/TssuKS/x33RZNQ4dXjjcZR5V93SOzPZLKvgEQPShxpJKd4TKDl+BzacGCm+Zw9NCJTUqev9rbs5/Q9f2qJgipVVhx5iEFpbt8LsDCv9aplEqCZ4Wx5/2esrIik8ElYOPclLpRU24IMRs6nkIU9ZW/prwIUsdYivhJqpGp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743666625; c=relaxed/simple;
	bh=5Tih78nnaCvrcM2hfTVijMW/umDMy7iW9Yzn3qyDk/M=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=ZBvHzWbsED3OR0Cm3l4oXcAQOFaee6CA/W1AocNRDHrirJjBcoTz/I0fwoCncrALS5DXEKKHcrMsnxypFPtWm3ITCICFgGoKtmP4u8aJ1YMSzlLsTNK1KD8fqC9aMqievi+byX1aWKUIQawoFiBinif2b6VyVpwqFOgQD4QgM3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=63.216.63.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZSv6Q0S36z5B1J4;
	Thu,  3 Apr 2025 15:50:22 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl1.zte.com.cn with SMTP id 5337oBtI087661;
	Thu, 3 Apr 2025 15:50:11 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Thu, 3 Apr 2025 15:50:14 +0800 (CST)
Date: Thu, 3 Apr 2025 15:50:14 +0800 (CST)
X-Zmail-TransId: 2afc67ee3db6ffffffffc3c-47010
X-Mailer: Zmail v1.0
Message-ID: <202504031550143925VMOuiV6Gs3QgxNjRIOyf@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <andersson@kernel.org>
Cc: <linus.walleij@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <yang.yang29@zte.com.cn>, <xu.xin16@zte.com.cn>,
        <ye.xingchen@zte.com.cn>, <xie.ludan@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBwaW5jdHJsOiBxY29tOiBVc2UgZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlX2J5bmFtZQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 5337oBtI087661
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67EE3DBE.000/4ZSv6Q0S36z5B1J4

From: Xie Ludan <xie.ludan@zte.com.cn>

Introduce devm_platform_ioremap_resource_byname() to simplify
resource retrieval and mapping.This new function consolidates
platform_get_resource_byname() and devm_ioremap_resource() into a single
call, improving code readability and reducing API call overhead.

Signed-off-by: Xie Ludan <xie.ludan@zte.com.cn>
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 13cdd6c0fbd7..264ac0e7152d 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1548,7 +1548,7 @@ int msm_pinctrl_probe(struct platform_device *pdev,

 	if (soc_data->tiles) {
 		for (i = 0; i < soc_data->ntiles; i++) {
-			pctrl->regs[i] = devm_platform_ioremap_resource_byname(pdev, 
+			pctrl->regs[i] = devm_platform_ioremap_resource_byname(pdev,
 																   soc_data->tiles[i]);
 			if (IS_ERR(pctrl->regs[i]))
 				return PTR_ERR(pctrl->regs[i]);
-- 
2.25.1

