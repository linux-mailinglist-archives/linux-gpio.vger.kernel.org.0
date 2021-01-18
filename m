Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53EA82FA14A
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jan 2021 14:23:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403926AbhARNWl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jan 2021 08:22:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392152AbhARNWU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jan 2021 08:22:20 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BE6BC061574
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jan 2021 05:21:40 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id o17so24054574lfg.4
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jan 2021 05:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tEou1N7wdVm8VL4xJuhFCb3lWMy01u8maLSGlBZXEOI=;
        b=HTRcT6CtcJVN17+sYIhPYbgU4/LWG9PoiLWxR/sps7Y9HJ7nKB5j2nlkExNvWqV8/5
         1UNmlujMeGWDR3UqxqwhANhGHtgifYNElaU8zTORrLbhBlf1i3LgkyNQuF6FVgQu50ij
         qTNcYAaTDkgwd074FuVBfwytgJEs0QFuJ60j66ql+n+QwiNPi/8tsOz2OSxZduikTiNO
         Fjy9a2SRxPmZmY+jArNYnC9rCpcp1X0rD0I+CXWfqDwGH7LS+luYmAjomanjjZ3S0q0v
         aU+IoXiTmYoH/e2pwcdaEKXRcZeUymUw2DUExizA7BAaHkpSwGwjJF9lAFAnLGeifb02
         /mtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tEou1N7wdVm8VL4xJuhFCb3lWMy01u8maLSGlBZXEOI=;
        b=ZfwrN6ob0GmxtbMJPMg0oAA+Mz3J7NgRwU6zNam3lQunqvOVuw1UjsMWPDc4UCihYf
         3WqJ9qRVXh+73hthQr5wHaLT9xF+Ijz5OjrIkLxvt9J2+7akBTpBb9xmKP69L26TTt0B
         TvhErNAd3u1r1NcS9a33IW5spwyvjq85nQTyy2d3jhCAXUUlyjFd7orqT6lN6/BV9a1F
         o6ldgiTpBl1s+xpqAuc2y/WWYIAGf3Op/a8kQRGsLwaj9P5+DHFiBaM/YHHnBRiUP7ks
         shFSd/goP8c4xKy0AIseaY7skspfFqtUHqi20BIlRQEszdxS5kUiyyJ5lZEacs7JClRG
         YCtA==
X-Gm-Message-State: AOAM532DyAF6m8GA9i7A8k3W0amIVRxVih8fOMCohe9clVbaLeMqMfBY
        edID6GzQZjPSPig5x/vKqKqmEVSHV0DnXe8eq1NKGQ==
X-Google-Smtp-Source: ABdhPJxIkGPw4dmBxy53c8JqTCOgnDHrW6itaCphSSBaW2KsW23KuLvcyUZ9smGlxcdVA92M9YspyulctUZPm6ZBjsg=
X-Received: by 2002:ac2:5597:: with SMTP id v23mr10584386lfg.649.1610976098909;
 Mon, 18 Jan 2021 05:21:38 -0800 (PST)
MIME-Version: 1.0
References: <1610394585-4296-1-git-send-email-jrdr.linux@gmail.com>
In-Reply-To: <1610394585-4296-1-git-send-email-jrdr.linux@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 Jan 2021 14:21:27 +0100
Message-ID: <CACRpkdaKvyrUvv6DeHB46EwZUkBjw8O00BfUZ8JZz+-ZHYE7WQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: ti :iodelay: Fixed inconsistent indenting
To:     Souptick Joarder <jrdr.linux@gmail.com>
Cc:     "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Zheng Yongjun <zhengyongjun3@huawei.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 11, 2021 at 8:49 PM Souptick Joarder <jrdr.linux@gmail.com> wrote:

> Kernel test robot throws below warning ->
>
> smatch warnings:
> drivers/pinctrl/ti/pinctrl-ti-iodelay.c:708
> ti_iodelay_pinconf_group_dbg_show() warn: inconsistent indenting
>
> Fixed the inconsistent indenting.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>

Patch applied.

Yours,
Linus Walleij
