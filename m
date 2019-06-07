Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4556397B6
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2019 23:26:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730458AbfFGV0z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Jun 2019 17:26:55 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43957 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729689AbfFGV0z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Jun 2019 17:26:55 -0400
Received: by mail-lj1-f196.google.com with SMTP id 16so2926225ljv.10
        for <linux-gpio@vger.kernel.org>; Fri, 07 Jun 2019 14:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q6sGj4udjdudlOgOeP/H6pDDZcmuzFdAkSUlLYTz7Hc=;
        b=z23mfVUe0uLJ/lnbrCPAfFLlJoZeq+fXYSy3t319XR2mXsJF2HJBlsHc72bDowYPbr
         BKlcfggdOUpnzKEOcmo/gWDJBafNeMAp2aw7/FOy/CEMhLhZAkJiqltxY9gqYHhdPADe
         LWRluJiEIcw2pJBdRmdTdrAVM13WBgOAg9klKPj6zLBbvJjcvG0SF3UGpq5K05+1nydQ
         YVvrkZaXl+tnN/7TgP1T8xCinH9HAqs6lCo00edbK7wHMvW8WMzCuFvKYkfX8GduJi99
         j0wanfih+iwQg+9v0kDSq7XaxRBoHZrhq0vIpY4sKoaShnKX2Gdts7XNyc78ZgcYCS/j
         ih7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q6sGj4udjdudlOgOeP/H6pDDZcmuzFdAkSUlLYTz7Hc=;
        b=jqmjxOSiBzTuPQUuhykwuBfSzYA8HhLvsgcIZ00CwEGmVo6OJ+e+5zHvs41cabAQG2
         QZ622NeR3dPGUB+W9bHWOQw1h3oUUT6HqZpj31E/ra49O67e2dbtdL51VTh0UUDGP2QU
         XAoxB/Ib0ks2/5GIEc4U/5NyZ/2pqGjXqByLJ/EqGnnlJVe6gd596a6Q7Cc/X/zUs7xz
         r8h6tEjUvoCv+jdLZo4fEPphfuiOeFJVU+UR043BZygstRTD0BfUNFqCB6lE9+l0MbxW
         FRthfLquhOGj+VTy9lNtABj2Pp9X1LAHcuQnS2Wrub+11Cgdv3NgPMbDa4w+DkMo7PUZ
         CVYA==
X-Gm-Message-State: APjAAAVFo8tYxDiR4EbNlgRpCpLyDZbdNnRQi+KBYOzdasnY2CvWBVMc
        kRDKe8l5uSsGltwcZnJthRZDfa7ZvCkF5DszpJPMpA==
X-Google-Smtp-Source: APXvYqwIajTpMSgCMZav18YPN+TlLmExrYklafV6rIWWxNFhS1pNAPS/UUbCntmRCn13SfjJkYCmG7CoaruMAno9FuY=
X-Received: by 2002:a2e:7508:: with SMTP id q8mr13158846ljc.165.1559942813429;
 Fri, 07 Jun 2019 14:26:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190604072001.9288-1-bjorn.andersson@linaro.org> <20190604072001.9288-2-bjorn.andersson@linaro.org>
In-Reply-To: <20190604072001.9288-2-bjorn.andersson@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 7 Jun 2019 23:26:46 +0200
Message-ID: <CACRpkdazzRV5XydKHmXRQiU2Mx+=HyRgNCEpNqsOsCdycXmMOg@mail.gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: qcom: sdm845: Expose ufs_reset as gpio
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-scsi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 4, 2019 at 9:20 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:

> The ufs_reset pin is expected to be wired to the reset pin of the
> primary UFS memory but is pretty much just a general purpose output pinr
>
> Reorder the pins and expose it as gpio 150, so that the UFS driver can
> toggle it.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Patch applied.

Yours,
Linus Walleij
