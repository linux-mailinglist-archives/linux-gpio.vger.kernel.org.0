Return-Path: <linux-gpio+bounces-34975-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNlgN5cn2Gm9YggAu9opvQ
	(envelope-from <linux-gpio+bounces-34975-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 00:26:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 58ECF3D0439
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 00:26:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7E7C33031AED
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 22:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DAB638F928;
	Thu,  9 Apr 2026 22:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ci+7OuUo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C1738F92E
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 22:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775773527; cv=none; b=gO6+3OH4QD4bjpPM0SPXg4WAwuMzqid+bFLdqVYjmH6NLGE61FPGiUZe1lAOzRjKvpbM6ZGrE4qWslULTJVgyR27e7kgA94dYsnxCALDf0TFQKMbzfC8a5d8ppQ/bnhC+mpcTSqBIZxBFGcK2VFDEUevYBTyaVH6Cl/8F8MIXi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775773527; c=relaxed/simple;
	bh=gni6OuDMqG4Wudqx1opDhebHQF1rc+9753lXdYOtVwk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RazkYq9ixWR9OlPawNUjLPIMxdoakG0mobAFVoE56hqarG5zq7swfsGsTpnyMiDzGQ/YaWfW/7CgAwRW+nk4Gq6pTZSjs0sWcu9JUvjBguu5JOID6E/rnxB4+s17mEzrFQ1eS7Ygt9iyOvYRAL2xdbzE+J7/zcllD61Nk35O8O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ci+7OuUo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02125C2BC9E
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 22:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775773527;
	bh=gni6OuDMqG4Wudqx1opDhebHQF1rc+9753lXdYOtVwk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ci+7OuUoLgk0F9PQoVgXufFLrjmeqcP/QJAEQn9N6D5XhtWEKN92X/66NlFwlqJ1S
	 8fKOo1iASV2UqzXl5UrPjfiSZG2g2yMoG+oAdWdVXqRxQS8W/4XTgeBqi04KV//Ty3
	 +jXaLK/WYl0aCkAUikdRocp9xLzLQfLLVkPFoBfjrRTcCnJ7GDNWUtMnfhGfNLUPlH
	 C1xQQpGLg7JCYU262M8f0tYM8w6N3qKwtT4gnusXRsz5+F7x2x3kceozsgOHPnb+tF
	 eXwfp+KMLRj9RxKp/W/J8DN4uB7fsOTheg6wvbgC52VLa7UM7Yi+ku4fm96nbtDTuI
	 thGvjuH4vo4Mg==
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-6501d242e2fso1534137d50.3
        for <linux-gpio@vger.kernel.org>; Thu, 09 Apr 2026 15:25:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX/yl7ni0XAsEe2pJoAeT+EIqg5mgSDRtLKzff9lyfJWgxu0pK4hQlCau4QUsbQjrADIz1SInDfzd1T@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb4/Tz0llgg66HU7OtUzJoE+5+VkbxA4wugUneiwX4APyQbfwM
	F7V3xU1HUR1XF2QBlkwF14w75hFA3DjhxleVdUM8QEmbYWmQY01ou2ABNEGaQyqqSj9t2sJ9VYY
	9OfmG247V9zLKc0bZlfTKhj7ExX/dTRc=
X-Received: by 2002:a53:edc8:0:b0:64e:efc7:b1cb with SMTP id
 956f58d0204a3-65198ac3434mr597075d50.27.1775773526360; Thu, 09 Apr 2026
 15:25:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1774864401-177149-1-git-send-email-shawn.lin@rock-chips.com>
 <CAMRc=Mfg3KvifZgpD8c7kkLNhv3zgDKvHB=n_=MQJ2EtwRi44A@mail.gmail.com>
 <73130e47-dbd7-c0d0-eba1-8bafba9f91e5@rock-chips.com> <384b25a0-d55d-4415-82fb-dcf2e6ad1232@kwiboo.se>
In-Reply-To: <384b25a0-d55d-4415-82fb-dcf2e6ad1232@kwiboo.se>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 10 Apr 2026 00:25:14 +0200
X-Gmail-Original-Message-ID: <CAD++jLmhkZhWzjV9b6r9P4oZq=4dqVEVV7mwwE_WWRgRXbq3AQ@mail.gmail.com>
X-Gm-Features: AQROBzAqbIzKJ9qMCr1olkI-tYrygB6OgUAWvIWw1d0yAhmxkRVT55ysYG46gq0
Message-ID: <CAD++jLmhkZhWzjV9b6r9P4oZq=4dqVEVV7mwwE_WWRgRXbq3AQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: rockchip: convert to dynamic GPIO base allocation
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, ye.zhang@rock-chips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34975-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,ff780000:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,kwiboo.se:email,ff730000:email,ff790000:email]
X-Rspamd-Queue-Id: 58ECF3D0439
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 9, 2026 at 9:09=E2=80=AFPM Jonas Karlman <jonas@kwiboo.se> wrot=
e:

