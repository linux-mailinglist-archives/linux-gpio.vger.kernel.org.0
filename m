Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D49355A893E
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Sep 2022 00:53:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231700AbiHaWxu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Aug 2022 18:53:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231672AbiHaWxt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Aug 2022 18:53:49 -0400
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E4DFDD764
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 15:53:48 -0700 (PDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-11f34610d4aso16857922fac.9
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 15:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=Ai/qDI1gAj3tYkz4WQDadru3ljd+swz0ua3ixXVzhvs=;
        b=d7rkRKF1yge7T3d/CaBhaUxI6X8fBbNXZzKR+EABybflE1qcfk0ui0karhj7XMZDuA
         zBa5ca9jRXStBHygbuJ4i8pkoyWIaoQoXRDB4tlh8br7x+xfDgg9V1dytOe0n+XQDJfb
         1pCQc3dQKUMkwqbucxgph5TjqerqFz2XFGuhFgSQ8YxkwkbUBTGZGJiULHy+YXzREDkM
         KIJ9UvMC6YxTzE31MUGT5vpne7X9rRwRIbXCgbbQWXV9+7dz9FBQUUIsIYQbRA05iBVV
         fIPmhq2drppIsCeb6b4kvdcVK5Etl9UV++2Frn8NijaZsn/i0Nn+J+0q52LxXaHIrxHO
         w9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=Ai/qDI1gAj3tYkz4WQDadru3ljd+swz0ua3ixXVzhvs=;
        b=ExpnWj8dKfKfMIbFEDirR/m78l52tjItriR5nh7nToq7gZGOnI3Xu3ayeYtUxsN45s
         XiGKtHLozUj3pC8pbLkfdBFpgTjZuiwCN7QvWv8YKGKJZvzAMGHUTd0g65Kz/+5lKRW4
         vQw8Riu3mNtl461HzR5A22Bow+B8/qckDEScMXGrcQ23eZ/tfP9a8gy1XLb2jsKdxCgP
         0R6kOu77OJIY7AFr1Q0ujlUyoRYkPuuwYI19SuY5UvczaQ0+nyxR2TN6mvyfD5ncRTlY
         qTOEyfySdfC195RdhzqPLiHsWq9MRrUNV28AaODudX8XdKK5cUDgyr8MWw6bTqs7nR40
         Wg/Q==
X-Gm-Message-State: ACgBeo2AcUUbCK9y/ipBH0p5I+loHnPganoJl9cDyYoQcssUqNtwCoG3
        V8VR7aO4tokHtFP1tvZ/2cL1pg==
X-Google-Smtp-Source: AA6agR7UXP6hrN0BTjAnkF008IroTUYcqnNjgTe/ybUa/Z1HLHk3JedacrysZSojatJoi8+abUB2rA==
X-Received: by 2002:a05:6871:154:b0:11e:33b7:ddf7 with SMTP id z20-20020a056871015400b0011e33b7ddf7mr2532013oab.116.1661986427451;
        Wed, 31 Aug 2022 15:53:47 -0700 (PDT)
Received: from ishi ([2600:1700:5668:ac50::42])
        by smtp.gmail.com with ESMTPSA id 22-20020aca0f16000000b00344f28a7a4csm7880884oip.22.2022.08.31.15.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 15:53:46 -0700 (PDT)
Date:   Wed, 31 Aug 2022 18:53:44 -0400
From:   William Breathitt Gray <william.gray@linaro.org>
To:     brgl@bgdev.pl
Cc:     linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/6] isa: Introduce the module_isa_driver_with_irq helper
 macro
Message-ID: <Yw/meB0ACIPsU6Tw@ishi>
References: <cover.1660839809.git.william.gray@linaro.org>
 <016c8d87cef87a1375e53f1c97c41d8b969f8d79.1660839809.git.william.gray@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BCnalRxsY6KmFLiL"
Content-Disposition: inline
In-Reply-To: <016c8d87cef87a1375e53f1c97c41d8b969f8d79.1660839809.git.william.gray@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--BCnalRxsY6KmFLiL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 18, 2022 at 12:28:10PM -0400, William Breathitt Gray wrote:
> Several ISA drivers feature IRQ support that can configured via an "irq"
> array module parameter. This array typically matches directly with the
> respective "base" array module parameter. To reduce code repetition, a
> module_isa_driver_with_irq helper macro is introduced to provide a check
> ensuring that the number of "irq" passed to the module matches with the
> respective number of "base".
>=20
> Signed-off-by: William Breathitt Gray <william.gray@linaro.org>

Acked-by: William Breathitt Gray <william.gray@linaro.org>

--BCnalRxsY6KmFLiL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCYw/meAAKCRC1SFbKvhIj
KzOuAP9e2bQgKC+JFuwpMWwwSxNb1PwBKPtuYdvrK261drQztgD/cPcq/jxWnvRp
6CAo2OnoZv3Gx4/ZvlM6rPhUYNZ+BgU=
=kiZB
-----END PGP SIGNATURE-----

--BCnalRxsY6KmFLiL--
