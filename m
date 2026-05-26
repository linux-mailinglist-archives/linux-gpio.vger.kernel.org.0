Return-Path: <linux-gpio+bounces-37519-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AMWNL97FWp8VgcAu9opvQ
	(envelope-from <linux-gpio+bounces-37519-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 12:53:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EF97C5D46E9
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 12:53:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0CF54300A256
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 10:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BBDE3DDDB8;
	Tue, 26 May 2026 10:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oL2Gh0Js"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E7431ED93
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 10:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779792822; cv=none; b=IHdZJil6XtvjHX7L5k1eRgrXY0jo0cLB0imnKkR8nM3KZycLXpgpHCz/8VGcrSOctmRyUS6nNVawWovlc7SD2y9rXjrzKAcnBdsHYzh5YfUSrDLg+O4SC0DlzNv4/zTXrcWPc5t8AaU60cMLCKcUbMZl9cBBJgMpedzI4yAearg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779792822; c=relaxed/simple;
	bh=9T4J1c+jtV0D9Pyey6uJ95z6OrU1leqzC2G17Jwwqis=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WlwjJLvr/o0MqU8oXib0QStgYywvfxPNK7pjCH9QwzUdlIUOf8YdtDqOf7HHK0D1Re/r+c7veV77yqHZwoljywy/Xygv/Kbj5XxBU+p3uMJ+RrT/lLgsurQMiiB/6gxd8CcJtFSj0mbB9XAg/SjZu6cenNgJ+WiWUhG6SV2zp2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oL2Gh0Js; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 100EF1F00A3A
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 10:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779792821;
	bh=WhuqxR/QIe3nS20UsYxd6qka1LHnS/Vv+3trUyjXJgY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=oL2Gh0JsgYvwkQlyQh9IICOYgChS38+93irPAGfuq9/vZ9gxJ9VXQbee7s2dv3A5n
	 VLjuylBuUJtjOZ9C7X7zM1TN5puJ8UyHYCdzbbIO3u6FqfdYLTzWyK01KThe+QLC1l
	 bdIiooU3boem5n37PN4Q4JQoAdO+6xrzFG8MTy7QTWcmWPKHck/4rhVKi3cnVoAAF1
	 B2zhCztsa0+ScJTcM/wkjP/N1W1VvgVvzXxQrvSxYEFx5lbvxAIfAzhwbAZ652q0Jv
	 7AHUjLSHy9BzwYdZb/oAOuYJZi94BoR2IRGdJlpLoSwqRTkM1pUv1EZ3/zcyLWXjAy
	 i5uYyX3KlEIqw==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aa474d3be0so287031e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 03:53:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+QRIOjjDi4CaKt5JApYu6SQ3vj3fU+lGCtDNp+H9Wl8L7GY9w+7sZcVLmQd17PdP3PQ7epT3f0ag2+@vger.kernel.org
X-Gm-Message-State: AOJu0YzCFaXnPXY0ouZHvRnfi6IWnfBDPj+cG9N4PY/zfCv6pr9EgDei
	dXTf/WiLm0oJaGDeJKMXaf2MKhZWpLG0M+4RNAjygjOXmGZwEmnYJVoodKlaNKm9358uPxbdI0E
	If/nKBS7UTTyDTpGf/CmalZD6z+dMpz8HuZVRDiD1eA==
X-Received: by 2002:ac2:4c4d:0:b0:5a8:7ca9:9f81 with SMTP id
 2adb3069b0e04-5aa322fed0amr7213835e87.0.1779792819733; Tue, 26 May 2026
 03:53:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525164230.43307-1-scardracs@disroot.org> <20260525164230.43307-3-scardracs@disroot.org>
In-Reply-To: <20260525164230.43307-3-scardracs@disroot.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 26 May 2026 12:53:27 +0200
X-Gmail-Original-Message-ID: <CAMRc=Mfk9tP091DN=5kjb8fvFhj1=MiBZSq4NJ7+k5LNCVy9bw@mail.gmail.com>
X-Gm-Features: AVHnY4I2BwinMwSq8u5U4_yQOEEUDoRNRKEENiOHIvRdG1GkR8xNAptPz-zlq5o
Message-ID: <CAMRc=Mfk9tP091DN=5kjb8fvFhj1=MiBZSq4NJ7+k5LNCVy9bw@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: rockchip: fix teardown bugs and resource leaks
To: "Marco Scardovi (scardracs)" <scardracs@disroot.org>
Cc: linusw@kernel.org, heiko@sntech.de, linux-gpio@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37519-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,disroot.org:email]
X-Rspamd-Queue-Id: EF97C5D46E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 25, 2026 at 6:42=E2=80=AFPM Marco Scardovi (scardracs)
<scardracs@disroot.org> wrote:
>
> This commit addresses several teardown issues and resource leaks in the
> driver's remove path and error handling:
>
> 1. Debounce clock reference leak: The debounce clock (bank->db_clk) was
>    obtained using of_clk_get() which increments the clock's reference
>    count, but clk_put() was never called. A devm action is now registered
>    to cleanly release it on unbind. Note that of_clk_get(..., 1) remains
>    necessary over devm_clk_get() because the DT binding does not define
>    clock-names, precluding name-based lookup.
>
> 2. Unregistered chained IRQ handler: The chained IRQ handler was not
>    disconnected in remove(). If a stray interrupt fired after the driver
>    was removed, the kernel would attempt to execute a stale handler,
>    leading to a panic. This is fixed by clearing the handler in remove().
>
> 3. IRQ domain leak: The linear IRQ domain and its generic chips were
>    allocated manually during probe but never removed. The IRQ domain is
>    now removed during driver teardown to free the associated generic chip=
s
>    and mappings.
>

