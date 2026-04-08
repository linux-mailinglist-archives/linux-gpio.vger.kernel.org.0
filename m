Return-Path: <linux-gpio+bounces-34903-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDYnKufW1mmHJAgAu9opvQ
	(envelope-from <linux-gpio+bounces-34903-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 00:29:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 298DF3C483A
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 00:29:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A0D4300DD73
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Apr 2026 22:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 677CC3A256E;
	Wed,  8 Apr 2026 22:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="px6Pkjfu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A71638C2A4
	for <linux-gpio@vger.kernel.org>; Wed,  8 Apr 2026 22:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775687395; cv=none; b=SbBRsMmytILTTAgwFWB37OWxdN2xv5wo70txqFI2i5KIJA0YlqPNYkTQcVUAOn4mPPETsAFz7XQei2JAXfYTBdKEz7VcdmbZKIssrgNHEFXgsmo8NBwG4NmGUFzGPoLOWNkyHg/uLwofgSLLAWNdlRQIVrmLARUXxgb4MMxOsHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775687395; c=relaxed/simple;
	bh=prwd17M7JxELofGYoEJJNZIQU7RumAbcrI8O831MYvc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fImTNuAJLAroec6hzJLCwEH8qoRVWRfEjOm6Oep+7Fds2R/46sUJovyCu08pBKggitcFM7R8NeemY8bafTc58/N19dmtntGCbqp7HXmp/hKvJUM2KpMdArt0xc6dA8fl8jxEgC+ELj3yJuWFjU3nW14In8eoOJpqgIJJE2vtqmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=px6Pkjfu; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-50b2ebca625so1761361cf.0
        for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2026 15:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775687393; x=1776292193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qeg7SYz5U5slZCh/riNwU6KseeGH/B83E/l64VPEeX0=;
        b=px6PkjfuYxDAb1/fmM5dugSXGo2AomFEOmQ3oxaxm9g01qf3c0PcoDI4hNp2JLUtpw
         gMXqMfRlPmIYhwQQ7ZXnVcFcu45o1S5yzkKUBY8kcOgUbiHoDJ7qJGZhmqr0pk0yqo6M
         Jn3Lp4xAdN6gNJ2NSMsnp5/ucfMM3lMu1LjBbbj6Am9jZfVjNFwsb3ReB0Nk84zuhzHu
         lpuF48HT1TVKpEMY7X7VxBEIi4TINMsUClGtU3NeWxKkrX8ZLDhvFkK8ChfXBDxAQOFS
         NvM7jIBExYk3SPFh/PdcVZqi/GTEaeTgrej396gAwUUMBrL0NQcQqjvLInQhrxF/pzqk
         An4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775687393; x=1776292193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qeg7SYz5U5slZCh/riNwU6KseeGH/B83E/l64VPEeX0=;
        b=odu/tD50o96H9c/HaDeeAmpAMt6SEUFhRFAMia3AQ8u6w58GurLXSg8WOg8YYED8+1
         VSObMZZ0lDlOYE/6KGaTyYf9h81oyo6L16ofOuPP3J/ud1pnG0PtauT3GQVbtYm5Y2j7
         2W3GgAYYljUKd/aRxcNwLEb1R6UYVylUrs6L+GNUan1eeJkrUkRlBdSYTDX0YASYP4Ww
         hTAYrURK6Syb2I6SCuGOM1UdvISKbZLVnaI40kt5B+P56fjbCodo38XUAavVoDNItTz8
         Q6sJCtQMLEfFQOpOywOxybbpvmiWyGhbB+yRHE3S5U9Vzm7P83h9w9QKI4P6k0XCZGCK
         pPmw==
X-Forwarded-Encrypted: i=1; AJvYcCVbm/jPI68Ue6GdRBu2yk76w+2MDSpw8hkimeULGs6Cp+op33GkIsSwT2LLuBTUNUYrBFfbld85kBY1@vger.kernel.org
X-Gm-Message-State: AOJu0YysTgFsTZx7jkUupNxVnW+vDQ8dhqkYudTUm44T0TQDpsfZt2kM
	YHqzvVzm+0z3uHp+3uDqGg5qwu9zTng0nYpqJf2O4nb9PvUtmEoXc4h3
X-Gm-Gg: AeBDievWMg7jSnc4c1uKFtCYWJBL8+SfEpPUHsh8WKE5Rm1ko/9SEp3WM/IJUhv9vKg
	spO1nasN88bVlpHcFBijX3R5VVLvt/H9v7dKZPlYfwyXf4dWfukIWvVzSfOpuOhazniojXsJ3Qc
	VOO74V2WnYaZnMd9TW+FZRLe6hf2xHa00LwPrbZaxBSrk7k1lHYdF97SH6VcwOwI3H3jUm1hGxm
	3PiGK0zb9bC1ZeGWF3jXx11OJ46dSk73QsIh3+jrpgWi0rg/ljrfh9T9d/DB72WaqPyMspV3xFN
	cVFLxEnKMZZlxxjMJCQT6znmQtuJ/WDGBYyzN3lrtdWPIrJR53sc3k4rMmVDcjRHdtziDAh3L/h
	iKjWzfNRSltodKeqLgYLlNWXMZz8aGRXwk/EK26eAlRWhmTt3mc0PrYh/Nji41TQ060FiJbh8Yx
	0KDPcX+evobALtQFs9vFxuuiKgswN5uDIxB1LC4IwaXLiZSEzOJw+QFIyWQQsFK8eUN2/w+6ZAR
	BahTSLQYiFjyLI=
X-Received: by 2002:ac8:588e:0:b0:50d:a682:2c6b with SMTP id d75a77b69052e-50dc183ecddmr19680501cf.0.1775687392984;
        Wed, 08 Apr 2026 15:29:52 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50d4b93dd10sm171255511cf.7.2026.04.08.15.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 15:29:51 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH] pinctrl: qcom: sdm670-lpass-lpi: label variables as static
Date: Wed,  8 Apr 2026 18:30:38 -0400
Message-ID: <20260408223038.52264-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-34903-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 298DF3C483A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

These variables are local to the driver and have no need to be exported
to the global namespace. Label them as static to fix compiler warnings.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202604080950.Mvm8aN0a-lkp@intel.com/
Fixes: 9826035a75da ("pinctrl: qcom: add sdm670 lpi tlmm")
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c
index 6270c6d09c22..858146c408d0 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c
@@ -80,7 +80,7 @@ static const char * const pdm_sync_groups[] = { "gpio19" };
 static const char * const pdm_tx_groups[] = { "gpio20" };
 static const char * const slimbus_clk_groups[] = { "gpio18" };
 
-const struct lpi_pingroup sdm670_lpi_pinctrl_groups[] = {
+static const struct lpi_pingroup sdm670_lpi_pinctrl_groups[] = {
 	LPI_PINGROUP(0, LPI_NO_SLEW, _, _, _, _),
 	LPI_PINGROUP(1, LPI_NO_SLEW, _, _, _, _),
 	LPI_PINGROUP(2, LPI_NO_SLEW, _, _, _, _),
@@ -115,7 +115,7 @@ const struct lpi_pingroup sdm670_lpi_pinctrl_groups[] = {
 	LPI_PINGROUP(31, LPI_NO_SLEW, _, _, _, _),
 };
 
-const struct lpi_function sdm670_lpi_pinctrl_functions[] = {
+static const struct lpi_function sdm670_lpi_pinctrl_functions[] = {
 	LPI_FUNCTION(comp_rx),
 	LPI_FUNCTION(dmic1_clk),
 	LPI_FUNCTION(dmic1_data),
-- 
2.53.0


