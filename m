Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C061135851F
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Apr 2021 15:49:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231638AbhDHNtR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Apr 2021 09:49:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231719AbhDHNtQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Apr 2021 09:49:16 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5803FC061762
        for <linux-gpio@vger.kernel.org>; Thu,  8 Apr 2021 06:49:05 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id v140so4153857lfa.4
        for <linux-gpio@vger.kernel.org>; Thu, 08 Apr 2021 06:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UTgjJ3FHb3vPYX9JqUC+Xv2zcOSZzBL4YmbnqLtgQjA=;
        b=o4TSUSwHiiAAjF3VFtEcrQ4tpvWBkGs9ERxSNW5uZzLtvNG9jhjcMRPamT/5o9/e0W
         BUsZ3k5gpkaZogfOl7aOj5p62Oese6YpCGS1rgrCXQfWePMOeL+xw7j2qYtwC3oGjanw
         U84H3swzdTy5ppJvjX24OvmqblWycknA1u1OC2ULZTxrvia7LAa04EAJKyrkIYN3XSDk
         jveX6QjfyaoRGwlXxWhn3whB5h8igUqUcgNjB3dLBmsU3D54LKOv4tZeNzCRB+YyTfnr
         /kKlug35HLva8AbJEfxcKjzSsIIm3XucQlzZm3btrgmKxZs9G9ycKYJCdpfwr22w4m+f
         LPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UTgjJ3FHb3vPYX9JqUC+Xv2zcOSZzBL4YmbnqLtgQjA=;
        b=jOTplZ8kkpRbEO+hdaPlf5gJkyygLdDYA/BgRie3dPjc+wyUuyU33KxcyIXmMxqiJz
         NFUoxlMkgOUvoox5OmAzVXizLNoQp8h1MmS+46fRBkS9i1UT/H3PxuoHRArKAgLqPIEP
         EZAmkiN+9Ka0fMm4r5Lb0rZSp/R8bnKaR7ZIyH7WNfL1RXspWQa9SjVzLJnTDi12GJ1l
         5g0fxf7iFDh/jE9fOR5Wyg/D++jhRcZFd58gnYXM6ZBqTklun3inqBH6AjUm6RXZ5zuM
         4/zjNW3ELCbgxob/01i0WBh1q0owaZZSCRFaUEbQhLz1VS3uE+1aTXjnAmPW4woWUChI
         78Xw==
X-Gm-Message-State: AOAM531hw2Fxy73+6mPdtK+LWIYaZVRsMp82kc7tVpMUe0K2cqnb3Yac
        uUiyrAZpKWgERXIcw0FgknnO0IZ/PixITaoBKO5vQw==
X-Google-Smtp-Source: ABdhPJydpnKNmcXAhArU85kHqM2ACtHCS13HM3NEI5XCdxT+1HfyDzLnwnpcyag83BGtGZUhP8Z6T0MKRnvupiqYS78=
X-Received: by 2002:a19:ef18:: with SMTP id n24mr6305733lfh.291.1617889743784;
 Thu, 08 Apr 2021 06:49:03 -0700 (PDT)
MIME-Version: 1.0
References: <1617280546-9583-1-git-send-email-skakit@codeaurora.org>
In-Reply-To: <1617280546-9583-1-git-send-email-skakit@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 8 Apr 2021 15:48:52 +0200
Message-ID: <CACRpkdbD6E3PY_JCEbwNiVfb8LoT6F5DzV7x71Us3Z7U3BaX=Q@mail.gmail.com>
Subject: Re: [PATCH V2 0/3] Add GPIO support for PM7325, PM8350c, PMK8350 and PMR735A
To:     satya priya <skakit@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 1, 2021 at 2:36 PM satya priya <skakit@codeaurora.org> wrote:

> satya priya (3):
>   pinctrl: qcom: spmi-gpio: Add support for four variants
>   dt-bindings: pinctrl: qcom-pmic-gpio: Update the binding to add four
>     new variants
>   dt-bindings: pinctrl: qcom-pmic-gpio: Convert qcom pmic gpio bindings
>     to YAML

Please collect the ACKs and rebase like Bj=C3=B6rn says, sort stuff alphabe=
tically
and resend so I can try to apply it! The YAML conversion may need a nod fro=
m
the DT people as well.

Yours,
Linus Walleij
