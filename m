Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C970441122
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Oct 2021 23:10:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230125AbhJaWMz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 31 Oct 2021 18:12:55 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:39354 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbhJaWMz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 31 Oct 2021 18:12:55 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 336E71C0B76; Sun, 31 Oct 2021 23:10:21 +0100 (CET)
Date:   Sun, 31 Oct 2021 23:10:14 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Collins <collinsd@codeaurora.org>,
        Hector Martin <marcan@marcan.st>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/11] Initial Fairphone 4 support
Message-ID: <20211031221014.GA9558@duo.ucw.cz>
References: <20211003083141.613509-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Content-Disposition: inline
In-Reply-To: <20211003083141.613509-1-luca@z3ntu.xyz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> This series adds basic support for the recently announced Fairphone 4
> smartphone, based on the Snapdragon 750G (sm7225).
>=20
> This adds support for UART, power & volume buttons, screen based on
> simple-framebuffer, regulators and USB.

Thanks for the series. Can I get you to cc phone-devel mailing list
with phone related stuff?

Thanks,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYX8URgAKCRAw5/Bqldv6
8jWnAKCHqQSfXgXXVDfSwm4ridQrLFPm0wCgruyHskCV1UTP7C80FeP5ACsVOY4=
=tFXz
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--
