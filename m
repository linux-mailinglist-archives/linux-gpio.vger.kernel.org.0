Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0DE1734EE9
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jun 2023 10:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230387AbjFSI7f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Jun 2023 04:59:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230157AbjFSI7V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Jun 2023 04:59:21 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 059A4B1
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jun 2023 01:59:20 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-514ab6cb529so8299408a12.1
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jun 2023 01:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687165158; x=1689757158;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/llmMEuFj1eUdKb0ubg9ZQI7gcUHbEa2YR33UzfkEec=;
        b=O+0YliB66Sx25vfgVYz4Y76ARzBSlDLrhPMTqKzUUh7SZVUxpdWM+37wec57vqMg7A
         CftSWmGytZDniVa/pLbEpeqSJ5gO3vI5mH+wgF7Kjs7WEorRBeshhEW7sk5n+2H3zFm7
         /94soQ3YqQT3muzRj/wwJ+slO/D4CSpam1qsk5IVWX8nx47T9JjbEPJkYzCe70B1qYqI
         Ut+OrCNlwnzZ6slg2x3E1iv5EL17Z94yuwN6ybypaWsDdsPHf3zOhEMsnyTNTzMniJv7
         Mz97I4dOSBTMUYJHPG97zJZxcQqiQTLR6/ykHi722U2IAneEDzYqR6EpBNVsq+uc/u7s
         nb8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687165158; x=1689757158;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/llmMEuFj1eUdKb0ubg9ZQI7gcUHbEa2YR33UzfkEec=;
        b=iE7kQV7Sl92zlHgrJJtrO93qmZvfjf3i1jiwZPf8rLGafolWX/dQCtTl1PGdDPBWUK
         FHPjKi36xq9DrElG8MlvcEvrvdX7OOJT5414qnay845V9zyIAh3B23AycQ78AnUCR7vv
         p7b1/Bd8WHPv9UJu0lGYz7L+dHHziVYy+Fy3M01sHiKkJsyKzVpA/GLwpg35GQOSr7ds
         NHKvDgFVQ+jsupyEwYZV8gJ5NfjelMoo54F48Tn733HbAbpQ14UYpAiOYWDKeNynMkcG
         lgGtCxMGBgcYMVKiB6N5f+aHBHBifl/dXCX7WHhOwLapyyHATnypyjznplzku936sBwW
         ur6g==
X-Gm-Message-State: AC+VfDy2YWGGWQnJJ0sWaanERLdzbdyNDQXaAAOApVOkEQjyLbAPpEur
        AFXRtb/E9y0hTDBRtbuSMi0kRg==
X-Google-Smtp-Source: ACHHUZ4SxIJXlDroI1JHQK94yBvXPZ3Ua9KQwl3/qoFlasDQUysRoMrH4qC2/KKEwZ/8CeBmj9gO5g==
X-Received: by 2002:a17:906:974a:b0:974:5a12:546 with SMTP id o10-20020a170906974a00b009745a120546mr7892200ejy.23.1687165158511;
        Mon, 19 Jun 2023 01:59:18 -0700 (PDT)
Received: from localhost (i5C740111.versanet.de. [92.116.1.17])
        by smtp.gmail.com with ESMTPSA id r26-20020a1709067fda00b0096a1ba4e0d1sm14458588ejs.32.2023.06.19.01.59.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 01:59:17 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 19 Jun 2023 10:59:17 +0200
Message-Id: <CTGI4TBHMWFZ.1M1XOQ3SK26IF@fedora>
Subject: Re: [libgpiod][PATCH] bindings: rust: fix clippy lint warnings
Cc:     "Kent Gibson" <warthog618@gmail.com>, <linux-gpio@vger.kernel.org>,
        <brgl@bgdev.pl>
To:     "Viresh Kumar" <viresh.kumar@linaro.org>
From:   "Erik Schilling" <erik.schilling@linaro.org>
X-Mailer: aerc 0.14.0
References: <20230612154055.56556-1-warthog618@gmail.com>
 <CTC81IMWHW2L.28NQLXAIFP60L@fedora> <ZIl6X8YAUHS/n5s8@sol>
 <CTGGDNWWBD6E.FLAMJGXFKF3S@fedora> <ZJAKTdRVEwZfnKb+@sol>
 <CTGH61DGZBIQ.RVXF4UG9BYH2@fedora>
 <20230619085017.lifz2hcqzi6fam2k@vireshk-i7>
In-Reply-To: <20230619085017.lifz2hcqzi6fam2k@vireshk-i7>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon Jun 19, 2023 at 10:50 AM CEST, Viresh Kumar wrote:
> I missed these earlier, thanks for cc'ing me now Kent.
>
> On 19-06-23, 10:13, Erik Schilling wrote:
> > On Mon Jun 19, 2023 at 9:57 AM CEST, Kent Gibson wrote:
> > > My reasoning was simply that building the bindings as you suggested
> > > resulted in lint warnings, which is noisy and iritating when trying t=
o
> > > lint my own code.
> >=20
> > I fully agree that we should fix them! I was just confused about the
> > explanation.
> >=20
> > > But I'm just the messenger.  Your question would be better directed a=
t
> > > Viresh - it is his code so he should be able to tell you why the cast=
s
> > > are there.
> > > IIRC we needed the casts historically, though I don't recall the rust
> > > version we were using at the time.
> > > If we've moved beyond that then I have no problem with the casts bein=
g
> > > removedi, in fact in my initial comment I lamented the fact they were
> > > necessary.
>
> I don't remember the versions used at that time, but here [1] are few
> of the auto-generated FFI bindings that I used to keep in my series
> then, in case these can help.
>
> IIRC, some of these were required for 32 bit builds. Don't remember
> the exact details but there were build / clippy errors / warnings
> without them.
>
> I am fine with updating code based on latest version of Rust and get
> these removed.
>
> Erik: Please build for 32 bit ARM too btw.

Will do. Will try to come up with some test suite that may be
upstreamable too.

>
> --=20
> viresh
>
> [1] https://lore.kernel.org/all/401d9417d895b8b1b19ca577c84347d89f7e0fbd.=
1667815011.git.viresh.kumar@linaro.org/

