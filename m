Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D92A8565C91
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jul 2022 19:02:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233550AbiGDRCf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jul 2022 13:02:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbiGDRCe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jul 2022 13:02:34 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA37F1208B;
        Mon,  4 Jul 2022 10:02:32 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id k7so14263256wrc.12;
        Mon, 04 Jul 2022 10:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=z82aL/Z1CXTQz4v6/hPMIuJjTWs4ayA9TiCruUev6RM=;
        b=UAH9r7qJtpPOyTo3FV//mt/iTNOUZFgXQi6SshvyeQgYfxc07CYh0atUE8/DUTPj0X
         mk9H0XZmoQ0YvF2QYcYEaABwj40ThwhyrbOxxw8pu6FpFR1WkkzMIpow+D22XJR0/AJp
         prXiA6kS/wg6pIe5wcAydMIn5/Jxdi8XNqRggPmt0oXYpWqTFc6kZsLdcgoxhlZKci+Q
         6+dpOgu/R91Xbr+SkM4iLDEuzOWHwI86BLI2v1uwhRrvoFUn8fio3s3Et/mNm9d0Z1Xv
         GfIQChhrjbrRbCkqIyi1mTMayQOE0T5bJGljnfVe75KJ+Q6pm9vNds6pMh390nyzMsTB
         QrSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=z82aL/Z1CXTQz4v6/hPMIuJjTWs4ayA9TiCruUev6RM=;
        b=SzlSn068WoqD/ptohWC14zatmLbhxjw5vupUPLvYzeNQb5wqesSF1ztWyTk62h93f4
         JplKiN5F345ZuC6f4xAh755J+LxgiBbIY7E4e/0oYsI1mWVJWZQu75WqW7i4Z1fkgtyQ
         zJhFIH1+O07QPrW8BCxV+8q+6ZpMQHVa/jut4DQSS2xB1HsWteI3ddAg32jL3HDChznE
         NPaFpgCfQkUrBIhKGTW7g++0gtLlsjRszaGpmFg6n/0Wppxc+obODj3e3MUKJxvbQB6f
         ZZQjQvfPRRwIwq0lyWnvbVcRYuZi+Gy+M9PlllJ+g/NJn1KaMVN1673DwuwtrdTk3dJV
         1Nww==
X-Gm-Message-State: AJIora9ncBoS4rbBiG6SxhqbxiB0P3lj2koHKFTvnrEzt1Rz/YkPgSEn
        uGoXYJduNP3hbevx7qVtLr9ESF3kdlg=
X-Google-Smtp-Source: AGRyM1u7z9aqp2KBXtiGTgRUejIf6ywzubkfDy0AIqamXcdqI1RBR9rZOFpHM2jIm7YPlC2ea0c7lg==
X-Received: by 2002:adf:eb0f:0:b0:21d:2f1d:8e40 with SMTP id s15-20020adfeb0f000000b0021d2f1d8e40mr25470104wrn.207.1656954151343;
        Mon, 04 Jul 2022 10:02:31 -0700 (PDT)
Received: from orome (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id i30-20020a1c541e000000b003a032c88877sm16235907wmb.15.2022.07.04.10.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 10:02:30 -0700 (PDT)
Date:   Mon, 4 Jul 2022 19:02:28 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: pinctrl: tegra194: Separate instances
Message-ID: <YsMdJFp+NZoSOTZI@orome>
References: <20220701150501.443296-1-thierry.reding@gmail.com>
 <20220701150501.443296-3-thierry.reding@gmail.com>
 <20220701211925.GA1550339-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="1kzR0KqCRcyJsE4b"
Content-Disposition: inline
In-Reply-To: <20220701211925.GA1550339-robh@kernel.org>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--1kzR0KqCRcyJsE4b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 01, 2022 at 03:19:25PM -0600, Rob Herring wrote:
> On Fri, Jul 01, 2022 at 05:04:59PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Tegra194 has two separate instances of the pin controller, one called
> > AON (in the always-on domain) and another called "main". Instead of
> > treating them as a single pin controller, split them up into two
> > separate controllers. Doing so allows the mapping between the pinmux and
> > GPIO controllers to be trivial identity mappings and more cleanly
> > separates the AON from the main IP blocks.
>=20
> Doesn't this break compatibility?

I had added this paragraph to the cover letter:

  Note that while this changes the DT node in an incompatible way, this
  doesn't have any practical implications for backwards-compatibility. The
  reason for this is that device trees have only reconfigured a very
  narrow subset of pins of the main controller, so the new driver will
  remain backwards-compatible with old device trees.

I've now added that to the commit message of this patch in v2 to
hopefully clarify that for posterity.

Thanks,
Thierry

--1kzR0KqCRcyJsE4b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmLDHSQACgkQ3SOs138+
s6HX3BAAnHrMYOsCdJEoFzMwNgY/EHbYNN6ysSVZRbDkPVhJAtLks0DTQ6hQBZJj
VcDnObYUOJhx4xwS1kJW7Z8i9Ix3eTt/N9T8yR+YQsgMes7DFL0TtEW5lLgFY52Z
3+RYTsk3mCgaAIQqgjOA0i1BxmM/sm9mIFh3ziIHj4oHkTxBXz+W80RdGrJ7flqq
Bgdp+TZFH4jScC+U+6ocedD130mvhpW5q2EJsctL1JH8UKHXw+rUs++xoLmpVWZo
bgwg5Pt4+MoYzIv8WG0MXrNZ9ezkibNLDLoMLwy1p/4nauHWgGptUbITyL+2pW5O
JC3V6hAULET6DYYk/y86qBH5k1kpauiCXIG1SHpeEXS7jzhD3bDguHRgU7u5QqnS
H5hLFCn3G2d6PZuVgVoJSbPxHCr2JrNc40tBwvvEd6cJSWMinTrtGcStGRbbDapU
xsu7x4CFrx1FZTV2FBeyywV8VUDXYsdHcl+fGPm3WDWqULp+P2fT9WcXgvOgxC5U
gRZcY5onCbw9o+Hixjxv1yQp6yoGzqLh0YF6IdPoC/E1lprf3JMn9ovh5xV0QbCK
zTvmHsR1zM3FS445sXS3IfEVnCX5N7O7wBgP5F6qtOEREeq8Mxa1SGjZU8UN9LRG
6DpBsDFZn/ydj6sUO1jAF9ATohcrRJsX+eT+h9uLPGPJnwbBbrM=
=W9kY
-----END PGP SIGNATURE-----

--1kzR0KqCRcyJsE4b--
