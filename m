Return-Path: <linux-gpio+bounces-30846-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALMHJ8W8cGkRZgAAu9opvQ
	(envelope-from <linux-gpio+bounces-30846-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 12:47:17 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 483335634F
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 12:47:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8B22A4282AC
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 11:43:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BFE23A35B4;
	Wed, 21 Jan 2026 11:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HZRGJApg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7DB30148B
	for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 11:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768995794; cv=none; b=TGHWSzIWfEog+CAoplpVrCSBgBH5S0cm0WNy7Jm1OSEp+IBhXWR58pmTNPQD7yiWavH1mh7OdgaYxOxIQfIxdCBANJQDCN4LMsmfIuzz1eN+w6uvIAsho5KV7XCUtXX0s12MAgKASrZoy/6BFfFwxnVJkUPQtaqFN8DLDl2yNPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768995794; c=relaxed/simple;
	bh=5NSjks3xPrAV7mpe/a4S/VkxB046tijf468Dm5RFsr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ltZJNFvk6/86aA9ADsTSFFA9BT3F09b6qEU0v4kEH5l/aJ9ry5JSMzal5k6dIcpXdRk/o3y89yz6glauGTgh3ZSbu/YErWZKYB6CIG1wAOf09i3TtrIrI6huxGUTws/3ovzoat46viLJVOVkoYPpg15SyOpgE3T1FNqmXmb2shM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HZRGJApg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A28A1C19424
	for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 11:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768995793;
	bh=5NSjks3xPrAV7mpe/a4S/VkxB046tijf468Dm5RFsr8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HZRGJApg2bT5bVia1pJ4gvPFbBK0bytbU9bEhGwmBhCnaaRvpPkeJY/5kQqhNtHGc
	 SZmdTbtJWOy1llkg8bq7FwuKm1atmHwo/n2gxyWZ0M9OUsq2oRyUyOqb71ahUXeRKJ
	 d6Rmfn0jr+B+lLL6jcPAkfkX5WgV4Rc5rHS/60pB/HXmyRxX+QgutwPLfhLiucdj9C
	 /iOW0FkVXgLolWyyV96Lg1daoFy+x1t7/MSzEcmweD/QE74TXyWfk+rFpG+wh3IxjZ
	 I1F5AweGkDZlcIz9kU3UC1m9Gv8/wpWtCu+g0pIcQ6M64bBNi7qsX0hvdM7vfo1U43
	 bVu7fI+IXeV4w==
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64471fcdef0so5300924d50.1
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 03:43:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWZY9UGTbbRoRtKg7/u61OZqn7xuROeHPESfo+/tPEa4BsfC0hxejKDT4gXuO6BkhD76oSfBW4iJTSH@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0+FB0zkAqPOYVRLkdY5ma0OIa7kSmfDv2Ml9JrCzxPKchK/Re
	WY8Tw5Kdqr63wPGddY96znnEpeHDKkViGzhd0GiTPhGAhBn91b0ibrtg9EK1J8lmf4Aq9Ve2cnv
	Qr2t9T91v204MzJ0IKxVvMcMMkqvYFlk=
X-Received: by 2002:a05:690c:b1d:b0:794:3be:f956 with SMTP id
 00721157ae682-7940a477f18mr83056437b3.69.1768995793002; Wed, 21 Jan 2026
 03:43:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_3AC818B2FE367BA7DD8940E08827CB146806@qq.com>
In-Reply-To: <tencent_3AC818B2FE367BA7DD8940E08827CB146806@qq.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 21 Jan 2026 12:43:01 +0100
X-Gmail-Original-Message-ID: <CAD++jLnSXPhqnTie9U03B7mn2x9ogUpABBLFwbt9dgtzdb3yNQ@mail.gmail.com>
X-Gm-Features: AZwV_QjxLG1kubGGyIiVaulQUqEfx7eZ9h-hx-ux8QhEnKs1HAMIalcUgqR8Xyw
Message-ID: <CAD++jLnSXPhqnTie9U03B7mn2x9ogUpABBLFwbt9dgtzdb3yNQ@mail.gmail.com>
Subject: Re: [PATCH] Add common hall sensor drivers
To: 756271518@qq.com
Cc: dmitry.torokhov@gmail.com, brgl@kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	DKIM_TRACE(0.00)[kernel.org:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-30846-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[qq.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_PROHIBIT(0.00)[0.0.0.145:email];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,qq.com:email]
X-Rspamd-Queue-Id: 483335634F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Xuchen,

thanks for your patch!

On Wed, Jan 21, 2026 at 9:59=E2=80=AFAM <756271518@qq.com> wrote:

> From: xuchen <756271518@qq.com>
>
> This patch adds support for common hall sensor ICs used in Qualcomm
> reference designs. The driver handles both rising and falling edges
> to detect magnetic field changes.
>
> Signed-off-by: xuchen <756271518@qq.com>

Why are you going to such lengths to create this driver?

What people do is usually just create a GPIO "key" input
for the hall sensor, for example:

        gpio_keys {
                compatible =3D "gpio-keys";
                #address-cells =3D <1>;
                #size-cells =3D <0>;
                vdd-supply =3D <&ab8500_ldo_aux1_reg>;
                pinctrl-names =3D "default";
                pinctrl-0 =3D <&hall_tvk_mode>;

                button@145 {
                        /* Hall sensor */
                        gpios =3D <&gpio4 17 GPIO_ACTIVE_HIGH>;
                        linux,code =3D <0>; /* SW_LID */
                        label =3D "HED54XXU11 Hall Effect Sensor";
                };
        };

This turns the GPIO line into a "lid switch" which is what you want,
and already supports regulators and pin control out of the box if
you need them too. (The VDD and pin control properties are optional.)

Yours,
Linus Walleij

