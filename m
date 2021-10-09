Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 800564276F5
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Oct 2021 05:43:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230137AbhJIDpC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Oct 2021 23:45:02 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:47683 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229970AbhJIDo7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Oct 2021 23:44:59 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 7B31A5C00E2;
        Fri,  8 Oct 2021 23:43:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Fri, 08 Oct 2021 23:43:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nakato.io; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding:content-type; s=fm2; bh=
        VAmBK3ToZQMA7JF1X65Zy3ZwSwqTtBjr1AgUgRLyKSI=; b=x1JKUBL/469744YV
        g3Rp6CUY5dLwhAdbvFw6qLYR5hANmcI+R1KM5LO9Xl7prWN0dmli2PPyummJkFy3
        RP1wMbTguuGc8y1N/CfJfr3QLS7Las3Or/+nRYHENv4+DFAx5HDBe65J2HUecSgN
        4t/8WihcrlwUbwMn4h80AMgjiwcAqgW5t1UXBMgU5CE6SIpdgnLEidadEioktQ2W
        BWk1RIsFgaS/uVx/Wb4Aueqm7Qp/E9StWCG82ivJ2iKIfxP7ufgE74ORuVFhoAW2
        Lf6DX4ryy1VNCLACMu8RfVF3LubDmofvD3gx+H1fWSoXXMEnTijpoTCmpkNpXR/1
        yeCHfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=VAmBK3ToZQMA7JF1X65Zy3ZwSwqTtBjr1AgUgRLyK
        SI=; b=Va/g0AWxezReObo1dO0cEJm/aQsRd0+YTWCBJUqMKyOPXR7llGhaLLVbO
        6vPlcM+unmNVQqBsADA1d1VkhAf1ePjNTNeBB+XZiC9VKrC2kHcrEeY0P0/iAW4q
        6MKAWMDZBsr1KFwNGHVuCEq10PWx45SBmoG8SNn+DO0zykF1Jn9G1ZOkAvG23yP9
        Gn862tfI8B5f9U3/LuUVH4/qd8LeuZRW+EJANu9Sqe1lXshB3nxLvpY4BGoEljMu
        hW20CdimX8jDDKTGhbKeY3a/9H7DV1Sfcy4xdnpXSPpfMzvIpgYhIGCY7+vt6PqM
        FG5GwSvp7kW9owciPrmGoShSqBoPA==
X-ME-Sender: <xms:xw9hYWyQxLpCXXWN8hd02WnCc6E9-LQoFQEWFukzG-2F5-uvxTG9Wg>
    <xme:xw9hYSSi-DJXvOyYGuXVvqc133LTKYb81RtKhPXdUFxNk-aDYAQUGx5JqRmNk_mL2
    o90T9_Il8IgZSYBaA>
X-ME-Received: <xmr:xw9hYYW5Gb6Y-MTsTNaLZWbftyM6PmwQqQoKrK-rBGBNjOByC2DyQA7-uQdzBTeqPN_KzQwLzUNxOyfzR4MIfCM9DkFz21QYw1BZ2-71tPV17xo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddtuddgjeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkfgjfhgggfgtsehtufertddttddvnecuhfhrohhmpefurggthhhi
    ucfmihhnghcuoehnrghkrghtohesnhgrkhgrthhordhioheqnecuggftrfgrthhtvghrnh
    epkeegvefhtefgffejffekhfdvheetgeduudejfffhjefffefgfeeikeekvedtfedunecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhgrkhgrth
    hosehnrghkrghtohdrihho
X-ME-Proxy: <xmx:xw9hYcjnIK-YY3kF4ubjxyRma5cuccK3ay99zvhUcOfnnIbuJot9sQ>
    <xmx:xw9hYYAk5Hmm0zaGJdwnej8E1p93LZ8BJS5KzzZbKSDKnkdZI6Ba6w>
    <xmx:xw9hYdIm1QWI_W-q1eMmeufyEmigCRbMw_Int7PIzvlTuJi7tUkWew>
    <xmx:xw9hYb8Bw87g6Zbep9CslN2PDIusP80dWO5m_LydBjaworvpYNBXUA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Oct 2021 23:43:00 -0400 (EDT)
From:   Sachi King <nakato@nakato.io>
To:     linux-gpio@vger.kernel.org, basavaraj.natikar@amd.com,
        "Limonciello, Mario" <mario.limonciello@amd.com>
Cc:     linux-kernel@vger.kernel.org,
        Shyam-sundar S-k <Shyam-sundar.S-k@amd.com>,
        "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>
Subject: Re: [PATCH 1/1] pinctrl: amd: disable and mask interrupts on probe
Date:   Sat, 09 Oct 2021 14:42:58 +1100
Message-ID: <1647640.3P7QB8EEvc@youmu>
In-Reply-To: <8cf02fe2-252d-02b5-d227-9091bee57f76@amd.com>
References: <20211001161714.2053597-1-nakato@nakato.io> <20211001161714.2053597-2-nakato@nakato.io> <8cf02fe2-252d-02b5-d227-9091bee57f76@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Saturday, 9 October 2021 05:19:17 AEDT Limonciello, Mario wrote:
> On 10/1/2021 11:17, Sachi King wrote:
> > Some systems such as the Microsoft Surface Laptop 4 leave interrupts
> > enabled and configured for use in sleep states on boot, which cause
> > unexpected behaviour such as spurious wakes and failed resumes in
> > s2idle states.
> > 
> > As interrupts should not be enabled until they are claimed and
> > explicitly enabled, disabling any interrupts mistakenly left enabled by
> > firmware should be safe.
> > 
> 
> So I did test this on a handful of platforms and confirmed that the 
> events declared in _AEI are still being enabled and passed properly.
> 
> So if no other changes needed you can add my:
> Tested-by: Mario Limonciello <mario.limonciello@amd.com>

I've sent a second version of the patch to remove the duplicate
INTERRUPT_MASK_OFF.  I also fixed a number of style and whitespace issues.

Would you like to test this again?


> > diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
> > index c001f2ed20f8..aa4136cd312d 100644
> > --- a/drivers/pinctrl/pinctrl-amd.c
> > +++ b/drivers/pinctrl/pinctrl-amd.c
> > @@ -967,6 +993,9 @@ static int amd_gpio_probe(struct platform_device *pdev)
> >   		return PTR_ERR(gpio_dev->pctrl);
> >   	}
> >   
> > +	/* Disable and mask interrupts */
> > +	amd_gpio_irq_init(gpio_dev);
> > +
> 
> As the pinctrl device was just registered, I do wonder if this actually 
> needs a mutex in case another thread tries to enable the pins at the 
> same time.  I might be wrong here though and things are OK because the 
> pin range isn't added until later on in probe.

If we need to add a mutex then I think it would be more safe to rework
the amd_gpio_init_irq function to not depend on amd_gpio and move it
before devm_pinctrl_register, as I'm not sure a mutex around
amd_gpio_irq_init would save us from a race condition occurring between the
devm_pinctrl_register and getting the mutex following that. I'm hoping to
avoid that however as it would be a bit messy without pin_desc_get.


