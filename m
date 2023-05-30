Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55CEF715D4C
	for <lists+linux-gpio@lfdr.de>; Tue, 30 May 2023 13:33:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229805AbjE3Ldn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 May 2023 07:33:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230206AbjE3Ldm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2023 07:33:42 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23947E5
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 04:33:41 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-565a63087e9so57313337b3.2
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 04:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685446420; x=1688038420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zO/hEIm/6vFm+Ve2jfklUx8YwRrMLFv0UwuU9t+2qT8=;
        b=AMemBWUvnvX0G0MDmnf8f/zVF0q9PNYTQ6bTUriXGy7KkrQEgnontw/Rtf9Mdm+nKw
         neUaH++nwf7A4ncvxc5inevGIC7S/TnIYxNRnPAHuSAXyfgOp4pgUO+u8Bth0LoTiHcd
         93M2sORUXM35A4h2G54YotHEcuxq9Z0jmGtIxq5n6F3AMMYVN15L97TB5woGOoQk/dfl
         Z2ETVLE9UNJ18AvVV6ozW5UcamPts81RLcS8ZaiJt2yrv3nj4LlD/SaxHrChTv4qXCF6
         aBvSSCdzK+qBAXqwWR89gVfFH0fV44QxViYHFTmWkGvpZVxFVvj86Jw3R89tpkgA/588
         6mlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685446420; x=1688038420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zO/hEIm/6vFm+Ve2jfklUx8YwRrMLFv0UwuU9t+2qT8=;
        b=G0L0ZjYFaKOjTtGfCe6aNPhiqNShtkz/YpWqrwEDyyEouk7BV6wYTVkXTkOCWplV1t
         R9tkRLtyXUwyEEhNL8THuCMBYSbro8UuyTea68Bgri35JrmYBJzhQdeeRFEpeb5VDSXD
         uwoCnas0i1pwzs+Wj6uU6MC3ZgqMnNHWC6SR5kjTyM36GOevhSlGhRnyAccFFBxY6KHv
         B5fVYJ5JjeC3qJL1F8LkyGmvc4EUN2TIHMkWfk+LIFJqakTp8dF2gbjIarjQWSxtouSA
         bBfkHOSccnNsda52pCeonXlO4LqjJ0shTfiyFO0DjYI6urab3ttw/4uTztvZoVyY/nF9
         ko9w==
X-Gm-Message-State: AC+VfDzNajh238uk7IErp71KVVC+7udk/J2IxlOvFrbAEJg9BSOvgB+1
        RBkuVxREr3/wKT6g/SAYXy7nqggQmyyqsPWiOZnmnA==
X-Google-Smtp-Source: ACHHUZ5OqCG1+FL/F18LVpp4TSjuAEWgttMpiOAuDfgIrf50Bf1rJPTXcD2dr152yi2w5mvi/Cgzm9bpg7BtykybcCI=
X-Received: by 2002:a0d:d741:0:b0:565:dff1:d1e2 with SMTP id
 z62-20020a0dd741000000b00565dff1d1e2mr2408888ywd.18.1685446420350; Tue, 30
 May 2023 04:33:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230315215027.30685-1-asmaa@nvidia.com> <20230315215027.30685-2-asmaa@nvidia.com>
 <CAHp75VfnNOsfcyLM-UP61CMAF9sLOwMbRkAe5Ljhs2p8F=4Pgw@mail.gmail.com> <CH2PR12MB3895BDF9D79D61420A2F2BA8D7479@CH2PR12MB3895.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB3895BDF9D79D61420A2F2BA8D7479@CH2PR12MB3895.namprd12.prod.outlook.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 30 May 2023 13:33:29 +0200
Message-ID: <CACRpkdbN3oa=chsoh8ko74xKBPXA_yh1K07MSaghnMMk5PWYYw@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] gpio: mlxbf3: Add gpio driver support
To:     Asmaa Mnebhi <asmaa@nvidia.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 26, 2023 at 3:49=E2=80=AFPM Asmaa Mnebhi <asmaa@nvidia.com> wro=
te:

> Hi Andy, Hi Linus,
>
> I see that the pinctl-mlxbf3.c is in v6.4 kernel but I am not seeing gpio=
-mlxbf3.c, not
> even in Linux next. Do you know when this driver will be integrated?

Bartosz is applying GPIO patches, I am sure he will get around to it once
all things are reviewed, but you need to use the right email address to
him (see MAINTAINERS).

Yours,
Linus Walleij
