Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B719B1ABB5C
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 10:36:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441404AbgDPIgI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 04:36:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2501984AbgDPIfv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Apr 2020 04:35:51 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC0EFC03C1A9
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 01:27:52 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id x23so4938287lfq.1
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 01:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iJdpJd+TxN9NuhauzjOrlk1tbaF1gRxbmXiv3i1caiI=;
        b=tCqbhJwOdr5Jr7poFCQqU6qcv+19mJZ2vLNF8OGTNYcghA1qSZUqm6lngIW611uO2y
         oEtqbJ6mo1XgGcIPF9NL3oHRfvr0I56Wjy+ir5dTNJj3Jgi8XdFIjttF0dDI4tJkBVEG
         6oXIx3omCFHlzgpn9rxMmQ2PoqWL1ISQj118Pk2h7zeqQb2Lyse88zcgfyj+EWEuSayM
         LwoucD2hX/CRTn4dN16yl5yRJAvL8b0YYEUphOsuWWa4mjfzWjpN8uPY7LQBTCNraQg2
         pVlcRYWAO6bauff1V21tCKNYw7jYzxEjdRDaFfjx8vIYwpYoObIY5/kUcKsN85Wfho9z
         BK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iJdpJd+TxN9NuhauzjOrlk1tbaF1gRxbmXiv3i1caiI=;
        b=HeM6Peuil4+N+PY7aRXYBuKcrHOVIdkgn0Rr+4mSs9OEIKKnOyoFjOMdz4oK99+gIm
         fU0y/qkF2YnQRHRxwd1xutZjszZQzKBowwLTYFQNCiDm0v3HokSo7gazbakXtdbC/lcq
         Dn2yYJYw83XIo4nT2qP7PhvzxsRZ4errz3NhT9+hLZGxgqNM4gO37dvXLIV1gkK+OWQY
         NSmaEkdmQMcq/60NOgJCXCUhrVOMaGJS+/Ey/oRQEqFeh4hmM5XOubSsayhfxvdxVb4F
         ZWStNIHVWoTK3W+nGjOXHLF9QCbtgytnE0WfbfIq15viLKGWjGh258EnD3S/OVHtTv5m
         /wKQ==
X-Gm-Message-State: AGi0Pub0BhbCidhk+M2099WeDCMnHAbDBP+Ra4PMZtsC0i4L9wT82GZ4
        C42sJjNVLL0r1Vnzka9daLGyFgAWJZfCtqebV+VlsNoc
X-Google-Smtp-Source: APiQypKG4U79YvohyW8N15b6M0rR4FKUcRJF4ctl+ML+PPrQVSMHTO3loE5Sekjk6zQ30/jnlD8xmJAiLGlE5NB3hhM=
X-Received: by 2002:ac2:5c4e:: with SMTP id s14mr5452301lfp.77.1587025671229;
 Thu, 16 Apr 2020 01:27:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200414174900.5099-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200414174900.5099-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 10:27:40 +0200
Message-ID: <CACRpkdYu3uahs--iOKXwrowiwh4ch-evGZN91N9u9q_rrLFV9w@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] gpio: pch: Use BIT() and GENMASK() where it's appropriate
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 14, 2020 at 7:49 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Use BIT() and GENMASK() where it's appropriate.
> At the same time drop it where it's not appropriate.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: update one more macro (all IRQ settings are plain numbers, not bits)

I managed to extract this v2 series with b4 and applied it.

I don't know if you planned to send a pull request for the PCH
changes, it was so simple to just use b4 that I tested it on this
patch series and it just worked.

Yours,
Linus Walleij
