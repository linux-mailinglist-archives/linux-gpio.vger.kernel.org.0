Return-Path: <linux-gpio+bounces-31067-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFonM6NRd2lQeAEAu9opvQ
	(envelope-from <linux-gpio+bounces-31067-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 12:36:03 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF4F87B0B
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 12:36:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 65F023006038
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 11:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6BE03314D0;
	Mon, 26 Jan 2026 11:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HIMNZ7F6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989641DED57;
	Mon, 26 Jan 2026 11:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769427356; cv=none; b=fhGqRRRr75A8ctCgkO7//GGkpRozPjOWawe34UWjqk6oEtGQtuUWc+IhIO11tSt1ROfuNCwk0dXEqmozhic/hKYG5B2LqaKrwodrpegYhA2mPg2XB8V+SDZb6YANZVpm5wRTIc7G9jpdRjGRC/kL0mStyNipem2cB11rRMEKzGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769427356; c=relaxed/simple;
	bh=NbGMqsjy4HZ45I0jRcU5fEucTTFIYZ76bCkcIOp5DfE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=DAop91xYH5Uo4XL4WVVj4og+b0z6tcscD8cYKXrleNNGZoFq4jwb/uYVHs/0WlC/s7p2mlxcDs7HU4kkXgh99N07XpYSPh2u2g+cGsFq2+86yGE9rl1gTiQO3pqDeflwqvICBi6yycrJhvi5TahbGC4wUNzPt82/t8FfXcR/SFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HIMNZ7F6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A336EC116C6;
	Mon, 26 Jan 2026 11:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769427356;
	bh=NbGMqsjy4HZ45I0jRcU5fEucTTFIYZ76bCkcIOp5DfE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=HIMNZ7F6JaT8MzkjsKdKneVCUyFH72L2/obkiO55FDAz3c9qhFDmFGRmGEKTRQvMJ
	 yZAW6O2h2mkQ5W3MJDn6s9X/K0mVDSSfhrk9NtyMUNmAgmHkNzjhm7avcpd82ehUBl
	 CZmfZYfSoSy6qsTbeLZXbyvC8D/NBWtKgCA3YYxNMXcYN+3VyxVeNcqX+bb4hzvAOG
	 7UQJV83wILYlF+BfsHIRhJujnFxKnXXjorZGkNIENIrPQmanYOGhqESwr29TDYCnWM
	 yfg3FW1EVnfTNnkPdmuOn4j0p8CiPhc+rqa1+8i+sxyKSeok0qIxeRuIV6tuL0nGAa
	 Q7bhNw3tK3Zpg==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 12:35:51 +0100
Message-Id: <DFYHNBNEFFNC.3V8T0ZGKEDYSJ@kernel.org>
Subject: Re: [PATCH] gpio: omap: do not register driver in probe()
Cc: <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <broonie@kernel.org>,
 <will@kernel.org>, <grygorii.strashko@ti.com>, <ssantosh@kernel.org>,
 <khilman@kernel.org>, <linusw@kernel.org>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>
To: "Bartosz Golaszewski" <brgl@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260123133614.72586-1-dakr@kernel.org>
 <DFW0HVK6AF0G.TW6R157R8O27@kernel.org>
 <CAMRc=MctBqEcoDOG6BGtd=ri-c9X9awnfrojtYRVPQfp8EfGdQ@mail.gmail.com>
In-Reply-To: <CAMRc=MctBqEcoDOG6BGtd=ri-c9X9awnfrojtYRVPQfp8EfGdQ@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31067-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DFF4F87B0B
X-Rspamd-Action: no action

On Mon Jan 26, 2026 at 10:06 AM CET, Bartosz Golaszewski wrote:
> On Fri, Jan 23, 2026 at 2:44=E2=80=AFPM Danilo Krummrich <dakr@kernel.org=
> wrote:
>>
>> On Fri Jan 23, 2026 at 2:31 PM CET, Danilo Krummrich wrote:
>> > However, for the purpose of avoiding the described potential deadlock =
in
>> > combination with commit dc23806a7c47 ("driver core: enforce device_loc=
k for
>> > driver_match_device()"), this patch only addresses the driver registra=
tion
>> > issue.
>>
>> I.e. unless there are any concerns, I'd like to take this one through th=
e
>> driver-core tree.
>
> It looks good to me, but it's a GPIO driver, this can go together with
> GPIO fixes for v6.19-rc8 as usual.

Commit [1] reveals the issue and was originally scheduled for a driver-core
fixes PR, so it made sense for this patch to go together with [1]. However,=
 I
told Linus [2] that I will hold back [1] for now and send it with the -rc1 =
PR to
give it some more time in linux-next.

So, if you can take this patch for -rc8, that'd be great.

Thanks,
Danilo

[1] dc23806a7c47 ("driver core: enforce device_lock for driver_match_device=
()")
[2] https://lore.kernel.org/driver-core/DFWVL46MM928.V9LOBRWI8BLZ@kernel.or=
g/

