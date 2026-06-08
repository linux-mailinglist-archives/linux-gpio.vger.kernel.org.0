Return-Path: <linux-gpio+bounces-38100-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wwD0LkrdJmoMmAIAu9opvQ
	(envelope-from <linux-gpio+bounces-38100-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 17:18:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 462F3657EC5
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 17:18:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="J0UML/X2";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38100-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38100-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7EA5030BA98D
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 15:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5671832B110;
	Mon,  8 Jun 2026 14:45:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B04133064A
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 14:45:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929950; cv=none; b=ZkcuIwTU9xE9vzpnAsLVjuBqp7wu6j4yr+nYbT7mhnHVVGmvSy3J3sqBJHdEf072iSGpTCbI807QYH++D8Q5Ayctu/qWlZG+vUQ5+MsGAVm2Sqim78fMU6yzimF0Adp6STmnlCI87j59QJyQlltX2g55qD7GI6H9/SYytdp3fI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929950; c=relaxed/simple;
	bh=zioqbZ1fK6bIcIuMYSHWyT6ST2+bVeMRMT3lKy/lybg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hKBdN1B6z7r8AOnFovJzGv2v1JCmp4Q05uyES3p5G0XpMuJB29vDJ0wf/jdJWMbt77d0ou6pTHEMd2JK+MhYXzxpp/xUl98+udJQOdEMFZUd+/vLhriJzVY+VjklniKRKy2Ljy7fKbFcXk4o7cpoZwSXnHZYbFOjzo7HRYyYMWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J0UML/X2; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C06C41F00893
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 14:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780929948;
	bh=C1ZKRAk+v5D8Fo7M4WzkBwmvVcnvQs40wfLDkqAg74g=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=J0UML/X22q0xYMiMs+IBBC3yMy6GhyTPNIY4OZORGxP3k9qC0xR7U9KjrkcgiJetY
	 ppDrnKbYUHR0grKD/gtHfBbaWHV1f/29NHjEKZMuMPD98M33kaT7QPqS1QocaMPlsk
	 4k/9g7BpFMuOpjwL968hRyx/ICOjJTZwJcFq7LYdh/Lh6D9HZCJp7Lxq5CNnQlOy8O
	 6OGE3VVWaK/YgCp+HHGMmCWnUxQszo2zkKOx11B85al9ynxEkyHuqf67wH8UPlISJa
	 qQnUPotuOs2PsXyOjwH4ciHg3mvCDuaLh7Ado8PwqrJrYo49GYvMvR0evlD4MojljK
	 9MwvUdEYYbiDw==
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-137dd523634so6863108c88.1
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 07:45:48 -0700 (PDT)
X-Gm-Message-State: AOJu0YwNDxHW1efJKWVy/XspPN4Dh+5GNPi0okxV9NK8NejrRIiyW28A
	4UNW3CIokC15qDlxLae691FdxmrhTY2GWqymJqn/RVT9SaFL9qf1i2CRpRUGmmmj0I3z7C7lNkh
	w89cNppq2NUqhFStOz+hOaJ8dtfvWZBB3fqswsqpCEQ==
X-Received: by 2002:a05:7022:43a9:b0:137:f58c:3cae with SMTP id
 a92af1059eb24-138066b75femr7099909c88.1.1780929948188; Mon, 08 Jun 2026
 07:45:48 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 07:45:44 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 07:45:44 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260603055347.66845-19-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603055347.66845-1-changhuang.liang@starfivetech.com> <20260603055347.66845-19-changhuang.liang@starfivetech.com>
Date: Mon, 8 Jun 2026 07:45:44 -0700
X-Gmail-Original-Message-ID: <CAMRc=Md1z52A_JzMG=3Ce5nN-HMvwH0TO=t2jEqC3kdCQK8EwA@mail.gmail.com>
X-Gm-Features: AVVi8CfaVNjKqTQIxP4uDH7miQgJxqhIv2ueyrqcnqutmjGTDV0cuJZ3ZuCNFUc
Message-ID: <CAMRc=Md1z52A_JzMG=3Ce5nN-HMvwH0TO=t2jEqC3kdCQK8EwA@mail.gmail.com>
Subject: Re: [PATCH v3 18/21] pinctrl: starfive: Add StarFive JHB100 per2pok
 controller driver
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>, Linus Walleij <linusw@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38100-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:changhuang.liang@starfivetech.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:lianfeng.ouyang@starfivetech.com,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kernel@esmil.dk,m:pjw@kernel.org,m:aou@eecs.berkeley.edu,m:palmer@dabbelt.com,m:alex@ghiti.fr,m:p.zabel@pengutronix.de,m:brgl@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 462F3657EC5

On Wed, 3 Jun 2026 07:53:44 +0200, Changhuang Liang
<changhuang.liang@starfivetech.com> said:
> Add pinctrl driver for StarFive JHB100 SoC Peripheral-2 Power OK
> (per2pok) pinctrl controller.
>
> Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
> Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/pinctrl/starfive/Kconfig              | 12 +++
>  drivers/pinctrl/starfive/Makefile             |  1 +
>  .../pinctrl-starfive-jhb100-per2pok.c         | 97 +++++++++++++++++++
>  3 files changed, 110 insertions(+)
>  create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2pok.c
>
> diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
> index edc3b6d9c8d7..bf5915e0a5f2 100644
> --- a/drivers/pinctrl/starfive/Kconfig
> +++ b/drivers/pinctrl/starfive/Kconfig
> @@ -91,6 +91,18 @@ config PINCTRL_STARFIVE_JHB100_PER2
>  	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
>  	  and interrupts on input changes.
>
> +config PINCTRL_STARFIVE_JHB100_PER2POK
> +	tristate "StarFive JHB100 SoC Peripheral-2 Power OK pinctrl and GPIO driver"
> +	depends on ARCH_STARFIVE || COMPILE_TEST
> +	depends on OF

I don't see any real dependency on CONFIG_OF here, am I missing something? The
OF ID matching is available even with !CONFIG_OF.

Same elsewhere.

Bart

