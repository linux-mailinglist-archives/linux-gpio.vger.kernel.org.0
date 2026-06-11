Return-Path: <linux-gpio+bounces-38311-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id atxmH95tKmrkpAMAu9opvQ
	(envelope-from <linux-gpio+bounces-38311-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 10:12:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEE366FBEA
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 10:12:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=IrPw2PjP;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38311-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38311-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BBAE3145361
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 08:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66662377019;
	Thu, 11 Jun 2026 08:10:42 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344DB376A01
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 08:10:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781165442; cv=none; b=sQv8VYZG1b3rnho9Q817lywPc3u9Wjo2BilQGD8B7MG91yN3SgDnck2yjcBPfp0V08TcqikMCS6nEh48Aq1gLtFpcFTqjYYOAF+hsHhM4f0kKaocR5zNHbJ6TRjM5Npsze4g2m39rTCF54BBtFXrXn2vP6D2Bd2tSra4g0wKN1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781165442; c=relaxed/simple;
	bh=k5Yn//yvMxoJEYHLyKMM/OCVLrQkkTNBVjc8D+EXWCw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mt8x+t7hPQh8E/eRUCirdnsw5u0Tu6cdTPirs4dOpFe50bgMnmI5ckW/o+K8kKEhi/+l6H1EOKEss0EwJa7CmdeSJIzB+hvvinT/TDbCuBQs3KbaIwjj69naDMKzb2dJEZagGXgsKXuawIX6GkU8flTmtFkUh6ihExQ+f1OzHsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IrPw2PjP; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA7A71F0089A
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 08:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781165441;
	bh=OzBpfItUtOEf2eFxypCcg42sLsvDwHVRXaXNAUgljuE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=IrPw2PjP148jPkuwz3x3oZ6SckKxyWJbygS1e0W5g4TFZ2iiiMGkP8h8FeQHBf3ry
	 O5jeyJUS6CezdLpCFf7uLAU8csM3AJhyxq4+CKXoXYS1b4GrIpUgk2NktZdJDxbZkT
	 0LU7wIOrIM3ZlVcy8qwo0aUuQ+YXtbdCQ/uWsg9uycvl8w8UzuKnKYFa4S9RYNfEs+
	 ZS0cCl8jJgQf/1/YHcgnmaWGBVsVxsP07nEh30oaSCKO56BxPm2VVNJjLb93+8XHZk
	 i0IhiKD/O5Gtu8kIFN+c81eGAO5F5f91qqejatPRljLVp0jml7Pra3OzKMwzcPuAK7
	 hKtn+txKs5Muw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aa68cfc182so7025148e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 01:10:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/VN4K8ercb4ERfDFwljSz5l51mIS1WkhG9WX5wWxwhtLXybTxYhd5qKzNDCG3i26G633LGWBuF8E1A@vger.kernel.org
X-Gm-Message-State: AOJu0YwEMti7/0lQWD47Ou118manlcjKif6UANquE5N42PclDh/x228x
	Fsxa4/8F+qrcC6/wqNyiVI76uB0v7juvBvK4cbGRgUMX8IG2UmuYWW2RufNpA1IrOfG1ri6MoyF
	HPmUG+xfqC69cXEOGgoJIW8k5f173v0o=
X-Received: by 2002:a05:6512:1243:b0:5aa:7653:49b3 with SMTP id
 2adb3069b0e04-5ad27fb3734mr609184e87.32.1781165439670; Thu, 11 Jun 2026
 01:10:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603055347.66845-1-changhuang.liang@starfivetech.com>
 <20260603055347.66845-3-changhuang.liang@starfivetech.com> <20260603-sinless-mooing-48a37d3d05ea@spud>
In-Reply-To: <20260603-sinless-mooing-48a37d3d05ea@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Jun 2026 10:10:27 +0200
X-Gmail-Original-Message-ID: <CAD++jLkBeDkFAXLMDvEA8LjbBNJCz_ycYNPnDxs26qLTqDhXTQ@mail.gmail.com>
X-Gm-Features: AVVi8CdyDNSFfJSkRGe4nWHY6bfkMBmY29TaiK6kirTSTVWDFpGWXq8lEWJvp8o
Message-ID: <CAD++jLkBeDkFAXLMDvEA8LjbBNJCz_ycYNPnDxs26qLTqDhXTQ@mail.gmail.com>
Subject: Re: [PATCH v3 02/21] pinctrl: pinconf-generic: Add property 'input-debounce-ns'
To: Conor Dooley <conor@kernel.org>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, 
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38311-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:conor@kernel.org,m:changhuang.liang@starfivetech.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kernel@esmil.dk,m:pjw@kernel.org,m:aou@eecs.berkeley.edu,m:palmer@dabbelt.com,m:alex@ghiti.fr,m:p.zabel@pengutronix.de,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:lianfeng.ouyang@starfivetech.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DAEE366FBEA

On Wed, Jun 3, 2026 at 5:18=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:

> >       PIN_CONFIG_INPUT_DEBOUNCE,
> > +     PIN_CONFIG_INPUT_DEBOUNCE_NS,
> >       PIN_CONFIG_INPUT_ENABLE,
> >       PIN_CONFIG_INPUT_SCHMITT,
> >       PIN_CONFIG_INPUT_SCHMITT_ENABLE,
>
> Should this grow a mutual exclusion check in parse_fw_cfg()?
> Part of me says yes for consistency, but also as this is a new property
> that's going to have had exclusion in the binding from the start part of
> me says that it is unnecessary to add that.

Given that it already has a mutual exclusivity where it matters
most (in the bindings) I feel it's unnecessary. The only beneficials
would be out-of-tree users and I actively don't care about these
people.

Yours,
Linus Walleij

