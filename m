Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF7046F8A4
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Dec 2021 02:43:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233628AbhLJBqk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Dec 2021 20:46:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233603AbhLJBqj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Dec 2021 20:46:39 -0500
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C24F4C0617A2
        for <linux-gpio@vger.kernel.org>; Thu,  9 Dec 2021 17:43:05 -0800 (PST)
Received: by mail-oo1-xc2b.google.com with SMTP id m37-20020a4a9528000000b002b83955f771so2085957ooi.7
        for <linux-gpio@vger.kernel.org>; Thu, 09 Dec 2021 17:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vNt01PgNPd3YSDPf1qGCkNvtxUggbk+ibJ1UrH7sY3g=;
        b=oTUB7o5tEgUiCdAFBlzj2EI+58ktxVJmCb0G36bbXEX19M223b7F9czGwGQuIkEXrO
         /TuutKs1GOi25EWlbWKDBRrKgFvBeqz7X/KTB7MYr/tNcuBSxkBBPAWzOUm9Pk2CKL/o
         XIaO9HKkCfY2rfC/k3re6N/gabMUvctpopS2uTLIAChAnV55LjGd7ApAVaw7vv2AR2RC
         7RbyV+0cL1l5052RKY2LnNcge64lHUh0q7jeySprTvSt71Wp/hPBm5w6SlEzR2w2DRFh
         q+9Y+pLE9mPSyL5yyxbdwmNhahPrLKgehKvNDnqFHhPc3xoofrgYhEaIrnAiG/B25AMg
         wEGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vNt01PgNPd3YSDPf1qGCkNvtxUggbk+ibJ1UrH7sY3g=;
        b=VhM9RMlgL4Jjvs8TxSV8uioIgLDl65LtcC4IeJ3GUbp7lIo0P2H81Qb3MDHH94W0YW
         kyQSdqnYC75Nwh4T3yF2HeYEFmAWjIVrNuRymzOoT5dE5VYLquL3S4k4Ak8gZV2yqSTO
         qsPtAp+nFvHKlMA3gA3s3BIWob0C0k9pVzg+W1EPNfjh2kT88l/Eo0LHqFR6cxzgy+NB
         PX0sMRkpqIRTdLQc5jjF36au0vjQ7QeAtNX3eI9kldnm3BFO2WkHIFKW8/+XcIZwnXqB
         Mm32zZsEeWAvxLJXVqPDKy2ZElTANGtlDvjERH3dwig6dNKjwUaRwoT3WyS/SML5mg/t
         KPWg==
X-Gm-Message-State: AOAM532UNSBBVUROuzq1hXzRkzn6BFkojLC6+WpIVFZ8AQ0MvrnEoZIL
        tiuIrMI7xdzjG+kplDiqAX8DoYAxdldbNlGPAIAQ0g==
X-Google-Smtp-Source: ABdhPJy7sYPUI5H7vA+hj84AaMMHAMzrvQz8iXXHhrZzqnNVH23YiTM2mUfm1+Oa9j7y73v/T2CtSIwffTt6nWKZuDs=
X-Received: by 2002:a4a:8515:: with SMTP id k21mr6564505ooh.71.1639100584964;
 Thu, 09 Dec 2021 17:43:04 -0800 (PST)
MIME-Version: 1.0
References: <20211207210823.1975632-1-j.neuschaefer@gmx.net> <20211207210823.1975632-7-j.neuschaefer@gmx.net>
In-Reply-To: <20211207210823.1975632-7-j.neuschaefer@gmx.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 10 Dec 2021 02:42:53 +0100
Message-ID: <CACRpkdb_i4H5+hWTrQQ4KkOaATDHb-Xi-dQ5+SM0jpe+zYJsqw@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] ARM: dts: wpcm450: Add pinctrl and GPIO nodes
To:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, openbmc@lists.ozlabs.org,
        Tomer Maimon <tmaimon77@gmail.com>,
        Joel Stanley <joel@jms.id.au>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 7, 2021 at 10:08 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:

> This patch adds the pin controller and GPIO banks to the devicetree for t=
he
> WPCM450 SoC.
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

This looks good.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
