Return-Path: <linux-gpio+bounces-37554-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPRWD1uiFmqBnwcAu9opvQ
	(envelope-from <linux-gpio+bounces-37554-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 09:50:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 916805E0A18
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 09:50:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27F9C300A60F
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 07:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A05B13CCFB2;
	Wed, 27 May 2026 07:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ShOOyjzj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7333CCFB4
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 07:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779868248; cv=none; b=WSQdPc9Q8IN0TbRW76+SV+3FeQxiLjlLll2uqYhbZFZ4jY59i/eRxgUUzytNGms8anjrnEubinFkfmpkkn9iDo2zzhWm1YmlGh+n+6i2cs21fq8DeOGMb/Ry4PD5xI56nHTE13pjDnxJtKQ+cj0LqfOaknLOn63MilHniC2UQu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779868248; c=relaxed/simple;
	bh=GvTDQa5MBfPhYPVqBMgesuhjvkhE30Nl7hJWMkmYhWc=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XXaTFia47UOxibcVROYNuI8LfxdiEEbBpTlvfPD4ocTaOskbHM6mYtsWMNc3ipb0dS7ocRHk8ulypa8Z+UCGZjQ/vNsKHpqmKcK844ThzF8l/Vt9XeoT79f43IXY7WEdGTTjkHvorLsTP+be67p4FOB78iSEszsiagkVegiynq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ShOOyjzj; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1017E1F00A3A
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 07:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779868247;
	bh=GvTDQa5MBfPhYPVqBMgesuhjvkhE30Nl7hJWMkmYhWc=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=ShOOyjzjehfB6plfvtpflBm5Jf8A20tHKFlVrv6Qzg8/OnS22telmKzjOLjecJE7V
	 Q0Z7KDS+NIURsQtpR7bAk3C7wg2KZ/R1Xv/blDU6QNXQxz1YfiqPtUAd/7t7VSRarV
	 Yyq7QLUJ8DIFcUAZeqSEbNFa9Mntl8epPtsW/zGVgnZRaYUL0uVSe94ld6Ob7YrpUU
	 ctlFbrBwD1CMKb/QsqZRNFPvM/XlyWUO99ZsJkPxtZB5vsGut9j/XSAoOyVjzh2qO4
	 3IZ77tJUJZz1C8tV2jAbXTxi8oAkkJqg13XOc2VpSfzowY10aRCoKzbWtfB79W3mVg
	 mNquvs38ant3w==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38e7d983f79so4215871fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 00:50:46 -0700 (PDT)
X-Gm-Message-State: AOJu0YzsDFI+NfITwGLCtX3den+U3VssT22C+oFIFvbpzMMdeuik4z8O
	xvneGgT0mEqqiHMqCT1e+A25WepcvdoF92845Y64eZ6Q4MADoLueiZOV9eyLm0UlztRiBG5PiPs
	vJjkCci/7oiVAtQ9IWi7hbccHm4brzmVHkstfzpm+wg==
X-Received: by 2002:a2e:9b4c:0:b0:393:e33d:b713 with SMTP id
 38308e7fff4ca-395d8c79ed3mr53813251fa.10.1779868245485; Wed, 27 May 2026
 00:50:45 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 May 2026 03:50:42 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 May 2026 03:50:42 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAOrEah6eP=K=3Eq6st8CVjAoObgVffPjP-mbz7B-nXPK3VpsOQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522200419.105496-1-vfazio@gmail.com> <20260522200419.105496-3-vfazio@gmail.com>
 <CAMRc=Mfh=NkxE-i88gvfC2X1dMTX_2wXT4G4bvvzOvTxxq7=qA@mail.gmail.com> <CAOrEah6eP=K=3Eq6st8CVjAoObgVffPjP-mbz7B-nXPK3VpsOQ@mail.gmail.com>
Date: Wed, 27 May 2026 03:50:42 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mem7s+eZTHXM78sPzRCiN4ShmGB8KfDyzvYpMCpKK-1BQ@mail.gmail.com>
X-Gm-Features: AVHnY4KqT-xXrpNAolhaoK9HHMGinAnRFe2NZx3UXzP0pG8LFLMItHgDuQP0jr8
Message-ID: <CAMRc=Mem7s+eZTHXM78sPzRCiN4ShmGB8KfDyzvYpMCpKK-1BQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 2/3] bindings: python: support free-threaded CPython
To: Vincent Fazio <vfazio@gmail.com>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37554-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 916805E0A18
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 26 May 2026 19:50:44 +0200, Vincent Fazio <vfazio@gmail.com> said:
> On Tue, May 26, 2026 at 6:07=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.=
org> wrote:
>>
>> > +The Python bindings, much like the C API they wrap, are not thread-sa=
fe and do
>> > +require external synchronization by the caller to serialize access to=
 objects
>> > +shared across threads.
>>
>> Do we need to document which classes and methods need synchronization?
>
> This seems fair. I already did some of that documentation in the threaded=
 unit
> test so I can copy some of that into the docs API consumers actually read=
.
>
> I'll fixup this patch unless you want other fixes folded into the series.
>

No, I don't think there are any other issues I noticed. Thanks!

Bart

