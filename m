Return-Path: <linux-gpio+bounces-35686-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GElVCHOL8GkRUwEAu9opvQ
	(envelope-from <linux-gpio+bounces-35686-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 12:26:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2333348291E
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 12:26:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1199B3080A44
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 10:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A62E83E4C74;
	Tue, 28 Apr 2026 10:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QQdvSo1G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083D73E5573
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 10:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777371118; cv=none; b=HHKMtuQXpw5AVI25SBMk28m7XM5Lolj7W8QRkJLRlZ9v0ppLpHXQKuJijLxCxCOdmS7Jp9syXrx/NcD5+4Zv8dsR98PH2Tj3lwfrMatLXHpBGBXke9lqaTm6ToPTxKRSr8w9TuA4q8A6haf/U6ky/AhwKcpXFhiTExoRniXg7T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777371118; c=relaxed/simple;
	bh=UPlI2MxqqzTG6pcBOvFyr6PFrDiXKqyQQt6AzQK8OV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=as+JFOrDzQfJ6jEDdgdLJSW0Zh3PicTZ1mAmTA/RcRj4M1YlghwjSHuTyyV1hvBTo7PNlJsXSJgE+8CWt8Hy48YEp0/2hnLgbVvImkcmhqhXajbtNKV/Fbi5EUEvNhr8sKcIBSBqAJb1gfRhLmmGkv+9JarGKwGOM+w3ocz8J78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QQdvSo1G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A18C5C2BCFC
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 10:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777371116;
	bh=UPlI2MxqqzTG6pcBOvFyr6PFrDiXKqyQQt6AzQK8OV0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QQdvSo1GX/av6NCj+u0IHq50CcAgm8bP7marxoZ0L56+DrHND5ObTJ7esO4k5GuQN
	 iYmroHdAUxhuRgwoQPNBRGCiMzSb4F8Q/4MKCn399Xdk3nzi+lq1xl1BYr4nnNyL8Z
	 9MIgxZPkDRn75xpD2qyp1R2JxxuI/96MsqHhk53A10UZZDT1eKCKBTf/ulSrLlQrbX
	 a9A0f1dEvRxHuDU+MTN/Bzi4BkyaSEAtnw7cyO2Z5Hv1XVkwod9sKfTN+i0zX1XEXO
	 z1Ns03esAfb4teowhMr2nSSofuPfApJuG2m/BhmwxWCF5qjyqgRsnaL2uQml/kp8TT
	 gd3NC5IUrK5Pw==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38df1889fb9so108732931fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 03:11:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8CLX9EKnqnPU7c/HPk2x4O+Vp9R2bCm+zoifhB4MmebYPqboUfMA40skYWpv/p95OwOYV2wfm1J/eB@vger.kernel.org
X-Gm-Message-State: AOJu0YxgzGXr0WCJuresLUky0AprHe8tJF2OOYTStEXJY9IYsVeHGr6V
	VcxAHDHELo62JfhLCpIGUTjA4Rfh5Gg2Bamp9wecp80s9IggbYRXBLeQOAXbe982HLj+JPzqflJ
	QQWda3nhy1r7YklXau5oMOVuJM9z8V6A=
X-Received: by 2002:a2e:bc11:0:b0:38c:562b:9bb6 with SMTP id
 38308e7fff4ca-39240d1f9bamr8863851fa.15.1777371115274; Tue, 28 Apr 2026
 03:11:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424111330.702272-1-changhuang.liang@starfivetech.com>
In-Reply-To: <20260424111330.702272-1-changhuang.liang@starfivetech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 28 Apr 2026 12:11:43 +0200
X-Gmail-Original-Message-ID: <CAD++jL=tvDBWJHRGGJw4nnox_kcJKn5hwvwz9zxadMRedyvRhw@mail.gmail.com>
X-Gm-Features: AVHnY4ITCGaKkSuhjuqaL9_ByANEzbQqR8GldjtDhjgWLlUEHhL6NVnrqMC7umU
Message-ID: <CAD++jL=tvDBWJHRGGJw4nnox_kcJKn5hwvwz9zxadMRedyvRhw@mail.gmail.com>
Subject: Re: [PATCH v1 00/20] Add basic pinctrl drivers for JHB100 SoC
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 2333348291E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35686-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]

Hi Changhuang,

thanks for your patch!

On Fri, Apr 24, 2026 at 1:13=E2=80=AFPM Changhuang Liang
<changhuang.liang@starfivetech.com> wrote:

> The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, pe=
r1,
> per2, per2pok, per3, adc0, adc1, emmc, and vga.
>
> In the current series, we will only add the following pinctrl:
>  - sys0, sys0h, sys1, sys2
>  - per0, per1, per2, per2pok, per3
>
> The remaining pinctrl will be implemented in future series.
>
> This series depends on the series:
> https://lore.kernel.org/all/20260402105523.447523-1-changhuang.liang@star=
fivetech.com/

(...)

>  .../starfive/pinctrl-starfive-jhb100.c        | 1821 +++++++++++++++++

Thats a big patch.

I need a motivation why the existing code in pinctrl-starfive-jh7110.c
and pinctrl-starfive-jh7100.c cannot be refactored, repurposed and
re-used of this hardware is related to the old hardware?

We don't want several copies of essentially the same driver, that
way we get maintenance overload.

So the first question about this patch set is if a completely new
driver is really needed.

A second question regards "banks" in the GPIO controller.
The callbacks offsets are exensively /32 %32 MOD:ed to clamp
to 32bit words. Should this rather be reflected in the device
tree model as a 3-cell GPIO <&gpio bank num flags> rather
than 2-cell <&gpio num flags>? Doing this makes it possible
to use gpiolib helpers.

Yours,
Linus Walleij

