Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAC7881642
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 12:02:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728058AbfHEKCZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 06:02:25 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:39263 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726454AbfHEKCY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 06:02:24 -0400
Received: by mail-lj1-f193.google.com with SMTP id v18so78720129ljh.6
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2019 03:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XAGJ6nmlMr4Yi+RQLlkPv1ukZ547ykzkK8qLxaxmmlo=;
        b=oTfq/502TRFvIkTpAbQuqJlDIoZNdPVDMn/Gg7hQhczZIvS9RSd2R5xicilVkuq0Z2
         eqLb7wE2zUiWftvFdOZ52mKrVrP5DD/8fzlorSFGOIhFpfbjUW90BwYRBGFL0T+xUce/
         OCqhjg8ciQtLs9NZoGDYq06OA9tzFNXnqeL5qLWzF0PIJ7w7FXcaeGkP1NgBhD7X0eyv
         EQYxgKJRu+CZ/TviaRWZ/JHf6ilW0wm9048X9RgONJGZFIJdMK3uYhtR0Ch08kpIJVhP
         Lul1VAGyJeOXCCW6oQImezlq0ps71dMb5X5RQasKrbUIFZ7pNfScN9gvWAC9aiq9SKNh
         92Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XAGJ6nmlMr4Yi+RQLlkPv1ukZ547ykzkK8qLxaxmmlo=;
        b=cxACzT1syDFXE7lwGqouj/tG9LjjZlzG1BeBgfOMc5rGHgmV02uEwJ1UF3w4u9dwDP
         nNxgkYbLsrOsKrN7CzRVX28DwPqCpFkT05fo3a6yke+ftBs3aoY2/bTOvHMUNM15RUzY
         mrTzAu19NwzcV80hASAiJ4gqTbkU7NbslUhFINqWPYM2OACteKFuiZIlCArIrfjAj87D
         7HYb7CUFdqzxIAgoBdN8KTZ0WH44S8Bq4FXn8X+SmgHWvQvmDAElFDkITXAUpT8wLVHz
         CfW4tMi3Kbv7xB+Rbd8OJ1Xm9smtpOsFaY7ac7X75NXR/3TOuKDbqxh5Hp8bpyK9WkiO
         nUeA==
X-Gm-Message-State: APjAAAWkQtMbE/eTnFQLg1XEgNjRRqVxljqFmZssJV3Y+IloYWseCIsU
        i46fu4ZHf8hxnEiMgp7mQ1/tVsc1hSQZN4R97Jh+Kg==
X-Google-Smtp-Source: APXvYqys04wM6WLDQwhUTjZ3eUyxWSnjCyTHJetuEixRDGtl+UQpwqanXwJMwG7EQng+sMDuEJBWZgcWhWCjTh5mBs8=
X-Received: by 2002:a2e:781a:: with SMTP id t26mr29489621ljc.28.1564999342891;
 Mon, 05 Aug 2019 03:02:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190723192738.68486-1-andriy.shevchenko@linux.intel.com> <20190723192738.68486-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20190723192738.68486-2-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 12:02:10 +0200
Message-ID: <CACRpkdZDeOXJzT6xXp_in0TYjYnE=wFJ8t0AO2bQ+4WMbRS=mw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] pinctrl: qdf2xxx: Switch to use device_property_count_uXX()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 23, 2019 at 9:27 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Use use device_property_count_uXX() directly, that makes code neater.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied. (Same comment.)

Yours,
Linus Walleij
