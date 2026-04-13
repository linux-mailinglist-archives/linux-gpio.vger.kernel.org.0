Return-Path: <linux-gpio+bounces-35123-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qB8sOQk13Wl9agkAu9opvQ
	(envelope-from <linux-gpio+bounces-35123-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 20:25:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E62F3F1F51
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 20:25:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 404A63016526
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 18:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 466AE3603F7;
	Mon, 13 Apr 2026 18:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y4EDElcR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5EE35AC21
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 18:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776104709; cv=none; b=F14E25ZJ8OouLmcHo7kv2YF3RF9xjc/KRMjOL0SBU9eQT7xNy3Tvs+j99iFfMUsF4vRoar80XA2cw6KYaLSVWjNWqzHAzy5oo/OKD6tiAF0OK7Or8BWS9go++HqeglHZX9bbJkJaQYdzot1hE3I/QNaxSIyze51D86XiGO//1Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776104709; c=relaxed/simple;
	bh=1O3P9uAmh1fmqGR3+o2H3nKp9pPvyNNnodCkQGOTg3U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cks1MThouuoUK+RMMrKJTnDhGS/i/bqKtr/XYnnc+CBLg8f+ONl5sNHgHDnCR+5SHrgHErEphX8MBZlGiT89YVXkZcTPHuP5MvGI4pEKHdKB9vVft705WkHdbp1DJvsfcQBk6CxqEiGiwC5vjxQAUxTIglk38mlBFMlddjWemao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y4EDElcR; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488aa77a06eso79968665e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 11:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776104706; x=1776709506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v/sbVWUBqo6dyulLhzj4y8bSGCYgaLaAODnsQiIDy+o=;
        b=Y4EDElcRd4aaevR3655If4/KBO48TXBCsVwcRLr7voLYmRGQcnxagdQXT3vd3j4KKI
         K8KGyqXp267GbHmGNe6fg797vVULfRWyrOlaSzlkFvpForM6UjjVATCKRPmWXP5dHG/3
         W1gUkMN5IOfS0bsrR6xPd5RW1qGwgxBctsRXJqQzZxGJpWmeTzv8Gs4ZEIPIHbArWaZa
         /O7JypEtSnfLU7r2K+SbD4sUX2LOVFQ9xIOsUGo1RNR+3XSV9G0zKWjBLfGFqq3DCOB6
         Y92wbkwhP7Y4QUc/UkNyygXt4cNAFcrhR/CyX97EAZN1BDQZwuhOJv2pH6EZJUo70GXQ
         pLSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776104706; x=1776709506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/sbVWUBqo6dyulLhzj4y8bSGCYgaLaAODnsQiIDy+o=;
        b=MdUmfI7AlbZ7Xw0i8VI/MWMMWMiMIaxpEx2O4/MEnndrGDal0tW1x++08034zQew2D
         7EIHn5DoHlDgJfrBXyG+AS+xusgrWuagPv2cN7kY1TSrh4z0EfJnMzkM69nWXU6zgPWp
         tqDVTMbFnOKh6LohSsSvCM7+imRhUxyLeHD/Wz6t3jtWf+Q044tJat6wawoU7yhmhXvY
         V/gRhxtpaGwy1LBayEtI0oaYuxCdDvk8k3AIzAxmrAjfqajsKmrKjsaQwDq3LyH+ALJ/
         JXPdTp3MWOvVd2cVvQoWQwG+HeX4n+0WJTrGxf4rPss/afKw+BzJPLZvLRKygEzYb+xL
         wYfA==
X-Forwarded-Encrypted: i=1; AFNElJ9SYLMeqtH/nqiFmprsbY8gzvFsWHNXS/Su92zlAyPnXBsVbWO/kUSWPL4r7XoBUC6EFCq+avXsNxy2@vger.kernel.org
X-Gm-Message-State: AOJu0YyidWqkWMoW7qqXHGzgdmohDUVTf5gQk5oineLW34CvFoRfcXNG
	lDr4uMdIDD1xEEaXLXVlYYxKY6q4voJool1L6VZ9/S1s8al/ZvWCpPPt
X-Gm-Gg: AeBDiet5O49+eRigs7hCoCYbCMTeZV+t1z8T2wagZ/S7U7nej6XAPYDejJYqdxlOY6g
	Ct5RrF3q9q/j0J/Vsjx8xOYC8TRIn7nqhGiHxwLsFmdN11UcKC9NqpmY3XjUwGZVfeUWI2f+pbj
	3IEUPEstrJXxRyicwTeJrES8VUqGO0jopJzw+4tEXUYBcukCdwklNj1/cxaWnpE9GWnsz5lHbcI
	mdjASqNkPznd+5scJ8KchqKC7VHKmM1s7ge6NYhaLhZ230dZ8opDlrSRMKuLUIdiz7r3mTERLY6
	k1h+4pZBKLcQTWG4vZ1ySKKiqRWNC/gfKS9vYQWwt6+vHawIaIfFhdQ0et5rMRhYOIIkzxpNEW4
	LFdXCtvHoQaWD869Ru9k1+2+cx8XWdHq2Ptf1cfKBh4DcPja6X6evhKn4jyN90VxNi5prc/ZlJi
	zNqQJw8HvxFy1rtorVkMZ9DhhMHzLayV4qOuGUk2lNEgh/QLRprV/tCH5LfREdw4EWO/9AjyK01
	hqNYJmPm9z8D1C8+2526dsd7rfAA/lSg5h/r7foE0dF9Ek=
X-Received: by 2002:a05:600c:c117:b0:487:4eb:d125 with SMTP id 5b1f17b1804b1-488d67e370bmr135180195e9.9.1776104706057;
        Mon, 13 Apr 2026 11:25:06 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:8060:3087:2ea2:f494])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5b56d1asm301175695e9.15.2026.04.13.11.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 11:25:05 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/5] pinctrl: renesas: rzg2l: Fix PM register caching
Date: Mon, 13 Apr 2026 19:24:50 +0100
Message-ID: <20260413182456.811543-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35123-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 1E62F3F1F51
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series addresses several issues with the PM register caching
implementation in the Renesas RZ/G2L pinctrl driver. The changes include:
- Fixing SMT register caching to account for the split SMT registers on
  RZ/V2H(P).
- Adding caching for the SR (Slew Rate) registers during PM suspend/resume.
- Handling the IOLH configuration for RZ/V2H(P) in the PM cache setup.
- Adding caching for the NOD (N-ch Open Drain) registers during PM
  suspend/resume.
- Ensuring that PUPD registers for dedicated pins on RZ/V2H(P) are included
  in the PM cache.

v1->v2:
- Patches 1, 3, 4, and 5 are new.
- Patch 2 has been updated to include a dedicated cache for SR registers
  as pointed by sashiko.dev.

Cheers,
Prabhakar

Lad Prabhakar (5):
  pinctrl: renesas: rzg2l: Fix SMT register cache handling
  pinctrl: renesas: rzg2l: Add SR register cache for PM suspend/resume
  pinctrl: renesas: rzg2l: Handle RZ/V2H(P) IOLH configuration in PM
    cache
  pinctrl: renesas: rzg2l: Add NOD register cache for PM suspend/resume
  pinctrl: renesas: rzg2l: Handle PUPD for RZ/V2H(P) dedicated pins in
    PM

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 113 +++++++++++++++++++++---
 1 file changed, 102 insertions(+), 11 deletions(-)

-- 
2.53.0


