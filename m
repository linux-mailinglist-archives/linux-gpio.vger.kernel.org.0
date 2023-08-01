Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F51476BD8B
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Aug 2023 21:20:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbjHATUx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Aug 2023 15:20:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbjHATUw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Aug 2023 15:20:52 -0400
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com [IPv6:2607:f8b0:4864:20::934])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B97C01BF5
        for <linux-gpio@vger.kernel.org>; Tue,  1 Aug 2023 12:20:51 -0700 (PDT)
Received: by mail-ua1-x934.google.com with SMTP id a1e0cc1a2514c-79aa01cc971so1172886241.0
        for <linux-gpio@vger.kernel.org>; Tue, 01 Aug 2023 12:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1690917651; x=1691522451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mx7BwwXurF50YVscvCcFIAyHMNie8lV8iSngFfBztW8=;
        b=Q/ryACJY8mOBs7FzuG7mPffOSg1elIHIgquyvCGZzO7AKvm3K/7i6jn+5F7iZVW10U
         ZipZbcsmOtolOwBiEDf31l39vuN8cRsMbkS5AOSG1M7W4iCTF4hlyMayzFrCcoH1oyMp
         ezBTHNgUVvNhz+YdHM85U2Vn2Z+HP9xQcYNSoRCqXPohoxS69dzmcbOsPjHVJvuavOEE
         0r4D1zNojwjyXxrAy6AwHV/XgtWocKveLUvl0aDR+SwWfGrsTiGu4dXWiTXZuhWlBTXl
         KKJId/fv8ubSb4eoY8ZR69LaDUUXHrfrgrnhoRc4IFsGwbXRl9Hi4JUzXs5ZfHY8pe/p
         WfuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690917651; x=1691522451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mx7BwwXurF50YVscvCcFIAyHMNie8lV8iSngFfBztW8=;
        b=YL90XKI7NYvX1FU9swxMjIOU1iLaHrOxRQEqzXm2YvZUJmbnB+HGb9lMOYzSGhlmYd
         uzO2issVkQSy2wFPihJU1x8j4oL3a+MSXkmD7Q2LZhGU2Y16AjVIDhRX9Gl3Wy880eCt
         BXqPWQI9mci633pYmhfFe4HbbeKGW1BtIpJMXsc+vi+LbHg0fht6pEmljpB/WQsEbeYu
         efP1cg3AsY+8y2Hh+6YcLnqMr0Cl9JqLr+qEstF1g1H/idIYqprmFmS3+Cfjr9n97GLu
         vCOdoXS8dfNRz3ihukTudNWkaJdFpl4GoT1omhCh5EeTp1XvJvkym9BCnEb/7L8t9A3z
         SKug==
X-Gm-Message-State: ABy/qLaEhzEo+2Y/rQG8uIPdioDD8bia33bWv8P539IVvyHM0TfeyEtN
        2fPN0WNSQ5EJisW4hxdjPR52e3Sa0Q/6rHfVXVdsVA==
X-Google-Smtp-Source: APBJJlFLP7KpI5D4cz6fjxg/9AdfjY+LGxKi41ExFBTmXN3hLhxkaI113sTTfgpZpUsnLsOw7mioSyVPWp+c0G4kVEU=
X-Received: by 2002:a67:f04b:0:b0:443:6917:215b with SMTP id
 q11-20020a67f04b000000b004436917215bmr2958771vsm.26.1690917650887; Tue, 01
 Aug 2023 12:20:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230725123045.6367-1-aboutphysycs@gmail.com> <ZL/KZ2Q5G7JHZMhw@smile.fi.intel.com>
In-Reply-To: <ZL/KZ2Q5G7JHZMhw@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 1 Aug 2023 21:20:40 +0200
Message-ID: <CAMRc=Mft3dTT+4H=4f4szSCc_NhJkDoG1xs8DkR=urgdhhHeqA@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mlxbf2: remove unneeded platform_set_drvdata() call
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Andrei Coardos <aboutphysycs@gmail.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linus.walleij@linaro.org, Alexandru Ardelean <alex@shruggie.ro>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 25, 2023 at 3:13=E2=80=AFPM Andy Shevchenko <andy@kernel.org> w=
rote:
>
> On Tue, Jul 25, 2023 at 03:30:45PM +0300, Andrei Coardos wrote:
> > This function call was found to be unnecessary as there is no equivalen=
t
> > platform_get_drvdata() call to access the private data of the driver.
>
> This is simply not true.
>
> NAK.
>

Just so you know if that's not obvious from reading the code:
platform_get_drvdata() is just a wrapper around dev_get_drvdata()
which is called plenty in PM callbacks of this driver.

Bart

> > Also, the private data is defined in this driver, so there is no risk o=
f
> > it being accessed outside of this driver file.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
