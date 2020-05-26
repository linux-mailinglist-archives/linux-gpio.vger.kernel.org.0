Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F015F1E1E43
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2020 11:20:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731705AbgEZJU6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 May 2020 05:20:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731662AbgEZJU6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 May 2020 05:20:58 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64B77C08C5C1
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2020 02:20:57 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id l15so23255118lje.9
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2020 02:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tjIxLurGAZl3ClrqkcDTUozxTD1nDew3Brnlr2xXLqY=;
        b=JCqyYSiMdYS1eYDRtnDeEiedABn2SLAJ9eHMlUwpGPm+5yJt1v4LCf6UvpJc84XRbE
         1cfRRQoLViCSj/Ef6G2XQ1MnDs8XRyleZi6kQTJgM4lW4Eyurn8txIZenaHRroS5F4Ii
         zqWLfi1rIGTUwxWPo6NxZWKxgXdkIdm6Z/9uTNfehAxFi1FZ5QXiVI/oLvhWfxfBZP04
         64YHr1ZbYww9BFPrJ+2zK2C1+oW+dLlk/sZkNNq4aRcvkJ5DbIEeA679CTRIvnoSxtQM
         qA8qkXqWSIUdnpytsjCspoXtwgmZPFRfsVg7QYO2gGDE+hSnc8P9Dw8ZhWPx2fnwvwsb
         qrxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tjIxLurGAZl3ClrqkcDTUozxTD1nDew3Brnlr2xXLqY=;
        b=mdcVm2lUFRFQMsa3mm0jSa18hnYSSDifefaOvrjKmM5SO6EMTVLczJ0SuUy5mK8LkC
         rLApvU8v8bJec2RvQE8g4uv1JG2IY1mSexjbdwiRLTwIvTfb2LRosXmXTTYxFLum9Bi2
         NWpln5lBJ+yjThLQ+A2qEPXFTSg2EPyZDThCQON6Og9QKDtFygX2EavEAaeEgMdBAMn1
         1yNTZ+HXPE3TA35FoLiFRICydR8eqgkOjsnst/tlBcTl/zlHbzYyM6IGtiL244t4Bxyy
         dsmuXVwnUSqPTalYpN5W5gQn03WOr7k8cHUzP2I4NjoGMDxDIox1JO9hO5yfYYCNkgu6
         uHaw==
X-Gm-Message-State: AOAM530LBvZPlwLD0NNjDIO86ee0Ffoml8BPSAMgp1gxtBhMJep+HDfY
        XT60AaJGRuBIuGw1sGV2CAtVOemPmvRaYdMlAIfEfg==
X-Google-Smtp-Source: ABdhPJwg6A/TEx1rm0SmH/Tfvf7jOImMZnrbm86NXCtz4hLlqpfrcSfkYxR6Rag1WIB7c/CsQ4iUICjgpzIFIhw1xII=
X-Received: by 2002:a2e:711c:: with SMTP id m28mr162302ljc.104.1590484855739;
 Tue, 26 May 2020 02:20:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200513141134.25819-1-lars.povlsen@microchip.com>
 <20200513141134.25819-2-lars.povlsen@microchip.com> <CACRpkdZa7OM3bqB+zRprEQ3M4m9hG3uPCoYxrdH_O=oxD8zi8Q@mail.gmail.com>
 <87pnb1nf2j.fsf@soft-dev15.microsemi.net> <CACRpkdYesD9sRQZXQNEaBY2Ouu3bjKKGWpRtU-Lpa4AcjyPwXw@mail.gmail.com>
 <87r1v8oz9f.fsf@soft-dev15.microsemi.net>
In-Reply-To: <87r1v8oz9f.fsf@soft-dev15.microsemi.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 May 2020 11:20:44 +0200
Message-ID: <CACRpkdaJvaqPptPD-A1DriVgBOZGZ4Qf0UsbsjG39ptx6bSJKg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: Add bindings for mscc,ocelot-sgpio
To:     Lars Povlsen <lars.povlsen@microchip.com>
Cc:     SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 25, 2020 at 4:38 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:

> Yes, the problem is they're not in sequence. F.ex. you could have ports
> 0,1 enabled, skip 2,3,4 and have 5,6,7 enabled.

Just use disabled nodes.

That would look like this in my idea of a device tree:

pinctrl@nnn {
    gpio0: gpio@0 {
        compatible = "foo";
        status = "ok";
        ....
    };
    gpio1: gpio@1 {
        compatible = "foo";
        status = "ok";
        ....
    };
    gpio2: gpio@2 {
        compatible = "foo";
        status = "disabled";
        ....
    };
    gpio3: gpio@3 {
        compatible = "foo";
        status = "disabled";
        ....
    };
    gpio4: gpio@4 {
        compatible = "foo";
        status = "disabled";
        ....
    };
    gpio5: gpio@5 {
        compatible = "foo";
        status = "ok";
        ....
    };
    gpio6: gpio@6 {
        compatible = "foo";
        status = "ok";
        ....
    };
    gpio7: gpio@7 {
        compatible = "foo";
        status = "ok";
        ....
    };
};

It is common to use the status to enable/disable nodes like this.

In the Linux kernel is is possible to iterate over these subnodes and
check which ones are enabled and disabled while keeping the
index by using something like:

i = 0;
struct device_node *np, *child;
for_each_child_of_node(np, child) {
    if (of_device_is_available(child)) {
        pr_info("populating device %d\n", i);
    }
    i++;
}

Certainly you can use i in the above loop to populate your registers
etc from an indexed array.

This way the consumers can pick their GPIO from the right port
and everything just using e.g.
my-gpios = <&gpio6 4 GPIO_OUT_LOW>;

Yours,
Linus Walleij
