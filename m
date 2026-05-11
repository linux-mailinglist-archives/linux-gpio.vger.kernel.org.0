Return-Path: <linux-gpio+bounces-36622-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHDDFtw7AmrmpAEAu9opvQ
	(envelope-from <linux-gpio+bounces-36622-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 22:28:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B810D515D9A
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 22:28:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BAD253025160
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 20:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6E2F382379;
	Mon, 11 May 2026 20:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kY0n0me5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C9D381B1E
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 20:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778531289; cv=none; b=VAbcLrQtpFJFCalcM34lqr4edtt9QyUBvl5w62EUbwcR7cyc/yghAz4n0dzMsegNbTeWPPR6BQJIqWlvDxUrSKZ9V1I4DC9Kg599jEHMB6NfXcOFerZOVgA/Wmvz4+HbeK3CeXERd5MeSJ5B8wAypVEB27Q0FhV3zNONVDmj1m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778531289; c=relaxed/simple;
	bh=Zufrx/VI2aTaZkc5aI8hQ7bIa937j/pEvPsW/ybHiHE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t4AULGlhxyZYvdefHtG0rrIS6ErMpGG+3h08vvN2dAptiKMWVVK7QwSOhIu2j/emJfrQoUCjQnvdKqOEI9r4EEoCuKOLnr4OyQLPPesmlaH4UUsFq/kStLk+viGnbct1Z7r5iy7e6lZPJEtXStEqDq8wSXSF13Rv4I7/58pIh14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kY0n0me5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 499F5C4AF0C
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 20:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778531289;
	bh=Zufrx/VI2aTaZkc5aI8hQ7bIa937j/pEvPsW/ybHiHE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kY0n0me5gHXh9SQBpm0nawZ5itoni+8MAOqu0APPqli6Q1gWVeenTtLbc7QYrM2XI
	 gu/zJ6CgYj4Rj+bKfRhnqbs4kim2CfHCSmsE/wddLxU9oIcuvWsMrMxJTepLKh1oX1
	 0uTRg6SA1yp98tnfeG8It03g16nMgBE9MA/aWNGr9Ht4qPMDrzCTIue7kOVjzgTFf1
	 +rvC2qwFE61wiOdIoDCOE+fxqmNixJQQ+gFJiUkmHE4fYBrWittGipin0FxwGQUeJF
	 xVcbdWi7Pxxwc7wmvjGrQHI7arOSyRrr9OtKPbXYCl1kJemmRf4RqnC1T9qHTUNWu8
	 ZfrvpdlNdMPSQ==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a40cfab24dso5271848e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 13:28:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+6/8SSpKWkJKLZo5hQrWFbtxz/LDUWF2cSYB3it1k1LWE9t4YmH4ZDOSWqA4gtSjyQfmipeLSzM526@vger.kernel.org
X-Gm-Message-State: AOJu0YyMjn6W1Mhf9yKLY8hQ6s0CuUcjLJWLwmFLC+zDTDbAo8r3hmLV
	6ZG2c+NjVB4GnvOBJmgdLbxXb1j4lCSLy2XTOkOihEwvTXE3yt6EJDO5+z2zVq7szQLFEvBNCsX
	nJNsmrCQKmEGfqGsakSGoGM0b1WrKqUQ=
X-Received: by 2002:a05:6512:32c5:b0:5a3:fd83:13f7 with SMTP id
 2adb3069b0e04-5a8a949f147mr5220966e87.6.1778531288026; Mon, 11 May 2026
 13:28:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424111330.702272-1-changhuang.liang@starfivetech.com>
 <20260424111330.702272-12-changhuang.liang@starfivetech.com>
 <20260424-mumps-foothill-ef122c1029c0@spud> <ZQ4PR01MB120229BE0DAC2658164C066AF2372@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260428-hardhat-both-1c9aa594a45a@spud> <CAD++jL=96gzBL-VzNi3WtZQvhVgqATV1GwsnyZkTzNC1OiMa5g@mail.gmail.com>
 <NT0PR01MB1216A40D68A84F944F4CEABCF23C2@NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn>
In-Reply-To: <NT0PR01MB1216A40D68A84F944F4CEABCF23C2@NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 22:27:56 +0200
X-Gmail-Original-Message-ID: <CAD++jLk_7wqHYDL3K7s6AGTfLcH+Hs_sr3o53yJOBQ+F+Q4xGQ@mail.gmail.com>
X-Gm-Features: AVHnY4LemyhdlVVL4fcj1rkaW0eUQWg0zRd1czeP7h1K7aGobHiBihe2v4zvxNE
Message-ID: <CAD++jLk_7wqHYDL3K7s6AGTfLcH+Hs_sr3o53yJOBQ+F+Q4xGQ@mail.gmail.com>
Subject: Re: [PATCH v1 11/20] dt-bindings: pinctrl: Add starfive,jhb100-per1-pinctrl
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Bartosz Golaszewski <brgl@kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: B810D515D9A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36622-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,starfivetech.com:email]
X-Rspamd-Action: no action

On Thu, May 7, 2026 at 11:55=E2=80=AFAM Changhuang Liang
<changhuang.liang@starfivetech.com> wrote:

> Thanks for the criticism. I'm now reworking the binding to use the simple=
r
> string-based functions+groups as Conor suggested, instead of overcomplica=
ting
> pinmux. Will send a new version soon.

This sounds great, thanks Changhuang!
Looking forward to the new version.

Yours,
Linus Walleij

