Return-Path: <linux-gpio+bounces-33586-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SH+oMG55uGn5dgEAu9opvQ
	(envelope-from <linux-gpio+bounces-33586-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 22:43:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E0B2A11A3
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 22:43:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47B8F3008D19
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 21:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37D0D365A06;
	Mon, 16 Mar 2026 21:42:36 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-2.mc.lolipop.io (smtp-2.mc.lolipop.io [133.130.35.48])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 155EC1DFD96
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 21:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=133.130.35.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773697355; cv=none; b=tB/N9r99r+K68oRoq+Bb76fqjopOyfe1QCQZ454h+LMiC+kPm3RrSy6M8dVcF106MvMO7ZvH8Mj1MtXspV1w0NAuJGsVleVefJngnRjJKKDpMWeAgp/yGRQjrFntWcHWPCZeCEUQZEi+vNUXX+9IOBQF43cApdDHEIjZ3Ppe0aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773697355; c=relaxed/simple;
	bh=xR8MGMbvrIu8GE3GKaFOB50sf9NHFQjJ90ZXI+lnnwk=;
	h=To:Subject:Date:From:Message-ID:MIME-Version:Content-Type; b=c06E2r8F+8AA3oDy+TVMbBvRqGFb/Wg8c8u38gauVBDOrfU7PP4u3mjD8flVY447+5tpfuB4IsFfdCUB/VPukphU5K8vPNVR+3QPaxoRfOAHuRSjFel0O8M61Oo4+/ZNJT6tTmoPm2smOKQnBdIoKOwNN8VZgyI2rS0mkqJD830=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=43fortythree.jp; spf=pass smtp.mailfrom=mc.lolipop.io; arc=none smtp.client-ip=133.130.35.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=43fortythree.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mc.lolipop.io
Received: from compute-3 (unknown [10.51.78.183])
	by smtp-2.mc.lolipop.io (Postfix) with ESMTP id 3CC0C5FD5A
	for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 06:12:05 +0900 (JST)
Received: from localhost (unknown [10.1.15.254])
	by compute-3 (Postfix) with ESMTP id 306E56083DB
	for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 06:12:05 +0900 (JST)
To: linux-gpio@vger.kernel.org
Subject: =?UTF-8?B?44GK5ZWP44GE5ZCI44KP44Gb44GC44KK44GM44Go44GG44GU44GW44GE44G+?=  =?UTF-8?B?44GZ?=
Date: Mon, 16 Mar 2026 21:12:05 +0000
From: 43fortythree <wordpress@43fortythree.jp>
Reply-To: info@43fortythree.jp
Message-ID: <ur5cpr3ZyMSTAHv3gUgWyw7bb43YSzlbEtbPObJCtdk@43fortythree.jp>
X-Mailer: PHPMailer 6.5.0 (https://github.com/PHPMailer/PHPMailer)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[43fortythree.jp : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	HAS_PHPMAILER_SIG(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33586-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_HAS_DN(0.00)[];
	REDIRECTOR_URL(0.00)[tinyurl.com];
	TAGGED_RCPT(0.00)[linux-gpio];
	REPLYTO_DOM_EQ_FROM_DOM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wordpress@43fortythree.jp,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.457];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	HAS_REPLYTO(0.00)[info@43fortythree.jp]
X-Rspamd-Queue-Id: 01E0B2A11A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

お問い合わせ頂きまして､ありがとうございます｡
こちらは自動返信の確認メールです｡

Name:
AlkabCab

Email:
linux-gpio@vger.kernel.org

tel:
81368796739

Message:
Lost your drive and smile? It happens to the best of us. But you can reclaim it with discreet, effective solutions shipped fast. Privacy first, quality assured. Explore our mood range today.  https://tinyurl.com/4y49jkhb#9pDch5


