Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9101A6CB0FE
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Mar 2023 23:51:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbjC0VvX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Mar 2023 17:51:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229815AbjC0VvU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Mar 2023 17:51:20 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 763261FE3
        for <linux-gpio@vger.kernel.org>; Mon, 27 Mar 2023 14:51:19 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id i10so8772108vss.5
        for <linux-gpio@vger.kernel.org>; Mon, 27 Mar 2023 14:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679953878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9qH6rlTsm7Q+HG/U3Vbn83vlXYTPD/5LPZnsPMmWW8=;
        b=EY4a2HgeBVhXmFjgnowhMZkK02L4FDtU35S2U+Sz18i3qaAiQG/mBUWk/bsk2Bb8GN
         yIm6P0kYnI8VcWeu21clt1sEKqYWD0THDNTsqXC/3oI9JzM0afOeBNqi1VI6v9ETWCQy
         S/rgTEXirXahFuxukMD4p548hkrnw6EvpiMG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679953878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O9qH6rlTsm7Q+HG/U3Vbn83vlXYTPD/5LPZnsPMmWW8=;
        b=o+zyPgjZ0+3+noivUhMO1XGCZ30SFY77mgKF06BMjlymrtQxsyiS55b9pkNlJ8LXSo
         zsdjJ3FjaBmYtWQeEnvd1e7CM5rpZpr0Mwt4PbnnUZsEisVrf/qPcHhHqk1eRvwDZbPc
         LyNBLb5PA69Ca/kuSFb9o0A1ZDFRYQiKdqjt3e6ruaYUAxcNkAHoeRGjDh+95Dm2ya/j
         8Y3c5TSmGBCnHR0mZxukqbPg+HC+aHu+XW6pMlpKqVelOR/VZp8dS42fgNDRRVmkTl+V
         PChb8QukFnlPjz338DcqDVPDXDj6nf+8PMOKBxlcwLqZfRK7CzrPFi5vvIC/N8zWvW0V
         zSOQ==
X-Gm-Message-State: AAQBX9d3x5dL/JqX+PUaTnE//vZmbQBHtCAaTymTtyazRzd1owRGsoKQ
        mLMlggI2DXChfgzn+mvuM16nC1CW/gYGMZr923A=
X-Google-Smtp-Source: AKy350Znp4LDpbiaFkN30O/yTzv2kYGbMapB3OREh+8Tjqz05T+HvMeT/b27nxrwRyuSwQOOpeHnrA==
X-Received: by 2002:a67:ebcb:0:b0:425:e739:7ed2 with SMTP id y11-20020a67ebcb000000b00425e7397ed2mr4935489vso.34.1679953877773;
        Mon, 27 Mar 2023 14:51:17 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id q10-20020a9f378a000000b006904fa86e7csm3684602uaq.2.2023.03.27.14.51.16
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 14:51:16 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id cz11so8785694vsb.6
        for <linux-gpio@vger.kernel.org>; Mon, 27 Mar 2023 14:51:16 -0700 (PDT)
X-Received: by 2002:a05:6102:4711:b0:425:f1e7:fecf with SMTP id
 ei17-20020a056102471100b00425f1e7fecfmr6513084vsb.7.1679953876235; Mon, 27
 Mar 2023 14:51:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230323173019.3706069-1-dianders@chromium.org> <CACRpkdaGpaiOVjEN6Ftq5=-yuAyD0xb7OcvtEsoqbTzias-xxw@mail.gmail.com>
In-Reply-To: <CACRpkdaGpaiOVjEN6Ftq5=-yuAyD0xb7OcvtEsoqbTzias-xxw@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 27 Mar 2023 14:51:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W6QKfQxGcSrQdgp4VHYxfk7aYZOkYx4ve7QSpoZ-LM=A@mail.gmail.com>
Message-ID: <CAD=FV=W6QKfQxGcSrQdgp4VHYxfk7aYZOkYx4ve7QSpoZ-LM=A@mail.gmail.com>
Subject: Re: [PATCH 00/14] Control Quad SPI pinctrl better on Qualcomm Chromebooks
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-gpio@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rajesh Patil <rajpat@codeaurora.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Mon, Mar 27, 2023 at 2:45=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Thu, Mar 23, 2023 at 6:31=E2=80=AFPM Douglas Anderson <dianders@chromi=
um.org> wrote:
>
> > The main goal of this series is to do a better job of cI can apply ontr=
oling the
> > pins related to the "Quad SPI" IP block on Qualcomm Chromebooks. This
> > is essentially 'v2' of my previous attempt in the patch ("arm64: dts:
> > qcom: sc7180: Fix trogdor qspi pull direction") [1] but since it's
> > spiraled out a bit and there are no patches that are exactly the same
> > I've reset to v1.
> >
> > The early patches in this series are just no-op cleanup patches that
> > can be applied. They're not terribly critical but since they are
> > "Fixes" I've listed them first.
> >
> > The next patch in the series is a very simple and (hopefully)
> > non-controversial SPI patch. It can be applied independently if
> > anything else.
> >
> > Next, we have a bunch of pinctrl patches (including the device tree
> > bindings related to them). I dunno what folks are going to think about
> > these. If everyone hates them, we can drop them and just change the
> > later patches in the series to use "input-enable" instead of
> > "output-disable". It feels ugly to me, but it maybe less upheval.
> >
> > Next I removed the now-deprecated "input-enable" property from all
> > Chromebooks. None of them were necessary.
> >
> > Finally, I did what I really wanted to do in the first place: attempt
> > to cleanup the pinctrl states of the Quad SPI. These patches have a
> > hard requirement on the pinctrl change.
>
> This looks good to me (TM)
>
> Do you have a merge plan?
> I can queue the pinctrl patch into the pinctrl tree, and
> the pinctrl binding patches.
>
> Will you take the rest to the SPI and SoC tree?
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

My thoughts:

1. Mark could land the SPI patch at any time, assuming he's OK with
it. It can land totally independently.

2. First 7 dts patches could land in the Qualcomm tree. There are no
dependencies on these ones other than the commit message of some of
the later dts patches talking about the pinctrl patches.

...then...


Option A:

3. You land the pinctrl and binding patches in an immutable branch and
merge into pinctrl.

4. Bjorn merges the immutable branch into the Qulacomm tree and places
the last 3 dts patches atop.


Option B:

3. You Ack the pinctrl patches and Bjorn lands them all, plus the last
3 dts patches.


Option C:

3. You land the pinctrl patches, then we want a few months and land
the last 3 dts patches.
