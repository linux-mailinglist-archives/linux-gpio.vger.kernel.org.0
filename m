Return-Path: <linux-gpio+bounces-40115-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7rmPHWZ+V2qZTAAAu9opvQ
	(envelope-from <linux-gpio+bounces-40115-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 14:34:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFF275E328
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 14:34:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=cpbYMwHE;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40115-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40115-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5118A302B705
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 12:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504C046AEFA;
	Wed, 15 Jul 2026 12:29:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A65477999
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 12:29:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118574; cv=none; b=Di2zu34kmVsq5S8J2kCgBJ0SLBHC0gR09WjbOrarpVvsumA0jSTo3schbq37yGOZ/rjTxn3RjIOXb1LBlEMaFMPqke+RUqpsVhp/Jjg0lq5S5jawlDF8zdPyK1pgxUmzTb2aTkabMX/2hxCouv2ay3Vog53gJcVrGMzT0zPVNpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118574; c=relaxed/simple;
	bh=7OMxi2wn3pcTnq/QRCTZKYV20IcAsUskkeXOuIxgB7M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BkXxQazTrXL5AJPTdA4d9L2FzFtlH1XMgkcxuaJShOil9g5yZ03bXWSbTr/b1G3d3heukaKi7Su2/HKAsdhnBphCnqaW/FU8K3N6jftqk7uOpyjIf3kfm3Evk8nT4eafEraWv8Kv7ggBJZsyCqTmMjq5DxorQ5owxZ49IAANm4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cpbYMwHE; arc=none smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493f6de72faso11316835e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 05:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784118569; x=1784723369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TZb00h5hfFOKxcA2YDsgi1Cyl6kp++jnfEPqiAT7MH0=;
        b=cpbYMwHE1oEjcoFpIO/7dS+z+EIF317ArRjtdQZ2u8RipUpP08BNOBEGSx13KcD2SO
         LMjHSy8TDyXEQjG1TkUIdT08x1wugxUN8nflUqwWSblRBm8/jG8AaDTUHgZ634MXyOEQ
         O/ApC2iaccoRaoqPVrCFYLwxurQZOI21P7nzJ5OG6yvaQf9PWFTwxMOJ0i3cUeDA7yyp
         ImuUEsZ11CFPO4NeDC9gFYzYjeZnXw+0GEmYFimdFKSW+e+B9hr988w8k1qG2MM1UkJS
         EfgYluZVxuihXcHIUuohl+n/J/7dz4C0HK5mQlzScKKBRKEeQZN3ibJEOsKMdrygUi/h
         DaUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784118569; x=1784723369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TZb00h5hfFOKxcA2YDsgi1Cyl6kp++jnfEPqiAT7MH0=;
        b=nIhk55jEdVlO/dc6mH2F1G9Y39GFp1mSp3ESJrV49JBLlqCOll4JROYMRe4d7E6UIg
         seOp57iqpjv2hljeMHuM/+YCbEK6ISU8LstyTM3PSRmTd5UFIsd5qpx4PmmrRVLVC+Qg
         IXVcXtpbLCKjdr3yKfUOIE3T8KQvC/neQELc5+Lj7pqKyRdoOPFVAMsLuVwgE3JAfHSi
         8IWfNrhAf/vKC+Id5Kea/QKPM63C636U7Gci3KpYXFhtPqd0d4V5Gm9RJuEarTZTZ/xi
         vukyYuEmW0Sm5NKz1gR6qXHnEqM9G/IHU+A94ewkTkUABuCrirA5SMErlWEHZwQPXcuP
         gYIQ==
X-Forwarded-Encrypted: i=1; AHgh+RpPspdC8U8xHk/WW1MXsApYllqVQFRUB7mK0zVn/cwvlLt6OeKs8ZeNl/9WvRHX4mt8d9YOm3gDF3HI@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0SwMvVbe5P7TWh9tgne36cLCsueOvvE/aLRzzbRSWatrRseRX
	pgDg8Ej8nqnLg2SQT5U3HmOulYI+b4uSqnLImw4yRnZkhyBF5WdXS16j
X-Gm-Gg: AfdE7cmUiiAyaD73Z8A3uIRqZOkdtl84TjZyX/gt3yEOpQT9gEhgxA98/v05sj++Nz1
	E4hXgo7fy9eXX4kggHDMB2AHisTJlddTrY7bwmrdefMKIMectOvt7yIFFWi1pDw/MQSWpEw2Ql3
	NobCSX5STHsN8Si0aJVfBiMGu5CAuAjk5hC5hkmujSQDatQTs/8chqMBGqxZdGr/XZrgrcTyWar
	Q06j326UspTsLR9WM0MR5+Hk7cyFn99NFFkmY+/INhRgb27xcIOVeWbbf3bfhromQnewiOP9jOJ
	V2+K9gPT1FfA6E175NZKZ4sVnFajoOWMOuzvxhEq8Tqf73tg26lGMiTB/64PeL8inORdoXdYQVs
	0xiFFDd1v0wrAA+mvxN7nTeTlLWd0isgiMvAJF4JQPXLXo5w/MbCiHM/VjCYZNdoQBVPfFBCtse
	USOjRRmY6aG5WorsHPXBD9mAzPxujHotm0sw==
X-Received: by 2002:a05:600c:8b32:b0:493:c566:7bd6 with SMTP id 5b1f17b1804b1-493f88db5a9mr173251105e9.18.1784118568917;
        Wed, 15 Jul 2026 05:29:28 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a32a2casm216770715e9.12.2026.07.15.05.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:29:28 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	linusw@kernel.org,
	brgl@kernel.org
Cc: openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH v1 0/8] pinctrl: npcm8xx: fix pinmuxing and configuration handling
Date: Wed, 15 Jul 2026 15:29:15 +0300
Message-Id: <20260715122923.1938327-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[lists.ozlabs.org,vger.kernel.org,gmail.com,google.com];
	TAGGED_FROM(0.00)[bounces-40115-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@codeconstruct.com.au,m:linusw@kernel.org,m:brgl@kernel.org,m:openbmc@lists.ozlabs.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:avifishman70@gmail.com,m:tmaimon77@gmail.com,m:tali.perry1@gmail.com,m:venture@google.com,m:yuenn@google.com,m:benjaminfair@google.com,m:taliperry1@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tmaimon77@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tmaimon77@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6CFF275E328
X-Rspamd-Action: no action

This series cleans up several NPCM8xx pinctrl issues found while
comparing the upstream driver with the newer Nuvoton tree. It trims the
bmcuart1 group, enables RMII outputs from the mandatory RMII mux path,
fixes the RG2 drive-strength encoding, and corrects a few GPIO and
pinconf details.

The remaining patches clear stale GPIO events at probe, move the GPIO
direction change out of IRQ startup, and fix the IOX2 naming, JM1/SMB7
flags, and debounce selector bank calculation.

Tomer Maimon (8):
  pinctrl: npcm8xx: drop RTS/CTS pins from bmcuart1
  pinctrl: npcm8xx: enable RMII outputs from RMII groups
  pinctrl: npcm8xx: support RG2 drive strength selection
  pinctrl: npcm8xx: clear pending GPIO events during init
  pinctrl: npcm8xx: rename GPIO7 IOX2 signal to DO
  pinctrl: npcm8xx: move GPIO IRQ setup into request_resources
  pinctrl: npcm8xx: correct JM1 and SMB7 pin flags
  pinctrl: npcm8xx: fix debounce register selection

 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 191 +++++++++++++++++++---
 1 file changed, 166 insertions(+), 25 deletions(-)

-- 
2.34.1

