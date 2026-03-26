Return-Path: <linux-gpio+bounces-34183-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFevG4qcxGki1gQAu9opvQ
	(envelope-from <linux-gpio+bounces-34183-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 03:40:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B62E632E6CD
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 03:40:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D539A302F260
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 02:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A378F3914F3;
	Thu, 26 Mar 2026 02:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C+QhDHRt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154F038E113
	for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 02:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774492607; cv=none; b=IU3vFSYY7f7xAN5xeDoyHvZh4Ir2PvTDXmo5UdVxUYaOGQ7y0NTJpkAmt9XQsf0U18g6JmFekr4Cg/9XVUVHMcnxKlPAlxbTZ/arhX7LxMtTM1qlBRGI0mKRv8VHSwqa6Dedet3JcH9V9/R5m6tpJ6N2wWJPI3ksubcze/8oVCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774492607; c=relaxed/simple;
	bh=x9AzjzvF+Zn/f58SEXBbdYUK8/A08m9vI2LlTEJCV7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jv4o8yIk9BdEMcV4/l4wF9ZHfZNwgmaWdlbtWYVTiIa/FJ/MjL9FsWaRjSvaBmaIJADfBpX/nmPGv9hHVOTcOHtx/BFJ/2KphZQdBY+rGc4IaIwIyQE4rUhawMLVAPRhISG4BOTb3t43VbZibAQlFV5+3XdeIf6PZq/05FliATY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C+QhDHRt; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-823c56765fdso249748b3a.1
        for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2026 19:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774492605; x=1775097405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dc94mFyUarnXD7uTGOHIqKLXmGuXftbJg5Kgbu68aTI=;
        b=C+QhDHRtemAh95GLVEXIKzkv7aytG5q8dF+9ChKxMy7ty6zd3mE8rcD0QMPTiVWtjK
         iziO+56iB68d/OxpWjMhTc1g/o/yu5UL2HOPJrpiX+seDk4ParjTIuj1AKmAJIM1i2zI
         Odpg97Ma4jJB9XT4VFxf7vOl/tOd603zow4uQzr5SdR3O+6JV4swleSlTA85dNCVwRms
         UvbrqYSKbOaCVGQj5BS5ej0x6W+ZvVa1Ojo686vKtDvrH+3pIjeiqH8ksxVDJ2WKOt/P
         vfdqW4A4OERRpAdLjZauIZKIvC/yaBBd649hzpBBUYfBOwdJfk4EW8Do/v/I3cs63BJK
         p0nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774492605; x=1775097405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dc94mFyUarnXD7uTGOHIqKLXmGuXftbJg5Kgbu68aTI=;
        b=JwvkZOWeIFkz7Sx070fSrypeL5f3GXBV72Wr6qT3gI9o128HBsp2ZZg9Zr8+Dez7LP
         SUZzbd//xCxwgqv4qoHvQPdoylhx4xWmqSH3KXG1CJ9+IbJmyDYYo/zEwU/kTgPV5g5U
         j2tZ4GTF12r9dtQCIMIH2QolWXM5qH2TYZsU4v83SRG5eUhlsttLGiX7aYYaMe8BbY88
         wWGAHUBKW9+6V4RxO7kd2Wk+6gdsWbFOtSUQwjkRVxvJXXu3uu6lez+zUvECBTeaJrbR
         hSJOVUbf5ClEycrwi/tV+NnAJWeuZ+AcyftQcPW4RgqEgL3UOt+2m66wGGe8+6NE9aFF
         /B+A==
X-Gm-Message-State: AOJu0YzAOaljT6kxRaPoc0GAK9oZ6Z805FAZ/ZLUVBnK0F5NALcbts70
	sTewCCzmm+Mty+1W15C3cUiVMIScvKq/YYLv5ZBlomK4WkeDOcaHSfoOI7z3JbmS
X-Gm-Gg: ATEYQzx3l6gAgc/0RAXzhaG1eNRne9aogVTgFopFG1Y+WR161rpcovcJ11HABpmLZ8l
	MUzdcycjn71Q+TeWuyXDDFhZW6XmcU30vdHcYW+CESZSrzU77SmHNp2YPDk5ACE7sJnENsKReHl
	d6V78rC5cnCoOcZcSB0w4+ivIuDZVCFlGirFQoFEK30X7vuxznNdhRanUV/uTMOHA8MBh89hL9O
	xNZrzcz9mrl463HmcGPrtxvh8Z3dnXCkDFHWg+mTdrf7AFYTTClLxnzeZWlVOIMKg+VEsVlb4mb
	md/3vEKAZiwyTHecgqsssA3BQv2EiB3nsGljlEafSgZWEk/3aC71oyqs93Opinm+TsqHHSwNmJk
	NUPge5VJvvuI933Tq+aVDlnoJJlH+ZBpYLypodp4H168BMS3ZDZW7+W91RYaYWa70t+8fjj1tF0
	p4PGPQHyXtdvb300Uh9zTwRITVpAgWcjbRk38PJRhqW7fUhp9M3SwcrlIZFE7/3N3jtQ==
X-Received: by 2002:a05:6a00:f05:b0:82a:6de8:fa4e with SMTP id d2e1a72fcca58-82c6de9f009mr6630975b3a.17.1774492604974;
        Wed, 25 Mar 2026 19:36:44 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d385601sm990176b3a.33.2026.03.25.19.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 19:36:44 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] pinctrl: intel: use FAM for communities
