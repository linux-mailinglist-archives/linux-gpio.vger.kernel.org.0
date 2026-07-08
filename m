Return-Path: <linux-gpio+bounces-39654-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kPnZJ6gpTmpkEQIAu9opvQ
	(envelope-from <linux-gpio+bounces-39654-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 12:42:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 934747246FA
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 12:42:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Yjzn3PIM;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39654-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39654-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C278F301DEA9
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2026 10:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 541CF3D413B;
	Wed,  8 Jul 2026 10:39:34 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF163D1AB3
	for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2026 10:39:25 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783507171; cv=pass; b=BtCa60Ia+vPPX14snv0pGAdIwPVu5qNVHO3fbGenHZ8dCmpJUa8HycjQgoysxQaAIozt6ElksX6iYJH70OCgqxBGpMj1fIhZflszIqsO+kJi+1qaCsp0SgLzoVhP3OgX1FcB6BOqTr1jLCND48cDfKy8ciyAwD+7RdiwcVGvtgE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783507171; c=relaxed/simple;
	bh=EnRJrMnVelcjsgfDm9cyNN0LC0pWNARIVHIv2FgH6p8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XslcQGozt2rfpcl+HfRfqzG5PRxWWp8LOELJmm03Fz/hUhEdr2TTly9TFN4iWnxQAvEPDhOqPNEdZeKxfKZgfuEwwCd0ao93/m6uGGsDYp4PU8nd610uu7CjNt8DhLR0ccKl4tGkF+5YFL3cdLRMXP3jdtFkj+/s2Z8p7jnoHaY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yjzn3PIM; arc=pass smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso3814505e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2026 03:39:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783507162; cv=none;
        d=google.com; s=arc-20260327;
        b=INRLe2nq1EfWp47OLoF1l5E071wOhsiIPiF+iV/nMauV2lQbKqdomN4ey0RpX9xfE4
         WMKMds0zlRQ6JytQVy1v8WSX8wotFSYVvB+avC1GV9tGUcYhGFvpze4ZNhV3t9OQWEIJ
         9h7ENWxIL5rZ46w1aIkDBKdUP4Cp3tsz3zfQjXVbeywPrtEHPmIMQPwRUdG3HjDjtueP
         Xt/U3xuOjVQyHi+f1mfbEzWRNVyQlcsMwusTn7rHqi7s52oy09Wn3ogBwlV9XC5tMBWG
         MbIaTR244/s5Ucvxdps+yw6aq3RPqPTEAW1UvOHg9qz32qggFHdQkYZJTri7U5YHshTd
         8QSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EnRJrMnVelcjsgfDm9cyNN0LC0pWNARIVHIv2FgH6p8=;
        fh=RusDWkIJ8nnzPLrfhbNPzquLnRqhdNHQjGzyTO2ihBg=;
        b=Jyfp3yrLn0M2deKUNeUIjFtcoaOrbBmip/gKiSo84WED2x6JuBAfXXkl7XhTec0V0f
         WzQGrwQdAKxP139P1g9n4NfVe2DFt5d/uGF3FbjvK3QfCIlrxM82FVDzMrDycztHfNPK
         v7rM+io7/gEGDb/g5gqL+Zchc2etd2TNElVrm4fqX9BLJmilO6MhrTcYcIk9PyLj98h7
         Iw8faNrHiVdXJdRCXWjVhagJxTmP2NuNZ0bfYiF8ezO/97ZjTNkgLPB7KGnaq0YSMKIc
         D78+RqerbfLXlm8UvQNtB/0R7mBjzadSWNWFOO2S/FBjY+nc0PWE55+9+JB+WWVAaj5d
         BTMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783507162; x=1784111962; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EnRJrMnVelcjsgfDm9cyNN0LC0pWNARIVHIv2FgH6p8=;
        b=Yjzn3PIMAGdDisMG39yKLKIr5oHSrgM50pXVoP4UfybQM26UsNQm5Rmd2OnXZN7dOU
         zjgKDWBlmj89DUvXk/7Fp3zHblxkvdovlmeshJAUabTTpxISmZTBaodu+sfmPtjVpaoW
         wC174Hlg4oRtC2UQcL+pYgCwSxfG/9P7Dzdemfle5+Al2b6+KOEsWxwUkV8mLOdS6dug
         6YxRGasbg2EUzFsgkTXMpqgAPsIwJc81jb07QjZ+58o3l5l1GY5P1+tx7vd1q+nbEbMY
         I8QqgjZNsaJ2VC/R/SBpOOPgvmYU80oc7uXQDexzwre2iwGtLEKWSZlsVe9huM7xd9+c
         PlWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783507162; x=1784111962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EnRJrMnVelcjsgfDm9cyNN0LC0pWNARIVHIv2FgH6p8=;
        b=QWSTUDEU6TT5abOonaEUU+EmSzJblJIefWCfApRjhHR/q16W5jT+Gult4q4Oaq5r9D
         mlsw5t/RgetL4P5jqANtNDDGWHqWE4xd0wAzfNwW6fLWr01NeTvvZ77tJkCbuD1GMDDa
         nKLNol+/fjW/HsIrvXhHi+K9VkypRA9W9Nre2YasNLJl64UbsKSvusSmh7tCPv3jIC+5
         ve94SSkzoJN5cRD8mrth77wPX6fhvNja3WrciXAWBxpAiPwbRzciVwjlnvBc/KIUZzgn
         SnSrzwI5kbTMyUojuEo1jKgbF4IVNwR934G5BZBn7alwhZJtY+r8cLF8r85AeFEA1+CW
         3XkQ==
X-Forwarded-Encrypted: i=1; AHgh+RpDeHNncsmyJRVr2urlbl4Kbs3sg+eC0au2gR8z8YxcyHFdCqO8zvbN7tOahrrEv2Z9c3D2nsl4LfNr@vger.kernel.org
X-Gm-Message-State: AOJu0YxG+jOCNbNKN6H8NtZ2MYJY9cV/l2jrRLmSrXorSMHt3oLDJaud
	KRT3RU9mgWYuKPab0rYK5jV2k0vgOYw+uBx7Gw8lSdZi8GN4klwxnhL4897HZVBx9BZ3uPCCy++
	5ibqxrNVKQVXH6H+0qMbeiM9UB/VBNE4=
X-Gm-Gg: AfdE7ckxxs4AgB8Hgtk2GpMgzWhHZekcg1QBkDGyejjtKEYcwaQPOJgTraHe83JuolO
	xQGI2cCEVNQQQToXh7G+xt5/Dta+8EBfY8o3AazMa/dSDToJ74AXIlbvhFVSEuBDdNBNwdXJdbC
	vgnV4agk9lMYtz4STDgSqAMGQaArR87GXXtAh+jJuGBuoSum8SXNEZEM+40bHVW7f40f4eZDPUU
	UPi3lLx5ns+p4JDvY5cjT+Cncg+kCJtDNQNP8pHMQKFnRw/avHEoCGJYuegEv5pdDHrTZvR0CU=
X-Received: by 2002:a05:600c:1385:b0:493:e7b8:fd3d with SMTP id
 5b1f17b1804b1-493e7b8fd4fmr12912325e9.25.1783507161279; Wed, 08 Jul 2026
 03:39:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706-upboard-pinctrl-add-upboard-intc1055-support-v4-0-cedce0802d3d@gmail.com>
 <20260706-upboard-pinctrl-add-upboard-intc1055-support-v4-2-cedce0802d3d@gmail.com>
 <65fef790-0e8d-4c29-bbd6-ed6b9dc65fc3@bootlin.com> <CANYHO6qfRL-5rJevKrYySai5MoWjNm9xvVOkMVAmt8YN-cZPnQ@mail.gmail.com>
 <b2ee8bf9-de42-441a-97fb-2e42ad882b5e@bootlin.com> <CAHp75VcGGC8Z5vGN+RQtSA2N+s9ViH-tHi_BjT-_SWPVVoLQxA@mail.gmail.com>
In-Reply-To: <CAHp75VcGGC8Z5vGN+RQtSA2N+s9ViH-tHi_BjT-_SWPVVoLQxA@mail.gmail.com>
From: GaryWang <is0124@gmail.com>
Date: Wed, 8 Jul 2026 18:39:09 +0800
X-Gm-Features: AVVi8Cd3Dyas9K1bFQzdszIKup5_yXA9XPfKnWUyBvQzYHVVJ5w1m8dDRDA0NII
Message-ID: <CANYHO6rKGCs9X88rPfv6C473q+rCk3LdePBkQ3tg0Xhe6ByO0Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] pinctrl: upboard: add device id INTC1055 based UP
 boards support
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Thomas Richard <thomas.richard@bootlin.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Daniele Cleri <danielecleri@aaeon.eu>, 
	JunYingLai <junyinglai@aaeon.com.tw>, Louis Chen <louischen@aaeon.com.tw>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39654-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andy.shevchenko@gmail.com,m:thomas.richard@bootlin.com,m:mika.westerberg@linux.intel.com,m:andy@kernel.org,m:linusw@kernel.org,m:danielecleri@aaeon.eu,m:junyinglai@aaeon.com.tw,m:louischen@aaeon.com.tw,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andyshevchenko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[is0124@gmail.com,linux-gpio@vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[is0124@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 934747246FA

On Wed, Jul 8, 2026 at 5:21=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Jul 8, 2026 at 10:49=E2=80=AFAM Thomas Richard
> <thomas.richard@bootlin.com> wrote:
> > On 7/7/26 5:55 PM, GaryWang wrote:
> > > On Tue, Jul 7, 2026 at 7:50=E2=80=AFPM Thomas Richard
> > > <thomas.richard@bootlin.com> wrote:
> > >> On 7/6/26 12:36 PM, Gary Wang wrote:
>
> ...
>
> > >> I tested the IOs:
> > >> - pwm0 does not work.
> > > you have to use our pwm kernel module for pwm test, I'll provide late=
r.
> >
> > Ack
>
> Can you, folks, elaborate why this is a requirement and what exactly
> is not working?
>
pwm resource IO address is not reported correctly, I fixed it in pwm
kernel modules
for testing, we set the pin mode to the correct function in this patch.

> > >> - uart1 partially works: TX is okay, but loopback doesn't work. Sign=
al
> > >> is bad when I add a loopback. Looks like pinctrl misconfig on SoC si=
de.
> > > uart1 tested ok on our side, if you loop TX/RX do not forget to turn =
off
> > > hardware flow control. and we have executed cmd as below to make sure
> > > direction is set all right.
> > > echo "uart1_grp uart1" >
> > > /sys/kernel/debug/pinctrl/upboard-pinctrl/pinmux-select
> >
> > I did some tests with/without flow control using linux-serial-test tool=
.
>
> I'm sorry it's not so clear to me, does it mean the serial interface
> is (still) not properly working or you have done that pinmux
> configuration and everything becomes fine (as Tested-by tag suggests)?
>
checking with Thomas, but testing ok on our side.
> ...
>
> > >> - for SPI, MOSI and CLK are okay, but not CS.
> > > Do you have enabled spi in BIOS HAT configuration?
> > > CS0 should be ok, it's SOC defined, CS1 is optional, users can activa=
te low by
> > > himself before read/write, actually all gpio can be manually used as =
CS pin.
> >
> > I applied an ACPI overlay. I'll test it again.
>
> I suppose this part is not as critical and I just wonder what the test
> results are.
>
testing ok on our side, waiting for Thomas to clarify.
> ...
>
> > Anyway these are not related to this patch series.
> > Thanks for the clarification.
> >
> > Tested-by: Thomas Richard <thomas.richard@bootlin.com>
>
> So, after all, are they all good to go?
need Thomas verify, I thought only uart has problem in his testing.
>
> --
> With Best Regards,
> Andy Shevchenko

