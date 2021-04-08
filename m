Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92FF2358590
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Apr 2021 16:03:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbhDHODl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Apr 2021 10:03:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231574AbhDHODk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Apr 2021 10:03:40 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08B6BC061761
        for <linux-gpio@vger.kernel.org>; Thu,  8 Apr 2021 07:03:26 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 184so2398025ljf.9
        for <linux-gpio@vger.kernel.org>; Thu, 08 Apr 2021 07:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=EuaDV5PFzJtGwP30IwdE97tcENsaGWJZ27LkFoNdlRE=;
        b=iDwn8tUVD9hBlSLhZZ0w4Bnih9Vx+R/uMXMbfYvvfK/BE8dJSRvxkKkQbttlBRuWy8
         UkmYVW8ZjgP7eao4YvSaUP0ny3Ocp65OkcLk1qwx5C8flM3nfBRn81rV5R5ONN1HFv+p
         B1N6lB4KaPu6NKVvOUxuZ9xyPjXGmXlA9tNCN5ElfqECGpu6/1tXwp95Txg/lrjyUiok
         LFcEwLk1PH9/2Z/rdQiwOx4Hm2Ddgey0xDXKF2fhwU/YzXOpjpXSghE7luLvsfc+DT9M
         EeoVqWgLS4E73OLAU177MBBZ3iWggzNmcAKOsgzl+6TdCEKjhAUekOwcJiFxWqdVB/0O
         hU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EuaDV5PFzJtGwP30IwdE97tcENsaGWJZ27LkFoNdlRE=;
        b=Nj5HzXdlat/EJ+kSeM2ArWjCdhSXWc/ri0Q45th67bDIRPxw+lSMgPtaaHS+ePtNQ3
         otFzQn6+3g3158CAL716wlFZ5V4QpxRtTT+IBpayYw3fQ+spWwYb8r4v8EbN40BZBAQc
         Th0WvsUr/LwZJF3R4kmvJCVyZ4yrUWXh8KRuetJ2qV9BgjAP1HX1ifVCmih2SqBoIGy+
         TwMz5Mpmqj9yHb3yLTkGBXMouF2daWvi8O41/BDASCHDax9ydspARaNMzG5AX91cqHPp
         fsbOSQtjhMjxRu61iPNItoMEcMO77TCrIZCnm/ehq0FHkTAmFFhOdjYJr/nJBKjsSveA
         5dNQ==
X-Gm-Message-State: AOAM533umta2LmQumu7+ZR46sCmD8JfAma21BunbA8COw56tIabEZ6rR
        JSc8a5eo79NbxXAt/zkavmw/CmCQXKZyNsBIk2oC3Q==
X-Google-Smtp-Source: ABdhPJzaHapit3W4Z0PRJSrkxM0lTe9VKjj4klFARLjv+msdrPSeZ8yCS0Jwc7SQYxAM8UFn5ifpK906CRiek58aRtU=
X-Received: by 2002:a2e:9cb:: with SMTP id 194mr5792845ljj.438.1617890602657;
 Thu, 08 Apr 2021 07:03:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210328164222.720525-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20210328164222.720525-1-niklas.soderlund+renesas@ragnatech.se>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 8 Apr 2021 16:03:11 +0200
Message-ID: <CACRpkdZ_COOJcJtg8G5-GfTcBCX97qMnQukYzRYVkCK8von7UQ@mail.gmail.com>
Subject: Re: [PATCH] docs: pin-control: Fix error path for control state example
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Mar 28, 2021 at 6:42 PM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:

> The error is constructed using the wrong variable.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Patch applied!

Yours,
Linus Walleij
