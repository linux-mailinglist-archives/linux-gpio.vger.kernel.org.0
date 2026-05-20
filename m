Return-Path: <linux-gpio+bounces-37171-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SH/qJXdTDWrAwAUAu9opvQ
	(envelope-from <linux-gpio+bounces-37171-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 08:23:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 929445881B6
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 08:23:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6BA5308B993
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 06:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C83E372675;
	Wed, 20 May 2026 06:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="a1tTMgD6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4504727B32C;
	Wed, 20 May 2026 06:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779258037; cv=none; b=U3nsn90FSJV8frYDV/RCw5FhTKps/NyU1eWZgnI/WcgKBI1Z9UjFX7d+D63ne4tLsYre+edsYr+rJr7mYu4JXj9GOsmGQpRALcBXjQ0n3Sh+Iy0ybX4s4GfeQm6UeD89PMZefluPjPjB8t6QU4d/nqvXu4wAsIQzrdLjEl1ZGTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779258037; c=relaxed/simple;
	bh=a6fGxEH5BMyjsqkygp2GVPtB+r+Rb9RjEJSwUu9XC/g=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=cpNPhr53TOKA+lqfbqoXNBskKOjVwJEhSFuQLun+NXXtGa/SZr+JkHhXsEm6xDXJ5tw+qD5zzroirpyQ2PhKA8SLKdbdBVs2QZRnnUyxDjmtnN1huYYxhi4LTt3MB2SH0zKZ3RkdATvMaxDXZkkOUmcAlGueyAa3TfeAGvFR2tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=a1tTMgD6; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1779257949;
	bh=hg5KK2xUCyB4FLoYLYP8YswpRDV5uXbEMujGSGVHGUA=;
	h=Mime-Version:Date:Message-Id:From:To:Subject;
	b=a1tTMgD6pTfjaggmgL42RSaT4YhHoLKTs0wYqvr0xnhj3x0tx+wMEpBACCqwxgPb+
	 l15qc8pd57Q+lIO4khmpkVi9gcRNSn/m3qPDycREwbzMb6OqIgNnpveqA8KMYeBWgw
	 ch3qtxd1kJ2klhCiyixHE8cdoQmw6We6GPLSkUo4=
X-QQ-mid: esmtpsz11t1779257947tda20d2be
X-QQ-Originating-IP: 0xEUe3OK3WD/fOJoDhBLmRz2RyrACzSv+nYtYCmdgDQ=
Received: from = ( [210.3.135.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 20 May 2026 14:19:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9958252558601639694
EX-QQ-RecipientCnt: 12
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 May 2026 14:19:03 +0800
Message-Id: <DINAAUZDL8PS.3KJXPTIHPXQQY@linux.spacemit.com>
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Han Gao" <gaohan@iscas.ac.cn>, "Linus Walleij" <linusw@kernel.org>,
 "Yixun Lan" <dlan@kernel.org>, "Hendrik Hamerlinck"
 <hendrik.hamerlinck@hammernet.be>, "Anand Moon" <linux.amoon@gmail.com>,
 "Junhui Liu" <junhui.liu@pigmoral.tech>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
Cc: <linux-gpio@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Han Gao"
 <rabenda.cn@gmail.com>
Subject: Re: [PATCH] pinctrl: spacemit: fix NULL check in
 spacemit_pin_set_config
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260519164007.122574-1-gaohan@iscas.ac.cn>
In-Reply-To: <20260519164007.122574-1-gaohan@iscas.ac.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: N1ZgNUtaKtmxFhz/8yV8b59Rf/Xjd5V4g197HXPXFy8kmwrfWjtJ1eLK
	3AH+Khnk+xT4mCC0EnLVgIOAA/dy0hvU/uCH0qp7dcypvu7uNBmL5MHreik9gzPPiqaXC73
	orfJ1tesQBQOVlx0vDg4TeCB7O72Yw0FmvFSjrFSxXw/D6sui1sUCNS3NQbsNi7qG9lWr72
	ujoNKA5DXgWGwpl247SUH1JeyghyBxYjDq9EACVjPDHQS8Ptoef0H1QI6M4MfoGPjAvbqRv
	0mDxEidEwMS5gcrJafSzOhuV2+tXuElJE17LHovA9RMStUf+kTh95AgC2GMmCTYCcbYq8No
	8B2Mcvzh8v880nF4QHzwQ29N3yrZPjUrOJ/Kk8lrY05JUszC5EFROD2YNngFVSeMWQaT5rs
	qaw+0QyzW8mXsOdgJL1YyHYCMtllFHcZeAyyjCcbIEPbJ4f0p1BWzZ8wE97j+fMD1iaqLt9
	opgD18PY1qN91fvHPls/piU5sT9HVMnoCLaoKurj2u+nP7+q6PJjcaxtH3/JgoN4suHYUHh
	HEMWdtuzZYI3cIX15Soax1OPqzcQiHB8QY+qv6jx6ogwhpmi4IuPxUElKYfBrBOj437nDbK
	49sO2j2yZkwKxI5DZTqdKtsW7dXGqizZxFXVn+SnhE7kOcJdQ8EGM2Bw4hfiUzmiiN08gBc
	7ObzDJQWFR0rb+elKWhNTQcjz1BMe2hBlfGaht6oh1Y/v5A/Rz3jJkbGMfmb4aG77lDDn32
	NQ9yWNcplVXEBP/jEoWp9TaTpQCqncjs1nzDN+4OyueK253ged24JXTE6/k4ipbKwZM0P1/
	BUCU8YZR1+UZWxfdeixFTvZt9DJRuZwzQZ5urRoBc+rn7Wmf4K0a6fwX8jaVrOBJDcQGSyI
	wjHx5koIndeiU4d8/daoPgLvqpV+yuz235GeKjQzPU9GnzrhhKjuHjzzCNIU+wFQU95eG3V
	KkE+r+5KUk4/HQJwxNBtAXcgxi90CW92rrOvc20lZ6abyKpYSb2LChg4YPiyTLyHroLLDuO
	T99UBsz7HAn/5BBSKJ
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.spacemit.com:s=mxsw2412];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[iscas.ac.cn,kernel.org,hammernet.be,gmail.com,pigmoral.tech,linux.spacemit.com];
	TAGGED_FROM(0.00)[bounces-37171-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	DMARC_NA(0.00)[spacemit.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux.spacemit.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[troy.mitchell@linux.spacemit.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,lists.linux.dev,gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 929445881B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed May 20, 2026 at 12:40 AM CST, Han Gao wrote:
> spacemit_pin_set_config() looks up the per-pin descriptor with
> spacemit_get_pin() then checks the wrong variable for failure:
>
> 	const struct spacemit_pin *spin =3D spacemit_get_pin(pctrl, pin);
> 	...
> 	if (!pin)
> 		return -EINVAL;
>
> 	reg =3D spacemit_pin_to_reg(pctrl, spin->pin);
>
> pin is an unsigned int pin id, where 0 (GPIO_0 / gmac0_rxdv on K3) is a
> valid pin, so rejecting it here drops the PAD config write for the first
> pin of every group. On K3 Pico-ITX the GMAC RGMII group lists pin 0 as
> its first entry, so its drive-strength / bias configuration was silently
> ignored.
>
> The intended guard is against spacemit_get_pin() returning NULL when the
> pin id isn't in the SoC's pin table. Check spin instead, which both
> restores PAD setup for pin 0 and prevents a NULL deref on spin->pin.
>
> Fixes: a83c29e1d145 ("pinctrl: spacemit: add support for SpacemiT K1 SoC"=
)
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
Thanks.

Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

