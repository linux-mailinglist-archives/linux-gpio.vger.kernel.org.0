Return-Path: <linux-gpio+bounces-39619-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ik/6Gn6STWpm2QEAu9opvQ
	(envelope-from <linux-gpio+bounces-39619-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 01:57:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B96720842
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 01:57:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=gR39VxgR;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39619-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39619-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 72323303ADF2
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 23:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96B18395276;
	Tue,  7 Jul 2026 23:57:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245D2314A65
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 23:57:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783468665; cv=none; b=Gg0x4SO6ebHr17q/kpKBxBkOgOJfVYICLv+Nc/rVYls0S+hwnXuTCduN6gf1e/nuFhcNwHLCB+5CArWeKKudUdK8HAqE+riSV5m4jM5VkHyTXb1dw1Ku3jriGQ90lyVEKbirmqKhLqvPrPrelzghu79vhahiXXVUwMwnWRk9AIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783468665; c=relaxed/simple;
	bh=mGH2HAOi0TNj45O+XuKLfX/dRuUkO7FRMffdRyeFGoA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=STt0eY+rnfaQQLeLDrCTINwq9D4PDYBT96C+9MQsIouELAwDilEDBw/m0NShI4Pjc7bnFI8UsdGc63b9jPGI+LRU6UaiehXsJNCjnxMVn1I9srXSVqd8PeGPFJxRoG5tb4ydXdGKx8y9wJhrOpG3yMiXsUJY/TJQML4eQ9WfPo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gR39VxgR; arc=none smtp.client-ip=209.85.161.53
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6a321bb0328so21313eaf.2
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2026 16:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783468663; x=1784073463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=er6pkGgqUgqjUSkeHs8hENATy3dGAIc5vSPhqVqK9VM=;
        b=gR39VxgRgKDdHRfOuUYBmh+PVE5MUGxH4RKllaera4Brdv1kj9cY7NbVVCNJdJ2Lwb
         SV8B7h0MT0JbUAsnUkXzhjGysLkY2byyxT2Pa6Av9IA4zTWp2nSJqE1pUDlnX3WBBXPa
         7jjGLj+Cb8ldxNZkuO18JyKO5WMI90oxI08iD8H9VByvkeWQoOdg72/A8U3egL+LjWfJ
         n/7BtjTXuhJHjXr159c5bi9vwjicnNwc/vv7ya/BQghuqL+norRpjVNhvE9zGzLx9wh2
         cIelL1hJx1BhF0W8AwV7zLeb5NDQdY4YcRPFcYI/Jjma8xVee/EEW1nZ612rzYKzl813
         BmAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783468663; x=1784073463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=er6pkGgqUgqjUSkeHs8hENATy3dGAIc5vSPhqVqK9VM=;
        b=X7zjE5BUk4NHEfIvnvCqZ1k7d+/0FfK9gqQZATDppoeKax14ZslzFaHC5KavJ+qmHw
         V8m5W5X2LHLV0+KC1Fbgh3NW0/4N46x+CaeeuPAA9ZIedv6cA1HZOm/F4NWr7GnY8IkR
         avICbRyfxvyuON6jAIVfmvc6LDQhlFaePkQ1QTZLQIIMC6NMrOEQW0yWkuQ43Q2o0VPM
         Ej+qvy1ROmFzvEzmcpBpyYcWRCAt3fS8E6Zj0vV/ogCIYyIiQDQjFMXcOCOF+jJeDMYi
         dxytiW9kweKraKnoICMiPEMntDQrLWdnMySw+h0N08dTW/wvu03YnyEWRO9vU+WI/HLD
         FOrw==
X-Forwarded-Encrypted: i=1; AFNElJ/a37a1GyuvTClXEBWFhZCsQPZtiMqkKW4c/W+1BMvd4ix2H5RDU3rZf/9iQZVqAmzg/SJfwv2L598Z@vger.kernel.org
X-Gm-Message-State: AOJu0YwlQuqx7YUvr5eyq7fzuxvhk12sj47UNJDtUDPEXCejvTwIHuH4
	e+StZ0Jz+K5c1ZdtTkCNbQ/9d+LBk2cb/hKXdv4zB2xiHREVn8VgKSJS
X-Gm-Gg: AfdE7clK/KeBxwtzd6pBkU3pEqGkrE7aM8xA9btONU8qvYOafAvGTe5aMupZEtw1m45
	9wi72aNztn6v560OCZOM0D/Jn8H8/St24rbkrZ1QWowjSNbLJlQn4B945FywhSfJTrzbRbzvpDf
	fqtZygAZgH0cyO5nWTpaIX+ADPgeuTDKDhUqYKvZ3rPFbMuuObA6TWPQ7DpirxNvR9Lt2cLGoTs
	2Oyn0vhS8aQgQh7vgZsys+gJ26akKeWVVVGNrgaj4l2x8oJgjCU48tuXlkJ1g/uiBj09NzAaLH9
	TtskKE+AD1n6vh4Ta4/awacBwesvZRa55iDmMr8uiPbrYGdnfrnkovICfUSDD0d79sIVlCWPnrb
	uA2UqlIqJfRe0l/1Aq1ARBEwTiHYdEr5yzg/xz+6UlxlO5iI7OEv4bpAo/DsAla8gfc2ZrE+CKd
	2cDOZJTig=
X-Received: by 2002:a05:6820:f023:b0:6a2:9bbd:367a with SMTP id 006d021491bc7-6a36d8735c1mr193412eaf.12.1783468662946;
        Tue, 07 Jul 2026 16:57:42 -0700 (PDT)
Received: from fedora ([187.142.231.66])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a36a5ef513sm763159eaf.6.2026.07.07.16.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 16:57:42 -0700 (PDT)
From: Cihan Karadag <cihan.cihan@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Cihan Karadag <cihan.cihan@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Bamvor Jian Zhang <bamv2005@gmail.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests: gpio: add gpio-cdev-uaf to .gitignore
Date: Tue,  7 Jul 2026 17:57:05 -0600
Message-ID: <20260707235707.1349969-1-cihan.cihan@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[cihancihan@gmail.com,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-39619-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:linusw@kernel.org,m:cihan.cihan@gmail.com,m:shuah@kernel.org,m:bamv2005@gmail.com,m:tzungbi@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:cihancihan@gmail.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cihancihan@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B2B96720842

Commit c7f92042d3f3 ("selftests: gpio: Add gpio-cdev-uaf tests") added
the gpio-cdev-uaf binary to TEST_GEN_PROGS_EXTENDED but never added it
to .gitignore. Building it with:

    make -C tools/testing/selftests/gpio TARGETS=gpio

leaves gpio-cdev-uaf as an untracked file.

Fixes: c7f92042d3f3 ("selftests: gpio: Add gpio-cdev-uaf tests")
Signed-off-by: Cihan Karadag <cihan.cihan@gmail.com>
---
 tools/testing/selftests/gpio/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/gpio/.gitignore b/tools/testing/selftests/gpio/.gitignore
index ededb077a3a69..16f74de479f17 100644
--- a/tools/testing/selftests/gpio/.gitignore
+++ b/tools/testing/selftests/gpio/.gitignore
@@ -2,3 +2,4 @@
 gpio-mockup-cdev
 gpio-chip-info
 gpio-line-name
+gpio-cdev-uaf
-- 
2.54.0


