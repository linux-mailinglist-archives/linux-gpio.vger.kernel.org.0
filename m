Return-Path: <linux-gpio+bounces-32920-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEP5ASgHsGlregIAu9opvQ
	(envelope-from <linux-gpio+bounces-32920-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 12:57:28 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B99B424BCEB
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 12:57:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 33729308F080
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 11:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFB24313E32;
	Tue, 10 Mar 2026 11:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Le/WcXeI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2379384236
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 11:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773143207; cv=none; b=oJKXA8aUYho1t6AoHfLw+6pnTuh7Hrwphtt0ZR8OZff+3bxNw6jYH644fRZGLalEIsfm9yrRA3Ro/lcMwIf+nV7Gr3Nyn0+E6euKd+0lNgZeB9RgD6FiTVm3GvyaiBes0LcM3jEMeBUrYZabcUYf4OE1oiW2zVEWCzoGoEf3Cwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773143207; c=relaxed/simple;
	bh=hNYfW2PmdXWP40ndx3jBB9FDPr1eZeihvEAEqFyjWdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cmDwaw4VjQZ/iPgSpUaZyleYu3xO866Kz1yrey2F+FC5xUxK5gTbIc0PRsAIgGRHKI3AsdDPK/x9GAl+CqPHSyzVEuK/5eJ0r8OBAb7t7gsXDbC5Z/sQYBTZJzr9qJkTIeNynSerxdTZBYrW47v8grYbz92Hq6CLMIFsXoI/o78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Le/WcXeI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C065C2BCB6
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 11:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773143207;
	bh=hNYfW2PmdXWP40ndx3jBB9FDPr1eZeihvEAEqFyjWdk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Le/WcXeIEJ5/I5c5MTCxMQCRiHxZB5GNrnMcout58eVVdk18EdUYjzwPWJnVuXBki
	 SagzozLxO+wcE192t1+AktymvzDcdUoDHooOp4B9FImKmAhrwgcU/olf3kIV5e7MkC
	 Sbx+lsh95q7wmjhWNNmgmRSUFKTfFl3pxxKglpfkSosvPP+15QLmEBYPEQODi1FD5D
	 S616RpE9b4efrcpVUHRg2IJUZ+A98WZye5sBwPInCATJCFCj4NqPZjHW6m47ow0hzW
	 u0ScO3rxonqrCSFoEGGnCRPog9N0b9I9S4eerye/NQhRv6Ley8P9jQuW4QdcnR7J+Y
	 SHjVrpzuxQ7wQ==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7986fb839f5so111962917b3.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 04:46:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU8qoWF3fQpp9euYZqElwV7L+CWtFMiA2hacg006bMS8azsoFBOh7Rnj/utI8t9trGJjNzRAQ5PD1hn@vger.kernel.org
X-Gm-Message-State: AOJu0YxPmKeGNmsuh9RfnAKM4dhwD7q8D5Z+pANMufjT1Do4CMQTHADW
	ZE5I7dVpahrLJTcIz6Dfi7WYWAueyqwth0+GOEp4BalgLF7Uhh5tVyA6u6X8wHzZBnkUqei/949
	a0wrFfe/F+3k4HL3ctT4B1OVtybBLupg=
X-Received: by 2002:a05:690c:62ca:b0:798:5951:f42b with SMTP id
 00721157ae682-798dd74191bmr132448727b3.42.1773143206603; Tue, 10 Mar 2026
 04:46:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260224092419.1275016-1-wens@kernel.org> <CAD++jLnKxDi1GCp94zAUKhwBvQwVAdT8bgNyw5XM2+PTOhxq1Q@mail.gmail.com>
 <3x55nsighrqdo7al2n5imlov5yoti6z7jxrj7yieeghyqkllvb@akbuob4n37pq>
In-Reply-To: <3x55nsighrqdo7al2n5imlov5yoti6z7jxrj7yieeghyqkllvb@akbuob4n37pq>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 10 Mar 2026 12:46:35 +0100
X-Gmail-Original-Message-ID: <CAD++jLkEKprZ_qraCSMq2Zcz7ueiJaOEX6iQnMk9=Su-LbO6xA@mail.gmail.com>
X-Gm-Features: AaiRm51B2JF0wnKHHzU4Y05R5Ms0mzx95C_lYOY2b_o2pvVtQFzJDnrhtWE5e6E
Message-ID: <CAD++jLkEKprZ_qraCSMq2Zcz7ueiJaOEX6iQnMk9=Su-LbO6xA@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: sunxi: Implement gpiochip::get_direction()
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, James Hilliard <james.hilliard1@gmail.com>, aprizel@wens.tw, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: B99B424BCEB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32920-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,sholland.org,gmail.com,wens.tw,vger.kernel.org,lists.infradead.org,lists.linux.dev,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

On Sun, Mar 8, 2026 at 10:34=E2=80=AFAM Michal Piekos
<michal.piekos@mmpsystems.pl> wrote:
> On Tue, Feb 24, 2026 at 10:52:23AM +0100, Linus Walleij wrote:
> > On Tue, Feb 24, 2026 at 10:24=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org>=
 wrote:
> >
> > > After commit 471e998c0e31 ("gpiolib: remove redundant callback check"=
),
> > > a warning will be printed if the gpio driver does not implement this
> > > callback. The warning was added in commit e623c4303ed1 ("gpiolib:
> > > sanitize the return value of gpio_chip::get_direction()"), but was
> > > masked by the "redundant" check.
> > >
> > > The warning can be triggered by any action that calls the callback,
> > > such as dumping the GPIO state from /sys/kernel/debug/gpio.
> > >
> > > Implement it for the sunxi driver. This is simply a matter of reading
> > > out the mux value from the registers, then checking if it is one of
> > > the GPIO functions and which direction it is.
> > >
> > > Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> > > Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
> >
> > Pulled out v1 of my tree and put in this one instead!
> >
>
> Please do not merge the correction yet. As I was pointed out by Jernej
> Skrabec the solution is faulty and just cover the issue. I will provide
> proper solution as soon as I find it.

Too late, this is already upstream and I think that is how it was detected.
Shall I queue a revert?

Yours,
Linus Walleij

