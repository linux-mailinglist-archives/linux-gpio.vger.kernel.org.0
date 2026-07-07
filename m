Return-Path: <linux-gpio+bounces-39615-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pxVtOpOKTWp/1wEAu9opvQ
	(envelope-from <linux-gpio+bounces-39615-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 01:24:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD7D720622
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 01:24:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=MZWIKed1;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39615-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39615-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A84283016B4B
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 23:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBE64368974;
	Tue,  7 Jul 2026 23:24:01 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B3842087C
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 23:24:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783466641; cv=none; b=mIIzngXuFxzhe6FGCpfBGx38ExcrHIlifTTQC020PT9JaISIbRaI0xYfq/LzeJiLYyNDKhDv1hdKK8KlFASP4mw4Aa0txDAXBfRr2JpiqxUm4tF+dzLCcS5O4NAEmq7UYMB4+w5wfIsNP3bJn7zZuPl/GtTi4c5GY799t2h819Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783466641; c=relaxed/simple;
	bh=O8RUI3PeA1zX5vPg5HwjRc3zQRdZQsQ8gf1yXQcRUD4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VVMNezFkB4JyyzoAMnNnELGKiakgrBXY0ghyI9hj2mVaw9Yom0Z0kb//npFYPK5tHlO+p+Uo6BwoY3XPP1HvoZfMAI88bQ+3s/oHNCm4KL0aTl/8uEkVaqcb+qhNkjluOO0YPIpIujrSdMV+xtg3YwkZ8U9kpshLMjIdBVp8DKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZWIKed1; arc=none smtp.client-ip=209.85.216.43
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3811074a8c5so71596a91.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2026 16:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783466640; x=1784071440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9j9s4Krh8OrKXE7+UXKvWyst4xAiOuuO5xvtyfHHjXY=;
        b=MZWIKed1E8YQXU/ZPo8zjUDdVIaPOZfzdhTAPDQlC0nnT5rWobTdWTjv0yJPyG3z6g
         B/75BRzrMpy6g0LSlr4Pguui5HCM0ViUpuYU4Lhd6d2Ll2xwUGoqGDyf7dJJ/4bCSijM
         RZZ9U1K1FQa1/FyggPgBkCRdFUPE7PkuKF08P5ibLG9aBMYeuPB/PdnMMwwJRdcveRHx
         0nM2fcJGwK4Oyhi96i5o6ZpKy3JfHTjIGDHq0mCHVu04PLPk1RhP3Xq+szfu5QDlScTr
         8MWMW3by24hkf4YZwXsOkaoMCSI6yWMjNhvvKfok+by53dhovcgUUeqDOac5mIh9IrZu
         fmmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783466640; x=1784071440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9j9s4Krh8OrKXE7+UXKvWyst4xAiOuuO5xvtyfHHjXY=;
        b=HVoOBLAH6ZIDAlmIyURVRxvxYDZ0SA10vY1xRwR/qf4M6d4hKxL4SejuQl2ugW1126
         LcF0a9npSEMXWiiANHn3Chy2nDG2KvFY//7YIQvlAsD3dKACsYrIMRvAeyOk+V3z5Io+
         lWflQ/YYX+x0tPczU1e6wyt4x+9405fZK3jb5q21YdHqWAfG/aXxYd0koWo0+qOAhmsX
         x6dgm42xTbCqoFMRChj4GOtqJWHQvdXuRN8Hoymnf5zUqsMn2mCwVwyT681jGvMDQGeu
         +sg0vKh3wbufCqb6UE7+/jOpsEd6iA8a8cs5LH9yHcaHf/EXsuEQNlSHMFEDEppRNWej
         Fy7Q==
X-Gm-Message-State: AOJu0Yz6ZgN3bfM0lAScqIECSyMkKw4JqC/92EMGRZpZ+36mxNn2MBQO
	DMQT4o70daf4+NvCFNG3y/Ea1nUne49yHQkZFLKlmPGWb6AkvcJVc3bXsIi9/XW7
X-Gm-Gg: AfdE7clTA0b72xlyjfA6GrdF9o1HdU3557Viz1E05yEbWZ23bz+APYtQdx/agEEe80X
	9X0li+NuVh8D0VOygacVf2Hy0OV9WaC32u6kimSh1SpQgmaryDJ2nVaSdehVSuMSja6jVkWoiZI
	8qONp78PMeldbFLjFkaWkE+0ORRYibbptziWpIpkH/9mfddE8Ftao7MXsSJTckOyAg0Ehf6djF1
	aG03EHo4X6V6EAAT6UB1kXIfQ4IgEqp9JL3x/2XH3zXOMh7M8jxYqJK9oGBqpmhfhGZS7HD0QXo
	sf1Yex5SNMbiUotqnYSMln4kjPav02k1tk84BjiDMKV5OlS9dJCg2Ob/j8EXyXXzIOmP5VPVMRN
	BGZxbSL6ci8n8d7mFlmXPPTPZJZWQnWTDHbBp156d8xWlEzlqmLzvNFu61O0LD2ST5e9j5K0OQM
	gLqMlCiUGHqjAF5+B3KTb+o3pHnp1z+gNDV7bbmStN4FEfiiOEN9GC/suHkEXBrTnGlY6BDySxf
	8rMH+9QQk6k7jebhRRe
X-Received: by 2002:a17:90b:3d8f:b0:37f:eaf9:4682 with SMTP id 98e67ed59e1d1-3893ff60f22mr4210a91.14.1783466639843;
        Tue, 07 Jul 2026 16:23:59 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d3c675b1sm1754966a91.15.2026.07.07.16.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 16:23:59 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] gpio: mvebu: free generic chips on unbind
Date: Tue,  7 Jul 2026 16:23:58 -0700
Message-ID: <20260707232358.1218077-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-39615-lists,linux-gpio=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:jgg@ziepe.ca,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5AD7D720622

irq_alloc_domain_generic_chips() allocates generic chip data that must
be freed via irq_domain_remove_generic_chips(). The devres action
mvebu_gpio_remove_irq_domain() only called irq_domain_remove(), which
only frees the generic chips if IRQ_DOMAIN_FLAG_DESTROY_GC is set.
Call irq_domain_remove_generic_chips() explicitly before
irq_domain_remove() instead.

Fixes: 812d47889a8e ("gpio/mvebu: Use irq_domain_add_linear")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-mvebu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 93568bc78437..236dd2d91d3e 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -1139,6 +1139,7 @@ static void mvebu_gpio_remove_irq_domain(void *data)
 {
 	struct irq_domain *domain = data;
 
+	irq_domain_remove_generic_chips(domain);
 	irq_domain_remove(domain);
 }
 
-- 
2.55.0


