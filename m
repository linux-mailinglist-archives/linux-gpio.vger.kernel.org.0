Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C07E638F8F2
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 05:43:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230325AbhEYDov (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 23:44:51 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:37241 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230048AbhEYDov (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 24 May 2021 23:44:51 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id D975C581067;
        Mon, 24 May 2021 23:43:21 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute3.internal (MEProxy); Mon, 24 May 2021 23:43:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm2; bh=4OSDcQRIgeJvUR6YkXF9RW8Fj9oUfyB
        5OADbIA+ihAs=; b=EgHAIM2ewDKVBJ1eZkfW9zSEpyuTMtlv8fDo57x8cdsgwlO
        3QwFCvRGdsWx45rM3kJjoJdeqp2uP14BVWP9GrZBrcwKye8i7e2JpYNG0ApbcxJh
        Nu+2G6CuOIQ3OrApoe7gtYfXNOj/Hb5Cjw4Du+euTKL5TPfY4q3sQPMnoRck+seE
        m07DXGjW5OWZ1uqrAq0VInQhjrHTkqUKSY+M9QY5cpTrkIY/vR7j3LBntkNz/8bb
        JqNX1EWlVvtl0uqQAEpIf+kkABfmbFxeBmplGA+oc+tXSiKBqdb93JbQuP9PKjku
        qVi+Wz+RgbOgIDkunqszy/fQpONSsS+RdNb+BgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=4OSDcQ
        RIgeJvUR6YkXF9RW8Fj9oUfyB5OADbIA+ihAs=; b=umrZGZO7KBuJyKjhTIF2op
        nql+kYOKgBkvUA1Wnd3MY1AjmWieu7KaenpItIRFu2UF5QfpD1SJsV2rJgbE1jUH
        1aWqsNc9Ucy9oV0rhp71OwqeJTX9jOHI3QAxaIRwa35oLpAvbsgasTUGUjpWMw6y
        zntj7UcmrXDq9BV6O3NEFTZpAHZj0Y8NWwJ0e1eTc0AZfocu2I4iT/EE4PJYAaek
        1KEGCC2YdVdJGoSqkC6HGUjikWDCtcoHS+d1arrRubRrTfu34t/XjeTbyIqRR96L
        /IRdUvL8iMcgAOwBs48+2UgCN7zzT/ZxzkjwOyPB6ZkX4WYVxdkmegOH8puYMjiQ
        ==
X-ME-Sender: <xms:WHKsYA9qwyxDlhhBiQboRhkSagcYygupj_dw4icwuoKz6cmzEuPJ9A>
    <xme:WHKsYIu-R7Du1sRdwvvwpWbFCQYWv5L7q4bVqTzxs8TlXKUswy4nussTQPzH0p-G-
    zcNOctDUznRg5Omfg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdektddgjedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
    vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:WHKsYGBbQa0-aYPcgH6s7QhYQA0bm0yWDmtow98-VmSoShrBgaJKOw>
    <xmx:WHKsYAeUTz4Q-ida5gyHzH6ZFcJ6QarFnWfFoFrz-IsSCPmn-DyhnQ>
    <xmx:WHKsYFMVmMta0paUoPgozmWpDRVTL-5p9sEdEwCKPesGWYX4B3C4-g>
    <xmx:WXKsYGGiyjuPSUEGhi0sE3yNiPYkYEcDm54VBMz3_4ij6sMO9LB2HA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 2CE55A00079; Mon, 24 May 2021 23:43:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <b38cf7e0-6cce-4cb3-8bb7-d711b1fe6eb2@www.fastmail.com>
In-Reply-To: <20210525030254.GA23525@aspeedtech.com>
References: <20210524111338.16049-1-steven_lee@aspeedtech.com>
 <20210524111338.16049-4-steven_lee@aspeedtech.com>
 <43b00f2e-4381-4899-b561-da9a24347f8b@www.fastmail.com>
 <20210525030254.GA23525@aspeedtech.com>
Date:   Tue, 25 May 2021 13:12:59 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Steven Lee" <steven_lee@aspeedtech.com>
Cc:     "Linus Walleij" <linus.walleij@linaro.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Joel Stanley" <joel@jms.id.au>,
        "moderated list:ASPEED PINCTRL DRIVERS" 
        <linux-aspeed@lists.ozlabs.org>,
        "moderated list:ASPEED PINCTRL DRIVERS" <openbmc@lists.ozlabs.org>,
        "open list:ASPEED PINCTRL DRIVERS" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list" <linux-kernel@vger.kernel.org>,
        "Hongwei Zhang" <Hongweiz@ami.com>,
        "Ryan Chen" <ryan_chen@aspeedtech.com>,
        "Billy Tsai" <billy_tsai@aspeedtech.com>
Subject: =?UTF-8?Q?Re:_[PATCH_v1_3/3]_pinctrl:_pinctrl-aspeed-g6:_Add_sgpio_pinct?=
 =?UTF-8?Q?rl_settings?=
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Tue, 25 May 2021, at 12:32, Steven Lee wrote:
> The 05/25/2021 08:54, Andrew Jeffery wrote:
> > Hi Steven,
> > 
> > On Mon, 24 May 2021, at 20:43, Steven Lee wrote:
> > > AST2600 supports 2 SGPIO master interfaces and 2 SGPIO slave interfaces.
> > > Current pinctrl driver only define the first sgpio master and slave
> > > interfaces.
> > > The sencond SGPIO master and slave interfaces should be added in
> > > pinctrl driver as well.
> > > 
> > > Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> > > ---
> > >  drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 24 ++++++++++++++++++----
> > >  drivers/pinctrl/aspeed/pinmux-aspeed.h     |  9 ++++++++
> > >  2 files changed, 29 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c 
> > > b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> > > index 5c1a109842a7..d0e9ab9d1a9c 100644
> > > --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> > > +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> > > @@ -46,8 +46,10 @@
> > >  #define SCU620		0x620 /* Disable GPIO Internal Pull-Down #4 */
> > >  #define SCU634		0x634 /* Disable GPIO Internal Pull-Down #5 */
> > >  #define SCU638		0x638 /* Disable GPIO Internal Pull-Down #6 */
> > > +#define SCU690		0x690 /* Multi-function Pin Control #24 */
> > >  #define SCU694		0x694 /* Multi-function Pin Control #25 */
> > >  #define SCU69C		0x69C /* Multi-function Pin Control #27 */
> > > +#define SCU6D0		0x6D0 /* Multi-function Pin Control #29 */
> > >  #define SCUC20		0xC20 /* PCIE configuration Setting Control */
> > >  
> > >  #define ASPEED_G6_NR_PINS 256
> > > @@ -81,13 +83,17 @@ FUNC_GROUP_DECL(I2C12, L26, K24);
> > >  #define K26 4
> > >  SIG_EXPR_LIST_DECL_SESG(K26, MACLINK1, MACLINK1, SIG_DESC_SET(SCU410, 4));
> > >  SIG_EXPR_LIST_DECL_SESG(K26, SCL13, I2C13, SIG_DESC_SET(SCU4B0, 4));
> > > -PIN_DECL_2(K26, GPIOA4, MACLINK1, SCL13);
> > > +SIG_EXPR_LIST_DECL_SESG(K26, SGPS2CK, SGPS2, SIG_DESC_SET(SCU690, 4));
> > > +SIG_EXPR_LIST_DECL_SESG(K26, SGPM2CLK, SGPM2, SIG_DESC_SET(SCU6D0, 4));
> > > +PIN_DECL_4(K26, GPIOA4, SGPM2CLK, SGPS2CK, MACLINK1, SCL13);
> > 
> > Is this the right priority order? Looking at the Multi-Function Pin 
> > Mapping and Control table, function 1 is MACLINK1,
> > function 2 is SCL13, function 3 is SGPS2CK, and I assume function 4 
> > would be SGPM2CLK, except it's not documented in the table in v9 of the 
> > datasheet (I hope it will be documented?).
> > 
> > If function 1 is the highest priority (which is what all the Aspeed 
> > pinctrl drivers assume), then this should be:
> > 
> > PIN_DECL_4(K26, GPIOA4, MACLINK1, SCL13, SGPS2CK, SGPM2CLK);
> > 
> > Anyway, one of several things could be at fault here:
> > 
> > 1. I've made a wrong assumption about the priority order in how I've 
> > implemented pinctrl support for Aspeed SoCs
> > 
> > 2. The Multi-Function Pin Mapping and Control table is out of date and 
> > needs to be fixed (which it already does as it doesn't list SGPM2CLK).
> > 
> > 3. The patch needs to align with the assumptions of the Aspeed pinctrl 
> > support.
> > 
> > I don't think it's 1 as I haven't heard of any issues where we are 
> > getting incorrect behaviour because of pinmux. I don't think it's 2 as 
> > this patch makes a non-linear change to the ordering. So my hunch is
> > the issue is 3, that the patch is putting the signals in the wrong order.
> > In this case, you want the PIN_DECL_4(...) I outlined above.
> > 
> 
> Yes, you are right. Per discussion with the designer, the priority order is
> MACLINK1 > SCL13 > SGPS2CK > SGPM2CLK
> 
> We will add the information in the v10 datasheet.

Great. Thanks Steven.

Andrew
