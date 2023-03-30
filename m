Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26C1A6D0654
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Mar 2023 15:18:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231953AbjC3NSC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Mar 2023 09:18:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231952AbjC3NSA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Mar 2023 09:18:00 -0400
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 772DBAD05
        for <linux-gpio@vger.kernel.org>; Thu, 30 Mar 2023 06:17:52 -0700 (PDT)
Received: by mail-ua1-x929.google.com with SMTP id ay14so13742039uab.13
        for <linux-gpio@vger.kernel.org>; Thu, 30 Mar 2023 06:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1680182271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOH9bhj9mcqY6znBQ+V+BoH/PdxPEL1zl8pK42vZx/o=;
        b=6aHbLNbsFZl7EKVIxCmVqZUlq4s3nuRNhHzz8zXcHv0IpE9zwFPzp6yc5lDMYHjrST
         F8+qifaMVOYcTEjAkYsykSWRvx/D2xWg+vTxc9r+shMOWEP5mKaTG5upTaK2g6CtnOq/
         ZgV4qnocLvdofIdN3GA9g6UPTxt4hOHsBFQxXL6YtIVp/xJ8EdLYpWdJj8B2CL4e3GdH
         BXkWJHbOVrrhzpbW+LTZfDD50wekz6tUNXf2/NgD07K9kHXcgRgeUVmTak3au1kjfNVS
         00PRdjpWupYqIzX4zKpse+Lj+ogPkx2mSTKR0hdXGNFdFaEvx2cXuRXd2JTg4AfUiiM8
         wLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680182271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jOH9bhj9mcqY6znBQ+V+BoH/PdxPEL1zl8pK42vZx/o=;
        b=yjQ7PD53JGi+xcNMF/PjmikfaF5cSvVYTDmut51Spm9RLeeGbPjVgQcUtFYiXmruUY
         AstI4XlNa4YIKIY29F2sRSS62mfzNH3jR8qv7Oc+zc5pItEUt7y+UANzxnylgJULREMd
         ciVbQKnGQ2LEhPPZqVFUgL6MpFLe9Z32JI8NeI1cOK6mYl6mZxOLA/r5HGzgzFcwnP4O
         8u6gYRlDlfkWOoncTc97akvqA8Ab9MeY9kh1s1WF7jZ4cGdf/DVQuHxUQT/P149znNkL
         LcAAhlGDTMnJzo/m09JLLab2kHdqv/anp9EGM4rhalIFjVR8EcEKGLpV8JswTTHbBggH
         eOrg==
X-Gm-Message-State: AAQBX9fkbw7viLGOWziLdypmMfZgX+vPklmLc+aH/h6cgYzxF0W74JJH
        fM446hwJ7JZXrcahssRNSpWain9M1QURh6fevZe1ew==
X-Google-Smtp-Source: AKy350a1LG/3QeRlb/S4n2XGp4RNbXZM/GLy/7CtvPE0LgrdLfEx1uMKTrMgOUv5hNRdCOlueQ0bkBBgHMMy5MVzRYc=
X-Received: by 2002:a1f:27d0:0:b0:43a:d64:5aba with SMTP id
 n199-20020a1f27d0000000b0043a0d645abamr12646034vkn.2.1680182271485; Thu, 30
 Mar 2023 06:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230327125316.210812-1-brgl@bgdev.pl> <20230327125316.210812-7-brgl@bgdev.pl>
 <20230330131324.GQ434339@google.com>
In-Reply-To: <20230330131324.GQ434339@google.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 30 Mar 2023 15:17:40 +0200
Message-ID: <CAMRc=MfNNsiqzgCSF3xcuJf6LND+_cer9_vq3BZq3vvsb_+D-Q@mail.gmail.com>
Subject: Re: [PATCH v3 06/18] dt-bindings: mfd: qcom,spmi-pmic: add compatible
 for pmm8654au
To:     Lee Jones <lee@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 30, 2023 at 3:13=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> On Mon, 27 Mar 2023, Bartosz Golaszewski wrote:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > PMM8654au is the SPMI PMIC variant used on sa8775p-ride. Add a compatib=
le
> > for it.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > Cc: Lee Jones <lee@kernel.org>
> > Acked-by: Rob Herring <robh@kernel.org>
> > ---
>
> Change-log?
>
> >  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml =
b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> > index 975c30aad23c..0f7dd7ac9630 100644
> > --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> > @@ -79,6 +79,7 @@ properties:
> >            - qcom,pmk8350
> >            - qcom,pmk8550
> >            - qcom,pmm8155au
> > +          - qcom,pmm8654au
> >            - qcom,pmp8074
> >            - qcom,pmr735a
> >            - qcom,pmr735b
>
> I believe this is already applied, right?
>
> Not sure why I have 3 copies of seemingly the same patch in my inbox.
>

I've sent out three iterations of the series containing it. This one
didn't change. As the rest of 18 patches don't concern your subsystem,
I decided to only Cc you on this one. Let me know if you prefer to
receive the entire series even if only a single patch needs your
attention. The reaction to such dumps varies from maintainer to
maintainer so I chose the safe approach. :)

Bart

> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
