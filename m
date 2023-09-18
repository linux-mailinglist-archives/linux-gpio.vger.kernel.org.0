Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 022737A43EC
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Sep 2023 10:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240584AbjIRIFZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Sep 2023 04:05:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240641AbjIRIFO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Sep 2023 04:05:14 -0400
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BE8612A
        for <linux-gpio@vger.kernel.org>; Mon, 18 Sep 2023 01:04:23 -0700 (PDT)
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-7a8b682b0c8so362092241.1
        for <linux-gpio@vger.kernel.org>; Mon, 18 Sep 2023 01:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695024262; x=1695629062; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lIt+geNy5Vd3ySC5Z/5mUrtXfV7lKUn1pU4ER/xbRbE=;
        b=TIuW8sj8BRG0rYlK6mLdil/0nPQqubbMXG/+ncIqwqLX26rahPqI/aeJlGrBayadRU
         SE5xJtPPCx0VdPTBGz6qI4dkra8g2dgjvSumV4oitGd/fZ6ukI+NGf+Y0dxYzhjFWHdJ
         Wa4U/VPo6XvncdbAfg7NSMIZ7XeE0r/dVPJVkJpe7/tZC1hB/GwQyOSJg55fOXXVkci4
         7bMvt9JpAyarNKqCWDd4LQcM1SvjFXE/TYpa6apEv06HW1+xIqhIAW7b1nzj4HEZusXv
         MgYirjYjKWbWHethTeQPdIPuml6PpJR5nmnW/AlwkMaNfpcXJ63Euucm+vFhaZigiLU7
         jr0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695024262; x=1695629062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lIt+geNy5Vd3ySC5Z/5mUrtXfV7lKUn1pU4ER/xbRbE=;
        b=qHe2EwdgpoY/53rH4UcSyzaAPE3m3V2GcM2o0O7t/0lYMXFtHHwm+USvCSCTX+PZeu
         IpNfhimXtWZOvSv6cDe7hr54sA//Qf2HLguZsVm/spXN2+BEx6150xiMqEIfB8yteBFH
         H5TIKlrc3lDAkjwb6Twhmot+pKXibKhGNLWUHlYwrYvnMrS0Z6PL1CHwYtHJ4BlHSjVQ
         CNFJEwRdriSuf+gRdy3XHgSJyY7JK1mx/vydp/s32fPWrsQ9jKbC7WYK1i8n0WTkbtFh
         5y4mDSw5CGjdFRUsjWV4RmArSj3xQsRa+6dmf6e+fe6FEGxqVE3RsBCHFcipGFObUG/U
         r5jQ==
X-Gm-Message-State: AOJu0YymT3I8QihljbLOOrH3tiMGOaC6MA6v4Bsex7kUFcTK5Yths1BX
        kNkhjAOCv72mXC/ABpu+/0sO1rVnxm6CcRKk7bLFWg==
X-Google-Smtp-Source: AGHT+IHRIo3ZQ3eTQeqeKkkfsMWM0IcutYkBrlrqWRhJfdIziSvqxgHMBbDbl5i6JnQ/xawKIyBD13QHSWnv1AprKWQ=
X-Received: by 2002:a67:f111:0:b0:44d:3d29:4940 with SMTP id
 n17-20020a67f111000000b0044d3d294940mr3318560vsk.35.1695024262133; Mon, 18
 Sep 2023 01:04:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230915150327.81918-1-brgl@bgdev.pl> <20230915150327.81918-11-brgl@bgdev.pl>
 <ZQf7g92JgULqNaHz@smile.fi.intel.com>
In-Reply-To: <ZQf7g92JgULqNaHz@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 18 Sep 2023 10:04:11 +0200
Message-ID: <CAMRc=MerzUCVHhjSjbDkcdOLZEs35451NKuA=UvDaZBYb8hKKw@mail.gmail.com>
Subject: Re: [PATCH v3 10/11] gpio: swnode: replace gpiochip_find() with gpio_device_find_by_label()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 18, 2023 at 9:26=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Sep 15, 2023 at 05:03:25PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > We're porting all users of gpiochip_find() to using gpio_device_find().
> > Update the swnode GPIO code.
>
> ...
>
> > +     gdev =3D gpio_device_find_by_label((void *)gdev_node->name);
>
> Why do you need casting here?
>

Most likely not, I'll check later.

Bart

> --
> With Best Regards,
> Andy Shevchenko
>
>
