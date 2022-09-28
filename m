Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 781085EDD39
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Sep 2022 14:56:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233992AbiI1Mz7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Sep 2022 08:55:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233621AbiI1Mz5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Sep 2022 08:55:57 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 476334A81A;
        Wed, 28 Sep 2022 05:55:54 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id rk17so13735894ejb.1;
        Wed, 28 Sep 2022 05:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date;
        bh=Te5x3E57m7cOxR02iErARIkX0eaDD14Z91rfL50K4UE=;
        b=VZs37zWVN7illdyOhUS5P/ohuurX/YrDbuqtXuJ8fz3n8/iX2si6QM3+1Np6yAEh6b
         5qfOdzaE1GzIYH9tCXlM351Z1Mbz9nVpiuFcUS6iwlh3IZp1bswtFyjhPftz9IpiWQpk
         XxdVWmwaBJEWJFhwAo/Es2wuUHX2Ax5N+6J0cblbDooIOSAHbJFZQT8lAhvFYpjYUvCo
         f26E1gY2ryq98RM65f9OAJ36x3mLtDbZbynnRorb18saGCFG1eBhsZKipZM0BPzcXHvL
         qf+V/Ty1gQoJmPl8x9a2NDwa7t8wv7X3MgSpv7YCKID6X8ZnO96N0OxQOeF7999mEC6Q
         i57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Te5x3E57m7cOxR02iErARIkX0eaDD14Z91rfL50K4UE=;
        b=NTElxgj8sdNh1XBdVLek3x63eTOxzAdp4fVBJ+p9eNiqUEXzRO7OQEFnH5Jae12SVa
         j/dQcFbPEhEQKlDRwE8276PkTU9c1UDsa7KPCEBYyTWN9ZuFZzBEsSqEA+D4mtKVTbUo
         pBpObBsmDkFke4F/rQJv1DN1llRj6gZ5f10+Fp8U5LTrAI+DakzlabruvdGMrH9nNrOt
         GBKcYdaU9mMKrDEU9M7qV9FtvYweYBKPBVc0WZW1hBPEp1KVdZ44DJCq6wJrpfxnXvE8
         I9U6WizVp9fnAX+Bla+0dUDk8+nDQ16JNLdWc0+dxPd2kNVTzzGLYM1LJBoMmsj8H7Kl
         LngQ==
X-Gm-Message-State: ACrzQf1JuKIFtPU3BdBfhB5bgsMxAh9Xj71533iyFq35Us8zMKgmhVYU
        yFU9duW/FLdB38jBU1MLt28=
X-Google-Smtp-Source: AMsMyM7OXe0/T+3lsZ2mP27MAf2iIGhR3xg9qM/R3946y2uNjo9NFKytzOuyM+b/vFjywh8BT+gkeA==
X-Received: by 2002:a17:907:a05c:b0:772:eb61:904b with SMTP id gz28-20020a170907a05c00b00772eb61904bmr27861699ejc.237.1664369753063;
        Wed, 28 Sep 2022 05:55:53 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ez23-20020a1709070bd700b00780a26edfcesm2324189ejc.60.2022.09.28.05.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 05:55:51 -0700 (PDT)
Date:   Wed, 28 Sep 2022 14:55:49 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     linux-pwm@vger.kernel.org, kernel@pengutronix.de,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Douglas Anderson <dianders@chromium.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 3/3] pwm: Handle .get_state() failures
Message-ID: <YzREVarafbsRUl4t@orome>
References: <20220916151506.298488-1-u.kleine-koenig@pengutronix.de>
 <20220916151506.298488-3-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="e50AYHBveDjKXIgT"
Content-Disposition: inline
In-Reply-To: <20220916151506.298488-3-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--e50AYHBveDjKXIgT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 16, 2022 at 05:15:06PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> This suppresses diagnosis for PWM_DEBUG routines and makes sure that
> pwm->state isn't modified in pwm_device_request() if .get_state() fails.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/pwm/core.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
> index 381db04cfa00..421573590613 100644
> --- a/drivers/pwm/core.c
> +++ b/drivers/pwm/core.c
> @@ -108,9 +108,14 @@ static int pwm_device_request(struct pwm_device *pwm=
, const char *label)
>  	}
> =20
>  	if (pwm->chip->ops->get_state) {
> -		err =3D pwm->chip->ops->get_state(pwm->chip, pwm, &pwm->state);
> +		struct pwm_state state;
> +
> +		err =3D pwm->chip->ops->get_state(pwm->chip, pwm, &state);
>  		trace_pwm_get(pwm, &pwm->state, err);
> =20
> +		if (!err)
> +			pwm->state =3D state;

So basically this means that callers of pwm_get_state() will get the
zeroed out pwm->state. This can cause issues with the likes of
pwm_set_relative_duty_cycle() which many drivers would use. Do we
perhaps want to set an internal error in this case so that it can be
propagated to callers in pwm_get_state()? That would allow them to fall
back to some default configuration rather than potentially breaking
altogether.

Thierry

--e50AYHBveDjKXIgT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmM0RFUACgkQ3SOs138+
s6Hu/w//cFpzkzV1FZ3sHLAMgkA+dobRGgpdOP62XrOaTSHVIWizW8u3OJmkXQjY
1xYExTJ6OvncXH0DB+pMxM3Uvsb4N5A7K/iEYKA5SlTLG8DJSv59VXDtEAbPKFVC
I3hMh0DwlZkJzl010tJ/3FQqUipFylqonRmKaIONqFHGRsYQNylw1K3CqH0yYDG0
LjFaz5eYJtqK2Nrzt5BjUalfjDKdtL6AsaePTYEKFymMfqjlWCbmafrIzF7X2j4y
7QwoFg4AXrOSRbvV8qeoMqToVD0EWfyND12OZxOtaqFipQIZcUK6XAOPyyKxGiiv
1PnbqDioH9S1e+iCMPgibUHeyn5z9YaQu43S9BclAPB/66kUuC+pHlOy6XWbRnAm
hXpuptlzCdib8B/tRG0ltl0ZxR3etiInFEPROFxB313S989rv+G5rh63vDuRKDQ0
cGGrZ/uNhUjZRvTn6rdOBYuaZLkqA+aYPqXLo1orwrDgULjzVi3EE5sucZDibrGv
aSiHQOvaRVrej5pARbL0hAuXC94Fz27mefri57MPdSuMBAejJSKs/HVdzYIPWmSz
KjH4U9nBDQo4B8rYeltC7BS21zD7vdJW12DWd4F1fk0Ix/bknFaT/2XgflLi0qP2
KLfXjVYERi56Db0xzT4ufVA8qqbAlYIU/tLp5LmLdgxdQMt0N9w=
=CAO3
-----END PGP SIGNATURE-----

--e50AYHBveDjKXIgT--
