Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3398A743A03
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jun 2023 12:53:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbjF3Kxl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jun 2023 06:53:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbjF3Kxk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jun 2023 06:53:40 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE71735A0
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 03:53:38 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4fba74870abso318255e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 03:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688122417; x=1690714417;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0SCVOclQYR4CvjHwArvk+C45vaktpQKJ5Rv353kmlsI=;
        b=Tfulz2km05lPRakPRpg5/9vNAHeumv2pOCkFs2JWdYxz6UVHrqMEPYoY2FbsGGIBvt
         veOiVyHenzFKuoqcYpVPG9RO4Jy01jmCzw+NQOfus8BuyCGnD4Nohg+8pNpEGFrWjUfH
         JAQu+aNo5kQd4uIxe63unbC3XyNOGMtRDxR6Ei71feDccu6LQ/9lJOZEMw3h7q0AFAX8
         psioEZR31mUhs/ltjzwNggQiCUMXQVrxDMfLqw6e1kmzKfgTOG/6pR6QDxBiSj95WFs1
         XyIuD6ZkI9z/3kGHN82/neSbxKnq/eAamSpdJoAbl0ylhaOK5tELSNWfeg7QDCsZaZj5
         QliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688122417; x=1690714417;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0SCVOclQYR4CvjHwArvk+C45vaktpQKJ5Rv353kmlsI=;
        b=ZGZXal4mSKh3hkB6cN6KAQhOfGfjcBAbY0lf0OaErZE7+ey3bibiBTAb0TMCtQdZsM
         18y1hksPnUG4vprNHyqz4R2BR4bravDHOvWdliSUYHrFmc4liFpKAcIZ6QC+EDGDqQTO
         wVvx/FLVX8gTjMxcKZzzqjX01W8uKDG5BQJZkCX8tRI/Vj0uJDlGSzKVf6kR0L5zNRC5
         +s9+hDR4ypTtYOiBkcSg3hYxhd5i5ZrVrqey/Sy8YjHxeQH83GUYd+Q7S1qVQVKHDmet
         BfH4jOuGj3DU6aoOWRhHx0BymIGkOnTzypKm4NyT4Ls/SnMToO5IWqghFoNX7G1AFKP6
         yakg==
X-Gm-Message-State: ABy/qLarWuNqcYaYYfhzqT/+tKsKjVXGlo7hzB6TRKbgAymxhCeUjE9p
        ClsEfumMW4+OLUmbvqYr789onQ==
X-Google-Smtp-Source: APBJJlGs338rVtKCpGMsyfr5kpPNUgtv9KE9w+E1mySYt19bU6kTfMhw1YRUPpSmBcGKux0KXFlidA==
X-Received: by 2002:ac2:4e8f:0:b0:4f7:6017:8fb with SMTP id o15-20020ac24e8f000000b004f7601708fbmr1741575lfr.26.1688122417142;
        Fri, 30 Jun 2023 03:53:37 -0700 (PDT)
Received: from localhost (i5C743877.versanet.de. [92.116.56.119])
        by smtp.gmail.com with ESMTPSA id v2-20020a5d6102000000b003127a21e986sm17774996wrt.104.2023.06.30.03.53.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jun 2023 03:53:36 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 30 Jun 2023 12:53:36 +0200
Message-Id: <CTPXGBYT71JR.290ZDBVD3EMM7@fedora>
Subject: Re: [PATCH libgpiod 4/4] bindings: rust: clippy: silence
 false-positive on iterator
Cc:     "Linux-GPIO" <linux-gpio@vger.kernel.org>,
        "Viresh Kumar" <viresh.kumar@linaro.org>
To:     "Kent Gibson" <warthog618@gmail.com>
From:   "Erik Schilling" <erik.schilling@linaro.org>
X-Mailer: aerc 0.14.0
References: <20230629-clippy-v1-0-9ff088713c54@linaro.org>
 <20230629-clippy-v1-4-9ff088713c54@linaro.org> <ZJ6bd8+oDbyX06rp@sol>
 <CTPWFHFJNFFA.2SGA858S5QIJ5@fedora> <ZJ6sQYctu9mHqQP5@sol>
 <CTPXANU2HUHF.3UJIZX6CQV4UF@fedora> <ZJ6zaq2JCQvMcnTh@sol>
In-Reply-To: <ZJ6zaq2JCQvMcnTh@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri Jun 30, 2023 at 12:50 PM CEST, Kent Gibson wrote:
> On Fri, Jun 30, 2023 at 12:46:11PM +0200, Erik Schilling wrote:
> > On Fri Jun 30, 2023 at 12:19 PM CEST, Kent Gibson wrote:
> > > >=20
> > >
> > > That is the only test failing out of the whole suite, so gpiosim is n=
ot
> > > the problem.
> > >
> > > That is with the latest from the Raspberry Pi rpi-6.4.y branch[1]
> > > (a867309b7a55 so a few days old now), with CONFIG_GPIO_SIM so that I =
can
> > > run the tests.
> > > Happens to be running on a Pi ZeroW, but I don't think that test is s=
peed
> > > sensitive.  I have done a complete rebuild - same result.
> > >
> > > Are there any distos enabling GPIO_SIM yet?
> >=20
> > Fedora does now (after I asked for it [2]). But it does not support any
> > 32-bit ARM targets anymore :/. Can you try reproducing it without the
> > patches? I would be surprised if this was related to the patches.
> >=20
>
> Tried that - same result with libgpiod master.
> So it is not from your patches.

Thanks for checking! Will try to reproduce it in the next weeks.

- Erik

