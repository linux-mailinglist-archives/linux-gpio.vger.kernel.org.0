Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 254C37C4C5B
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 09:51:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbjJKHvW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 03:51:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230287AbjJKHvN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 03:51:13 -0400
X-Greylist: delayed 362 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 11 Oct 2023 00:51:01 PDT
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5459F10B;
        Wed, 11 Oct 2023 00:51:00 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailnew.nyi.internal (Postfix) with ESMTP id 891765804C1;
        Wed, 11 Oct 2023 03:44:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 11 Oct 2023 03:44:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1697010297; x=1697017497; bh=JZ
        ToOnQlaLQI+R1OJZjMd5txCt25LannQJkkFemkr7A=; b=2I1Uee41GqQiS5mRa7
        b+oLFHaHse24HaozrZAH5aB5O6tH1OPeNXTHMFgWUHQJ+EJrC95eZNw0k/kn8TZb
        d6GCEPJJATP1hL/7LLiPs0dvVLy8RoNLfmxVDGtXO4ipZcHbiVIT1NI8sArIRDOi
        YDGadkOLR5hnJyg7EPvK9G+ig7LRP5tS9geD5LCHiKDX6NUQw4JC1uWIZt65jSZK
        8bRYsHbC42O24GL2BsXZKGaB7ycIUgDZ35VrUzyduSd68q8XBij2krCyq+GZQNYh
        Kq6ZqaWI+slgetPhXhJo7c8WPDuI73LD4ayto3V5YDYrbx0gsQ5OfiDcVInJZ40p
        0gYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1697010297; x=1697017497; bh=JZToOnQlaLQI+
        R1OJZjMd5txCt25LannQJkkFemkr7A=; b=QQKKGB5UoVL3YQ4FtdrsWsjqKcufn
        37TnvP56+FqTFex/vwIupr3qRdQVV6X2EN77rH/ZNuY6bb9D6MP4/rZPooCFVk0M
        F3SPsWyKMjwEqeO3KolFnelceT5+rSaIEmm58c62wdJ9G1IURsJzIPoswNjDRAdI
        173HETIxvG91z1fOkEvVRki7NY2I8XbVCOX5F/V/3gnuDO2SjoOHesDFb/8Q6Ey6
        0kqrfdQ2i+Ntru8WNRY5wDWQFPgF0Hf/fChlcV2REkh171SUXjK3YlRDy0EYodqE
        WHcNY7lzlv0ZeiyxZNbNcBJmmH7Nv72e+moVHzabqtZ631FoEb0nogqYw==
X-ME-Sender: <xms:eFImZej4eHDXn_Ru6WgufJrf4kJLu_4wat-r3vbGWJUgjAli7pT8ww>
    <xme:eFImZfCG-IC8RIx8_MLrdpmX8ABknJIFkLOnpp2QKfWhOnzcg-Iaj3U2K7p8oHRMs
    k3Cx-zzzijiAw>
X-ME-Received: <xmr:eFImZWFsra_F7BfmAimk0JZCBx8cgzCGV50sPziqXQC9edJzx9dShwXQ-JKfpVct_6WI9-87IMUeO-zHEUAuLxI_XpSraHxY-E5fMczONP4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrheejgdekudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehgedvve
    dvleejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:eFImZXS3hehWydKzE9FCS1Sofv1sITbomg94NeHwJ3ml1wLj3qFBvw>
    <xmx:eFImZbwY9RZWoEXZgGd9ZlKbXYRoRshZv_o6MT-02QoNXjo085Itgw>
    <xmx:eFImZV4My1BsUQZ15GES-Nc6HIUF3bbFldSh1_jvRjCuSEZbj6fhBw>
    <xmx:eVImZTMd-gdYVE_hUjMN2G9PoVBnopKaS3wkDx9nBKgBmBcMR6ZgLw>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Oct 2023 03:44:55 -0400 (EDT)
Date:   Wed, 11 Oct 2023 09:44:52 +0200
From:   Greg KH <greg@kroah.com>
To:     Peter Griffin <peter.griffin@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com,
        tudor.ambarus@linaro.org, andre.draszik@linaro.org,
        semen.protsenko@linaro.org, saravanak@google.com,
        willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 00/20] Add minimal Tensor/GS101 SoC support and
 Oriole/Pixel6 board
Message-ID: <2023101101-mauve-underarm-1b48@gregkh>
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010224928.2296997-1-peter.griffin@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 10, 2023 at 11:49:08PM +0100, Peter Griffin wrote:
> Hi folks,
> 
> Firstly, thanks to everyone who reviewed the v1 series! V2 incorporates all
> the review feedback received so far.
> 
> This series adds initial SoC support for the GS101 SoC and also initial board
> support for Pixel 6 phone (Oriole).
> 
> The gs101 / Tensor SoC is also used in Pixel6a (bluejay) and Pixel 6 Pro
> (raven) phones. Currently DT is added for the gs101 SoC and Oriole.
> As you can see from the patches the SoC is based on a Samsung Exynos SoC,
> and therefore lots of the low level Exynos drivers can be re-used.
> 
> The support added in this series consists of:
> * cpus
> * pinctrl
> * some CCF implementation
> * watchdog
> * uart
> * gpio

So you have sent a patch series that crosses multiple subsystems, who is
supposed to be taking these patches?  Or do you not want them actually
merged?

confused,

greg k-h
