Return-Path: <linux-gpio+bounces-31472-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCk3LmWRhGk43gMAu9opvQ
	(envelope-from <linux-gpio+bounces-31472-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Feb 2026 13:47:33 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 230F9F2C61
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Feb 2026 13:47:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32D823028038
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Feb 2026 12:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D0DF3D412F;
	Thu,  5 Feb 2026 12:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="MpPfZjQe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6956D3D410E;
	Thu,  5 Feb 2026 12:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770295603; cv=none; b=f7pZ/F/qWR7bnQ5fgBlhM1O9WRpaebF8YUZtDA2eqsuX85ummFTL4/QpbbXfzcSr3KW07Qf2jP9cZi60jtw9iWgyMs5F2LJOxw3aMDEeTxZ5T3oSMzz9q3/VK/7rFlCFsopI9GL74u88VxiYXOuZ/PjqJDjCmB3b+xv5i0+Blpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770295603; c=relaxed/simple;
	bh=J3gWYG5AAEMiEsvZWXvK5m0fvYugnByulA0kgmuoMMQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=WaCqqkE2iMyDFnjhbHCrLpki/PExEL6cncfmO2KNGvpYNEDg3CoqQp1zl5DjkY3Q4+balOiiK6THDbTiQZw6AcTVB8yXZlWHoPoUpLNHpCjpdTnSJcy9PCcgZWK0gzQx6tvhsQ/8vNbG+VEN78hBRdMscn2w++9X6zjNM2m2BoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=MpPfZjQe; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1770295582; x=1770900382; i=markus.elfring@web.de;
	bh=oQzgxnp1cEg3TKDwj7p1dkNYW6ReA8OUQ2Xx24EzpKs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=MpPfZjQerY6xujD4H7jqEm2yrrrcDVkHtx0bWl8EqHbftwMfFBJ7lnaF3Tdd4WPJ
	 I2CWlZmeDYsT4j/QCjYLPJ1KLABolmF+vimnAhoFdOAFenTnw0Y9nrNVQtG4vz1ek
	 m6AcfSFKGasixCdw+iEU6cjpJZK48KYkP1hoSv8YkIGt4EB6r5JVxT4U7BzqQ6pUR
	 Ju+fUU1Lr2PUHBgMd05HDbovPpWft5HYb8JmomG7J1BTm1MwibiuY+E2AdEt4Czlr
	 AsZbWK9Jlo2TLEMv2T6Dn3uCZphdYghTT1lN0kV+M1erWeesl7BWK0/UmoII/whNu
	 9rCxscGHbdot9L856g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.222]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mpl0p-1vTFOF1FIj-00e6X7; Thu, 05
 Feb 2026 13:46:22 +0100
Message-ID: <e762b191-903a-439f-aa9c-177557f8391c@web.de>
Date: Thu, 5 Feb 2026 13:46:19 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chen Ni <nichen@iscas.ac.cn>, linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <brgl@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Yao Zi <ziyao@disroot.org>,
 Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20260205072649.3271158-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] gpio: loongson-64bit: Fix NULL check after devm_kcalloc()
 in loongson_gpio_init_irqchip()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260205072649.3271158-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:O/FJhaVPGtWCY3y1Is5GdRCHejYVqUkwtuM4d9ARVjszv//MmL6
 KlTJq1x0jTczWTewvNAtg8MK6WPYmwjZGeZs1Y0kmC0vdOsAqPyY7BiQwxthW5Hrx6DaYVo
 0xLVUFx20ows58ukaVQ2ucf5XYp7wYVAV231zlF0X1kRw2uvgOLzZFHVcBk9ikty1cBKU+X
 JfUlZZeSddZ6GnmPohMvg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:czOEq1LyZJQ=;XOjLxvhGVtwz+4hkUWBxg3eypyT
 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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31472-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[web.de:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[web.de]
X-Rspamd-Queue-Id: 230F9F2C61
X-Rspamd-Action: no action

> Fix incorrect NULL check in loongson_gpio_init_irqchip().
=E2=80=A6

* Were any source code analysis tools involved here?

* See also once more:
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/stable-kernel-rules.rst?h=3Dv6.19-rc8#n34


Regards,
Markus

