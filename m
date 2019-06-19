Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 055084B3F1
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Jun 2019 10:20:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbfFSITw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Jun 2019 04:19:52 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37535 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731065AbfFSITw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Jun 2019 04:19:52 -0400
Received: by mail-wr1-f68.google.com with SMTP id v14so2335680wrr.4;
        Wed, 19 Jun 2019 01:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZnYayF9VYct2jWby1IqOoaoVXAeeLAiPfG49gu45p/Y=;
        b=GC6POhLLqgj5uIN8IId/4ZgP/C8S5WKfOiwxuv+ImXAo8SxuwJB31UVO5pt8ZooQr5
         wraLvaGX142aFUEPPiannZmP3DRJyv1HnWzI0LmXqJQGPD/2804JBim5OWruM0/suKVa
         nTDjaYzcBBT7p/rV8WqYeqo74ajI2z5awJtdm9A9487WpCFlzS5i/JfcFBXWttA20y6f
         PyEQpxSd5UEkLwhIQMcbr8IsoK4jOe/fVImWIYmBgawmQvh2wGs6c2WamK9/O0vWInl/
         0xSlWGzVdp1OSHPrBEtTgOuKmPv1vEnLQ6gvNNInGWYXrEBbvpf4/z8LSAYRuQ//DfEG
         cmyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZnYayF9VYct2jWby1IqOoaoVXAeeLAiPfG49gu45p/Y=;
        b=ns0uNi1Y0GCzZlXzJgh4uB8Yf2G6nyV2rQPija/Vp/9ao3wGVFQIFECqACk8qs1Yaf
         eVIycRxUkZ1Bz0QvIZQT7Lk7MQ3FHFDMyMIEDO7wIh8yDhBd/RIfxD9TCzzs7F7jrNb/
         Jhfk+uspARA2U91DUMxnp8vlcfLKa2jPGZje1NFpHZ5G6p3JLpHI3BrC51lFG3rviB9/
         PCxAYFr7Ha0/QLN3asBTqLtXNBYg+SAexqHfhGbJNwcy2Plw1TmMlpWUifu225ItO7eD
         hhan3oUgVfcGymp4xbbWYGK9fNaE/Lp/7XbhrWg28H9JoqhAitZ+xB/P8YfaCuTwNSDm
         GtBw==
X-Gm-Message-State: APjAAAXyu/6GBgUvrty6ZdKXA9/ZX0u2NvCS3bqwwVv7ryUuubhMnSW+
        eGHiGafoIJJ2xQUVrnjpDgE=
X-Google-Smtp-Source: APXvYqwYdUgyoK6/9IMSZu0VBcOvC6toUStr+hKxXTv4T/TDQzs0dhJTlSkpNG1UIsNpTSIj8z9NsA==
X-Received: by 2002:a5d:6b49:: with SMTP id x9mr70000139wrw.170.1560932389968;
        Wed, 19 Jun 2019 01:19:49 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id x8sm585377wmc.5.2019.06.19.01.19.49
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 19 Jun 2019 01:19:49 -0700 (PDT)
Date:   Wed, 19 Jun 2019 10:19:48 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     bamv2005@gmail.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, Jonathan Hunter <jonathanh@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/3] gpio: tegra:  no need to cast away return value of
 debugfs_create_file()
Message-ID: <20190619081948.GJ3187@ulmo>
References: <20190618155047.16894-1-gregkh@linuxfoundation.org>
 <20190618155047.16894-2-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ibvzjYYg+QDzMCy1"
Content-Disposition: inline
In-Reply-To: <20190618155047.16894-2-gregkh@linuxfoundation.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--ibvzjYYg+QDzMCy1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 05:50:46PM +0200, Greg Kroah-Hartman wrote:
> It is fine to ignore the return value (and encouraged), so need to cast
> away the return value, you will not get a build warning at all.
>=20
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-tegra@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/gpio/gpio-tegra.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--ibvzjYYg+QDzMCy1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0J8CQACgkQ3SOs138+
s6E6cA/+I9LZR3W04g1zpKEw0AqdqWL8RwTopTdj99cCDsembUCcNFz1MBezj0w+
RnY73TVXPQrawmqcFWbGfAq2orIZHQPzHRBhkAfhtiY2yC5VbFWjhiBq+SAQit6O
HjSTxAnHyG0rwxNVYWqqoeEDZ/4Jfnmd3+mS071vBXII1/TwKloXjnQ7swDJVtMJ
Wtsm1Tdm0MKmpRuAv5qWPzOrEWU64/z3MVWEUiYuvJ4TbJ+GFq0/WVMx3pQdRDXx
KW99/93Umc32WQ07fp8RdHvs2WK3GtPeyka51Ejo96HKb3KkCSGDXw/SiG8om1vf
cpsCNiBsmmn1yNH9bPNkwbLPkk3ywCZAYL8iQUxb/iaOha/4zvyCVKtesOJixQWF
3XYMkN5rIJDnIbr/tubzAFkc+oBKhdsrOqBSLaLaQ+7Pg4mBtMewa1MtlANBqy5d
dyFQod+tSd6NlwMebW6IM12oDK/nzL7V6jEeGcUNyqSrgojCzrWK2RRJN8WUy0bU
1WIJMdpB8GTTJ+g6tmq1+yZhKYNoriB7AgjN6BtR15Ic9nWJfYqYbS9hQNjbCzY8
CVNAFE9OeF9BxOslJtEErGO+T2shfdxuskaOpVEIPQhjxKxnM2r+Ckp6tVU1AN9W
uUOf1EwMGk7NBGUl1B/5kAwaY+mJ6gmIcwRr5C3SYEVGyxhswb4=
=DSg8
-----END PGP SIGNATURE-----

--ibvzjYYg+QDzMCy1--
