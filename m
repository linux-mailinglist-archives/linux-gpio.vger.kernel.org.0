Return-Path: <linux-gpio+bounces-32906-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCgmAc7mr2nkdAIAu9opvQ
	(envelope-from <linux-gpio+bounces-32906-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 10:39:26 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FE4248A5B
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 10:39:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22E723276D2C
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 09:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4DB544103D;
	Tue, 10 Mar 2026 09:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MX18Ydfp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9302A43E9D2
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 09:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773135055; cv=none; b=cAZtJ6Jqnw8WiLvC1Qirk0jpY1swA3yAHe+awPx1CSFT6WzriKy6sQUiMXe6XHuLtBht48MhykmTABy41EW4uZ3yd3lC6PlFFRVBkiO6ZZbaVg1WKog8+2+58QdSo0a0fcooyio/GBZ1d+LfaXn55bXfGZBRRsIGs0n0p3e0ge8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773135055; c=relaxed/simple;
	bh=agiCRx0LS/bfEJl/CwuVWUUNv8yCzJiBoPST+kfXouk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lzUbv6sRNoQDIx5/GhPezSjQ62pkqxQUxYtK0yVARwbHBuijOyQ/jszlDuUnBqceONgLJ6QW9bepKAX0k2Mma68eoxmIon+wHRDfcoQeXOzSCnf1GgGr1kdM1QZ5eLpdYqRWK72sELJ7NdaHQxZQCQGqtjZBrorxxFSEdFFnl9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MX18Ydfp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D461C2BCB7
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 09:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773135055;
	bh=agiCRx0LS/bfEJl/CwuVWUUNv8yCzJiBoPST+kfXouk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MX18Ydfp7DvcWWdKTSqMxo/9iGz9m+pEYOhYU7+fPSwAa2tamoHRXITRm0QtO3w6a
	 DxIrRIolRzwan1cxqGV997I1tYAltfDYyFivXflV4HcJNPgf/1QXaE9AnLTnNzmFgm
	 SSxyTK5lBj8wnwH1Bizephl0aPQMmA0AZZ3pEH15X4Nn8US6M/VaBvnqFp6LuJmSNu
	 AuQCzG8Iu3O3/8Xl3oQkqWygRt173/hkvifMAsXSTHihH24RJU7F2Is3C408fZGCdx
	 BHk2dwRljMolc7TIwzJc0YJnTRYkBX9tDz2FSd9tFOONf5YawZFY5Ocqg89/9Xp7gi
	 8CS2++qr9if3Q==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-78fc4425b6bso126244847b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 02:30:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUaQ6flTbwpSuvY3//EyaCq304CowLufVcpcrB9lI3crWtLpRLSbVAneM5SMCzUahLrk6kofqOEfBq2@vger.kernel.org
X-Gm-Message-State: AOJu0YxyCiwO/QF3ar3AimA14NaOCOBcM3HZhBwT2yJ6xkxNrs60DAyS
	Ti0+0fa+xiIZfSgZaIfD4zOXg7xC1bZgEq2U+X6ZIJo3Gdg8xkxAwExOsQYFixVhl73/zj9eR33
	+RVt0dVC2mvgaANQkj6W4/qlMs/Z3es4=
X-Received: by 2002:a05:690c:6d81:b0:797:afeb:de93 with SMTP id
 00721157ae682-798dd672745mr141065777b3.12.1773135054620; Tue, 10 Mar 2026
 02:30:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306075244.1170399-1-eleanor.lin@realtek.com>
In-Reply-To: <20260306075244.1170399-1-eleanor.lin@realtek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 10 Mar 2026 10:30:43 +0100
X-Gmail-Original-Message-ID: <CAD++jLnwhtf5Xc3JGoFB=4usGHk+0YqoZn8uE-jkspgkg58VCg@mail.gmail.com>
X-Gm-Features: AaiRm52eP1yr7ANILgx2XyXkmjF2STcxuzgrGYJxJFGEnHNkuVbhE64J6uxuaQE
Message-ID: <CAD++jLnwhtf5Xc3JGoFB=4usGHk+0YqoZn8uE-jkspgkg58VCg@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] pinctrl: realtek: Core improvements and RTD1625 support
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	bartosz.golaszewski@oss.qualcomm.com, afaerber@suse.com, 
	james.tai@realtek.com, cy.huang@realtek.com, stanley_chang@realtek.com, 
	tychang@realtek.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 55FE4248A5B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32906-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,realtek.com:email]
X-Rspamd-Action: no action

Hi Yu-Chun,

On Fri, Mar 6, 2026 at 8:52=E2=80=AFAM Yu-Chun Lin <eleanor.lin@realtek.com=
> wrote:


> Yu-Chun Lin (14):
>   pinctrl: realtek: cleanup license string
>   pinctrl: realtek: Fix return value and silence log for unsupported
>     configs
>   pinctrl: realtek: Switch to use devm functions
>   pinctrl: realtek: Simplify error handling with dev_err_probe()
>   pinctrl: realtek: Fix grammar in error messages
>   pinctrl: realtek: support system suspend and resume

I applied these 6 uncontroversial patches to the pinctrl tree, so you
can rebase on my "devel" branch in the pinctrl git tree as soon as I
push out the changes and just resend the rest of the
patches.

Yours,
Linus Walleij

