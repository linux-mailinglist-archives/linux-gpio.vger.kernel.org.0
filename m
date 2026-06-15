Return-Path: <linux-gpio+bounces-38501-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZvagNhYMMGrxMQUAu9opvQ
	(envelope-from <linux-gpio+bounces-38501-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 16:28:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F606872AB
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 16:28:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=UgiLfCIE;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38501-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38501-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7DC983014760
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 14:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E5AF3F8246;
	Mon, 15 Jun 2026 14:25:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56A83F5BFE
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 14:25:45 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781533547; cv=pass; b=Aoos3u8r5atN/9ScDSVSAt2NfJOsHA+j4ZyXBHbQTHWrMrUf2k+OawYbMonH00jUqlpy2YJ3GUNoE5BsrbbHJM26tmzWHbWuv39ZK4kqXRzkh+W1bxWziZj+Yn94Bh3kmYCdKybdhAeYsFBKpEuA/uCTbsqspZxRAV9sndLClDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781533547; c=relaxed/simple;
	bh=dLm7IjDsPQ4vuOwU5FXXaG3i0pFiUvG0NK3lOMPOljQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UXNBNCKdbxuIiCdiF5qZa8qsaWGMsxD4oyGOs0/ZqqYXGJV9wRt91xho5VFMMNN9LmtuEGmwnVGfzL/Th+m0nkF/I4Sk8jP+/T8eRDKSNwwLPBTzGsDO5dMARcYwP+8pdApwmP9oONnoysQ9+6va/RKNDGTRsvPMlB5IrN0sPiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UgiLfCIE; arc=pass smtp.client-ip=209.85.221.52
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45eeba68948so2546887f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 07:25:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781533544; cv=none;
        d=google.com; s=arc-20240605;
        b=B47PRmKiYP5FhFIwUVviCMqlrNqH2yj6j/9aLwfn8079R2OTcknonRNgLi7SNapdqy
         h4qgcdpHm7UxBGX0TB1kMqUTzG+3vcK5l0Kpfg4HgyMd7kbpNEdfvCrA6JcrJj8lnnWW
         Jre6XqOjBDH8DG4sVQz4k57punGu45fpEq50GH5cyjApcf2OrYzJrGxg4yjlEy9LPTIn
         1N0TCcReiGZC7GZa+de3GqIyuf+LGa31HRirFWUPwg4VDw+9IdNlcpKjsgOKz0fqt3xf
         VaydUFShfzcy0ZGZX6G/wroKFE2YA7Arb2iohU0DjoiRFV7ELe4FiWEBxnSAuzeAbLl1
         s3lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Jiy1X+McE6dE/+HoLOW5DfX+KG8rY6pnAsRQBz0E9v0=;
        fh=MyeMnUkZy5XlP/TBItuu5A/4WjtkVP5gXGE9L6jrXzg=;
        b=SItfOMxATwe0xFgjrH5hc+9ugj3KwTHynR8FC56RaaVLdQlScAeDxGaW3ZQZdp/bVq
         2TH4rn7S9BVG1VGU0v4dT/fc1zw2Q0adSMr0mkdCKebzjGN3xz8rN23kqaFZyHjaI9hB
         +R8Iayirz+0O4fZuLXzVLKftwim8mKs68EnUr1ogn+Cj0hI5AcFbmOh1LQqexMqE5AR2
         13sf0tRj+XqLsY5cWnhYE4cygVzcaF8/qQTknugzSerYrwqZvg4p72v6BgR5E+plZni/
         XAUxy2O3shZFciNPNnkbM+pUDyQVypjt2On4oahq/5Q97pw9KPMxiMe6Y+cXBeNAfB4j
         RAOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781533544; x=1782138344; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jiy1X+McE6dE/+HoLOW5DfX+KG8rY6pnAsRQBz0E9v0=;
        b=UgiLfCIEC8CJQcGaOt/r1vitfiEjLoaRVcrU5TnOdcDK8BYYxP0/Vq6fLBnAIrD1NL
         pxowOP3Xfbc9btRa2PQVs0GKMsLZtvxF7Auu2NrQTHmFejOtQJLbiYXcc/iGy/pF4hDB
         XcnalygMno8XR6IoATuuZbqFiw4Y6UGeApV+ICGaQWxVk6krTU3NYtY0LCoNjaMQfGhg
         SK1y2F++dYrSdnAfzrXUbvvsMlB0udzHOE3ndk1lQ85zQOW3U8XsKojG6cNy74KooUJ2
         SOt0AqCigoIRjf3aEjpdrLSN8XgnE2s0ZLn8sL0tFv23VmW6cZZF+9DifxlYEzB9ofRj
         bzkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781533544; x=1782138344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jiy1X+McE6dE/+HoLOW5DfX+KG8rY6pnAsRQBz0E9v0=;
        b=gphco2R1hPYZa0vva6gsWxadn0BJ+etAVfQhU3I5VSuknjNYgatcIPeCqVkVufaCpV
         o4uTICypjI7Ly4+tmtN1TcvGspRLPC5L3YO9+bPmZZPSg0ksNJ8AImazMtWmybBp/e5f
         YVjFLldCaR7VY37bJeUNYoxVitcGpuL9oha/yBTwpesepkJJzLJjD8l6wbMn+qQ5z/BF
         jaJYGGx08xHd6722ts90xMKMq5AEdNtl/b5FkraNy/iv5PLkgeiWEvlefp8pgWI/O7LL
         aEpOmjJf3AI2spRbJ6wYGZK2HPTn5J1Llwg1rTTzn70zD1Or675nIlljtkdwbruQyGd6
         ijKQ==
X-Forwarded-Encrypted: i=1; AFNElJ/KQaoKL8Vy302yiAMYqpq+Qd4fEhnNN6eSxG9SZyzEVzbZZZC6cJ5oQdY6upsTTq0b8CnGJn4TgyxZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxjeMTfVi7JM/nZ7HTy2UIhjiW0NnlBMaVAddWMwV9KedFmuao1
	mNBVWmnQrJceFdeehNMXY9QFsDY/+bYYQPuBL3YSVmzVS/XPNgkrvEqGgWKcyAO/wILwgkMYfjJ
	hKGNNYfd99aONY2IijzCDP0Q6+RxZ4A0=
X-Gm-Gg: Acq92OFqm3DXReZNPg0YCeXaoqmnzI6uLALn5BFep61CEJdNRsMLnR8/+uEvxUlgIi6
	f2IYGmaSHvnmuhsl/IXc2yXKsT3gHu9IXFC0pqtccSJSUTL3Zw1Po59dWPxrehU3TX6kZs6Vc4L
	XfCQAjcfvju8A3wfvTu/YqaNuGfZX22vpwG1dURRJA/5XRGNVj7PDKNwMsrxg9BIqMr0C7RB03R
	VbaMQFd/TuOZ6NzDG6NZBRDRXgvw41PVWeUu69jvW5ms8hZLl54r2KkqnK2JCiV0m30MnN/tSw6
	w1XHSpuCQA==
X-Received: by 2002:a5d:5885:0:b0:45e:f2bd:2b16 with SMTP id
 ffacd0b85a97d-4606da839bfmr21121894f8f.18.1781533544008; Mon, 15 Jun 2026
 07:25:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260612-upboard-pinctrl-add-upboard-intc1055-support-v2-0-4111b256c840@gmail.com>
 <CAD++jLmFKz19CRp-E=JcUnNkxNzKtSow6T8_9jDpR-wTrs9Ptw@mail.gmail.com> <ajAHE29I3IWQNVsV@ashevche-desk.local>
In-Reply-To: <ajAHE29I3IWQNVsV@ashevche-desk.local>
From: GaryWang <is0124@gmail.com>
Date: Mon, 15 Jun 2026 22:25:32 +0800
X-Gm-Features: AVVi8CfjoFdgU0jgNZ2WnOLy8pnMuq5t4uvW_wAJD59BvF62I0n_FaNohNPjXck
Message-ID: <CANYHO6pmq+YE3M3kUOegsYwxjfV3qBasX56RSTtwRvVMaFCgPg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] upboard pinctrl support for device id INTC1055
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linusw@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Thomas Richard <thomas.richard@bootlin.com>, 
	Daniele Cleri <danielecleri@aaeon.eu>, JunYingLai <junyinglai@aaeon.com.tw>, 
	Louis Chen <louischen@aaeon.com.tw>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-38501-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:linusw@kernel.org,m:mika.westerberg@linux.intel.com,m:andy@kernel.org,m:thomas.richard@bootlin.com,m:danielecleri@aaeon.eu,m:junyinglai@aaeon.com.tw,m:louischen@aaeon.com.tw,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[is0124@gmail.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[is0124@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 96F606872AB

On Mon, 15 Jun 2026 at 22:07, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, Jun 15, 2026 at 02:32:51PM +0200, Linus Walleij wrote:
> > On Fri, Jun 12, 2026 at 12:13=E2=80=AFPM GaryWang <is0124@gmail.com> wr=
ote:
> >
> > > Add missing groups and functions in Tigerlake's pinctrl driver for IN=
TC1055.
> > > Add support "UP Xtreme i12", "UP Squared Pro 7000", "UP Squared i12",=
 "UP 7000" boards.
> > >
> > > The pinctrl-upboard is provide additional driving power & pin mux fun=
ction
> > >  through native SOC pins -> FPGA/CPLD -> hat  pins for flexable board=
 level
> > >  applications. it's probe from ACPI device id AANT0F01 & AANT0F04.
> > >
> > > Signed-off-by: GaryWang <is0124@gmail.com>
> >
> > LGTM
> > Acked-by: Linus Walleij <linusw@kernel.org>
> >
> > Since these touch Tigerlake, I expect Andy to queue and send me
> > the patches from his tree.
>
> Yes, this is the idea, but first I want to hear form Gary about Up 7000, =
which
> seems doesn't work with this.
>
It's my bad, the up squared pro has p & n series processor, I only checked =
the
 p series.
The p series is used INTC1055 and  n series is using INTC1057 has confirmed=
.
I need remove n series boards, until we finished testing, thanks.
> --
> With Best Regards,
> Andy Shevchenko
>
>

