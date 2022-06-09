Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3992F545097
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jun 2022 17:21:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344334AbiFIPVG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jun 2022 11:21:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236467AbiFIPVF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jun 2022 11:21:05 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29A31113A;
        Thu,  9 Jun 2022 08:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1654788056;
        bh=0Dt6SZaRlaEh3ePnun+pU3+JfubZBckoFXyh5O+eia4=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=CIbdp4QyABpKXKO5WNjVsQEw+xisecrHd9VV61jJwdj/ZrEgfeIbOGG4QQiaK/nsi
         +TAbhA6UDUROo0+gq0GUrQ/JkOoYRtvVyUi9SpnCWAtBz7iYcMTPQk0vt3QnaDX1B0
         3yA+X0fBQgxjOJ/k+Kur6ZaJ7t+h0kImeei+tiJw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.195.3]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MNbkp-1oNJnQ46QN-00P9rC; Thu, 09
 Jun 2022 17:20:56 +0200
Date:   Thu, 9 Jun 2022 17:20:54 +0200
From:   Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        arm@kernel.org, soc@kernel.org,
        Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/48] dt-bindings: pinctrl: nuvoton,wpcm450-pinctrl:
 align key node name
Message-ID: <YqIP1vYuLztSQR+n@latitude>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
 <20220609113911.380368-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="esvF/QK4g1mSKhTH"
Content-Disposition: inline
In-Reply-To: <20220609113911.380368-3-krzysztof.kozlowski@linaro.org>
X-Provags-ID: V03:K1:xvlw3Yufw4vkqgLcwcYvYrGxPvtGaNJT2LdX2lY7zPeFAgWdJX0
 lv+0H+PaCO/q6wcma2IPmsvG8awp0MY3q3AfCFUvY44Qnqk1C5AMj2ALXzMNE2bbENvggID
 nZK/XKWYCOcsXTrh/7iseF7jLvUEO1CgNakVGGOI8Idht6t3x3UxMsuOMpXuBxoPb3+bpz2
 D51Hc9krhhrr2gf1fqJFA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:NF6caO1+EnQ=:u/nkQjyIxfW7l+oL8nTGg1
 Vk5SXrZ5FFy+S0OBI8hLoI8Um0COTCVfL3K9jxtys7hyaztSlTxx5O3u9KIKbJkcE3EgzbFwt
 /A0Ngy8etnUCr9oLVjg2NALGmGh1STowMEHfjSRZgHGwQgfvVD/65F5AO1qd/g9KW5iOuPukT
 p4LmYsUw4ZAWhe/Clo5h5jIHe8rdaC1IMWQo8DNO7ID9QKOPp7Nme30zWBWQ9Iayonj91AmfD
 Rl0sJCgyBdJ8lQqY60Md0VHj/g2+AgInF6kGQJpoGo3YU5m+99os1e7QBC8clWUMYtMDegpR1
 MXZVP7B/6E+g/REhgDiTmeTo3dKt5k1J+fQMgY6Fg0xGpn0w7DWgaDVuKkaXW2GGqeIWOgiHU
 Gek3QM7YZSunM3wTOc9G5JpnrpSiwpjCfB4qOk4sRmKmMM+ATVvnK4Dvu8cOgFGER3G+xwV+d
 2vXpQEtBP97naEY7bHyZPMsHDJJzXju89YDNu8zUL8LIf8Y8M0o9rXFFe6Dcvs361AAReRxE5
 MEv69dyTPl/D0wCm7SkL5RrHhXNQU2KektGJTcdMVmzlrLNndj4fPuIIrdO6Qxvt/lMLvD8Rg
 iSBcQdrIrs1VwhJKHLrZ19wqZx9r06gVNrcqO4B8XfnC1xlTAUpB95a4jhKcjd2Uj54YTCxPX
 /FUcYD/fl0qyCsa4k5ZcpZOfYRT0OYXSNAFMhZaFogvtyLjJhM1Z5O974Th1vtkpHUkEx5Z3X
 HBJ37YdrSOINJya1FV8Ej8ogtRBZ6RPbwND+e0dh4LWJnIIunSTp4xRFUO7nCqqDLmC28Dp3Q
 fv4E2RuBXT9XL3M6XZhcmysBuHNLwaf4uFHG6Nu6u4ftXJNEuSxWEvHUITfKwvW6kHaqg7U2K
 8dZplLDWvNkZUtOZe9Dqbnv1nJeqrGErS7MIhWKPKwQXMxBXJe56F0yxaKcNz3exgWtQZNZUB
 oQ1q+6VEjlhXxgltJxGrwfcTt7fYHa/QiK3Vm3Gh1udIoR3RIcmtwW8wmM3BuDM1IKzbncBlr
 yyLnrxb1BuVRiFSmw6WVDREZMQfrm8YJEuzLvMw7uejSJHISs+iBxf5GkJwCz71y0JblYOo+B
 coYjkhq1zqUpfNGVyuBP7PLZhDSpGvGS7DPxY64ZWoSiWl+Teri3zbxrg==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--esvF/QK4g1mSKhTH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 09, 2022 at 01:39:06PM +0200, Krzysztof Kozlowski wrote:
