Return-Path: <linux-gpio+bounces-38730-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id //9sHjGBNmqHAgcAu9opvQ
	(envelope-from <linux-gpio+bounces-38730-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2026 14:01:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 011CB6A8D88
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2026 14:01:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=YWZ5cDTF;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38730-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38730-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E5CF3013ECC
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2026 12:01:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86DD7391E4C;
	Sat, 20 Jun 2026 12:01:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301D535F610
	for <linux-gpio@vger.kernel.org>; Sat, 20 Jun 2026 12:01:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781956905; cv=none; b=ipvV40K0LYpVLgOx6IsOkK9KmydLdISCjpici02kmQUlZ692Nt8PjIvyplNDLjJh0NYfJIz5tOWN/YHyVtJUD8qD9aei/LZnjXz0z/jk61fa34DE7zueJtEdpMCZy34BPAGH+oeJ1O5OI52yMa2MAIO79iumm62myVH/XHNEIjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781956905; c=relaxed/simple;
	bh=CA2EluKUSI/xsOuH5RmYnU500OoCzhC4mJOfTmY7BIo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XGW/4siaG0cSdMgqtuZLt/tvxZ5WBQ7ZzD+20eAYGaT7/yyPpPVej28bJMMgM2kcGUXJ3XPPrYz+hN6hSijWNckdybX9k5Ey0nJddySbjqe01TV+Y//qh/GhJoMewicpjffJAWV++t4KJKL9fcE+AAnjbmlafbW4rWd6ExCe/10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YWZ5cDTF; arc=none smtp.client-ip=209.85.128.50
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so23168325e9.0
        for <linux-gpio@vger.kernel.org>; Sat, 20 Jun 2026 05:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781956903; x=1782561703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EJEnjPcAS7Qa9S1BAuRrToUNBclyy4fVxXFWUylAz5Q=;
        b=YWZ5cDTF98z8ODvc5bjS7FYiWadywKzqhCq3fRBZTadL2aVtMwLN2rkk167P/4gGw5
         tlqM6VRobxTYohDPKD5kNIgeYDWPKNEy/X+PZvb7MXeE0yHb0i2uCw0eY24dVLlE7utC
         FBUrvd2ysVj2KtAmQSk3/UsHvqQxveF0K2aq3F+xBvPQVreFOaIVDbp905m5Baadz2Hp
         T5bmu79++gqFqSEtJcs7BzfOZJjBuXiaRSNDa4TZ0U0mv/liHK/RlBJv8+k8U/3cB+HR
         ovYrth/I5+pY9u/A/7EepanhkEhfQhFeQbcDvPrdw+vVPstTqbTl0bi2XfCOxfhE43DQ
         5k6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781956903; x=1782561703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJEnjPcAS7Qa9S1BAuRrToUNBclyy4fVxXFWUylAz5Q=;
        b=iK4+9L0AexjqVNZ7ebKNLn5NFpG04HkqfTr9qtCXIGxJ6nsOfmb0gVZXOgd/PJSTCm
         XUO9tZKLB66pe7b+bGyJaonvgARNqISWm9e50z1O5cf/3cyPfeP52NcelbJbcTAYi5u2
         EuaEPlOMMKM9E+RYMoxrwlIDi4RWzhrjgdQEUCRiJXahbR96QUdl0MAtY+j+33VEcFmQ
         qpEDz33YRdL6HsDc/Ra/BBG8ySJTtQEePFXWhykjqF6f/BROof74xgWN/BkFWe+3VFYH
         rgI1H0gCCN2WBKa3WOiTXp8cgpY1M1ebmh37DhnSLd4ocTMZTO2ofE/soO4CrCLAQ/Qx
         Vhpw==
X-Gm-Message-State: AOJu0YwKQA4v77du3EVpi3QUatCE6LHZwPNzqBMnl0mAmaAiMMsBC8np
	fMvWI5m11MfML/WfXrHvQFydPAFlzXNsmRgPSK41YWxQgQIe7vlx3Cs1OQnngw==
X-Gm-Gg: AfdE7cnrVWOvif1cF3H73F7jCxHbPuot8frS0u2Rrf4JA1SsxZow3+7iHZW91pj/M5l
	YfrjhRjQfFplEmdhg1m9CzUakJW+5KCh0rI3z7iciKcUfaVbrAA7PMT4rodFhxxYjOC4Lhmy3gg
	4CNtG5AjigZqP8OOhXpUzmPbj2Fv3Car/1ExTfMiN9Z2sGB5vNHZbFsVCm+2ZsNlFqYav5d43/K
	YMtSpiuLiBqfdYS4jSxkfm/pROT0okjw4uRHHeiKK8j7HDsyt/Mj91fOhrelAsU0oDVlMbovSwV
	PdgAqNaPxZUyvRhEKV8KBbR6WinIMv+N1IxilwREASnBOPpDJ3nkWlWjWjOTdtvsHcNN3D2kJFm
	8vyOEoxWcfgkwpo/xV5awnpT4Bnawi1Byif968efnOXmXGehZGdmtnHasFdtd79gaTA40guBn3I
	PYicFLZWGaERSz37le/juyOV2bk7pT868AygwcvZKh43XJrgBhcSF8iJLpY4A=
X-Received: by 2002:a05:600c:c490:b0:492:322c:1dc3 with SMTP id 5b1f17b1804b1-492425321b5mr96701055e9.16.1781956901543;
        Sat, 20 Jun 2026 05:01:41 -0700 (PDT)
Received: from camaron.. (147.red-88-9-50.dynamicip.rima-tde.net. [88.9.50.147])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49240ee9bc2sm93161565e9.1.2026.06.20.05.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 05:01:39 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: linusw@kernel.org,
	brgl@kernel.org,
	vicencb@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] gpio: mt7621: address Sashiko complains and other cleanups
Date: Sat, 20 Jun 2026 14:01:32 +0200
Message-ID: <20260620120136.2482872-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.43.0
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-38730-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:vicencb@gmail.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sergioparacuellos@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[sergioparacuellos@gmail.com,linux-gpio@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 011CB6A8D88

Hi,

This patchset covers some sashiko complains reported at some point when IRQ 
mapping was being fixed for this driver [0].

Since this kind of issues are almost in lots of GPIO drivers, I have not
included any 'Fixes' tag at all on all of them since I don't really know
it is worth or not to apply them all in stable trees. Let me know if there
is a need for them and I will be happy to send v2 with ehatever change is
requested.

Also, let me know if these kind of patches are not needed at all so I will
not send anything similar anymore.

Thanks in advance for your time.

Best regards,
    Sergio Paracuellos

[0]: https://sashiko.dev/#/patchset/20260609031118.2275735-1-sergio.paracuellos%40gmail.com

Sergio Paracuellos (4):
  gpio: mt7621: avoid corruption of shared interrupt trigger state
  gpio: mt7621: more robust management of IRQ domain teardown
  gpio: mt7621: be sure IRQ domain is created before exposing GPIO chips
  gpio: mt7621: unify naming style in driver code

 drivers/gpio/gpio-mt7621.c | 63 +++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 31 deletions(-)

-- 
2.43.0


