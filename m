Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 479CE44E4AF
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Nov 2021 11:35:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234325AbhKLKiG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Nov 2021 05:38:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234144AbhKLKiG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Nov 2021 05:38:06 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF377C061766;
        Fri, 12 Nov 2021 02:35:15 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id r8so14608378wra.7;
        Fri, 12 Nov 2021 02:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QdoNIfuooUxGvM1/b5JFfH6vaJ2XJ2d/YPwKErmo22w=;
        b=ZPgxkQUMiQOxckL/6jdYj8UN9nOtMnrBoPRPrAHuKl24iZ16hoa0TD25SSeI/A3t1d
         mMwyuya5j23x/hQEu4yaGDgE3D/bkOwFW5yx2lL92e+Y4rB3kFcQ+heHYBIzuUbPcRyP
         lJqhYbQvYMI8GTe/V/maTuljtel/Q3iXy13qCpeQRXiYNTX+oV5vVIeThjONtC8ES9JD
         ntXYqf0ZdouUhrYFDa9lB8xMBDUa/fiVspFvlkD9jGqlFW7ymFpGZ1qhFSGyVH3Ciu4Y
         JxHau8NizF7X/GeORz0fcGxnYgB0ptogucnbFXKk6/+ugsrhWBrRw0HZ2lTafD8x5Zp5
         L74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QdoNIfuooUxGvM1/b5JFfH6vaJ2XJ2d/YPwKErmo22w=;
        b=MSMe/LZXr5iSpwhxTaV7IB/Ddk49uMN5pb8Es7/HNT+ij0m39fGqJqM9tJTKElvPCk
         5/8168oxbJqdVvGnsMbYOidGU92ahe06qFsPAc2dgExzYCVZP1T+jZo8o7jriR3K+UDZ
         /iZ3Wc25ukgUKzr2DQWysTLoX+0ecf01Dbmq4GQR0tNJd+c0YQ8mWbm7SdTXC7Zu4cr4
         10HBD+CuRjXpRC3Z8caE3zC+Vsm1UbbufwV9pRLys4sGcoVW7j+gjn5YETObMWYyEwsR
         KpPvs7mLPkT0EZzJRJIHlIujhnVMGpa+6lQcVCEcMgKGl4EzFU7CVsPWCstwTefCsZbl
         eWaA==
X-Gm-Message-State: AOAM530yYcgHMJIkTry30fSX7qDZMvWBmadbDXcN35yhjeHNeWX9xl71
        aonvaxLU+i4BA9Jr7f4ugT8=
X-Google-Smtp-Source: ABdhPJxv6PsU9fthoNFdX3tDvA618t/AN85YWs8Oi5s91O6Iy+wiEahdsLUu220uNmi1omEHX08dDw==
X-Received: by 2002:a5d:468f:: with SMTP id u15mr17174462wrq.171.1636713314393;
        Fri, 12 Nov 2021 02:35:14 -0800 (PST)
Received: from orome.fritz.box ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id m20sm12117707wmq.11.2021.11.12.02.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 02:35:13 -0800 (PST)
Date:   Fri, 12 Nov 2021 11:35:10 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Prathamesh Shete <pshete@nvidia.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Suresh Mangipudi <smangipudi@nvidia.com>
Subject: Re: [PATCH 2/2] gpio: tegra186: Add support for Tegra234 gpio
Message-ID: <YY5DXh6MdmSFXHhB@orome.fritz.box>
References: <20211021123021.9602-1-pshete@nvidia.com>
 <20211021123021.9602-2-pshete@nvidia.com>
 <YXq3/1AXX7KiwpTy@orome.fritz.box>
 <YYE7aXo0mfCfCqGF@orome.fritz.box>
 <DM5PR12MB240697948C6DFF64E45AFF00B78C9@DM5PR12MB2406.namprd12.prod.outlook.com>
 <CACRpkdZto=5Pa4r7-eufUqteaJS5yYeTL6Oh8mFO_g=6RzV+mg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="aVodid0IcneiqicN"
Content-Disposition: inline
In-Reply-To: <CACRpkdZto=5Pa4r7-eufUqteaJS5yYeTL6Oh8mFO_g=6RzV+mg@mail.gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--aVodid0IcneiqicN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 09, 2021 at 01:30:38AM +0100, Linus Walleij wrote:
> On Wed, Nov 3, 2021 at 12:01 PM Prathamesh Shete <pshete@nvidia.com> wrot=
e:
>=20
> > It would be helpful if you share the update to the device tree bindings=
 documentation patch with me I will push all the changes together.
> > OR
> > Can you please resend these patches along with device tree binding docu=
ment patch that you have.
>=20
> I'm just gonna assume that you guys sort this out and I can see the
> combined tegra234 support in v2 :)

Yeah, I was working on some other Tegra234 related stuff and I'm about
ready to send out the whole set, though I will likely split it up a bit
because it's quite a few patches and not all are relevant to everyone.

Thierry

--aVodid0IcneiqicN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmGOQ14ACgkQ3SOs138+
s6GHyQ/+KiBJwnOJCZ9FAjlW235POgJ8cDk6kiJ9ARWHs7T3/PvPab5BBtVGEWju
Mv7eUorj0AoWSTp6a/4PCRPJarVW1En/wBkn0PdQvPvpFTVx/QSEbZ7Qtshfpsa/
kQU7Q8XXz6Yhj6BnmGpOE+hCXPTjUSMTyHBX2/mPJEQH1bmDKF1hgDcf2g2O1uT5
t/IvcoBMyYBB0Pdvj7LWGOq/vwrS6lm8xUYwyvZL8l8P4zo/t48Ea0Y0vk2Fk03X
6Z9Bd1ozTzrjQcY43ufQIswzQhpzGdPnLSEnkQCExbjCFtGd/yk6HCLbpmN9S/Rb
s4zHmq/hHezeLHhS8iLAaiXxoRpfLwsNBkqLInC++AC1ZprWIiF08Fxdxp3isQ3R
nxD0U9jDTwj9on7FxBUFl7MNE8mYQ8pifnJ35nEnrLSaPyL3kGqjRVrl2NSdcaYW
EOTGZP1QgkqNlxSfC+f04hrlDW1xdAJ4zfpceglyu0k75GUyZivu20M3n1UPaBts
erO3wL/jLS15b7C0JhPJgS99KqMBll8N6EyNzJzBhlB+j7+X8g+kUmZSjkeIfVL+
HWFrOQe2oXzrZEj1GU1Efkiuf/J+6lSpr6+yXqiQttmhDRmQolMSmkj8use0HANf
1koXLqqDS9Av6P1f6ukgovXdj2DQK2afCJzAAtwH2nZkO753WsI=
=p0li
-----END PGP SIGNATURE-----

--aVodid0IcneiqicN--
