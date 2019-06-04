Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBFFA34F97
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2019 20:10:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbfFDSKQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Jun 2019 14:10:16 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36737 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbfFDSKQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Jun 2019 14:10:16 -0400
Received: by mail-wr1-f65.google.com with SMTP id n4so13792524wrs.3;
        Tue, 04 Jun 2019 11:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lLFJn8hfJB0bfYBQ2rEhUXIcdzRXExeNARfQE/rlETg=;
        b=vUjBWTaBQcbMO0GWKgSI7xMK2QKr+0vX8zwG8ghZF85C1ae5KmMhS2KIgThcOqJ/rJ
         TRzn+Njtqf/0JHaJzVdZt9V7KWSyWOqkiA8DTFHnfvw3BdAJ+5thsRwTgcBjaI83+gSy
         1hqQpkUvlZY9LLtaUdp0L0TbBtBClqlkMuM23UiANzcvbBI1FcreHSUVrHBV7XpeZXy/
         c/3hlvOFu3ruXyFBa/cYv0/K+X+brPVFx7HdrNG+e9RHJoe6JQGdrUhPb3s3UbmnQtj7
         xAP75dTJ9fanBvBRUykQrrsmL713koEcbQjGcZlZrzMHPpJoeARIzNYJz0zD+hhPd2qG
         cCsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lLFJn8hfJB0bfYBQ2rEhUXIcdzRXExeNARfQE/rlETg=;
        b=YpAzXpiSCnZZZgDLLm5GwaMTx66Obdj9eczSHMi/u9GtquusEeWSVGYgAAODnS6PUk
         IG4+uDwbO1gvv8nLobomnQbvolJ/sRoGT8gtzcLKXOtK5N+EBx2m17kEonD9b3fG2+Jh
         QeY7WhYUzL8N72bnKUdUZr25y1qxnUTb9ZJ3UICk4+CHnZiZc0rXLrIi/OPV2QFsCmVa
         WdA+5RbmA+RzVusV8DjE8D+rRXWewOqvfS9Yey8ZeoGxzX1JgARTi6FknB/ozo2844i+
         VN1qN1D0/BwE9pECw6F5NLKlJDur+O4MVEc6iEQwsSVI/OiXrta3Fvq+2lHLGS+fgSiK
         pQbA==
X-Gm-Message-State: APjAAAUltmqSAyvTtaujeOiK43AKTZJ8IBctsIjM+I47AFBOCCiiV8oZ
        FKQstiwMSFFSLylWqqaQecqKGKZQcluz0pabexs=
X-Google-Smtp-Source: APXvYqxrnaWRBKNjOZJP0zWlO2DmEFkaazI6Z+tkInzQvHcCwD+PxOjOGa8Jm+4UyZqJvTfz1hmYWCIZQQV23Cv8CnY=
X-Received: by 2002:a5d:4992:: with SMTP id r18mr7697528wrq.107.1559671814077;
 Tue, 04 Jun 2019 11:10:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190604072001.9288-1-bjorn.andersson@linaro.org>
 <20190604072001.9288-3-bjorn.andersson@linaro.org> <BN7PR08MB568450B1EC51ABAA2E426AC0DB150@BN7PR08MB5684.namprd08.prod.outlook.com>
In-Reply-To: <BN7PR08MB568450B1EC51ABAA2E426AC0DB150@BN7PR08MB5684.namprd08.prod.outlook.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 4 Jun 2019 11:10:01 -0700
Message-ID: <CANcMJZB+bg9LWzo=EaL-QnWiL49=MzyBJy8qsBiSMu8HZeWRxw@mail.gmail.com>
Subject: Re: [EXT] [PATCH 2/3] scsi: ufs: Allow resetting the UFS device
To:     "Bean Huo (beanhuo)" <beanhuo@micron.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        Subhash Jadavani <subhashj@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 4, 2019 at 1:14 AM Bean Huo (beanhuo) <beanhuo@micron.com> wrote:
>
> Hi, Bjorn
>
> >Acquire the device-reset GPIO and toggle this to reset the UFS device during
> >initialization and host reset.
> >
> >+/**
> >+ ufshcd_device_reset() - toggle the (optional) device reset line
> >+ * @hba: per-adapter instance
> >+ *
> >+ * Toggles the (optional) reset line to reset the attached device.
> >+ */
> >+static void ufshcd_device_reset(struct ufs_hba *hba) {
> >+      /*
> >+       * The USB device shall detect reset pulses of 1us, sleep for 10us to
> >+       * be on the safe side.
> >+       */
> >+      gpiod_set_value_cansleep(hba->device_reset, 1);
> >+      usleep_range(10, 15);
> >+
> >+      gpiod_set_value_cansleep(hba->device_reset, 0);
> >+      usleep_range(10, 15);
> >+}
> >+
> > /**
> >  * ufshcd_host_reset_and_restore - reset and restore host controller
> >  * @hba: per-adapter instance
> >@@ -6159,6 +6179,9 @@ static int ufshcd_reset_and_restore(struct ufs_hba
> >*hba)
> >       int retries = MAX_HOST_RESET_RETRIES;
> >
> >       do {
> >+              /* Reset the attached device */
> >+              ufshcd_device_reset(hba);
> >+
>
> what's problem you met, and you should reset UFS device here? could you give more info?

On the pixel3, devices with micron UFS chips won't boot upstream
kernels without this patch, which is a rewrite of an earlier patch:
  https://git.linaro.org/people/john.stultz/android-dev.git/commit/?h=dev/p3&id=99f3dd8519a848b752679584451c45f42c326a17

Which was pulled from the downstream tree from here:
  https://android.googlesource.com/kernel/msm.git/+/9c8077087e818017%5E%21/

CCing Subhash as he may have additional context.

thanks
-john
