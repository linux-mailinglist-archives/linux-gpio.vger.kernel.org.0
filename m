Return-Path: <linux-gpio+bounces-36283-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOP/KvY1+2nfXgMAu9opvQ
	(envelope-from <linux-gpio+bounces-36283-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 14:37:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1FD4DA490
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 14:37:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 61A99300C39A
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 12:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7231044E042;
	Wed,  6 May 2026 12:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kTT2ogFg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A564D3264E6
	for <linux-gpio@vger.kernel.org>; Wed,  6 May 2026 12:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778071022; cv=none; b=NYtPZKuAnqEEiJ+KDQTpPjf8NfKy2Ua37Fs0aY3CaGoRwfmYFMY7WMTGZH/MmRRbfGW2bRVJmOvA2YItjsi7Z7LtpdLTDntfjcPg4NwP2BSj+WuMMcHEMt5aAyuBik1ooYh9oCOxAibdF/NmvBgtiTvFqsbjy3E4iztdosvT9PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778071022; c=relaxed/simple;
	bh=cApX1dihbn8PQ41u5UpHALMQ0+hXvurYSyFH0ym8sdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cbU520frbBk8Fv+Ci3he8KGK45hpnMsiNLYgG0SHtw2TjWIy6pluZ7eXEZSthLycbx1CfL1EoiKSMg2jSEnEfwHuQhM3YhQ6f2dFYYcNTPnkpHa11wkgXK6R4tDHkTx7OxENXhUFXhEbqggzhv+/CqAcSmR5N0Y+D5uiMbvi+44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kTT2ogFg; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso68697195e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 06 May 2026 05:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778071017; x=1778675817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1o/09lEmBoTZNo86PdS11r1OH5tVpbMNKESkbLzHhHg=;
        b=kTT2ogFgo4lSi6JzJsobmBtNM/5KcLFIB1SQF+5yGCY2N/LpjmfsotZIfV7eSFo4qT
         dCARjV8ssuJn5/ZRdCa7jljKncwlHP8oH8vBpRAhPegYFQNlr18s0faBHVq8JvhqB35j
         RgXhbcl/QZKbkmn3B6VOviU0Y64zS9VAVsnESRXfPvAwUB48GV4Ni9ABFTlq7lA+tJG8
         6ONoaFTXoSTJFiSWYErZhh6PxxamyZ3wfLpb+jl8oeIJj3Lb5JXaV7Doy3zHBKe1lXzP
         DgCGodgOc5F0ESyNczM5otV1DRQk0OMmlvlR7MpYtuZC4an8t4OEb2hhrlMhnOt3PbIJ
         3OAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778071017; x=1778675817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1o/09lEmBoTZNo86PdS11r1OH5tVpbMNKESkbLzHhHg=;
        b=YUnIegI+nk3rbKaaNqlqccS7yUzoBWCVnFs7uSwe/nxsr03pCRbCYnDuKyLU3EFR4C
         jIMWXwmyR2HtVCFh2srtYuCYOi4QkCtQwqRc5/5+GUdYiZBjEj/ex93A41S9SPKBIWn1
         KiinIvM0eTpS/I8c9MbzRcAmaW1BvCLlo3A8FiyqtQI7a2MUuxV4tPnkoi5zzjbhvijs
         d/iL/RheWut2y72Dr+s1l091XTrm63dixFhs8JOSfbUVG4pXhX/RpOFr+gaYGKi/IoyQ
         lM264JRjyUNEaOw47495Jg14SObaXkwGKoUd1aqBUlncbN1HjBe/LyoAjhkpYV9JaC/w
         XopA==
X-Forwarded-Encrypted: i=1; AFNElJ97iLaYnDAebp9u7U7rWtFFqEv7qpVNsNwg7iNxHNGNtdh72U60MDJZM4zzXeHDjw1HaKy8dVAY0zx1@vger.kernel.org
X-Gm-Message-State: AOJu0YzCbksmy0hHuZHEojI6/mP3dHm/QZQdnjckbzfqIGKGKL+XONZ3
	LDSLouiLYzV5BBT6cAT+2vC1AWXDdm4jv6sC3yZHjibtqQyJwQbAQLkh
X-Gm-Gg: AeBDieuEYJFAheKat62G1IlIInoytGAd8aHos4OeRzmNxUHcG0AnpoKeUa1Ym9mX4kl
	J4VTHjAppb1lvwuZk2JLpTmgjpV6/TeGCtrOhNsWSgz9kL63lq00qV+6GzazEieIyGWBNwoGT/H
	1fG4BU8AC8j1on9Ue+9O9/Kkjy9Cxf33jnOIdKHYHVUQSdjzi5OVInOgktrfNqxueS66Dnq1yJ5
	6fqLrKvfZciflMj9tLD048zmK3uFQ7+yTsR1CKjYj/6ih3nZb+Ku+CVguMDbtBH0ibMvQCiMxqz
	mq/cqc5S9TrdbvTh+0ebJjaeXXUZtyDJjPPnYstNnJFrnyOvAcmg1t65fy4mKEiMLh762wvg2Ue
	fd3xYTFa9lNHJGB8Fi+nhybyMpDttKuEB74JvyiK9BTVNeYyX+5MKG9BpQncRIpNmA91NDP9J4O
	Si/7bJXuVCZedDxTOYWvN6MCOuiQ==
X-Received: by 2002:a05:600c:4f51:b0:48d:1a94:56c with SMTP id 5b1f17b1804b1-48e51f3054cmr61078965e9.18.1778071016590;
        Wed, 06 May 2026 05:36:56 -0700 (PDT)
Received: from ROG ([2a01:e11:202b:40:68b1:8d59:e348:c16e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530cf964sm31767485e9.1.2026.05.06.05.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 05:36:56 -0700 (PDT)
From: Marco Scardovi <mscardovi95@gmail.com>
To: mika.westerberg@intel.com
Cc: mathias.nyman@intel.com,
	andriy.shevchenko@intel.com,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <mscardovi95@gmail.com>
Subject: [PATCH v2 0/3] gpio: acpi: modernize resource management using cleanup.h
Date: Wed,  6 May 2026 14:35:33 +0200
Message-ID: <20260506123637.1077421-2-mscardovi95@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260506123637.1077421-1-mscardovi95@gmail.com>
References: <20260506113215.GK6785@://intel.com>
 <20260506123637.1077421-1-mscardovi95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AF1FD4DA490
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-36283-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

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


