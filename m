Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9891D1DEB66
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2020 17:03:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730390AbgEVPCy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 May 2020 11:02:54 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:39399 "EHLO
        wnew3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730012AbgEVPCx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 22 May 2020 11:02:53 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id 9F181C3C;
        Fri, 22 May 2020 11:02:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 22 May 2020 11:02:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=dfruM1ppk6Jsi8d5RYiHeO1vXHS
        Akp8G8O5mgdM6/xo=; b=LtbtjjjjDuXYgfePn0K5MsfFT2gid1rkkn4yPxRmpyC
        Ja2/pqSydi/MssZ46qfuonGbmtuApaCGsqGbIyftHN3kTbWODhr1zOVeeHTbVKuo
        DGwksOQ7Vd8F64xM1LZtkh6mw0WkMJ1/gQATPu08AyaBdVRLOYJEY2wOy8UXwTcp
        Atv9OtTj8+4IImBpRdTZ0S3TPPjGAXM7i54aXSZUQSoWS7UHw4XqqN8HSZcVJZMi
        H2pd57jtQgLZDg8M8L6O4ez/dDu1pf573Ecu2OECFumcUXN3jqzwPyo2bpHWCaQb
        P9eY1MrxMk5g9L0krA751di6cfV8KaFbXzmqyBKLeeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=dfruM1
        ppk6Jsi8d5RYiHeO1vXHSAkp8G8O5mgdM6/xo=; b=IFHnadejj8QV1XyZnNVZXV
        hOVKNxQTmJ4z8u/2XDSeAowasn6hEyvBzn2rxcM1h1jOxkWu0BwGYe8vxtDw77TS
        KNqRlCq4nw4Og/z6E+rjtrTGo2WJSuoGhstQZEX7HQbVjHDRxYkEZwQ3KWOo4mbs
        1jrBdMuykNI4b1XeyIwKK1le9nApTPLf2IRFmxb+sp1o7SeZbitOT66RP5f8H2FH
        dYXJDLBfxyvpCQ5PSjqt2WBoG/Db0G+faNPKvz2ml5ZS5JH2e6nltcjnm0HhKLgV
        +VaKOoTbP7VXVgcXF67mnnqx4ybajd+skiXRlAxrCCZ6W1OWrVsxS29RUQOsCbdA
        ==
X-ME-Sender: <xms:mOnHXrDWPnWZ8dtDqYDzbHVE4OkJn8-4thFQpNh58MyOiCSAJTBfGA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddufedgkeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:mOnHXhil2TKMKBpEsL2QuCL5qVyyg6EdizKBdyQHKazv81-MGWLzzg>
    <xmx:mOnHXmkzfypkKiGRfXpwGpkHXshqHMkyc2kGNpGPz5p2lkNtc_-Xfw>
    <xmx:mOnHXtylCBiROuTeRLZrUQzDOXVcR21rVLyyexzKnQi4h4xC5Jiq6A>
    <xmx:m-nHXlJmlXed546T9v03WLlQoP7V4H7Jrab9Zf1uPOsMCffDZ69IgxwY98M>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 25EC8328006B;
        Fri, 22 May 2020 11:02:48 -0400 (EDT)
Date:   Fri, 22 May 2020 17:02:46 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Frank Lee <frank@allwinnertech.com>
Cc:     wens@csie.org, robh+dt@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, linus.walleij@linaro.org, p.zabel@pengutronix.de,
        huangshuosheng@allwinnertech.com, tiny.windzz@gmail.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 0/4] Allwinner A100 Initial support
Message-ID: <20200522150246.s4sjfaijq3rnz6af@gilmour.lan>
References: <20200522030743.10204-1-frank@allwinnertech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hs5jysifm647f22e"
Content-Disposition: inline
In-Reply-To: <20200522030743.10204-1-frank@allwinnertech.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--hs5jysifm647f22e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Fri, May 22, 2020 at 11:07:39AM +0800, Frank Lee wrote:
> This patch set adds initial support for allwinner a100 soc,
> which is a 64-bit tablet chip.

The patches are mostly good for a first iteration, thanks!

Could you provide a bit more context on what that SoC is and if the user manual
is available somewhere? It will be pretty hard to review without it.

Also, is that perf1 board available somewhere?

Thanks!
Maxime

--hs5jysifm647f22e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXsfplgAKCRDj7w1vZxhR
xRIRAQCEPS4vnOuSb5F2eHXxHbKMAf2dx5SdnadegmmYj+WVGgD/XtExiVLDPTh4
qD+Ft5Xf7Pn5KSkCrN9LzsLLvaypVwE=
=3Zpr
-----END PGP SIGNATURE-----

--hs5jysifm647f22e--
