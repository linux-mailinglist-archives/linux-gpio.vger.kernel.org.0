Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 934522519E1
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Aug 2020 15:39:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726257AbgHYNgH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Aug 2020 09:36:07 -0400
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:49681 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726580AbgHYNgD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 25 Aug 2020 09:36:03 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id DF382C53;
        Tue, 25 Aug 2020 09:36:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 25 Aug 2020 09:36:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=ypPIgBZlj0QkzTKDgIZnXB33E2I
        dNRV4QSnBi+COnQA=; b=FY+BZBxM/ANQECCXkC7udwol6SQYhnzjgPVgEJvWmYk
        WF/sQHvlu4zQbTE5F3hgXdzPLrmesCWy63bAkUOsLQCxP8TIqMsoIclMPwOaJdX5
        3rc0CUf1F+2NlIm9vkLoDPKqq2RZ/Jx7DLEIwzUxGffnGEqU4dtcXGrONC1J8A+z
        U6MWaRxN7AOv5FBncsi3kriGukuH04NQaVlAUV80Gi8i+t86O0APITKWvyb32cg6
        tv4VSKBd+jG6DIzs7UKCTLPQQmiru8aNqd8g0EXoYwRPcsRNL3mHm4Ul1RxiH24s
        nZ1H/pQ+0SCkcJD7HQr8I1jp/a0D5rO8qrIi3OEOa6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ypPIgB
        Zlj0QkzTKDgIZnXB33E2IdNRV4QSnBi+COnQA=; b=D1ieySpsg2WkooCMaqirJB
        c+0bD5GKSFzdWU+Wk7VM3KUI7RgTDwchMr1EpSy/1u7BwCbzj036PFoEE8uHiGxG
        ujR+ascEB1fQUgozHMwI+Ad0LTaHjCKODLovvP/uJnMTq22js1y5WkR6UcMyEAPa
        /VFzY3NTK1QxyJy54PvF4iiilTsyMQV/hHWU//iL7Ziz/8s6w4bexbaUE37pI4RR
        rH4k2Kuggwz7u9uZU4DG7avXS8YytADwI+20PTmnkQ9I70xSn9DYGWbn5cwo83TN
        plbdEc39ZkSqLkjt5hCO2bWyj/5B7WRWp27Oohke8iMNLhXmAsXfhxa0gSDJ9ZOg
        ==
X-ME-Sender: <xms:wRNFXzUBXODmYvlbqEuxJYgww5qquOYjGRzNXMXq79rrmIXiRYWweA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvtddgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepleenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:wRNFX7k9FIvyXPQKRPVmtlwBrwHIR9VYWwWmV-n7iutQXeNe5sbcnA>
    <xmx:wRNFX_bV_rKmMyHQ0POSPAoWq1oThWNTATiqfiJxln71LxD5rlNrYw>
    <xmx:wRNFX-WJZwJKmD9xo7gu5C5PNKqnNBw6St7s_6820ZYsXlABhdzI7g>
    <xmx:wRNFX_4nh9us8QGBjybN6UYXlVzDuUMIGI1SJOVpWT69NHtSbfPHurMqDUU>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 238EA30600B1;
        Tue, 25 Aug 2020 09:36:01 -0400 (EDT)
Date:   Tue, 25 Aug 2020 10:44:51 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Frank Lee <frank@allwinnertech.com>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org, wens@csie.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        tiny.windzz@gmail.com, huangshuosheng@allwinnertech.com,
        liyong@allwinnertech.com, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 04/16] dt-bindings: pinctrl: sunxi: Add A100 pinctrl
 bindings
Message-ID: <20200825084451.w5xfgqwszk7brv4c@gilmour.lan>
References: <cover.1595572867.git.frank@allwinnertech.com>
 <a5773d677bcc89af3810cdd187fae54eced82f27.1595572867.git.frank@allwinnertech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ezfe6ijrj5w62qid"
Content-Disposition: inline
In-Reply-To: <a5773d677bcc89af3810cdd187fae54eced82f27.1595572867.git.frank@allwinnertech.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--ezfe6ijrj5w62qid
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 24, 2020 at 03:02:42PM +0800, Frank Lee wrote:
> From: Yangtao Li <frank@allwinnertech.com>
>=20
> Add device tree binding Documentation details for A100 pinctrl driver,
> which has a r pin controller and a pin controller with more irq lines.
>=20
> Signed-off-by: Yangtao Li <frank@allwinnertech.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--ezfe6ijrj5w62qid
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX0TPgwAKCRDj7w1vZxhR
xd0WAP0VlEEuyAwTMWD+dZDnp9yz/vWvxTFhioJZ2/bd+AXDbgD+LzaGkBwR7pn4
Dy3kMc74IBgMbiWfwLaDJBa/ViRSUA8=
=nw65
-----END PGP SIGNATURE-----

--ezfe6ijrj5w62qid--
