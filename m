Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB4057E189A
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Nov 2023 03:28:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbjKFC2M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 5 Nov 2023 21:28:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjKFC2L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 5 Nov 2023 21:28:11 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 976AFFB
        for <linux-gpio@vger.kernel.org>; Sun,  5 Nov 2023 18:28:08 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1ca85ff26afso7747505ad.1
        for <linux-gpio@vger.kernel.org>; Sun, 05 Nov 2023 18:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699237688; x=1699842488; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8ICXDgrUHS6vF/SNPSijdTNrJfbN2u8WpcsExfAzl5Y=;
        b=e1o5xTU2yVE18YW1DnaNuNCjKDFO5m3ZS5/vS9lcdpUjkj8FMblQEF6s+J9/7kq9q0
         SBd08vzClQdFYQjWsOxTmwiNWMXZCOMSJr+YvTmvgoPGbb//J/h5+QnQj/4qki2UDX+x
         j/FQM8AERkjkTlYmFA1JG96ixAC/YEQN9/RT3j7VRgb+k9+xKYQm/E1WfJ05BYzAyAhr
         2d6saErNaSxfx0lPKfE4LrRn6tIIkckuMvysYpfNhQskUBRDSwYnllT1DSz4KoynpZCo
         U88xr1xzzZLjRDBGGtRHnakcMrd+INeyJuG1PQi+dXS8yfeIyjcHU11jJ+39hDc+LA1Y
         Hauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699237688; x=1699842488;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8ICXDgrUHS6vF/SNPSijdTNrJfbN2u8WpcsExfAzl5Y=;
        b=GwTkNeuJsDJ1yQLYq9JJsJVeOXpcWd1mGsJ04UVlFNqLDpRuG/1KzCw9lj4ZUnX/Rm
         g55RuN6qrchqUMVY4MMI8fJ/rrBGnjXfBblKr3xlWLs9z3NXsD9SdX2s4G/P8YlVPmRE
         22E46s6wzwHbaGSyFkwGRqjDPFsVnJH+b2/X3o4OIuOkkh3nu2ta76QRIYKhgcT7tcWY
         6QsVi5eyODaC0OxeLCyj6x6/iif65wZKBvO+fMOzT/NlhZNFlywA9zBaigLJIaOXARGO
         tatww7dm8K0LCMmxNI/8jIEmZ+0ysr5Xn809VpBX8kZP6R8wPAjMEfdandd2tTeHU8S8
         2NTg==
X-Gm-Message-State: AOJu0YzzOnc5PssjyCYQJ0/AVcvU/gHhL0PJzmdB4pvYftUh+iBTonKy
        WAB0AoYtu7iXUaicrF+6gu88bA==
X-Google-Smtp-Source: AGHT+IGKeESJ321fkysf/ehuZaNxdclt+G5XHCOjmYZoDKjWobUxbFP67O0IeMp/d/iW1j9dzcL4Nw==
X-Received: by 2002:a17:902:c649:b0:1cc:3202:dcca with SMTP id s9-20020a170902c64900b001cc3202dccamr23138767pls.2.1699237687807;
        Sun, 05 Nov 2023 18:28:07 -0800 (PST)
Received: from octopus ([2400:4050:c3e1:100:44eb:593c:2134:f5ea])
        by smtp.gmail.com with ESMTPSA id jc15-20020a17090325cf00b001cc0d1af177sm4735588plb.229.2023.11.05.18.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Nov 2023 18:28:07 -0800 (PST)
Date:   Mon, 6 Nov 2023 11:28:03 +0900
From:   AKASHI Takahiro <takahiro.akashi@linaro.org>
To:     Cristian Marussi <cristian.marussi@arm.com>,
        Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
        "sudeep.holla@arm.com" <sudeep.holla@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [RFC v5 3/5] firmware: arm_scmi: Add SCMI v3.2 pincontrol
 protocol basic support
Message-ID: <ZUhPMxpho1WR5b+8@octopus>
Mail-Followup-To: AKASHI Takahiro <takahiro.akashi@linaro.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
        "sudeep.holla@arm.com" <sudeep.holla@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
References: <cover.1698353854.git.oleksii_moisieiev@epam.com>
 <7300b8804396075d2ae565f46de51a980ce846e6.1698353854.git.oleksii_moisieiev@epam.com>
 <ZUNYkRtXUPeM4ppS@pluto>
 <ZUhOw0+HVcJYmvp6@octopus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZUhOw0+HVcJYmvp6@octopus>
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URI_DOTEDU autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 06, 2023 at 11:26:11AM +0900, AKASHI Takahiro wrote:
> On Thu, Nov 02, 2023 at 08:06:41AM +0000, Cristian Marussi wrote:
> > On Fri, Oct 27, 2023 at 06:28:10AM +0000, Oleksii Moisieiev wrote:
> > > Add basic implementation of the SCMI v3.2 pincontrol protocol.
> > > 
> > > Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> > > ---
> > 
> > Hi Oleksii,
> > 
> > the new get/set v3.2 implementation seems finer to me at first sight.
> > I'll try to test this next days and give you more feedback.
> 
> I don't think that this version addresses my comment yet:
> 
> https://lkml.iu.edu//hypermail/linux/kernel/2308.2/07483.html
> 
> I hope that it will be fixed in your *final* v5.

Oops, this comment should better go against patch#4/5.


> -Takahiro Akashi
> 
> > Thanks,
> > Cristian