I suppose the description comes from the LMM. Please use imperative
mode as is customary in kernel commit messages.

> Assisted-by: Antigravity:gemini-3.5-flash
> Signed-off-by: Marco Scardovi <scardracs@disroot.org>
> ---
>  drivers/gpio/gpio-rockchip.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
> index 33580093a4e7..c804f970d823 100644
> --- a/drivers/gpio/gpio-rockchip.c
> +++ b/drivers/gpio/gpio-rockchip.c
> @@ -638,10 +638,17 @@ static int rockchip_gpiolib_register(struct rockchi=
p_pin_bank *bank)
>         return ret;
>  }
>
> +static void rockchip_clk_put(void *data)
> +{
> +       struct clk *clk =3D data;
> +
> +       clk_put(clk);
> +}
> +
>  static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
>  {
>         struct resource res;
> -       int id =3D 0;
> +       int id =3D 0, ret;
>
>         if (of_address_to_resource(bank->of_node, 0, &res)) {
>                 dev_err(bank->dev, "cannot find IO resource for bank\n");
> @@ -673,6 +680,13 @@ static int rockchip_get_bank_data(struct rockchip_pi=
n_bank *bank)
>                         dev_err(bank->dev, "cannot find debounce clk\n");
>                         return -EINVAL;
>                 }
> +
> +               ret =3D devm_add_action_or_reset(bank->dev, rockchip_clk_=
put,
> +                                              bank->db_clk);

Is there any reason to not convert his call into a devm_clk_get() variant t=
oo?

> +               if (ret) {
> +                       dev_err(bank->dev, "failed to register debounce c=
lk action\n");
> +                       return ret;
> +               }
>                 break;
>         case GPIO_TYPE_V1:
>                 bank->gpio_regs =3D &gpio_regs_v1;
> @@ -789,6 +803,9 @@ static void rockchip_gpio_remove(struct platform_devi=
ce *pdev)
>  {
>         struct rockchip_pin_bank *bank =3D platform_get_drvdata(pdev);
>
> +       irq_set_chained_handler_and_data(bank->irq, NULL, NULL);
> +       if (bank->domain)
> +               irq_domain_remove(bank->domain);
>         gpiochip_remove(&bank->gpio_chip);
>  }
>
> --
> 2.54.0
>
>

Bart

