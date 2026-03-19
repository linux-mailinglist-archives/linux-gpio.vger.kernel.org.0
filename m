Return-Path: <linux-gpio+bounces-33783-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DsWEt5lu2mojgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33783-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 03:56:30 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C11332C531B
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 03:56:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C9B1309E2BE
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 02:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9F643859C7;
	Thu, 19 Mar 2026 02:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BnlquoWI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BE034F255
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 02:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773888987; cv=none; b=ZWRU+sIysSS/Ro52ndJDvi4z1vLAJJlW1BJZ+l9mhwt4URJsEYDoNjV02H1nOKFuNKQdy4vaqYs6E2slRFwmROCZoNYxJAxBz4XDIvKQFJXoKHzlPmhthAIXk53Qkx6VnlQWXZ+BcQzi6JcJiPYZ3CrktEEUMwnUgwMVeCJZRv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773888987; c=relaxed/simple;
	bh=KMrCVoD5LrnOn5zkEXVr2yMChkZ1B/BYXUxvNYVU10c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dQ/zRHYZTIhdHm1Dp/fDWTjBYKfoxY3KXcvaXtrHGMU2hAJiswfQ2aKVfG7SDuRqB7lMRE+rwBOqCLaqPpuymDyPrJohkz1LZbkdU5gAMNQjMKOWvtlOFvGudECoJhPpix30HbkpXRvn5Wo6tP1pvJ/J0vMlX0eMc/vBye+Hnd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BnlquoWI; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1271195d2a7so271548c88.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 19:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773888985; x=1774493785; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fFQ/cIHAPkT6GWASuSfr6W9xPQcgCwF/USNF67U5DTE=;
        b=BnlquoWI/JyjHwadJP8YghI+9KTROZM0bpW+DMxlNKbL4od9nACbySrq49YcF/VH8x
         wsS3XUM8BX0uCITrMbh+34hLg7L4DpUdDXregSJevaEKF2QV0Bwsz6NX08WhsbiqFP5e
         zWEl6tJNBT82deGI0BJfT3HSbhmk6nD7dG60mEOYQiFsTe+mVsyXLNhgh70mqtjRZTr8
         6iLfBW5LWNYlRkaPzIP/WbUOdUA360oeOMeeMUxpYsTTL3x+99VeHbxvGsc9OPEiZGXb
         sdVUR04XK76I4SkmEeHSu9wItqpilosdO0Id72Dbe3w5WNj0lUYrxy6FrK6FgRDLNQY/
         cRig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773888985; x=1774493785;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFQ/cIHAPkT6GWASuSfr6W9xPQcgCwF/USNF67U5DTE=;
        b=gsUoxFsyEsz4qud1rGJUrEXfHsX3n1tJQZud7Sq0B4kWG4VPfsGpuizJ+Y95v32TUh
         lyZcu1mzrcbjIEtoWrlCoYP+nru9bt8jzgZ8P+OOY+97UXQjSK+e9uEO+FZIMPlsThFH
         uiwXW5reE5pJKxNr0ApEkn9JhSpdsbRRFCzOPoDlp7eodnvaOIKeFqEGzfzjeqrwyj22
         zcf92OJCrepcU9ki8/DtCYQVyGGsHsu7ar1ouqgWXbAwcA/AVt8HYeF5w04HUqTh9N4V
         IVlNPPhvM1NqqMTSRPGtCs/WCItmBH/q6FGNfeVaqaFfNxgmiCflFtl33YX+ck3Wv+5n
         eg7Q==
X-Forwarded-Encrypted: i=1; AJvYcCURflsmaWzRdCw0gTv+iMFTHoihyzMdCDdR0LSFXnyTkQ1pT9GnCww5cQ0H3pDKGmH6gbYYr56mOBSs@vger.kernel.org
X-Gm-Message-State: AOJu0Ywviy1sxWTDqwcY8TUdHXd029lceQZgvVwWP8x3Ceht4v0QlHpl
	uuxkGPCA7c0D8Awm1f21/ZT6PcMC1zDws3eUdW63q0Sw3Qhyx7CyhiM9
X-Gm-Gg: ATEYQzyXZ1CWjGb9pEBqjLpVwEDZ2XY9G0xncxm6a0iaOyHYPh3yVQoAvj3QXIa9wUN
	ixqFPx+Z4093DdchegFZ2nbROAQrZ1X+KtWFJF0cfxGA7WPoGgyVq+/IOcgbGu++jZGD2z4Q/XX
	3m9VOqXvaey9uyCCocAeqExKOBGqpeE5lzudGXt52D/vsvsy1skcEEr6DZXvD8SoQfzWFo/CHir
	/fpnVMMIE7IdwgDPpfjd5Pc7jmZUXQsFsCw5RVOb1HlZ0uXMpXm/KUeFj2RoRiNtqWRI95T7Cn2
	b/N1xxy0ekNrZsUoyrZKbL0ODQi8eWj17HJh/qj9GDkmbmo5Nx5D7svKRXgvUrFV9F9YRjWRuqK
	nqX4KIW7c+smdDU3z1YVBQhsrjDOt9ZYbFni74e9BRg+ZnS5uVSBQaY/WcbCT/Et5XQSPamqvun
	kn8TH1nES1xuB+Z6NQMO6j6rH1HFv8UgY4UCoUl8w8hH7imZtTde4ppdCizVfG/gmMJD1R2JQOl
	7G8/go9qu3xfA==
X-Received: by 2002:a05:7022:226:b0:119:e569:f277 with SMTP id a92af1059eb24-129a718fa4bmr2987156c88.32.1773888985184;
        Wed, 18 Mar 2026 19:56:25 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:5966:2bd9:1ed:e7c4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e55a53fcsm8250983eec.24.2026.03.18.19.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 19:56:24 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2 0/2] barco-p50-gpio: normalize return value of "get" and
 convert to guard()
Date: Wed, 18 Mar 2026 19:56:16 -0700
Message-Id: <20260318-barco-p50-gpio-set-v2-0-c0a4a6416163@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANBlu2kC/x3MTQqDMBBA4avIrDslVSKlq1K66Q36Q5FpHGOkZ
 kIiRRDv3uDyW7y3QOLoOMGpWCDyzyUnPqPcFWB68pbRtdlQqrJW1eGIH4pGMGiFNjjBxBMaXau
 WmHRVMeQwRO7cvE1f7+wuyohTH5m2FT0fvpmv8+Xum9vA49mK2C/vjYywrn+Y4BpWkgAAAA==
X-Change-ID: 20260318-barco-p50-gpio-set-c560daea533e
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Santosh Kumar Yadav <santoshkumar.yadav@barco.com>
Cc: Peter Korsgaard <peter.korsgaard@barco.com>, 
 Hans de Goede <hansg@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.15-dev-a6826
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-33783-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.993];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C11332C531B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

These 2 patches fixes a regression in the driver arising from gpiolib
tightening its API, and converts it to guard() notation when taking a
mutex to simplify the code flow.

v2:

- added reviiewed-by and fixes trailers
- added new patch using guard()

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Dmitry Torokhov (2):
      platform/x86: barco-p50-gpio: normalize return value of gpio_get
      platform/x86: barco-p50-gpio: convert to guard() notation

 drivers/platform/x86/barco-p50-gpio.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)
---
base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
change-id: 20260318-barco-p50-gpio-set-c560daea533e

Thanks.

-- 
Dmitry


