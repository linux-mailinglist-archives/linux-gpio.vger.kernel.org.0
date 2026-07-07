Return-Path: <linux-gpio+bounces-39617-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CcILOYOLTWq11wEAu9opvQ
	(envelope-from <linux-gpio+bounces-39617-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 01:28:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F7072066A
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 01:28:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Iv7PKR7N;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39617-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39617-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A9B66300AD6A
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 23:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D4F436A370;
	Tue,  7 Jul 2026 23:27:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3364378823
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 23:27:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783466865; cv=none; b=rkkHQ1azTTiaH7nLmIGgrk2EzuzeF65/2f6gph2+FCdVaJWt5JTCx2czqibGhtKtudISEQwwciOoaf/1WsZWpSwKwzXbwWbwywx9XmURw6lxCNoe5UIClZMz6bm9NLQFRZa8+DBi1P/SjPoyBaxqg+PHHKSnRi1O7dhGEQhd9+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783466865; c=relaxed/simple;
	bh=AuPR1uwOLUSQFwjcJJ4K3th8KBDVPHrpowVtJO4Vpg0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AjHpklfD2Mg71oCJJp2Vsq1F+EFwDwcMIhzPd/5xHCljizysrlWWgrVB9grX4fBJlGMC5Ltqhv5Klr3R7iFOk8wz82TwAXsjAHRCUyB0+NagQ1v7rN6kikzra7nx2pRM3w0rFuEPhMKDQXs4zx/yculQWCaWKddNP5CcmKi3r2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iv7PKR7N; arc=none smtp.client-ip=209.85.216.48
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-381891a9525so105603a91.3
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2026 16:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783466864; x=1784071664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0MuI3fNAXQLRgr1KIzV4kPib8genOMI7jMqph3Gw2/g=;
        b=Iv7PKR7NsfOsUcpeRAhd5u1kTKKmaEoBAakNdoUkh4awB1nb4BJI0/jjax/DUCzOO2
         xMpg3rDxWLq2ExAYLCGkABuMuv3SeLUpFm6xUkG6QA4Hn1N3OaBGWXl6FujP+jmk0SBO
         PBZGAS3UUe0HIkoWUXdBFJwgfz0LQV7c8UWzAtzyHFaL3fLcPBQkJH746LGZXzTbgzlP
         0aLmpfBmHqRkfqcKE9o7RkcwU+fCYxrMqfvqsQADH0/JcehTNk3SVpua76PMJe763pyH
         c+iXM0pKBMiFqQ/Zzu7bWRb3g8KnMFylW5CcpX7e4XEXEXKK1y7vaabPrhDZ5866lccH
         u5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783466864; x=1784071664;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0MuI3fNAXQLRgr1KIzV4kPib8genOMI7jMqph3Gw2/g=;
        b=sQmB3XFwkV4xSrZiBZZdh1I3ipEJuZgq7gBR3PkH9BN3dm+VlPUZ8JEbba95I1SnFP
         e6LpbMYUYgYI7qyyh8TKN3rl1HvdRCadQTk/me8JtZR4JV+xGLA+2+aSSaVxkDcrQ5LE
         DrscC9r9RhmNz5fEhkuThjppJrlpkUbbER9In3WzXVei4va2qJS2HCtQNc/D53sOTFCt
         BRyUx02jO49+NNWmcnAEAbPC9I8GdB7dSsXu0uzJBHKjO6V3jBk0V7ALW4RNKDixKjjd
         H/sSmbYX5qSFVG/b58APUmHiaoeQ+KBznntdB/z6Hq0vNBjS173jvWAcV/3ziOos3DN2
         A+dw==
X-Gm-Message-State: AOJu0YwM9Y+Q18mAFv+x75OzvuWw5bdGXaQYs7nfxOMtW87Rc91WnxsK
	3ugHdL3NTUSNGZV27Wc9qNyvznVBfuE8JjEnso9Qg02v0a5B1ZyyAHxEvKPvf4i4
X-Gm-Gg: AfdE7ckzLH+FvhyG3GtwWXs/TLp4tIUJkgBixdRWjqsRGcVz8ZyGs3KBYU53bwqnqh/
	jU7jlklbPmjMBNLVoTm/EifswV3SgyRw+WrJwUvMz1SmnhLsqgq+thNthRGRpdwdqJocT25WYH1
	cRp/cMBvDD9BvZMbxKlffVIGr7Duh4wFQtf/v4PXPEMaM+UKZ9BqqNxB0yETgkIo8SEoVVn3hC9
	E7YOEBTreHRAvi/JkgLhgOgk2s2cQg0goOd7VLULMg/vr3YTWce01Ka1lerGX9X5+H98LjeDt+P
	JvnSgBrwYCCx8jx2rd0vtvo8tE4vXpCgjpE//JW1wj/+F/3YhhXRuGCzaia779hOWP3/9NFmSes
	CTmJACG88xLLtXYKG8dV0CUunThuXeuOpUuJwj4OifB5xoovzJPnfLdEkb+HLBi8oqMajLYlkAD
	mJF4jZ/Y10YvxBUGbcLFbfl+IS/FTaYoIdhU9rvPGG+Mga+Vrj1RlS/rRB6rE62esrdJKsxrSza
	6tady2bIw==
X-Received: by 2002:a17:90b:1809:b0:37f:9ce1:7366 with SMTP id 98e67ed59e1d1-389412059eamr1985a91.28.1783466864063;
        Tue, 07 Jul 2026 16:27:44 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm1847392a91.13.2026.07.07.16.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 16:27:43 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jason Cooper <jason@lakedaemon.net>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] gpio: mvebu: validate ngpios before use
Date: Tue,  7 Jul 2026 16:27:42 -0700
Message-ID: <20260707232742.1235008-1-rosenp@gmail.com>
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39617-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:jason@lakedaemon.net,m:thomas.petazzoni@free-electrons.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D8F7072066A

If ngpios is read as 0 from device tree, it is passed via
irq_alloc_domain_generic_chips() as irqs_per_chip, which leads to a
division by zero in DIV_ROUND_UP(d->revmap_size, irqs_per_chip).
Reject ngpios == 0 early.

Fixes: fefe7b0923459 ("gpio: introduce gpio-mvebu driver for Marvell SoCs")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-mvebu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 39c1a13e1b65..c7cbfbfb4800 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -1175,6 +1175,11 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	if (!ngpios) {
+		dev_err(&pdev->dev, "ngpios must be greater than 0\n");
+		return -EINVAL;
+	}
+
 	id = of_alias_get_id(pdev->dev.of_node, "gpio");
 	if (id < 0) {
 		dev_err(&pdev->dev, "Couldn't get OF id\n");
-- 
2.55.0


