Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C211156BD84
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jul 2022 18:08:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238430AbiGHPuo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jul 2022 11:50:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238797AbiGHPun (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jul 2022 11:50:43 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A41460505
        for <linux-gpio@vger.kernel.org>; Fri,  8 Jul 2022 08:50:42 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id j22so12129520ejs.2
        for <linux-gpio@vger.kernel.org>; Fri, 08 Jul 2022 08:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jl7f3zCIIBfJgcYQrmkUSn7PhHRlgAzBj5FJLVNttC4=;
        b=ajjKeS6nN/0t/H3DqKPb39ZKq8Tf4LJTG2iFJ6onS3ODZ1vuYr7Wt19M3zZ5bWjWQ3
         VOdsYiuDpn/qEbdw4lnyTH7bj8vtyoKnWRhiGge8mdreOqeBMzQExcGhQIdLDe2JYsL6
         9UGanBLMzQXlHg3zWje9etwHJLZLe1btM9HsAYpqtxDkR9wdxO+BSEfZy6cgWLzPZZsz
         jd1hQEosYNdg1CV7j0FnaTpPDl0i0irWCFqe4y0GsPjC7iqR9bnrbTLabK1rZn/wzDaV
         A5WbAtunZjUoRscgybF23XEIT4akJbKl3445znNj1F/Q7ope3b5s8rzUg+bt8bwtEQbK
         AXEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jl7f3zCIIBfJgcYQrmkUSn7PhHRlgAzBj5FJLVNttC4=;
        b=mrp2jO9X05szRZo+kgP3x9wJSsawBjtC5ylZ16Tw/0Gb1bKEISTvAuFCaCJfM2Voga
         e++qsy5BxmGhWGCXAXAFf+p2VhG/6B7F84sJwbRi3OYbmIOUabHc6hjjiKeSPRbEG5ey
         dyUznToXwv6rBNs5QzhHyDg6zwzQ8p1hMo8j1n6ad+PzbQ6jGviYlcwJLyTOVHfUKRLn
         4QG2EWlzdELECONpiHh7Vqxo9xLfmcOmfLWYlvQW8cFj/ZBBiEGl4GYuFGjtptCb6Fl4
         P2j9JyXz7tPvqnvkx3518eBBhG/qH5mbPLTQMn0IQf0rf7lK9FSjVQh7Q+rBZKgO+snI
         poCQ==
X-Gm-Message-State: AJIora8rZTJJectX6Zaq+LF85U33BBYzdyUaKGTczsWzzydDePndZIHP
        erbEjB3xNeY9YJ5ZeBOCZgkmX9qGLzgEO2uhMlVMew==
X-Google-Smtp-Source: AGRyM1tMTGpPQQDaNeDtx5dmCuICKJw0T4N4k3T1R0Jc2GXgx02gefgVaIUJEkTdl0odGW6SDqb9aY22UWsvdDj1i5M=
X-Received: by 2002:a17:906:739d:b0:722:e94a:24c5 with SMTP id
 f29-20020a170906739d00b00722e94a24c5mr4167021ejl.734.1657295440850; Fri, 08
 Jul 2022 08:50:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220223174215.17838-1-a-m1@ti.com> <CACRpkdbj2B90-RE2XKQJ5qEj1hZQA-u=vUu2vpXwNqQLf_kaPg@mail.gmail.com>
 <e682175fcfc54217a6ed006270877f4d@ti.com> <ddc2b24e-37a3-4751-80b9-84b13606a703@ti.com>
 <CACRpkdZ7Kb0=7LHa13KJeZc2Kwb6z5kuH9nnHrk4p9OqB8+QgA@mail.gmail.com> <08422d68-21e4-b2c3-7d07-a19a121b24de@ti.com>
In-Reply-To: <08422d68-21e4-b2c3-7d07-a19a121b24de@ti.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 8 Jul 2022 17:50:30 +0200
Message-ID: <CAMRc=MdWcRPFXOTWct+mfSWPr=zp54_23PeCfHqmP-XXZpdOGg@mail.gmail.com>
Subject: Re: [PATCH v5] dt-bindings: gpio: Convert TI TPIC2810 GPIO Controller
 bindings to YAML
To:     Vignesh Raghavendra <vigneshr@ti.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 8, 2022 at 7:24 AM Vignesh Raghavendra <vigneshr@ti.com> wrote:
>
>
>
> On 07/07/22 16:49, Linus Walleij wrote:
> > On Thu, Jul 7, 2022 at 7:19 AM Vignesh Raghavendra <vigneshr@ti.com> wrote:
> >
> >> Hi Bartosz,
> >>
> >> On 05/05/22 14:28, M, Aparna wrote:
> >>> +Vignesh
> >>>
> >>> Ping. Can this be picked up for next merge cycle?
> >>>
> >>> On 15/03/22 06:31, Linus Walleij wrote:
> >>>> On Wed, Feb 23, 2022 at 6:42 PM Aparna M <a-m1@ti.com> wrote:
> >>>>
> >>>>> Convert gpio-tpic2810 bindings to yaml format and remove outdated
> >>>>> bindings in .txt format.
> >>>>>
> >>>>> Signed-off-by: Aparna M <a-m1@ti.com>
> >>>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >>>>
> >>>> Yours,
> >>>> Linus Walleij
> >>>>
> >>
> >> Sorry, this patch has been around for sometime w/o any comments and has
> >> relevant R-bys. Wondering if this fell off the radar
> >>
> >> I believe patch would go via GPIO tree?
> >
> > You need to use the right mail address to Bartosz so he can pick it up.
>
> oops, thanks! looks like original author copied wrong ID
>
> >
> > Bartosz: this seems to have fallen between the mail address cracks,
> > check it out.
> >
>
> Bartosz,
>
> Let me if I need to resend to right inbox.
>

Yes please resend it, I can't find it now.

Bart
