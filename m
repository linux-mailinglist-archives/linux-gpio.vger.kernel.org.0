Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 232C7240594
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Aug 2020 14:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726755AbgHJMJU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Aug 2020 08:09:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbgHJMJU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Aug 2020 08:09:20 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD688C061756;
        Mon, 10 Aug 2020 05:09:17 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id g6so9237740ljn.11;
        Mon, 10 Aug 2020 05:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=oMBvems1BGpH6GI9xJVHleaO1t7Rgz/V70ULHJgIFaM=;
        b=Vzvcj9Fs+Dv6VULXjWSOlYNPSPrKGmJ+eEXF+LWwH+pZsdqPH/KY4W5WJBH5JI63Uj
         yBuNa5tZySK6Rsuan+sN8q7WgK9Js6rVjYkjtlPNvOFUqZkaUh05hrcA5khvJyfMgfvO
         FVVMH3ADZvoVDWOKFkOCBZvvh+MTP+e0N0orOKWLj1DJ2zH7ylZqTeurTmcQmgyx/oxR
         jsNjE4diuNLnfRcUJof2hS2qJ0fOuw9Ai971TKPShYAXP51Lq69JPy/0U0qcc9KjXxbM
         JaMFjPjYFrfXhUGEyUsOsUR6GLgliDHSWcpZXXOSqIoOnmO6PGI8T6dmf95XUdLiSwMc
         ql0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=oMBvems1BGpH6GI9xJVHleaO1t7Rgz/V70ULHJgIFaM=;
        b=rQ988D0X5AeB930WKRiKzU0SPL8UJW54Bw7ysbTjTdrtzdYY/+a174goency6vq8yT
         sTTc6tTl4/vTk81/MCfilItMWHyAqHHuHeMDulxhco9R5nKJHW2zLmUx2Lwnphjwzqmp
         f0munwzm5/Ls5wlwpZyusYjwPo/KYknfxO6EFzLum/ybMSfBP8ip3tzB83LqllL7l5pc
         fT9lAzKUOCZy0BeEyfrnbUD0rjFqeCdAMSimBCV3KRPuhazYlyMAsgIlx2vOT1GsBpMM
         t0otp5/R+MHxSbZ9WPrS5dZAEwLVrT/cRXZ32mxMxSbnljrIsZQOJkuP4tiBV3066Jua
         czRw==
X-Gm-Message-State: AOAM532Er51880RIW8XYWuVgcOh9iVJn2DdYfops/lDjSdzELP+A1LoN
        Dmz7sLTLeBeOYY4X9z30Cac=
X-Google-Smtp-Source: ABdhPJwaDWxR0aZPAD+mdtRsWa6zXkLg8uAwd451CmgPgwp3S2j5FYtstvBTqfeYY2+vFrhG8VIKPg==
X-Received: by 2002:a2e:b689:: with SMTP id l9mr368612ljo.393.1597061354261;
        Mon, 10 Aug 2020 05:09:14 -0700 (PDT)
Received: from saruman ([194.34.132.58])
        by smtp.gmail.com with ESMTPSA id m20sm11443764lfb.72.2020.08.10.05.09.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Aug 2020 05:09:13 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        maz@kernel.org, linus.walleij@linaro.org, swboyd@chromium.org,
        evgreen@chromium.org, mka@chromium.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, agross@kernel.org, tglx@linutronix.de,
        jason@lakedaemon.net, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: Re: [PATCH v4 7/7] irqchip: qcom-pdc: Reset all pdc interrupts during init
In-Reply-To: <1597058460-16211-8-git-send-email-mkshah@codeaurora.org>
References: <1597058460-16211-1-git-send-email-mkshah@codeaurora.org> <1597058460-16211-8-git-send-email-mkshah@codeaurora.org>
Date:   Mon, 10 Aug 2020 15:09:01 +0300
Message-ID: <87imdqpusi.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Maulik Shah <mkshah@codeaurora.org> writes:

> Clear previous kernel's configuration during init by resetting
> interrupts in enable bank to zero.
>
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  drivers/irqchip/qcom-pdc.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
> index dfcdfc5..80e0dfb 100644
> --- a/drivers/irqchip/qcom-pdc.c
> +++ b/drivers/irqchip/qcom-pdc.c
> @@ -389,7 +389,8 @@ static const struct irq_domain_ops qcom_pdc_gpio_ops =
=3D {
>=20=20
>  static int pdc_setup_pin_mapping(struct device_node *np)
>  {
> -	int ret, n;
> +	int ret, n, i;
> +	u32 irq_index, reg_index, val;
>=20=20
>  	n =3D of_property_count_elems_of_size(np, "qcom,pdc-ranges", sizeof(u32=
));
>  	if (n <=3D 0 || n % 3)
> @@ -418,6 +419,15 @@ static int pdc_setup_pin_mapping(struct device_node =
*np)
>  						 &pdc_region[n].cnt);
>  		if (ret)
>  			return ret;
> +
> +		for (i =3D pdc_region[n].pin_base; i < pdc_region[n].pin_base +
> +						 pdc_region[n].cnt; i++) {

how about making the for loop slightly easier to read by moving pin_base
inside the loop?

	for (i =3D 0; i < pdc_region[n].cnt; i++) {
        	reg_index =3D (i + pdc_region[n].pin_base) >> 5;
        	irq_index =3D (i + pdc_region[n].pin_base) & 0x1f;

		[...]
        }

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl8xON0ACgkQzL64meEa
mQYWmhAAoPMQrU9MnIAYOqNNzNtawl7woFD3U3/hWPKR9Ec+eg/mAnzUQn9WkCeZ
iwF4bNfzAj3WR+oOm5zAR4rjqfy4nGRsgxabtD7ESAUsoDt5UEJv2upOjhLbyFwS
PmYYg/2hl1/cDtmz2FtN9hd5EGcQpM/Cm09wgbI+PWWVb61IdFPE2zlUPZr4jKYS
zhoqOgTxoZmsWwfVPsY6EpMWpGdnvQIOLvTg8/Xm55hGhNQPQt6lNrgY0olzHnxv
Z92vaAYjbJSCtuc36DwyM2bfY49cYeYpxRkKQm8POZr3s5I6QF3GAc2GSV3e9dnq
p6tLIZoGMOm25FJDHxuU7uDD7shQOWwWZf4zYTxIUxnKwlHgUqB3tR8Xch2zibW0
+UZdNLMqsB5OIHBblKaq11YAlIvmgaN0elnL3WQrZTaY1MvjGvTf7e8aQYSPelJz
piZ9XP7uvt5y/WV6E4NCKIsAB0VRPeOLS2qoAUFuWHzcLN+YxPOtdRj1KASZElQJ
AHKfuOkg6VWn+q6bb/OtHQ179dzoWNhMESZcapAbx72UIU2abtS8LQdXL7pIdCnt
bEif9TrxTtGT5lkAgS5B5fMUrPRrxMdxFBDJy6pjDg6y+Y8MfhZRmnYhCJTB0+6v
lqvrgJWBAzO1dR9zJYe5d5vAeRNBGFvvl9AFEOjuZU9mhCoNdYU=
=O4o+
-----END PGP SIGNATURE-----
--=-=-=--
