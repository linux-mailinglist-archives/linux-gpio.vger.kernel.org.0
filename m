Return-Path: <linux-gpio+bounces-11082-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58ED6995CE1
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 03:18:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E31F12871A4
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 01:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6E5B3BB22;
	Wed,  9 Oct 2024 01:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="SeOTByFQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1727A26AEC
	for <linux-gpio@vger.kernel.org>; Wed,  9 Oct 2024 01:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728436665; cv=none; b=L+6xb+On5iQu6RUVW69UOsy3mD1mfND+YUrv1/VSwrcdYuBOooVphwR5eW1UNGloRWj+7gIOdxzizCzeLhWTf4QI2YXPPruf0Z6sMSpzE8CRgmpzInNwpjSP6CK2wz17mBARfDM5Hh909CxJavM2rr6+Q1OY8f5+3YTVjuz50CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728436665; c=relaxed/simple;
	bh=6Jh105ygnGzuYeaBOn+phhWRhYjkYI2HKwX1w694LOs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kQkHB2Td+bQWwGNzBerkqtEe5INd+09uOImhiCze9qw0M/l45tcy71AcXy7NEW9+uMvZGl0gxN3VZi/1tANmZ2O7HXxFNH4RDgBgGev6yh6E3N+Wq7UkFSW+UQz5/8/xlHUWYH3Xy10aBsSV9G1E4sThQYeT6upD+9nVDYSqkls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=SeOTByFQ; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20c6f492d2dso3165ad.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Oct 2024 18:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1728436663; x=1729041463; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6rcvxYGMoOTRMXFV/E9b+WvC4bJSrWDz1gUOsF/dMGQ=;
        b=SeOTByFQlZNBAqnii41dtxw5YLJQNv/A6fTo9vdXkF9L2wQ8Nq9Ls58v6ypX+rcayx
         wpzTh27IHKeTQxv8mWrEFobHXuLAZagADKlyYPAIYJtMuP7oihnWZFOd+VnJXvKZRKw3
         tYTTPgOR4TVN64RdbukP7W+La6vLcrvLVlMdQn/AAyRe0xS3vo9hl822F+ekZHw4ZNwq
         DNJV2OAtoopf6rhah44md5gVLgVdIaVw+eV8kCNmCbzLTPreQGOgIHyFaEqiIUWluruW
         F3jmI98HqvzlLAqGpZyRHi6Jjp1za96weHrF/oIP3GJR62d0at+UQw/3b1B179KO5Jxa
         8zSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728436663; x=1729041463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6rcvxYGMoOTRMXFV/E9b+WvC4bJSrWDz1gUOsF/dMGQ=;
        b=nSiVj5/pOis48mbfmj5kB1c4GQM7fZmfzbP+oEd/AoyuXm5WYuo6daxOJ+S0/Krxbm
         Pw0Xk27Z5Bx505XE6lOgYu/md2eUoDRRmcP0awPzegmArcH+fozbQ8uX7STn9eTseqGA
         b2jqlQFBPHjjL7SrK+ZThwTNyit/ahpBeljEQhsYq9yqGpaIZBdzkoz4IcAsoLhqj0eo
         WpkSyLg9C3Xxc7F8/OOopOqH1qcjke7HL0HXgDHiTfsj1dFIZ8cOWTdXqPw9cFMzdeYB
         tGoMVlDlZHLWownQHRpbLZcrPEosuMwysBwKYAFRtTuagPJxOs/PR/70R5mKpstOgObB
         9eVg==
X-Forwarded-Encrypted: i=1; AJvYcCXYlI1FZcF+MC1AoBQLk9Fym8RPRDqWi/9xRCzIcuwwG0kmXrRdKG4roJlVAV5/1YnPFGiMhZIUAlVr@vger.kernel.org
X-Gm-Message-State: AOJu0YzNv/rAGjg81WBXCwlfQq8juN1rqqjrrHv17pgCUdvPEKvC1J34
	dzQuDhvu3QFwnv0oOZZpoUtMiAz5xgnVriJU8JXuZQnzQnjwt2YFH9rhwLATdmteQuPgoqp2BeM
	+
X-Google-Smtp-Source: AGHT+IEtnc4cCnA2h/Ncwk1hbYGngsttFCPHK379AweSgZoFPZhde5eOvn3TJ4RE9RdqiHPP0gLTfg==
X-Received: by 2002:a17:903:1ce:b0:20b:bac2:88f6 with SMTP id d9443c01a7336-20c639155bemr10883575ad.52.1728436663352;
        Tue, 08 Oct 2024 18:17:43 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cbbc2sm61076365ad.78.2024.10.08.18.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 18:17:43 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Tue, 08 Oct 2024 18:16:48 -0700
Subject: [PATCH v3 3/3] pinctrl: th1520: Convert dt child node loop to
 scoped iterator
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-th1520-pinctrl-fixes-v3-3-5b60db446a49@tenstorrent.com>
References: <20241008-th1520-pinctrl-fixes-v3-0-5b60db446a49@tenstorrent.com>
In-Reply-To: <20241008-th1520-pinctrl-fixes-v3-0-5b60db446a49@tenstorrent.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1

Convert th1520_pinctrl_dt_node_to_map() to use a scoped iterator with
for_each_available_child_of_node_scoped(). As a result, there is no need
to call of_node_put() anymore. The put_child label has been renamed to
free_map which is now a more accurate description.

Suggested-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 drivers/pinctrl/pinctrl-th1520.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl-th1520.c
index 7ed3f82b9339..c8d2ee6defa7 100644
--- a/drivers/pinctrl/pinctrl-th1520.c
+++ b/drivers/pinctrl/pinctrl-th1520.c
@@ -417,7 +417,6 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 					 unsigned int *num_maps)
 {
 	struct th1520_pinctrl *thp = pinctrl_dev_get_drvdata(pctldev);
-	struct device_node *child;
 	struct pinctrl_map *map;
 	unsigned long *configs;
 	unsigned int nconfigs;
@@ -425,11 +424,10 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 	int ret;
 
 	nmaps = 0;
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		int npins = of_property_count_strings(child, "pins");
 
 		if (npins <= 0) {
-			of_node_put(child);
 			dev_err(thp->pctl->dev, "no pins selected for %pOFn.%pOFn\n",
 				np, child);
 			return -EINVAL;
@@ -445,7 +443,7 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 
 	nmaps = 0;
 	guard(mutex)(&thp->mutex);
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		unsigned int rollback = nmaps;
 		enum th1520_muxtype muxtype;
 		struct property *prop;
@@ -458,7 +456,7 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 		if (ret) {
 			dev_err(thp->pctl->dev, "%pOFn.%pOFn: error parsing pin config\n",
 				np, child);
-			goto put_child;
+			goto free_map;
 		}
 
 		if (!of_property_read_string(child, "function", &funcname)) {
@@ -524,7 +522,7 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 							  npins, (void *)muxtype);
 			if (ret < 0) {
 				dev_err(thp->pctl->dev, "error adding function %s\n", funcname);
-				goto put_child;
+				goto free_map;
 			}
 		}
 	}
@@ -535,8 +533,7 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 
 free_configs:
 	kfree(configs);
-put_child:
-	of_node_put(child);
+free_map:
 	th1520_pinctrl_dt_free_map(pctldev, map, nmaps);
 	return ret;
 }

-- 
2.34.1


