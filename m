Return-Path: <linux-gpio+bounces-31208-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WA1PD4zSeWlCzwEAu9opvQ
	(envelope-from <linux-gpio+bounces-31208-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 10:10:36 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C95D19EA90
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 10:10:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2FE6B300D4F6
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 09:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDB2733F37C;
	Wed, 28 Jan 2026 09:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kzfplOpR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E40133EB09
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 09:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769591428; cv=none; b=GVikZIZzPSlxrunYG1ueCkmsrWRrfMTxNqSwDnm/JIMLZ4hwdFhpDg4QRU5u2JZV/TuWAqUSlENDD2cE/LGG4h+wqG57J6GS1xErMIuRTiRWWmQZEU6F7bMa7za5tbohjeGdqqswC+JXQf5SwEJjGJm3tcSl6IeiPmey7TxiVI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769591428; c=relaxed/simple;
	bh=f8WyNmRVlw3H/8V0zjmzSohVz5OJZvS4EvUll/vUhDI=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pcLRHCwHOMEf4EMC5szt5Vj8j9f57SX4E7jIwSaDOCZiOfCnwcy8DlOBwpT+7Rl9HPJJZcqmM3IkLGKdPy2zR7HihzJdHVshv+rTJ4xjt4Z6I3T9ZjHrTn7Rwbw/W1jSCYP3Vrl8nsh5jjrOA8AGsO/OCEvl9juZoaXDQZF6/pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kzfplOpR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A906C4AF0B
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 09:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769591428;
	bh=f8WyNmRVlw3H/8V0zjmzSohVz5OJZvS4EvUll/vUhDI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=kzfplOpRVoJS6qmlhQcU0jc3pgg5j8KtSU0MGP2deIi/NCAccrjGLGgsJwb8IWyhl
	 RoQyhSHcqwXt7a/HSRYYdBM39kDEBlCIKVf5uPZZPbJMdfHWgg71qs/29c41wz9iQ0
	 4EXCSYIeSC0MoXAoQLHh8+cPElh0q1KlhaTAdaYYmMjKrIdxbrUjVIa42GU4sJ4Y1h
	 25ZuCIjEbREL913gC1GlsyrF4WMkcGSyFk8lvT+TOjgxlofqASYhVd6ypaHqH4ggTb
	 zrQ5P95F187Ok498ntIxxZBbATIMtxMWOy8yMyN96UuDmwsv6B5CtKwDhDjNoUfbju
	 tlJZ/aSyflbFw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59dd3e979ceso7445490e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 01:10:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVEokOpL84qg5THnLHbLTfZAdCLJ2/BGXrVai2hP8TnZkLtrpMrx8yzUdR9G75mmV3lN5M+m5k8+8yY@vger.kernel.org
X-Gm-Message-State: AOJu0YxET/PfBw8aHkx321nkmtRVSdv1bQzTFfrE47HF99GAK8c0zr2Z
	DZahgV3H5pGwWiFvALtWFK/Uz9AbD6XPHZZJXzTKa9Zf+XnB8h29rz2xbdhs3WIUaOvDMHLeQ3j
	/Chghzd/S2v/tk8rYeSvYyTlv0JsURLUr5I7b4pHYvA==
X-Received: by 2002:a05:6512:2307:b0:59e:340:e557 with SMTP id
 2adb3069b0e04-59e040185d0mr1857162e87.19.1769591426871; Wed, 28 Jan 2026
 01:10:26 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Jan 2026 01:10:24 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Jan 2026 01:10:24 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <aXkTsMqZ4iZyVM0J@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126094209.9855-1-xuewen.yan@unisoc.com> <20260126095024.ZEEwNmlk@linutronix.de>
 <CAMRc=Md+ptvRvknV7C4g2W_vpkfQmLkanKUqXzM8eYSe5ns1dQ@mail.gmail.com> <aXkTsMqZ4iZyVM0J@black.igk.intel.com>
Date: Wed, 28 Jan 2026 01:10:24 -0800
X-Gmail-Original-Message-ID: <CAMRc=MfKLhD40X7Xc-U=tFjt=ipsDk43=cieb6AU5K7wLzVA=w@mail.gmail.com>
X-Gm-Features: AZwV_Qjg7S1wP3kgQ8eQUETsp7fF7VKxj1PP5qXsIOgTyYd7zqfDzDaAFt0DClQ
Message-ID: <CAMRc=MfKLhD40X7Xc-U=tFjt=ipsDk43=cieb6AU5K7wLzVA=w@mail.gmail.com>
Subject: Re: [PATCH] gpio: sprd: Change sprd_gpio lock to raw_spin_lock
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Xuewen Yan <xuewen.yan@unisoc.com>, linusw@kernel.org, 
	orsonzhai@gmail.com, baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com, 
	clrkwllms@kernel.org, rostedt@goodmis.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	ke.wang@unisoc.com, wenhua.lin@unisoc.com, xuewen.yan94@gmail.com, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-31208-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linutronix.de,unisoc.com,kernel.org,gmail.com,linux.alibaba.com,goodmis.org,vger.kernel.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C95D19EA90
X-Rspamd-Action: no action

On Tue, 27 Jan 2026 20:36:16 +0100, Andy Shevchenko
<andriy.shevchenko@intel.com> said:
> On Tue, Jan 27, 2026 at 10:07:01AM +0100, Bartosz Golaszewski wrote:
>> On Mon, Jan 26, 2026 at 10:50=E2=80=AFAM Sebastian Andrzej Siewior
>> <bigeasy@linutronix.de> wrote:
>> > On 2026-01-26 17:42:09 [+0800], Xuewen Yan wrote:
>
> ...
>
>> > > There was a lockdep warning in sprd_gpio:
>
>> > > [    6.258411][T329@C6]  el0t_64_sync+0x1c4/0x1c8
>> >
>> > This could be reduced to "BUG: Invalid wait context". The other bits
>> > provide to added value.
>> >
>> > > This is because the spin_lock would change to rt_mutex in PREEMPT_RT=
,
>> > > however the sprd_gpio->lock would use in hard-irq, this is unsafe.
>> > >
>> > > So change the spin_lock to raw_spin_lock to use the spinlock
>> >
>> > spinlock_t to raw_spinlock_t
>>
>> I fixed this in git.
>
> Not sure if you noticed the above comment by Sebastian and it's actually
> documented in Submitting Patches that backtraces should only carry the
> necessary information, so usually ~3-5 lines is enough and not two full p=
ages
> like in the commit as I see in the repository.
>

Noted for the future, thanks.

Bartosz

