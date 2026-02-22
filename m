Return-Path: <linux-gpio+bounces-32002-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WM5UL2qSm2mj2QMAu9opvQ
	(envelope-from <linux-gpio+bounces-32002-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 00:34:02 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B7A170C93
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 00:34:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A21E5300BEAF
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Feb 2026 23:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EC2635CBCB;
	Sun, 22 Feb 2026 23:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pm5wcoJR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mGtmQXeK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E90335CBB2
	for <linux-gpio@vger.kernel.org>; Sun, 22 Feb 2026 23:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771803234; cv=none; b=NF5YAVV445jhK+okVQVpPxQ0wIH3VU7A4ZweVxmm3JUUglql1ycSWft25j8jf5ipJqQlizPaAhdQWNp/gfwOH4p60lu1VoKBuSHph9Jy+Pu+9WBiLR+xgxIK7gZ955EltKaZBYf9i7c7RVYqZRwxod8kc4nyI1V3e3FNbg8Xpv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771803234; c=relaxed/simple;
	bh=BV0FX812hhMJc09OZ/H5NkrNDb6H+BjtsMjGNSn27Aw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rMe43OvDm4HBWaS6g7tGpwtlh7lSyZCSy6lHXsb6JrItggDbTyxhcnJlzS9+NM5gWbhe4AR2eRY/Nd97Qgeq/AR665cmPfhLU5qQYZK1CfDrqU1ROnPFTR24F0QVd2MFTDNkanbi5cNVVlgmA3hnAx5796DXTmwHM0joR70oAUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pm5wcoJR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mGtmQXeK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771803231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RIRG/oAizRY+sfWU+G4m4sVDoZDucRCvC2hxQjpAO8s=;
	b=Pm5wcoJRIRlJL/7wFgRNGrltwbmPhzKoxV8/0jKDiUEVL/7raGsm1I0BeQndRUXEqpeRUX
	XQgK+RCLA4uk/JolOnE648Ky6l7MDfuFZZX9OjpmDfccYGVtiBHU0NeYtLC4LrMoW8fSZy
	JGk13C8NeV7TY04l6QtNnAP1hqfuw8k=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112-WGELzvaQM6mYqFZChKtssg-1; Sun, 22 Feb 2026 18:33:49 -0500
X-MC-Unique: WGELzvaQM6mYqFZChKtssg-1
X-Mimecast-MFC-AGG-ID: WGELzvaQM6mYqFZChKtssg_1771803229
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50336ebabe0so751744541cf.1
        for <linux-gpio@vger.kernel.org>; Sun, 22 Feb 2026 15:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771803229; x=1772408029; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RIRG/oAizRY+sfWU+G4m4sVDoZDucRCvC2hxQjpAO8s=;
        b=mGtmQXeKTcWwYXI//itzBHlQXew7pDELpwLq0OFS8NFO/yj+O0kd2odEuRBXNpl1R5
         FVoDh/5oq0OTHc+bwYOfgaXdKpq8zN/WIetKSOSTdBGjH7c70IAK6i6xm1HBuZhmif0T
         URhc0+BK2YrAtY7gDxt6ptFPSimdS+3gL7hGgzSdxRrkqS/vsUFP1C36oEUELvOEylZI
         FUJkDZ7NnaqxpwGA4csQyq1h5iGFu11ylTuWMErix6qwm6xs66/ra1cLT5430lYNIvVj
         vYBHrJK0oG+mvaxX6wXCxzAHfC8ileklJGORVnlZLSLLb/IhsN1BYP9rP5L/UmMpRXhk
         Nj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771803229; x=1772408029;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RIRG/oAizRY+sfWU+G4m4sVDoZDucRCvC2hxQjpAO8s=;
        b=O1V+2J7+k1eP64qitAewrxWZRMNkYNwrhKGuJFb0awLt23ZSV7PD3YhAuajCGi/n4/
         7NFqsJK/PFePDWOnQoVJTRducayfzY4Tgg10XJ54K1y70glikJHW5HGsLVdslk0QGTof
         Rqb6Ayp9HQpkk81RybaoXQ1ILuCHJXFxjtWIoipKqO/OWibxpyopeW7h1RaPL8+WR5kY
         esrgc4fupKxTXI7y2qWk0XJpCdacYza2eSkLtLAFoPKa6iZZCK1ZzrzcoCGL0YTfRK2S
         jUCziYA0ezkQO8CRn0Iwu62KMO0tLYID3M2RKHTqo1ZEe6Z+k02nz6VnaLTdCAoo8V5i
         Qxzw==
X-Gm-Message-State: AOJu0Yzr1G8dVPGcbHi1uPw04ukoh6zy+wXxsf7lxvHj1b0ib7++eysg
	z997C4Wz2ejIe2ue1uJOzXKgWRCPZyyOWLeMJLSGFqaN++wMyJLTHKukSa1KsVuU4s8f/7FmOg7
	eNAvCREVx70q8sgSfb60krqvTzmcYulZztK8s3dVISgcL7oFhgmtlMpkJutKRMKQ=
X-Gm-Gg: AZuq6aIMurNbKHJ80IuALJN6+jsbQIE2Y5fROtz14nugIq74KpXwDZxkyBcTOtZg7FX
	JeQIUkHsPJgEdbyxDje1LX9D88iViubnAfzbcuOSgFXarIt4kiwO6atrO6SxTGNBgKL/E+RVps8
	wvKGEs4Onr+2SzgQRslU2KjpJrQ1yHp7mcmHv2YAKol9fo1/BAP+qgqHm9FgQ0CROEVp+GErvEf
	odKlxjQA35tTvzGmxMM4FNBz8YgFPi+GdRMQ8UYw6muUhQio9iao9LchT8iWLX8bFLG+EyAaBHk
	DZHrSrwb/RI9aYw6ii8eFyWZB2Y1t2VLI97Y7Nf64Qpf/YKRhD0gTcA30S9xd6AVwqBoIe2prwl
	n713pguxcvfUa4+WGpNzHsFFxYiVaGRe1CVdcUyk3WnQSiFLBQoH0628zl0Qn+A==
X-Received: by 2002:ac8:590a:0:b0:4f1:e79a:1e0 with SMTP id d75a77b69052e-5070c2c17e0mr97750491cf.20.1771803229272;
        Sun, 22 Feb 2026 15:33:49 -0800 (PST)
X-Received: by 2002:ac8:590a:0:b0:4f1:e79a:1e0 with SMTP id d75a77b69052e-5070c2c17e0mr97750241cf.20.1771803228908;
        Sun, 22 Feb 2026 15:33:48 -0800 (PST)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5070d6a2759sm53231931cf.17.2026.02.22.15.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 15:33:48 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/3] pinctrl: pic32: allow driver to be compiled with
 COMPILE_TEST