Date: Wed, 25 Mar 2026 19:36:27 -0700
Message-ID: <20260326023627.54349-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34183-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B62E632E6CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use a flexible array member to combine allocations into one.

Add __counted_by for extra runtime analysis. Move counting variable
assignments to after allocation as required by __counted_by.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c   | 43 +++++++---------------
 drivers/pinctrl/intel/pinctrl-cherryview.c | 11 ++----
 drivers/pinctrl/intel/pinctrl-intel.c      | 15 ++------
 drivers/pinctrl/intel/pinctrl-intel.h      |  2 +-
 drivers/pinctrl/intel/pinctrl-lynxpoint.c  |  9 +----
 5 files changed, 25 insertions(+), 55 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index b733ec31ad9d..e73419498857 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1558,31 +1558,6 @@ static int byt_gpio_probe(struct intel_pinctrl *vg)
 	return 0;
 }
 
-static int byt_set_soc_data(struct intel_pinctrl *vg,
-			    const struct intel_pinctrl_soc_data *soc)
-{
-	struct platform_device *pdev = to_platform_device(vg->dev);
-	int i;
-
-	vg->soc = soc;
-
-	vg->ncommunities = vg->soc->ncommunities;
-	vg->communities = devm_kmemdup_array(vg->dev, vg->soc->communities, vg->ncommunities,
-					     sizeof(*vg->soc->communities), GFP_KERNEL);
-	if (!vg->communities)
-		return -ENOMEM;
-
-	for (i = 0; i < vg->soc->ncommunities; i++) {
-		struct intel_community *comm = vg->communities + i;
-
-		comm->pad_regs = devm_platform_ioremap_resource(pdev, 0);
-		if (IS_ERR(comm->pad_regs))
-			return PTR_ERR(comm->pad_regs);
-	}
-
-	return 0;
-}
-
 static const struct acpi_device_id byt_gpio_acpi_match[] = {
 	{ "INT33B2", (kernel_ulong_t)byt_soc_data },
 	{ "INT33FC", (kernel_ulong_t)byt_soc_data },
@@ -1595,19 +1570,29 @@ static int byt_pinctrl_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct intel_pinctrl *vg;
 	int ret;
+	int i;
 
 	soc_data = intel_pinctrl_get_soc_data(pdev);
 	if (IS_ERR(soc_data))
 		return PTR_ERR(soc_data);
 
-	vg = devm_kzalloc(dev, sizeof(*vg), GFP_KERNEL);
+	vg = devm_kzalloc(dev, struct_size(vg, communities, soc_data->ncommunities), GFP_KERNEL);
 	if (!vg)
 		return -ENOMEM;
 
+	vg->ncommunities = soc_data->ncommunities;
+	memcpy(vg->communities, soc_data->communities, soc_data->ncommunities * sizeof(*vg->communities));
+
 	vg->dev = dev;
-	ret = byt_set_soc_data(vg, soc_data);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to set soc data\n");
+	vg->soc = soc_data;
+
+	for (i = 0; i < vg->soc->ncommunities; i++) {
+		struct intel_community *comm = vg->communities + i;
+
+		comm->pad_regs = devm_platform_ioremap_resource(pdev, 0);
+		if (IS_ERR(comm->pad_regs))
+			return PTR_ERR(comm->pad_regs);
+	}
 
 	vg->pctldesc		= byt_pinctrl_desc;
 	vg->pctldesc.name	= dev_name(dev);
diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index a33eca5eafc4..e9b062b44fea 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1595,19 +1595,16 @@ static int chv_pinctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(soc_data))
 		return PTR_ERR(soc_data);
 
