Return-Path: <linux-gpio+bounces-32466-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iD7WK2kKqGn2nQAAu9opvQ
	(envelope-from <linux-gpio+bounces-32466-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 11:33:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B62131FE637
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 11:33:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 17F1D301A6B1
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Mar 2026 10:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB7F63A2578;
	Wed,  4 Mar 2026 10:32:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937A2386C36;
	Wed,  4 Mar 2026 10:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772620334; cv=none; b=ijDFPAhqwS93kugrkubvMO7wTRf+dxAj/PyWwZqpxEnQNPqSwhcAmIhRkpKF2G/wOXPY+jQojVpScxa8dAGifRmMW1dyQWQnZF8d44OMj8WATnwjkxddxfgU4xkN5yCxYl9/SYAXauD0eD1obiuRJ4mwoxpG7/+vHoxZXu7vw5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772620334; c=relaxed/simple;
	bh=ApS699SwuVsjgZhmflKmCvPXwrp9pk096BMvaFpM65s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ilQT3YjF2gE0nLiIkZuCKAIv+lgv+9KHpl15nqqiXZoQ/ovMt2jxJbylelXkGFyUXzEJeYbQrzeU4V8ucrtA58ctn+vYwBELqtdL7QgARtvmadQgl5R/V3+M/QTMc15gqcG8uPnquB2BX2gAHhZW6qim2myfuPfpr9AWiWC4Dsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vimux.org; spf=none smtp.mailfrom=vimux.org; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vimux.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=vimux.org
X-QQ-mid: esmtpgz10t1772620308t2f6c94b0
X-QQ-Originating-IP: 4GpzGVlb8kYgocIForgl8MRQKjILJcl3D6A1Zy270hk=
Received: from localhost.localdomain ( [119.167.27.218])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 04 Mar 2026 18:31:45 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6474584774209314028
EX-QQ-RecipientCnt: 8
From: Jialu Xu <xujialu@vimux.org>
To: linusw@kernel.org
Cc: brgl@kernel.org,
	kees@kernel.org,
	krzk@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	xujialu@vimux.org
Subject: Re: [PATCH 1/3] nfc: s3fwrn5: convert to gpio descriptors
Date: Wed,  4 Mar 2026 18:29:50 +0800
Message-ID: <56D7C16189347663+20260304103140.519252-1-xujialu@vimux.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CAD++jL=FCRvj_mz_E-JVnyUBV3SOidQQ7zp=ogcRqirjvphpTg@mail.gmail.com>
References: <CAD++jL=FCRvj_mz_E-JVnyUBV3SOidQQ7zp=ogcRqirjvphpTg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:vimux.org:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MObEYWafgTHoZx474OiLtkTLcU3DE+Jzz2hkDkhw/HLgCJQO/N5IBOf9
	iyG70lIIZuaYOBhrEE9JnjqYNYlVNrptJjsym3I6iYOTrcg48X9CWZxt0qyH7T6XrM9IUi8
	qhTTmf+v6EidyDHaErkBXpny2l4oqRI3PdkEQRvQYpS5BJz+ZqeOzWqsd9iV63aZnD9LUlU
	FlCbLJqvGDVxZ1p6xQCbWeWV4Y1tjtbtZqEeKRPsRACOLtXtRBeyOtxaZfEoZhxtXRIiQ4q
	NML97GB8qBkt5oFfeb3ZVG84f8ip0kWjXnbggFKZRgOya40UnmjVrl5iATvJrYgIIGlxJxa
	S5goEUdieGg99UNmFgrgE3wCrMnc00BrF8QVq4QIP1QPlOEc/smMRN7KJiSHbwwPKoNHASx
	1RYlQfOjZ08WRgMeL/T9lApQa+486XpYDOAFkzDjFjZDRew4oiYx+n34SdpE3EglN0QhL0e
	PCd8jgPm1vDa576n6RXl63LJMddTsyz6zwdb+4HM/o+3ywd986McFgJZYfZiSk97zMJEhfQ
	JFLykErH0+YFPWO4gwcXeezY/A+6UAXWPPAGzxWdTHltbvXHOwADgBouyH010TWMSQ1a7oN
	hN/AHKzn+pVmFaKw+gv6qR6k7NEN+J0HK61aomlAItFDgPZhE7ESw9nu2EPbSBP/SKEpO3x
	rCp5MVZptLrupQg5SctXLqdSFbNiUmM4wwO5l+M2dLIROwOvyfC0gh6s8eof35SNn7e+lPO
	12H2vfHCLhhaji/Bj4TOe3qCDRquwgXnsXKN3fc1sEY/ejk3hYCA4O59U3s5Bg8c+kfGH4B
	/Z+Nm2rI8sNEt3dVi6CDykK8aCRLNvuuW0UVNlnBlxm6b4nN0yaGtZhGJlyhuniBMI+zJXE
	NtNSr94ORo1ka63yl6v3+9N/+vPaihJZr/HNchVfnNl3xMntKSP7i9lyX0k1GsNTFpNgRc8
	N8v7nrpIAnFkCsnI7HZLSVrDQAMHVRSAg5hxmMXDiTiwG8ynWJYeAPTIhyBjeIP7Hmw+hXH
	Ly1pkZfA==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: B62131FE637
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vimux.org:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.976];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[8];
	DMARC_NA(0.00)[vimux.org: no valid DMARC record];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[xujialu@vimux.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	R_DKIM_NA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-32466-lists,linux-gpio=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Action: no action

>> -       phy->common.gpio_en = of_get_named_gpio(np, "en-gpios", 0);
>> -       if (!gpio_is_valid(phy->common.gpio_en)) {
>> -               /* Support also deprecated property */
>> -               phy->common.gpio_en = of_get_named_gpio(np,
>> -                                                       "s3fwrn5,en-gpios",
>(...)
>
>> -       phy->common.gpio_fw_wake = of_get_named_gpio(np, "wake-gpios", 0);
>> -       if (!gpio_is_valid(phy->common.gpio_fw_wake)) {
>> -               /* Support also deprecated property */
>> -               phy->common.gpio_fw_wake = of_get_named_gpio(np,
>> -                                                            "s3fwrn5,fw-gpios",
>(...)
>
>old code supports the deprecated property too...

Thanks for the review!

I'm sorry for the oversight — I only checked the existing in-tree
device trees and assumed that was sufficient. I'll add rename quirks
in gpiolib-of.c to handle the deprecated properties. Will send v2
with this fixed.


