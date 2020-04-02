Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9442B19C03B
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2020 13:33:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388105AbgDBLdG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Apr 2020 07:33:06 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:52279 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388001AbgDBLdG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Apr 2020 07:33:06 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 5E0D95C0197;
        Thu,  2 Apr 2020 07:33:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 02 Apr 2020 07:33:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=kA1QfLW3eMIxQfptPPeBMuZlNRg
        ZIGrXylNEE/sNhVc=; b=HOUmEwr1sk1oEZD4aOIfaOtl7vLi7xDDxRPN/4TxLMp
        hMf5IO4aZQnozWpA/Kpj+M2rzKrkcYxwoAsBgNNxJ786jvOQTe9wRY7hCUBQl4Qu
        urALDKUiHsLMtSxgG8coH2YVwI6X4MJ75+Gy9IreSR81/pj78NPHodZNrInXum5F
        t/hY9sjppmwcDU9hRFKP9R2o0qL1fZY1xvNAdU5ubh5TOjrUXOF03LhjAQfaEc6s
        NvAqYyGCruaZ3dzfosuvCjPmOgWW0btO4hi7xFwCeaBFWiUr29nCE1gMQ1pCSZ8e
        MzQRmKp5I0Jo5RdLnJHJtvVyBydiKbMT0m2JGTZlXqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=kA1QfL
        W3eMIxQfptPPeBMuZlNRgZIGrXylNEE/sNhVc=; b=3Du/3zZHqdsS0GGADq1tbb
        UIq2LFztd7cF1pDIgJqY87xx5MWFqDIPrEjxMPh3BhKhQTXlcyOQDR9Ud2inbtY5
        oqzPW1CNF9m/KNbRZ8uWv3nWXCMboEH9/cdBi8+e89GGNuO2q4yDwou6yCMyLomE
        KmgxLCy83ynzA4AsYDPFRWHYkrdQcxHbTKjfwzvTZJw/oa3h4dgSwZ0oCaGjQ75k
        W2PaDjs3dd36j0aWnt1xAF5aHFe5ORj3pLZuklXcOFbNYrsPCnXKC2JprZiprMEo
        v4z96cFB0GHfn37vHh/TTeizJCq66GQipfTkc7ItQEUsmwZuWQpvir4IdQFnhXUQ
        ==
X-ME-Sender: <xms:bc2FXhuBLKzXVF2Vrdl04MrVTHvU1OwslYBmSfrdJRodbBIjNL1aFw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrtdeggdefiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
    ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:bc2FXjloDRyooU-ygixI0rB9CSbSu6saMZ3BresCuveeJOEUHDKnrg>
    <xmx:bc2FXtoICRRfnfWvhvXf5GqocHseUQkLlZJbfsbBBSOMlFCbMKAfPA>
    <xmx:bc2FXq2U32p1FQJp2CZB2rm3VG6s4HwKQ3m9dW4YEeoM-ekIsRa-kg>
    <xmx:bs2FXurbv5p-sUVIc5P5YquHbTsJyXM0B9n_A9FKFXw9fG2aXDll0w>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 668683280066;
        Thu,  2 Apr 2020 07:33:01 -0400 (EDT)
Date:   Thu, 2 Apr 2020 13:32:59 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Corentin Labbe <clabbe@baylibre.com>
Cc:     linus.walleij@linaro.org, wens@csie.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH] pinctrl: sunxi: handle probe defferal
Message-ID: <20200402113259.jalwc7hwxtymtms4@gilmour.lan>
References: <1585818532-23051-1-git-send-email-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tjv7bzkjk4m5tndt"
Content-Disposition: inline
In-Reply-To: <1585818532-23051-1-git-send-email-clabbe@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--tjv7bzkjk4m5tndt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 02, 2020 at 09:08:52AM +0000, Corentin Labbe wrote:
> When checking the logs on my sun8i-a33-olinuxino I saw:
> sun8i-a23-r-pinctrl 1f02c00.pinctrl: Reset controller missing
> but this driver was working after.
> This message is just here because the reset controller was still not probed.
> So don't say anything if the return code say to wait.
>
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--tjv7bzkjk4m5tndt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXoXNawAKCRDj7w1vZxhR
xfzAAP9ylLtzCnrw2H6mzX/G1HyeNRlmKneYZuDx6o5HAAm0BwEAmpRgI1Hh4Jln
/kdUr3TBTGjQqWJO+H4/JvS/93oyhQs=
=iteN
-----END PGP SIGNATURE-----

--tjv7bzkjk4m5tndt--
