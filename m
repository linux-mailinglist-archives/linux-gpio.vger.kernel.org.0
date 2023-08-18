Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA8EC780B83
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Aug 2023 14:07:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376724AbjHRMHE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Aug 2023 08:07:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344289AbjHRMGg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Aug 2023 08:06:36 -0400
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8452730E6
        for <linux-gpio@vger.kernel.org>; Fri, 18 Aug 2023 05:06:34 -0700 (PDT)
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-44c07c2b89aso254552137.2
        for <linux-gpio@vger.kernel.org>; Fri, 18 Aug 2023 05:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1692360393; x=1692965193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qpnH469vEo7IU25SdSmcFE6MDeKiq05QJNZ2e7yCq2A=;
        b=jaRF9lcvT7n4dJ9N+5RvOSpA2pO7bs1RD4FurBWyWGlo5oOg2k92s2jCFwm7taeiRj
         Kkg7yzyeHDJpIwRrCiPORXJvm9e4A3N1hUKfwv74XZKqMdkeWx9dbNTillZGwGNMhGkw
         z++0R42Aznbps7Tl9nkdJo5g1aQAP1Nnkov3HxFtzT4nJHGCBqKqU8oH7U/In/Ce/+bW
         3HZoyxkMAsPs9ocNfC+yvaUsT/AecSptUxRKKEL0V+qVIkddGk9WAFzGvYNbvHlcyJOq
         GhUglHZ+niPpZeCrju4Gm2EWgxwoEr4gpckQmrHGAhDK3bXJUPx1uivXVSEJ6OJft6Nl
         xt0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692360393; x=1692965193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qpnH469vEo7IU25SdSmcFE6MDeKiq05QJNZ2e7yCq2A=;
        b=BeHj22osg0uwHaUS+UJJtFLJ1wFtV7YfQSZNCV0crp2I+ERaqH0NyQ8tt1mAn02ndi
         RflSAmGF0AtuWmDcN+zSHUXd0U/qOxYKbeUHp4IMeRmz+61HcW/yUkoGd8fS37UMSwwm
         06uwBHhFUXkbNr/N4KrMdLBuDjrLn9VSvf10KaRd1Wbp35QeqsUiep7V77aw68gviv8T
         QilIssBBCk6ihpYihIq7qRr/s7lWQUFY3b2rnDar0HhcHcSlK+5uqN7SbXrYRi4tJzJa
         vy5wIQLSIChpZW8KMCx1K5AYHfgVhYDpFcpcYJyv/DCrpebu+x/Uzqx37Qxa+xpEJnZD
         ztfA==
X-Gm-Message-State: AOJu0YwRdTDdMukNnK0mZNAEWo1EsuWzzvspM5dVmMPtQbmTy+IOIh3w
        3qNqloIgrH4JpMssOSb7CjkT2f1giR8EgsDMT8iJpQ==
X-Google-Smtp-Source: AGHT+IGSndSXwIqtFPOx6mILg8kcTF4ODJjHV8rDnU6qSQPVtk60LVHc2UyMx4l+wp0BfKHsstQSmimTYEMEO7NK86Q=
X-Received: by 2002:a05:6102:483:b0:445:3bf:9387 with SMTP id
 n3-20020a056102048300b0044503bf9387mr3046008vsa.4.1692360392187; Fri, 18 Aug
 2023 05:06:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230817184958.25349-1-brgl@bgdev.pl> <ZN9JID53QpSz4epI@smile.fi.intel.com>
In-Reply-To: <ZN9JID53QpSz4epI@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 18 Aug 2023 14:06:21 +0200
Message-ID: <CAMRc=MfZ=GgcqKkDXkUgWC-bdCJECs0HfjRe9Ffy-Metwz6fFQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] gpio: cdev: bail out of poll() if the device goes down
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 18, 2023 at 12:34=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Aug 17, 2023 at 08:49:52PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Wake up all three wake queues (the one associated with the character
> > device file, the one for V1 line events and the V2 line request one)
> > when the underlying GPIO device is unregistered. This way we won't get
> > stuck in poll() after the chip is gone as user-space will be forced to
> > go back into a new system call and will see that gdev->chip is NULL.
>
> Why can't you use the global device unbind notifications and filter out
> what you are interested in?
>

There's no truly global device unbind notification - only per-bus.
GPIO devices can reside on any bus, there are no limitations and so
we'd have to subscribe to all of them.

Bart
