Return-Path: <linux-gpio+bounces-36500-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id XVLpLs7iAGpvOAEAu9opvQ
	(envelope-from <linux-gpio+bounces-36500-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 10 May 2026 21:55:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BAF5061C6
	for <lists+linux-gpio@lfdr.de>; Sun, 10 May 2026 21:55:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BED9B300794F
	for <lists+linux-gpio@lfdr.de>; Sun, 10 May 2026 19:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E84DF3314BF;
	Sun, 10 May 2026 19:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RnlktjTt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6DA31F9BB
	for <linux-gpio@vger.kernel.org>; Sun, 10 May 2026 19:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778442951; cv=none; b=YUimL5uInjIxGGHhESi/4r6Qo8fFZ+iBBr9UczY9LCsPdwBdOivgTtNNImNcviJ6r36jk91SpYmRvlwKqKPzAr4jFnI/I9KY2WoQu9ygbYhIQXeDRLV0IkEusvu+WEzWBwUWQkB7Cj6MinLq/MVEIQ/+p0DutTYKdVkkXHFlmsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778442951; c=relaxed/simple;
	bh=SmIxEjBv3Ec4WJjXLvlNIuKdyU0GEs1NhKpi/8jpRjE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pG+d5cPPGsGTVYjMi38KZowYlvIP5hzXBH3UVwueWDhWriAU4MWuR7xdwYpn5+60HxSu0Z3NasujBvGPq+m21r9Viy9XaQZz5pue0HzgeKusFer1CB0OzOctqnH/AdG/1Nkm0FxesHhCaR0ZrhB8JOa8ANwRdO9edZKJKkddnq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RnlktjTt; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c798fc1a28cso1485051a12.3
        for <linux-gpio@vger.kernel.org>; Sun, 10 May 2026 12:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778442950; x=1779047750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8UqkFqQGcj341eICyx1M6NtNp7TzWEPzDgmmCGlK0mM=;
        b=RnlktjTtwg+L9ImFvxRv2fskqDePEpNS8h5WXoPwJD/vzcoleV0EgzVPYIn6XoMBA0
         tTYkCKzpQu+Uf44+dk3RFKg793B3CUBh/0tL2cc7jUZZJ5EvW++nSLMpCmsYX4IkJiZW
         VaJ+d62i6ZDi0bjcgrdYrtR1HYV7cqqdm2XaXmNU71RnZHRssjSPtXflJbU+TCh9T7sC
         wEzzc2LWfdv3rig1aB0webe1yz/VGQLmOxT2V9L7EAgIhmCXoXs3nsrzMhococ4U9EXo
         /ovK35+q4mDfMjqBVaNDD96FLHNgcQwavyqbtirlmG01VHMyRVYmHvrg9YPvWQ+kddfs
         oGQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778442950; x=1779047750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8UqkFqQGcj341eICyx1M6NtNp7TzWEPzDgmmCGlK0mM=;
        b=lIH2BdSKkHeKnrxkTXdzeZe1pcUbjFopzOiI7LMxOf3okTZrWp+K8UKls0ByH5bWgB
         zaka13nhydewYN+6odcV5omorOwqEuCCgsIm8LaGVUR4JXGl09JlxX61RHYXx7vZz/S+
         qUIv8eCWaqu/4XGblkGHgIeTb4Zu9VkxLDH8bEFwNJduKcl6+GU2bVhIHd0h6n+rfSJE
         UCWNLfCpHwgM6mgNmWJMmb+q0jMwuEpRzkUOUkKnNs5D+4JI32eUQ5Lan451q0Fk4BHa
         kf9TGGMnCjzPkBxkPsX8hgwdKPBwang6X0oeSy2tjt6DmvXXsQzLS3etkDIXPjAMNfXj
         XInQ==
X-Gm-Message-State: AOJu0YzfJymRRSN+ajMuNNXOraosBb0ndH5mMUZCaB3UR9KKF596DpSo
	zMbspqsaM2xhZtkdC1TKh01hxUXxyOFO9wMLKKCfChNyIAejifv3AiIAMnkQNw==
X-Gm-Gg: Acq92OHl77R5FafVVrC8dEN0BJGOsfY3EVrqdU3OuNJqUh+iLXbitZYyto4E27y9bd/
	kRvkQSmWDWRFZSpHuxM62rCHksNbzPqfmf6KB25pTVBN1LGBmfOnEiYSJLiWZe2X4wW2AzLFr7V
	8MM6Km8RdKQsNhaKADzypyBHDwhJ3BTQY8hoNsmpyp+aahWyqWR7FT695Szj4bxvVgfGHzV9yJ1
	8jEUVpHdvKp6nvRxQCAVxGWnfLaaok3j4F34Y4Mx+J88zMG+i80QdesAjJqDN5Y3E5cyPIagd87
	ScfFdQ3wp4lRkg46uVXI0YhW6HG8UyTN78UJwv33PRdLKpntLL3IXFweUf5VZT1SH86PvkyLkVM
	+1p4MpTq5iSXATXzXpcLPwQF26DD1ysEx2Qi8rKdTWNh1XRp1LsdIiRcmPiqQHbnLVWI4tuzH+M
	/OfAIgi7QuAV5Z+A6eR2TCOn1KAViM6ljb+XtBQ0oLb8Su0QNeto6VlHFtQOow0ScpApDpi6YVZ
	+iSd9DJGsyfRNTQULq7Q2xstWf3/GlpkLNIC11mgiYCoA==
X-Received: by 2002:a05:6a20:9392:b0:39f:24ad:acfd with SMTP id adf61e73a8af0-3aa5acf9b6dmr23496096637.53.1778442949664;
        Sun, 10 May 2026 12:55:49 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83962e7e3fcsm21720991b3a.0.2026.05.10.12.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 12:55:48 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] gpio: spear-spics: Add COMPILE_TEST support
Date: Sun, 10 May 2026 12:55:31 -0700
Message-ID: <20260510195531.10561-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 77BAF5061C6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36500-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The SPEAr SPI chip-select GPIO driver only depends on generic platform,
OF, and MMIO interfaces, so it can be built outside SPEAr platform
configurations.

Enable compile-test coverage to catch build regressions on other
architectures.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 51f510fa8cc7..7dc25a4ed761 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -699,7 +699,7 @@ config GPIO_SPACEMIT_K1
 
 config GPIO_SPEAR_SPICS
 	bool "ST SPEAr13xx SPI Chip Select as GPIO support"
-	depends on PLAT_SPEAR
+	depends on PLAT_SPEAR || COMPILE_TEST
 	select GENERIC_IRQ_CHIP
 	help
 	  Say yes here to support ST SPEAr SPI Chip Select as GPIO device.
-- 
2.54.0


