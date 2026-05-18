Return-Path: <linux-gpio+bounces-37071-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJlEAcMiC2oxDwUAu9opvQ
	(envelope-from <linux-gpio+bounces-37071-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 16:31:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FA156ED37
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 16:31:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5678D3054F6E
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 14:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D5E140315B;
	Mon, 18 May 2026 14:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gSgVCrvg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6A2481FD7
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 14:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779114157; cv=pass; b=OyUJmiOM4dhO/OqcwEWgj6fqfry2f7ebH+rodO6SGuXbRRu4WKoAqpn1jQmVeXramBn467Iee8WTm8iR7ru+bsVbWI5hqUJx8/1RXPT+HW4X05P/gjbxoDBck4+FP0hL6TAL/lGHbO2I2HjdzYdNejuUQQWYj2d56Sr3yq5FJFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779114157; c=relaxed/simple;
	bh=6ZDQEOUD14QAFjatdvICgJqIwJxBsV7gED7tBhKefgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BG1RlZK5Ian6IJQMhcyzrwxg7nKKFGSLylLPD11eEckYv7ftA5zvjvLe8HWN2GS38pIfKiOaCj1ESThGROnhUBHdFlpCScuX3nCTXhw2pcjUhNJA+vJPpReC0jL3RnYq3vIQjLCZPlS8YvNJ8NnIvFdqIhPhtwktWlrvXPX9ZE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gSgVCrvg; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-65dd9b25829so1812378d50.3
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 07:22:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779114152; cv=none;
        d=google.com; s=arc-20240605;
        b=VHzpl3VcQfGxPjQuyxBWF17FBYDLkY/A2Q1ykBkuil5/2kIHR2+jBK0Qyxmbcu6w4G
         yeueRxzIeLvFB2TeiHXiDrF376X8Wy2xO0glpZ1sDTK7qaPeGr3oZ/Otn9lA7sBn720o
         BYpbpzvlwPGn/XIueM8BfeGYxHTSKsOdDuRYoEWAYGzyVKbx4AncpgcnNPleWlCUj5p/
         w/SpLUrqyrZSnM2aMJvt7+HJjtmtX1zebJtE9BFERPxdscM5x/OjWQlQU2/Nm3H9vnwV
         aLUds8l3M2VGN4sQOpB/oEVvbr2MbW1s8/UFsVjbLkDbj0NnZk8plewJyyB4+IIjWSOK
         /k/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6ZDQEOUD14QAFjatdvICgJqIwJxBsV7gED7tBhKefgQ=;
        fh=CBiSmFuALk/DSrtJiKfZaeU3sFzz9AicG6jRQ2Whf14=;
        b=A/X1aQh40iPTMu5o5lGXQ1sekqzettWKU3P6bNXG314mEQ1S7KtfY8tknKbNxi7p8I
         eJMKLUak4mliMmz73R+kvYNOu8eENNQ/hk266jzHfNIb26E/TTVyr2MqXAGNq9f4FSyz
         HFKYriO8uqKosgAHw2opKrrfYXOBoMUkZcsWtVgYtIedKiy4THNfxeIGXAAvxYx7yahy
         y2wPayFIkGKuPSWcoZ5bwRMdU2S90KbW+1pcSDauEccwo+xWmcBHt0Ir52TXgQJ5iivI
         qafswmct5biCXQTIiadnOxqvXs9LzR2RaOmITxXjP+OznjPFY7cOrTY/U+EIm8QNww1R
         BgXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779114152; x=1779718952; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ZDQEOUD14QAFjatdvICgJqIwJxBsV7gED7tBhKefgQ=;
        b=gSgVCrvgutC40EhKc9Tc6XyY9CyO11CHN7W/iEzyXY6ihrLbeLa4RaFgqN56Sty5Xt
         s0A08DBqfjVAoZGHuUqgGD2vfOIZdDSrz2wxrmrl3K6awKaDLo9+Pi0SGKjbzxOD1k37
         Cs4+MGame0kXgoYPRdQGtvqKDBNR7OEiJIg13id6jsg/Qt6wAyZcSDqSf7AuuyDI726w
         961lAAiTpf1r8Q7uAk2nDUXGkuTxl+3CuoKOuSR2cSDiLXSJZl/WhE10lWzWqFyhdRwj
         v2x0YwKrMa0g770RqaSgZ4zTsM8nrHb3508FL0R96ku8auDId1fyxKjjuqhSXUwYCiF/
         XwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114152; x=1779718952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6ZDQEOUD14QAFjatdvICgJqIwJxBsV7gED7tBhKefgQ=;
        b=iYLP/yBLEefBNL6myyY/CygMcHw/wmKglq0eQMZPTKkKMK1Ozr7eeyMbpKVbPzoVJ4
         yy5N2C9Dda5O1Oc5qfjli09FUDI3aQp40U36ap8MsW4LQsRlWcUYC5tPN3m2QBGPx/j+
         O18vuI4O8pKKDpgI4cC6A85z272yuTAWIBznzll34E6lqbVku5mF2dDNdv28WPz64SAj
         fNWv4B0U5Qf8vNqSKGYp/xBsyNMwV2LhlqDedl5d4vyHdR780GWs8TeycGEvJ8eIw7Gl
         Go6F7R19ifQhPUrlh3ZCpvEhViraxBWGsqmy9I4ZLPINocD2AYRc/mJiHPxZ7yQvGm+q
         PjLw==
X-Forwarded-Encrypted: i=1; AFNElJ9RT92+TiUiPAjQ4lTleR1GITzd/MK4B2k53wZU+P61xhHlwrxAFO1OUxxc2ljL9XBgMnNYhjcz8s+g@vger.kernel.org
X-Gm-Message-State: AOJu0YzTUoL88jzovEmQdtvdj5nDiFKv3Jascb2xeHgN87f4O5lr7slz
	eygou4QBP17TcVEocLZ34QIKNw4mzp2CLBkosUt2NmhS9RztA9uo3DTcR+wvANxJ1qprMlusXdE
	jfCo0vRBXtNPg4sodekSYsTL/wTpkBFE=
X-Gm-Gg: Acq92OGn5GrZvhOpYJoKoZ3NO3EbIWnJWYDLqWqfyGxX5IPNI8GEkWCp5vXZG1IFR3c
	LubChivay67/ulOgkjc7/02wn1V7zAoc6dE3v/y/CkEEnI6pDL15+lBT0tX3ayVKw0Qo4zQEdEM
	odc0PenGGEXmOZrLGjHY7A6hs2PgMUIwawelnoZLEdYnyajgKjVWJ2PfOc+QTu8NzMqv6td8+FB
	+vXxsw/AJIDFIMnazgHCDtqRuCaqTUpmLAEjOrvd92unNKYHUSzy2NEl7NuSflFZrh7JfJJQxHP
	39LXuRA07nqJhhz1zQi7lnffk/hO066ySoeJSYhMGfsIg3UbRoSNpW4yISLbNHvhkhwhkpKjdTH
	5z+q7xu1uR+VMLIGvWBEJ6wi0rQpqNLxH0N6rm0kHeybGccJ8IoW0a0/0JjY=
X-Received: by 2002:a05:690e:169e:b0:650:36e6:2ace with SMTP id
 956f58d0204a3-65e227cffebmr15679127d50.31.1779114152259; Mon, 18 May 2026
 07:22:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518071816.26629-1-hardikprakash.official@gmail.com>
 <20260518071816.26629-2-hardikprakash.official@gmail.com> <CAMRc=Me8ieVzXojZ=eNhBPvjjmT5gc6hJXnpC8Bc6WofDbXP4A@mail.gmail.com>
 <CANTFpSU_Ba1c_R9wbjSSqnc1+_vBMAOKDvD=EVtct8hWU+Dxqw@mail.gmail.com> <agsc0NoznnVtclk0@ashevche-desk.local>
In-Reply-To: <agsc0NoznnVtclk0@ashevche-desk.local>
From: Hardik Prakash <hardikprakash.official@gmail.com>
Date: Mon, 18 May 2026 19:52:21 +0530
X-Gm-Features: AVHnY4IGC6Vo6EpyWksUrgKqCXj97Ps2EclQ1nL4YrIUR0jWruOH719GOkgZe4c
Message-ID: <CANTFpSVJ73_j6NqDYXPX8Db4+KN74qJvo8MgdsFAy5HhZ3xScw@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] i2c: designware: fix probe ordering for AMD GPIO
 on Lenovo Yoga 7 14AGP11
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, 
	wsa@kernel.org, mario.limonciello@amd.com, basavaraj.natikar@amd.com, 
	linus.walleij@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37071-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hardikprakashofficial@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 59FA156ED37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 19:36, Andy Shevchenko wrote:
