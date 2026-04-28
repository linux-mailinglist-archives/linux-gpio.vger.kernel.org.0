Return-Path: <linux-gpio+bounces-35694-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDo5LMSW8GmrVQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35694-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 13:15:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EC3483796
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 13:15:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3BBE73179917
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 11:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94A103F1662;
	Tue, 28 Apr 2026 11:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F+Ki5qsn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456193F0ABA
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 11:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777374502; cv=none; b=ciy7yWN0IeI9lC7jx7rl0Y28cyZ3wjCo8ZjA97BuYW1H+U9CI0aonFNYWH0Q0+z0M1wW6wep52jyOLbMTlN8aptydBxDI5byytSdBmvx6wb68qaPB0WjoiAK+T2lFU33mdkQmoEyPgRzCnhB+qHJHpeiylhm4br0SqX3wTHqhR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777374502; c=relaxed/simple;
	bh=c2c7jO6hYI8b7jy0S2IChLenRdchEWJaq6E2waZawHE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CJLNZS5vxKau6wVW4sQd1YuiuBdL18xJnCwiVwZ7gf8Y3N+YMdlY0GBfSYLsHdLvAknVSRZf/x4RKc7s3UUdwpU5xFm3+PGEJaApq9wuit6lc0A903IcjOea/IEc3QndrX0X1aL/Fuyzq1AfbaCCtunL/7s7/HPopJRNgX/5eHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F+Ki5qsn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11AAAC2BCB9
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 11:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777374502;
	bh=c2c7jO6hYI8b7jy0S2IChLenRdchEWJaq6E2waZawHE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=F+Ki5qsnRa3obRmGutl/v+YE/IaCsg06XMEhWRXxUXm5ZWBFR4FNxwTMddd5fcwzY
	 h4R9lOh47SXniKs2dnTbqT1v2c+ExzIL+sYrR6P+YkNHV8fx1rbgPxtCz0NdjBTRwE
	 /Tug9VHBN/nJqcNYsUlifxqNoNjFeRQ6IyLVicIdL/rcrAsMQdAGe0hZkvK4AcDLud
	 ZroRHccexPYzi/pO77aX/OdsGvt3zy9imwlRA7S49/mUT8js/uW6P4TZk7HE8OsID6
	 qn5MhQdT7zIYIOJbXygG1aIWYOTvNWuY4loaem4/pLJbWxRJS9PyEwwbRDGRWU2kaE
	 EfNp3J4WURi6g==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38ccde812ecso110632171fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 04:08:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ973vcHLDBd4/3IuaXeOlpeJmDryXcx+GzOuMqtn/9WdPIQZr/bC+YyBeSHtaJkHQZFp3nt0mqw06re@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3bAwUJMX8ouxPW9R1yHk8jAXv3rsICCV//wEw4tYyMVEcbrLz
	nsszzS95Soa1L3sPlNrvNmqqvykvHT2Cuwq+XW3SS901p9hJcT583qO4teZx74KdzMqBuln8jJn
	CjyNwkC9esaSMaqi92aFzEdbx0AwAkc0=
X-Received: by 2002:a05:651c:324c:b0:38e:35fe:b79 with SMTP id
 38308e7fff4ca-39243022befmr7190031fa.2.1777374500737; Tue, 28 Apr 2026
 04:08:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424111330.702272-1-changhuang.liang@starfivetech.com> <20260424111330.702272-12-changhuang.liang@starfivetech.com>
In-Reply-To: <20260424111330.702272-12-changhuang.liang@starfivetech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 28 Apr 2026 13:08:09 +0200
X-Gmail-Original-Message-ID: <CAD++jLk_AQjjCLkeuiyBtiQUsmzHEfqpigttJ7E9n1UE8h29Hg@mail.gmail.com>
X-Gm-Features: AVHnY4IDxcIj36cpLzKrI1NZVFjYAH9TxKPvCzuHnuFYmrkebhBtVhuQTXFLwpQ
Message-ID: <CAD++jLk_AQjjCLkeuiyBtiQUsmzHEfqpigttJ7E9n1UE8h29Hg@mail.gmail.com>
Subject: Re: [PATCH v1 11/20] dt-bindings: pinctrl: Add starfive,jhb100-per1-pinctrl
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
X-Rspamd-Queue-Id: 31EC3483796
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35694-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,starfivetech.com:email]

Hi Changhuang,

thanks for your patch!

On Fri, Apr 24, 2026 at 1:14=E2=80=AFPM Changhuang Liang
<changhuang.liang@starfivetech.com> wrote:

> Add pinctrl bindings for StarFive JHB100 SoC Peripheral-1(per1) pinctrl
> controller.
>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
(...)

> +  This domain contains 4 IO groups which support voltage levels 1.8V and=
 3.3V
> +  gpioe-spi - comprises PAD_GPIO_C0 through PAD_GPIO_C4.
> +  gpioe-qspi0 - comprises PAD_GPIO_C5 through PAD_GPIO_C11.
> +  gpioe-qspi1 - comprises PAD_GPIO_C12 through PAD_GPIO_C19.
> +  gpioe-qspi2 - comprises PAD_GPIO_C20 through PAD_GPIO_C27.
> +
> +  Each of the above IO groups must be configured with a voltage setting =
that matches the external
> +  voltage level provided to the IO group.

So your hardware has groups and support some properties on the group level.

So expose these groups and make these properties configurable per group
instead of inventing per-group properties.

> +  gpioe-spi-vref:
> +  gpioe-qspi0-vref:
> +  gpioe-qspi1-vref:
> +  gpioe-qspi2-vref:

Create proper groups in the pin controller then use the
standard pincfg property power-source =3D <...>; for this.

Example for a simple default hog:

pinctrl {
    /* Hog the QSPI pins */
    pinctrl-names =3D "default";
    pinctrl-0 =3D <&qspi_default>;

    qspi_default: pinctrl-qspi {
        config {
            groups =3D "gpioe-qspi-pins";
            power-source =3D <2>;
        };
    };
};

The groups can be orthogonal to other pin handling, that's
fine. Implement .pin_config_group_set in struct pinconf_ops.

> +          starfive,debounce-width:
> +          starfive,drive-i2c-fast-mode:
> +          starfive,drive-i2c-fast-mode-plus:
> +          starfive,i2c-open-drain-pull-up-ohm:

I already adressed these in other review comments. Get rid of
them in favor of standard pinconfig bindings.

Yours,
Linus Walleij

