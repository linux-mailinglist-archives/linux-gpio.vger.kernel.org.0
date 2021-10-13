Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 326E042CF41
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Oct 2021 01:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbhJMXl3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Oct 2021 19:41:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbhJMXl2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Oct 2021 19:41:28 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5605EC061746
        for <linux-gpio@vger.kernel.org>; Wed, 13 Oct 2021 16:39:24 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id w14so16721865edv.11
        for <linux-gpio@vger.kernel.org>; Wed, 13 Oct 2021 16:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WdEtrH2QRDpnzls2IxG2rd0a0s9g62DLEGXgbSRM3ss=;
        b=ns7wHRqK4CyYrtr6TbYRx8VyQAYygtOIWIqsJXSw0bBCIlKJMzyTQ6+HunNGaO5RdX
         QYvZq9rPs/LSbxwIDX/bcAPNQL5y4FzNm5DXBL0CejTV+fD1kuEsOAu1Bt7qH+FhphsA
         PLBfYNomgco6fOsnhTuwLC8ABn+rmKqkmy4xMZyIusOxh65Tg+Hh3v43YtsYTmZ6bq1a
         j6cNl9yyJm/Ojqsv5feV/v0PvqxrVzR0nwnQ49EpHXmxAdnbadC3SLXQRKAcHF3PPW2j
         29Dh4hx/cBqiwUBhHNsSvc+NguK5RPFxO/Vqsld38yzeQEDRHTNWt3JCANp+vkMm4L+d
         DF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WdEtrH2QRDpnzls2IxG2rd0a0s9g62DLEGXgbSRM3ss=;
        b=b8rYVGZdRypoz31dJSNBigPWpBdI1wgVrO7oWqQCqONyaj5MGBMBO2xQwZL6G0xHVQ
         vWAADyXauIO1jO7tPvrZQQvlbpjrZfKSDdRdDyi2LxNsVOQpfquOvklVTx0cf6RmbiT8
         iHjHBBL+oaDy3TJhwmPqPP9jlpnsC3cWkoLGdNPeCNoTmqUDzZQm1z04O+DOiuuiyiwa
         A+29GLTAM/5beEl7TsCUMlZQ25zaLkr7UvrUzWGGeBtcUjmMHpSvjcb1vz6imvwK1k6r
         3r4TFPE8agM1jX2I7uxn1mGshtMvLQ11Tl7WWuoxVAotLvapu73d2JwfX3YNCmYMed9b
         eODA==
X-Gm-Message-State: AOAM531L7M54lnORk53cCn4Kb7+wAfJdbKwBUz1M1dSTyjU3HoKxRLIe
        ZO/hEFVAmepERDq4loLYIjis7z0glMdgpGnuhkswxQ==
X-Google-Smtp-Source: ABdhPJzpXKAztTVaOQPaHf8DJKpawtd4+fsjDbT8v3TC4AljgsqDvOOKYx9N0mqfFYwiFj18MstpjXFVOVkJctvXbXI=
X-Received: by 2002:a17:906:5e52:: with SMTP id b18mr2714251eju.560.1634168362749;
 Wed, 13 Oct 2021 16:39:22 -0700 (PDT)
MIME-Version: 1.0
References: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
 <CACRpkda_hW7vbvC1jizRa05ZdgeL-FkU3_zF+rvCfRBuRB3+VQ@mail.gmail.com> <CAA8EJpoqawEDKfKiPzU1zYACa8hU16Ly00tsb0d6BU_jLQMEWQ@mail.gmail.com>
In-Reply-To: <CAA8EJpoqawEDKfKiPzU1zYACa8hU16Ly00tsb0d6BU_jLQMEWQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 14 Oct 2021 01:39:11 +0200
Message-ID: <CACRpkdaTODHT=7JMd3d3An5W=p1CW_kyPFRQ030CBQ1o_s3o0Q@mail.gmail.com>
Subject: Re:
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 13, 2021 at 5:46 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
> On Wed, 13 Oct 2021 at 02:59, Linus Walleij <linus.walleij@linaro.org> wrote:

> > I am happy to apply the pinctrl portions to the pinctrl tree, I'm
> > uncertain about Rob's syntax checker robot here, are there real
> > problems? Sometimes it complains about things being changed
> > in the DTS files at the same time.
>
> Rob's checker reports issue that are being fixed by respective
> patches. I think I've updated all dts entries for the mpp devices tree
> nodes.
>
> > I could apply all of this (including DTS changes) to an immutable
> > branch and offer to Bjorn if he is fine with the patches and
> > the general approach.
>
> I'm fine with either approach.

Let's see what Bjorn says, if nothing happens poke me again and I'll
create an immutable branch and merge it.

Yours,
Linus Walleij
