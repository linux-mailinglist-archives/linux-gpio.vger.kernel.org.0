Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 967AD6B3C63
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Mar 2023 11:36:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231318AbjCJKgD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Mar 2023 05:36:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230197AbjCJKfl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Mar 2023 05:35:41 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 067E9136C9;
        Fri, 10 Mar 2023 02:35:01 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id p6so2803851pga.0;
        Fri, 10 Mar 2023 02:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678444420;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YrNzsS4yDEQMUDPv9ek+bekWTDdRMD0SzIqqeBsqXfs=;
        b=j7yDOF4vjuMwEC50NwSCaNecKzZ2/3xLGtDe67+v5aE7gFEJV+8w+NQx8s0kvgTst5
         +naqkoEiK0kI7PmpwOb5Z39aKZNATOodTn+e4rIODobgKz7qibnXmEGO/zSzsEwxaEJJ
         Nya/2AXZC+NK7iLeBBktVHDwyoQAIODH98bn6kKcHWhTGloTdt3wjzwXQoip9pUe+SAx
         S1gDd/X+962d6qPwwzxeYCGWzsx5BicoCCYEy0jICNUfQuZ41zQly40a/C1JQkQ+f45C
         AAtJkeim9GRcRkFMG0hHD0Dvbfnm8eHHdMcarpnh5n/nKRsDyvu3YQLBU9/HVR3/9ruY
         ZBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678444420;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YrNzsS4yDEQMUDPv9ek+bekWTDdRMD0SzIqqeBsqXfs=;
        b=FILFd50cMvM3VCkDxVdxW/T4kpuRWZLP0eYXg2YBSsskBhHn6n8P+YSY+noLnXP1xi
         rivo28g5wJ09MottbJ2nU/myd6OtlMiYf2JXfjQbG6pvQ8prr7Xxx/5jTM+OCUcz/y1u
         k3qhajMLuZ2v8gJ9kWlHpiRF5557yb4i3phfxacl5d5UFCpYnd/N3IChToivqojCgR78
         xOAqRN2mxrktbvrBSToKzUD63MTiG7Fxqf1MEpbVqJzW9phurbRAr61t6UfXFw8uTpe6
         p/9e00R2AOh77I1Z6pqyUZRgBxofSZmhATBPoArrGfIfvObKJMzUCWziwCfKNspDjo2f
         VktA==
X-Gm-Message-State: AO0yUKU/piPmC1FhfGXXE2FRtEaCFE8+NXvSYfz8Qsa0ubeqGu+u1y3G
        n2eEhWuHyc6ZgfFx1DTt+8hNgVwt2SK6hI1yjYg=
X-Google-Smtp-Source: AK7set8WnxbFY5oTrVIKnhdrvft3bVtLVrqnp8sLn5OeESTjitANPmUjpUeCrnOQfk59jWma/T/rN7BdO7v9GpO4T8o=
X-Received: by 2002:a62:828e:0:b0:593:da6f:fb1c with SMTP id
 w136-20020a62828e000000b00593da6ffb1cmr10533664pfd.4.1678444419668; Fri, 10
 Mar 2023 02:33:39 -0800 (PST)
MIME-Version: 1.0
References: <20230306191535.1917656-1-sean.anderson@seco.com>
 <20230306191535.1917656-4-sean.anderson@seco.com> <CAOiHx=mcANqHTk9=b0TGHa2rk9nppnKa2EB1v05uHb5jhzoawA@mail.gmail.com>
 <49b24502-1b21-f05b-ef4a-18d5aa375f8d@seco.com>
In-Reply-To: <49b24502-1b21-f05b-ef4a-18d5aa375f8d@seco.com>
From:   Jonas Gorski <jonas.gorski@gmail.com>
Date:   Fri, 10 Mar 2023 11:33:28 +0100
Message-ID: <CAOiHx=k8f6irVChBOtSoUJZiW6VS3sdg_KWhTo+C+ZWoGmmfdQ@mail.gmail.com>
Subject: Re: [PATCH v10 03/13] dt-bindings: Convert gpio-mmio to yaml
To:     Sean Anderson <sean.anderson@seco.com>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-phy@lists.infradead.org,
        Madalin Bucur <madalin.bucur@nxp.com>,
        linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Camelia Alexandra Groza <camelia.groza@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?UTF-8?Q?Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 6 Mar 2023 at 22:27, Sean Anderson <sean.anderson@seco.com> wrote:
>
> On 3/6/23 15:51, Jonas Gorski wrote:
> > Hi,
> >
> > On Mon, 6 Mar 2023 at 20:16, Sean Anderson <sean.anderson@seco.com> wrote:
> >>
> >> This is a generic binding for simple MMIO GPIO controllers. Although we
> >> have a single driver for these controllers, they were previously spread
> >> over several files. Consolidate them. The register descriptions are
> >> adapted from the comments in the source. There is no set order for the
> >> registers, so I have not specified one.
> >>
> >> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> >> ---
> >>
> >> Changes in v10:
> >> - New
> >>
> >>  .../bindings/gpio/brcm,bcm6345-gpio.yaml      |  16 +--
> >>  .../devicetree/bindings/gpio/gpio-mmio.yaml   | 136 ++++++++++++++++++
> >>  .../bindings/gpio/ni,169445-nand-gpio.txt     |  38 -----
> >>  .../devicetree/bindings/gpio/wd,mbl-gpio.txt  |  38 -----
> >>  4 files changed, 137 insertions(+), 91 deletions(-)
> >>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
> >>  delete mode 100644 Documentation/devicetree/bindings/gpio/ni,169445-nand-gpio.txt
> >>  delete mode 100644 Documentation/devicetree/bindings/gpio/wd,mbl-gpio.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml b/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
> >> index 4d69f79df859..e11f4af49c52 100644
> >> --- a/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
> >> +++ b/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
> >
> > You are (re-)moving the compatible this file is named after, you might
> > want to rename the file as well then. Going by age bcm6358 would be
> > the next oldest one (bcm6318 would be the newest, despite the lowest
> > number).
>
> I can do that. Would it be fine to rename to e.g. brcm,bcm63xx-gpio.yaml?

I'm not up to date with current naming policies (if there are any at
all), but looking at what's currently there this should be fine.

Jonas