> This patch is causing boot issues on my Rock Pi 4 (RK3399) board using
> next-20260409 kernel where this patch has been applied as c8079f83e0bf.
>
> [    0.082771] rockchip-gpio ff720000.gpio: probed /pinctrl/gpio@ff720000
> [    0.083531] rockchip-gpio ff730000.gpio: probed /pinctrl/gpio@ff730000
> [    0.084110] rockchip-gpio ff780000.gpio: probed /pinctrl/gpio@ff780000
> [    0.084746] rockchip-gpio ff788000.gpio: probed /pinctrl/gpio@ff788000
> [    0.085389] rockchip-gpio ff790000.gpio: probed /pinctrl/gpio@ff790000
> --
> [    0.212208] rockchip-pinctrl pinctrl: pin 637 is not registered so it =
cannot be requested
> [    0.212271] rockchip-pinctrl pinctrl: error -EINVAL: pin-637 (gpio3:63=
7)
> [    0.212344] leds-gpio leds: error -EINVAL: Failed to get GPIO '/leds/l=
ed-0'
> [    0.212389] leds-gpio leds: probe with driver leds-gpio failed with er=
ror -22

I think this may be because the rk3399 is missing gpio-ranges despite it is=
 a
new platform and should have had its gpio-ranges defined in
arch/arm64/boot/dts/rockchip/rk3399-base.dtsi ...

A bunch of these rockchips seem to have this problem despite the
code in pinctrl-rockchip.c that says:

    /*
     * For DeviceTree-supported systems, the gpio core checks the
     * pinctrl's device node for the "gpio-ranges" property.
     * If it is present, it takes care of adding the pin ranges
     * for the driver. In this case the driver can skip ahead.
     *
     * In order to remain compatible with older, existing DeviceTree
     * files which don't set the "gpio-ranges" property or systems that
     * utilize ACPI the driver has to call gpiochip_add_pin_range().
     */
    if (!of_property_present(bank->of_node, "gpio-ranges")) {
        struct device_node *pctlnp =3D of_get_parent(bank->of_node);
        struct pinctrl_dev *pctldev =3D NULL;

        if (!pctlnp)
            return -ENODATA;

        pctldev =3D of_pinctrl_get(pctlnp);
        of_node_put(pctlnp);
        if (!pctldev)
            return -ENODEV;

        ret =3D gpiochip_add_pin_range(gc, dev_name(pctldev->dev), 0,
                         gc->base, gc->ngpio);
        if (ret) {
            dev_err(bank->dev, "Failed to add pin range\n");
            goto fail;
        }
    }

Notice dereference of gpiolib internal gc-base here.

        ret =3D gpiochip_add_pin_range(gc, dev_name(pctldev->dev), 0,
                         gc->base, gc->ngpio);

arguments are gpipchip, pinctontrol device name,
gpio offset, pin offset, number of pins.

GPIO offset always 0?? Passing GPIO offset as pin offset??

This is probably just working because of luck that 0,0 is passed.

This should probably rather be something like:

        ret =3D gpiochip_add_pin_range(gc, dev_name(pctldev->dev), gc->base=
,
                         bank->bank_num * bank->nr_pins, gc->ngpio);

Here we put the assigned (by gpiolib) gc->base in the right place, then
bank->bank_num should be 0,1,2... and bank->nr_pins always 32 (I think).

Jonas can you test this oneliner change? I can send a proper patch
if it helps.

If this works the DTS files can (SHOULD) be fixed with proper ranges later.

It would be nice if we could augment the rockchip pinctrl DT schema to
make gpio-ranges mandatory on new SoCs.

Yours,
Linus Walleij

