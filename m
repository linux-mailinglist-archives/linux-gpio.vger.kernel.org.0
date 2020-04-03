Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B46B419CDED
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Apr 2020 02:51:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390331AbgDCAv2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Apr 2020 20:51:28 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:38873 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2391002AbgDCAv2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Apr 2020 20:51:28 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 8FBCC5C02F8;
        Thu,  2 Apr 2020 20:51:27 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute3.internal (MEProxy); Thu, 02 Apr 2020 20:51:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type:content-transfer-encoding; s=fm2; bh=o4k4Q
        byRVOVaBijp4V3irP0AE4nFGkKuv35zWmzD8BU=; b=mec9o25/tw3Q2livsvRKG
        QhCtaxCniN6f8hKoSNg/O9gjNkUjnkW0FAjtI/W9t0iWwg5dQc3ycoxKwwu5HLJB
        aLARhApfJU7v/YA4Z+x/KYO2oyYaHFjgG5wcjVmuSbJ5Qz5ObBHH2y2Is1bzzl3/
        x5xx2d1Nb1g34kqdp9G74YI9kpoumzztHr1LgCK8KCQCkZYJ1bTXqAUMDOjmOFyD
        XPrqjC+VXI/5ggaF4OZ0aPggnQh5PQ+8LyG6tkgx5UQuLFN53m0j+dr8NgXP6kIT
        f83RsMOGdVoRRD9owhDCfpzxjNbtKcxDOx7DOEFW0AZI8+Ill4z/6pyj2sRCFgq4
        g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=o4k4QbyRVOVaBijp4V3irP0AE4nFGkKuv35zWmzD8
        BU=; b=C8jIhCmnDW9uX6UnO/+qCjj/AIgnTI6ruqM7x1NVRfMQYNFsZBUshXPdf
        Lk38RkhieIkn4BHPje53naD2QERc/YMWjcZsrjizmeio701jDO3RkuLQobfw4C3v
        njUtYBGL71JmM1jSQl0jrsQMFr049sg9+Yej7hUkwgITZnkFKMeAeh8JEYOOVmcR
        a4hQhaaPdJ4Ho0KcBwhqv5D6HlBSPbNUpc+5iJEomWAkILL9tMOJsWCAX0cgVuqw
        osgbqLFkH8YKIZDLK7+K9NRXg07fYzd2ngpDzT7uICMRaGmNnTsmGa0qvht+7ss3
        iipXfF2ICZjgqZOOovkmYi72eomEg==
X-ME-Sender: <xms:iIiGXvxSTTafl6tt0gQFQbHdfo5UEgXrpcVu8l0t0PaC4EwvQ_D4Zg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrtdehgdefkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegr
    jhdrihgurdgruh
X-ME-Proxy: <xmx:iIiGXlvaWz23-H1wujEUO6g9z11ljzX5dmNpzGzv-ipV4s9drmtqRw>
    <xmx:iIiGXr9q_QuNl9kf6dfh4o_1JEtkTfElIpSMuoP73M7-t56qeOtmfQ>
    <xmx:iIiGXk0jV93oo_7IYJ-xld6fW28zXwFUvimoPbSNpWKpN4mwJ1-4eQ>
    <xmx:j4iGXqRNGMdIVooQRfZbcToWLJCYOBPGxS4otGweza_msf_5QgkRDQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id DD995E00B0; Thu,  2 Apr 2020 20:51:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-1080-gca5de7b-fmstable-20200402v5
Mime-Version: 1.0
Message-Id: <48c9bd0e-3b5c-4f76-830f-4b0bd962148b@www.fastmail.com>
In-Reply-To: <9360D2B2-8242-4BA1-BF06-8916E87EDE67@gmail.com>
References: <20200306170218.79698-1-geissonator@yahoo.com>
 <20200306170218.79698-2-geissonator@yahoo.com>
 <294a52cd-2f60-41e5-a58f-a74151a83b08@www.fastmail.com>
 <9360D2B2-8242-4BA1-BF06-8916E87EDE67@gmail.com>
Date:   Fri, 03 Apr 2020 11:21:41 +1030
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Andrew Geissler" <geissonator@gmail.com>
Cc:     "Joel Stanley" <joel@jms.id.au>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: zaius: Add gpio line names
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Tue, 31 Mar 2020, at 04:46, Andrew Geissler wrote:
>=20
>=20
> > On Mar 26, 2020, at 6:20 PM, Andrew Jeffery <andrew@aj.id.au> wrote:=

> >=20
> >=20
> >=20
> > On Sat, 7 Mar 2020, at 03:32, Andrew Geissler wrote:
> >> Name the GPIOs to help userspace work with them. The names describe=
 the
> >> functionality the lines provide, not the net or ball name. This mak=
es it
> >> easier to share userspace code across different systems and makes t=
he
> >> use of the lines more obvious.
> >>=20
> >> Signed-off-by: Andrew Geissler <geissonator@yahoo.com>
> >=20
> > So we're creating a bit of an ad-hoc ABI here between the DT and use=
rspace.
> >=20
> > Where are we documenting it?
>=20
> Yeah, so far it=E2=80=99s basically design by precedent. If you want y=
our OpenBMC
> function to work then follow the standards we're setting in other dts=E2=
=80=99s.
>=20
> Is there a good place to document this? I could create a OpenBMC desig=
n
> doc but that would not address non-OpenBMC areas.

Don't let perfect be the enemy of good enough :) Lets document it in Ope=
nBMC
and then look at alternatives if we find it's necessary. I don't think w=
e will given
that the contract is between the kernel and OpenBMC userspace.

Andrew
