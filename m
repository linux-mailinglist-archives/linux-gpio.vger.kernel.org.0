Return-Path: <linux-gpio+bounces-36356-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0A0WEUZU/GlOOAAAu9opvQ
	(envelope-from <linux-gpio+bounces-36356-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 10:58:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 160F14E557F
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 10:58:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DCDCE30349CA
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 08:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A57C3B19B1;
	Thu,  7 May 2026 08:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aCPXBpDu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07712390C9F
	for <linux-gpio@vger.kernel.org>; Thu,  7 May 2026 08:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778144093; cv=none; b=rOBer1itP+KmMFtWgjMznlyg4SKPGnmm5ADLfMKJinxpb+vNHZ4EkpzHrwWeQ94k3ObbpIkwsh1fAWul0C+mgBWAtg53BtpsgJwUntsMHovr1g81WkBfRf0elSsLbNbuLorOva3RY5w954wKzzVoHKSRVkfsse+Xu+1pcRVqhIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778144093; c=relaxed/simple;
	bh=BrL78b1MxmxQ4D0ksLqHA+jXGvum5WGSkmEeknCXCis=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m/YaeahAWEGxB2GGWBCEC2VY+ANwLFvMOhr7Jvzp3NGB2LPQE+2rFx0Cf1a1WruUBbNWqlZQGZ9ZPpJgEH1FpLupHuaBBgdznau/W0SWd9DNwPgDmjK3V5JkL/npWRA7gagDaPEGrK9fPrjkal9UHSMAmUg+4wQNJs2ci5VFg0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aCPXBpDu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73261C2BCB2
	for <linux-gpio@vger.kernel.org>; Thu,  7 May 2026 08:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778144090;
	bh=BrL78b1MxmxQ4D0ksLqHA+jXGvum5WGSkmEeknCXCis=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aCPXBpDurgJCGgOF64rzcGiXLeSksOaVkKXDDhXanKr7Jrysycf4CcVu3oyodv0hM
	 R85Wq2H8z3osSP1Ow3y+GdBiueBhaweYDi59kp1Ec6vVznyjMz8GKkBSV4T8/5uBlj
	 9i3zP4M3xkD8FJhOwfGGPIyg+vHYS/kJEDfeM6GimVoyCWpl8nxg8HK1ojIaOEGpOk
	 eoCT3V2iEwPM9MaklDuBBk1b7lBWU0YmB7jYPIU1S+ME0vbGceG8qRceDSUH0pEduj
	 ZjfcCdjF3r7zldLV7CKTHJsk0S0ArtuImZN8chhuHJxz89thkn+xO745GGyTL0574H
	 bWKX5pg/4bnsg==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a40cfab24dso614589e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 07 May 2026 01:54:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9eCcYD1/TDeB0bKY9lcDHwCH540MNk4pSboH21ebZQo9JqM/PVkrCTfl/J0iQwj+CB+N2nHVMPSP2U@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8PIH/iWxasNJToabedSg1JFLXTxZoaaSllYRiB2e0zokAmA7E
	r7qRvoz/OPXjAg/KJWSz7affXyijs6sRdF48VbBJBTUUWuA+fWEPduv2n5DT1fekATeV2FLsDCt
	gfHljPulmk6hkzCAIzPRycQyzDHO5BPU=
X-Received: by 2002:a05:6512:1314:b0:5a8:7bdb:92c0 with SMTP id
 2adb3069b0e04-5a887ce5fd3mr2499558e87.29.1778144089163; Thu, 07 May 2026
 01:54:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAMcf8C_A9dJ_v4QRKtb9eGNOpJ7BZNOGsFP4i2WFOZxOVBPnQ@mail.gmail.com>
 <CAD++jLn9DpaknOm3S9ZUOY6Jyo=SuhVSv-vzNaw=S1uuOeYoRg@mail.gmail.com>
 <87lddyx7gg.ffs@tglx> <CAMhs-H_FnFGg1LDM2UWCUWC423udcm0dKOaDYJxMae2JdQh5wg@mail.gmail.com>
 <CAAMcf8AdoTsT33W4-HF8VKGDzo0j7nTKGY3f44DDsNCWo1ARZg@mail.gmail.com>
 <CAMhs-H-SM1uhoqQVLU+gmM+ZEYGv=dS8-x-1QJ9kND0dc-JAAQ@mail.gmail.com>
 <CAAMcf8BJkidsyuFQwsuO5A8iujXVgM=NkHka0eD4es4X4uUCfg@mail.gmail.com> <CAMhs-H9+BfWWpaEP6UCpQvcSSzphGPre2GB0CeLfoPn9ePVwuA@mail.gmail.com>
In-Reply-To: <CAMhs-H9+BfWWpaEP6UCpQvcSSzphGPre2GB0CeLfoPn9ePVwuA@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 7 May 2026 10:54:37 +0200
X-Gmail-Original-Message-ID: <CAD++jL=UZ1_eSf5rpef4vaAdSHGjwsctPsa+UCLH6U3YPL+XJA@mail.gmail.com>
X-Gm-Features: AVHnY4JamNjQqU_iG9_tQzde4nTuuqPyOTAFMIgw41_KsHuQD4DjBEUx7-YgBx8
Message-ID: <CAD++jL=UZ1_eSf5rpef4vaAdSHGjwsctPsa+UCLH6U3YPL+XJA@mail.gmail.com>
Subject: Re: gpio-mt7621 unroutable IRQs to bank0
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Vicente Bergas <vicencb@gmail.com>, Thomas Gleixner <tglx@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Grant Likely <grant.likely@secretlab.ca>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 160F14E557F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,secretlab.ca,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36356-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Thu, May 7, 2026 at 6:06=E2=80=AFAM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:

> Linus, Bartosz, any advice regarding this?

I sent the advice to try to use an external irqdomain already?

Yours,
Linus Walleij

