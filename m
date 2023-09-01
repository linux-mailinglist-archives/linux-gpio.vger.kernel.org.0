Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 027B378FFA7
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Sep 2023 17:09:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350115AbjIAPJA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Sep 2023 11:09:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345398AbjIAPI7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Sep 2023 11:08:59 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7334210D2
        for <linux-gpio@vger.kernel.org>; Fri,  1 Sep 2023 08:08:56 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-99bcfe28909so242513766b.3
        for <linux-gpio@vger.kernel.org>; Fri, 01 Sep 2023 08:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693580933; x=1694185733; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ir5d0LdfkLCgxj9RUuUc7L+7Tk1dgspXe4TSyCCKnNc=;
        b=e4U+qKEKPEWC3jTX2lC28xipxDQopFEEUwrwvYsB27iMP1qovCp/1Tsb8Qj4JDzi2T
         VbX8XSbsDpxAtqb2+IIZYRGa7/EaCeisnqMFjKYe1xn0wkcx7mBtTzdccRc0oOtRhb47
         w3BaeJyPXFpvGVwvqNXxRvhKUrGLs6h93c+N0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693580933; x=1694185733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ir5d0LdfkLCgxj9RUuUc7L+7Tk1dgspXe4TSyCCKnNc=;
        b=EgL9ahCcNZYLyjlBvppb9HbNiLYFNxkHFrlsHiJDqiQr7jl1o6BBb7ve6cYaHC68zU
         nKjn8aK8Ufuup4hKGOrbriB0vAz7mmuCf9H/TTLYEme2QywsfCqElIPJW3keM0UvR7Vn
         KQT+YGZQs7xbD0liFKQEaAo/pCH/xP6n6YtH7z23kp0hTRyEFQ79mgKCSZICsOB4XtQj
         En9ScZ1Q0r50SEttGqsQL9kWbNOWYtWOBitvK4WFLBRJ55QY5l8c4j3n0GBLu0bM3vif
         GpIlgUacziZlesXGituK7sSZZLKhbTMU3Kmu6OAwyeOwHfbug4UMV1+hjiwyzzJQlTnw
         KcHg==
X-Gm-Message-State: AOJu0YyCyvLH6Wgjm0Qm33j5upVHRLMwH/IKyHuSivfuepfesWcUY5KF
        vdSzCjNXx/rsTs3IC0tuu+BCfxR7B3lt+x8974MrlNg9
X-Google-Smtp-Source: AGHT+IESBEounnNXh2ksmwC1wh5khqu8p8qPjNk5qtpiczORgzXdDU7yEhCblfboi8j14eminqlW8A==
X-Received: by 2002:a17:906:3098:b0:9a5:7ade:b5e1 with SMTP id 24-20020a170906309800b009a57adeb5e1mr2077144ejv.70.1693580933753;
        Fri, 01 Sep 2023 08:08:53 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id g23-20020a170906869700b0099cc1ffd8f5sm2060326ejx.53.2023.09.01.08.08.52
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Sep 2023 08:08:53 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4005f0a6c2bso55545e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 01 Sep 2023 08:08:52 -0700 (PDT)
X-Received: by 2002:a05:600c:282:b0:3fe:dd72:13ae with SMTP id
 2-20020a05600c028200b003fedd7213aemr166371wmk.0.1693580932622; Fri, 01 Sep
 2023 08:08:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230830-fp5-initial-v1-0-5a954519bbad@fairphone.com>
 <20230830-fp5-initial-v1-2-5a954519bbad@fairphone.com> <CAD=FV=WS2hgY=bQjLOs3Fdp8pbZyMsaS-0BpoxPq90Etfi+Xuw@mail.gmail.com>
 <CV5YJVXIL8OT.1ZWW3KVCHPTA5@otso> <CAD=FV=XhdORH=naTtoc+kCC4A7UdAJKwq=Te6B3qvXNGBwBieg@mail.gmail.com>
 <CV7O0TYYEFA8.1Q42JITFSW77Q@otso>
