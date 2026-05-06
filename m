Return-Path: <linux-gpio+bounces-36281-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNBHLFE2+2nfXgMAu9opvQ
	(envelope-from <linux-gpio+bounces-36281-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 14:38:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 136464DA4F9
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 14:38:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C75DC303C636
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 12:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C67C44B674;
	Wed,  6 May 2026 12:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IhzSr+NY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8DF329E44
	for <linux-gpio@vger.kernel.org>; Wed,  6 May 2026 12:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778070882; cv=none; b=oulvNXfY2z9CK0yG+uhTeeWj29YJKG5xhrm2cPhO20PeDoEdz6rN8FcZMzgfrVNY11T/n4J1w0kq4WzsC9mY3fUPBnq9ADWLF4akwX0K1kuYUiOHqgrvseXqmWzkUew+sNdhs00itmPF2R9N1t2cBxgJToFYGOTZNZbhi4Xgl20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778070882; c=relaxed/simple;
	bh=+0t5J3uKawirFSYDlt6mpuGzzmawvxPYoRdvTbLhz2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WHJihLr8YgUwD3Hk6ThTo7vw5eXs7ETY1poHp/shaY0VPB2Id4OK1+ELUaX6RmltzDT9YFfviN/O3Dnvsdu1EZ3OGEjGLaDqSNr5ZwR7+1cptt4SrA2WAvkbwcBxyGOzxyJjVDYbTJ5vBDmvUVBPXCj5Omy2jdNEDQS8Hiz6duQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IhzSr+NY; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43d7e23defbso3637648f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 06 May 2026 05:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778070880; x=1778675680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQK5Udi7dRRSC+3+y19Y1o4p+F8AR8D8gNY8SQ+8KnI=;
        b=IhzSr+NYHKIK3wS1nYaGOkf9e3+egFK97OxgDS7oF2cWZqBvZ4/OQ61bq/KKOVv8DS
         9r/4OLLNtEgf3o8BWXH83AxtO5tpVTYGvm78jV7yKPs7glAlZDM6Ei7atLnrQI8xxRBZ
         sOB4tx8uQJ+ZolpzraJGwggD+1c4IQRoKAPEQ5H1vozQiV61e4DtYD7ecuXLHB02xrRz
         KOgq6GWCpzCjlt8Cn9jL8zTH8RSfe2L6jOwjMN4tfqmd1FStoxJ8cay4qprjD5wyJsmA
         YhTu9Tf6yDC1etwLACauoui2uf6gegjkqG+YYdFIYPuc/zPbdRor4ltQro9Glw/0jR33
         qi0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778070880; x=1778675680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RQK5Udi7dRRSC+3+y19Y1o4p+F8AR8D8gNY8SQ+8KnI=;
        b=Y01ofvtUbecj4+KDBN5LATx3LO3mdmTsBIevcQoxOI1cYt/xqsTWVlpTGx0OEWfZsR
         gq43ya1Fky49ajEuoI/Cjr6ou1a3bQCq9CmHs1I2qJztaeI29DiVQl15508bkzuSsX46
         P88Y24lCm1hBxMS8Vf4x96CetnXktNuHjxLsvY/wxgkz58zOwjFiVzqZd9olqcQydcac
         viQ0INgk9hfRNmz7jJxADqhqGwRZasjbcBCt8f0rMiC7xqPECS6KeoL5oKO7MZXf94jG
         kltGTtZYD8AIfqgW/fyiaL4UykKMuNxXTNLbnUFxXQ1r8Zn1nDtIERtRJQ2rEgdivRyw
         U7kQ==
X-Forwarded-Encrypted: i=1; AFNElJ9GplS2oxMBYUnJcm+V3Rftu1wyylXcBnuDblfrJ5YJi9hQv2ECSQPMENYfNR2+GLfdPS07dqdhiOrh@vger.kernel.org
X-Gm-Message-State: AOJu0YwehrnbThb/64DClTUMpFFK0sG5QZNss3Usdq1pCBFMGVy8oxPf
	RO5Z4Sgma8wjNak3VBIRta8e2SnX6y9V7h0Zf/27oMFIweKcxTDW7uoc
X-Gm-Gg: AeBDiese/Rq8TL2LJ4dRVCLpc2LKJTcr7cka8z9wXVlX8v0izzm5FU/5/Fko/f8/vck
	LeysLWU0dymCCOSmVPzWbodzQwbiYVPegbt2HwCq96d0q7Pbwf/LTgk75qBTtB5oMlUE3/wm6VM
	+NPuznIxDm3Pi9BHXd2qEzBBQN5g0eMWGJe9VdsWFtYQFNhhcs9d/4uZhHpKx6Wp8ym2FjKy6VX
	gqddFdBdvBYyCvhg75dDjbZnnWbt1w9JhEAekL/qo87tx+vxCOVCFNqZZpDv+7RdNbgsukAKLSx
	MJF8BJWPbl4C8r1A25+BNvUO+sdhQkjmuDBjBtJy8Nd5zbmNA0FjKWSR8pVgHl1DcVei+GE2Y+h
	RxUhPq/jIDCepo0lakGrViyxhvzSmeF6OK+TZ2W85XlXQN/snSBSKn8EwJ0cW75nFppzEI1zlAN
	NpRhCWLalk6M1z/kPsD2ubzznsoA==
X-Received: by 2002:a05:6000:e90:b0:44f:f454:8a4d with SMTP id ffacd0b85a97d-4515ce1ca3amr4245062f8f.23.1778070879846;
        Wed, 06 May 2026 05:34:39 -0700 (PDT)
Received: from ROG ([2a01:e11:202b:40:68b1:8d59:e348:c16e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45054b03df9sm11951459f8f.24.2026.05.06.05.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 05:34:39 -0700 (PDT)
From: Marco Scardovi <mscardovi95@gmail.com>
To: mika.westerberg@intel.com
Cc: mathias.nyman@intel.com,
	andriy.shevchenko@intel.com,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <mscardovi@icloud.com>
Subject: [PATCH v2 0/3] gpio: acpi: modernize resource management using cleanup.h
Date: Wed,  6 May 2026 14:34:21 +0200
Message-ID: <20260506123427.1077274-1-mscardovi95@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260506113215.GK6785@://intel.com>
References: <20260506113215.GK6785@://intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 136464DA4F9
X-Rspamd-Action: no action
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
	FREEMAIL_CC(0.00)[intel.com,vger.kernel.org,icloud.com];
	TAGGED_FROM(0.00)[bounces-36281-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mscardovi95@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,icloud.com:email]

From: Marco Scardovi <mscardovi@icloud.com>

*** BLURB HERE ***

Hi Mika,
thanks for the quick reply. Unfortunately I noticed too late that thunderbird had
broken my patch during copy/paste. I'm pushing it again using git send-mail.
I've divided tha patch in 3 smaller pieces: let me know if it is ok for you and
Andy. In the meantime I'm testing it against KASAN and kmemleak as You suggested.

Let me know if there's anything else I need to improve.

Marco Scardovi (3):
  gpio: acpi: modernize resource management using cleanup.h
  gpio: acpi: modernize resource management using cleanup.h
  gpio: acpi: modernize resource management using cleanup.h

 drivers/gpio/gpiolib-acpi-core.c | 68 ++++++++++++++++----------------
 1 file changed, 35 insertions(+), 33 deletions(-)

-- 
2.54.0


