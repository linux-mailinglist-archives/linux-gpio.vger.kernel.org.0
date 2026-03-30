Return-Path: <linux-gpio+bounces-34408-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WK2NHM08ymnD6gUAu9opvQ
	(envelope-from <linux-gpio+bounces-34408-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 11:05:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EE0357BEF
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 11:05:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29248305543D
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 08:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D67223AE71D;
	Mon, 30 Mar 2026 08:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EE8bvf5e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F423ACF12
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 08:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774860588; cv=none; b=m6wplRLIBX1itUu8nieYh4uasvKwXTI7T0AQp4Tg3Hbn1vuXRi/XiyQ+3Qvkg0j18aTFPP3vHGXnSBgT5LaUfjr2HcxzBVa7Cry7Ck00ljzz9wAAVb5c/23W/zwRCjQKXf2ryKouu3TAfN91MD+77fIQGaWlciAgrB0XIA+Srs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774860588; c=relaxed/simple;
	bh=VkEU5A2AgwGQWs8eHe92ZbsphMa22TCirwHHkTi3HMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q/xhaUL1MtyuXGoatEa80XgYn4PnXSUO0+gkuYvcjh36IS/v9vL6S/hysUDnJBQmMuVGU5Ek0Lv2tbtj7R6Rw/Av8kOiGTZdVlWpxkPNxSiso55lBkweAObTC9MYo4Xbz3Ij/FfoVk5vBoGCSHsQnOBNUxlWc3DeAKoRtrt54fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EE8bvf5e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51AB3C2BCB4
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 08:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774860588;
	bh=VkEU5A2AgwGQWs8eHe92ZbsphMa22TCirwHHkTi3HMY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EE8bvf5etsojKop8tgT4LImqHzS9O7Z6KA58vgj7e0WnD9rIHICpwC16kP1epAOzf
	 7o6uekK9fl64e1SW4dUzRmvcR8rh7a/WRO2LsENmbiH/Gb+uOWDzN/+lMyxc6IoiWA
	 xVrZe+p7vbe6eaV3cQjGZZkZStkIdrbB7yEQeZ+ZUhD3+sLHssgBgD4KZY8ILUjovP
	 wKqbcybdI+7v6NwyV8tVs94YXlLFgT0TA464xvvgvjQ75brAomBGohxcWM0aE/Bbvr
	 f/RwWO6W7OAGxODtAPTm8JXQOZMEMA7U7cEeiklottygNZ4R0jvZuHjvHBclhUGZ8b
	 q0Sw7/m5nIkmQ==
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6501cbb52e5so1020190d50.2
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 01:49:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUUdspIAb/HimcACvd/vyg9P97f7iwqhJ1ynqbNDo1wIyBNW85ZEImMPmfs+IbzjDQl/zgDEsmxd3B/@vger.kernel.org
X-Gm-Message-State: AOJu0Yyds7RVpK38zBHayj/P2RBe7yR4mm7JzVrcYtuN9kZkLGF9D7QL
	sLi2u5D44im5Fp6WBjg7B7Ig0NO4zlTRV1U9BaZuznlAnRGoN3j38lG/2QFhJcrPrCDKGjSj9x/
	o6YZyYJmbSuRJezC+ECME3fcfvhikZ/k=
X-Received: by 2002:a05:690c:6987:b0:79f:5904:767c with SMTP id
 00721157ae682-79f5904b4e4mr17769617b3.32.1774860587673; Mon, 30 Mar 2026
 01:49:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330-ipq5210_tlmm-v4-0-b7c40c5429e5@oss.qualcomm.com>
 <20260330-ipq5210_tlmm-v4-2-b7c40c5429e5@oss.qualcomm.com> <CAD++jLnwqDgKJMEBomgGSt-Mo90Tp0Or0EdRx3MkhM9D9dj=4g@mail.gmail.com>
In-Reply-To: <CAD++jLnwqDgKJMEBomgGSt-Mo90Tp0Or0EdRx3MkhM9D9dj=4g@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 30 Mar 2026 10:49:34 +0200
X-Gmail-Original-Message-ID: <CAD++jLkp0AfxUqAHzjJjS8k_NcbHyT4qy=yPhUwbvAYXcAhdZw@mail.gmail.com>
X-Gm-Features: AQROBzAzjgsJXtzzckPvMexnFxUBrHGwtgkJ6r1bGI8qK7mzqwjJXkr7sB8Jyc0
Message-ID: <CAD++jLkp0AfxUqAHzjJjS8k_NcbHyT4qy=yPhUwbvAYXcAhdZw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] pinctrl: qcom: Introduce IPQ5210 TLMM driver
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34408-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 21EE0357BEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 10:45=E2=80=AFAM Linus Walleij <linusw@kernel.org> =
wrote:
> right before merging this patch I merged:
> https://lore.kernel.org/linux-gpio/20260327171240.3222755-2-mukesh.ojha@o=
ss.qualcomm.com/
>
> On Mon, Mar 30, 2026 at 6:51=E2=80=AFAM Kathiravan Thirumoorthy
> <kathiravan.thirumoorthy@oss.qualcomm.com> wrote:
>
> > +               .intr_status_reg =3D 0xc + REG_SIZE * id,              =
 \
> > +               .intr_target_reg =3D 0x8 + REG_SIZE * id,              =
 \
> (...)
>
> Should intr_target_reg be dropped also from this driver?
>
> If so, please send a follow-up patch.

After reading closer I can see it definitely should be dropped
so I just augmented the patch.

No need to do anything.

Yours,
Linus Walleij