-	pctrl = devm_kzalloc(dev, sizeof(*pctrl), GFP_KERNEL);
+	pctrl = devm_kzalloc(dev, struct_size(pctrl, communities, soc_data->ncommunities), GFP_KERNEL);
 	if (!pctrl)
 		return -ENOMEM;
 
+	pctrl->ncommunities = soc_data->ncommunities;
+	memcpy(pctrl->communities, soc_data->communities, soc_data->ncommunities * sizeof(*pctrl->communities));
+
 	pctrl->dev = dev;
 	pctrl->soc = soc_data;
 
-	pctrl->ncommunities = pctrl->soc->ncommunities;
-	pctrl->communities = devm_kmemdup_array(dev, pctrl->soc->communities, pctrl->ncommunities,
-						sizeof(*pctrl->soc->communities), GFP_KERNEL);
-	if (!pctrl->communities)
-		return -ENOMEM;
-
 	community = &pctrl->communities[0];
 	community->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(community->regs))
diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 97bf5ec78db4..635e4e5ab10c 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1581,24 +1581,17 @@ int intel_pinctrl_probe(struct platform_device *pdev,
 	struct intel_pinctrl *pctrl;
 	int i, ret, irq;
 
-	pctrl = devm_kzalloc(dev, sizeof(*pctrl), GFP_KERNEL);
+	pctrl = devm_kzalloc(dev, struct_size(pctrl, communities, soc_data->ncommunities), GFP_KERNEL);
 	if (!pctrl)
 		return -ENOMEM;
 
+	pctrl->ncommunities = soc_data->ncommunities;
+	memcpy(pctrl->communities, soc_data->communities, soc_data->ncommunities * sizeof(*pctrl->communities));
+
 	pctrl->dev = dev;
 	pctrl->soc = soc_data;
 	raw_spin_lock_init(&pctrl->lock);
 
-	/*
-	 * Make a copy of the communities which we can use to hold pointers
-	 * to the registers.
-	 */
-	pctrl->ncommunities = pctrl->soc->ncommunities;
-	pctrl->communities = devm_kmemdup_array(dev, pctrl->soc->communities, pctrl->ncommunities,
-						sizeof(*pctrl->soc->communities), GFP_KERNEL);
-	if (!pctrl->communities)
-		return -ENOMEM;
-
 	for (i = 0; i < pctrl->ncommunities; i++) {
 		struct intel_community *community = &pctrl->communities[i];
 		unsigned short capability_offset[6];
diff --git a/drivers/pinctrl/intel/pinctrl-intel.h b/drivers/pinctrl/intel/pinctrl-intel.h
index b5476b9de0db..c382fe8f08c2 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.h
+++ b/drivers/pinctrl/intel/pinctrl-intel.h
@@ -260,10 +260,10 @@ struct intel_pinctrl {
 	struct pinctrl_dev *pctldev;
 	struct gpio_chip chip;
 	const struct intel_pinctrl_soc_data *soc;
-	struct intel_community *communities;
 	size_t ncommunities;
 	struct intel_pinctrl_context context;
 	int irq;
+	struct intel_community communities[] __counted_by(ncommunities);
 };
 
 int intel_pinctrl_probe(struct platform_device *pdev,
diff --git a/drivers/pinctrl/intel/pinctrl-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
index 299ee4f22bdc..b3cde7afded9 100644
--- a/drivers/pinctrl/intel/pinctrl-lynxpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
@@ -715,19 +715,14 @@ static int lp_gpio_probe(struct platform_device *pdev)
 	if (!soc)
 		return -ENODEV;
 
-	lg = devm_kzalloc(dev, sizeof(*lg), GFP_KERNEL);
+	lg = devm_kzalloc(dev, struct_size(lg, communities, soc->ncommunities), GFP_KERNEL);
 	if (!lg)
 		return -ENOMEM;
 
+	lg->ncommunities = soc->ncommunities;
 	lg->dev = dev;
 	lg->soc = soc;
 
-	lg->ncommunities = lg->soc->ncommunities;
-	lg->communities = devm_kcalloc(dev, lg->ncommunities,
-				       sizeof(*lg->communities), GFP_KERNEL);
-	if (!lg->communities)
-		return -ENOMEM;
-
 	lg->pctldesc           = lptlp_pinctrl_desc;
 	lg->pctldesc.name      = dev_name(dev);
 	lg->pctldesc.pins      = lg->soc->pins;
-- 
2.53.0


