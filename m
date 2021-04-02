Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7633353048
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Apr 2021 22:27:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236592AbhDBU10 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Apr 2021 16:27:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231406AbhDBU1Z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Apr 2021 16:27:25 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61697C0613E6
        for <linux-gpio@vger.kernel.org>; Fri,  2 Apr 2021 13:27:24 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id k14-20020a9d7dce0000b02901b866632f29so5904470otn.1
        for <linux-gpio@vger.kernel.org>; Fri, 02 Apr 2021 13:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iuiOlxzkIEU1Kpq4UT7D42RgUYuz9Jg098ejC6NRNME=;
        b=Vwtgb6VY5wARBKZU/YOzPQK5S4hIoNb9Hb2i4xHUjO+xCR8faVn+Ibk7raYrhiWgII
         eCfdT+8SX0VamSLj6Bz68E8DGU5VIAIuiE/J13DUdedkQs54InMoohX5uv2AGVWSQ1x4
         d7ncvkUKHZsKsm47gcEy/pZ7/hac3xAqzv3OvcK8NdCz9wge7uquy9EzNGU0z3BfcJzu
         ZA9qsICcFtrNK+RrGMPUPVGtcgyRLk7O61UdOLJLOt1Ai/+nbOVYrfMe8gs4Rl8bJlZe
         Hc3FZnUF2zGsuy4sJHiFv73g9yeQJSbNMcxWLaa0rI3Gi+2aylNZAyp8Evi+K1r7944R
         cLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iuiOlxzkIEU1Kpq4UT7D42RgUYuz9Jg098ejC6NRNME=;
        b=sQ1pKXJ54h3nc0Vo6cCYfudM8ALofxPxsK1y2XtNOq4vk6F3Brshska5SF4970dD37
         5ZPMGtSqZaaww+YGQEbOK5sxZCsIsSKp9YPJCdRu5WqW/7N29V3nWE5nCSsxfa6IqN6D
         gC8aD5wyLDW8I/695em3rOeIRcbC9+qk94IwgPfmqTQ+tnsY+tfemsK2kVjVWupcY4iJ
         ZvEQRg5PU1Fv2qkl9/zXA6FO/gf8Vbw0M95C2xJA8+TMhfkkJqgtl101/MerOGrmTWEG
         Z7vmwnlkTqhJl+LxbvANfN1n5q+4KRekBomOvyBX4qOtKcRkixFQkm9UX5Y7LDYBlU8l
         UGtw==
X-Gm-Message-State: AOAM533sCcepCdDmT9mr4Yv0tKpjVKY6GmiKf2xJRPMrrneQz4OGoBPE
        1rHM2JORWLNk2dJ62rvgMYixnlc43HwfTcCWJXC8dQ==
X-Google-Smtp-Source: ABdhPJw+LvgPfL+cJsfQ7pXSzkYnGnrAiU58cEeQtjmBdvI9M4NbvXxqwJvXI+IExqWU+bYldZ27tiy4TFn4fqY5UJ0=
X-Received: by 2002:a9d:7854:: with SMTP id c20mr13320456otm.114.1617395243785;
 Fri, 02 Apr 2021 13:27:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210223195326.1355245-1-sandberg@mailfence.com> <20210223195326.1355245-2-sandberg@mailfence.com>
In-Reply-To: <20210223195326.1355245-2-sandberg@mailfence.com>
From:   Drew Fustini <drew@beagleboard.org>
Date:   Fri, 2 Apr 2021 13:27:12 -0700
Message-ID: <CAPgEAj5CZ1KxLEn3=GjKJTBFM8dTpC=NRGwLkN6wuw7VVv6YDw@mail.gmail.com>
Subject: Re: [PATCH] gpio: driver for the NXP 74HC153 chip
To:     Mauri Sandberg <sandberg@mailfence.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 23, 2021 at 11:56 AM Mauri Sandberg <sandberg@mailfence.com> wrote:
>
> Support for NXP 74HC153 Dual 4-input Multiplexer. This provides a GPIO
> interface supporting input mode only

I would like to try this out.   This seems like a commodity part so I
looked for it in a DIP package.  I only see that from TI in the
SN74HC153N.  Do you anticipate a different vendor being a problem?

thanks,
drew
