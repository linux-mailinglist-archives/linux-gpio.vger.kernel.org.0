Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BCD532AD0A
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:13:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1837354AbhCBVTM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:19:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1447307AbhCBPdF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 10:33:05 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03163C061D7E
        for <linux-gpio@vger.kernel.org>; Tue,  2 Mar 2021 07:28:43 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id v5so31854485lft.13
        for <linux-gpio@vger.kernel.org>; Tue, 02 Mar 2021 07:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RVLXV9q75+jht4iE83WdkIxMeuR8jzeBuwVVsN9WTLg=;
        b=gV4ynqlQFejyy+ndUs/LYpx3zBRZkYYb+XQcgjk/Y2UhS8fERlg6PZC6CLPKxWVdJh
         UPpuwSGiXxNNsSj57lw9eHpk00/M9tfI1Hg1/kmS7OkZwCH16dLSQTBjwF9kVmWB4rGf
         VIToCruiTYRvqMwroG7hfCsNWbyHNNICx0RO/cUQCYiba9/ucEhyJCqVR+ieqfUk10pD
         Tb5e+J+FY2x+oxAoSMkjq4lmPeWrE4eEpQTWGeNeXpFyv3wDeBXxYfTAL2oShaJG1gs+
         j7z6zXZhf04vLIkap4O26CMNHIsWyCwd0+f4FJlFOqF7eDzyKn5DBqTv0whla3Zp6Vws
         bYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RVLXV9q75+jht4iE83WdkIxMeuR8jzeBuwVVsN9WTLg=;
        b=m8oMVjZOuMvEGO0Mjw5pIIgP/029X5JJiBTzM5/Q1IhU1avATTMftB4bvehSc/rnoD
         VXDOMUJd8zsOwmo+YVpJLNYQIdobU+CGye1AKppyb6Bb2HzjdV1f+stojNJxUvWBN9al
         FTEDPQ8HV2lpTmeEZPrDTk5wC6GDgOjxWUfdtWlwB9Nd+oXhSUk9dQ4UM5xU165wWi0O
         YNGfLadUPosGVVOdKKFAHaJQxjTnRAQTjRZkPtg1Xh0PLwVHrAPTsQRk7oGhg+kbZv/M
         bTRrIf6J4Hx6G54mOSvyT2Hw4l3psJxYHeeAOlCR27kLJd1eofaVolV/oJyv8b/sbI2N
         SZjA==
X-Gm-Message-State: AOAM533NxFYbKAXLyghhB7ET9VSYsKPEhZxqODBCNokn0yAmY0w/enc1
        LFCheo1PSyH3+ASkGy8HnHEINZ9oKYHMkHNXP+Sznw==
X-Google-Smtp-Source: ABdhPJyq3rpvaXhwX2VHa2lgT2358eC5Ypt/Jh3s8qQ435mBzMUVrLp8/RG4NPHNIYVQcCazuyhFFsD0nTR3rUUV0OU=
X-Received: by 2002:a19:548:: with SMTP id 69mr10323405lff.465.1614698921540;
 Tue, 02 Mar 2021 07:28:41 -0800 (PST)
MIME-Version: 1.0
References: <20210225164216.21124-1-noltari@gmail.com> <20210225164216.21124-10-noltari@gmail.com>
In-Reply-To: <20210225164216.21124-10-noltari@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 2 Mar 2021 16:28:30 +0100
Message-ID: <CACRpkdY5W_me1ym3MftGjMwtbPc2czCASET0-qPz8WgmV7H00g@mail.gmail.com>
Subject: Re: [PATCH 09/12] Documentation: add BCM63268 pincontroller binding documentation
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 25, 2021 at 5:42 PM =C3=81lvaro Fern=C3=A1ndez Rojas
<noltari@gmail.com> wrote:

> Add binding documentation for the pincontrol core found in the BCM63268
> family SoCs.
>
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>

> +  interrupts-extended:
> +    description:
> +      One interrupt per each of the 4 GPIO ports supported by the contro=
ller,
> +      sorted by port number ascending order.
> +    minItems: 4
> +    maxItems: 4

Same comment, this is hierarchical.

Yours,
Linus Walleij
