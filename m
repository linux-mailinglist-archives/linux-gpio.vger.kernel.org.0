Return-Path: <linux-gpio+bounces-31212-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COjBL0HYeWlI0AEAu9opvQ
	(envelope-from <linux-gpio+bounces-31212-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 10:34:57 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED3D9EDCD
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 10:34:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 70CD73006835
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 09:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CF8D346FA8;
	Wed, 28 Jan 2026 09:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="ZUGWTyM8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4824F346E5A;
	Wed, 28 Jan 2026 09:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769592865; cv=none; b=pAuWgzjXzrZitFx0GA9XTchVsYGvK8Yyg32v8Vl27YcydvWGhhx+2aD9j3qfOnA6iigsMVEuirliMJjPXQD+B4Ky48Q1pMdIyVjq+utGa3z1k60WksMIMoX0y4En0fFJjbnPBoWwg9F/+5CwovTxQglTLAX5hE9yPBHA+VfXW9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769592865; c=relaxed/simple;
	bh=sVnj1C4avZi5lob/WW/jEcsuTEgkILKAFZaa3udSirs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lhZd9bdr8U0VkScLBdE0PG1VS4v1WJ5n/qNHH2F87GqgRXzBRSRIXcOFs08Ja6e/YUDylgHJ3WGXMVTbWLQjC6z6KrJSkJYek9naNYsF8KgjQxrsQ6dghR8p8/+CQAY62u1Y92GkttuyZgguCRCzGG6QtlroQ0N4UJPRF1ec7Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=ZUGWTyM8; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1769592767;
	bh=YqgQ7XTWnwiLqJRqmob5IA4FpJiapKMV3EHIEwmKLvk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=ZUGWTyM8Me+1zINdg/FP/yCjoNE8+anpE72BrxAcA8kyh9YZh75xWRTWmrXGHfDDi
	 hVJiGgtySfMegzlGyVabx4Re67DuHIDMvmwepRsbBG7y9UfdfNWLkCqRF+oD4AoQzy
	 mL6YDYSv75/9Rsx+wQD1C3KoEd8TP5kPkg9a8Gd8=
X-QQ-mid: zesmtpgz6t1769592759t9b968819
X-QQ-Originating-IP: wSV2IFKiia32OYtniGlD6DAAqZvlSdHLzBCZK1/Wp0o=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 28 Jan 2026 17:32:37 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 319744168602380696
EX-QQ-RecipientCnt: 11
Date: Wed, 28 Jan 2026 17:32:37 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Vivian Wang <wangruikang@iscas.ac.cn>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH] gpio: spacemit-k1: Use PDR for pin direction, not SDR/CDR
Message-ID: <85EFBB88D70FB64F+aXnXtS35RG_U6MeC@kernel.org>
References: <20260127-gpio-spacemit-k1-pdr-v1-1-bb868a517dbc@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-gpio-spacemit-k1-pdr-v1-1-bb868a517dbc@iscas.ac.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MKzYG8XJzx27luHda+8viI9Zbcs2SNIwmBWR31bLVy7d4Whz+EeimKQt
	21JWgfTV5aWJfNYrs5hIzjlbfdFAJNmO+kKSWq3c60VgLJHpKNvj/jFVe6kftITNL9bkrAh
	031kqQQnf5Vhxi3kBExh4upNU2DFx1WIeRKDwlrqEIz8QlygV68APMK8C2OC0UAfgxNWwbO
	sPp6MqDF/InNLzc++z/7gNJV/aeqij3+f7Y0rDCiahKEr8im+QQRY0tO5VUt6dVwl0ecErR
	KWHwpQ5W/StWgR9OycHFys4kgXX334Rmwl/iBzRkwcLCUbC62DchViSXVJMRFe8x3nRxgbW
	DyQAe2Us1zdyIAiLRDwvR7C7yn+i/xqXVjsSLkf1oMuJixziWdq2WxDQ9ZfK29DVVEvtswP
	/jxjeXwtGtSO3yk3rnPA/MXjPm5CtRz8PAHpLm5xU9qyj4NG/gzQVV0JT7Aa2AEJPdely5q
	L1HcvJjxfT05s7vTJVC+uQwG/tXx1SGd1K87xneFERYV1C0xHcnCcmphRRas8DZ881gQ7WP
	5YqU8bWc1CNJwdHlFDqmLwwTnNIKiVyHhOJ+jq8jWYJqPogcdGQU54tl0A+mYt+APwZrgfp
	zgLRjS5wug7HeWw3DIFf5EVgWECmQ4LVLqSK5X7+dwGlHMLu7FYFz+KVNyfIHGR+CzzhuFs
	nH/8GrZ+hPgKqUe/n5VyVWzbyaYYGc486b+YpcopQYW6wlBDHVz0wl2oFSjQZcgdcYWd5rj
	lxW3ze0k+PCUwGoMw1Rs9uzEYEKqmTj7j4HiSI3SOBLKqROidZRfe81zMtFOBBDouxSfgfv
	LcdZFmGEEr6p8fAZKOJyGuofmTwVlvsVp8yhGJoaZMATVAwWbHdNrNpaywjAlUbN1szajyq
	jcHthvKySi5BJnEHuqBvAYTYYBYTzq4WQlHasIQBZ10SX0BDH/91Qd7Tu1gw8NuiTKMCkJ+
	km3W2kirXQ4MM+htGZRNlYwQya+JooAGecFIQYluhTuImB988QCv65howFD81CQwOKlJsda
	YX7Tzhf2G9oUIV5+/UX8Hwt8RKUuSQXLQkAKl7Zenog5UTi3vdWYnzwEvX1JNbE3owAbzLj
	3n/Bb4AsiRB
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.spacemit.com:s=mxsw2412];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[spacemit.com];
	TAGGED_FROM(0.00)[bounces-31212-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux.spacemit.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[troy.mitchell@linux.spacemit.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3ED3D9EDCD
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 10:58:49AM +0800, Vivian Wang wrote:
> On the SpacemiT GPIO controller, the direction control register PDR is
> readable and writable [1]. Therefore, implement direction control by
> using PDR as dirout, and don't mark it as unreadable.
> 
> The original implementation, using SDR as dirout and CDR as dirin, is
> not actually a supported configuration by gpio-mmio. The hardware
> supports changing the direction of some pins atomically by writing a
> value with the corresponding bits set to SDR (set as output) or to CDR
> (set as input). However, gpio-mmio does not actually handle this.
> 
> Using only PDR as dirout to match the expectations of gpio-mmio. This
> also allows us to avoid clobbering potentially important GPIO direction
> configurations set by pre-Linux boot stages.
> 
> Found while trying to add PCIe support to OrangePi RV2, where the
> regulator (controlled by GPIO 116) turns off on boot while some other
> GPIO pin in the same bank is touched, which is not desirable.
> 
> Link: https://developer.spacemit.com/documentation?token=Rn9Kw3iFHirAMgkIpTAcV2Arnkf#18.4-gpio # [1]
> Fixes: d00553240ef8 ("gpio: spacemit: add support for K1 SoC")
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> ---
> Tested on K1 only - help with K3 testing would be appreciated.
Confirmed that PDR is also R/W on K3. Thanks!

Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

