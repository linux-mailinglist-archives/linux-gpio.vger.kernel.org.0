Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 419DF36EC4B
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Apr 2021 16:22:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237315AbhD2OXA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Apr 2021 10:23:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240246AbhD2OW7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Apr 2021 10:22:59 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A1CEC06138D
        for <linux-gpio@vger.kernel.org>; Thu, 29 Apr 2021 07:22:12 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id u25so38288207ljg.7
        for <linux-gpio@vger.kernel.org>; Thu, 29 Apr 2021 07:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+8pq1Kqgoz6ZHvHL1zhX2LjB8GHuu5vWdNBGM6IWtfM=;
        b=mc/mJJ0M5BjWs+AjcEuzQcK+z3rfCbbAjE+T3jWnBcpqDFrDa8zY1c2Qpfo3Ty2Agt
         lUsvYrGyB0mYE3+D+skpru7sgUnAF9hNnodvw+M3+CHBrEN9LdA1pDtjXCNhcrU9T70V
         LdPqecJEy55gdmVPNaCM1SFW6rwT4DGmkCaSN/nrWDXiIyEi1jnydnLTnf/jI3W7qr1M
         ptbrsV8UGkuYacdZhx6szz1DJBINrGOTp5rcmDH9bjND3duVEgoGey5gIj+7OpychOK4
         XeKR5SnCCKLL3T84Rh+4tnCrZsUaEOH4Yp7N5xECrNLp5ZdYJBe8tjCp/96ixUp9K0wd
         8okg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+8pq1Kqgoz6ZHvHL1zhX2LjB8GHuu5vWdNBGM6IWtfM=;
        b=dsCz+MQtVwL4HkUNd/VVOLxdWai7Zgj/bAUiLPctLMNFRc9vVghaOK2V5CZOeXtSHA
         d5muFgkAq9opn3PFySW+LaZLgxQAKSeqi6bHLr3LJHn5OKYn1buLA7abGaiuKmVRkac8
         UdHy2/W+hbcYjDz9VIjt64wpwahgY/eArRbvb8KMJqyZHAeoZiz2Eelg/pjq/Ok4tjmB
         5hn/HOyK10lKgjSeYfbDKgJQpdtPdAGLrzBTF98UUkVmPZcgwW10LTuSL/wg8M1ipMWX
         IQARAlcSsdY7fAfxX1lHC85bmxRPXSp4gEafCtTpApUYjJwtqpWuZOSCDg2vXHSLB8LZ
         whxQ==
X-Gm-Message-State: AOAM530/OrCiv52PhAzchFnZnMjj799lO2m2tYLMnsXz89IISeQxYJVZ
        osDK852rUhzXN+SRCkl+KdjwZ6V83wGYZ7fuf9ZrkQ==
X-Google-Smtp-Source: ABdhPJzO35dKKTFRnT/r8hEfK4HSyi7SS5FjyS1L0dYZ1L4/ErLt2jFnCudZRuNqvaW0hAT3ICWgwi1ERk6Jn5gjP4M=
X-Received: by 2002:a05:651c:c1:: with SMTP id 1mr23822611ljr.467.1619706130628;
 Thu, 29 Apr 2021 07:22:10 -0700 (PDT)
MIME-Version: 1.0
References: <1619080202-31924-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <CACRpkdaDP+JnCP+go9hZAObnNgmJyJRDFypX2CZGp-UJBh5wNA@mail.gmail.com> <CAHp75VfpvPdAAW2JpvdiDtzS3LUF_=Ej7c2LEML_+pOwi6CtWg@mail.gmail.com>
In-Reply-To: <CAHp75VfpvPdAAW2JpvdiDtzS3LUF_=Ej7c2LEML_+pOwi6CtWg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 29 Apr 2021 16:21:59 +0200
Message-ID: <CACRpkdaxTxCz=LJuGL_wCNTZESK0opixBzLass0w0n8A6P7mfA@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] Add ZynqMP pinctrl driver
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        git <git@xilinx.com>, saikrishna12468@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 23, 2021 at 5:55 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, Apr 22, 2021 at 12:14 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Thu, Apr 22, 2021 at 10:30 AM Sai Krishna Potthuri
> > <lakshmi.sai.krishna.potthuri@xilinx.com> wrote:
> >
> > > changes in v6:
> > > - Rebased the patche series on 'devel' branch in pinctrl tree and no
> > > functional changes.
> >
> > Remaining patches applied! Thanks for working so hard on this!
>
> Hmm... I have had a bunch of comments. Okay, they may be addressed by
> follow up(s).

Sai: can you please address Andy's comments with replies and/or
follow-up patches?

Yours,
Linus Walleij
