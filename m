Return-Path: <linux-gpio+bounces-33656-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIQ6JcZzuWm8EgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33656-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 16:31:18 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 147222AD14A
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 16:31:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 133C4304D16D
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 15:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE6C722A817;
	Tue, 17 Mar 2026 15:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nnZr5r/e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832273EAC98
	for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 15:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773761316; cv=none; b=o56f2Pfnd+EBKikUnObq7LGlPsDYBditk5l1ZsSXEHon/UXoh1FhTN+e/dk/suyIceOy2l9yzi2Gvp7eSjyO6g//UcMNy4qTFqd8uXVjt5izp9GioQd/Q6qgIGxP109Q/MrplLTQvDJ57M35TeJplrYBFW0awYswsqCv1HgPDtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773761316; c=relaxed/simple;
	bh=MzjNtUfyyXDy9rsAiv5Ph6MOEVlWEvAVArTUZ9AKnMY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PhbV5LmTO0JpOsZ6MYo99kMvaSbgfFM1OalmWyc6kOQEYdRErNM7k3TN2cap9Es1ZkoGf4CTNq1QpeGZYEQRODB5C5eTa3CkV36w3Rpb+UFQTZzyB4igJ4ZPjUhvsX+gX9+4IB1EgwNqrNl2bra/LHkO459Y87p9mV9HUwFCV/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nnZr5r/e; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a9296b3926so47687135ad.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 08:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773761315; x=1774366115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r0RfajJWwZmTYBapOkDrRSM6JA1jpPzYsQwAyl/wAZs=;
        b=nnZr5r/enNmbJ8aFOaDp8MjZpACqOWZxl2WXzZ+efDIwipHSMT8xMXzvQusJJGURam
         zta5hf4kz2neTNQ6tb5XsgWFpTmpLikPJ4JBrpa+ZpSz+6ATR4AjNjROZiGUKX9oRrsQ
         iwLHJuNXKDwG2lW7W3Dq8rXsLYMzMLL5kqfxaxCG4HRubmhvvbBaHROK6pxXB3l09GP4
         v0CzGxo8AwOEVJyr3p5ZRFtoWzECrt7IwUYdgdovGCwlIaXXfogCmUHxAGMUltHQvDzN
         Ddo2a+pk3e5nKu/cMpKP/HeEZUhPHKwJW0LtvsdFQEYY5qkPczKIK59OpOW3Lv+BrzWq
         m92w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773761315; x=1774366115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r0RfajJWwZmTYBapOkDrRSM6JA1jpPzYsQwAyl/wAZs=;
        b=KYtuQLLdvYbtvFRfH4LkP4heBz3N6gENgi6xxQTu7x0J32X40r5KYuCV5XXP4PTLKC
         5hpNu/3ow+nIjVUpu6Gl0JTsdphnrYHyC1pNMUDZLMXygxudjssAWqspycg+3MJe2ZEs
         nKmtSO8327iOa/5dq7Qz9xu9i6NMRLTJciwc+1QihJt/EG/Itkt6EcLJUw5OjSPUA6Qo
         doNuM2Tyg3wasNrCB/dBaBCsQK/AYXm1D4ZvYyoIKd1kvqJCoTFMQSZayfrvbnbmyUbR
         WcHpCFEPunh8rbF3vse3KQzFunQ1XzGkK/DWHtjyD9yq+LeRQIJNfUiET2OaqQoftX6t
         PfMg==
X-Forwarded-Encrypted: i=1; AJvYcCUWx5VATqYM7op/TT59WLY+1WuFVoTlb6Q/a5BTybNYUSku4FdMFJ7VoNkiDaHpxd4F/JK4tyfEjOet@vger.kernel.org
X-Gm-Message-State: AOJu0YxkeACeqVTgGwzVZLNmyh/+jGEGkg9T++2y+Qd8MerZiOxoriQm
	kmxIV5dGLMGcRRoJj/ORU4mb6qOcRB3vgy5TtOWwU7C4um9hPZ1GW7rJfY17WxIT
X-Gm-Gg: ATEYQzxaH5HlN1Edy7o4HyqTAw753Cw3S67sNmg/CqkKZqiSRJNvasbZn6nK2VXy3K5
	pQ4ekmVZ0lOPtQUfc1770I7DceCX1Qvjg+Jeqb7iNiLGI1tij3w5DUlGdpioIRV4FA2gCZgGKa3
	SXBQrTcTLSWGhISIVps5oenjDjI/1Tw/N9WMIAwrEyHj0FdiAPkuuQLRFedAbEfsFqzvTlMe4yi
	+H8OZ4Zsc8uIA8EiU+iwfbO4mI6R4L4UPc9sUGkNx6I2GtmQSUh2sDnTft3XUKbo+KqIydao8w0
	ahSRwpOfg2TPq96LxD+wK+H6g80t1bGCI5EDgm24qc/MOCt4eJW42bLasH6RSnLpbWwgcNxvUiY
	MV8jY+Z5P4vHP7UORHdQZ+JbqzgZ9hr4ZtXG3tbwxmkMseUMzHG9sgx0H6UD/yz7Dgm8eXASjMk
	nY0GQWKGbOYVXQWfIzFfQTIwYOWcOSmd/+Cy8d2RMHVlLHrSOCNJppPjh46MM6BUHSuKEPaw==
X-Received: by 2002:a17:902:ea0f:b0:2b0:6323:1739 with SMTP id d9443c01a7336-2b063231bc0mr44454175ad.41.1773761314768;
        Tue, 17 Mar 2026 08:28:34 -0700 (PDT)
Received: from localhost.localdomain (61-230-23-18.dynamic-ip.hinet.net. [61.230.23.18])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0542909d8sm105242455ad.31.2026.03.17.08.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 08:28:34 -0700 (PDT)
From: Yu-Chun Lin <eleanor15x@gmail.com>
To: linus.walleij@linaro.org,
	matt.porter@linaro.org,
	syin@broadcom.com,
	laurent.pinchart@ideasonboard.com,
	csd@broadcom.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	visitorckw@gmail.com,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH] pinctrl: abx500: Fix type of 'argument' variable
Date: Tue, 17 Mar 2026 23:27:51 +0800
Message-Id: <20260317152751.21210-1-eleanor15x@gmail.com>
X-Mailer: git-send-email 2.34.1
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-33656-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eleanor15x@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 147222AD14A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The argument variable is assigned the return value of
pinconf_to_config_argument(), which returns a u32. Change its type from
enum pin_config_param to unsigned int to correctly store the configuration
argument.

Fixes: 03b054e9696c ("pinctrl: Pass all configs to driver on pin_config_set()")
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
---
 drivers/pinctrl/nomadik/pinctrl-abx500.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-abx500.c b/drivers/pinctrl/nomadik/pinctrl-abx500.c
index 8cd4ba5cf0bd..6650d3912acc 100644
--- a/drivers/pinctrl/nomadik/pinctrl-abx500.c
+++ b/drivers/pinctrl/nomadik/pinctrl-abx500.c
@@ -856,7 +856,7 @@ static int abx500_pin_config_set(struct pinctrl_dev *pctldev,
 	int ret = -EINVAL;
 	int i;
 	enum pin_config_param param;
-	enum pin_config_param argument;
+	u32 argument;
 
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
-- 
2.34.1