In-Reply-To: <CV7O0TYYEFA8.1Q42JITFSW77Q@otso>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 1 Sep 2023 08:08:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UG-dFg7wZsn6n=pkejie0fr+G0q3CguNspGYxoC2ZBLw@mail.gmail.com>
Message-ID: <CAD=FV=UG-dFg7wZsn6n=pkejie0fr+G0q3CguNspGYxoC2ZBLw@mail.gmail.com>
Subject: Re: [PATCH 02/11] nvmem: qfprom: Mark core clk as optional
To:     Luca Weiss <luca.weiss@fairphone.com>
Cc:     cros-qcom-dts-watchers@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Fri, Sep 1, 2023 at 7:54=E2=80=AFAM Luca Weiss <luca.weiss@fairphone.com=
> wrote:
>
> > > > So maybe the right fix here is to just change your dts to specify o=
ne
> > > > memory region?
> > >
> > > I got feedback from Konrad that this here would be the preferred
> > > approach compared to having a different dts for ChromeOS vs non-Chrom=
eOS
> > > devices. I don't feel strongly to either, for me it's also okay to
> > > remove the extra memory regions and only have the main one used on
> > > regular qcom devices.
> > >
> > > Let me know what you think.
> >
> > I don't hate the idea of leaving the extra memory regions in the dts.
> > They do describe the hardware, after all, even if the main OS can't
> > actually access those memory regions. ...though the same could also be
> > said about the clock you've removed. Said another way: if you want to
> > fully describe the hardware then the dts should have the extra memory
> > regions and the clock. If you are OK w/ just describing the hardware
> > in the way that the OS has access to then the dts should not have the
> > extra memory regions and not have the clock. Does that sound right?
>
> Not sure which of those memory regions are actually accessible on this
> board, but honestly I don't even want to try accessing it. Blowing fuses
> is not my wish there ;)
>
> On downstream the node is just described like the following:
>
>         qfprom: qfprom@780000 {
>                 compatible =3D "qcom,qfprom";
>                 reg =3D <0x780000 0x7000>;
>                 ...
>         };
>
> So we have 0x780000 - 0x786fff here.
>
> In sc7280.dtsi we have the following:
>
>         qfprom: efuse@784000 {
>                 compatible =3D "qcom,sc7280-qfprom", "qcom,qfprom";
>                 reg =3D <0 0x00784000 0 0xa20>,
>                           <0 0x00780000 0 0xa20>,
>                           <0 0x00782000 0 0x120>,
>                           <0 0x00786000 0 0x1fff>;
>                 ...
>         };
>
> So I guess this:
> * 0x780000 - 0x780a1f
> * 0x782000 - 0x78211f
> * 0x784000 - 0x784a1f
> * 0x786000 - 0x787ffe
>
> So at least the last memory region seems to be partially out of range
> according to downstream.

From the other discussion, it sounds as if you _can_ leave the clock
in the device tree and then use "clk_get_optional" here. IMO then, the
right answer is to use "clk_get_optional" but then also modify the
check below so that instead of:

/* Only enable writing if we have SoC data. */
if (priv->soc_data)
  econfig.reg_write =3D qfprom_reg_write;

It is:

/* Only enable writing if we have SoC data and a valid clock */
if (priv->soc_data && priv->secclk)
  econfig.reg_write =3D qfprom_reg_write;


Does that work for you?


> So after reading all of this I tried running this commmand on the phone
> and the phone reboots into 900e mode.
>
>   $ cat /sys/devices/platform/soc@0/784000.efuse/qfprom0/nvmem
>
> I guess normally this should work? So if I interpret this correctly, the
> Linux driver thinks it can access more than it can/should. But also
> should probably try this command on another chipset to see if it works
> on any really?

Presumably your firmware needs a different "sc7280_qfprom_keepout". If
that's true then I guess you'll have to undergo negotiations with the
DT bindings folks and the nvmem maintainer to figure out how to
specify that your firmware protects different things than the ChromeOS
firmware?


-Doug
