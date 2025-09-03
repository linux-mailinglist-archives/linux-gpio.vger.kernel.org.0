Return-Path: <linux-gpio+bounces-25534-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFEDB42A78
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 22:05:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69E943B4023
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 20:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E19BB2BE036;
	Wed,  3 Sep 2025 20:05:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B112DCF77
	for <linux-gpio@vger.kernel.org>; Wed,  3 Sep 2025 20:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756929907; cv=none; b=asb+6uDm/X7vcmYfQI6CctR+ifEUroJqOPENE0BWBuVUugl+x/gXo2H2C10/74vNun6psFhYBJ1BmK6a0EyFdMzDeeSWqQv0E6uiNdcW3TTE9Rib6AfpumSyQusSzYsz3gmshrmZcDmAO/iA1tgp4ZlIgbPGPof25hYTudTfMy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756929907; c=relaxed/simple;
	bh=3haZJmhMwJAtNWKubxBwq6VB+yAT1aEVXcYQvKoKDlQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:Content-Type; b=M8jh5HADFVFoqUkhxRHNkAqFK5Rh2/tOzIPMsJZaJaA60m5IfrRBk3Ae/kpjLTZ/n1CkUp+xsVN9aYVrLSi7q86hlci+2fc55cZpOp93N6CmTUM/v1mJUCJux8vXHLiS+NaGLyKNzL5p9OFwu0HCNEESZOKj2Ug3W1iXQdwkn7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.2.102] (213.87.131.167) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Wed, 3 Sep
 2025 22:49:38 +0300
Message-ID: <179c9e8c-8760-41e6-aad7-7a128df60984@omp.ru>
Date: Wed, 3 Sep 2025 22:48:54 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH] pinctrl: rockchip: fix NULL ptr deref in
 rockchip_pinctrl_parse_groups()
To: Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner
	<heiko@sntech.de>, <linux-gpio@vger.kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-rockchip@lists.infradead.org>
Content-Language: en-US
Organization: Open Mobile Platform
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 09/03/2025 19:33:07
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 196014 [Sep 03 2025]
X-KSE-AntiSpam-Info: Version: 6.1.1.11
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 66 0.3.66
 fc5dda3b6b70d34b3701db39319eece2aeb510fb
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info:
	omp.ru:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: {Tracking_ip_hunter}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 213.87.131.167
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 09/03/2025 19:34:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 9/3/2025 3:35:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

In the Rockchip driver, rockchip_pinctrl_parse_groups() assumes that the
"rockchip,pins" property will always be present in the DT node it parses
and so doesn't check the result of of_get_property() for NULL. If the DT
passed to the kernel happens to have such property missing, then we will
get a kernel oops when the pointer is dereferenced in the *for* loop just
a few lines after the call.  I think it's better to play safe by checking
the list variable for NULL (and reporting error if so), like we check the
size variable for validity further down...

Found by Linux Verification Center (linuxtesting.org) with the Svace static
analysis tool.

Fixes: d3e5116119bd ("pinctrl: add pinctrl driver for Rockchip SoCs")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
The patch is against the master branch of Linus Torvalds' linux.git repo.

 drivers/pinctrl/pinctrl-rockchip.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

Index: linux/drivers/pinctrl/pinctrl-rockchip.c
===================================================================
--- linux.orig/drivers/pinctrl/pinctrl-rockchip.c
+++ linux/drivers/pinctrl/pinctrl-rockchip.c
@@ -3488,7 +3488,9 @@ static int rockchip_pinctrl_parse_groups
 	 * do sanity check and calculate pins number
 	 */
 	list = of_get_property(np, "rockchip,pins", &size);
-	/* we do not check return since it's safe node passed down */
+	if (!list)
+		return dev_err_probe(dev, -EINVAL,
+				     "%pOF: no rockchip,pins property\n", np);
 	size /= sizeof(*list);
 	if (!size || size % 4)
 		return dev_err_probe(dev, -EINVAL,

