Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6A702ADB70
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 17:18:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729832AbgKJQSl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 11:18:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729359AbgKJQSl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 11:18:41 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8545BC0613CF;
        Tue, 10 Nov 2020 08:18:41 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id w6so6356341pfu.1;
        Tue, 10 Nov 2020 08:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZlAPGBbSrdcKoakzSoHTXHyKU6sf2rv6f4Yur/1Rqnc=;
        b=rBWfzbrzED3NIkWUa1wUDxwb+E2u2Zmkc0vS7WBQpjyuPdgDigVAFSl7rcjyFEIvGo
         YbQUnOInMzN8PtD9u2XcaZzWEPOlG7LzNh3FdTTdzfBbDapAN3gndJFsN4Qx5MknDkgC
         BTmWbc31IbJa06EudYnwLM2V7rJY5Jus8bxeM5ABMp85Y08xrc3BE+Rijpiv0OG94Y/6
         o4QPQsyfJldUGXZOGI1pfFYYtmaBrRAa7e0B+J4IE+OLA+iTFKPxqq6V9yI5XRqVEylm
         ZpmC+Tb01mbqXyz9aWsJ5wAa4qGqT8DPSqwTk5ACB8UpaJCSIrh8iLyiFt0wk2fha5fx
         W4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZlAPGBbSrdcKoakzSoHTXHyKU6sf2rv6f4Yur/1Rqnc=;
        b=GsiAntvqcxKF4Z2iep7rHUXnSiEnAuxQRGCRXWVP0Q1DlkSRca21QSOBb6UHRK7We/
         32nySpCKjH595sX/wpTfW0fIbYFsvwhlblh4g1W8JATqnh07Uc/JsifdKuBSyLY5mgpe
         ljqcbfRA/LG0bxoba5/bSDTAPGRMMq/4eR6jMyrRqkN5i8LE+Ay9e63z9eKSHjHHSqfP
         7JHz4J70Cjoz8KBExr+YgPFVZRdECS77cTBlk58kqGfcPKcBV72KBZIB+6eURJllB/aI
         a9G8QGbd61rVtl/B5+i72f+nwk+FxNFNcUCA9QdO4HARlUw91kVt/GVQ/TIfr9UJitwK
         EhnQ==
X-Gm-Message-State: AOAM533KmaQz4fYVrCPg0ZDRboKpIYcp1R22hSUkv16oOVzHMfq8j2nl
        NQhNrB7OSRRoEYsccK+gRN5emV7V7hgGwKA6VEKtJ7paYbk=
X-Google-Smtp-Source: ABdhPJyf+vz6mnjiuYO1Xxqfm5tIiJNlw63wgYzxrQFLR1tVdkomnNweUzgGVSzmzQ88Zgc8eMEysiFOpeLar2v2FXU=
X-Received: by 2002:a62:7c95:0:b029:18c:5002:a1ab with SMTP id
 x143-20020a627c950000b029018c5002a1abmr2517989pfc.40.1605025121022; Tue, 10
 Nov 2020 08:18:41 -0800 (PST)
MIME-Version: 1.0
References: <20201110145552.23024-1-brgl@bgdev.pl> <20201110150747.GX4077@smile.fi.intel.com>
In-Reply-To: <20201110150747.GX4077@smile.fi.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 10 Nov 2020 18:19:29 +0200
Message-ID: <CAHp75VeK07F9T2bq5R=WetFwZoorgvaSFcPg5qCXW+3JQjycnA@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] gpio: exar: refactor the driver
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        David Laight <David.Laight@aculab.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 10, 2020 at 5:07 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Tue, Nov 10, 2020 at 03:55:45PM +0100, Bartosz Golaszewski wrote:

> With reverted reg_width change

I should have relaxed this to "with whatever settlement we become
about regmap configuration".

> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>


-- 
With Best Regards,
Andy Shevchenko