Date: Sun, 22 Feb 2026 18:33:28 -0500
Message-Id: <20260222-pinctrl-pic32-v1-0-db86248da18d@redhat.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIyMj3YLMvOSSohwgnWxspJuSnGRuYGqYaGFhlKQE1FNQlJqWWQE2Lzq
 2thYA5ZCKQ18AAAA=
X-Change-ID: 20260222-pinctrl-pic32-dcb7051a882b
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Joshua Henderson <joshua.henderson@microchip.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1066; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=BV0FX812hhMJc09OZ/H5NkrNDb6H+BjtsMjGNSn27Aw=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJnTwpycG34KFKdU9G/ZO/hGIE+FfPAPRNC/1Rd6RPee
 DJqVZBbRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABPZ+5iRYedC1ktbz3O8NO19
 s+JBzyFTnxmMdiuefi7mz2I88+7g13eMDAt6M/f8PG6anrbTMnuZkdIU16sJD8vc4tkld3WFnGo
 x5gQA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-32002-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url]
X-Rspamd-Queue-Id: D2B7A170C93
X-Rspamd-Action: no action

While migrating a pic32 clk driver off of a legacy API, I mistakenly
broke one of the drivers, and the issue could have been caught with a
simple compile test. Now that the dependent patches have been merged
into Linus's tree via the MIPS tree, we can now enable COMPILE_TEST
for all of pic32 drivers in this subsystem.

While changes are being made to this driver, let's also fix any
outstanding checkpatch.pl errors with this driver.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (3):
      pinctrl: pic32: change all cases of bare 'unsigned' to 'unsigned int'
      pinctrl: pic32: use consistent spacing around '+'
      pinctrl: pic32: allow driver to be compiled with COMPILE_TEST

 drivers/pinctrl/Kconfig         |  2 +-
 drivers/pinctrl/pinctrl-pic32.c | 42 ++++++++++++++++++++---------------------
 2 files changed, 22 insertions(+), 22 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260222-pinctrl-pic32-dcb7051a882b

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