> Don't we have already force and ignore lists for _DEP somewhere in the
> drivers/acpi/?

Yes =E2=80=94 I found acpi_honor_dep_ids and acpi_ignore_dep_ids in
drivers/acpi/scan.c, and an arch_acpi_add_auto_dep() weak hook that
RISC-V already uses to synthesize dependencies not present in the DSDT.

However, the DSDT has no _DEP object on AMDI0010:02 at all, so adding
AMDI0030 to acpi_honor_dep_ids would not help =E2=80=94 there is nothing to
honor. The arch_acpi_add_auto_dep() hook could synthesize the
dependency for x86, similar to how RISC-V uses it for IRQ routing, but
it would still require DMI-based hardware identification to avoid
affecting other machines. That is a different location for the quirk,
not the elimination of one.

Unless I am missing something, the driver-level deferral in patch 2
remains the least-invasive approach given the missing _DEP.

Thanks,
Hardik

On Mon, 18 May 2026 at 19:36, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, May 18, 2026 at 05:55:02PM +0530, Hardik Prakash wrote:
> > On Mon, May 18, 2026 at 16:24, Bartosz Golaszewski wrote:
> > > The patch looks fine but I too would prefer this to be handled at a
> > > higher-level. If we know which ACPI devices we're waiting for and wha=
t
> > > the ordering should be - is it possible to somehow setup the devlink
> > > for the platform devices that will be the children of these ACPI
> > > devices?
> > >
> > > If that can't be done, I'm fine with this as a workaround.
> >
> > I checked the DSDT and the kernel's ACPI dependency mechanisms. The
> > DSDT has no _DEP object linking AMDI0010:02 to AMDI0030:00, so there
> > is nothing for fw_devlink to act on. The GpioInt resource is on the
> > touchscreen device (TPNL/WACF2200), not on the I2C controller itself.
> >
> > Setting this up at the ACPI layer would require either a firmware
> > change to add _DEP, or a DMI quirk in the ACPI scan path to synthesize
> > the dependency =E2=80=94 which would be equally quirk-based as the curr=
ent
> > approach, just in a different driver.
>
> Don't we have already force and ignore lists for _DEP somewhere in the
> drivers/acpi/?
>
> > I'll send v5 with your two style fixes applied.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

