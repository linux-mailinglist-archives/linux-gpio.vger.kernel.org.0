Return-Path: <linux-gpio+bounces-37535-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPlBHfiPFWohWgcAu9opvQ
	(envelope-from <linux-gpio+bounces-37535-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 14:20:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7B55D5711
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 14:20:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D12813027305
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 12:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D88AA3F9F2F;
	Tue, 26 May 2026 12:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gapp-nthu-edu-tw.20251104.gappssmtp.com header.i=@gapp-nthu-edu-tw.20251104.gappssmtp.com header.b="L9pSo6B9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1823F8EDB
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 12:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779797981; cv=none; b=XwUhmFYxFZPV1tpD8QnGuRF33flrBx+0FTj3QhZc2RQCiBYZpuO7SOMawar7BktdsA9RzAqfJIPOiZUINlqwP+XpaOfdv5mOEPnZ44mIjK1Lx/AVS8rg2NbUPcMUscUc1YuD45dh05364UfqYBeeKhZePoLYN0SPOEBIzrpSPNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779797981; c=relaxed/simple;
	bh=l33H8jeplfwI2v4aEzHDB76Rs38QZmGJZDaqs83VQZc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dz0eeQWmTo4s1Zulnntdu0gJXNgpYMOvsPg0LF4BdWebrfFJGYfV6u6CTLK/ZgleUE6++Q56ELSPCa1d/M+pUzaEJDYfPg3oStOhVFMUVrMB04M17DqjAxhxL6hpCOeEjiBNBEMP7AeZ09vSeN+ozK33JPsK0aaNa79d0U2bY6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gapp.nthu.edu.tw; spf=pass smtp.mailfrom=gapp.nthu.edu.tw; dkim=pass (2048-bit key) header.d=gapp-nthu-edu-tw.20251104.gappssmtp.com header.i=@gapp-nthu-edu-tw.20251104.gappssmtp.com header.b=L9pSo6B9; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gapp.nthu.edu.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gapp.nthu.edu.tw
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ba856db1c0so77053115ad.3
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 05:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gapp-nthu-edu-tw.20251104.gappssmtp.com; s=20251104; t=1779797978; x=1780402778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nNjc6hdeP19AY8GeuH3uphO5Ltq9yMQpHpBo9KrDePk=;
        b=L9pSo6B9cbk+TG0BlYRxeAnLUnEItY4jg6CmvGRJ/0ok4TUWZlBbcHT3rj3OvWtt4C
         Pd0rZkUFqXUWWEnoDSjV2EwbzVbg3eiZYvTonlIB8KAcoU4TpESc5BmFn5A9b3rZH6Oi
         DhMvr7XXAhpsdVST5RDBN9+A5PFZ89m3dLvFTXmVv1VnIkaXRp2WiB6VDPAM5HcxEvJx
         gl6zepYkK7nh/CwF58xJHDgQUA99miNzPfk2DNuKo63k++FDVJd8ouHtq7D91L71RrwA
         6s+WD63DsqXmkKk0FlmkcvrwC26nwvPvaPGwaX+l7XB1Anmg+ICZw0quZF5EdhnOKTnZ
         d4JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779797978; x=1780402778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nNjc6hdeP19AY8GeuH3uphO5Ltq9yMQpHpBo9KrDePk=;
        b=ajhyx05+aNoszKnRZH4KkkH/bbHiyqYgEBZWx9vTlobmOGm/xTdbxiTJlwEuV6toEp
         YuwKeJpV/iceSW0PxjsVYR1PzjD2+QSGr+hAFgZEivOBBz56QiDfx0tB59x1mRarHrVO
         a93F5hb/7ANt9edYSqYwlTnzppEDT/lGB78hmX/EL/yOYmjk9ZWd/u89lEOXX0bktDto
         ekwnJOJRJufiVzG2+Zitjh4kZDbmKojmVyPgdZxr+txBEyVHNCe6W1BF0NFS6ZsDtxV9
         rbd8lMIYEW2WjdfXzISwtb9sAyFs7JKem3LkEHeSYiDBDosF9PB6vMCrCTWHtJXak1Az
         OiuQ==
X-Gm-Message-State: AOJu0Yzneq/5ur7Ph8EjLupz/GERtitihtPc3es4sndnjaJFayXJw8OU
	u66eglI+1oIqsltIcctXInhVCxOL1btch4pdFMDZ+iIZDcDIDdzN2sD5fpho5wPywZU=
X-Gm-Gg: Acq92OHF5Liqp5otqlyvTIlOdXzbaKMY9SCX3ZHYipHMyBFz6Ep9+QZMlA/Ahvwd8/1
	Vn1PyNd5QSbzaNFzLzKzlaKt7TbWyScj5cGK6eH0U6ndJAjeOz3IQk4d3QxC+s9Zps8WDUcHMEH
	oSbJ86z2YqDxjgYC44k8ZXhbSSKcDMdMhUIEVHYRthKl2MRGi+EB5nXWSowz6bU/ULwi33sFaJj
	ur33yjHN/Y7NqAoWJ09521jlGUZhugYaqnqseM8RMOQKY/WjfRoe2i9ax+9vbxElVIsWaiQegpW
	Aw+5kmBrz0OgelONpnXj55vh3Vv3s4WVq1ozVVKX6NU3fprsewrwf/txGS096l8rQlFc0NU09Wh
	bLh/kublf/6/V5y+8GIlU5vRrsyIxZaUpBF/7wHjjUSaaz+Xl+0EN4s+0sI1KOfQjT8Z9fVuNyA
	aanNBzEXEbzhsAn0tLu04ZJMJjvUGm5x8msteWmDo7dF9z7imhxwMHghZoDnFUv1VBNM8Z+lKkM
	BX1ivWtmcjhduviv9YuPPEK1xZfxFZPTvFt0K+sXM2qbY/RC2yM63XfEt2L/IVO
X-Received: by 2002:a17:902:c951:b0:2b4:5aff:de60 with SMTP id d9443c01a7336-2beb06fc2c0mr220261445ad.22.1779797977635;
        Tue, 26 May 2026 05:19:37 -0700 (PDT)
Received: from tomato-cultivator-HP-ZBook-15-G6.. (2001-b400-e3f1-2f92-139b-8208-b437-a033.emome-ip6.hinet.net. [2001:b400:e3f1:2f92:139b:8208:b437:a033])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b387dsm126917765ad.50.2026.05.26.05.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 05:19:37 -0700 (PDT)
From: Chen Jung Ku <ku.loong@gapp.nthu.edu.tw>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Jung Ku <ku.loong@gapp.nthu.edu.tw>
Subject: [PATCH] gpio: gpiolib: use seq_puts() for plain strings
Date: Tue, 26 May 2026 20:19:05 +0800
Message-ID: <20260526121905.46345-1-ku.loong@gapp.nthu.edu.tw>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.06 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gapp-nthu-edu-tw.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nthu.edu.tw : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37535-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ku.loong@gapp.nthu.edu.tw,linux-gpio@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gapp-nthu-edu-tw.20251104.gappssmtp.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nthu.edu.tw:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,gapp.nthu.edu.tw:mid]
X-Rspamd-Queue-Id: 0B7B55D5711
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace seq_printf() with seq_puts() where the format string is a
plain string literal with no format specifiers.

No functional change intended.

Signed-off-by: Chen Jung Ku <ku.loong@gapp.nthu.edu.tw>
---
 drivers/gpio/gpiolib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 1e6dce430dca..ac2b9546d843 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -5498,8 +5498,8 @@ static int gpiolib_seq_show(struct seq_file *s, void *v)
 	if (gc->label)
 		seq_printf(s, ", %s", gc->label);
 	if (gc->can_sleep)
-		seq_printf(s, ", can sleep");
-	seq_printf(s, ":\n");
+		seq_puts(s, ", can sleep");
+	seq_puts(s, ":\n");
 
 	if (gc->dbg_show)
 		gc->dbg_show(s, gc);
-- 
2.43.0


