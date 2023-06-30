Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59DFC7439D0
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jun 2023 12:46:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232569AbjF3KqT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jun 2023 06:46:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232382AbjF3KqP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jun 2023 06:46:15 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39C642D56
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 03:46:14 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-98e39784a85so299005266b.1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 03:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688121972; x=1690713972;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YG0VwRPPfJVS79X7CR29Prr/gRGwMRgfsFFi7HZhtJA=;
        b=XvlLidYfQlr9KG305Bs3V83qKjA5HtEXvvYaK3ubfbwIXZWhpe8T0ScrHolXql3r6o
         YYqcz9Ha/H1t7gL5xkof804C2ROG/ITobvgD+3rPUnuSI3I88YO/Zbw9d2tAGic4VGC2
         jKBBXflWy4/P9lDOf5lFCrjK6kO+tZoGPFDjQL+bnD2AZRBQLqddA3rE0fUlxwjpXYHL
         YYA/1R40S4NPEDBNVsfNL6bCwDJstSNlcIAVuYaNEQTkCLgQkTb+PwP84E2C0jJIQA6g
         cJQG4fEOT7CNBBnoy+ZGK+if3wVliOK5qD6EonYNQZpG7jso41k9l+mO4QLVwzplMhEm
         pVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688121972; x=1690713972;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YG0VwRPPfJVS79X7CR29Prr/gRGwMRgfsFFi7HZhtJA=;
        b=CgWLl/9pScN0dy6qKxouNP7ipjPL6tQWmvu4ubBaU/fz7Fuhok2RAmRz/SLXEGptht
         somMkFBqHPzogjcMVb7lO3gaEffIRQpznsd0cocIKgvujEmYqqp3vjmiz5J/VxjLf6g6
         oa6pjMe0xQXY4M6ZkLdfJVb0kd9XwJP/kmyg4qAPdpT5krnRE8PBez4dZtyyVa3tmz+y
         EE1ByY60CY69h0wtgzq8AIta+L3cPSrPzcXFGnz+G/nVkM47I15JohekfBYqK7clGQhv
         N8iWUZjJiEg+O5/IEEst1yudEWJe28OmlXovFFdomJxdbIm0F15i5FBnkSlSoFZ/cm9I
         nH0Q==
X-Gm-Message-State: ABy/qLbfQsdiRy5lMYCJpBF1ZfKjhlioZ6Q2gZyFpShAfEwrQ4OJtuQW
        S6vnJUT9lTMpImSZWcGscNFfXdAb3bwkT6ZDHc8=
X-Google-Smtp-Source: APBJJlGXpAdcoBDJan/QoOoRG7GSS2wlX1xMj6Vn5F1DN/8lWS8WTSBsMlacEReBs13IHJSE690tmg==
X-Received: by 2002:a17:907:9619:b0:992:4723:fc81 with SMTP id gb25-20020a170907961900b009924723fc81mr2622350ejc.17.1688121972732;
        Fri, 30 Jun 2023 03:46:12 -0700 (PDT)
Received: from localhost (i5C743877.versanet.de. [92.116.56.119])
        by smtp.gmail.com with ESMTPSA id t14-20020a170906948e00b0098d2f703408sm7828085ejx.118.2023.06.30.03.46.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jun 2023 03:46:12 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 30 Jun 2023 12:46:11 +0200
Message-Id: <CTPXANU2HUHF.3UJIZX6CQV4UF@fedora>
To:     "Kent Gibson" <warthog618@gmail.com>
From:   "Erik Schilling" <erik.schilling@linaro.org>
Subject: Re: [PATCH libgpiod 4/4] bindings: rust: clippy: silence
 false-positive on iterator
Cc:     "Linux-GPIO" <linux-gpio@vger.kernel.org>,
        "Viresh Kumar" <viresh.kumar@linaro.org>
X-Mailer: aerc 0.14.0
References: <20230629-clippy-v1-0-9ff088713c54@linaro.org>
 <20230629-clippy-v1-4-9ff088713c54@linaro.org> <ZJ6bd8+oDbyX06rp@sol>
 <CTPWFHFJNFFA.2SGA858S5QIJ5@fedora> <ZJ6sQYctu9mHqQP5@sol>
In-Reply-To: <ZJ6sQYctu9mHqQP5@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri Jun 30, 2023 at 12:19 PM CEST, Kent Gibson wrote:
> On Fri, Jun 30, 2023 at 12:05:28PM +0200, Erik Schilling wrote:
> > On Fri Jun 30, 2023 at 11:08 AM CEST, Kent Gibson wrote:
> > > (I am seeing this one test failure on arm32, but that doesn't seem to=
 be related
> > > to this patch:
> > > ---- request_config::verify::default stdout ----
> > > thread 'main' panicked at 'assertion failed: `(left =3D=3D right)`
> > >   left: `OperationFailed(RequestConfigGetConsumer, Errno { code: 2, d=
escription: Some("No such file or directory") })`,
> > >  right: `OperationFailed(RequestConfigGetConsumer, Errno { code: 0, d=
escription: Some("Success") })`', libgpiod/tests/request_config.rs:18:13
> > > note: run with `RUST_BACKTRACE=3D1` environment variable to display a=
 backtrace
> > >
> > > Not sure if that is a genuine bug or something funky in my build.)
> >=20
> > Is the GPIO_SIM module loaded? Did you test with a custom kernel or
> > some distro that ships with it?
> >=20
>
> That is the only test failing out of the whole suite, so gpiosim is not
> the problem.
>
> That is with the latest from the Raspberry Pi rpi-6.4.y branch[1]
> (a867309b7a55 so a few days old now), with CONFIG_GPIO_SIM so that I can
> run the tests.
> Happens to be running on a Pi ZeroW, but I don't think that test is speed
> sensitive.  I have done a complete rebuild - same result.
>
> Are there any distos enabling GPIO_SIM yet?

Fedora does now (after I asked for it [2]). But it does not support any
32-bit ARM targets anymore :/. Can you try reproducing it without the
patches? I would be surprised if this was related to the patches.

I will rebuild my armv7hf VM soon and retry with a self-built kernel.
but not sure when I will get around that.

[2] https://bugzilla.redhat.com/show_bug.cgi?id=3D2215980

- Erik
