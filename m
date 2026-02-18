Return-Path: <linux-gpio+bounces-31820-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mK7IEx4olmnxbQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31820-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 21:59:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E58A159AF4
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 21:59:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9B2CE300908E
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 20:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62B4D34A3D8;
	Wed, 18 Feb 2026 20:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kCaiypTY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112E41FC7C5
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 20:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771448344; cv=none; b=P88Pq6AesYFYJVJt+5iiNd3ZywfI3YgGRebhD/53P9LGkRnRNMw90MOdvAH1H/07+qW0JbbITZUcsnpRQP5fUoYyDUQhqkIWtOLBlQCWN+r/L3uHei2cjbF9EKOLUppmVyc1oOaoaNhvQ66V//+YKiNfl+9A6xArSHNrZHea3ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771448344; c=relaxed/simple;
	bh=pnl7tVGSI/jbazZU1HXqvEWLoN/pFhNyqDP8Iv9cFkI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qk6amNcY934U5BRoXt9u+jYSQMZS5FkK/8AJqwWBS69ZiMlDZbeveR80PSIRyhoxYzBxKp78wV06+SlYc2Hdai+ptPAHk233Yr1h1SmM7cWmdA3vuULQ4Cmajr67UlRYOPjgAacIqH2ZTZpmS/HMskEkYhkH0MLEkEtgh4ZmmTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kCaiypTY; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1274204434bso1005784c88.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 12:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771448342; x=1772053142; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4I9ASmF9ljQ0NQCC/MWXj1TYs/qTEfdHfffzqvwGNaA=;
        b=kCaiypTYIN39DkNr98m9nMVSKK0VfL0lsxS2xPHKJDNbj8ngmolzpIBTLjwfC4d3Ac
         spE25HqX41n9LbteZABxYrpIFCjbEVFILU+V+ZlXI3FR2Vj90QfcdkLiSJccmuc1AoCM
         HFzy3vnOOkOwmh4xW6CbMlEqt2rVdk2oSG9g1DDSuqbmgrDziopSLK9hEQh0qc5uthDH
         pDNAKv8/i3JqUT5eTQidd1rjrlZJJpY4kWN1/emzWsA6c3xo01MgMER8mrirAf51FpEz
         SI6c96zRWugZwGcW1fkrBFoDLDnvXA9O7FvHbQ7fN3GBeT0uAFkIL92Wrw4AkY3chtPh
         bzFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771448342; x=1772053142;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4I9ASmF9ljQ0NQCC/MWXj1TYs/qTEfdHfffzqvwGNaA=;
        b=vkozOiz1KMEhnEU3IJN5jjgI0ulHcViVW8Mw4m/tp5yBEuniSM9UwA9lx4yc6GinKC
         deP0jjx9eijCHjyzceFn7alRIatDjT9dyB5qnd5Kzxw6vqd5qkKi60uVNXIjyH9pu+fL
         Vma2J8TSYTY8E3PXRIPzehZsKZoVE2Jv72gBmauCUtL/WbMldD/TMGqunEgf2FOLCCb4
         EAgjWkmHon1tDLQ1rFKQoHjWsBQ5q2CgSSnrHlQRVJHeO9tt8Zw7etX2x5rcUFaYTSkk
         dOtXEycP7vtbSP3aKR2Jl5qpkQiZE/CC8jF2iduNJ0bmprIi9Cu2VPg/5kQsbZRU29fK
         VAlg==
X-Forwarded-Encrypted: i=1; AJvYcCVLQ9+KTov2SFtvTwkVuVBhnQUBXWQwPkFJuJs20xaDp91bvOBzV/Zigssn4NqMjBWwx2+0L/0EzLes@vger.kernel.org
X-Gm-Message-State: AOJu0YwByVjbcRYqjHBNeTQhY3hFZU4Nb9AFja1WmcbaRL/ZVSIBCwSC
	C5t4/+uhSk1uzbR3NvixzS5wn+xq3UQS2GNaImRYk2V5Imal9c1eGaxzx8KQMQ==
X-Gm-Gg: AZuq6aJUvkY7o7keW+hnEjRTsC5nfU5yFDjQ9b3nTmso8kIxX4SoDCTRAiycGptJDdC
	CM11l+22zL4IxgBkHMZ32WrvRHBUKmJ/JuFitPyKY0aUHOCGKwiog+0bAcpmE+ak8/2zRSnrUXH
	biXGaAaqeQFA812OI3v3qZ/gCoI3TQDCl3543zi8RJaarHMPgpY/UBODrGvve07VcueoHSN9Nnj
	mtmp4iMxjnEZ3790boS/lKrwEkG1Yt+quMYlVC4uv2QTKpN4V7kuwbChFHQVc7APLSC0xE6xwbS
	ccbDvoxKb0tQn8Fa4bsS+4nLzev6uAuPz4fLoJ/x6XAhKUkPZRYEj7pV8OdafGVdngDQSNCV/QY
	q5NtMWWvz7sADzrZ6jxeFx+nH7jxBGY+DJkCnHrmF+Y6Rb+vzMEhpqz0QG1g6GnIiHN4MNeeISZ
	8oBO2qvMY717nVACPjCkDZIfAQP0UrZT50IoVWJPak9xGjeHRHfBu7qKUIfSraQWR+
X-Received: by 2002:a05:7301:5f04:b0:2b7:4f83:9a84 with SMTP id 5a478bee46e88-2bd50a9aa9fmr1215235eec.17.1771448342097;
        Wed, 18 Feb 2026 12:59:02 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:265b:f5ad:9e03:677e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742cad9desm19386182c88.11.2026.02.18.12.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 12:59:01 -0800 (PST)
Date: Wed, 18 Feb 2026 12:58:59 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Santosh Kumar Yadav <santoshkumar.yadav@barco.com>
Cc: Peter Korsgaard <peter.korsgaard@barco.com>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH] platform/x86: barco-p50-gpio: normalize return value of
 gpio_get
Message-ID: <aZYn_xDxBXn_Ijem@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31820-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2E58A159AF4
X-Rspamd-Action: no action

The GPIO get callback is expected to return 0 or 1 (or a negative error
code). Ensure that the value returned by p50_gpio_get() is normalized
to the [0, 1] range.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/platform/x86/barco-p50-gpio.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/barco-p50-gpio.c b/drivers/platform/x86/barco-p50-gpio.c
index 6f13e81f98fb..360ffd8505d6 100644
--- a/drivers/platform/x86/barco-p50-gpio.c
+++ b/drivers/platform/x86/barco-p50-gpio.c
@@ -275,8 +275,11 @@ static int p50_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	mutex_lock(&p50->lock);
 
 	ret = p50_send_mbox_cmd(p50, P50_MBOX_CMD_READ_GPIO, gpio_params[offset], 0);
-	if (ret == 0)
+	if (ret == 0) {
 		ret = p50_read_mbox_reg(p50, P50_MBOX_REG_DATA);
+		if (ret >= 0)
+			ret = !!ret;
+	}
 
 	mutex_unlock(&p50->lock);
 
-- 
2.53.0.335.g19a08e0c02-goog


-- 
Dmitry

