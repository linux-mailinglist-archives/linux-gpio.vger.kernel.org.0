Return-Path: <linux-gpio+bounces-39266-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id q8C8Gni9RGrHzwoAu9opvQ
	(envelope-from <linux-gpio+bounces-39266-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 09:10:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A70C6EA81C
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 09:10:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Ct5RjAAf;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39266-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39266-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2520A30247E8
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 07:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11C9E3B42F9;
	Wed,  1 Jul 2026 07:04:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C993B42DA
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 07:04:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782889486; cv=none; b=Iy1l7P6shN2DPbAJ8u9k5DCnQit4A0X6Ne1SMtZvjvYmL27dqwlsC7DUzZq2Kq4bjd11GPJdGDC+0Qg1PF4qnUgmMaXuhHvmzlpTCoxINaHisO/duMq8N/P06QxkqD7WW/s1/mIasIbWBTJjIHDzxg6IO/1ebnKaw7thvrYH3Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782889486; c=relaxed/simple;
	bh=jgE4Iyea4j+j1O37T++OxjSWJuPQFpZ3zqvXZpxefcM=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P5c1VTr02MDn0t3nBDojHNS95JikililHImxX+/ySbYXzSdMeHDQo+UFeKN33scJvuiZ22OSG356ggaDbcpD55NOI5UOG2G8IzMe7g3nLFrMCzx9dPiKpY2dJUZjKvvojiSigDAjJAxlNEJs/QyCYCjttzTmzHbsQXkFwk/DjfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ct5RjAAf; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA051F000E9
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 07:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782889485;
	bh=nr2RNVTUqY1g9SepTLIyXRFXa3Vf+yVj06LNoJNETpo=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Ct5RjAAfd8klOaBb7CPwPE45qlhwi1w3MZvzxRuJX859Ebwm0JNDBNg4emLs+3S6/
	 lY/pVelyWoXKFhud10o9qi0NzCUMgHWFTgkYGrso8sC/ZqkykTn6Sy38bnL0u1jljd
	 7gk/Bu0G2qvjwAf1OSZK2K/SVFrH3+hHbYIUq/fInmAYL4fZFv3vJ3LJ8Pege1T8uP
	 0WDEzuuNY0J5PXmc0+8Jpw6JXWzkV5ZUigo7i0P5YRjyMVhwTvPO7f3505tTJqf0kf
	 OS2VoYoeZaN2pkUnlcBQ9014h18Fri3s13Kgp1LIrD4cYn4olyUChn6LvOR6E3xPCt
	 7ulNl2U5iVDWg==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39975111d57so1594521fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jul 2026 00:04:45 -0700 (PDT)
X-Gm-Message-State: AOJu0YyyhXLSSA5lYqRB9Hb3yIx6HKY0GwZh/7yUAe9auClxpzMEROR+
	GUh1z7fGLKK7pShmVtn7d9TXZryi1FOY1JL6N4xT81LmSE+pxmdKmYA83YcyUH/XdnCC/35wYPT
	P7l9Q50Jk2RAWRGlvJYWgWOZEtnB2sEQcI+AJK5R8YQ==
X-Received: by 2002:a05:651c:4081:b0:39b:1802:854c with SMTP id
 38308e7fff4ca-39b340ecca4mr417831fa.23.1782889483442; Wed, 01 Jul 2026
 00:04:43 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Jul 2026 02:04:42 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Jul 2026 02:04:42 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAMhs-H8qy9XiYEOjcPPsH4ztejfo0=7_ZSNkvKEFfYNjd7w36w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626060112.2498324-1-sergio.paracuellos@gmail.com>
 <178283020836.36519.12213594335592775087.b4-ty@oss.qualcomm.com> <CAMhs-H8qy9XiYEOjcPPsH4ztejfo0=7_ZSNkvKEFfYNjd7w36w@mail.gmail.com>
Date: Wed, 1 Jul 2026 02:04:42 -0500
X-Gmail-Original-Message-ID: <CAMRc=Mer12rKJ7r38yoqyw=UQLCp8fo6gV6_D_aU531h_0OeDw@mail.gmail.com>
X-Gm-Features: AVVi8CfUq7nb2uoyE6KmzKLl7cCORPA8To-FHZ1JpKb8a1Hd4knQp4Rjbvg8MCI
Message-ID: <CAMRc=Mer12rKJ7r38yoqyw=UQLCp8fo6gV6_D_aU531h_0OeDw@mail.gmail.com>
Subject: Re: (subset) [PATCH v2 0/4] gpio: mt7621: address Sashiko complains
 and other cleanups
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linux-gpio@vger.kernel.org, linusw@kernel.org, brgl@kernel.org, 
	vicencb@gmail.com, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39266-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:email,mail.gmail.com:mid];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sergio.paracuellos@gmail.com,m:linux-gpio@vger.kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:vicencb@gmail.com,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:sergioparacuellos@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8A70C6EA81C

On Tue, 30 Jun 2026 19:33:43 +0200, Sergio Paracuellos
<sergio.paracuellos@gmail.com> said:
> On Tue, Jun 30, 2026 at 4:37=E2=80=AFPM Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com> wrote:
>>
>>
>> On Fri, 26 Jun 2026 08:01:08 +0200, Sergio Paracuellos wrote:
>> > This patchset covers some sashiko complains reported at some point whe=
n IRQ
>> > mapping was being fixed for this driver [0].
>> >
>> > I have included 'Fixes' tag and CC to stable for patches 13 since patc=
h 4 is
>> > just a cleanup for naming.
>> >
>> > Thanks in advance for your time.
>> >
>> > [...]
>>
>> Applied, thanks!
>>
>> [1/4] gpio: mt7621: avoid corruption of shared interrupt trigger state
>>       https://git.kernel.org/brgl/c/1781172526d1092323af443fa03f00e6de56=
0401
>> [2/4] gpio: mt7621: more robust management of IRQ domain teardown
>>       https://git.kernel.org/brgl/c/839738536adabae1a7e98ed3fc332ce9cc99=
1d27
>> [3/4] gpio: mt7621: be sure IRQ domain is created before exposing GPIO c=
hips
>>       https://git.kernel.org/brgl/c/0e024f58291dfcb28d98c512002e1a80fad6=
9798
>>
>> Best regards,
>
> Thanks! What about PATCH 4? Are you planning to apply afterwards or
> should I just forget about it?
>
> Best regards,
>     Sergio Paracuellos
>> --
>> Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>

It's not a fix and it seems to depend on the three above. Once these three =
are
upstream, I'll pull a mainline tag and apply 4/4. No worries.

Bartosz

