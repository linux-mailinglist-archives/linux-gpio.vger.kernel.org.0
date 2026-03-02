Return-Path: <linux-gpio+bounces-32364-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id nUqOGCnxpGlTwQUAu9opvQ
	(envelope-from <linux-gpio+bounces-32364-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 03:08:41 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F0C1D2650
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 03:08:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74C49300EFA8
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2026 02:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A262238159;
	Mon,  2 Mar 2026 02:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="wXC2MmDO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out203-205-221-173.mail.qq.com (out203-205-221-173.mail.qq.com [203.205.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67F02A1B2;
	Mon,  2 Mar 2026 02:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772417314; cv=none; b=fp8fQdnImvKI6k9Xjahm3hi43qehus2y0MrT8OltsIsR5zXD5nH8RElQ0OoKQjPwe8D7tX4vtxshUDFkCv6mwoTa2J0wNFk/iXV9YyA21uM4KuQIikhmzAvLDKjZbVQlM/bcpJASpiTHqq4s/6Ip75KFUWzgYXxuIzEIxAnDgdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772417314; c=relaxed/simple;
	bh=mXSKbzFXQ3FQhf30tmzbspSMkCzuLBfj2NG0JrwFGxc=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=chmdkW9WseaQp5VvlnjURboYycsAM1fK75S7FB7NkhuiXIdkGgPrxpTYnuNxTQd3tas9WoS6f1VEIbGUipyOsheau8vdsj3M5R8byrJACJFq5zyKHJolzAjKPhKGkzWOWdGKbUmcvluV49nTqSz09w0+pFVMwokKHPmgYkQLfCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=wXC2MmDO; arc=none smtp.client-ip=203.205.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1772417304; bh=OgOakcOAcLKZiwwRR+zRr/VgGW8LNhWpISv7p+NFAdQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=wXC2MmDOXHnDsaTzXLHsdaom4ximnBCQCyVCdFd0NzJVsKFILTXB1fRPeFFFso5Ch
	 Fm1e3TAUqIsVXTQFGUVxlGNY6qzksx4boJLsuU9/KmA9qoIatAEnzgoO3/uBXFyOym
	 6FbRr/ydJAoWNWMN6/AYPB0dghodAyf5qcG1vJRM=
Received: from WIN-B62RPRBL2BM.localdomain ([218.76.62.144])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 215A76CC; Mon, 02 Mar 2026 10:08:21 +0800
X-QQ-mid: xmsmtpt1772417301tzqnyhdv9
Message-ID: <tencent_F4ADB9491669902C15653C46824DBDCEBD0A@qq.com>
X-QQ-XMAILINFO: NYXSVuwhoxRbe0qpGpGw6tJcVp14as0EKHMX9iKTSmRFtGbBUEuOvkvDB8f9FJ
	 GD5jl7gLYvxqSgQdtVnBLbz8kScCV6ZeK8sq2GUAPqYX8lR6XYz4Dn5unhIblD8K20JiH2tFJXCM
	 BJmIHhCskqMHgb7Wr6NSWPf5/cEPDGgJ78+XfZ6YaOoFAZoSO5U1+OnELT2IqwV3hkmBHdrinb7W
	 MB8ceiZOmfC+dYB0Ed3KNRlPVyjTMKoZUVRTtGpH6eC7zWT5NRM4CVkoTQOAvKKjLqzFMQe50ywj
	 E+UbQZ7feoW5XTlmqcQ1ilcvQ4GgreCgRJCMLRzw1SPlZv5FuGPgZVDAj9YkvoQgVgy2AKsVhlWD
	 HNgNB48o3MtosIRQb1MtlYr0z8Yvo8jzLdh1wlVVdrKyXqND10kPQbVsRYS4uBUGcbUCZX8MacLB
	 qvhfKkE17t5gnWRT2p4++Wx81MhUyLbmMUl389YhDcGTr1TOZr3/Ouo3PkmsFizD2H9mb3wBJt+t
	 8oMjNr5pC8jJErdaHBg6vwMw+TtWc8ual1CzJjgszxiFjgVCM+pI6OzP0gKfegeQZz0tHx3+i3AT
	 xxpcsB0bheNuaAzIrhjaMdZvQOZLgA7Sh4p+qVZfTteAo5zv4f8gaK+SqPq0at0I7CC2VzZt7YGp
	 +jaD9+25tdGIaEBkRYll64MeAC8qjLjVDojJwMZ96e5Pq7YUtK+0sDDfscNPMlo9qM53thbzM+vl
	 DJtplzdkD3SiXugnRlGdFUYnDs2zI/LuDPYJU2jaZhW8By5dcXP8gZAyTn3bHLnJZprkWZJoLAdW
	 rizclPdFs3yh/CZ3MEkgmOHdsB0BlB8nhi4+kQg/78Xs8i83bB/dmxVtdwsNJfMtQD8NyXl9n6QT
	 JxiHoeIiSlb04xEzndmWioflxPKSUEhWlhMBmalPFH0diWN6xK7x1B0P/Nqyk0O3Mbk0JIEMuOEF
	 R0VzihPGoKnXKPCe89qCx2jLI7r2fB5ERoQHZTDV/ls5u/PUFi11SO8zKhH2wDCaccDmNhm40P5I
	 fb2b14NlwvbnJCCydY7TdZdHZxB80=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Zhu Ling <1536943441@qq.com>
To: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	chenbaozi@phytium.com.cn,
	Zhu Ling <1536943441@qq.com>
Subject: [PATCH v1 0/4] gpio: phytium: improve IRQ integration and add SGPIO ACPI support (please ignore)
Date: Mon,  2 Mar 2026 10:08:21 +0800
X-OQ-MSGID: <20260302020821.13650-1-1536943441@qq.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260302014812.9649-1-1536943441@qq.com>
References: <20260302014812.9649-1-1536943441@qq.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[qq.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32364-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,bgdev.pl,phytium.com.cn,qq.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[1536943441@qq.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qq.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qq.com:mid,qq.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A8F0C1D2650
X-Rspamd-Action: no action

Please ignore the previously posted v1 series.

It was generated against an incorrect base tree.
I will resend a corrected v2 series.

Thanks,
Zhu Ling

-- 
2.34.1


