Return-Path: <linux-gpio+bounces-33210-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICkBLnb4sWl7HQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33210-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 00:19:18 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FD726B4F7
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 00:19:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DF8FF3023174
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 23:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A77F23A381F;
	Wed, 11 Mar 2026 23:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cR6X86Qw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207DD2FC01B
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 23:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773271154; cv=pass; b=JAuLcbeRn6AQgX4WYsK7xNZVEqi/NB9hu99w2VuNSheG2yqqHn2FTOPoeZ1g1fnvvX643Oc/gW3LF/Y8G7PBLBTEfE/i07r5Sr/+zWAK1MvGN++I4kvqJ+IipvSCr0ztW69bqTS74Z6dGCuuDtsxjEX4VLCcY3AALqZHxbhYeNE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773271154; c=relaxed/simple;
	bh=S0Kwnud5iFtwr69z8VPCi5ftaPUGlvLcKnXUDXdBOFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i8XX6RK5qgq4xcy+IBt8mSApjXnNFZl3UoebaAbqkJqv599vT9QoP8+03TVmJVhHxyzLmGOA3Rfc6n3FffJ/u5DHPK8VjL7xaP5J944NzEaH04Tdx6e/yXDP/7/Lnc28bf8xaRniYAzwBjmd1ufMTjCggHHWMf7jySAmm/vgck8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cR6X86Qw; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b940f962a82so52887466b.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 16:19:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773271151; cv=none;
        d=google.com; s=arc-20240605;
        b=MP/LAD7TrX/ofkahG9KvB6MHfjN+rrg/gw2nheNk3C0wNSgN+yVrtKbK/fu70GqT3A
         CrVcSPAooFIt7+EU1hXvKm/BrGgrTyDcvDZSAigB3AG3CfseahXD6JDqJjCDd6ckHp45
         Rq2XXNB0Y5whNxBuokZdP2ynNmM6iri3fLQXGAPibYr75kVVSIKQ2fs6pOXWf0et/3ba
         L7meaZZp4dEPsVGVvhKO/U0ElO1I0S2yZs84uDWdL2IyO8+6A8MPi/U0g/mEJUkaOMiq
         S9jwncdWSC+wAwVSoJgyQir6ZIqWkQlpfVgJ3DWgCska18H7Yw0deNhTc71LkOcxDjwn
         9FxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p2a6wuOjf/7CEde44gCvKjhE0f4d1bD1oCKGRhA0Nds=;
        fh=XFKb5gqGKpE3dBHzmx3L4GpIfnwniqk7IUzetpli8+A=;
        b=P/1FHBisxk5S0CIN2RU3j8slB1c8o7fBsm86BlHzjD4enyXaBy03NzcI8WrStV5rKk
         dao6jad1zrhWTXE5iMnutROHkISPYWwIoA5qGUspTVKCZiy3yB2NhRsNeeCWHHKLzG4S
         cJpIU4h2C5+jFRJRISCMCefBrrESc9uKqVlQ51ugjRs0vXJhGApnYEkXox6G+Ujwz8aX
         9tRTSNF5ifc+buF/383HJZgMUkwvqUAr3KAlgZXmHEKQ1K7d8F54IO2KFHr5yJbhFllP
         +0ps9B6GMZnh2vZAjkwLrThqRDmt4xt0nTr9/bFGpWQMus9uCcLDgsxnIfJ/SfPuwDMX
         VNSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773271151; x=1773875951; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p2a6wuOjf/7CEde44gCvKjhE0f4d1bD1oCKGRhA0Nds=;
        b=cR6X86Qw+tvhbwCWZryMP33vE3ID5yNEhPeJ9uDPyp3jmfbOEC/zfGnBAUOv4ccqee
         2S7CdhAjVVm/9nfFDN9vUuw3tMZmWC4Nx5WhA1WshPPZOuPX6so3IM/6Zlxb/hAtc5Ht
         7uKX0244lcNW1mgz2vJlfTrJcAeilYMPGMH11iS0L/YnShPoGFReBp9utk8FFdtN4WM1
         DxSUNopaqcn04xV14HHHgqkAZGKL60Qx9XiTdW3vcaxRZXCwxhIuwPOP80EfqMIQzfCY
         TA37K3/1QO95Poad4Xg4Rdwn3Ki8GC35rNvNuZsD4afsaQL4DxPOn1Pu+nogV1/FdoX3
         d4Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773271151; x=1773875951;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p2a6wuOjf/7CEde44gCvKjhE0f4d1bD1oCKGRhA0Nds=;
        b=TTLsoWP+FBvXXwdlVGcIkkLSQVJIYqA3f+taKegXmvfmbPApK6q+FkKbBHI1ZdxPMm
         wWE/d6EDnS4x6WC92t/Z2P9G6ocydKosHjcHYmIQJYwZ46RkCug6DFE2gVe5NVpVgLFT
         9RFfoNhRpCP7TcJS3ogxX/DzKNtHY+5Zn8RZShG/MGgdzobSxfzU6V7kM8VeusuuEc6Z
         zxaVUj9xy0LLrg0od5RB5F8kK8B5saZrIPeocNo/FmGk7FP6Gnw2zLms5uH5cx3GXjzm
         2F/gvlksM9v/RHvQ3bXOj+6PCm3UF+yiimfBqTxT5Ru6R1g9ls2/ZMFfS1MX7COqP+/U
         cJDA==
