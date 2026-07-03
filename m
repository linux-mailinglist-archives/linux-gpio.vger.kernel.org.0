Return-Path: <linux-gpio+bounces-39435-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6YPMJ6IsSGpnnQAAu9opvQ
	(envelope-from <linux-gpio+bounces-39435-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 23:41:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0631D705F1D
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 23:41:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=OZXg0Np1;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39435-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39435-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E8BE73013029
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2026 21:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFE1B33B966;
	Fri,  3 Jul 2026 21:40:54 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3BD2C9D;
	Fri,  3 Jul 2026 21:40:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783114854; cv=none; b=YCbtZXUZ51NUxbn1ikkcA3ecG53FNrNzq4h7PJyjv8u81BeK3jp7ipkpbxJ0OgeXq2VYgNMRQv0hKmPMVSZmvJ4yu8ya7kgOJLFi0uGr0oW5iT+Y4LK56/YM37jtQbM6yy+9N1rA+faGuTwfdoTO2O/HudxANMXygJ4g7n4hn0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783114854; c=relaxed/simple;
	bh=raaPYP+2hyiUG86TMchAhvZ/aGRmIroQIuvD66fcPJA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sBS2iksYrsPUfjgThxioUdtWbXf89fRnvXZN0XC9nMmvi8DrQ1bAlgUm0t3qctEg0A7DxY2Wb6FOt2ixZXSpd9vlDxABleKmKyIJfe89+8IcYvmQxiUHfmAFiJx/JdArG7OLRJipEHMH7hgqQYqY8O6Fb6OSqwOM0QioXpIupJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OZXg0Np1; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73D3F1F000E9;
	Fri,  3 Jul 2026 21:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783114853;
	bh=hj87wPlYJerFiHqBBt/KxQtpDVA7YEFYTELpYkOH4cs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=OZXg0Np1kq9jWbd1AVDUP74lFTmI2VyNysRjogYOuh+Ibb6vGJWfWkE6BXj+2Y5VO
	 7I8Da9EKyDOBeizotbyOGhTi/biuoIiXbv8/npsdYJ9x8EvihlvHzSBYO+HQOtIZ/F
	 /fFjx+3co3gBH+/9cAXTLad0/3o24N+noHhcbTgsC+pX+xbXI5KfwwQV/Jfq7vsooT
	 36CvsDzXtBpu0MJ7887pztvxOjZKC3+0ln1vpzt5reskg9SJytXZit7rw/YmR31atU
	 fIC+kTn3UD1G59layS+x4fwJ/jzJfFlKyZ27PDpu6idH3ffWEUALPpIUjGKFi3EbOX
	 pv1OfYJFkz4Kg==
From: Thomas Gleixner <tglx@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Liang Hao <haohlliang@gmail.com>
Cc: hoan@os.amperecomputing.com, brgl@kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: dwapb: Add robust error handling in interrupt
 handler
In-Reply-To: <CAD++jL=Z-xKOpFLXa_fyoJ2K4vXnDPsHMsy2EUM1_Paaic-GMg@mail.gmail.com>
References: <20260703134833.21110-1-haohlliang@gmail.com>
 <CAD++jL=Z-xKOpFLXa_fyoJ2K4vXnDPsHMsy2EUM1_Paaic-GMg@mail.gmail.com>
Date: Fri, 03 Jul 2026 23:40:50 +0200
Message-ID: <875x2vlpjx.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:haohlliang@gmail.com,m:hoan@os.amperecomputing.com,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[tglx@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-39435-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,fw13:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0631D705F1D

On Fri, Jul 03 2026 at 23:21, Linus Walleij wrote:
> On Fri, Jul 3, 2026 at 3:49=E2=80=AFPM Liang Hao <haohlliang@gmail.com> w=
rote:
>
>> The current interrupt handler silently continues if an interrupt
>> handling fails, which may lead to interrupt storms. Add proper
>> error handling to gracefully recover from failed interrupt
>> handling.
>>
>> When generic_handle_irq() fails, the following recovery actions are
>> taken:
>>   - Write EOI to clear the pending interrupt
>>   - Mask the interrupt to prevent immediate re-triggering
>>   - Disable the interrupt to stop further interrupts on this line

This completely fails to explain WHY generic_handle_irq() fails.

There are only two reasons for that:

      1) The interrupt descriptor is not available (EINVAL)

      2) The platform mandates that the interrupt has to be handled in
         hard interrupt context (EPERM). This also emits a warning.

There is also zero information whether the irq mapping lookup returns a
valid interrupt in this scenario, so it's hard to tell what's really
going on.

As there is no mention of the warning I assume that's #1. Which means
this is papering over some underlying problem in that driver. Looking at
the counter measures makes it entirely clear:

    EOI, mask, disable

If there is no interrupt descriptor then the driver failed to mask and
disable the interrupt line at some point.

So this is just a lazy debugging aid for something which is not supposed
to happen in a sane and production ready driver.

Thanks,

        tglx





