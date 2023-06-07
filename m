Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A90CB7263BC
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Jun 2023 17:09:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241255AbjFGPJl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Jun 2023 11:09:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241252AbjFGPJk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Jun 2023 11:09:40 -0400
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68F1C1FDF;
        Wed,  7 Jun 2023 08:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
        ; s=x; h=Subject:Content-Transfer-Encoding:Content-Type:Mime-Version:
        References:In-Reply-To:Message-Id:Cc:To:From:Date:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=Vx9cwnR0h/Gk7Vtn0kVtgoY9YazEZrpbYkc4+ccNUtQ=; b=B8TzNT+x6aV/TOJb80goPEBhL/
        pty5+F9J3etVMAY8MOmAm7RkCqTAXd6Oe/e+UtDtrALwh9VVhUfRHPSrSrSxnrBWlrgNn89SCx3dE
        6JQHnMn/Oalwen1sSXVy7YsjcK+76/pIzkEbHb438lEOGSI4HrvjYR0oPxjFGaiaEMlw=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:42856 helo=pettiford)
        by mail.hugovil.com with esmtpa (Exim 4.92)
        (envelope-from <hugo@hugovil.com>)
        id 1q6umn-0006L3-PN; Wed, 07 Jun 2023 11:09:22 -0400
Date:   Wed, 7 Jun 2023 11:09:21 -0400
From:   Hugo Villeneuve <hugo@hugovil.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        jirislaby@kernel.org, jringle@gridpoint.com,
        jesse.sung@canonical.com, isaac.true@canonical.com,
        l.perczak@camlintechnologies.com, tomasz.mon@camlingroup.com,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Hugo Villeneuve <hvilleneuve@dimonoff.com>,
        stable@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
        Lech Perczak <lech.perczak@camlingroup.com>
Message-Id: <20230607110921.029b4bc8cf49cad5525cb429@hugovil.com>
In-Reply-To: <881d6357-7190-7ef1-22a3-63a9b8533b4f@linaro.org>
References: <20230607140525.833982-1-hugo@hugovil.com>
        <20230607140525.833982-6-hugo@hugovil.com>
        <f5cfc81d-d8ae-d270-f29a-c2b45b07a651@linaro.org>
        <20230607104100.0186b1afc872e583cb9466b8@hugovil.com>
        <a6301c0e-b774-8963-8eb1-8e0948b1468c@linaro.org>
        <20230607105249.6dc95ed226e3578a3c9116aa@hugovil.com>
        <881d6357-7190-7ef1-22a3-63a9b8533b4f@linaro.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
Subject: Re: [PATCH v8 05/10] dt-bindings: sc16is7xx: Add property to change
 GPIO function
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 7 Jun 2023 16:57:48 +0200
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 07/06/2023 16:52, Hugo Villeneuve wrote:
> > On Wed, 7 Jun 2023 16:46:56 +0200
> > Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> > 
> >> On 07/06/2023 16:41, Hugo Villeneuve wrote:
> >>> On Wed, 7 Jun 2023 16:30:26 +0200
> >>> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> >>>
> >>>> On 07/06/2023 16:05, Hugo Villeneuve wrote:
> >>>>> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> >>>>>
> >>>>> Some variants in this series of UART controllers have GPIO pins that
> >>>>> are shared between GPIO and modem control lines.
> >>>>>
> >>>>> The pin mux mode (GPIO or modem control lines) can be set for each
> >>>>> ports (channels) supported by the variant.
> >>>>>
> >>>>> This adds a property to the device tree to set the GPIO pin mux to
> >>>>> modem control lines on selected ports if needed.
> >>>>>
> >>>>> Cc: <stable@vger.kernel.org> # 6.1.x
> >>>>> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> >>>>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> >>>>> Reviewed-by: Lech Perczak <lech.perczak@camlingroup.com>
> >>>>> ---
> >>>>>  .../bindings/serial/nxp,sc16is7xx.txt         | 46 +++++++++++++++++++
> >>>>>  1 file changed, 46 insertions(+)
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/serial/nxp,sc16is7xx.txt b/Documentation/devicetree/bindings/serial/nxp,sc16is7xx.txt
> >>>>> index 0fa8e3e43bf8..1a7e4bff0456 100644
> >>>>> --- a/Documentation/devicetree/bindings/serial/nxp,sc16is7xx.txt
> >>>>> +++ b/Documentation/devicetree/bindings/serial/nxp,sc16is7xx.txt
> >>>>> @@ -23,6 +23,9 @@ Optional properties:
> >>>>>      1 = active low.
> >>>>>  - irda-mode-ports: An array that lists the indices of the port that
> >>>>>  		   should operate in IrDA mode.
> >>>>> +- nxp,modem-control-line-ports: An array that lists the indices of the port that
> >>>>> +				should have shared GPIO lines configured as
> >>>>> +				modem control lines.
> >>>>>  
> >>>>>  Example:
> >>>>>          sc16is750: sc16is750@51 {
> >>>>> @@ -35,6 +38,26 @@ Example:
> >>>>>                  #gpio-cells = <2>;
> >>>>>          };
> >>>>>  
> >>>>> +	sc16is752: sc16is752@53 {
> >>>>
> >>>> Since you keep sending new versions, fix the names. nNode names should
> >>>> be generic. See also explanation and list of examples in DT specification:
> >>>> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> >>>
> >>> Hi,
> >>> by the way, I do not "keep sending new versions" just for the fun of
> >>> it...
> >>
> >> Sure, I know. So when the next version is necessary to send, fix also this.
> >>
> >>>
> >>> Even after reading your link, I cannot see what is wrong with that
> >>> name.
> >>
> >> They are not generic. They are specific.
> > 
> > What do you mean by "They"? My patch adds only a new property...
> 
> Your patch adds multiple new examples. My comment was at appropriate
> place to fix, although only the first place. I did not refer to
> unrelated pieces or other parts of the code. Specifically - I wrote
> nothing about property.

Ahhh!!!!!!!!!!!!

Ok, now I see.

But I simply added new examples based on the previous examples, which
already used "inappropriate" names.

If I modify only the node names in my new examples, this will clash
with the existing examples.

I have already prepared a new patch, that I will send one day if we can
ever finish this never ending series, to convert the binding to YAML,
and to fix a few things with old properties missing vendor prefix,
etc.

I will modify all the examples in this new series to follow what you
suggest and incorporate it into this new serie.

Hugo.


> > This patch will not fix old names, but a future patch could do it.
> 
> No worries, I asked for new code.
> 
> > 
> > And what do you mean by "They are not generic. They are specific". Of
> > course the property is specific, because it relates to something very
> > specific to this chip?
> 
> Again, I did not comment under a property. I did not refer to any property.
> 
> 
> Best regards,
> Krzysztof
