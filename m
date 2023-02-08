Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06B3E68F24F
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Feb 2023 16:46:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231277AbjBHPqi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Feb 2023 10:46:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231187AbjBHPqg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Feb 2023 10:46:36 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B837BAA;
        Wed,  8 Feb 2023 07:46:31 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id bg26so13644271wmb.0;
        Wed, 08 Feb 2023 07:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QU2t04Vz0L4YBcL3LbO96riKtXp80tCkHBnfxGNCEIU=;
        b=pEbS3Me0KO689JUNk9hXzyEDagcWuorGVsaPjPMzRcCp/8R9MjQzAkS17PvvYwQFj8
         LJj3rOnowahYQHDNwvPjaOnG1FGvuFc8dLIFa0GxuJbhi3UMqm4q4FmVwdmKVnQD9GHe
         jto5qCK/KxqcVR9lGwA1JXPc9bdkQ5nwmmcuel7T3BZIZTNesZxidKWo54sWB6j58HUr
         i8LK+UctQo5Zy2ooHtJNTN5aU+vdF1fCy9iNivxyKvvskM1JT2Wnb6lnQRIHQGjzmp4u
         9DYeqMu04CxR7qWJX7U3gANfSMxNfljyZNQ8Sseb7UDUlc2Eus/goaasMRQS5CUrn0YX
         ohNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QU2t04Vz0L4YBcL3LbO96riKtXp80tCkHBnfxGNCEIU=;
        b=0+v5PBmxB4h+hJ++TZHbj5sQ1pTDGKxU39MKxDSRfpttkXt5RIy2vEA35bqcLV3qBA
         GnHLioe5pRZq6J7nNSmmCuSxp3d2R4ZQCH205sICF7+yUKkXmNdnPSm9M2+tPaE4yi8L
         Xvh4US+S5+7XEF7MHVPi9Cg6lEgx6sMofOWgV/8RhbfDsm2+5MMsDPohk8errhGXo8bk
         Cv1QfBmbzQY9JL5gxmGYUCVl1UqV5RI69lBrTV2OeANuu7ARnB8frwOJzwqgTAEegR0u
         3PM58hgd6wqwzR4LWcnDaCGIN7JVZSYSROzPeNgfO+WIPvZF/q06XuRpe5N4ZOV/nHq+
         n9JQ==
X-Gm-Message-State: AO0yUKUc7VoUOnIC4iuqh89wdje+vnyBz04MTftmsl5JLhmqFbeRqX19
        iySjcG69U2+5tSzjEOwoKNU=
X-Google-Smtp-Source: AK7set9PpKIxdxDU92yb5BTSfyg4MbnoxWJ8jiFk8RIH6B+9+Ow5++VbYuslJwDrpp27azxbKudn/g==
X-Received: by 2002:a05:600c:1898:b0:3df:f7ba:14e1 with SMTP id x24-20020a05600c189800b003dff7ba14e1mr7732827wmp.8.1675871190204;
        Wed, 08 Feb 2023 07:46:30 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id j37-20020a05600c1c2500b003daf6e3bc2fsm6368834wms.1.2023.02.08.07.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 07:46:29 -0800 (PST)
Date:   Wed, 8 Feb 2023 16:46:28 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Prathamesh Shete <pshete@nvidia.com>, jonathanh@nvidia.com,
        linus.walleij@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        smangipudi@nvidia.com
Subject: Re: [PATCH 3/3] arm64: tegra: Add Tegra234 pinmux device
Message-ID: <Y+PD1M6eC1QqEq7o@orome>
References: <20230207115617.12088-1-pshete@nvidia.com>
 <20230207115617.12088-3-pshete@nvidia.com>
 <f0d58e5b-74df-26cf-592e-302a00d08eee@linaro.org>
 <Y+OAthBgds9InvKp@orome>
 <7bb3e201-954d-c8eb-9430-19626c43fe75@linaro.org>
 <1dc0589b-2434-47c5-a1d2-d253b06d3a67@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kznfj9f1arh8i+uH"
Content-Disposition: inline
In-Reply-To: <1dc0589b-2434-47c5-a1d2-d253b06d3a67@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--kznfj9f1arh8i+uH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 08, 2023 at 01:06:02PM +0100, Krzysztof Kozlowski wrote:
> On 08/02/2023 13:01, Krzysztof Kozlowski wrote:
> >> I wonder if there's a good way to detect these. We'd have to run checks
> >> on the DT source files, so that's a bit difficult. I do have an
> >> experimental script that tries to capture some common pitfalls on
> >> sources but it's quite ugly and slow, but I guess I could add something
> >> like this. But perhaps there are better ways?
> >=20
> > One way to easy spot them is to override always by label, thus every
> > node defined like above is a new node. However I think we talked about
> > this and you do not follow this practice, thus there is no way to tell -
> > is the status reasonable or not.
> >=20
> > Automated tools could help here as well - run fdtdump on DTB and look
> > for status=3Dokay.
>=20
> Eh, obviously it won't work - every node which was disabled in DTSI and
> enabled in DTS will have the status=3Dokay...

Yeah, I was originally thinking along the same lines, but when things
are overridden that check no longer works. I suppose DTC could be taught
to check for this when it merges nodes.

Thierry

--kznfj9f1arh8i+uH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmPjw9QACgkQ3SOs138+
s6GkwRAAkRn3zAbCODESQbqwSh+94YN9rvV18HbC7A5VXcR2IVetIFWim6Pvsh1F
UHk7bwvlJqfsxmRnMr17UIVfIfhGzYB0QDj2Bynvb5nk2tYdSripecGq95mbtIPV
d1wjzcHn+UkpFKP8hYzWqDn8w2fOHWqfllMVV/4z2j9zIAzcFatTQ/oYyKlPBSd1
SDur8hIQ+VzXFuPGFlJKlqOPq7jwacZq123MoNzYo4Fye2kjJHyKZ7tHA4FEkUdi
x2GxRg0b/nCkeTMWGxk0l/A9+nGqhQBpkovPUnwu+0i1jscQ9kDTqyu8OM85JitU
fk3XwtM4o2kN996MPkNGiZGpIae0RtTDiM2W90MF7MR1Bo6B2Oez8an5918Gr5ao
2GHxC12UTwLbLUcsrKB0YbHokaavoFglYbFelJ0bvmFhI9yRnBoFPcgEjBMCEoYe
8oTUpZ6K6hXrJ9tpf9uD2XfrtcXHrIVQZMjevNAlQ4tY6IVreuBs1C4xE/URpJWv
y34sVLqu6Eum/R360fXt/iENuaF4ynF9lX+P38fRzHZuQ5m7QXy5Xt9Yl8zUjmk/
1uj00qrbQ+GQiD8VVt+gYVadXNZPUOrEXogcmt9grQ/6RHY/6uR+j4CxGn3pQhy/
l3+3AsaUEUF5uXLmtWjyuPjRpDDl6lXqQWE+2x1diASq4/2bxxw=
=sh86
-----END PGP SIGNATURE-----

--kznfj9f1arh8i+uH--