> gpio-keys schema requires keys to have more generic name.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pi=
nctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinc=
trl.yaml
> index 47a56b83a610..4c7691c38b10 100644
> --- a/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.y=
aml
> +++ b/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.y=
aml
> @@ -152,7 +152,7 @@ examples:
>        pinctrl-names =3D "default";
>        pinctrl-0 =3D <&pinctrl_uid>, <&pinmux_uid>;
> =20
> -      uid {
> +      switch-uid {

In this example, and more importantly the original copy in
nuvoton-wpcm450-supermicro-x9sci-ln4f.dts, I think button-uid fits
slightly better, because it's a momentary push button. (Still arguably a
switch, but not one that would stay in both the on and off position.)


Thanks,
Jonathan

--esvF/QK4g1mSKhTH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmKiD7EACgkQCDBEmo7z
X9snhxAAknzEyrKCSN7rjNKyP88u2Tkm4hoqsO6+zpWTQ2E6/0qSwhjhk7MjV1eS
2LWJEbWS4hPTPHe2pb8VytTDYmpjijpHIfGsT0euLbjh4YMY7KldVmaxtSxl8F3Q
OoSdpQeJje2KtfOaTDxQpYG/k6f+OyYbgIh2gvGpRls/FtgT3HFMKi5zLWk/hZt/
7bbIJGyDGUXc6ZUlMleOw2ea+sF4ch3bBrz1cma0B6xAA/o3ymLvhZw9NS3h2CFA
ETLd9vfWSXLd6Cuy5qtrk1edITIZyWzg/148GNp4HjwgYYCjxRp2JjSousFbEvwb
mmRwRjWSqu9zs8gyFO7DO4Yiw/D7F/d9PHJjIDCyeVIJS7hFrEAQPNAkkhWRMRdv
p/RXiCwEIlFU7ueesiLmLNgNi3FdJmGqaZ2uKtgTYt/ABqM06UwynRft2M1BocEM
M6NCtde82eBsMvd2E24vEPbZG7QUzyqcA85XoXhBfrLcLPUeuZ/+6TAWpnB4GqBx
V/Y0z70yfbvCBdWR2Lye0k0B+Byoasnane7/Hb+bwYvFqYVL33lmDPyEbg4qsGE7
7J3xEEnuxgeypTTnBygegioy4CBZRvRfrSntuxRz1CAy/KPtGt+BU+7fxPXjYxcF
aeIoba1WUgI8E7DnYHxiIrF9bmEvk4JC9XlySKy8QI3/cZAv9I4=
=i3Fi
-----END PGP SIGNATURE-----

--esvF/QK4g1mSKhTH--
