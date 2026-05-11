Return-Path: <linux-gpio+bounces-36523-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLdwAIu1AWr2igEAu9opvQ
	(envelope-from <linux-gpio+bounces-36523-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 12:55:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5525350C4FC
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 12:55:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94D0730584B0
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 10:48:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 513D53DA5C1;
	Mon, 11 May 2026 10:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IN+Ad1UD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139443D9042
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 10:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778496517; cv=none; b=g5uvlKpGSEpAJw4wEQLRKkR7xfP1u1IYjm8pK9VUBv0EEfnFw+da5KRMRXRLpc557EZtYhRMtY4pcobSzZqEXLNaIUj7DhQ241qvmLkFnOvaMH+zzTfn+7gXjWg4T8n00mMoP5TLVLpTTkGcViYhUuihwkfAfk6iB1MxW6nqx0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778496517; c=relaxed/simple;
	bh=A8Td6TlDzJEWR1jqngdKvSLINzNZ3gyx/t5LGV07KpM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XWDQdL4vmKLJ1QgWszT+7AW0bvRhMLf65gA7QlaEgEYwQQ1lnYTJe/gltBiMgYQdIttdxzgCBcGOhmos1oFzBCfSAd58UZBtIw3od64JC37PHees3iiptyUdLvn4eavYGWRYDcZNTF2J8TWsMhsqxXByJO7tfanvbG/ftdzH5dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IN+Ad1UD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4200C2BCFD
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 10:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778496516;
	bh=A8Td6TlDzJEWR1jqngdKvSLINzNZ3gyx/t5LGV07KpM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IN+Ad1UDZH7A8g5qQcq4c4IwgckXJ04429l9jDSXm9FE3MWtZi/dgw4SCzTC/d9Gn
	 wWEsh4qiZGNlwhSDsc2dGji8iLlA5LA6gc2V1bm5taR5ssJ7woZCCwFai8AravhoX+
	 SZ/Hr5J72NKB7fb2avr8LcoobURMoCV0npHTKZeUXGXc3mJHoBQghEBa4ifVCeevHY
	 507QUEw/c/V6uOz0igH50OtzEImcSoKpmdv1C3ZBwzQ014XDrLSifPsy+JdIBqHjBb
	 ra6/pThRTPKOBKs4lKpwPURcjrtCo1eI/uV4STrcRDuXYLHYFBOk0L8TBckJUy0xr+
	 w8y4QQTGxktlQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a74ac8b40aso3757685e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 03:48:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+zPpaWQf/74xfT/LqoBoNJZu8kuE0YLI+I6JiVB+utDURBq9nXKjTnuPHGGeoxtVp7tnCgWpRd3p7+@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+XXYtdbXUNyNudHe2teOMx5RC547VE1Dj4+alyF602Zqi1hDX
	D1ttE03BbFOLG/CF+blO+C27D10JvTwfgT9XYsSviCHpoCorOHozGnBAay3SkPwzGVgUXz7/+eA
	jg+QX7+T81pUMF/at7+doQGfYfxVkws5WomUa7j7rZw==
X-Received: by 2002:a05:6512:3a88:b0:5a7:470c:daed with SMTP id
 2adb3069b0e04-5a8b6ca6e5bmr3605371e87.16.1778496515174; Mon, 11 May 2026
 03:48:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <afiNrr4Llm0LWw-5@ninjato> <20260509091208.18346-1-jie.i.li@nokia.com>
 <20260509091208.18346-3-jie.i.li@nokia.com> <af8IB46ST70lXVsk@shikoro>
 <CAO3NRJg3wPVLgnyd=eD=TkkS5J24ww9WP3nNuiCnCL8=aLEmwQ@mail.gmail.com>
 <CAD++jLmcFEcHoCWq_4=7so5gV5Usj45n6qOYj8xrfsgAYufkEw@mail.gmail.com>
 <CAMRc=MdGd-6vUabTd5aJpjMbxRT3Mo8YH_jVyZzGLPyFsvce5w@mail.gmail.com> <agGwa7ejgQJb_tyr@ninjato>
In-Reply-To: <agGwa7ejgQJb_tyr@ninjato>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 11 May 2026 12:48:22 +0200
X-Gmail-Original-Message-ID: <CAMRc=MfMcEbQ3kkW3fMn-jzDoT2xdJWjp2xVBVsu7n683_5g9A@mail.gmail.com>
X-Gm-Features: AVHnY4Ihx3Rr57Cp2E0exnGlpeKgAxFvr_XKU04Q8mIIwWTNXsD6aYKIkDfqx7c
Message-ID: <CAMRc=MfMcEbQ3kkW3fMn-jzDoT2xdJWjp2xVBVsu7n683_5g9A@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] i2c: core: support recovery for single-ended GPIOs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linus Walleij <linusw@kernel.org>, =?UTF-8?B?5p2O5p2w?= <lj29312931@gmail.com>, 
	wsa@kernel.org, linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jie Li <jie.i.li@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 5525350C4FC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,nokia.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-36523-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 12:33=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > Am I missing something? Why does this need to go through the GPIO tree
> > if it doesn't seem to touch any GPIO file?
>
> The new function this patch uses is only introduced in patch 1/2 (at
> least it is not in -next as of today).
>

You mean this one:
https://lore.kernel.org/all/20260509091208.18346-2-jie.i.li@nokia.com/

? Why do I have to look for it on lore?

It would have helped if I had been Cc'ed on this from the start, it's
the first time I'm seeing this. :/

Please combine the two series in a way that makes sense and resend it
with my address in Cc as per the MAINTAINERS file.

Thanks,
Bartosz

