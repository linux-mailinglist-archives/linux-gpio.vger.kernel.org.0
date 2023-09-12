Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FCE579C829
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 09:28:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231520AbjILH2x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Sep 2023 03:28:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbjILH2x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Sep 2023 03:28:53 -0400
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C778E78
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 00:28:49 -0700 (PDT)
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-493545b4eaeso1791595e0c.0
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 00:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694503728; x=1695108528; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K4NbWWoBti8qk3UwKRcYmKazYR0a5hsSNCUeHFhe+5A=;
        b=kQj2RPhUu51y9PS7z68Ez4tPMVbu53FYhJYgDDp4j8tKHpEtuJSQKTfHxLdIRt3dfF
         S2Ru2B5BA7kZxuUc0yoUP4rCUjD+1PBcNEZkO7eoMuQFwMLbBJE2+BYHABhhCBSTefe1
         YVfQLMYGbZI2g3ycp0oAJdmI3AVoI6507vbxfllMxnPmZVEt/eiPqBOtp7CLLURcYDv6
         ynukNzWnQwqoK/zQQ9Rok4Slnp1IEZpXQUqpDLxBo8wM8bwU+Bp9QyPem1bgRh772Nt3
         O0dHo+yE2zAS0BWUWOR1v5EPBuTIAzlsmg3n49UxubP7SKkrldTkvIHM8QTw2bmwyVq6
         r6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694503728; x=1695108528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K4NbWWoBti8qk3UwKRcYmKazYR0a5hsSNCUeHFhe+5A=;
        b=F68s82pWFdmxoGRGB2uk58gXYOefovQjW93d6KFGyP8yLomew9kstsbv8YJIvePZJe
         mgEwuAgM9ers/I4WRzuU02xrKKHjzrePkqkQxUi2e4p13FdlSKryDraiTZaR6p+UI+cj
         aE0jI26/tdjeNbMssqaXEudsOvNA5FY7TwOXWIKrZhidYyKYYO4+5fucfxjIHcXkp+HY
         l1WO3DWAfL9zBZEiyZvgn+dbcnY5xHOtcT7fxtxXxVpgswI9DLmgBCmSp+yT+97NrRoW
         dUkjVrUuEgJZ2kWXyfTXOoh4p/G00z5TxXmmBQvnFdl83g1NJbqhYNl1abACM0JD9jPA
         NF4A==
X-Gm-Message-State: AOJu0YwANxBOntkdiekJtBOjz7YlUYeF7WTfcuzhVWeOCU/B4MNkDDFe
        D98UN8SO6/JC21XASSlnxactn17uZuO28z4Lq5fhpQ==
X-Google-Smtp-Source: AGHT+IGwWT8jEs4Y1gAQoX8wjXepJ758gnjavisCGjeMcPF+e7GcXn9EvoIqgEsv58nESMgPk54zUQ7Di9W9WjCAmF0=
X-Received: by 2002:a1f:de84:0:b0:48d:3b80:fba9 with SMTP id
 v126-20020a1fde84000000b0048d3b80fba9mr6255964vkg.11.1694503728376; Tue, 12
 Sep 2023 00:28:48 -0700 (PDT)
MIME-Version: 1.0
References: <cc9f31c3-ad0a-a688-c202-ce432dc71daa@redhat.com>
In-Reply-To: <cc9f31c3-ad0a-a688-c202-ce432dc71daa@redhat.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 12 Sep 2023 09:28:37 +0200
Message-ID: <CAMRc=Md+gdTz-ejnTefLqe-YAktQX9GmzsrSV+VCsCCt+_dCvw@mail.gmail.com>
Subject: Re: [GIT PULL] Immutable branch between pdx86 android tablets branch
 and GPIO due for the v6.7 merge window
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 11, 2023 at 1:43=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Hi Bart, Linus, et. al.,
>
> As promised here is a pull-req for merging into the GPIO tree
> this makes the x86-android-tablets code stop using gpiolib
> private APIs (to provide a cleaner basis for Bart's gpiolib work).
>
> Regards,
>
> Hans
>

Pulled, thanks!

Bart
