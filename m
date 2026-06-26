Return-Path: <linux-gpio+bounces-39044-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zzsVLRfrPmr0MwkAu9opvQ
	(envelope-from <linux-gpio+bounces-39044-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 23:11:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E1E6D0306
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 23:11:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39044-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39044-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0B98300D877
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 21:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54EE537DEB9;
	Fri, 26 Jun 2026 21:11:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from std003.phy.lolipop.jp (std003.phy.lolipop.jp [163.44.185.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB562FDC27
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 21:11:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782508308; cv=none; b=OZHCucVGJnVA7z54oQ7nrGXvRBr/XDX32BBeA2Vb9q/PAn/fsJtCIybeTwwqSvcIwtosLXVkjUFejx78CCWD+gwlyYwDyhmYoHkTuhpr9Sv1s4UjLJ/i7LVnLCb09JAERF+whJveIn/+ruVl5PyQjxIU/XUwQ7pVl0dHmTslmt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782508308; c=relaxed/simple;
	bh=oOgDUit7B5lL/SiyqacjHadDrzrJjmnqYpdlo730Jrw=;
	h=To:Subject:Date:From:Message-ID:MIME-Version:Content-Type; b=lo3D6r3pfx+KErRqykMd9Q+JruXelzqrl3wNyNdlEE4vb08enCpEIHbavmfm8SyfcSoN7nDeNV2oC3Y54CZOfUApC+JKRvda6yR0pPBrXghS3XSXmDHHLGc3HVN1bUHv9+85IwC+1RpLjQzKUodNpS/SnTyDQLPIOMIv9OGCAqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mais-beaux.com; spf=none smtp.mailfrom=mais-beaux.com; arc=none smtp.client-ip=163.44.185.70
Received: by std003.phy.lolipop.jp (Postfix, from userid 995)
	id 6BC3A1C0AAC23; Sat, 27 Jun 2026 06:02:18 +0900 (JST)
To: linux-gpio@vger.kernel.org
Subject: =?UTF-8?B?44Oh44OT44Ol44O8IO+9nk1haXMgQmVhdVjvvZ4gIlt5b3VyLXN1YmplY3Rd?=  =?UTF-8?B?Ig==?=
X-PHP-Originating-Script: 1786492:PHPMailer.php
Date: Fri, 26 Jun 2026 21:02:18 +0000
From: =?UTF-8?B?44Oh44OT44Ol44O8IO+9nk1haXMgQmVhdVjvvZ4=?= <wordpress@mais-beaux.com>
Reply-To: unison.bass@docomo.ne.jp
Message-ID: <hufge4VoaU0va0rruJBCexfh9quENqQvsue6R0pS3pY@mais-beaux.com>
X-Mailer: PHPMailer 7.0.2 (https://github.com/PHPMailer/PHPMailer)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.54 / 15.00];
	X_PHPOS_FAKE(3.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[mais-beaux.com];
	RCVD_TLS_LAST(0.00)[];
	HAS_PHPMAILER_SIG(0.00)[];
	TAGGED_FROM(0.00)[bounces-39044-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_SENDER(0.00)[wordpress@mais-beaux.com,linux-gpio@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_REPLYTO(0.00)[unison.bass@docomo.ne.jp];
	TO_DN_NONE(0.00)[];
	HAS_X_POS(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wordpress@mais-beaux.com,linux-gpio@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	R_DKIM_NA(0.00)[];
	REDIRECTOR_URL(0.00)[tinyurl.com];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,docomo.ne.jp:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E1E1E6D0306

メッセージ本文:
Photos for my escort application are uploaded.   
Let me know if the quality is good.   
Preview: https://tinyurl.com/bdcv736n#tOzk2f

-- 
このメールは メビュー ～Mais BeauX～ (https://mais-beaux.com) のお問い合わせフォームから送信されました


