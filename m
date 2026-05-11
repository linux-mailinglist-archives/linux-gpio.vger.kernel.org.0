Return-Path: <linux-gpio+bounces-36501-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICkbAIhKAWqKTwEAu9opvQ
	(envelope-from <linux-gpio+bounces-36501-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 05:18:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B235078E2
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 05:18:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57169301DCC9
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 03:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC319378D9E;
	Mon, 11 May 2026 03:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TAUQVbot"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934813603D3
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 03:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778469476; cv=none; b=gv7KYZ2lcH06soJ1jCKEWtfHfGDRwml0w/EOqavz6i6BxRJ9sbAsI9Y3K6+u66JVfm6MxfHhYV/khPhk1qjNe1Kh8IK7PkIlLIhbUxIb3q/87/jl1YNp8ljOc2GhF25QOdV3FfBK8XW48pbZ0kTdW+mKcT/txMut8YFWchuZqEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778469476; c=relaxed/simple;
	bh=LBHUdL/aZLTcuzgLf5RECpPNGmqZz0Y4rxvOXOoUpIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DevppKPY7w4Q2nrnOsEuth4fdUzOOVAfeKga47FLYs145XQEU5qYWbf3HuIjjCRn+NywHH0H5PwQRD0QLX4rAeMEQOKY/vFuwETwxtMRUlZdcmmL7gZUiamHmnU2Wq+mDtzxk1UKdDxgCSJDC0rKlSae8Hzt58/ZJjpSPDr/LSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TAUQVbot; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2baef9f5ecdso19281865ad.1
        for <linux-gpio@vger.kernel.org>; Sun, 10 May 2026 20:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778469475; x=1779074275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ntOIKo0osG/x65q0coO7qdpXbm3g2+4uiTzmeHYRKrE=;
        b=TAUQVbotPeHHRfyJL5uldFp7OMpqvcdP0F2Z7Wf4mYm2VRpoUhuN03weivz/dSjXan
         nmBLQYF89w3erlcks6ytExYTG8PDppMjaeiizM08kVM7unqpFP58tTLiBxUUMbOasu4q
         ADuanjpaMe4DVkYYALRrOMGcIgOH3o0QEsXvrK6EnSMkEyNu0Y16xW0goUrkMzJtptmV
         rsaCcajRhM5dX301r5biGqvqJdCah2Ic4dk7TiYisFKZjoB3szWaa1wb7/oDoTjkeFFt
         b/PjDyhXQm2MUSSigvNc9+6BvHtNJf0fG11xJpL6GfuOb+ofmVgdiQSLrjR6V+IENYWE
         BeUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778469475; x=1779074275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntOIKo0osG/x65q0coO7qdpXbm3g2+4uiTzmeHYRKrE=;
        b=deY2uXXDH8wNlV7xdGS4l2yBEQI+det7GDtQj4aFhbEEvrN8VMM9G2/mgQOx+405gi
         ZZq1UCYGF9nvdnAGn8xGtXbsiCn4Hh3+BVNGI2U60p1lQn6lNvbjNJwzI2s6rCgrRQbI
         n1wEaOTne60ZrF7eeB9bdJdUbMPmUi6OIalfLPangZco7s6Fm/XqB2vYUbhNgZvuFNGG
         0LdBQmaoICvM5aFi4YJDQi/enJ2dzDfnBoFGvtae0oDOslTyuNtoKzlS6DHE07GbOTT5
         GnlwaNQclMfsFF2aM3Rgjtv+1k2XPI3PH+a5jH+VVVpCfyMUt3XLMohqlc/QMLzsFLKr
         +bGw==
X-Forwarded-Encrypted: i=1; AFNElJ8Q7HI7GEgGLVVvGuD0dV/uDgjiNLlH30nHfDEqFLgPv1JemnByfrEIa8I2xWZCv5uVdwQXoT8a2x4R@vger.kernel.org
X-Gm-Message-State: AOJu0YwxSXPGEYZqTh61A54TdyNOg1R+7gMNktlN+5ThyHRRpW3MuQMP
	isk6/7hoS9nsT/E836lHFZh1lLImKU6ZXZaH425hKSnnyi0PoBc/WSZp
X-Gm-Gg: Acq92OEelDCBi4xr83Hrb1ZyazuP6Dsr3s/Q0SXmaCxj9SLhpRV+EYU/PZ2Vff8ovEr
	2bkiZ29f11+wtnOY11i6TEAD+VByzQmMYYOKLLWBr6jrGCC1sIO6jeolZdj7VXMB94oRndauRz/
	Ja9ThhxXVHDwWUZ1kCSoZ7+Ke9R589Vlo3RD8cqHWWTHvTUCP1k+Isb5qLb7w7EO5vqhSp78Mv7
	+GhfHjA+BeMiwI1YJQwMEZqF8TK69pGxisYj995PQfRF2QK7m3dzOf0jzvHQzb8IaKhmigkkMgN
	/vhMjqqW3xhFRNiWV2zcBmmQ8756M1rYrioT/UoPGWFbnow5+WpbsRyE9JHFlqkm/GJWTQ8Dd+w
	AMGk4jL3icwyAxNlfxdx1TqnEIkpAD2Etog1ef0Egta8sxZNiv6g6D4fiNZrckGH0XChXm3RWDq
	ubQWCA/vo+jpYuEXHDUmZDrSwweC/30MXNsgg5GbY53jvAvehZZmQQ2ESMHb0EJ6S0w34iWebDJ
	msOlBKvCuVr
X-Received: by 2002:a17:902:c410:b0:2ba:839e:15dc with SMTP id d9443c01a7336-2bc7a9b46a8mr87205515ad.17.1778469474914;
        Sun, 10 May 2026 20:17:54 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e374besm90267675ad.47.2026.05.10.20.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 20:17:54 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: linusw@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH 0/1] pinctrl: nuvoton: ma35d1: fix MFP register offset and pin table
Date: Mon, 11 May 2026 11:17:48 +0800
Message-ID: <20260511031749.32643-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 44B235078E2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[nuvoton.com,lists.infradead.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-36501-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a0987203069@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Fix two bugs in the MA35D1 pin controller driver: an incorrect MFP
register address for pins 8-15 per bank, and several issues in the
pin descriptor table (wrong numbering scheme, missing pins, duplicate
entries).

-- 
2.49.0

