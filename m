Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C473B34FB4A
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Mar 2021 10:12:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234351AbhCaIMJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Mar 2021 04:12:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234301AbhCaILq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Mar 2021 04:11:46 -0400
Received: from polaris.svanheule.net (polaris.svanheule.net [IPv6:2a00:c98:2060:a004:1::200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3A38C061574
        for <linux-gpio@vger.kernel.org>; Wed, 31 Mar 2021 01:11:44 -0700 (PDT)
Received: from [192.168.1.109] (47.118-244-81.adsl-dyn.isp.belgacom.be [81.244.118.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 1E48E1E82E4;
        Wed, 31 Mar 2021 10:11:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1617178303;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8I4Akj4tbOIc1+p/z0TzNt8/RgQx346agZg2BTpdPKk=;
        b=hVLcEXWk6qWe8v7SAyaRn3QAwucZyGZkIoYL2IbbtjBTRpDS++UdevwfPNYpEwy0nFZu3H
        /YD7pQTZ8V49sqIuAvJ4flBulDzekcfKfoYYfCBShwopvG+Y1b3uQvZ7DjASoIZAJOQ6Wb
        iE0jrvo/Pi1BDiXWVf83QmnvCBG5DWelb7/ne+gb3QXyTHnf5M1f7MlTj2GtMu4YOW+Bbl
        mkgRArTxLCLZLZjD1usC33GT4Ty1sFK2m+IgssaqAIywp84wYaYR5GCK6l804eHWRfL4M9
        ibjZnEsZijbSt1ZeIc9sFeHI3m4BISJusOzRTA066rtN/ku2JHOZBlSkDriQlA==
Message-ID: <daa8e1897fb15048ae4aac44bfb01461b46c8d3d.camel@svanheule.net>
Subject: Re: [PATCH v6 0/2] Add Realtek Otto GPIO support
From:   Sander Vanheule <sander@svanheule.net>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-devicetree <devicetree@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Bert Vermeulen <bert@biot.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>
Date:   Wed, 31 Mar 2021 10:11:41 +0200
In-Reply-To: <CAMpxmJWGuS_ae_cGsvWmhu3NBtsnK-ZutJeCphJSR=Xn7qKFMg@mail.gmail.com>
References: <20210315082339.9787-1-sander@svanheule.net>
         <cover.1617126277.git.sander@svanheule.net>
         <CAMpxmJWGuS_ae_cGsvWmhu3NBtsnK-ZutJeCphJSR=Xn7qKFMg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 2021-03-31 at 09:49 +0200, Bartosz Golaszewski wrote:
> On Tue, Mar 30, 2021 at 7:48 PM Sander Vanheule
> <sander@svanheule.net> wrote:
> > 
> > Add support for the GPIO controller employed by Realtek in multiple
> > series of MIPS SoCs. These include the supported RTL838x and
> > RTL839x. The register layout also matches the one found in the GPIO
> > controller of other (Lexra-based) SoCs such as RTL8196E, RTL8197D,
> > and RTL8197F.
> 
> Series applied, thanks!

Thanks for merging, and thanks for the discussion everyone!

Best,
Sander


