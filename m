Return-Path: <linux-gpio+bounces-38866-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N/QmKfUWPGr1jggAu9opvQ
	(envelope-from <linux-gpio+bounces-38866-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2026 19:42:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0C66C06FB
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2026 19:42:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=alien8.de header.s=alien8 header.b=d0kzN5ve;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38866-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38866-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=alien8.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6CFDF300F504
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2026 17:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C5A33DD51B;
	Wed, 24 Jun 2026 17:40:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D693DD519
	for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2026 17:40:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782322846; cv=none; b=etUNcujHS5RpYROHNxcIMmJM9bswe7eieoYaBKCNoYoAtKcO1Qio+74jGIFjqE+kMlgayENqRi6CQR+ryJv4p+4qBniinyYoIF8UHYU1Tdys4fbs3LmmuDt7Lt3CRTemycoKs1cT3Z2K7nl3nJbRiwT9YnmJVNeGeMmY4QptV70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782322846; c=relaxed/simple;
	bh=4iBGhDDSHqZ+Mwxsv0iYq08HSlDCNFmzz9fmYMnPveg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tz6tGZ82WTSYe9rkgX6Q9vhZgvSMZgrExLa83UecY1lhSXx10bBtu8NhoC0fsnNY5VihAQK19QjvdLO9gj1VVviP1vHelAm+NPAKpKbVEwbx/JxmPaxj+O8VVGeAMw00F/4+ir8sz8ZiaS1ntkyf607//SmPamcJc3ZyaVTY/Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=d0kzN5ve; arc=none smtp.client-ip=65.109.113.108
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id B6C7D40E01B4;
	Wed, 24 Jun 2026 17:40:42 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id dHsD4fHUck6X; Wed, 24 Jun 2026 17:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1782322832; bh=TRIs1UF00Za2/7DWm0DzXMlouHLCJMOnJOcyKRki8v4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d0kzN5vewdVLMlX9FK3wB6VfRdU8zdfJL1KT8VR1w2hJdehTJiyP+YnMwqSvR08lH
	 3cc98WIUsIA/0PcvMAMIdSOD8iQ7UiVkO+C0z4JCOlpN9aLwCNiVT9XnDDHt4AV/bk
	 HCgPd9ex8JiDOM7bfExvWbkp+U4ibSogQqrpGnm5ViELtYPekHg4PmRu/1PK2ssc/I
	 vpJd5D6scNJxjmz5FzkHd+vzOncz8XQapOED2QlRi23mkJqZKthsU0H+bIWxxLD8qa
	 3lJHMZh0l4s2zIcE98MxJE16zMjRTfaf/SqyBDSU+EFY90i6WT6EbPDsqkmYHSkOYU
	 0Ckqvhq3qM/MDHLHSgjbIfIxGBO+UIsAutvYA1qca/I5YjyrUGbB556w3G7LaNkMVx
	 E0opwgqd+Uz0aZG+9kFuZyHYfbMF3MNx3me3JcP5djW2c1QUZZLQWsALBcHBQ1FNrf
	 U3NXH6XmMPjYIhR+XTrMMJDR56oLKa5wgiGywXAgg0o039EHt2EHuE242vtA2iM21l
	 5BRb2IjP/HhawtTKvZbnFgLmHNlaWiGpTKUZvt23jaEqDmc0losccKycjA05kmp9FB
	 0Xm6cVqVg9movYnMxvju75/SafIwdsfCIHeIrZ08km8ElmvqVaZPHs16HBTtcFEZbE
	 1Fe8y+29v4eyqnoUxFc+2xxU=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2ACAC40E0140;
	Wed, 24 Jun 2026 17:40:20 +0000 (UTC)
Date: Wed, 24 Jun 2026 10:40:18 -0700
From: Borislav Petkov <bp@alien8.de>
To: fffsqian@163.com
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	hpa@zytor.com, Kees Cook <kees@kernel.org>,
	Andy Lutomirski <luto@kernel.org>, Brian Gerst <brgerst@gmail.com>,
	linux-gpio@vger.kernel.org, Qingshuang Fu <fuqingshuang@kylinos.cn>
Subject: Re: [PATCH 1/1] x86/vm86: fix vm86 struct leak on copy_from_user()
 failure
Message-ID: <20260624174018.GFajwWgi4c57jE1NmM@fat_crate.local>
References: <20260624092629.271618-1-fffsqian@163.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260624092629.271618-1-fffsqian@163.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[alien8.de,none];
	R_DKIM_ALLOW(-0.20)[alien8.de:s=alien8];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38866-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,linux.intel.com,zytor.com,gmail.com,vger.kernel.org,kylinos.cn];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:fffsqian@163.com,m:tglx@kernel.org,m:mingo@redhat.com,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:kees@kernel.org,m:luto@kernel.org,m:brgerst@gmail.com,m:linux-gpio@vger.kernel.org,m:fuqingshuang@kylinos.cn,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[163.com];
	FORGED_SENDER(0.00)[bp@alien8.de,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[alien8.de:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bp@alien8.de,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A0C66C06FB

On Wed, Jun 24, 2026 at 05:26:29PM +0800, fffsqian@163.com wrote:
> diff --git a/arch/x86/kernel/vm86_32.c b/arch/x86/kernel/vm86_32.c
> index b4c1cabc7a4b..cde077f2c97e 100644
> --- a/arch/x86/kernel/vm86_32.c
> +++ b/arch/x86/kernel/vm86_32.c
> @@ -202,7 +202,8 @@ static long do_sys_vm86(struct vm86plus_struct __user *user_vm86, bool plus)
>  	struct vm86 *vm86 = tsk->thread.vm86;
>  	struct kernel_vm86_regs vm86regs;
>  	struct pt_regs *regs = current_pt_regs();
> -	unsigned long err = 0;
> +	bool newly_allocated = false;

What for?

Take a look at kfree()'s implementation.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

