Return-Path: <linux-gpio+bounces-38574-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1gXYLNceMWrPbwUAu9opvQ
	(envelope-from <linux-gpio+bounces-38574-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 12:00:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 765E168DD31
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 12:00:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=NkcOxVey;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38574-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38574-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5EEA73065516
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 09:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CBB3426698;
	Tue, 16 Jun 2026 09:59:18 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176E5426D0B
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 09:59:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781603958; cv=none; b=N+DN9QEnVFSHq1kQtqkXPTv20e6+rEEQ7ON99qf1OwoPu3XauL4IcMOKpHLBJKSVLs8jA5FbMmNO9BbV5OsnRKUHkwsOo3ahrqn4XRKffzOEXFfU6gs8phZRrtGS4kKofUhEa63kU5d+ujhWuVpqleuwDoAkbu4rbuuvp1QCFdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781603958; c=relaxed/simple;
	bh=sePwho+bVBg15IwxdfHrYv7Rg7tbjzmkGhTzjl6RvSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e2ZGT1yRuTsMFg8v07+DJuugkHG6VRhaubIb9OVm1diEIQ5l2gS1BPlssnY90CZiBa7EEFnZ2ikS+mRqmdGwyWjGnty/F5tG43tmSj9JtvwMDAx1ANdIn71k4O4aw6MC7l/16Nkh5G+LILr4S+bh8Yni9t8WY7I7l5STjUlpTy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NkcOxVey; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B20DF1F00A3A
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 09:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781603956;
	bh=TwuZudGybOhxYyGpQPGv0UAcDPL1VmepQn1rYEiyZvM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NkcOxVeyEY89tn7w8Xhb8yJsrp31qEv9sILFoND6OcTNFQ15OI+rTizfQLlAtG8B3
	 KC5F/fh33ZY7BwMm8v1gfdHbTznl/hHfnS3tK9s2pRK4QOqFTY9ZHEvaRIY2fGUpuM
	 dCPRokgsQhVHkjaaOQDozpy5Ogv9iX9xF5QjDTNCOlvWP3Ktg1gKqUrqdCSgkYkxC4
	 3guVccd4Tsrw0My3hGHDYF0nfwQt/1O3iWKuAl+JBVqfFb51WWXkoN4k5L8GL14GBB
	 mKKZ34lWZELZz43S89lb27VDLjScwycMMFlzPFlPdd42nmHoC5FDX945CGkqAgxaFw
	 oVFt2h609ilaw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aa6792e7b8so3915770e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 02:59:16 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy0Ry3NA8xu8DsV3sKYqmAjPQd4RVX91H+6gzdPeFCc0Vyynb/h
	Snsjztdj8KZwrtOulOT8Pp2HIyqBB8EUneEj3wZnaDNID9vKdJ0s8bSvyUInBBeVAvLJuaYPslQ
	9Otwd3n73f+UkdZHtzPLSr2qzQt2QdOF0eQ/qu1ADTg==
X-Received: by 2002:a05:6512:3b83:b0:5ad:317f:a9a6 with SMTP id
 2adb3069b0e04-5ad317faac7mr3673210e87.8.1781603955485; Tue, 16 Jun 2026
 02:59:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <af18zdP5HF3_P9Vo@black.igk.intel.com> <agOJ0LrqDSbhHPi0@ashevche-desk.local>
 <aiZglQb9hQwNeApB@ashevche-desk.local>
In-Reply-To: <aiZglQb9hQwNeApB@ashevche-desk.local>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 16 Jun 2026 11:59:02 +0200
X-Gmail-Original-Message-ID: <CAMRc=MeGFJFs-zL4+Q23HAnW6C+Y5JTvHBntQ9+4+UNNjkU-kg@mail.gmail.com>
X-Gm-Features: AVVi8CcXfOzlNlnH_m83ktnFPnotr_uWW5x2rC_whV_gJOHMJJxQfaGBCNZBo4E
Message-ID: <CAMRc=MeGFJFs-zL4+Q23HAnW6C+Y5JTvHBntQ9+4+UNNjkU-kg@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 7.1-1
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux GPIO <linux-gpio@vger.kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38574-lists,linux-gpio=lfdr.de];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:linux-gpio@vger.kernel.org,m:linusw@kernel.org,m:andy@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 765E168DD31

On Mon, Jun 8, 2026 at 8:26=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, May 12, 2026 at 11:13:04PM +0300, Andy Shevchenko wrote:
> > On Fri, May 08, 2026 at 08:03:57AM +0200, Andy Shevchenko wrote:
> > > Hi Linux GPIO  maintainers,
> > >
> > > A single fix for ACPI interrupts handling on boot. Have been in Linux=
 Next for
> > > a while without reported regressions. Please, pull for the current, v=
7.1 cycle.
> >
> > Bart, any issues with this PR?
>
> What's going on with this PR, please?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Hi! Sorry, I have no idea why this didn't trigger my PR filters.

Now pulled. I'll see about fixing the filter, in the future if I don't
respond to your PR within a week, send me a direct email to
brgl@kernel.org.

Bart

