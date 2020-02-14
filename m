Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21E2715D81E
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2020 14:14:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729296AbgBNNOL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Feb 2020 08:14:11 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:36469 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729294AbgBNNOI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 14 Feb 2020 08:14:08 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id EF3C2560;
        Fri, 14 Feb 2020 08:14:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 14 Feb 2020 08:14:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=u9+v+4J9/zoOQI1Gm5b/NsSDu09
        67fM20z6x//ZlrMU=; b=Uyq+gayX6zoz//j1EOgBpXzp2s2mD3qTcpXZMcC1JNu
        G360zqbOsrQ6jRcELoDYCqszsvPEpWciAvrnylTXZ4Cj6v6UM9UIqM5LLAPgHMoR
        8N1GdVaqoodh8Z4fDoPvk0iZWDNY0uwZbWYSemoMsO+SPOQ0tNeCH9X2oBEpPns/
        siveeMny/h5Z81daAJpgguRtuHcOOduvKy0N5r89EK/c1qJ9PQuEnAGdIP3whepl
        yvMbxsLOFAp3whkOhMZrvZtjv3wFCXgu0XLKqbKMRXwFfKS7gNWOXlkFJU3KkDuv
        xeDbpyW8h3y1PK1Vld9epis5X20FWdkFEbwQlYh25KQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=u9+v+4
        J9/zoOQI1Gm5b/NsSDu0967fM20z6x//ZlrMU=; b=syRUlCVu6E8wgHuFMeXidO
        v5ps6/6Sz+L9nDIK0VlOke1tP8b2TBkczhxC8T2cExO0HFjsWu8EcWIlQBX4Gob4
        hUjTuQVqHwqGa980FiUrcKPnaNa267Wm+RykyADXpoZhWI6iVLPHHM9+ycBswHyj
        agFKQ99zb253giJaq7LEGFe3H939keOV83eLmdYppVcwMezbtAnKXSJX3AaaQCtn
        DQA1CreM8xJQABXxCigS9EWt/D5xdAZGDwCsJiOecGCQYCJNb6S5mnH1VjBAJa5L
        EuEroQwxuCoYF9p5dVlnLjkT1DfL+JMorJoAmvCoB4dpTzwFN+/XRBwXUAji+MGQ
        ==
X-ME-Sender: <xms:HZ1GXqmZN2wIS8mwfFKAu99J5yY6y1truSfo3k0nrsNzDSkozf99NA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjedtgdehtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
    ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:HZ1GXtgZ09gcCFOb8pcVU-kROzfRoMnEN5iuI67UGNh3gRi0qA6atw>
    <xmx:HZ1GXvgIrOq-iAwvQI9lm40eMsskM0nDDL7PldfMP6PVVyOP-vWS1Q>
    <xmx:HZ1GXjZi2x1ISSqVcIxC27MuhEOQ-RNG45E6COTMLr5tJSz1hpYTLw>
    <xmx:Hp1GXhN0uFsoo5GBKmSBIJaGBiUqIqS60Z7hLvOz563ZBI2bT2S6-Q>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id E18583280065;
        Fri, 14 Feb 2020 08:14:04 -0500 (EST)
Date:   Fri, 14 Feb 2020 14:14:03 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 1/2] pinctrl: sunxi: Forward calls to irq_set_irq_wake
Message-ID: <20200214131403.uxx76djg34rugm55@gilmour.lan>
References: <20200117213340.47714-1-samuel@sholland.org>
 <9103f638-b733-5f4d-1a64-ee35cbfd8236@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mtvphatqxlrtxgdf"
Content-Disposition: inline
In-Reply-To: <9103f638-b733-5f4d-1a64-ee35cbfd8236@sholland.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--mtvphatqxlrtxgdf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 12, 2020 at 07:45:50PM -0600, Samuel Holland wrote:
> All,
>
> On 1/17/20 3:33 PM, Samuel Holland wrote:
> > The pinctrl irqchip may be connected to an irqchip that implements the
> > .irq_set_wake callback, such as the R_INTC on A31 and newer sunxi SoCs.
> > In order for GPIOs to be able to trigger wakeup, the IRQ from the
> > pinctrl to the upper irqchip must also be enabled for wakeup. Since the
> > kernel's IRQ core already manages the "wake_depth" of each IRQ, no
> > additional accounting is needed in the pinctrl driver.
>
> Ping. Any comments on these two patches?

For both,

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--mtvphatqxlrtxgdf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXkadGwAKCRDj7w1vZxhR
xUClAQCzO0MoH9wU1X+cfxcOBq2r51BL3eiLg+H/wLGJpk+FCAEAnP/9TmFQA1RX
zlcfN9umBwF5ukT/ODhstmhVyG70yQc=
=zvRk
-----END PGP SIGNATURE-----

--mtvphatqxlrtxgdf--
