Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0380D2519BF
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Aug 2020 15:36:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726347AbgHYNgF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Aug 2020 09:36:05 -0400
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:47289 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726413AbgHYNgC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 25 Aug 2020 09:36:02 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id 99E0CC6C;
        Tue, 25 Aug 2020 09:36:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 25 Aug 2020 09:36:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=z304t3NNImtKTedWsKSTK2MlwX3
        39XRmUWyjrn7gxpk=; b=IK+l0L+Hd3O+vvZYSiawNhwgYbHqP+mV4XP42aKEgj1
        +bx9mecjcsRutJGvkU5emoSbA/FGPdLK38DQtcIOBumKVZrEDHXmg2Nq3kL0BTbC
        AkmY9LHkrG0FxujMRYbhe8mVJOWzyPqWJfLYjJ6AJUMT6JbU+buxw8vEA38iZJkM
        /o9ORpNnTs+PbJSNbrdVm+pmo/UgeYiH5VyX7L+rkjtur9Yv2TR4hy6G8JeYRfLw
        UnFiCyp6sFSJo2Uh5Y/q6SjibiOZ3pvpCP3rYfcceeyVYp2E52MALeW2fKy9P099
        s2I89mkVDkzQ+E+XYtE1/4hmxF0eSIdhlSsOzSsCeRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=z304t3
        NNImtKTedWsKSTK2MlwX339XRmUWyjrn7gxpk=; b=VRHvi1x4CFIpaCNXTnlZv9
        2t9YFXyPoZGRQbruRC19c+FZE1qHmnGg7KpBN4RCzodFYEar6YYvz1gLp+Gn8z1X
        7G5PJLVdw3Ig1VSBLEdBJE/JhAo26GC9gMY0hw1/wqkzPF07x2BspW1wJxLi1CCO
        yUA3jKN67Y5TDE5FWaCR0+3Fhsx2e10SCN+O9Q4xpzWgl1wLxKhaNpBo/PL628PP
        OUNfF7hQ3wJgXwtG1zJlnGmmnxOqI1AOBeF8EOuW0Qkn8bIgLcD40de/fELtCDXu
        ss5LOr4N7A1Bw3wyE2RNM0rXKmag6W69FmiiRdJBUvzi2mkIgQnJKXzYUqrg0OvA
        ==
X-ME-Sender: <xms:vxNFX8GjzVzSHLlSoXp6L4O4EiiNEuztoifT5V9zIE37XvCOO7fREA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvtddgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepleenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:wBNFX1U7kOAQcgFYe8wDXXJKAxDbq_YbFvfz7GJK6t_llvcAeEAv8A>
    <xmx:wBNFX2L5c5K3SEf8hErDBsq2S6PvTW5VwCTN4besKKQ2iZDBLwCJuw>
    <xmx:wBNFX-GmqrR73lfMj15sdf0Kjq29taoN6UPDxOav6CJGng6dCEMJjg>
    <xmx:wBNFX2r-ew8Fjk3PoUSGZh12MnwRuZUTWtNDKGdobJmCf8Q4LsD72Rd2mYQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id B61733280063;
        Tue, 25 Aug 2020 09:35:59 -0400 (EDT)
Date:   Tue, 25 Aug 2020 10:44:34 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Frank Lee <frank@allwinnertech.com>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org, wens@csie.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        tiny.windzz@gmail.com, huangshuosheng@allwinnertech.com,
        liyong@allwinnertech.com, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 03/16] dt-bindings: pinctrl: sunxi: Get rid of
 continual nesting
Message-ID: <20200825084434.vv75tywlgdlz6vp5@gilmour.lan>
References: <cover.1595572867.git.frank@allwinnertech.com>
 <229e4870dab1b34797304c384e68c7d04196423b.1595572867.git.frank@allwinnertech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gyrapjss6hfckls2"
Content-Disposition: inline
In-Reply-To: <229e4870dab1b34797304c384e68c7d04196423b.1595572867.git.frank@allwinnertech.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--gyrapjss6hfckls2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 24, 2020 at 03:00:31PM +0800, Frank Lee wrote:
> From: Yangtao Li <frank@allwinnertech.com>
>=20
> Rather than a continual nesting of 'else' clauses, just make
> each 'if' a new entry under 'allOf' and get rid of the else.
>=20
> Signed-off-by: Yangtao Li <frank@allwinnertech.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--gyrapjss6hfckls2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX0TPcgAKCRDj7w1vZxhR
xcpPAQC/f4xwZrv5cojHL4e7F20cWmcuVUgitAcvqxfs3fy57QEAg9KUY/Hhkyor
YeHv8aaKZVz9qqvAbtmHwHwkRvVptQ0=
=gl6Y
-----END PGP SIGNATURE-----

--gyrapjss6hfckls2--
