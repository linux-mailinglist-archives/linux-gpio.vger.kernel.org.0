Return-Path: <linux-gpio+bounces-37530-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOTJHyl/FWqtWAcAu9opvQ
	(envelope-from <linux-gpio+bounces-37530-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 13:08:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D57065D4ABB
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 13:08:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40FAC300F13F
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 11:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7616B3DDDB8;
	Tue, 26 May 2026 11:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iL0e9wza"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CE63D7D89
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 11:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779793564; cv=none; b=Nf0dIlPj4HPqYrrfl0AH13itIJ3o6UpNeTb0wcw+vlrQ92ZaUUsMCsiG1lXEfM4t3+Xz4IdluncW7MVya0ARqCopuV4Gd9VxHgt/o4nfxdjARYgmNBzXZvCnlkmOc+UflNNgyBmTWFnDdWGCe08GSMq1hNx3d3kmoUJS2R4vPwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779793564; c=relaxed/simple;
	bh=rHzkz5rg4zdxswORcuA4ugqeiq8/c79ctVwKRjjZbLE=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lUz/VGyi7FZhHQslnHGzfATSEZRuZnabZfDbiIeoIPFSZChMdTPSxbntY+gmaJ3kT6xFDccKwqPXlLKDDpgLF6mjT4W0GYPMXIaHIhbpOhe2EFnTTPIRYCbJtV0X367rLzmxQpBDvjTMYU5pHwrtoLBp9M9Pdk9DGLcQ0oFyWtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iL0e9wza; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 005461F000E9
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 11:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779793563;
	bh=pnAcJM5YIw/f5xh24wUpf64P9lmR+cZIn/pJkMy+bHs=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=iL0e9wzaY+g8fwWtYaYm67bQesTP1f+SdU+N1xxkZ9ShPiPzbeezVl4BbjCdJjfaQ
	 N80S2Idlyoab17DFhGOCR34pkXYWJsg/nBCPi4Z3wvSk3tJOi5rysgpRUOno+t+0go
	 Gv4DDR+YA16LbFRsOnK0fBBuC0CaRYWnl7ZWmEoTZ5XDLBdCRRTkhLUTOA69jCpxcK
	 aAOm9KDZgl6i8Fmgaw4idXuyjJtS83b2Zea7rM8c0ATSK1zP8yjA6zbGTF22SSjvv8
	 wF1YEiD7cTgrIY+0IOumZgl3JBYfV5NXx2StEJ1L8Fo+Sd7l3Cft+RsVKF10EohkyF
	 OqNiS1tXeJ6tQ==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38e97e73234so89238851fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 04:06:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8fCQUnaBn77AFAO2w3WcGSEQsoROUYlLZGe5xho3UFd10L86GYpVMtAp4PaouKGpyT6eRkPRODR0n6@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4Nz6Fyc+fmuvZ2TtKOEOSMfLMG9n+CYPeLkiDds0zbmLagxmi
	lfQEnYGTWRj4PHxEAWWvShw/6bQLpM8vRpKU4C8xVZ3bfpfI6Lj5CkV2QmiiDQEs1iVizvIqscl
	ZXLHYiDSurpy65Us6dgmsoja7ptdwsAqrIXnBiXAiXA==
X-Received: by 2002:a05:651c:1512:b0:38c:e16a:439f with SMTP id
 38308e7fff4ca-395d8d91665mr59128371fa.23.1779793561647; Tue, 26 May 2026
 04:06:01 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 26 May 2026 07:05:59 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 26 May 2026 07:05:59 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260522200419.105496-2-vfazio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522200419.105496-1-vfazio@gmail.com> <20260522200419.105496-2-vfazio@gmail.com>
Date: Tue, 26 May 2026 07:05:59 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mdbx79maxLFXOf-=UPe298fin9hqFzdzY7vc59P1Fss-w@mail.gmail.com>
X-Gm-Features: AVHnY4JFkcaaJj4m0J0A2olVD7m6qbm_uffCGiAmPDmsiWPv7iemJlx9rrRpArs
Message-ID: <CAMRc=Mdbx79maxLFXOf-=UPe298fin9hqFzdzY7vc59P1Fss-w@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 1/3] bindings: python: tests: add multi-threaded tests
To: Vincent Fazio <vfazio@gmail.com>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37530-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid];
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
X-Rspamd-Queue-Id: D57065D4ABB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 22 May 2026 22:04:16 +0200, Vincent Fazio <vfazio@gmail.com> said:
> Add new multi-threaded test cases to ensure the bindings operate as
> expected and do not lead to crashes or data corruption.
>

Awesome work, thanks for doing this!

I assume these tests effectively don't test anything in single-threaded python?

> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> ---

...

> +
> +
> +class ThreadedTestCase(TestCase):
> +    NUM_THREADS: ClassVar[int]
> +    ITERATIONS: ClassVar[int]
> +    TIMEOUT: ClassVar[int]
> +
> +    def shortDescription(self) -> None:
> +        return None
> +

Is this needed? Tests seem to work without it.

Overall looks solid, I will queue it shortly.

Bart

