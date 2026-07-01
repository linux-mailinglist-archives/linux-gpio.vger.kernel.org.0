Return-Path: <linux-gpio+bounces-39267-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IIMvAFW+RGox0AoAu9opvQ
	(envelope-from <linux-gpio+bounces-39267-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 09:14:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4700E6EA8A0
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 09:14:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=kaMfAdsh;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39267-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39267-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21D5830262D1
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 07:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5E183B19B5;
	Wed,  1 Jul 2026 07:13:42 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E2C3955C0
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 07:13:41 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782890022; cv=pass; b=hCbrkqYuWObpA9k9X+xDNuyUDazJUXgacHIUfAWVHFsy0QiZ+KYPfG5F7SDgZR2kZAxs9CS4ECwmVbVEdaRQh2YA4k8xUlz+d0GGVF96ULHduFPW9lj9eIfGohR3+tnFNOJtPgncdsDVNFPFZaXi3EQT7MbQjsLDHWwTN5EO62g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782890022; c=relaxed/simple;
	bh=n447xYHfc/JrFL7zkDSYKJsGsTY0OkVvMjdrq9hk0NI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FgTd0O72EfJNziFNAVNvnsF+/qMPCh1In+e8A3XEWSh6XQJWdOjYbHVEuP/qZSPE7xQKW+0xZHepaOBcntt1PofKU0bzs6hWU0/Ktn288Ad5pxxucw798gC5sHGuu4VvI3hqTZ7WaqpnVqb6eND9me1JT262Di52Q2ViEJY/upA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kaMfAdsh; arc=pass smtp.client-ip=74.125.82.46
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-13981833e13so364346c88.1
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jul 2026 00:13:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782890020; cv=none;
        d=google.com; s=arc-20260327;
        b=gwfCk6DxCpMzuA1IgrsAHAxZxqW5ZbH+HHwx+VCuco3l3LNsFEhr4ijeUnytJtWQni
         oXYBTUO+n3PNj3mD2lE1+SGay3Zz+LLYfcPkQ5qt/LGM5kVFEpbZECzYsLQuMmKDfR+5
         4IxYs93m+u+yFiH47SzTzjLRKU4ogc/T+SwVlLTWh28/6J5uQorxdZdBketVIhQB9KTF
         86hg5ULgaZI0z8hBPoSE9kdpGOT+U0bRDYsj11/VonA2Kp2ij/RSiGFUK9RDLC9aN1lL
         MKhwBcaf0pkGxoqbelq/jO9ii7knr9D57oic05ZwQZ2lI93BaLaW1PleS0YE/2HWEubR
         CXFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V1t5ekxixnVh/2pKDUFP6F4cemg/38xyLYn/kE3Iuv8=;
        fh=dubZwCkUnm1YdSmNrlsR2Hvd4L/6Gltz9YTBbsgCAR8=;
        b=jA0YsOX2xK7uXkA1BGFwO9u4urLgOTykio27H0ex5rB93/eH0u+tuq8UFu1MJNZUVj
         aJ/eTtQkeD7tquQ1xEOVuyR7OTC4LYzV6pwJBifzrY0WzKs9lmlaekIJGqGIIH/44qBS
         +lRFAE50g6keiW9shkjBhJMoQLVBTtXlvriZVSQU8GNloRC3/T0l8kdavtRujJGhmST2
         o6JMtM7M3Sye4VETd96u5g5oDR/jVTl2K855Lv1bpNL6eYl8CuzKov6XgbtApGB5IPzC
         JKI/x6ZJ5zVOrOfcnCwx0SA+p2QQASmlfIfOw43JVGy9gkIvqTAjbvl4bzsYd5wYooz4
         WgTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782890020; x=1783494820; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V1t5ekxixnVh/2pKDUFP6F4cemg/38xyLYn/kE3Iuv8=;
        b=kaMfAdshkIg7X66cBeVEZOA5U8l5Q3jEoXipleHDRVC0WMzoy9+rJLkPs6cuG6Cg9D
         c4irOVkNWFg7vnldt9aBzsQ8QlQXX5Uk49ck78SDhdRDZzY3pVS3s7IHevZGYL+6COgh
         GZsJ28gg7XPZx1rT0+Xu+Vz7x1KtxYw5EfupNY0UxYiFOcPPFBLSP6+x6pKbOeko64ni
         JNCoYBqJtcY+o0xeN3JYYTKEYlIDY2lY7aZwIcAmRjsrV6MVoV1owwSVnAgEaUyzFv9b
         jCcB2CMJJ/+0WY1xKeQP/WLGYzICGUlWu0fc4ivcS8hO3ZF3orif6UQ+vwWB8dpXKc/y
         68TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782890020; x=1783494820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V1t5ekxixnVh/2pKDUFP6F4cemg/38xyLYn/kE3Iuv8=;
        b=LX4BTilaWFySqqdNV0oCZfJKG0HCvFCAoKjj/ZWaXpTPKqn41blCksfqj1xnmuSqRI
         6nN4PP7cYf6pfS0DgDSTIOib7NmOl0/G5e1wM9PAhz49a1+3g1+hYh4p1FCHinM3elIu
         +t7hq1rsolqHZfPt1mplPX1VaaNT/RZaLywAX2Y8KaIiQvjBEShrDyrlWYMKcXF5xhnK
         uEzAr/XHjYNruvrxN015jt+wGRGRsgW5YFC9Uan1QAoqCGqONUp/ysNjfUOGgesoGy6I
         ASBJd3qY+wLnKP6W0uBckXwYJzga+aBiho4uPIyVYOZQvJ8Gf5hq5IFn9QXJ4PcKV6nG
         ZRLw==
X-Gm-Message-State: AOJu0YzJHA1+CMOGhGpCCnZJ2XVYfiQUgZgbNOQ21kePmy+L6HTIpqHi
	1Onn3OiJJDn+Cu+lZ0DEAcjPKUeM+Jviv8X0EA3zMp4M+Q7R0s5sGztyE8pehnPmcDg0gHGIXUG
	3B84t1VuAR7tjwSHwZ3SixZc1FJzOGzk=
X-Gm-Gg: AfdE7ckdUMjAl4fWCtJEaIVtb9T9KpaufluFYqKsxo9aAqjznHuFgPTDnzX0NulEsnF
	78jYSRE3FaSAjY/dr1z13ljVhBn6M1tamc/z43A+EtY7tsrq8ZOUUocO4womp5T6a72DNmdyIx7
	ms1eu9vMBpiorZHVRwmXo59PJz/aNOk0JCwjR3TGupAwZvMbU2vpRIshoc52sE+FS8zc3rwQCet
	Q5KqK4oQDYMyyrSxsKLuKIhvDb9yIM1F1NpzPsl3ghJJgsoMso2zegkDPWoDuTs/jbhFg==
X-Received: by 2002:a05:7022:ebc8:b0:139:ed5d:7560 with SMTP id
 a92af1059eb24-13b36df91a2mr507202c88.39.1782890020332; Wed, 01 Jul 2026
 00:13:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626060112.2498324-1-sergio.paracuellos@gmail.com>
 <178283020836.36519.12213594335592775087.b4-ty@oss.qualcomm.com>
 <CAMhs-H8qy9XiYEOjcPPsH4ztejfo0=7_ZSNkvKEFfYNjd7w36w@mail.gmail.com> <CAMRc=Mer12rKJ7r38yoqyw=UQLCp8fo6gV6_D_aU531h_0OeDw@mail.gmail.com>
In-Reply-To: <CAMRc=Mer12rKJ7r38yoqyw=UQLCp8fo6gV6_D_aU531h_0OeDw@mail.gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Wed, 1 Jul 2026 09:13:28 +0200
X-Gm-Features: AVVi8Cccg7DGtc6kgF0swFAGNj_6eiWCMYG1LUmHuChsxm0Tyg4fXPEPiPQ469o
Message-ID: <CAMhs-H_5vQ5fMZukgeSSgVN6dzNTYRzneQwphD5J-abozUGUVA@mail.gmail.com>
Subject: Re: (subset) [PATCH v2 0/4] gpio: mt7621: address Sashiko complains
 and other cleanups
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linusw@kernel.org, vicencb@gmail.com, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39267-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linusw@kernel.org,m:vicencb@gmail.com,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[sergioparacuellos@gmail.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sergioparacuellos@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4700E6EA8A0

On Wed, Jul 1, 2026 at 9:04=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.org=
> wrote:
>
> On Tue, 30 Jun 2026 19:33:43 +0200, Sergio Paracuellos
> <sergio.paracuellos@gmail.com> said:
> > On Tue, Jun 30, 2026 at 4:37=E2=80=AFPM Bartosz Golaszewski
> > <bartosz.golaszewski@oss.qualcomm.com> wrote:
> >>
> >>
> >> On Fri, 26 Jun 2026 08:01:08 +0200, Sergio Paracuellos wrote:
> >> > This patchset covers some sashiko complains reported at some point w=
hen IRQ
> >> > mapping was being fixed for this driver [0].
> >> >
> >> > I have included 'Fixes' tag and CC to stable for patches 13 since pa=
tch 4 is
> >> > just a cleanup for naming.
> >> >
> >> > Thanks in advance for your time.
> >> >
> >> > [...]
> >>
> >> Applied, thanks!
> >>
> >> [1/4] gpio: mt7621: avoid corruption of shared interrupt trigger state
> >>       https://git.kernel.org/brgl/c/1781172526d1092323af443fa03f00e6de=
560401
> >> [2/4] gpio: mt7621: more robust management of IRQ domain teardown
> >>       https://git.kernel.org/brgl/c/839738536adabae1a7e98ed3fc332ce9cc=
991d27
> >> [3/4] gpio: mt7621: be sure IRQ domain is created before exposing GPIO=
 chips
> >>       https://git.kernel.org/brgl/c/0e024f58291dfcb28d98c512002e1a80fa=
d69798
> >>
> >> Best regards,
> >
> > Thanks! What about PATCH 4? Are you planning to apply afterwards or
> > should I just forget about it?
> >
> > Best regards,
> >     Sergio Paracuellos
> >> --
> >> Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >
>
> It's not a fix and it seems to depend on the three above. Once these thre=
e are
> upstream, I'll pull a mainline tag and apply 4/4. No worries.

Thanks a lot for letting me know.

Best regards,
     Sergio Paracuellos
>
> Bartosz

