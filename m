Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7377B5A8941
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Sep 2022 00:54:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232628AbiHaWyV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Aug 2022 18:54:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbiHaWyT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Aug 2022 18:54:19 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C720DDA93
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 15:54:18 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id br15-20020a056830390f00b0061c9d73b8bdso11273707otb.6
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 15:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=H+Dbnr0lM2qSTGQ+7hidHGsW70Kb++QUe/VNRx5cngs=;
        b=jmWXSAf9CTZH11S+Aufz6k5OTyfBDLTt+cDA2ZlFd4IOZVWYRm1BMUYijce+rrJb6j
         kMRYIN8JH5Pw8tjJVRNbei1m2kc9zbLEgVUlEq8gcu3ZiJ/TkdvuZjWBFWLerP6wukVY
         u+zoMkQwaTllbiMQ1CrwOXcfm/iEW0QQ8XRW/BF1Qgno2Kehd+OpJpsh0I+MP1p1pfsn
         VEnKDm4gzcwACmWJSwmt8kj5yDkhY+yKs6zn10H8BvT26UgixYNjxMKCM/ANxdGS9InI
         eAD9LS3HE0vNfBf3X+YWXJrEFS9+A4FqgKotY2/gS2X2Ix5yIUBF7ShTPV4yAt+Tba6Z
         pIPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=H+Dbnr0lM2qSTGQ+7hidHGsW70Kb++QUe/VNRx5cngs=;
        b=OGVXNxArYszL7MXTAhIqhCSw+IdhRdmaGhTECCWpFbUlkFUmu7WdGb0XfK1z4Xha6E
         NeKdhzqh1xZ8LTmGMDVDFaPG20i9CKEzgqs3WIFFWzQtmxCiiH95QjFdt7zldMUFTAQw
         ZGThCmkf8kmpYKs34w0sDVYu54/SWQwkn+/Uk210l0RBlb3cWpeIuqFNqVs84bkzKLhN
         IjKIxwapksZB0mcMwJqo+D5VkW5YBTcJw55v04suLrlaCUkEClT975QiwNKLUg/H5G3e
         50CLRjlfRaWDh9sb5N9ZX2YBgCsUnYYMpCo8DGadFER4BqZ9TU0wZeMqrk9pXVE4v99X
         FrDw==
X-Gm-Message-State: ACgBeo05kuDq0xstrfJp7l0EQQNLguNEwpPrp/9Q0Lo5Nljzj5hnz5c/
        j8YOTA/SnSN+wQRWjVHGZVBx3Q==
X-Google-Smtp-Source: AA6agR7krbrq2JIJr7SYAoPfrE6mZsKnXKxKWdoE4fOo2Z65Hupdh15XygNy4QoXSNhC/s1nqp6ClQ==
X-Received: by 2002:a05:6830:611b:b0:639:460f:51c6 with SMTP id ca27-20020a056830611b00b00639460f51c6mr10908788otb.300.1661986457484;
        Wed, 31 Aug 2022 15:54:17 -0700 (PDT)
Received: from ishi ([2600:1700:5668:ac50::42])
        by smtp.gmail.com with ESMTPSA id t10-20020a9d774a000000b006373175cde0sm9444902otl.44.2022.08.31.15.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 15:54:16 -0700 (PDT)
Date:   Wed, 31 Aug 2022 18:54:15 -0400
From:   William Breathitt Gray <william.gray@linaro.org>
To:     brgl@bgdev.pl
Cc:     linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/6] counter: 104-quad-8: Ensure number of irq matches
 number of base
Message-ID: <Yw/ml7qWSx2UGfjX@ishi>
References: <cover.1660839809.git.william.gray@linaro.org>
 <9c386d163f765d00c1277c5c5c7436d1c9f6d342.1660839809.git.william.gray@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="QzyqMHAoFk0Jllu1"
Content-Disposition: inline
In-Reply-To: <9c386d163f765d00c1277c5c5c7436d1c9f6d342.1660839809.git.william.gray@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--QzyqMHAoFk0Jllu1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 18, 2022 at 12:28:11PM -0400, William Breathitt Gray wrote:
> The 104-quad-8 module calls devm_request_irq() for each device. If the
> number of irq passed to the module does not match the number of base, a
> default value of 0 is passed to devm_request_irq(). IRQ 0 is probably
> not what the user wants, so utilize the module_isa_driver_with_irq macro
> to ensure the number of irq matches the number of base.
>=20
> Signed-off-by: William Breathitt Gray <william.gray@linaro.org>

Acked-by: William Breathitt Gray <william.gray@linaro.org>

--QzyqMHAoFk0Jllu1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCYw/mlwAKCRC1SFbKvhIj
KxwCAQCGn+GD+iu22RYTdFvxJU7fWqaKpeXYKrY+iJFEJnoMxAEAre3OXqNHIyTe
wKd9hN4fLJnrKnZge8xRvonicHQSTg8=
=gsiy
-----END PGP SIGNATURE-----

--QzyqMHAoFk0Jllu1--
