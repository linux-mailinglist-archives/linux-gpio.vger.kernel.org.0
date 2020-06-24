Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D1CE2074AE
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2020 15:35:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389340AbgFXNf2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jun 2020 09:35:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403954AbgFXNf0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jun 2020 09:35:26 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD7DAC0613ED
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2020 06:35:25 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id k18so1782063qke.4
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2020 06:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uoB5KRg8W/rBRcPeqsiq1sK8kQ9m+x8MqUPbKiljmN8=;
        b=t76J2RYq2Dx/47ov0cp/ejT2Jku1fjola5lzE/ns2ysQgYuCsTT2YsGjuvwZSnYmY+
         VlWe33fmd6fX4fU+7fHPfboDhr8QZUngK00aMNmMCD12ouOsn6tjZWbCPvH6B3+DHBZh
         7gSDtuC3dtd5UmiZLeZDZwpLm/z1xGgL83NYC4EElcO8jVWCCBO+VwaAlZgADZV0Gncr
         SZmnKCsmf3A+HbTOMPtIwb9gHIcIwLnAlxOeuCU6pszxXnxUG/Uan0wKSxqZpps5d7FL
         qc8B8/W1CRuuOI6dtqQ5D9zT3GszRyT6zqoMRVJmZvDt3qBi0uiIEyXy/xpB5kq0RCch
         aT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uoB5KRg8W/rBRcPeqsiq1sK8kQ9m+x8MqUPbKiljmN8=;
        b=N0jaQi91Qb9Kq/3VUWcukWd/qtgzACd9dc5u4RBvF2Uuc5PTt8P7lcDlRmEOFTCFis
         smgfVDsgTGtoR+sI58UUwoyJSCEZPQcdB6sVmU1gFLQtPWlnrEWmLSigXPOqP0mPuL3a
         7Gy2FWR4Vh4XXIBk3/EUrHpH/77r1h2TNB15GW7uzSklW0+BYHOL4oa8IfmJwBf9Xwz9
         ndHAFqtIX7hqlQvhY+IaJnbeCQXtUPmtoGlEVsasL/L5A1z3Ny2DR8KzGVjX8pS/LvvY
         luQNZU6vd+LHtg4Udb4uZJSGVOtVUmD0h8hiCUsOK4VvMFPNyIa1nVIfe/ctTqP8am0l
         w6Vg==
X-Gm-Message-State: AOAM531lknhGtNhCn8fh7RpNx6xzlKc5lbIJPLminsxQlKIhvWnQOGbl
        1r0XCRRY2vivqFFzqjMG/6i5eD14UpMjvF5yJeedjsDsYnk=
X-Google-Smtp-Source: ABdhPJzH0vNujZ5a8J2Gcx/MQZIyLmMeSxc+A6oWIpdxHR5THIHAnBK89llEzaTrgezwlk7kMbfrNdHgbPohpeTah44=
X-Received: by 2002:a37:9c81:: with SMTP id f123mr1842421qke.21.1593005725127;
 Wed, 24 Jun 2020 06:35:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200623040107.22270-1-warthog618@gmail.com> <20200623040107.22270-4-warthog618@gmail.com>
In-Reply-To: <20200623040107.22270-4-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 24 Jun 2020 15:35:14 +0200
Message-ID: <CAMpxmJWL984EOyjJ9eDA=2RH0hFxcFjgRGkF51GFP649d9A4tQ@mail.gmail.com>
Subject: Re: [PATCH 03/22] gpiolib: cdev: minor indentation fixes
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 23 cze 2020 o 06:02 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a)=
:
>
> Make indentation consistent with other use to improve readability.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
>

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
