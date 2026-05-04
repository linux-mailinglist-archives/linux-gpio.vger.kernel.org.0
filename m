Return-Path: <linux-gpio+bounces-36021-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKzYCg1R+GmQsQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36021-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 09:55:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F4E4B9B41
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 09:55:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B4B373004F33
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 07:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 469BD2D7DCE;
	Mon,  4 May 2026 07:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E29aocr2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FADC30595C
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 07:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777881352; cv=none; b=SkwSlgUDxTqxS4P1UxcjtZvl+vF9b+8VdbKHfgdov0+ZFOFQf3R0IAvpoGtTAjpC52EQX+1Bwz8tdskbWmUBzw5/8T90q362ICb3+UzxZEQFR7padq2ewQF/17CDEhfRAQ2OAZqHKO38sLd+1fFRFOvKm8kmqoAmr+y/9JzPvc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777881352; c=relaxed/simple;
	bh=dCVQgRHFcTbGgiHoD6wqZ1Z8fhCxT95GCkwijb1fhMM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W975JYw+HYfuex3eKsb1p/tA+VITFJkCrpQduI83Tm0cWpjfxgDDcocHe2ge0U7RSLngse3FxPBbymVRO3VeL3A6kqooDSa4oOYOFsrmOSia1SiR6TwPDqXQWRsah2KHxc5jIiuviC0pIDfE58dRnzPeMnDqEmUmaZRnlIMhtiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E29aocr2; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2b788a98557so31809995ad.2
        for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 00:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777881348; x=1778486148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tOkfISWp3zKt6MhbV91AmgDxPSReCWlbub1B9xCSCNk=;
        b=E29aocr2ROCduS3yzEtABYNhf1szJET1LmVNrElFMyiz336vWfzDk5KsOwT5TgGby+
         IWhk9xB1KjiS7JizjWvcfZQUbcymJsOGkouMa6iSEaWVeJfVo8a+N5+utleus3jDMj4p
         Nadd+U167aZoNzaBeXf3CopJYbvnDRmjOjkZvOsIBB3/6FstbCHB7uW9gBHW+ofOShms
         a0p4jqARrhcSeReAtn8pW9RrZga3pxnSb88g8ZZoojYYjtFZq1dXk4UIDh14EiNswMzc
         v5PiGUQ1zlG+QAKGWZwwiZXk9g08Pu0XzgGsLurqA62VyEqR8+sgHhnNOtE8QBumlD+X
         eLJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777881348; x=1778486148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tOkfISWp3zKt6MhbV91AmgDxPSReCWlbub1B9xCSCNk=;
        b=V97muXnH7Sw3JlX3GFQUs3uWb/8ZAHEFhwLsfJHgSnJKlCZvwpAbdzQpSX4kn5BWRE
         Vth9NHwPovtSuQEgzXonZevhAW/NZOCULpCI2cbWrCCJaYbFKt1DIIahHQ3slwm+oWq0
         uX8ueiS5vCZcFuf73zeu2UBgexYgJexIvcUVA5WsUQgRdtkDDWfseC0YjzPOpQ8U43TK
         wS+oO+ecEOK5Z3WE9GxIPit7uRH/ldrmxJTvez+D5v0IKySqDK9NPa2U0MWz4PCtZK/d
         H6vmryxdq1cGzS5DVv5cJV7512lgVmSRQ7pGdanjA21XUmr5oq52vs/PTHn2RL4cBtVV
         KuAw==
X-Gm-Message-State: AOJu0Yx5eU7rmfO+J3Zp98LScfhrZkqfR4gMIVVbj9cBW8N1PsY4VH2z
	gvW/9/WdSsH8sSV+1fwBOkjm30dtgiXSAPRZk2IK3RJfQgBTESNDlTX0QqRfdA==
X-Gm-Gg: AeBDietes5NC+mSaXe3ALYKbnGJwq31HpfTTOtbr4iN3pCvEssj/kndm4Bljaoz+GM2
	mlIWtzDBHGlATn0P081nDl9FkTnPJozNnchm+HAaZWYTbIBlq5qE1DGgdTceK4EM7Ac39Kkcm/A
	Uap8sgdo/ZL4V1732Ij8hXqq4gVgn7azV+kiWCFQ8aBmbekJH9vrtHru4CnvyXUPMc7/maOzIr9
	GFmO0cGvvulXJIWPepnFk63URZRwbdwwJVqgHYy94urwFbGaDgHbM6zDXCGugcb9jLtzmg7W2zS
	tDAl4CufEofj+rowsomvCYtLdlR5PESLGe+V70lPRLV+Uwo0BpQD632ss1hyKtpmQNNo0ZMtTus
	zie0IOQL/yMuxeyJo1ugoc2MbRJvk8sZFUb/lEmN3NAspFeU6WLO9t45t0aEd10Qx1c/BYwKmij
	/bF6qPhlr8FYvOl0oI6p19LX/gnQ==
X-Received: by 2002:a17:903:3887:b0:2b4:6022:bf8c with SMTP id d9443c01a7336-2b9f260b140mr83710155ad.22.1777881347662;
        Mon, 04 May 2026 00:55:47 -0700 (PDT)
Received: from 007.. ([59.66.153.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae0f67esm99898255ad.51.2026.05.04.00.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 00:55:47 -0700 (PDT)
From: Zhang Xiaolei <zxl434815272@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	warthog618@gmail.com,
	linux-kernel@vger.kernel.org,
	Zhang Xiaolei <zxl434815272@gmail.com>
Subject: [PATCH v2 2/3] tools: gpio: validate arguments in gpiotools_request_line
Date: Mon,  4 May 2026 15:50:35 +0800
Message-Id: <20260504075036.12190-2-zxl434815272@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260504075036.12190-1-zxl434815272@gmail.com>
References: <20260503190016.13439-1-zxl434815272@gmail.com>
 <20260504075036.12190-1-zxl434815272@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B8F4E4B9B41
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-36021-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zxl434815272@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Add validation for input pointers and number of lines.

Signed-off-by: Zhang Xiaolei <zxl434815272@gmail.com>
---
 tools/gpio/gpio-utils.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/gpio/gpio-utils.c b/tools/gpio/gpio-utils.c
index 176bccfcccb0..930a38fe7911 100644
--- a/tools/gpio/gpio-utils.c
+++ b/tools/gpio/gpio-utils.c
@@ -65,6 +65,12 @@ int gpiotools_request_line(const char *device_name, unsigned int *lines,
 	int i;
 	int ret;
 
+	if (!device_name || !lines || !config || !consumer || !num_lines)
+		return -EINVAL;
+
+	if (num_lines > GPIO_V2_LINES_MAX)
+		return -EINVAL;
+
 	ret = asprintf(&chrdev_name, "/dev/%s", device_name);
 	if (ret < 0)
 		return -ENOMEM;
-- 
2.34.1


