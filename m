Return-Path: <linux-gpio+bounces-39250-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7TPcMS7/Q2oynAoAu9opvQ
	(envelope-from <linux-gpio+bounces-39250-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 19:38:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1AE6E6F7D
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 19:38:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=kSLmbg5C;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39250-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39250-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4EAC53017C28
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 17:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C55913DDDAE;
	Tue, 30 Jun 2026 17:33:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82DB3DDDD0
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 17:33:56 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782840839; cv=pass; b=EHMIiB1Li71BI4sDH05bjqiCFmijjPyEykWZHsaCWDGX3pJRKBnMbXQzvEIKjV5VkDxOiZipmT1wwEzJR6QIeFXT6xUViTGmOxl2eX1Np3t2DXswtfREanxHjp/n2iT1JRvcMfMRuIW7iK4RwRQRg5/4VhwoQTuBT4570+s+W3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782840839; c=relaxed/simple;
	bh=a1+IyxE6SelQN4KsElW/8aBcYki1THU+HxZcl6xJ8zI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uR35PJiAr7VK1p5Fm0Ea4tBhVSnIGZ4lkBQHjgJOCLST7T+5FIds+BTTvwND99oJ5857QgvlmAsAIElQFRXP39Kx8KARUncV+8g8cNyEUll50g6O8gFrkqPuqV/jqJUdOs7bwahF5aU9Y+tb+XFL+OoNMb98av92rOG6QxFRUMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kSLmbg5C; arc=pass smtp.client-ip=74.125.82.48
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1384ebe7a10so8582759c88.1
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 10:33:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782840835; cv=none;
        d=google.com; s=arc-20260327;
        b=Qb+ioeU+0gWlAEjT+LprFQG7/LljfXvOKM1QyheriER/0PmAKyx4/bIWGjOwLXCzEH
         1g0viJbHH266f2fbXhx21kL16CFdeZiGvIqGczccae0oTKsQnpVbLbfXHIg9tcfKeUc3
         r2nrX1zJmCjbz9xpDyNx+m1pQVCiT73RlMORBLsDu4DP2EpiqE/i3JQMMKrtDZ628/s3
         FZMOQP4EU0fdBvkYEn1krZCqMZXfya4JtPOaqysiJgkiSbDqNW/a00kWL0KOzqHsoI6d
         WzWLFAswatxZcL2Di6WVT1o2its/fNPzrRAIFZWn9nLzrJPi7dGmBefZSfqK8w8rHwOz
         N6og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7mntaeVDxS4VMBjyvDf6fkrVcy80Ml+R6llSPn+Yyf4=;
        fh=a1E8ggIxeJsv4N0LIly72kOj/YCK7VG5MvCEqKKetAE=;
        b=OwBTHMg08Yv67w32rQ/VszyRU0Sa/aHNSu1oe+ySG1c0r2bUkY4O5Wy4lm8qw732wF
         aABW8mfjWVM9xVjHap7IVtUl76ES/TyfgW7OSEn5qfpsEWHZhN7+pH6H8n+8ICB3eO1o
         R/9EvbaV3VA1h7kgxO7pvWf8cdpAj4sG4GKKQaUSS9JzI1LpY0TqvBTanHr9KxtTsSyC
         jTwlhLrxZ+sLDSo/Nq3LcxE0ZVZ3xnMCyIdKXW/VePawKMGp3hF3AHm388Wjfc32rJ8F
         vW0cME6j/OYJx4t1SihuVbxKcINpGokjyuK6welGt/79MEodxWawaEk2kda8SS9CWkYU
         cIfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782840835; x=1783445635; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mntaeVDxS4VMBjyvDf6fkrVcy80Ml+R6llSPn+Yyf4=;
        b=kSLmbg5Cai9CkpaNzLpPQt1KVzT0Tz3dXCKVK6ku3jeZq5Hk2/7ggQvpjeLZjPTTJc
         iG5cC7gasPA00qslmDU9fOyk6Oxh55vbW7977m4XhmZFFQFRH8BmZMIvE6hAY84n4iD1
         6NSf0ZKe5reVOSumfgkv0tKiUzJFjQo8B+UUrKUoK7sIP2XUXnPy5/MUcFcgDYksBzk2
         HadFxKoknkASQBM8j+9QE5EondPcD/Xa2t16AYWYhetUps1Fh9BaPbx4uFudELzbsn6S
         4VGuiMR0gQ1Zw1EyVHF8EX8S/N1dZsuLPRL1rL9RkV/fZQ0PK+4x5oak9RRo88R6Gtlb
         YD5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782840835; x=1783445635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7mntaeVDxS4VMBjyvDf6fkrVcy80Ml+R6llSPn+Yyf4=;
        b=cfB2kYFwxS9iXZjtBSvmwEuIQ1DdMwofILuoksO7OH8/CC7X4I5V1vqJ8VrR3G6DoH
         h4xi3oKKjVKNXjcuyBCK2Iu+VoIfkkdFw69kQh4BfiT8Kj7kGhCzWhzw9DYzIbenHtrB
         kkRny0XfEuRrl+/3vQ9yRrVUzEyyJbz/ynugSYKWU7Shq3VQ9AnVtBw8QiUcV7MD4D8O
         xeJ679LGXm371d6UvUssj7gJs1e/QtjWr3MHrZH7nDWlVDj7wEEuU2a07Wh6k8CKs2eH
         6j4Dnv9yrBIj4+vBRw2m/OHM8STgSPj+NToEAgLtkDgZMl31Fun6LWyfdOTI+RAhc80U
         CGHA==
X-Gm-Message-State: AOJu0YxgMayhz+oN856pnyk/ZPDrTAgIiPNwmXOdQQRhlOKOWinGVvQR
	JbBCZwQKdKf15DOVoCfxnwrg5VQjEyhhk14Enu160X34TpGHp0WUyXd+oCh0NRUDnEwYf2U5nre
	y8wJ+FqHkY9LGUhJHj1XzJpaxRE2yIpU=
X-Gm-Gg: AfdE7cl08bU9wAOViLTDnvjRcnEj33KX89FqpwdA44ALOPe6+HRXnBC3Ph8Vt4LbOt/
	KJsxKArAdtB41/kIiVdCx9um11GU4YTjfyhZBywFs9v6dnS0ic8Zmnge4l3I9etR64Oa8kQW/wA
	smVdLIU7VQa122Twzguu6+j0P8p04OwKTLby//0i91BcQ5+9UbiPU7+puTXuOOIPJlyd9va7dNB
	b3nzc26YQCAie3+OnbhafiiYkRfReuKFiEvPOa0sEt+si6fUpeLB3jMivWA4Di1j5LTYg==
X-Received: by 2002:a05:701b:450c:10b0:13b:2d2d:198a with SMTP id
 a92af1059eb24-13b2d2d1a2emr1427179c88.30.1782840835469; Tue, 30 Jun 2026
 10:33:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626060112.2498324-1-sergio.paracuellos@gmail.com> <178283020836.36519.12213594335592775087.b4-ty@oss.qualcomm.com>
In-Reply-To: <178283020836.36519.12213594335592775087.b4-ty@oss.qualcomm.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 30 Jun 2026 19:33:43 +0200
X-Gm-Features: AVVi8CcT-OFGS8AdfyIL3pfUxbFLFqv_V4ELpypaRNrIYn_htSU2yJFN_RzfhXk
Message-ID: <CAMhs-H8qy9XiYEOjcPPsH4ztejfo0=7_ZSNkvKEFfYNjd7w36w@mail.gmail.com>
Subject: Re: (subset) [PATCH v2 0/4] gpio: mt7621: address Sashiko complains
 and other cleanups
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linusw@kernel.org, brgl@kernel.org, 
	vicencb@gmail.com, linux-kernel@vger.kernel.org
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
	TAGGED_FROM(0.00)[bounces-39250-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:linux-gpio@vger.kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:vicencb@gmail.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[sergioparacuellos@gmail.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2A1AE6E6F7D

On Tue, Jun 30, 2026 at 4:37=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
>
> On Fri, 26 Jun 2026 08:01:08 +0200, Sergio Paracuellos wrote:
> > This patchset covers some sashiko complains reported at some point when=
 IRQ
> > mapping was being fixed for this driver [0].
> >
> > I have included 'Fixes' tag and CC to stable for patches 13 since patch=
 4 is
> > just a cleanup for naming.
> >
> > Thanks in advance for your time.
> >
> > [...]
>
> Applied, thanks!
>
> [1/4] gpio: mt7621: avoid corruption of shared interrupt trigger state
>       https://git.kernel.org/brgl/c/1781172526d1092323af443fa03f00e6de560=
401
> [2/4] gpio: mt7621: more robust management of IRQ domain teardown
>       https://git.kernel.org/brgl/c/839738536adabae1a7e98ed3fc332ce9cc991=
d27
> [3/4] gpio: mt7621: be sure IRQ domain is created before exposing GPIO ch=
ips
>       https://git.kernel.org/brgl/c/0e024f58291dfcb28d98c512002e1a80fad69=
798
>
> Best regards,

Thanks! What about PATCH 4? Are you planning to apply afterwards or
should I just forget about it?

Best regards,
    Sergio Paracuellos
> --
> Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

