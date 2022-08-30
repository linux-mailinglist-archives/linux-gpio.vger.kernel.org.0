Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDD5B5A5F32
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Aug 2022 11:21:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231754AbiH3JU6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Aug 2022 05:20:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231767AbiH3JUW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Aug 2022 05:20:22 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C01E2AE1F
        for <linux-gpio@vger.kernel.org>; Tue, 30 Aug 2022 02:20:02 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id l3so10510384plb.10
        for <linux-gpio@vger.kernel.org>; Tue, 30 Aug 2022 02:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc;
        bh=1stEK7orHgTbYEfwbeXC8fEwW/r5cq766TAqvkrU7s8=;
        b=nmk9fHCkrfrblpy/7kg08OX3ped77vmORbwkjjnbEVvUoXKOEKmX0Y1VGcflg+qh+d
         X5tuUyECrJp6R8RxGK62QsdF+fQbRQzNyCiGISzE5m5StPKqzt0BZ7Glg//ELPo5oSVG
         etz+NTjXyBz9fyw10DCx3yIeBzqheARABobLgWEFIgvMnpni+6W7Y8HuUMHy2YNYqJHY
         m9emxannnhCC1uNXxj8tgTkk/x5/54Y8WlBugCyPUt6MTgXTeO99BmfTb1wvKi4O0XP4
         9fnghGoemu9Z13rG/mPuPrqOM5DJ8YuChJLBsl3tIg+uxjn5TpFRQH9ubuzE0FRZUxDL
         RPnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=1stEK7orHgTbYEfwbeXC8fEwW/r5cq766TAqvkrU7s8=;
        b=ZD/lIIX4VKEkuJEk6Og+ZXNx1PhkohZBDw80AGKnrmtcTenbWc91GGGj+Xv35gJd14
         LVAqOyhzI8+1OhgPL0TxagqnbF3eO4H36e272Nr+Y9IkttYx8qR96/nXr+Jr+NQ9l6FH
         Z8TkBwl5AOKRWsUkTOWW0mC+J8MVDtee5Nzclb5B4v0KwDzs+5fIl/SqyiUFLZvMu4Xd
         BCh6HZNMYdMgNi1LNLjW6Qu+5ucLZxshRBBbCp5sMe5T17nh5YW29BEs7dNUKvNotRe1
         bb91Jfn6v3MpkdURoeDS5lwC2eNiMQiqK8uglWBpINTY27NAYt/6Bo2q5c8i83dtO4Ic
         OCzw==
X-Gm-Message-State: ACgBeo1ANDcTVUCNxEujBlcft8lZoucRBpe/eSYvP/UMheeh3cgbRUxH
        InM8RoXrp8KlW4Cun72kPTNs
X-Google-Smtp-Source: AA6agR71f7NK6QRTQvMbVYh6yrfXsyqBOXunCOCPdx/lBWuvieJpGZ4JeK25bmov9unRjiB3MYANpA==
X-Received: by 2002:a17:902:f64a:b0:172:7576:2124 with SMTP id m10-20020a170902f64a00b0017275762124mr19856760plg.155.1661851200915;
        Tue, 30 Aug 2022 02:20:00 -0700 (PDT)
Received: from thinkpad ([117.193.209.245])
        by smtp.gmail.com with ESMTPSA id q10-20020a170902eb8a00b001749e8eee4fsm5100555plg.226.2022.08.30.02.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 02:20:00 -0700 (PDT)
Date:   Tue, 30 Aug 2022 14:49:53 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Marc Zyngier <maz@kernel.org>
Cc:     linus.walleij@linaro.org, bjorn.andersson@linaro.org,
        robimarko@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        johan+linaro@kernel.org, steev@kali.org
Subject: Re: [PATCH v2] pinctrl: qcom: spmi-gpio: Make IRQCHIP immutable
Message-ID: <20220830091953.GC135982@thinkpad>
References: <20220830081212.164709-1-manivannan.sadhasivam@linaro.org>
 <e20dabe02d88f28fc933b596dee8b69d@kernel.org>
 <20220830084441.GB135982@thinkpad>
 <61371efca85fbbd360b3ede9a258ee69@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <61371efca85fbbd360b3ede9a258ee69@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 30, 2022 at 09:48:28AM +0100, Marc Zyngier wrote:
> On 2022-08-30 09:44, Manivannan Sadhasivam wrote:
> > On Tue, Aug 30, 2022 at 09:26:51AM +0100, Marc Zyngier wrote:
> > > On 2022-08-30 09:12, Manivannan Sadhasivam wrote:
> > > > The IRQCHIP implementation used inside the gpiochips are not supposed to
> > > 
> > > lower case
> > > 
> > > > be changed during runtime. So let's make the one inside the spmi-gpio
> > > > gpiochip immutable.
> > > >
> > > > This fixes the below warning during boot:
> > > > gpio gpiochip0: (c440000.spmi:pmic@0:gpio@c000): not an immutable
> > > > chip, please consider fixing it!
> > > >
> > > > Separate callbacks need to be provided for irq_{mask/unmask} pointers
> > > > since
> > > > the callbacks are supposed to mask/unmask the corresponding parent IRQ
> > > > in
> > > > addition to changing the gpio_desc flags.
> > > 
> > > This is all part of the existing documentation, so I don't think
> > > this is really needed.
> > > 
> > 
> > Yes it is documented, but developers usually refer the commits doing the
> > similar
> > thing while doing these kind of conversions. For them, this text serves
> > as a
> > quick documentation.
> 
> If they can't be bothered to read the documentation, why would they
> consider reading unrelated commits?
> 
> > 
> > So I prefer to keep it in the commit message.
> 
> I still think this is pointless.
> 

Okay. I'll remove it in v3.

Thanks,
Mani

>         M.
> -- 
> Jazz is not dead. It just smells funny...

-- 
மணிவண்ணன் சதாசிவம்
