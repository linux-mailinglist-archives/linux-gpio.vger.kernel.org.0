Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65BCA165DCC
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2020 13:45:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728134AbgBTMpV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Feb 2020 07:45:21 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:34522 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727996AbgBTMpV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Feb 2020 07:45:21 -0500
Received: by mail-qk1-f196.google.com with SMTP id c20so3405953qkm.1
        for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2020 04:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=S+DR2tqwHDGoIzSaCv59EB/9EwXei3rtQ6/JX+jjHm0=;
        b=u0kGKSV7g2gKVQQ0tktOYXAH7/+lxVouJ+8xGYEuQ+Ul+9zBK8tPqwmMCpEFgCrtOt
         qxrVWpL+RHuA+RbhkCI8sYY6FKdTUxWLwet0QA9Qya0ymHwQetSiv9H3HffGUPO4kA/j
         hpbls110s0uQMOQotm4P4lnkaWLzcue6FW2kncfAmejTlIFSRFAT/SyQD/Xa/P+aND6o
         km9tF5TWWSRlNZ1PlpxW8AmXyHC1+IWdBRqhSFzAAhYByCHbsUq5RolPJNuQaODZmPxx
         lVNMoV2qbwlogdzXgtoJRYF3SaN7wINLQiNYjcSwqfotwm2JMU9G7Lt41zirPPv768j9
         J9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=S+DR2tqwHDGoIzSaCv59EB/9EwXei3rtQ6/JX+jjHm0=;
        b=NN0tl97LwvNySWJyS9KG31CzxHZxdA+IWhuVER0102w0K6+YQ2D7ZTZqQCziit3kMd
         jJ/40QhqXb3DuJLV6v9BRt6xLN9Kh0JCPcQaI171VNj0OqDyaHpJHmWQb3stjHcY5Ak5
         sdVwlh/SBO04fG6vGJ4QF16jra/0+AMVCOLj06Ws6wAoVLK0DCIDzN1wunX+9KNp66uj
         cfWY84gogK69Ax0eHnCxk2pIdNZ2faYxxDT3zl3HMx2+VksL8yxFbZ6PUHKdJiNuX6RG
         Bb7zQun6uIlfZOvOwGTshh+rE1oMoxBluP/HogHf4N9K39RksQh5w4+BG21DXujFx/N8
         I8GA==
X-Gm-Message-State: APjAAAWK0yxSnfR7q7C6sFVGjJuB0zBaKTslFY3otYUdJyEf0caVVJtT
        LmxfJH0zMPl3YBY50DXUKFXt8/Qe6iJp3+LiJGDjfw==
X-Google-Smtp-Source: APXvYqxLCHV/q5CaKzKrQGpcmCEylpff0GaIk/6cWjgj7li8REIOva0pWlQZQJ1PFCpxJFhOHkj2NJEuc0c2pIY+tiA=
X-Received: by 2002:a37:a488:: with SMTP id n130mr27484945qke.120.1582202720242;
 Thu, 20 Feb 2020 04:45:20 -0800 (PST)
MIME-Version: 1.0
References: <20200220100141.5905-1-brgl@bgdev.pl> <20200220100141.5905-2-brgl@bgdev.pl>
 <965f715c-a714-00df-b496-a586969dd086@linaro.org>
In-Reply-To: <965f715c-a714-00df-b496-a586969dd086@linaro.org>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 20 Feb 2020 13:45:09 +0100
Message-ID: <CAMpxmJXiK+A1AF35OJoKnyYYkJ4VZUgqhzzYOazt-UWaMbCfww@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] nvmem: fix memory leak in error path
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 20 lut 2020 o 12:30 Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> napisa=C5=82(a):
>
>
>
> On 20/02/2020 10:01, Bartosz Golaszewski wrote:
> > -     if (IS_ERR(nvmem->wp_gpio))
> > +     if (IS_ERR(nvmem->wp_gpio)) {
> > +             ida_simple_remove(&nvmem_ida, nvmem->id);
> > +             kfree(nvmem);
> >               return ERR_CAST(nvmem->wp_gpio);
> You freed nvmem just before this statement, how can nvmem->wp_gpio be
> still be valid?
>
> Are you able to test this changes at your end?
> Or
> these are just compile tested?
>

Sorry this was rushed, I will have access to the HW for testing tomorrow.

Bartosz
