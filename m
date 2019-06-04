Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFB4035268
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2019 00:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726317AbfFDWAm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Jun 2019 18:00:42 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40115 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbfFDWAm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Jun 2019 18:00:42 -0400
Received: by mail-wm1-f66.google.com with SMTP id v19so257976wmj.5;
        Tue, 04 Jun 2019 15:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H1nfjWsjj7CcjHrqjJ43IW33X8D3A0ct0KZAGjNqblo=;
        b=Z/qtMwfk4lK6AmtTyPAY/E/vJB41YlpMPQa2clHBtlLVCruOt1rXc87nJh7BOdnK8V
         sWQxrsebfthQdJMq83HxY3ZjFNOsVdgBK3WK8VBGDxn2iRah5d2mU6OL3/kozF4Sihii
         JVXXMcExnPpFg2OyfIif53TvmgpcSidG5NL8n94Sp2PlYBymE8D0UwGu5/qBA0L9ZDMV
         oksKaEXaq434Vt3O8QabQr8JC6F+fnANhK9spSBZI7sClHHsI9DkfwXHk+qHdFgKGIxs
         fNK14K/EJFwDHDwwMm7bu5uvMPj0PyHgf2+xjN0IIyBcay32zJhtK1YEK2vOSQOhELjb
         f2Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H1nfjWsjj7CcjHrqjJ43IW33X8D3A0ct0KZAGjNqblo=;
        b=rTr7a1Pr21ccBqDjqZDCiXmatr7fk4nh4wJPVRyIZhSanS5PKUyLhxZHMow2CcAV4f
         2ddh2OMlnTn9YFlWPfJS49zvTU+I7pPK9cte1zRoR8S5f+E5asg9hj6Gw3XZqKZmbOaz
         NQQ7MBosjAUqz+3YsC6KGMfkFrR1/ZXnqUpSYQyuxI/Xlr70tKz3SUioPuOVo3JMAua2
         I89CHS2A4VFN3GZHs1JyZLcLVzP4n5eYFSRgJdv2yyUw4Td0awhaeiDnZnF90iMa+viX
         L1nANicW6HHVVxnQThIQhnnGaKRx3BRGnbbgAz2Fdsee/nUjaejNQGPZOLg0hims++E3
         u8OQ==
X-Gm-Message-State: APjAAAVvVCzdnd3xomV2aQ0DL+e6kwqHDLtsK1nrjC2jUFGh/3QbeCCt
        Ba/7/1ytaxnAX23QnR7SKKP70NTqs1TPTlRMOs4=
X-Google-Smtp-Source: APXvYqyX30ywLnMQ8nvn1uQnwLslcG5XWRzwmgbAtETaF0akz0jnaQJra30R0ULNfpY4zC+FNuOmIrYzVF3kRhNf9ag=
X-Received: by 2002:a1c:eb16:: with SMTP id j22mr7126678wmh.56.1559685639703;
 Tue, 04 Jun 2019 15:00:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190604072001.9288-1-bjorn.andersson@linaro.org>
In-Reply-To: <20190604072001.9288-1-bjorn.andersson@linaro.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 4 Jun 2019 15:00:27 -0700
Message-ID: <CANcMJZBmgWMZu7Y53Lnx_x3L2UpCmEbFRHVW0SFCXfW=Yw9uYg@mail.gmail.com>
Subject: Re: [PATCH 0/3] (Qualcomm) UFS device reset support
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-scsi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 4, 2019 at 12:22 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> This series exposes the ufs_reset line as a gpio, adds support for ufshcd to
> acquire and toggle this and then adds this to SDM845 MTP.
>
> Bjorn Andersson (3):
>   pinctrl: qcom: sdm845: Expose ufs_reset as gpio
>   scsi: ufs: Allow resetting the UFS device
>   arm64: dts: qcom: sdm845-mtp: Specify UFS device-reset GPIO

Adding similar change as in sdm845-mtp to the not yet upstream
blueline dts, I validated this allows my micron UFS pixel3 to boot.

Tested-by: John Stultz <john.stultz@linaro.org>

thanks
-john
