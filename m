Return-Path: <linux-gpio+bounces-39756-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SeYWHpTST2ozowIAu9opvQ
	(envelope-from <linux-gpio+bounces-39756-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 18:55:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAD8733A17
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 18:55:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=patronsbuckeye.com (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39756-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39756-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 51AC83002F68
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2026 16:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91E1339A7FE;
	Thu,  9 Jul 2026 16:55:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from ded4220.inmotionhosting.com (ded4220.inmotionhosting.com [192.249.118.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CDD2F0C79
	for <linux-gpio@vger.kernel.org>; Thu,  9 Jul 2026 16:55:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616122; cv=none; b=bjUH49wJ8b5op+QMhrQ4YWyWQ0K5Ez3ST2ylgT5IZ6MZAqMWdirsDoB3x/HM82e2skNm4JTQW8WLc28H3rAG/GYNjwFEMVcxAjNCNMKc10+Dt8o1bVs2lJXtaNnFZ06NakL/P7CKI9h7banUHP2q8o7DIsOKXdJ6hbtRZEUxeh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616122; c=relaxed/simple;
	bh=V/TBjeDA2JYcf40xHGEIlZGc72FKI/qg5gfvEJ9lS6o=;
	h=To:Subject:Date:From:Message-ID:MIME-Version:Content-Type; b=sxbbedKwrwgkoXBazOB4NAn0pjL+AQr9MQR+s3sJ4fyjLmMBJEqOswemVsbNo/aM2tnx585iwm55nWgHK132as6mcPaMlV8v21uIimtuDRPIGR40q/E8VqGBSLCNEMbgQ7RWLnO4fbCxBhnqrK7tYOcoDfyZ3Na1xwAD/PO5Qlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=patronsbuckeye.com; spf=none smtp.mailfrom=ded4220.inmotionhosting.com; arc=none smtp.client-ip=192.249.118.41
Received: from patrons by ded4220.inmotionhosting.com with local (Exim 4.99.4)
	(envelope-from <patrons@ded4220.inmotionhosting.com>)
	id 1whqxZ-00000005kOG-1SfI
	for linux-gpio@vger.kernel.org;
	Thu, 09 Jul 2026 11:46:45 -0400
To: linux-gpio@vger.kernel.org
Subject: Patrons-Buckeye "I promised."
X-PHP-Script: patronsbuckeye.com/index.php for 45.157.112.226, 208.109.0.7
X-PHP-Originating-Script: 1115:PHPMailer.php
Date: Thu, 9 Jul 2026 15:46:45 +0000
From: Patrons-Buckeye <wordpress@patronsbuckeye.com>
Reply-To: linux-gpio@vger.kernel.org
Message-ID: <yPBblmGrAvg5SyOSqBO1EZCTk03KWbt0JAEDgZgUGQc@patronsbuckeye.com>
X-Mailer: PHPMailer 7.0.0 (https://github.com/PHPMailer/PHPMailer)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - ded4220.inmotionhosting.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [1115 1116] / [47 12]
X-AntiAbuse: Sender Address Domain - ded4220.inmotionhosting.com
X-Get-Message-Sender-Via: ded4220.inmotionhosting.com: authenticated_id: patrons/from_h
X-Authenticated-Sender: ded4220.inmotionhosting.com: wordpress@patronsbuckeye.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[patronsbuckeye.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39756-lists,linux-gpio=lfdr.de];
	HAS_PHPMAILER_SIG(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	HAS_X_AS(0.00)[wordpress@patronsbuckeye.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_SENDER(0.00)[wordpress@patronsbuckeye.com,linux-gpio@vger.kernel.org];
	HAS_X_GMSV(0.00)[patrons/from_h];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[linux-gpio@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	HAS_X_POS(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wordpress@patronsbuckeye.com,linux-gpio@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	HAS_X_ANTIABUSE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	HAS_X_PHP_SCRIPT(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	REDIRECTOR_URL(0.00)[tinyurl.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,vger.kernel.org:replyto,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,patronsbuckeye.com:from_mime,patronsbuckeye.com:url,patronsbuckeye.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DAAD8733A17

Sermoriese
82991513368
linux-gpio@vger.kernel.org


Subject:I promised.

Message Body:

Photos for my escort application are uploaded.   
Let me know if the quality is good.   
Preview: https://tinyurl.com/mpanfydd#xFst2P

-- 
This e-mail was sent from a contact form on Patrons-Buckeye (https://patronsbuckeye.com)


