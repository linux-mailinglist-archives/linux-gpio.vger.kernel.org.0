Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD8AE778D8C
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Aug 2023 13:23:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236359AbjHKLXl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Aug 2023 07:23:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236391AbjHKLXk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Aug 2023 07:23:40 -0400
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D55C8270F
        for <linux-gpio@vger.kernel.org>; Fri, 11 Aug 2023 04:23:19 -0700 (PDT)
Received: by mail-vs1-xe2d.google.com with SMTP id ada2fe7eead31-447a3d97d77so769958137.1
        for <linux-gpio@vger.kernel.org>; Fri, 11 Aug 2023 04:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691752986; x=1692357786;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lv+vyUR/iDrFWpNn5L3Z/ySLjn32cAxm1edMyZdQk+A=;
        b=nQWlqRLCTEqRmeYDChWC9zfVO+Rb1+9Mdx7Szo/ZRUWKQO6TBfPZIkq0Fta3d81C5Q
         WY4c5QC1VIlW2CJ0qsyFrxB8W/7G4Tr6F0rmf6/HVYk0vCecqqsYV4wl8BQnzrgBX58m
         l6NVxYdHPIgW3vA4/uVEeoMjDSU7qYp+FyHQrpKPxqYcjkx8MKSIPp99g0Yy2iqKXiQZ
         vC2HYX+IoaaY3NdiUE45vtYlRqLUPq7hBLsshLEW+lNLssDfs9s9Tfcctv5cAzywJibh
         6ZvMWZRvd4IFkVewDO6pHWOBLEGCn24klvu7JXKjBPcUpQjELSxKg78QWYSMNbVRsnE9
         MBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691752986; x=1692357786;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lv+vyUR/iDrFWpNn5L3Z/ySLjn32cAxm1edMyZdQk+A=;
        b=XnzRu6jiYwD7w2dGaP4cHqISuULLi1nOgrn9BKVYukAmsPEucT3vozFoszF2kV7gjj
         wfP+XX5OOTp4UwbegauZS2OrUOZeWPjr/qyZWJVs20TliPbEkHE5z3LCdrp09hmYomEv
         D7ow1u3n2C4zbkyEdvMjGFQ8QSXGNywELP2LLA2uFDld5qZ644k84N/2Dx5SFVdpWJHI
         ErIioysS12fchZ4odwp3u0bg1wsS1KNZWNSN7Yt1IDCNaen76/lAltgjgXOfDYuGK/An
         PyDnKn2Y+ph5dtgklZpDxt6MqBuQLUQuo2bWyifaKi3+BnLZLky8QyKHU9s3uMUhfbZ6
         0uUw==
X-Gm-Message-State: AOJu0YweS0dlSMU4PwCv6rDk1h2tR47SyGlC7Jq+RU7BbA2i/W2B4TRY
        mU30MDbwyCFQMXtgg5M0b4cEYw==
X-Google-Smtp-Source: AGHT+IF4wNEGDOEiYLWG0d95LtvJeE8wN5SUJuqdoeUseoOT2FlTMaRDxCAlfeGTas6jdcxvLbg7XA==
X-Received: by 2002:a67:ee5a:0:b0:443:7503:a534 with SMTP id g26-20020a67ee5a000000b004437503a534mr1222064vsp.16.1691752985884;
        Fri, 11 Aug 2023 04:23:05 -0700 (PDT)
Received: from fedora (072-189-067-006.res.spectrum.com. [72.189.67.6])
        by smtp.gmail.com with ESMTPSA id r2-20020a67c302000000b00426768819d4sm541323vsj.3.2023.08.11.04.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 04:23:05 -0700 (PDT)
Date:   Fri, 11 Aug 2023 07:23:03 -0400
From:   William Breathitt Gray <william.gray@linaro.org>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Paul Demetrotion <pdemetrotion@winsystems.com>
Subject: Re: [RESEND PATCH 7/7] gpio: ws16c48: Fix off-by-one error in
 WS16C48 resource region extent
Message-ID: <ZNYaF0bghMQp4+Pl@fedora>
References: <cover.1691703927.git.william.gray@linaro.org>
 <f20243853e94264534927f2cdf9288b869e7e03b.1691703928.git.william.gray@linaro.org>
 <ZNX9Oo2AOASHKOPZ@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="o6AHCCJzQpZ6h7SL"
Content-Disposition: inline
In-Reply-To: <ZNX9Oo2AOASHKOPZ@smile.fi.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--o6AHCCJzQpZ6h7SL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 11, 2023 at 12:19:54PM +0300, Andy Shevchenko wrote:
> On Thu, Aug 10, 2023 at 06:00:44PM -0400, William Breathitt Gray wrote:
> > The WinSystems WS16C48 I/O address region spans offsets 0x0 through 0xA,
> > which is a total of 11 bytes. Fix the WS16C48_EXTENT define to the
> > correct value of 11 so that access to necessary device registers is
> > properly requested in the ws16c48_probe() callback by the
> > devm_request_region() function call.
> >=20
> > Fixes: 2c05a0f29f41 ("gpio: ws16c48: Implement and utilize register str=
uctures")
>=20
> Fixes should go first in the series, but I see no conflict here, I hope B=
art
> can manage this when applying.
>=20
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>=20
> --=20
> With Best Regards,
> Andy Shevchenko

Bart, if you encounter any issues reordering this patch first before the
others, just let me know and I'll send a rebased version with the
appropriate context adjustments.

Thanks,

William Breathitt Gray

--o6AHCCJzQpZ6h7SL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZNYaFwAKCRC1SFbKvhIj
K53tAQCmfMIu4VjYvVibria+Kya/aqVior9d1mzupq6Ji2p1wAD/fmQr8RVuFrSq
sz5p5w7BA/mPTBdb2TrUZlNjOX/56QA=
=O5hu
-----END PGP SIGNATURE-----

--o6AHCCJzQpZ6h7SL--