X-Gm-Message-State: AOJu0Yw63KK7gk/qm9ZhAhkobl9luDGOKG8GvZZtluegOEQsk+HTOB09
	i4+I/Gpt6IbCMDGT7zAaVjZcUdqB/vmRiqcVMQzIpicOvkIwGX1/TCFBZvQMFzMH3SJ0dKh7yko
	dIIf5LopatgpTaP1BRZjusPk53LYJjTI=
X-Gm-Gg: ATEYQzxQz7RunSAeEyvxjazXbEs01r0wXr9mk86rFnHowqY89X3+1qvzjwki4vz/Yxs
	nLeCSeE8PQvVdxXxDV50w4rVrd7XoOz2Rj/X/OjZ21VTmn++Ptu7CGOwDvqTXA1nEpdPeFnX3K7
	ECnebUoBH2t/dUestTklShkPL0vjnbQ5OsLWhtExRudt5g6XmHXs+0FM2q/J/7hpRbZ8ASdLFLH
	sCDB6avbivE/5MR3n6uCUDErDdGC8F9XO37iaG7ZHzhH0l9YL+r4DkDPzbO8zB0NE4seO3WoItB
	EZwtoBO/Dmts2M8Mqy5i+oTs3VeNMaoDf82pEwlWwiDe5XWh4vE5gCddPQtwK0nX/E+L3Fr+bPx
	Yeq9MLJMC5OC4FqUl
X-Received: by 2002:a17:907:2d0e:b0:b94:b5b:4370 with SMTP id
 a640c23a62f3a-b972e158c2emr286633466b.2.1773271151254; Wed, 11 Mar 2026
 16:19:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310222040.10324-1-rosenp@gmail.com> <CAD++jLmR8TZHMbiSBaUmUvPYvP9bPOmr0a=yq4M7FNRFF4EzcQ@mail.gmail.com>
In-Reply-To: <CAD++jLmR8TZHMbiSBaUmUvPYvP9bPOmr0a=yq4M7FNRFF4EzcQ@mail.gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 11 Mar 2026 16:19:00 -0700
X-Gm-Features: AaiRm51bcB2GD8hEt0KZsTqrJJEU2s6nszH4kDHUKTkax9rvTUDLGCQS6er_THc
Message-ID: <CAKxU2N9fExr=72E6ZPs+VqCe+eSzyxS8zbcCU2PPcqKjvqiO_g@mail.gmail.com>
Subject: Re: [PATCHv2] gpio: ljca: reduce struct allocation
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, Lixu Zhang <lixu.zhang@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-33210-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 80FD726B4F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 5:57=E2=80=AFAM Linus Walleij <linusw@kernel.org> w=
rote:
>
> On Tue, Mar 10, 2026 at 11:21=E2=80=AFPM Rosen Penev <rosenp@gmail.com> w=
rote:
>
> > +       size_t num;
>
> What about naming it num_connect_modes?
> (and unsigned in as Sakari says.)
Too long IMO. Makes the most sense to match variable names.
>
> Yours,
> Linus Walleij

