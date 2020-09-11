Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3C2126576C
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Sep 2020 05:28:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725385AbgIKD2c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Sep 2020 23:28:32 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:45307 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725440AbgIKD2b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 10 Sep 2020 23:28:31 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 275C85C00CC;
        Thu, 10 Sep 2020 23:28:28 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute3.internal (MEProxy); Thu, 10 Sep 2020 23:28:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=EVETyDU0+TunxzM8iIXQfH+yO5yOMs0
        Ejqe2TsN2/GM=; b=rMc4t/n8q2Ho0d073wtAlUsgrvkScNcPx7Z3bqWu+jSirUR
        wEvyDNm+bJeNtJfFIu1hHjFOgU8X7BechH4rsaodFDxbeuuihl81L+6MSFie/2c4
        haRghbVupge2uljAFjwXK+Sz2sEnqgEB3qyobCMVdDb4OryoFQ66XR+U/WzhOe5a
        094N+fAE9nrSVPbELSta8bZHNnaYVnx/32VrnfvAKxBE4b2UePGvaKXwZlzO+aFD
        pVmbqAO5cO86ZnN/fKsuKNPoizzKvh8lqcbB9Zw70uOG/sf/N0qmIa0oXmP8Py5Q
        6FV5IIr41lYDC4tCP9bIGUDF22VkHKEfqyZZstw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=EVETyD
        U0+TunxzM8iIXQfH+yO5yOMs0Ejqe2TsN2/GM=; b=tg/kAYMABvtXUnEdnXLuoi
        ogaotOhu1pz3UOsXmNvVUDXFC/i6LguhwIuLxGJp8VjTTHZN4XRDmMcV8KVpj9/J
        XLliSbErFsAKJ2qo+xg9ZoLjoPW1U8sZOGOSZbMaQDQf7prZrYrglyK4vM7HUNiW
        wQg31GJtkF43zdlvsJB6wAwZyIpNp+UGarI3SMPENPZFrw/qHQrYUCcjBvKbGnBH
        FkUN1i0L3DJM5rLtExjOuIcb7DXkNuRmUnWJ5/xXA0JHm/Vg4ZM28Nr0SbTct1j8
        97akkgkhBfhsJLyvOi5uwHEBR9n2aBmXeplq52lEC4mocwuQC16F5s3pLjSnCy6A
        ==
X-ME-Sender: <xms:2u5aX7vibGSoR8nssklBCw8uW-ugoYmFGjOHQUzRSbxcW7oakEai0Q>
    <xme:2u5aX8enagy6XoBklN-flbip4_PBiYtjRgYkh6AkPGLB9iP81rYniRVy6E9zvMqIC
    wGUhbzW7DpMhM7XqA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehkedgjedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
    vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:2u5aX-yR-lC8KT7H8dFshkCGx66XSYoMDv-v2-L0HoyFunWIEvoH3Q>
    <xmx:2u5aX6OVPQwtWNmxkSN7uHkiqdTX6WXbVX5DFFquz7WRD-2qojYwrg>
    <xmx:2u5aX7_sMBMzQkR9Du5gzoQcdFFDZqjtGcYcfDmnltFw8iHMYJ8uTg>
    <xmx:3O5aX9Iyv3G6rgwIW7fcBcnMHqSKvJWAUpgNM_yXBpmbI5GOIPB7mQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 6A82BE00A6; Thu, 10 Sep 2020 23:28:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-259-g88fbbfa-fm-20200903.003-g88fbbfa3
Mime-Version: 1.0
Message-Id: <5beba404-14f0-4bb1-9110-c110797d5a04@www.fastmail.com>
In-Reply-To: <20200911015105.48581-1-jk@codeconstruct.com.au>
References: <20200911015105.48581-1-jk@codeconstruct.com.au>
Date:   Fri, 11 Sep 2020 12:58:06 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Jeremy Kerr" <jk@codeconstruct.com.au>,
        "Joel Stanley" <joel@jms.id.au>
Cc:     linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        devicetree@vger.kernel.org
Subject: =?UTF-8?Q?Re:_[PATCH_v2_1/2]_gpio/aspeed-sgpio:_enable_access_to_all_80_?=
 =?UTF-8?Q?input_&_output_sgpios?=
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Fri, 11 Sep 2020, at 11:21, Jeremy Kerr wrote:
> Currently, the aspeed-sgpio driver exposes up to 80 GPIO lines,
> corresponding to the 80 status bits available in hardware. Each of these
> lines can be configured as either an input or an output.
> 
> However, each of these GPIOs is actually an input *and* an output; we
> actually have 80 inputs plus 80 outputs.
> 
> This change expands the maximum number of GPIOs to 160; the lower half
> of this range are the input-only GPIOs, the upper half are the outputs.
> We fix the GPIO directions to correspond to this mapping.
> 
> This also fixes a bug when setting GPIOs - we were reading from the
> input register, making it impossible to set more than one output GPIO.
> 
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> Fixes: 7db47faae79b ("gpio: aspeed: Add SGPIO driver")

This was something I was leaning on the implementer to sort out when I
reviewed the driver way back. Oh well.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
