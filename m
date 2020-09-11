Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CB63265771
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Sep 2020 05:29:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725385AbgIKD3o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Sep 2020 23:29:44 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:58559 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725300AbgIKD3n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 10 Sep 2020 23:29:43 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 819705C0125;
        Thu, 10 Sep 2020 23:29:42 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute3.internal (MEProxy); Thu, 10 Sep 2020 23:29:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=kNAUBvcbfaGyYTt319ur9c4R9nQZeo9
        ec/Y43AeLQy0=; b=Iq8T1BKphuHCvhiBsLjKpRo59Y++7QWWkoDa6uzpgyvI4HE
        yBuYMmcuIzG+unGYl3JQOEw22HTkKAoo7m0Iq8pVrsTNBq8DkUAvhLK04MJ9NNqe
        u+raIKRnjpHcAONQr8zr8c4zSqthTE2dRZqEMpSfKDaMtKQn6UIXx8BD5i2Z4V5u
        RlLiZHf+6/pClo++XbkVcp8Er0cGHd7jZ57/uGrzmS8MP4QjDcDbS1aZ3ur2/21H
        eWrxjt86atNc6Q/TKxebKWrkfCVAJ282YxPW/vj9VeSJIMMCRVt8QMgFgn2OkSpZ
        40JpadvU+Ruuh3lV2hPrf/yCqtEQwHaPBTyVoFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=kNAUBv
        cbfaGyYTt319ur9c4R9nQZeo9ec/Y43AeLQy0=; b=F3s2U3s9dn4yQ0Y6rU3Gah
        aBht6Q7Oy7xqmbPxj3ldCtlQNzSvOnEz2VnkKoWyT5kOnyC6JaB8aRHMbTKZlcjo
        Rr5ko4bcpoawGWCrr/l5f80ZHt7Rj4p5xZlX9yiYEKq8A4bYJBHRLCtOvRRv3ei2
        VGanhkMb0mZc7t346ipxyFxzFF9TFCSnsgPlZmdle5+EicTGi0t1Vp40GbKiRc79
        M/XzREJfAitmFZ+49S/I0VYTc/FLfSsFVbs/0moZToKGtFNT/1aklwSIHxa/a6f2
        j3NPGzpydJJMdLg08q4rhxe5e25L0vXS2dopfellhHMpWzYiy2eqN8GJAJgpyIKg
        ==
X-ME-Sender: <xms:Ju9aX86ogT-iVeH8rLWXxcmeYfifhEDsGRZFEDfzU1HD9RUvc4bnIg>
    <xme:Ju9aX94PvBEMItMETcdcYI_SeBOSYmffUGyiqgtmvjLVTONFYby5T-o-MnoEpn8Lo
    lhihJ6irDFCP2Bknw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehkedgjedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
    vddthfeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:Ju9aX7eNXJ88LPeRhfM6YUWgiLK22SjZ2wbYXZqOyLSfNrixmdG-tQ>
    <xmx:Ju9aXxItUp2h471RK5TOZbmAP6qavWToaa5UhB-Jns6WhR8y_ywhSA>
    <xmx:Ju9aXwIhVzVSGuqT4Th4KchcjOjrQaiY_v_ad-6HcjiR6WxtxQnZEg>
    <xmx:Ju9aX3WM0L2sBb3rg9ySKl-6n9qjnM7cdXsuJa2HeqC8JUfyk_rYtg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id E547AE00A6; Thu, 10 Sep 2020 23:29:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-259-g88fbbfa-fm-20200903.003-g88fbbfa3
Mime-Version: 1.0
Message-Id: <a0270b2f-039c-45df-84da-48f850d512fa@www.fastmail.com>
In-Reply-To: <20200911015105.48581-2-jk@codeconstruct.com.au>
References: <20200911015105.48581-1-jk@codeconstruct.com.au>
 <20200911015105.48581-2-jk@codeconstruct.com.au>
Date:   Fri, 11 Sep 2020 12:59:21 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Jeremy Kerr" <jk@codeconstruct.com.au>,
        "Joel Stanley" <joel@jms.id.au>
Cc:     linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        devicetree@vger.kernel.org
Subject: =?UTF-8?Q?Re:_[PATCH_v2_2/2]_gpio/aspeed-sgpio:_don't_enable_all_interru?=
 =?UTF-8?Q?pts_by_default?=
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Fri, 11 Sep 2020, at 11:21, Jeremy Kerr wrote:
> Currently, the IRQ setup for the SGPIO driver enables all interrupts in
> dual-edge trigger mode. Since the default handler is handle_bad_irq, any
> state change on input GPIOs will trigger bad IRQ warnings.
> 
> This change applies sensible IRQ defaults: single-edge trigger, and all
> IRQs disabled.
> 
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> Fixes: 7db47faae79b ("gpio: aspeed: Add SGPIO driver")

Acked-by: Andrew Jeffery <andrew@aj.id.au>
